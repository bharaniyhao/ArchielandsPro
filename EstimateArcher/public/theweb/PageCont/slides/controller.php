<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include_once ( 'model/js.php');
$crypt = new cryptCls();
$actorid = $session->get('userid');
$actualdate = date("Y-m-d");
global  $phonenumber,$id, $lastname, $firstname, $othername, $fname, $patientid, $gender, $lname, $phoneno, $symptoms, $emgno, $address, $status, $blood, $email,$subjective,$prognosis,$diagnosis, $objective, $nationality,$bmi, $inputbranch, $Marital, $occup, $inputlevel, $accstatus, $pstatus;

// Additional variables
global $height, $bmi, $weight;

switch ($viewpage) {
    case "editpatient":
    if (!empty($keys)) { 
        $stmt = $sql->Execute($sql->Prepare("SELECT p.*, app.*, a.* FROM Patients p 
            JOIN Appointment app ON p.PATIENTID = app.patientID
            JOIN Assessments a ON p.PATIENTID = a.patientID
            WHERE a.assessmentID = ? "), array($keys));
            echo"$stmt";
            // print_r($stmt);

        print $sql->ErrorMsg();
        if ($stmt && $stmt->RecordCount() > 0) {
            $patientDetails = $stmt->FetchNextObject();
            // $id = $patientDetails->ID;
            $patientid = $patientDetails->PATIENTID;
            $firstname = $patientDetails->FIRSTNAME;
            $othername = $patientDetails->OTHERNAME;
            $lastname = $patientDetails->LASTNAME;
            $dob = $patientDetails->DATEOFBIRTH;
            $email = $patientDetails->EMAIL;
            $pstatus = $patientDetails->P_STATUS;
            $phonenumber = $patientDetails->PHONENUMBER;
            $address = $patientDetails->ADDRESS;
            $Marital = $patientDetails->MARITALSTATUS;
            $blood = $patientDetails->BLOODGROUP;
            $gender = $patientDetails->GENDER;
            $nationality = $patientDetails->NATIONALITY;
            $weight = $patientDetails->HEIGHT;
            $height = $patientDetails->WEIGHT;
            $bmi = $patientDetails->BMI;
            $objective = $patientDetails->Objective;
            $diagnosis = $patientDetails->Diagnosis;
            $prognosis = $patientDetails->Prognosis;
            $subjective = $patientDetails->Subjective;
            
            print_r($patientDetails);
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
            $target = 'addpatient';
        } else {
        
            if (!empty($keys)){

            $sql->Execute($sql->Prepare("UPDATE Patients SET FIRSTNAME=" . $sql->Param('b') . ", OTHERNAME=" . $sql->Param('c') . ", LASTNAME=" . $sql->Param('d') . ", DATEOFBIRTH=" . $sql->Param('e') . ", PHONENUMBER=" . $sql->Param('f') . ", ADDRESS=" . $sql->Param('g') . ", BMI=" . $sql->Param('h') . ", MARITALSTATUS=" . $sql->Param('i') . ", BLOODGROUP=" . $sql->Param('j') . ", GENDER=" . $sql->Param('k') . ", NATIONALITY=" . $sql->Param('l') . ", HEIGHT=" . $sql->Param('m') . ", WEIGHT=" . $sql->Param('n') . " , EMAIL=" . $sql->Param('o') . " WHERE ID = " . $sql->Param('p')  ),
    array($firstname, $othername, $lastname, $dob, $phonenumber, $address, $bmi, $Marital, $blood, $gender, $nationality, $height, $weight, $email, $keys));
    
                	print $sql->ErrorMsg();

                    $msg = "Patient information updated successfully. First Name:   $firstname";					
                    $status = "success";

					$activity = 'Patient with id  ' . $patientid . 'Updated Account with name ' . $firstname . '';
					$engine->setEventLog("001", $activity);
            } else {
                // Patient does not exist, insert a new record
                $patientid = $engine->PatientID('Patients', 'PatientID', 'P');

                $sql->Execute($sql->Prepare("INSERT INTO Patients(PATIENTID, FIRSTNAME, OTHERNAME, LASTNAME, DATEOFBIRTH, EMAIL, PHONENUMBER, ADDRESS, BMI, MARITALSTATUS, BLOODGROUP, GENDER, NATIONALITY, HEIGHT, WEIGHT) VALUE(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . "," . $sql->Param('e') . "," . $sql->Param('f') . "," . $sql->Param('g') . "," . $sql->Param('h') . "," . $sql->Param('i') . "," . $sql->Param('j') . "," . $sql->Param('k') . "," . $sql->Param('l') . "," . $sql->Param('m') . "," . $sql->Param('n')  . "," . $sql->Param('O') . ") "),
                    array($patientid, $firstname, $othername, $lastname, $dob, $email, $phonenumber, $address, $bmi, $Marital, $blood, $gender, $nationality, $height, $weight));

                $msg = "New patient Records saved successfully. PatientID: $patientid";
            
            print $sql->ErrorMsg();
            // print_r($sql);
            // var_dump($sql);

            $status = "success";
            $view = "";
            $activity = 'Patient ' . $firstname . ' ' . $lastname . ' added/updated.';
            $engine->setEventLog("022", $activity);
        }
    }}
    break;


	case "deleteuser":
        if(!empty($keys)){
			$stmtpass = $sql->Execute($sql->Prepare("SELECT FIRSTNAME FROM Patients WHERE ID = ".$sql->Param('b')." "),array($keys));
			$obj = $stmtpass->FetchNextObject();
			$inputuname = $obj->FIRSTNAME ;
			
			$sql->Execute("UPDATE Patients SET P_STATUS = '0' WHERE ID = ".$sql->Param('f')." ", array($keys));
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

//Get all Patients
if (empty($fdsearch)) {

	$query = "SELECT * FROM Slides WHERE Slides_Status = '1' ORDER BY Contents ASC";
	$input = array();
} else {

	$query = "SELECT * FROM Slides WHERE Slides_Status = '1' AND ( Contents LIKE " . $sql->Param('a') . " OR Headlings LIKE " . $sql->Param('b')  . " ) ORDER BY Headlings ASC";
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

