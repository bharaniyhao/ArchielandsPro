<?php
// error_reporting(E_ALL);
// ini_set('display_errors', 1);
include_once "model/js.php";
// include_once "../model/js.php";

$crypt = new cryptCls();
$actorid = $session->get('userid');
$systemuser = $session->get('loginuserfulname');
$actualdate = date("Y-m-d");
global $uname, $pwd, $dob,$email,$phonenumber, $lastname, $firstname,$othername, $fname,$ID, $gender,$lname, $phoneno,$symptoms, $emgno,$address, $status,$blood, $email,$currentcondition,$nationality, $inputbranch,$Marital,$occup, $inputlevel, $accstatus,$pstatus, $patientID, $firstname, $othername, $dob, $email, $phonenumber, $currentcondition, $address, $symptoms;

switch($viewpage){
	case "message":
	
     if(!empty($keys)){ 
		 $stmt = $sql->Execute($sql->Prepare("SELECT USR_USERID,USR_SURNAME,USR_OTHERNAME,USR_FIRSTNAME FROM phys_users WHERE USR_USERID = ".$sql->Param('a')." "),array($keys));
		if($stmt && !empty($stmt->RecordCount() > 0) ){
		$obj = $stmt->FetchNextObject();
		$ID = $obj->USR_USERID ;
		$othername = $obj->USR_OTHERNAME ;
        $lastname = $obj->USR_SURNAME ;
        $firstname = $obj->USR_FIRSTNAME ;


		}
	}
	break;
	case "savepatient":
		    // print_r($_POST);  
    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        if (empty($firstname) || empty($lastname) || empty($email) || empty($phonenumber)) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = 'save';
        } else {
		// $patientID = $engine->PatientID('Patients','PatientID');
		$sql->Execute(
			$sql->Prepare("INSERT INTO Patients(PatientID, FirstName, OtherName, LastName, DateOfBirth, Email, PhoneNumber, currentcondition, address, symptoms,Occupation,) VALUE(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . "," . $sql->Param('e') . "," . $sql->Param('f') . "," . $sql->Param('g') . "," . $sql->Param('h') . "," . $sql->Param('i') . "," . $sql->Param('i') . ") "),
			array($patientID, $firstname, $othername,$lastname, $dob, $email, $phonenumber, $currentcondition, $address, $symptoms,$occup));
			print $sql->ErrorMsg();	
            print_r($sql);
            var_dump($sql);
            $msg = "Patient information saved successfully. PatientID: $patientID";
            $status = "success";
            $view = "";
            $activity = 'Patient ' . $firstname . ' ' . $lastname . ' added.';
            $engine->setEventLog("022", $activity);
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
include_once "model/js.php";

//Get all users
if (empty($fdsearch)) {
    $query = "SELECT * FROM phys_users WHERE USR_STATUS = '1' ORDER BY USR_SURNAME ASC";
    $input = array();
} else {
    $query = "SELECT * FROM phys_users WHERE USR_STATUS IN ('1') AND ( USR_SURNAME LIKE " . $sql->Param('a') . " OR USR_FIRSTNAME LIKE " . $sql->Param('b')  . " ) ORDER BY USR_SURNAME ASC";
    $input = array($fdsearch . "%", $fdsearch . "%");
}


//Fetch branches 
if (!isset($limit)) {
	$limit = $session->get("limited");
} else if (empty($limit)) {
	$limit = 10;
}

$session->set("limited", $limit);
$lenght = 10;
$paging = new OS_Pagination($sql, $query, $limit, $lenght,$input, 'action=index&pg=2e5d8aa3dfa8ef34ca5131d20f9dad51&option=6831b98f85019ddb98bd98d44bdbac40');
//Get All Branches
// $stmbr = $engine->getAllBranch();
//Get All Level
// $stmbl = $engine->getAllLevel();

