<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
$crypt = new cryptCls();
$ufullname = $session->get('loginuserfulname');
$userid = $session->get('userid');
// $ufullname = $session->get('loginuserfulname');

$actualdate = date("Y-m-d");

global $bookcode, $inputlevel, $roomnumb,$ufullname, $amount, $guess, $checkin, $checkout, $client,$bstatus,$catdesc,$formattedRoomNum,$duration ;

switch($viewpage){
	case "bookdetails":
    if (!empty($keys)) { 
        $stmt = $sql->Execute($sql->Prepare("SELECT * FROM Booking
            WHERE BK_CODE = ".$sql->Param('a')." "),array($keys));
        print $sql->ErrorMsg();	
        
        if ($stmt && $stmt->RecordCount() > 0) {
            $assess = $stmt->FetchNextObject();
            $inputlevel = $assess->BK_TITLE ;
            $roomnumb = $assess->BK_ROOM_NUM ;
            $othername = $assess->BK_HOSTNAME ;
            $lastname = $assess->BK_ADDRESS ;
            $checkin = $assess->BK_CHECKIN ;
            $checkout = $assess->BK_CHEKOUT ;
            $client = $assess->BK_CLIENT_LASTNAME ;
            $catdesc = $assess->BK_REMARK ;
            $guess = $assess->BK_GUESTNO ;
            $address = $assess->BK_CLIENT_EMAIL ;
            $phone = $assess->BK_CLIENT_PHONE;
            $amount = $assess->BK_AMOUNT;
            $bstatus = $assess->BK_STATUS;
            $duration = $assess->BK_DURATION;
            $ufullname = $assess->BK_USERNAME;

            // printf($ufullname);
            // printf($phone);
            

        }
    }
    break;
case "savebooking":
    print_r($_POST);  
    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        if (empty($inputlevel) || empty($formattedRoomNum)) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = 'save';
        } else {
            $bookcode = $engine->BookingID('Booking','BK_LTCODE');
                // Proceed with saving assessment information
            $sql->Execute($sql->Prepare("INSERT INTO Booking(BK_LTCODE, BK_TITLE, BK_ROOM_NUM, BK_AMOUNT, BK_GUESTNO, BK_CHECKIN, BK_CHEKOUT, BK_CLIENT_LASTNAME, BK_STATUS, BK_REMARK, BK_DURATION,BK_USERNAME) VALUES(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . "," . $sql->Param('e') . "," . $sql->Param('f') . "," . $sql->Param('g') . "," . $sql->Param('h') . "," . $sql->Param('i') . "," . $sql->Param('j') . "," . $sql->Param('k') . "," . $sql->Param('N') . ")"), array($bookcode, $inputlevel, $roomnumb, $amount, $guess, $checkin, $checkout, $client, $bstatus, $catdesc, $duration,$ufullname));

					print $sql->ErrorMsg();
					print_r($sql);
            // var_dump($sql);

      $msg = "Client Booking information saved successfully. Booking code: $bookcode";
                        $status = "success";
                        $view = "";
                        $activity = 'Patient Assessments for ' . $client . ' ' . $roomnumb . ' added.';
                        $engine->setEventLog("022", $activity);
                    }
                } else {
                    $msg = "Failed to retrieve booking  details.";
                    $status = "error";
                    $target = 'save';
                } 
    
break;
		
	case "deleteuser":
        if(!empty($keys)){
			$stmtpass = $sql->Execute($sql->Prepare("SELECT BK_TITLE  FROM Booking WHERE BK_CODE = ".$sql->Param('b')." "),array($keys));
			$obj = $stmtpass->FetchNextObject();
			$inputuname = $obj->USR_USERNAME ;
			
			$sql->Execute("UPDATE Booking SET BK_STATUS = '-1' WHERE BK_CODE = ".$sql->Param('f')." ", array($keys));
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

// Get all books
if (empty($fdsearch)) {
    $query = "SELECT * FROM Booking WHERE BK_STATUS in ('1','2','3','4') AND BK_PAYMENT_STATUS = 2 ORDER BY BK_CODE ASC";
    $input = array();
} else {
    $query = "SELECT * FROM Booking WHERE BK_STATUS in ('1','2','3','4') AND BK_PAYMENT_STATUS = 2 AND (BK_LTCODE LIKE " . $sql->Param('a') . " OR BK_TITLE LIKE " . $sql->Param('b') . ") ORDER BY BK_CODE ASC";
    $input = array($fdsearch . "%", $fdsearch . "%");
}

// print_r($query);


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
