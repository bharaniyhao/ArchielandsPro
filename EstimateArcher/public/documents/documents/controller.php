<?php
// error_reporting(E_ALL);
// ini_set('display_errors', 1);
$crypt = new cryptCls();
$actorid = $session->get('userid');
$actualdate = date("Y-m-d");

global $uname, $pwd, $dob,$email,$phonenumber, $lastname, $firstname,$othername, $fname,$patientID, $gender,$lname, $phoneno,$symptoms, $emgno,$address, $status,$blood, $email,$currentcondition,$nationality, $inputbranch,$Marital,$occup, $inputlevel, $accstatus,$pstatus, $patientID, $firstname, $othername, $dob, $email, $phonenumber, $currentcondition, $address, $symptoms;

switch($viewpage){

	case "savedoc":
    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        if (empty($patientID) || empty($documentDescription)) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = 'save';
			$msg = "Failed. Required field(s) cannot be empty: ";
if (empty($patientID)) {
    $msg .= "Patient ID";
}
if (empty($documentDescription)) {
    $msg .= ", Document Description";
}
// Add more fields as needed

$status = "error";
$target = 'save';

        } else {
            // Check if the selected Patient ID exists
            $patientCheck = $sql->Prepare("SELECT * FROM Patients WHERE PATIENTID = ?");
            $result = $sql->Execute($patientCheck, array($patientID));

            if ($result && $result->RecordCount() > 0) {
                // Proceed with saving document information
                $sql->Execute($sql->Prepare("INSERT INTO documents(PatientID, document_name, descriptions) VALUES(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c'). ")"),
                    array($patientID, $documentName, $documentDescription));
					print $sql->ErrorMsg();	
            print_r($sql);
            // var_dump($sql);

                if ($sql->ErrorNo() != 0) {
                    $msg = "Failed to save document: " . $sql->ErrorMsg();
                    $status = "error";
                    $view = 'save';
                } else {
                    $msg = "Document information saved successfully. PatientID: $patientID";
                    $status = "success";
                    $view = "";
                    $activity = 'Document added for PatientID ' . $patientID;
                    $engine->setEventLog("022", $activity);
                }
            } else {
                // Patient ID does not exist
                $msg = "Failed. Patient with ID $patientID does not exist.";
                $status = "error";
                $target = 'save';
            }
        }
    }
    break;


	case "reset":
		$fdsearch = "";
	break;
}

include 'model/js.php';

//Get all users
if (empty($fdsearch)) {

	$query = "SELECT * FROM documents WHERE approval_date = '1' ORDER BY document_name ASC";
	$input = array();
} else {

	$query = "SELECT * FROM documents WHERE approval_date = '1'  AND ( document_name LIKE " . $sql->Param('a') . " OR PatientID LIKE " . $sql->Param('b')  . " ) ORDER BY document_type ASC";
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


$stmbr = $engine->getAllPatientID();