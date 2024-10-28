<?php
$crypt = new cryptCls();
include(SPATH_LIBRARIES.DS."pagination.Class.php");
$actorid = $session->get('userid');
$actualdate = date("Y-m-d");
global $uname, $pwd, $dob,$email,$phonenumber, $lastname, $firstname,$othername, $fname,$patientID, $lname, $phoneno,$symptoms, $emgno,$address, $status, $email,$currentcondition, $inputbranch, $inputlevel, $accstatus,$pstatus, $patientID, $firstname, $othername, $dob, $email, $phonenumber, $currentcondition, $address, $symptoms;

switch($viewpage){
	case "editmember":
	
     if(!empty($keys)){ 
		 $stmt = $sql->Execute($sql->Prepare("SELECT USR_USERNAME,USR_OTHERNAME,USR_SURNAME,USR_PHONENO,USR_EMERGENCYPHONE,USR_EMAIL,USR_BRCHID,USR_LEVEL,USR_STATUS FROM Patients WHERE USR_CODE = ".$sql->Param('a')." "),array($keys));
		 if($stmt && !empty($stmt->RecordCount() > 0) ){
		 $obj = $stmt->FetchNextObject();
		 $patientID = $obj->PatientID ;
		 $firstname = $obj->FirstName ;
         $othername = $obj->OtherName ;
         $lastname = $obj->LastName ;
		 $dob = $obj->DateOfBirth ;
		 $email = $obj->Email ;
		 $pstatus = $obj->P_status ;
		 $phonenumber = $obj->PhoneNumber ;
		 $currentcondition = $obj->currentcondition ;
		 $address = $obj->address ;
		 $symptoms = $obj->symptoms ;
		 }
	 }
	break;
	case "savepatient":
		    // print_r($_POST);  
    $duplicatekeeper = $session->get("post_key");
    if ($microtime != $duplicatekeeper) {
        $session->set("post_key", $microtime);

        if (empty($firstname) || empty($lastname) || empty($email) || empty($phonenumber)) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = 'save';
        } else {
		$patientID = $engine->PatientID('Patients','PatientID');
		$sql->Execute(
			$sql->Prepare("INSERT INTO Patients(PatientID, FirstName, OtherName, LastName, DateOfBirth, Email, PhoneNumber, currentcondition, address, symptoms) VALUE(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . "," . $sql->Param('e') . "," . $sql->Param('f') . "," . $sql->Param('g') . "," . $sql->Param('h') . "," . $sql->Param('i') . "," . $sql->Param('i') . ") "),
			array($patientID, $firstname, $othername,$lastname, $dob, $email, $phonenumber, $currentcondition, $address, $symptoms));
			print $sql->ErrorMsg();	
            // print_r($sql);
            // var_dump($sql);
            print $sql->ErrorMsg();
            $msg = "Patient information saved successfully. PatientID: $patientID";
            $status = "success";
            $view = "";
            $activity = 'Patient ' . $firstname . ' ' . $lasttname . ' added.';
            $engine->setEventLog("022", $activity);
        }
    }
    break;

	case "save":
		$duplicatekeeper = $session->get("post_key");
		if($action_key != $duplicatekeeper){
		  $session->set("post_key",$action_key);
		  

		 if(empty($uname) || empty($pwd) || empty($fname) || empty($lname) || empty($phoneno) ) {
  
		 $msg = "Failed. Required field(s) cannot be empty.";
		 $status = "error";
		 $target ='addusers';
		 }else {
		  
		   if(!empty($keys)){ 
				$sql->Execute("UPDATE Patients SET USR_BRCHID = ".$sql->Param('a').",USR_SURNAME = ".$sql->Param('b').",USR_OTHERNAME = ".$sql->Param('c').",USR_LEVEL = ".$sql->Param('d').",USR_PHONENO = ".$sql->Param('e').",USR_STATUS = ".$sql->Param('e').",USR_EMAIL = ".$sql->Param('e').",USR_EMERGENCYPHONE = ".$sql->Param('e')." WHERE USR_CODE = ".$sql->Param('f')." ", array($inputbranch,$lname,$fname,$inputlevel,$phoneno,$accstatus,$email, $emgno, $keys));
				print $sql->ErrorMsg();	


				//$keys = $sql->Insert_ID();
				$sql->Execute("DELETE FROM daa_menusubusers WHERE MENUCT_USRUSERID = ".$sql->Param('a')." ",array($keys));
  
				if(isset($_POST['syscheckbox'])){
					if(is_array($_POST['syscheckbox'])){
						foreach($_POST['syscheckbox'] as $value){
				
						$sql->Execute("INSERT INTO daa_menusubusers(MENUCT_USRUSERID,MENUCT_MENUDETCODE,MENUCT_ADDEDBY) VALUES(".$sql->Param('a').",".$sql->Param('b').",".$sql->Param('c').")",array($keys,$value,$actorid));
				  
							//Populate module in a array for event log
							$menuaccess[] = $value;
							print $sql->ErrorMsg();
						}}
				}
				
						  //Build the permission table for the users
							  $sql->Execute("DELETE FROM Patientspermission WHERE MENUCT_USRUSERID = ".$sql->Param('a')." ",array($keys));
				  
							  if(isset($_POST['syspermission'])){
							  if(is_array($_POST['syspermission']) ){
								  foreach($_POST['syspermission'] as $value){
									  $sql->Execute("INSERT INTO Patientspermission(MENUCT_USRUSERID,MENUCT_MENUDETCODE,MENUCT_ADDEDBY,MENUCT_STATUS) VALUES(".$sql->Param('a').",".$sql->Param('b').",".$sql->Param('c').",".$sql->Param('d').")",array($keys,$value,$actorid,'1'));
					  
									  //Populate module in a array for event log
									  print $sql->ErrorMsg();
								  }}
								}

					$msg = "User updated successfully.";
					$status = "success";

				$stmtpass = $sql->Execute($sql->Prepare("SELECT USR_USERNAME FROM Patients WHERE USR_CODE = ".$sql->Param('b')." "),array($keys));
				$inputuname = $stmtpass->FetchNextObject()->USR_USERNAME ;
				$activity = 'User with username '.$inputuname.' updated.';
				$engine->setEventLog("004",$activity);

		  }else{
		  $suffix = date('ymd');
		 
		  $usrcode = $engine->generateUniqueID('Patients','USR_CODE','U'); 

		  //Checking username and password constrain
		  //Check if username is unique
		$uname = str_replace(' ','',$uname);
		$stmtpass = $sql->Execute($sql->Prepare("SELECT USR_USERNAME FROM Patients WHERE USR_USERNAME = ".$sql->Param('a')." "),array($uname));
		print $sql->ErrorMsg();
		if($stmtpass){
		 if($stmtpass->RecordCount() == 0){
			
			$number = preg_match('@[0-9]@', $pwd);
			$specialChars = preg_match('@[^\w]@', $pwd);
			$uppercase = preg_match('@[A-Z]@', $pwd);
  
		if(strlen($pwd) >= 6 ){
		if($uppercase && $number && $specialChars) {
			$inputpwd = $crypt->loginPassword($uname,$pwd);

		  $sql->Execute($sql->Prepare("INSERT INTO Patients(USR_BRCHID,USR_USERNAME,USR_PASSWORD,USR_SURNAME,USR_OTHERNAME,USR_LEVEL,USR_PHONENO,USR_ACTORID,USR_STATUS,USR_CODE,USR_STARTDATE,USR_EMAIL,USR_EMERGENCYPHONE) VALUE(".$sql->Param('a').",".$sql->Param('a').",".$sql->Param('b').",".$sql->Param('c').",".$sql->Param('d').",".$sql->Param('e').",".$sql->Param('f').",".$sql->Param('g').",".$sql->Param('h').",".$sql->Param('i').",".$sql->Param('j').",".$sql->Param('k').",".$sql->Param('l').") "), array($inputbranch,$uname,$inputpwd,$lname,$fname,$inputlevel,$phoneno,$actorid,$accstatus,$usrcode,$actualdate,$email, $emgno));
		  print $sql->ErrorMsg();
		  
		  //$keys = $sql->Insert_ID();
		  $sql->Execute("DELETE FROM menusubusers WHERE MENUCT_USRUSERID = ".$sql->Param('a')." ",array($usrcode));
  
		  if(isset($_POST['syscheckbox'])){
		  if(is_array($_POST['syscheckbox']) ){
			  foreach($_POST['syscheckbox'] as $value){

				  $sql->Execute("INSERT INTO menusubusers(MENUCT_USRUSERID,MENUCT_MENUDETCODE,MENUCT_ADDEDBY) VALUES(".$sql->Param('a').",".$sql->Param('b').",".$sql->Param('c').")",array($usrcode,$value,$actorid));
  
				  //Populate module in a array for event log
				  $menuaccess[] = $value;
				  print $sql->ErrorMsg();
			  }}
		  }

		  //Build the permission table for the users
			  $sql->Execute("DELETE FROM userspermission WHERE MENUCT_USRUSERID = ".$sql->Param('a')." ",array($usrcode));
  
			  if(isset($_POST['syspermission'])){
			  if(is_array($_POST['syspermission'])){
				  foreach($_POST['syspermission'] as $value){
					  $sql->Execute("INSERT INTO userspermission(MENUCT_USRUSERID,MENUCT_MENUDETCODE,MENUCT_ADDEDBY,MENUCT_STATUS) VALUES(".$sql->Param('a').",".$sql->Param('b').",".$sql->Param('c').",".$sql->Param('d').")",array($usrcode,$value,$actorid,'1'));
	  
					  //Populate module in a array for event log
					  print $sql->ErrorMsg();
				  }}
				}
	 
	  $msg = "User account created successfully.";
	  $status = "success";
  
	  $activity = 'Account with username '.$uname.' and user code '.$usrcode.' added.';
	  $engine->setEventLog("003",$activity);
			}else{
				$msg = "Failed. Password should contain upper case and special characters.";
				$status = "error";
				$target ='addusers';
			}
		  }else{
			$msg = "Failed. Password should be at 6 characters long.";
			$status = "error";
			$target ='addusers';
		  }
		}else{
			$msg = "Failed. Username already exists.";
			$status = "error";
			$target ='addusers';
		}
	    }
       }
       }
	  }
	break;

	case "resetpassword":
		if(!empty($keys)){ 
			$stmt = $sql->Execute($sql->Prepare("SELECT USR_USERNAME FROM Patients WHERE USR_CODE = ".$sql->Param('a')." "),array($keys));
			if($stmt && !empty($stmt->RecordCount() > 0) ){
			$obj = $stmt->FetchNextObject();
			$uname = $obj->USR_USERNAME ;
		
			}
		}
	break;
	case "savepassword":
		$duplicatekeeper = $session->get("post_key");
		if($action_key != $duplicatekeeper){
		  $session->set("post_key",$action_key);
		  

		 if(empty($pwd)) {
  
		 $msg = "Failed. Required field(s) cannot be empty.";
		 $status = "error";
		 $target ='resetpassword';
		 }else {
			$pwd = str_replace(' ','',$pwd);
		  
		   if(!empty($keys)){
			$number = preg_match('@[0-9]@', $pwd);
			$specialChars = preg_match('@[^\w]@', $pwd);
			$uppercase = preg_match('@[A-Z]@', $pwd);
  
		    if(strlen($pwd) >= 6 ){
		    if($uppercase && $number && $specialChars) {

				$stmtpass = $sql->Execute($sql->Prepare("SELECT USR_USERNAME FROM users WHERE USR_CODE = ".$sql->Param('b')." "),array($keys));
				$inputuname = $stmtpass->FetchNextObject()->USR_USERNAME ;
			    $inputpwd = $crypt->loginPassword($inputuname,$pwd);

				$sql->Execute("UPDATE users SET USR_PASSWORD = ".$sql->Param('a')." WHERE USR_CODE = ".$sql->Param('f')." ", array($inputpwd,$keys));
				print $sql->ErrorMsg();	

	           $msg = "User password updated successfully.";
	           $status = "success";

	           $activity = 'Password reset for user with username '.$inputuname;
	           $engine->setEventLog("005",$activity);

		  }else{
			$msg = "Failed. Password must contains uppercase and special characters.";
			$status = "error";
			$target ='resetpassword';
		  
	    }
       }else{
		$msg = "Failed. Password length cannot be less than 6 characters.";
		$status = "error";
		$target ='resetpassword';
	   }
       }
	  }
	}
	break;

	case "deleteuser":
        if(!empty($keys)){
			$stmtpass = $sql->Execute($sql->Prepare("SELECT USR_USERNAME FROM users WHERE USR_USERID = ".$sql->Param('b')." "),array($keys));
			$obj = $stmtpass->FetchNextObject();
			$inputuname = $obj->USR_USERNAME ;
			
			$sql->Execute("UPDATE Patients SET USR_STATUS = '-1' WHERE USR_USERID = ".$sql->Param('f')." ", array($keys));
			print $sql->ErrorMsg();	

			$msg = "User updated successfully.";
			$status = "success";

			$activity = 'User with username '.$inputuname.' deleted ';
			$engine->setEventLog("006",$activity);
		}
	break;
	case "reset":
		$fdsearch = "";
	break;
}

//Get all users
if (empty($fdsearch)) {

	$query = "SELECT * FROM Patients WHERE P_status IN ('1','2') ORDER BY LastName ASC";
	$input = array();
} else {

	$query = "SELECT * FROM Patients WHERE P_status IN ('1','2') AND ( FirstName LIKE " . $sql->Param('a') . " OR LastName LIKE " . $sql->Param('b')  . " ) ORDER BY FirstName ASC";
	$input = array($fdsearch . "%", $fdsearch . "%", $fdsearch . "%");
}

//Fetch branches 
if (!isset($limit)) {
	$limit = $session->get("limited");
} else if (empty($limit)) {
	$limit = 20;
}

$session->set("limited", $limit);
$lenght = 10;
$paging = new OS_Pagination($sql, $query, $limit, $lenght,$input, 'action=index&pg=2e5d8aa3dfa8ef34ca5131d20f9dad51&option=6831b98f85019ddb98bd98d44bdbac40');
//Get All Branches
// $stmbr = $engine->getAllBranch();
//Get All Level
// $stmbl = $engine->getAllLevel();

