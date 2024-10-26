<?php

	@define('USER_LOGIN_VAR',$uname);
	@define('USER_PASSW_VAR',$pwd);
	@define('USER_CAPTCHA_VAR',$captcha);
	@define('USER_CAPTCHA_TXT',$txtcaptha);
	@define('USER_COUNT',$passager);

	
	class Login{
		private $session;
		private $redirect;
		private $hashkey;
		private $md5 = false;
		private $sha2 = false;
		private $remoteip;
		private $useragent;
		private $sessionid;
		private $result;
		private $connect;
		private $crypt;
        private $jconfig;

	
		public function __construct() {
		global $sql, $session;
        $this->redirect = "index.php?action=Login";
        $this->hashkey = $_SERVER['HTTP_HOST'];
        $this->sha2 = true;
        $this->remoteip = $_SERVER['REMOTE_ADDR'];
        $this->useragent = $_SERVER['HTTP_USER_AGENT'];
        $this->session = $session;
        $this->connect = $sql;
        $this->crypt = new cryptCls();
        $this->sessionid = $this->session->getSessionID();
        // $this->signin();
    }
		
		private function signin(){
    // Check if the database connection is established successfully
    // if (!$this->connect) {
    //     die("Database connection failed. Check credentials or server status.");
    // }
			
			$query = "SELECT USR_USERID, USR_STATUS, USR_OTHERNAME,USR_USERNAME, USR_BRCHID,USR_CODE FROM tofiepa_users WHERE USR_STATUS='1' AND USR_USERNAME=? AND USR_PASSWORD=?";
			var_dump($this->connect);
	// 		 if (!$stmt = $this->connect->prepare($query)) {
    //     die("Prepare failed: (" . $this->connect->errno . ") " . $this->connect->error);
    // }
	
	        $stmt = $this->connect->prepare($query);
			$stmt = $this->connect->Execute($stmt,array(USER_LOGIN_VAR,$passwrd));
			
			print $this->connect->ErrorMsg();
			
			
			if($this->session->get('hash_key'))
			{
			$this->confirmAuth();
			return;
			}
			
			if(!isset($_POST['doLogin'])){
				$this->logout();
				}
			
			if(USER_LOGIN_VAR=="" || USER_PASSW_VAR == ""){
				
				$this->logout("empty");			
			}			
					
			if($this->md5){
				$passwrd = md5(USER_PASSW_VAR);
			}else if($this->sha2){
				$passwrd = $this->crypt->loginPassword(USER_LOGIN_VAR,USER_PASSW_VAR);
			}else{
				$passwrd = USER_PASSW_VAR;
			}
			
			if(!$stmt){		

				if($stmt->RecordCount() > 0){  
					
				$this->session->del("logincount");		
				$arr = $stmt->FetchNextObject();
				
				$userid = $arr->USR_CODE; 
				$accstatus = $arr->USR_STATUS;
				$infullname = $arr->USR_OTHERNAME.' '.$arr->USR_SURNAME;
				$branchid = $arr->USR_BRCHID;	
				
				$this->storeAuth($userid, USER_LOGIN_VAR,$infullname);
				$this->setLog("1");
				header('Location: ' . $this->redirect);	
					//actions
					
				}else {
					$activity = "From a REMOTE IP:".$this->remoteip." USERAGENT:".$this->useragent."  with USERNAME:".USER_LOGIN_VAR." and PASSWORD:".USER_PASSW_VAR;
					$ufullname ='';
					$type ='003';
					$query = "INSERT INTO tofiepa_eventlog(EVL_EVTCODE,EVL_MOD_MEMID,EVL_MON_NAME,EVL_ACTIVITIES,EVL_IP,EVL_SESSION_ID,EVL_BROWSER) VALUES(".$this->connect->Param('a').",".$this->connect->Param('b').",".$this->connect->Param('c').",".$this->connect->Param('d').",".$this->connect->Param('e').",".$this->connect->Param('f').",".$this->connect->Param('g').")";
					$stmt = $this->connect->Execute($query,array($type,'0',$ufullname,$activity,$this->remoteip,$toinsetsession,$this->useragent));

			        print $this->connect->ErrorMsg();
					$this->logout("wrong");
					$this->direct("wrong");
					$query = "INSERT INTO tofiepa_eventlog(EVL_EVTCODE,EVL_MOD_MEMID,EVL_MON_NAME,EVL_ACTIVITIES,EVL_IP,EVL_SESSION_ID,EVL_BROWSER) VALUES(".$this->connect->Param('a').",".$this->connect->Param('b').",".$this->connect->Param('c').",".$this->connect->Param('d').",".$this->connect->Param('e').",".$this->connect->Param('f').",".$this->connect->Param('g').")";
					$stmt = $this->connect->Execute($query,array($type,'0',$ufullname,$activity,$this->remoteip,$toinsetsession,$this->useragent));
					print $this->connect->ErrorMsg();
					$this->logout("wrong");

				}
				
				
			}else{ 
			//error msg
			exit;
			}
			
		}//end
		
		public function direct($direction=''){
			header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
			header('Cache-Control: no-store, no-cache, must-validate');
			header('Cache-Control: post-check=0, pre-check=0',FALSE);
			header('Pragma: no-cache');
			
			if($direction == 'empty'){
			header('Location: ' . $this->redirect.'&attempt_in=0');	
			}else if($direction == 'wrong'){
			header('Location: ' .$this->redirect.'&attempt_in=1');	
			}else if($direction == 'subspen'){
			header('Location: ' .$this->redirect.'&attempt_in=120');	
			}else if($direction == 'alreadyin'){
			header('Location: ' .$this->redirect.'&attempt_in=140');	
			}else if($direction == 'locked'){
				header('Location: ' .$this->redirect.'&attempt_in=110');
			}else if($direction=="out"){
			header('Location: ' .$this->redirect);	
			}else if ( $direction =='captchax'){
			header('Location: ' .$this->redirect.'&attempt_in=11');
			}else{
			header('Location: ' .$this->redirect);
			}
			exit;
			
		}
		
		public function storeAuth($userid,$login,$infullname)
	{   
		$this->session->set('userid',$userid);
		$this->session->set('h1',$login);
		$this->session->set('loginuserfulname',$infullname);
		
		$this->session->set('random_seed',md5(uniqid(microtime())));

		$hashkey = md5($this->hashkey . $login .$this->remoteip.$this->sessionid.$this->useragent);
		$this->session->set('hash_key',$hashkey);
		$this->session->set("LAST_REQUEST_TIME",time());		
	}//end
	
		public function logout($msg="out")
	{


		$this->session->del('userid');
		$this->session->del('loginuserfulname');
		$this->session->del('h1');
		$this->session->del('random_seed');
		$this->session->del('hash_key');
		$this->session->del('activeelement');
		$this->session->del('post_key');

		//session_destroy();
		// $this->direct($msg);
	}//end
	
	public function confirmAuth(){
		
		$login = $this->session->get("h1");
		$hashkey = $this->session->get('hash_key');
	
		if(md5($this->hashkey . $login .$this->remoteip.$this->sessionid.$this->useragent) != $hashkey)
		{
			$this->logout();
		}
		
	}//end

	
	private function setLog($act){
		$userid=$this->session->get("userid");
		$ufullname = $this->session->get('loginuserfulname');
		$toinsetsession = $this->session->getSessionID();
		$server = $_SERVER;
		unset($server['CONTEXT_DOCUMENT_ROOT']);
		unset($server['PATH']);
		unset($server['SystemRoot']);
		unset($server['SERVER_ADMIN']);
		unset($server['DOCUMENT_ROOT']);
		unset($server['SERVER_SOFTWARE']);
		unset($server['SERVER_SIGNATURE']);
		$ser = serialize($server);
		$query = "INSERT INTO tofiepa_eventlog(EVL_EVTCODE,EVL_MOD_MEMID,EVL_MON_NAME,EVL_ACTIVITIES,EVL_IP,EVL_SESSION_ID,EVL_BROWSER,EVL_RAW) VALUES(".$this->connect->Param('a').",".$this->connect->Param('b').",".$this->connect->Param('c').",".$this->connect->Param('d').",".$this->connect->Param('e').",".$this->connect->Param('f').",".$this->connect->Param('g').",".$this->connect->Param('g').")";
		if($act == "1"){
		$type ='001';
		$activity = "From a REMOTE IP:".$this->remoteip." USERAGENT:".$this->useragent."  on SESSION ID:".$this->session->getSessionID();
		
				}else if($act == "0"){
		$userid = ($userid == "0")?"-1":$userid;
		$type ='002';
		$activity = "From a REMOTE IP:".$this->remoteip." USERAGENT:".$this->useragent."  on SESSION ID:".$this->session->getSessionID();
			}
		
        $stmt = $this->connect->Execute($query,array($type,$userid,$ufullname,$activity,$this->remoteip,$toinsetsession,$this->useragent,$ser));
          print $this->connect->ErrorMsg();
       }
  
	}
