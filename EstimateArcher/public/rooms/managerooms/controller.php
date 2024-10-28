<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);
// include_once "model/js.php";
// $crypt = new cryptCls();
$actorid = $session->get("userid");
$systemuser = $session->get('loginuserfulname');
$actualdate = date("Y-m-d");
global $CatName, $roomNum, $formattedRoomNum,$RCode, $CatID,$descr,$catId, $date, $addby, $Code, $roomstatus;


switch ($viewpage) {
    case "details":
        if (!empty($keys)) {
            $stmt = $sql->Execute($sql->Prepare("SELECT * FROM Rooms WHERE RoomID = ". $sql->Param('a') . " "), array($keys));
            
            // Check if there are records returned
            if ($stmt && !empty($stmt->RecordCount() > 0)) {
                // Fetch appointment details
                $details = $stmt->FetchNextObject();
                // $id = $details->ID;
                $CatName = $details->CATEGORYNAME;
                // $firstname = $details->ROOMNUMBER;
                $descr = $details->DESCRIPTIONS;
                $addby = $details->ADDEDBY;
                $setupdate = $details->CREATDATA;
                $formattedRoomNum = $details->ROOMNUMBER;
                
                // print_r($details);
            }
        }
        break;
            case "update":
    // print_r($_POST);  

    $duplicatekeeper = $session->get("post_key");

    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        if (empty($CatName) || empty($formattedRoomNum) || empty($descr)) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = '';
        } else {
            $sql->Execute(
                $sql->Prepare("UPDATE Rooms SET CategoryName = " . $sql->Param('a') . ", RoomNumber = " . $sql->Param('b') . ", Descriptions = " . $sql->Param('c') . ", CreatData = " . $sql->Param('d') . ", Addedby = " . $sql->Param('e') . " WHERE RoomStatus = " . $sql->Param('f')),
                array($CatName, $formattedRoomNum, $descr, $setupdate, $systemuser,$keys));
                print_r($sql);


            if ($sql->ErrorMsg()) {
                print $sql->ErrorMsg();
            } else {
                $msg = "$formattedRoomNum updated successfully.";
                $status = "success";
                $activity = 'Room ' . $formattedRoomNum . ' edited.';
                $engine->setEventLog("009", $activity);
            }
        }
    } else {
        // Room already booked
        $msg = "Failed. Room $formattedRoomNum is already booked.";
        $status = "info";
        $target = 'details';
    }

    break;

        	

case "saverooset":
    // print_r($_POST);

    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        // Check for required fields
        if (empty($descr) || empty($formattedRoomNum) || empty($roomstatus)) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = '';
        } else {
            // Fetch the selected category details
            $stmt = $sql->Execute($sql->Prepare("SELECT CAT_NAME, CAT_CODE FROM Categories WHERE CAT_ID = ?"), array($CatID));
            
            if ($stmt && !$stmt->EOF) {
                $CatName = $stmt->fields['CAT_NAME'];
                $Code = $stmt->fields['CAT_CODE'];

                // Insert the new room record
                $insertQuery = $sql->Prepare("INSERT INTO Rooms (CategoryName, RoomNumber, Descriptions, CreatData, Addedby, RCode, RoomStatus) VALUES (" .
                    $sql->Param("a") ."," . $sql->Param("b") ."," . $sql->Param("c") ."," . $sql->Param("d") ."," . $sql->Param("e") ."," . $sql->Param("f") ."," . $sql->Param("g") .")");
                
                $sql->Execute($insertQuery, array($CatName, $formattedRoomNum, $descr, $setupdate, $systemuser, $Code, $roomstatus));
                
                // Check for SQL errors
                if ($sql->ErrorNo() != 0) {
                    $msg = "Failed to insert room record: " . $sql->ErrorMsg();
                    $status = "error";
                    $view = "";
                } else {
                    $msg = "Room record inserted successfully.";
                    $status = "success";
                    $view = "";
                }
            } else {
                $msg = "Failed to fetch category details for CAT_ID: " . $CatID;
                $status = "error";
                $target = '';
            }
        }
    }
    break;


    case "deleteuser":
        if (!empty($keys)) {
            $stmtpass = $sql->Execute(
                $sql->Prepare(
                    "SELECT USR_USERNAME FROM users WHERE USR_USERID = " .
                        $sql->Param("b") .
                        " "
                ),
                [$keys]
            );
            $obj = $stmtpass->FetchNextObject();
            $inputuname = $obj->USR_USERNAME;

            $sql->Execute(
                "UPDATE Patients SET USR_STATUS = '-1' WHERE USR_USERID = " .
                    $sql->Param("f") .
                    " ",
                [$keys]
            );
            print $sql->ErrorMsg();

            $msg = "User updated successfully.";
            $status = "success";

            $activity = "User with username " . $inputuname . " deleted ";
            $engine->setEventLog("006", $activity);
        }
        break;

    case "reset":
        $fdsearch = "";
        break;
}

//Get all users
if (empty($fdsearch)) {
    $query = "SELECT * FROM Rooms WHERE RoomStatus = '1' ORDER BY RoomID ASC";
    $input = [];
} else {
    $query =
        "SELECT * FROM Rooms WHERE RoomStatus = '1' AND ( Descriptions LIKE " .
        $sql->Param("a") .
        " OR CategoryName LIKE " .
        $sql->Param("b") .
        " ) ORDER BY RoomID ASC";
    $input = [$fdsearch . "%", $fdsearch . "%"];
}

//Fetch branches
if (!isset($limit)) {
    $limit = $session->get("limited");
} elseif (empty($limit)) {
    $limit = 20;
}

$session->set("limited", $limit);
$lenght = 10;
$paging = new OS_Pagination(
    $sql,
    $query,
    $limit,
    $lenght,
    $input,
    "action=index&pg=2e5d8aa3dfa8ef34ca5131d20f9dad51&option=6831b98f85019ddb98bd98d44bdbac40"
);
//Get All Branches
$Catname = $engine->getAllCategories();
//Get All Level
// $stmbl = $engine->getAllTherapists();
// $nstmbl = $engine->getAllTherapists();
// $nonex = $engine->getAllTherapists();
//Get All Level
// $Code = $engine->getCategoryCode($RCode);/
// $stmbr = $engine->getAllRooms();
// print_r($stmbr);


// $engine = new YourEngineClass();?
$Dec = $engine->getCategoryDes();

