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

	
		public function __construct(){
			global $sql,$session;
			$this->redirect ="index.php?action=Login";
			$this->hashkey	=$_SERVER['HTTP_HOST'];
			$this->sha2=true;
			$this->remoteip = $_SERVER['REMOTE_ADDR'];
			$this->useragent = $_SERVER['HTTP_USER_AGENT'];
			$this->session	=$session;
			$this->connect = $sql;
			$this->crypt = new cryptCls();
            $this->sessionid = $this->session->getSessionID();
			$this->signin();
			
		}

		private function ApiGetToken()
		{

		$curl = curl_init();

		$url = API_AUTH;
		curl_setopt_array($curl, array(
		CURLOPT_URL => $url ,
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => '',
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 0,
		CURLOPT_FOLLOWLOCATION => true,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => 'POST',
		CURLOPT_POSTFIELDS => array('client_id' => API_CLIENTID,
		'client_secret' => API_CLIENTSECRET,
		'grant_type' => 'password',
		'username' => API_USERNAME,
		'password' => API_PASSWORD),
		));

		
		$response = curl_exec($curl);
		curl_close($curl);
		return $response = json_decode($response, true);
		
		}

		private function ApiMenuCall($target,$method,$payload="", $search="",$inputdata="", $limit="")
		{
	
		   $resptoken = $this->ApiGetToken();
		   $token = $resptoken['access_token'];

		   $curl = curl_init();
		   $url = API_URLMENU.$target.'/' ;
		   $params = array($search => $inputdata, 'limit' => $limit );
		   $url = $url . '?' . http_build_query($params);
		   //print_r($payload) ;
	   
		   curl_setopt_array($curl, array(
			 CURLOPT_URL => $url,
			 CURLOPT_RETURNTRANSFER => true,
			 CURLOPT_ENCODING => '',
			 CURLOPT_MAXREDIRS => 10,
			 CURLOPT_TIMEOUT => 0,
			 CURLOPT_FOLLOWLOCATION => true,
			 CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			 CURLOPT_CUSTOMREQUEST => $method,
			 CURLOPT_POSTFIELDS => $payload,
			 CURLOPT_HTTPHEADER => array(
			   'Authorization: Bearer '.$token.''
			 ),
		   ));
		   
		   $response = curl_exec($curl);
		   
		   curl_close($curl);
		   return $response = json_decode($response, true);
		   //print_r($response) ;
		}

		private function getAllUserMenuSideX($userid){
           
			$targetc = "MenuSubUsers";
			$method = "GET";
			$search = "usruserid";
			$inputdata = $userid;
			$response = $this->ApiMenuCall($targetc,$method, $data="",$search,$inputdata);
			$menuresp = $response['results'] ;

			$i = 0;
			foreach($menuresp as $key => $value){
				$allmenuscode[] = $value['menudetcode'];
				$i++;
			}

			return $allmenuscode ;
		}

		private function getAllUserMenu($userid){

			$targetc = "MenuSubUsers";
			$method = "GET";
			$search = "usruserid";
			$inputdata = $userid;
			$response = $this->ApiMenuCall($targetc,$method, $data="",$search,$inputdata);
			$menuresp = $response['results'] ;

			return $menuresp ;
		}


		private function getMenuDetails(){

			$targetb = "MenuSubGroupDetails";
			$methodb = "GET";
			$search = "dashboard";
			$inputdata = 1;
			$response = $this->ApiMenuCall($targetb,$methodb, $data="",$search,$inputdata);
			$responsec = $response['results'] ;

			if($responsec){
				return $responsec ;
			}

		}

		
		private function signin(){
			
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

			$target = "AdminUsers";
            $method = "GET";
            $data = '';
			$search = "username";
			$inputdata = USER_LOGIN_VAR;
            $response = $this->ApiMenuCall($target,$method, $data="", $search,$inputdata);

            // echo "<pre>";
            //   print_r( $response);

            // echo "</pre>";
			

			if($response){
				
				if(is_array($response) && count($response) > 0 ){

					$keysd = array_keys(array_column($response['results'], "password"), $passwrd);
					if(is_array($keysd)){

						foreach($keysd as $drevalue){
							$allbuilt[] = $response['results'][$drevalue];

                            //Check if user is set active
							$keysdev = array_keys(array_column($allbuilt, "status"), '1');
							if(is_array($keysdev)){

								foreach($keysdev as $gloxvalue){
                                    $stmt = $allbuilt[$gloxvalue];
									
								}
							}else{
								$stmt = "";
							}
							
						}
		
						}else{
							$stmt = "";
						}


			    }else{
					$stmt = "";

				}
	
			}
				
				
				if(is_array($stmt) && count($stmt) > 0){  
				$this->session->del("logincount");		
				//$arr = $stmt->FetchNextObject();
				
				//$userid = $arr->USR_CODE; 
				$userid = $stmt['code']; 
				$usernum = $stmt['id']; 
				$accstatus = $stmt['status']; 
				$infullname = $stmt['othername'].' '.$stmt['surname'];

				$this->storeAuth($userid, USER_LOGIN_VAR,$infullname,$usernum);

				$this->setLog("1");
				header('Location: ' . $this->redirect);	
					//actions
					
				}else{
					$activity = "From a REMOTE IP:".$this->remoteip." USERAGENT:".$this->useragent."  with USERNAME:".USER_LOGIN_VAR." and PASSWORD:".USER_PASSW_VAR;
					$ufullname ='';
					$type ='003';
				

					$this->logout("wrong");
					//$this->direct("wrong");
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
		

		public function storeAuth($userid,$login,$infullname,$usernum)
	{   
		$this->session->set('userid',$userid);
		$this->session->set('h1',$login);
		$this->session->set('loginuserfulname',$infullname);
		$this->session->set('random_seed',md5(uniqid(microtime())));  
		$this->session->set('usernum',$usernum);

		$hashkey = md5($this->hashkey . $login .$this->remoteip.$this->sessionid.$this->useragent);
		$this->session->set('hash_key',$hashkey);
		$this->session->set("LAST_REQUEST_TIME",time());
		
		$sidemenurole = $this->getAllUserMenuSideX($usernum) ;
		$this->session->set('sidemenurole',$sidemenurole);

		$dashmenu = $this->getAllUserMenu($usernum);
		$this->session->set('dashmenu',$dashmenu);

		$dashdtemp = $this->getMenuDetails();
		$this->session->set('dashdtemp',$dashdtemp);
	}//end
	
		public function logout($msg="out")
	{


		$this->session->del('userid');
		$this->session->del('usernum');
		$this->session->del('loginuserfulname');
		$this->session->del('h1');
		$this->session->del('random_seed');
		$this->session->del('hash_key');
		$this->session->del('catmenu');
		$this->session->del('smtdetailsmenu');
		$this->session->del('sidemenurole');
		$this->session->del('dashmenu');
		$this->session->del('dashdtemp');
		session_destroy();
		

		//session_destroy();
		$this->direct($msg);
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
		
		if($act == "1"){
		$type ='001';
		$activity = "From a REMOTE IP:".$this->remoteip." USERAGENT:".$this->useragent."  on SESSION ID:".$this->session->getSessionID();
		
				}else if($act == "0"){
		$userid = ($userid == "0")?"-1":$userid;
		$type ='002';
		$activity = "From a REMOTE IP:".$this->remoteip." USERAGENT:".$this->useragent."  on SESSION ID:".$this->session->getSessionID();
			}
		
       }
  
	}
?>