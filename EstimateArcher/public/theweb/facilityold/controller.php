<?php
// error_reporting(E_ALL);
// ini_set('display_errors', 1);
$crypt = new cryptCls();
$actorid = $session->get('userid');
$actualdate = date("Y-m-d");
global $uname, $pwd, $dob,$email,$phonenumber, $lastname, $last_name,$othername, $firstname,$therapistsID, $gender,$lname, $phone_number,$symptoms, $address,$date_of_birth, $status,$blood, $emergencycontact,$emergencynum,$nationality, $inputbranch,$Marital,$specialization, $inputlevel, $accstatus,$pstatus,$specialization, $firstname, $othername, $dob, $email, $phonenumber, $currentcondition, $address, $symptoms;

switch($viewpage){
	case "edittherapist":
	// print_r($_POST);  
     if(!empty($keys)){ 
		 $stmt = $sql->Execute($sql->Prepare("SELECT * FROM therapists WHERE therapist_id = ".$sql->Param('a')." "),array($keys));
		if($stmt && !empty($stmt->RecordCount() > 0) ){
		// $obj = $stmt->FetchNextObject();
		
            $therapistsDetails = $stmt->FetchNextObject();
            $id = $therapistsDetails->THERAPIST_ID;
            $therapists = $therapistsDetails->THERAPISTS_ID;
            $firstname = $therapistsDetails->FIRST_NAME;
            $othername = $therapistsDetails->OTHER_NAME;
            $lastname = $therapistsDetails->LAST_NAME;
            $dob = $therapistsDetails->DATE_OF_BIRTH;
            $email = $therapistsDetails->EMAIL;
            $pstatus = $therapistsDetails->T_STATUS;
            $phonenumber = $therapistsDetails->PHONE_NUMBER;
            $emergencycontact = $therapistsDetails->EMERGENCY_CONTACT_NAME;
            $address = $therapistsDetails->ADDRESS;
            $specialization = $therapistsDetails->SPECIALIZATION;
            $Marital = $therapistsDetails->MARITAL_STATUS;
            $blood = $therapistsDetails->NOTES;
            $gender = $therapistsDetails->GENDER;
            $nationality = $therapistsDetails->NATIONALITY;
            $emergencynum = $therapistsDetails->EMERGENCY_CONTACT_NUMBER;
            // $height = $therapistsDetails->WEIGHT;
		}
	}
	
	break;
	case "savetherapist":
			    // print_r($_POST);  
    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        if (empty($firstname) || empty($lastname) || empty($email) || empty($phonenumber)) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = 'save';
        } else {
		$therapistsID = $engine->therapistsID('therapists','THERAPISTS_ID');
		$sql->Execute( $sql->Prepare("INSERT INTO therapists(THERAPISTS_ID, FIRST_NAME, OTHER_NAME, LAST_NAME, DATE_OF_BIRTH, EMAIL, PHONE_NUMBER, SPECIALIZATION, ADDRESS, EMERGENCY_CONTACT_NAME,EMERGENCY_CONTACT_NUMBER,MARITAL_STATUS,GENDER,NATIONALITY) VALUES (" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . "," . $sql->Param('e') . "," . $sql->Param('f') . "," . $sql->Param('g') . "," . $sql->Param('h') . "," . $sql->Param('i') . "," . $sql->Param('i') . "," . $sql->Param('i') . "," . $sql->Param('i') . "," . $sql->Param('i') . "," . $sql->Param('i') . ") "),
			array($therapistsID, $firstname, $othername,$lastname, $dob, $email, $phonenumber, $specialization, $address, $emergencycontact,$emergencynum,$Marital,$gender,$nationality));
			print $sql->ErrorMsg();	
            // print_r($sql);
            // var_dump($sql);
            $msg = "Therapists information saved successfully. TherapistsID: $therapistsID";
            $status = "success";
            $view = "";
            $activity = 'Therapists ' . $firstname . ' ' . $lastname . ' added.';
            $engine->setEventLog("022", $activity);
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

	$query = "SELECT * FROM therapists WHERE T_STATUS IN ('1','2') ORDER BY FIRST_NAME ASC";
	$input = array();
} else {

	$query = "SELECT * FROM therapists WHERE T_STATUS IN ('1','2') AND ( FIRST_NAME LIKE " . $sql->Param('a') . " OR LAST_NAME LIKE " . $sql->Param('b')  . " ) ORDER BY FIRST_NAME ASC";
	$input = array($fdsearch . "%", $fdsearch . "%", $fdsearch . "%");
}
// Print and debug the query and its parameters
// print_r($query);
// var_dump($query);
// print_r($input);
// var_dump($input);
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

