<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
$crypt = new cryptCls();
$ufullname = $session->get('loginuserfulname');
$userid = $session->get('userid');
$actualdate = date("Y-m-d");
include("model/update.php");


global $bookcode, $inputlevel,$stmbr,$formattedRoomNum, $phonenumber,$roomnumb, $amount, $guess, $checkin, $checkout, $client,$ufullname,$bstatus,$catdesc,$duration ;

switch($viewpage){
	case "bookdetails":
    if (!empty($keys)) { 
        $stmt = $sql->Execute($sql->Prepare("SELECT * FROM Booking
            WHERE BK_CODE = ".$sql->Param('a')." "),array($keys));
        print $sql->ErrorMsg();	
        
        if ($stmt && $stmt->RecordCount() > 0) {
            $assess = $stmt->FetchNextObject();
            $inputlevel = $assess->BK_TITLE ;
            $formattedRoomNum = $assess->BK_ROOM_NUM ;
            $othername = $assess->BK_HOSTNAME ;
            $lastname = $assess->BK_ADDRESS ;
            $checkin = $assess->BK_CHECKIN ;
            $checkout = $assess->BK_CHEKOUT ;
            $client = $assess->BK_CLIENT_LASTNAME ;
            $catdesc = $assess->BK_REMARK ;
            // $catdesc = $assess->BK_REMARK ;
            $guess = $assess->BK_GUESTNO ;
            $address = $assess->BK_CLIENT_EMAIL ;
            $phonenumber = $assess->BK_CLIENT_PHONE;
            $amount = $assess->BK_AMOUNT;
            $bstatus = $assess->BK_STATUS;
            $duration = $assess->BK_DURATION;
            $ufullname = $assess->BK_USERNAME;
            
            // printf($catdesc);
            // printf($phone);
        }
    }

    break;
	case "payment":
        if(!empty($keys)){
			$stmtpass = $sql->Execute($sql->Prepare("SELECT BK_ROOM_NUM  FROM Booking WHERE BK_CODE = ".$sql->Param('b')." "),array($keys));
			$obj = $stmtpass->FetchNextObject();
			$formattedRoomNum = $obj->BK_ROOM_NUM ;

			$sql->Execute("UPDATE Booking SET BK_PAYMENT_STATUS = '2' WHERE BK_CODE = ".$sql->Param('f')." ", array($keys));
			print $sql->ErrorMsg();

			$msg = "Payment for Room $formattedRoomNum was successfully.";
			$status = "success";

			$activity = 'Payment for Room Number'.$formattedRoomNum.' was successfully ';
			$engine->setEventLog("008",$activity);
		}
	break;
    case "savebooking":
    $duplicatekeeper = $session->get("post_key");

    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        if (empty($inputlevel) || empty($formattedRoomNum)) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = 'save';
        } else {
            $bookcode = $engine->BookingID('Booking', 'BK_LTCODE');

            // Proceed with saving booking information
            $sql->Execute($sql->Prepare("INSERT INTO Booking(BK_LTCODE, BK_TITLE, BK_ROOM_NUM, BK_AMOUNT, BK_GUESTNO, BK_CHECKIN, BK_CHEKOUT, BK_CLIENT_LASTNAME, BK_CLIENT_PHONE, BK_STATUS, BK_REMARK, BK_DURATION, BK_USERNAME) 
            VALUES(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . "," . $sql->Param('e') . "," . $sql->Param('f') . "," . $sql->Param('g') . "," . $sql->Param('h') . "," . $sql->Param('i') . "," . $sql->Param('j') . "," . $sql->Param('k') . "," . $sql->Param('N') . "," . $sql->Param('M') . ")"),
            array($bookcode, $inputlevel, $formattedRoomNum, $amount, $guess, $checkin, $checkout, $client, $phonenumber, $bstatus, $catdesc, $duration, $ufullname));

            if ($sql->ErrorMsg()) {
                print $sql->ErrorMsg();
            } else {
                $msg = "$client Booking information saved successfully. Booking: $bookcode";
                $status = "success";
                $view = "";
                $activity = 'Booking for ' . $client . ' in room ' . $formattedRoomNum . ' added.';
                $engine->setEventLog("007", $activity);
            }
        }
    } else {
        $msg = "Failed. Room $formattedRoomNum is already booked.";
        $status = "info";
        $target = 'save';
    }
    break;


case "update":
        
// print_r($_POST);  
	    $duplicatekeeper = $session->get("post_key");

    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        if (empty($inputlevel) || empty($formattedRoomNum)) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = 'save';
			} else {

				if (!empty($inputlevel) || empty($catpric) || empty($formattedRoomNum)) {

					$sql->Execute($sql->Prepare("UPDATE Booking SET BK_TITLE = " . $sql->Param('a') . ", BK_ROOM_NUM = " . $sql->Param('c') .", BK_AMOUNT = " . $sql->Param('c') .", BK_GUESTNO = " . $sql->Param('c') .", BK_CHECKIN = " . $sql->Param('c') . ", BK_CHEKOUT = " . $sql->Param('c') . ", BK_CLIENT_LASTNAME = " . $sql->Param('c') . ", BK_CLIENT_PHONE = " . $sql->Param('c') . ", BK_PAYMENT_STATUS = " . $sql->Param('c') . ", BK_REMARK = " . $sql->Param('c') . ", BK_DURATION = " . $sql->Param('c') . " WHERE BK_CODE = " . $sql->Param('d') . " "), array($inputlevel,$formattedRoomNum,$amount,$guess, $checkin, $checkout, $client,$phone, $bstatus, $catdesc, $duration,  $keys));
					print $sql->ErrorMsg();
//                    print_r($sql);


					$msg = "$formattedRoomNum updated successfully.";
					$status = "success";


					$activity = 'Category with name ' . $formattedRoomNum . ' edited.';
					$engine->setEventLog("009", $activity);
				}
			}
		}else {
        // room already booked
        $msg = "Failed. Room $formattedRoomNum is already booked.";
        $status = "info";
        $target = 'save';
    }

		break;
		
	case "deletebook":
        if(!empty($keys)){
			$stmtpass = $sql->Execute($sql->Prepare("SELECT BK_TITLE  FROM Booking WHERE BK_CODE = ".$sql->Param('b')." "),array($keys));
			$obj = $stmtpass->FetchNextObject();
			$inputuname = $obj->USR_USERNAME ;
			
			$sql->Execute("UPDATE Booking SET BK_STATUS = '2' WHERE BK_CODE = ".$sql->Param('f')." ", array($keys));
			print $sql->ErrorMsg();	

			$msg = "Booking updated successfully.";
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

	$query = "SELECT * FROM Booking WHERE BK_STATUS in ('1','2','3','4') ORDER BY BK_CODE ASC";
	$input = array();
    // print_r($query);
} else {

	$query = "SELECT * FROM Booking WHERE BK_STATUS in ('1','2','3','4') AND ( BK_LTCODE LIKE " . $sql->Param('a') . " OR BK_TITLE LIKE " . $sql->Param('b')  . " ) ORDER BY BK_CODE ASC";
	$input = array($fdsearch . "%", $fdsearch . "%");
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

// $stmbr = $engine->getAllPatientID();
//Get All Level
$stmbl = $engine->BookingID();
//Get All Level
$stmbid = $engine->getAllRoom();
            // print_r($stmbid);
            
$stmbr = $engine->getAllCategories();
