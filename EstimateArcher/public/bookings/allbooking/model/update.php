<?php


/**
 * ****** THIS SCRIPT MOVES EXPIRED BOOKINGS TO THE BookingRecord TABLE *****
 **/

// Get the current date and time
$actualdate = date("Y-m-d H:i:s");
// echo "Current Date and Time: " . $actualdate . "<br>";

// Prepare and execute query to get all expired bookings
$query = "SELECT `BK_CODE`, `BK_LTCODE`, `BK_TITLE`, `BK_ROOM_NUM`, `BK_CHECKIN`, `BK_CHEKOUT`, 
                 `BK_CLIENT_LASTNAME`, `BK_REMARK`, `BK_GUESTNO`, `BK_CLIENT_EMAIL`, `BK_CLIENT_PHONE`, 
                 `BK_AMOUNT`, `BK_PAYMENT_STATUS`, `BK_STATUS`, `BK_USERNAME`, `BK_DURATION` 
          FROM `Booking` 
          WHERE `BK_CHEKOUT` < " . $sql->Param('a');
$params = array($actualdate);

$stmt = $sql->Execute($sql->Prepare($query), $params);

// if ($stmt === false) {
//     echo "SQL Error: " . $sql->ErrorMsg() . "<br>";
//     exit();
// }

if ($stmt->RecordCount() > 0) {
    // echo "Expired bookings found: " . $stmt->RecordCount() . "<br>";

    while ($obj = $stmt->FetchNextObject()) {
        // Extract booking details
        $code = $obj->BK_CODE;
        $bookcode = $obj->BK_LTCODE;
        $catname = $obj->BK_TITLE;
        $username = $obj->BK_USERNAME;
        $paystate = $obj->BK_PAYMENT_STATUS;
        $clientname = $obj->BK_CLIENT_LASTNAME;
        $amount = $obj->BK_AMOUNT;
        $checkin = $obj->BK_CHECKIN;
        $checkout = $obj->BK_CHEKOUT;
        $roomnum = $obj->BK_ROOM_NUM;
        $remarks = $obj->BK_REMARK;
        $duration = $obj->BK_DURATION;

        // echo "Processing booking with code: " . $code . "<br>";

        // Insert expired booking into BookingRecord table
        $insertQuery = "INSERT INTO `BookingRecord`(`CODE`, `BK_LTCODE`, `BK_TITLE`, `BK_USERNAME`, `BK_PAYMENT_STATUS`, 
                                                    `BK_CLIENT_LASTNAME`, `BR_AMOUNT`, `BK_CHEKOUT`, `BK_CHECKIN`, 
                                                    `BK_ROOM_NUM`, `BR_REMARK`, `BR_DURATION`) 
                        VALUES(" . $sql->Param('a') . ", " . $sql->Param('b') . "," . $sql->Param('c') . ", " . $sql->Param('d') . ", 
                               " . $sql->Param('e') . ", " . $sql->Param('f') . "," . $sql->Param('g') . ", " . $sql->Param('h') . ", 
                               " . $sql->Param('i') . ", " . $sql->Param('j') . "," . $sql->Param('k') . ", " . $sql->Param('l') . ")";

        $insertParams = array($code, $bookcode, $catname, $username, $paystate, $clientname, $amount, $checkout, $checkin, $roomnum, $remarks, $duration);

        $insertStmt = $sql->Execute($sql->Prepare($insertQuery), $insertParams);

        if ($insertStmt === false) {
            echo "Insert Error for booking code " . $code . ": " . $sql->ErrorMsg() . "<br>";
        } else {
            $msg =  "Booking inserted into BookingRecord for code: " . $code . "<br>";
            	$status = "success";

			$activity = 'User with username '.$code.' deleted ';
			$engine->setEventLog("014",$activity);

            // Delete the booking from the Booking table
            $deleteQuery = "DELETE FROM `Booking` WHERE `BK_CODE` = " . $sql->Param('a');
            $deleteParams = array($code);

            $deleteStmt = $sql->Execute($sql->Prepare($deleteQuery), $deleteParams);

            if ($deleteStmt === false) {
                $msg = "Delete Error for booking code " . $code . ": " . $sql->ErrorMsg() . "<br>";
            } else {
                $msg =  "Booking deleted from Booking table for code: " . $code . "<br>";
            }
        }
    }}

    
