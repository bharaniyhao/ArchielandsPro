<?php
$crypt = new cryptCls();

$actorcode = $session->get("userid");
$actorname = $session->get("loginuserfulname");
 // print_r($actorname);
 //            var_dump($actorname);
 //            print_r($actorcode);
 //            var_dump($actorcode);

$startdate = date("Y-m-d");
// $upload = new importClass();
global $bookcode, $inputlevel, $level, $roomnumb, $amount, $guess, $checkin, $checkout, $client,$bstatus,$catdesc,$duration, $totalactive,$totalsch,$totalcon,$totalwith,$keys;

        // Fetch details of a specific patient using their ID
// $stmt = $sql->Execute($sql->Prepare("SELECT * FROM Patients WHERE ID = ?"), array($keys));

// Fetch the total count of active patients
// $totalpatients = $sql->Execute($sql->Prepare("SELECT COUNT(BK_CODE) AS TOTAL FROM Booking WHERE BK_PAYMENT_STATUS = '2'"));
// $obj = $totalpatients->FetchNextObject();
// $totalactive = $obj->TOTAL;

// $totalappoint = $sql->Execute($sql->Prepare("SELECT COUNT(ID) AS TOTAL FROM Appointment WHERE appointmentStatus = '1'"));
// $obj = $totalappoint->FetchNextObject();
// $totalactiveappoint = $obj->TOTAL;

// // Get the total number of patients registered in the current month
// $totalregistration = $sql->Execute($sql->Prepare("SELECT COUNT(ID) AS TOTAL 
//     FROM Patients  WHERE P_STATUS = '1' AND MONTH(CREATEDDATE) = MONTH(CURRENT_DATE())  AND YEAR(CREATEDDATE) = YEAR(CURRENT_DATE())"));

// $obj = $totalregistration->FetchNextObject();
// $totalreg = $obj->TOTAL;


switch ($viewpage) {
    case "reset":
        $fdsearch = $action_search = "";
        break;
}

// include 'model/js.php';
if (empty($fdsearch)) {

	$query = "SELECT * FROM Estimate WHERE estimater_status in ('1','2','3','4') ORDER BY estimateCode ASC";
	$input = array();
    // print_r($query);
} else {

	$query = "SELECT * FROM Estimate WHERE estimater_status in ('1','2','3','4') AND ( estimateCode LIKE " . $sql->Param('a') . " OR BK_TITLE LIKE " . $sql->Param('b')  . " ) ORDER BY estimateCode ASC";
	$input = array($fdsearch . "%", $fdsearch . "%");
    // print_r($query);

}
$limit = (!isset($limit) ? $session->get("limited") : (empty($limit) ? $limit = 20 : ""));
$session->set("limited", $limit);
$lenght = 10;
$offset = (isset($offset) && !empty($offset)) ? $offset : '0';

if (isset($action_search) && $action_search == "search") {
    if (!empty($fdsearch)) {
        $search = ["search" => $fdsearch, "status" => 1, "limit" => $limit, "offset" => ((int)$offset)];
    }
} else {
    $search = ["status" => 1, "limit" => $limit, "offset" => ((int)$offset)];
}

$session->set("limited", $limit);
$lenght = 10;
$paging = new OS_Pagination($sql, $query, $limit, $lenght,$input, 'action=index&pg=2e5d8aa3dfa8ef34ca5131d20f9dad51&option=6831b98f85019ddb98bd98d44bdbac40');
//Get All Branches

// $stmbr = $engine->getAllPatientID();
//Get All Level
$stmbl = $engine->BookingID();
//Get All Level
// $stmbid = $engine->getAllPatientName();
            // print_r($stmbid);
            
$stmbr = $engine->getAllCategories();
