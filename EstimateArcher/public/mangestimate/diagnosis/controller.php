<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
$crypt = new cryptCls();
$actorid = $session->get('userid');
$actualdate = date("Y-m-d");

global $uname, $pwd, $dob,$email,$phonenumber, $lastname, $firstname,$othername, $fname,$patientid, $gender,$lname, $phoneno,$symptoms, $emgno,$address, $status,$blood, $email,$currentcondition,$nationality, $inputbranch,$Marital, $inputlevel, $accstatus,$pstatus,  $firstname, $othername, $dob, $email, $phonenumber, $currentcondition, $address, $objective, $diagnosis, $prognosis, $subjective, $measures;

switch($viewpage){
	case "editpatient":
    if (!empty($keys)) { 
        $stmt = $sql->Execute($sql->Prepare("SELECT * FROM Booking
            WHERE BK_CODE = ? "), array($keys));
        print $sql->ErrorMsg();	
        
        if ($stmt && $stmt->RecordCount() > 0) {
            $assess = $stmt->FetchNextObject();
            $patientid = $assess->PATIENTID ;
            $firstname = $assess->FIRSTNAME ;
            $othername = $assess->OTHERNAME ;
            $lastname = $assess->LASTNAME ;
            $dob = $assess->DATEOFBIRTH ;
            $email = $assess->EMAIL ;
            $pstatus = $assess->BK_STATUS ;
            $phonenumber = $assess->PHONENUMBER ;
            $currentcondition = $assess->CURRENTCONDITION ;
            $address = $assess->ADDRESS ;
            $occup = $assess->OCCUPATION;
            $Marital = $assess->MARITALSTATUS;
            $blood = $assess->BLOODGROUP;
            $gender = $assess->GENDER;
            $nationality = $assess->NATIONALITY;
            $bmi = $assess->BMI;
            $objective = $assess->OBJECTIVE;
            $diagnosis = $assess->DIAGNOSIS;
            $prognosis = $assess->PROGNOSIS;
            $subjective = $assess->SUBJECTIVE;
            
            // Print assessment details for debugging
            // print_r($objective);
            // print_r($assess);
        }
    }
    break;
case "saveass":
    // print_r($_POST);  
    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        if (empty($patientID) || empty($prognosis)) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = 'save';
        } else {
             // Check if the selected Patient ID exists in the patients table
            $patientCheck = $sql->Prepare("SELECT * FROM Patients WHERE PatientID = ?");
            $result = $sql->Execute($patientCheck, array($patientID));

            if ($result && $result->RecordCount() > 0) {
                // Patient ID exists, retrieve additional patient details
                $patientDetails = $sql->Prepare("SELECT FIRSTNAME, OTHERNAME, LASTNAME, PHONENUMBER FROM Patients WHERE PatientID = ?");
                $patientResult = $sql->Execute($patientDetails, array($patientID));

                if ($patientResult && $patientResult->RecordCount() > 0) {
                    $patientData = $patientResult->FetchRow();
                    $firstname = $patientData['FIRSTNAME'];
                    $othername = $patientData['OTHERNAME'];
                    $lastname = $patientData['LASTNAME'];
                    $phoneno = $patientData['PHONENUMBER'];

				 // Check if the PatientID exists in the Assessment table
                    $assessmentCheck = $sql->Prepare("SELECT * FROM Assessments WHERE PatientID = ?");
                    $assessmentResult = $sql->Execute($assessmentCheck, array($patientID));

                    if ($assessmentResult && $assessmentResult->RecordCount() > 0) {
                        // Patient assessment already exists in Assessment table
                    $sql->Execute($sql->Prepare("UPDATE Assessments SET FirstName = ".$sql->Param('a').", OtherName = ".$sql->Param('b').", LastName = ".$sql->Param('c').", Objective = ".$sql->Param('d').", Diagnosis = ".$sql->Param('e').", Prognosis = ".$sql->Param('f').", Subjective = ".$sql->Param('g').", objectiveOmeasures = ".$sql->Param('g')." WHERE PatientID = ".$sql->Param('m').""),
                            array($firstname, $othername, $lastname,  $objective, $diagnosis, $prognosis, $subjective, $measures, $patientid));
                            print $sql->ErrorMsg();
					print_r($sql);
            // var_dump($sql);

                        if ($sql->ErrorNo() != 0) {
                            $msg = "Failed to update Assessments: " . $sql->ErrorMsg();
                            $status = "error";
                            $view = 'appoint';
                            break;
                        } else {
                            $msg = "Assessments updated successfully.";
                            $status = "success";
                            $view = 'appoint';
                            break;
                        }
                    } else {

                    // Proceed with saving assessment information
                $sql->Execute($sql->Prepare("INSERT INTO Assessments(PatientID, FirstName, OtherName, LastName,Objective,Diagnosis,Prognosis,Subjective) VALUES(".$sql->Param('a').",".$sql->Param('b').",".$sql->Param('c').",".$sql->Param('d').",".$sql->Param('e').",".$sql->Param('f').",".$sql->Param('g').",".$sql->Param('h').")"),
                    array($patientID, $firstname, $othername, $lastname, $objective, $diagnosis, $prognosis, $subjective ));
					print $sql->ErrorMsg();
					// print_r($sql);
            // var_dump($sql);

      $msg = "Patient Assessments information saved successfully. PatientID: $patientID";
                        $status = "success";
                        $view = "";
                        $activity = 'Patient Assessments for ' . $firstname . ' ' . $lastname . ' added.';
                        $engine->setEventLog("022", $activity);
                    }
                } else {
                    $msg = "Failed to retrieve patient details.";
                    $status = "error";
                    $target = 'save';
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

	$query = "SELECT * FROM Booking WHERE BK_STATUS in ('2') ORDER BY BK_CODE ASC";
	$input = array();
    // print_r($query);
} else {

	$query = "SELECT * FROM Booking WHERE BK_STATUS in ('2') AND ( BK_LTCODE LIKE " . $sql->Param('a') . " OR BK_TITLE LIKE " . $sql->Param('b')  . " ) ORDER BY BK_CODE ASC";
	$input = array($fdsearch . "%", $fdsearch . "%", $fdsearch . "%");
    // print_r($query);

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