<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
$crypt = new cryptCls();
$actorid = $session->get('userid');
$actualdate = date("Y-m-d");
global $inputlevel, $roomnum,$inputdate, $facilitiesstatus, $actorid, $roomdetails ;

switch($viewpage){
	case "editfacilities":
	print_r($_POST);  
     if(!empty($keys)){ 
		 $stmt = $sql->Execute($sql->Prepare("SELECT * FROM Facility WHERE FACILITY_ID = ".$sql->Param('a')." "),array($keys));
		if($stmt && !empty($stmt->RecordCount() > 0) ){
		    $Details = $stmt->FetchNextObject();
            $id = $Details->FACILITY_ID;
            $inputlevel = $Details->FACILITY_NAME;
            $roomnum = $Details->ROOM_NUM;
            $othername = $Details->INI_DATE;
            $roomdetails = $Details->ROOM_DETAILS	;
            $facilitiesstatus = $Details->FAC_AVAIL;
                    print_r($othername);
            print_r($Details);
		}
	}
	
	break;
	case "savefacility":
			    print_r($_POST);  
    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        if (empty($roomnum) || empty($facilitiesstatus) ){
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = 'savefacility';
        } else {
		$sql->Execute( $sql->Prepare("INSERT INTO Facility(FACILITY_NAME, ROOM_NUM, INI_DATE, FAC_AVAIL, USR_CODE, ROOM_DETAILS) VALUE (" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . "," . $sql->Param('e') . "," . $sql->Param('f') . ") "),
			array($inputlevel, $roomnum,$inputdate, $facilitiesstatus, $actorid, $roomdetails));
			print $sql->ErrorMsg();	
            print_r($sql);
            // var_dump($sql);
            $msg = "Facility information saved successfully. Facility: $inputlevel";
            $status = "success";
            $view = "";
            $activity = 'inputlevel ' . $roomnum . ' added.';
            $engine->setEventLog("022", $activity);
        }
    }
    break;

	case "deleteuser":
        if(!empty($keys)){
			$stmtpass = $sql->Execute($sql->Prepare("SELECT FACILITY_NAME FROM Facility WHERE FACILITY_ID = ".$sql->Param('b')." "),array($keys));
			$obj = $stmtpass->FetchNextObject();
			$inputuname = $obj->FIRST_NAME ;
			
			$sql->Execute("UPDATE Facility SET FAC_STATUS = '0' WHERE FACILITY_ID = ".$sql->Param('f')." ", array($keys));
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

	$query = "SELECT * FROM Facility WHERE FAC_STATUS IN ('1','2') ORDER BY FACILITY_NAME ASC";
	$input = array();
} else {

	$query = "SELECT * FROM Facility WHERE FAC_STATUS IN ('1','2') AND ( FACILITY_ID LIKE " . $sql->Param('a') . " OR FACILITY_NAME LIKE " . $sql->Param('b')  . " ) ORDER BY ROOM_DETAILS ASC";
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

$stmbr = $engine->getAllCategories();

