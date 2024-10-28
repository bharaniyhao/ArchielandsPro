<?php
// error_reporting(E_ALL);
// ini_set('display_errors', 1);
$crypt = new cryptCls();
$actorid = $session->get('userid');
$actualdate = date("Y-m-d");

global $uname, $pwd, $dob,$email,$phonenumber, $lastname, $firstname,$othername, $fname,$patientID, $gender,$lname, $phoneno,$symptoms, $emgno,$address, $status,$blood, $email,$currentcondition,$nationality, $inputbranch,$Marital,$occup, $inputlevel, $accstatus,$pstatus, $patientID, $firstname, $othername, $dob, $email, $phonenumber, $currentcondition, $address, $symptoms;

switch($viewpage){
	case "editpatient":
	
     if(!empty($keys)){ 
		 $stmt = $sql->Execute($sql->Prepare("SELECT * FROM Assessment WHERE assessmentID = ".$sql->Param('a')." "),array($keys));
		if($stmt && !empty($stmt->RecordCount() > 0) ){
		$obj = $stmt->FetchNextObject();
		$patientID = $obj->PatientID ;
		$firstname = $obj->FirstName ;
        $othername = $obj->OtherName ;
        $lastname = $obj->LastName ;
		$dob = $obj->DateOfBirth ;
		$email = $obj->Email ;
		$pstatus = $obj->assessmentStatus ;
		$phonenumber = $obj->PhoneNumber ;
		$currentcondition = $obj->currentcondition ;
		$address = $obj->address ;
		$occup = $obj->Occupation;
		$Marital = $obj->MaritalStatus;
		$blood = $obj->BloodGroup;
		$gender = $obj->Gender;
		$nationality = $obj->Nationality;
		}
	}

break;
		case "saveass":
		    // print_r($_POST);  
    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        if (empty($firstname) || empty($lastname) ) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = 'save';
        } else {
		// $patientID = $engine->PatientID('Patients','PatientID');
		$sql->Execute( $sql->Prepare("INSERT INTO Assessment(PatientID, FirstName, LastName, DateOfBirth, assessmentType,Occupation,MaritalStatus,BloodGroup,Gender,Nationality,assessmentStatus) VALUE(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . "," . $sql->Param('e') . "," . $sql->Param('f') . "," . $sql->Param('g') . "," . $sql->Param('h') . "," . $sql->Param('i') . "," . $sql->Param('i') . "," . $sql->Param('i') . ") "),
			array($patientID, $firstname,$lastname, $dob,'2', $occup,$Marital,$blood,$gender,$nationality,'1'));
			print $sql->ErrorMsg();	
            // print_r($sql);
            // var_dump($sql);
            $msg = "Patient assessmen information saved successfully. PatientID: $lastname";
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

//Get all users
if (empty($fdsearch)) {

	$query = "SELECT * FROM Assessment WHERE assessmentStatus IN ('1') And assessmentType IN ('2') ORDER BY PatientID ASC";
	$input = array();
} else {

	$query = "SELECT * FROM Assessment WHERE assessmentStatus IN ('1')  And assessmentType IN ('2')  AND ( therapistID LIKE " . $sql->Param('a') . " OR PatientID LIKE " . $sql->Param('b')  . " ) ORDER BY therapistID ASC";
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

$stmbr = $engine->getAllPatientID();
//Get All Level
$stmbl = $engine->getAllTherapists();
//Get All Level
$stmbid = $engine->getAllPatientName();
            // print_r($stmbid);