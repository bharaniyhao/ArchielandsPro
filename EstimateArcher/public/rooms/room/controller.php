<?php
// error_reporting(E_ALL);
// ini_set('display_errors', 1);
// include_once "model/js.php";
$crypt = new cryptCls();
$actorid = $session->get('userid');
$systemuser = $session->get('loginuserfulname');

$actualdate = date("Y-m-d");
global $physiotherapist, $dob,$id,$email,$phonenumber, $lastname, $firstname,$othername, $fname,$patientID, $gender,$therapist, $phoneno,$symptoms, $emgno,$address, $status,$blood, $email,$currentcondition,$nationality,$duration, $inputbranch,$Marital,$ntherapist, $occup,$therapistsId, $inputlevel, $accstatus,$pstatus, $patientID, $firstname, $othername, $dob, $email, $phonenumber, $currentcondition, $address,$patientName, $symptoms;

switch($viewpage) {

    case "details":
    if (!empty($keys)) { 
        // $stmt = $sql->Execute($sql->Prepare("SELECT * FROM Appointment WHERE ID = ?"), array($keys));
        $stmt = $sql->Execute($sql->Prepare("SELECT * FROM Rooms
            WHERE RoomID = ".$sql->Param('a')." "),array($keys));
    print $sql->ErrorMsg();	
    
            // print_r($stmt);
        // Check if the query executed successfully
        
            // Check if there are records returned
            if ($stmt->RecordCount() > 0) {
                // Fetch appointment details
                $details = $stmt->FetchNextObject();
                // $id = $details->ID;
                $Catname = $details->CATEGORYNAME;
                $firstname = $details->ROOMNUMBER;
                $othername = $details->DESCRIPTIONS;
                // $lastname = $details->IMAG;
                $systemuser = $details->ADDEDBY;
                $duration = $details->DURATION;
                $therapistsId = $details->ROOMSTATUS;
                // Print appointment details for debugging
                // print_r($details);
            }}            
    break;

    case "saveappoint":
    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);
        
        $selected_val = $_POST['patientStatus']; 
        
        if ($selected_val == 'non-existing') {
            // Generate new PatientID
            $patientID = $engine->PatientID('Patients', 'PatientID');

            if (!empty($nfirstname) && !empty($nlastname)) {
                // Insert new patient
                $sql->Execute($sql->Prepare("INSERT INTO Patients(PATIENTID, FIRSTNAME, OTHERNAME, LASTNAME, EMAIL, PHONENUMBER) VALUES(".$sql->Param('a').",".$sql->Param('b').",".$sql->Param('c').",".$sql->Param('d').",".$sql->Param('e').",".$sql->Param('f').")"),
                    array($patientID, $nfirstname, $nothername, $nlastname, $nEmail, $nNumber));
            //         print $sql->ErrorMsg();	
            // print_r($sql);
                if ($sql->ErrorNo() != 0) {
                    $msg = "Failed to insert patient record: " . $sql->ErrorMsg();
                    $status = "error";
                    $view = 'appoint';
                    break;
                }
            } else {
                $msg = "Failed. Required field(s) cannot be empty.";
                $status = "error";
                $view = 'appoint';
                break;
            }
        } else {
            // Check if existing patient
            $result = $sql->Execute($sql->Prepare("SELECT * FROM Patients WHERE PatientID = ?"), array($patientID));

            if ($result && $result->RecordCount() > 0) {
                // Existing patient found
                $patientDetails = $sql->Execute($sql->Prepare("SELECT FIRSTNAME, OTHERNAME, LASTNAME, EMAIL, PHONENUMBER FROM Patients WHERE PatientID = ?"), array($patientID));

                if ($patientDetails && $patientDetails->RecordCount() > 0) {
                    $patientData = $patientDetails->FetchRow();
                    $firstname = $patientData['FIRSTNAME'];
                    $othername = $patientData['OTHERNAME'];
                    $lastname = $patientData['LASTNAME'];
                    $Email = $patientData['EMAIL'];
                    $phoneno = $patientData['PHONENUMBER'];

                    // Check if patient exists in appointment table
                    $appointmentResult = $sql->Execute($sql->Prepare("SELECT * FROM Appointment WHERE PatientID = ?"), array($patientID));
                    if ($appointmentResult && $appointmentResult->RecordCount() > 0) {
                        // Patient exists in appointment table
                        $sql->Execute($sql->Prepare("UPDATE Appointment SET firstname = ".$sql->Param('a').", othername = ".$sql->Param('b').", lastname = ".$sql->Param('c').", email = ".$sql->Param('d').", phonenumber = ".$sql->Param('e').", therapistsid = ".$sql->Param('f').", appointmentType = ".$sql->Param('g').", appointmentDate = ".$sql->Param('h').", duration = ".$sql->Param('i').", appointmentReason = ".$sql->Param('j')." WHERE PatientID = ".$sql->Param('m').""),
                            array($firstname, $othername, $lastname, $Email, $phoneno, $therapistsId, $appointmentType, $appointmentDate, $duration, $message, $patientID));
                            print $sql->ErrorMsg();
					// print_r($sql);
            // var_dump($sql);

                        if ($sql->ErrorNo() != 0) {
                            $msg = "Failed to update appointment: " . $sql->ErrorMsg();
                            $status = "error";
                            $view = 'appoint';
                            break;
                        } else {
                            $msg = "Appointment updated successfully.";
                            $status = "success";
                            $view = 'appoint';
                            break;
                        }
                    } else {
                        // Insert appointment
                        $sql->Execute($sql->Prepare("INSERT INTO Appointment(PatientID, firstname, othername, lastname, email, phonenumber, therapistsid, appointmentType, appointmentDate, appointmentTime, appointmentReason) VALUES(".$sql->Param('a').",".$sql->Param('b').",".$sql->Param('c').",".$sql->Param('d').",".$sql->Param('e').",".$sql->Param('f').",".$sql->Param('f').",".$sql->Param('f').",".$sql->Param('f').",".$sql->Param('f').",".$sql->Param('f').")"),
                            array($patientID, $firstname, $othername, $lastname, $Email, $phoneno, $therapist, $appointmentType, $appointmentDate, $duration, $message));

                        if ($sql->ErrorNo() != 0) {
                            $msg = "Failed to book appointment: " . $sql->ErrorMsg();
                            $status = "error";
                            $view = 'appoint';
                            break;
                        } else {
                            $msg = "Appointment booked successfully.";
                            $status = "success";
                            $view = '';
                            break;
                        }
                    }
                } else {
                    // Failed to retrieve patient details
                    $msg = "Failed to retrieve patient details.";
                    $status = "error";
                    $view = 'appoint';
                    break;
                }
            } 
            else {
                // Existing patient not found
                $msg = "Failed. Patient with ID $patientID does not exist.";
                $status = "error";
                $view = 'appoint';
                break;
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

	$query = "SELECT * FROM Rooms WHERE RoomStatus = '1' ORDER BY RoomID ASC";
	$input = array();
} else {

	$query = "SELECT * FROM Rooms WHERE RoomStatus = '1' AND ( Descriptions LIKE " . $sql->Param('a') . " OR CategoryName LIKE " . $sql->Param('b')  . " ) ORDER BY RoomID ASC";
	$input = array($fdsearch . "%", $fdsearch . "%");
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
// $stmbr = $engine->getAllPatientID();
//Get All Level
// $stmbl = $engine->getAllTherapists();
// $nstmbl = $engine->getAllTherapists();
// $nonex = $engine->getAllTherapists();
//Get All Level
// $stmbid = $engine->getAllPatientName();
            // print_r($stmbr);


