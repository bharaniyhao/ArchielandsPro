<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
// $crypt = new cryptCls();
// include(SPATH_LIBRARIES . DS . "pagination.Class.php");
$actorid = $session->get('userid');
$actualdate = date("Y-m-d");
global $uname, $ucode, $branchcode, $catdesc, $branchname,$catnum, $catpric, $catstatus, $sub, $branchcode, $bid, $catstatus;

switch ($viewpage) {
	case "editcat":
        
// print_r($_POST);  
		if (!empty($keys)) {
			$stmt = $sql->Execute($sql->Prepare("SELECT * FROM Categories WHERE CAT_CODE = " . $sql->Param('a') . " "), array($keys));
			if ($stmt && !empty($stmt->RecordCount() > 0)) {
				$obj = $stmt->FetchNextObject();
				$branchcode = $obj->APP_CATECODE;
				$branchname = $obj->CAT_NAME;
				$catdesc = $obj->CAT_DESC;
				$catnum = $obj->CAT_NUM_ROOM;
				$catpric = $obj->CAT_PRIC;
				$catstatus = $obj->CAT_STATUS;
				$bid = $obj->CAT_ID;
                // print_r($obj);
			}
		}
		break;
	case "savecat":
		$duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

			if (empty($catdesc) || empty($catpric) || empty($catstatus)) {

				$msg = "Failed. Required field(s) cannot be empty.";
				$status = "error";
				$target = 'addcat';
			} else {
				if (!empty($catdesc) || empty($catpric) || empty($catstatus)) {
				
					$ucode = $engine->generateUniqueID('Categories', 'CAT_CODE', 'CC');
					$sql->Execute($sql->Prepare("INSERT INTO Categories (CAT_CODE, APP_CATECODE, CAT_DESC,CAT_NAME,CAT_NUM_ROOM, CAT_PRIC,CAT_STATUS) VALUE(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . "," . $sql->Param('e') . "," . $sql->Param('f') . "," . $sql->Param('g') . ") "), array($ucode, $branchcode, $catdesc, $branchname,$catnum, $catpric, $catstatus));
					print $sql->ErrorMsg();
                        // print_r($sql);

					$msg = "Category added successfully.";
					$status = "success";
					$activity = 'Category with name ' . $branchname . ' added.';
					$engine->setEventLog("007", $activity);
				}
			}
		}

		break;
	case "saveeditedcat":
        
// print_r($_POST);  
		$duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);
			if (empty($catdesc) || empty($catpric) || empty($catstatus)) {

				$msg = "Failed. Required field(s) cannot be empty.";
				$status = "error";
				$target = 'editcat';
			} else {

				if (!empty($catdesc) || empty($catpric) || empty($catstatus)) {

					$sql->Execute($sql->Prepare("UPDATE Categories SET CAT_NAME = " . $sql->Param('a') . ", CAT_NUM_ROOM = " . $sql->Param('c') .", CAT_PRIC = " . $sql->Param('c') .", CAT_DESC = " . $sql->Param('c') .", CAT_STATUS = " . $sql->Param('c') . " WHERE CAT_CODE = " . $sql->Param('d') . " "), array($branchname,$catnum,$catpric,$catdesc, $catstatus, $keys));
					print $sql->ErrorMsg();
                    print_r($sql);


					$msg = "Category updated successfully.";
					$status = "success";


					$activity = 'Category with name ' . $branchname . ' edited.';
					$engine->setEventLog("008", $activity);
				}
			}
		}

		break;
	case "deletebranch":
		if (!empty($keys)) {
			$stmtpass = $sql->Execute($sql->Prepare("SELECT CAT_NAME FROM Categories WHERE CAT_ID = " . $sql->Param('e') . " "), array($keys));
			$obj = $stmtpass->FetchNextObject();
			$branchname = $obj->CAT_NAME;

			$sql->Execute("UPDATE Categories SET CAT_STATUS = '-1' WHERE CAT_ID = " . $sql->Param('e') . " ", array($keys));
			print $sql->ErrorMsg();

			$msg = "Category deleted successfully.";
			$status = "success";

			$activity = 'Category with name ' . $branchname . ' deleted ';
			$engine->setEventLog("009", $activity);
		}
		break;
	case "reset":
		$fdsearch = "";
		break;
}
//Get all users
if (empty($fdsearch)) {

	$query = "SELECT * FROM Categories WHERE CAT_STATUS = '1' ORDER BY CAT_ID ASC";
	$input = array();
} else {

	$query = "SELECT * FROM Categories WHERE CAT_STATUS = '1' AND (CAT_NAME LIKE " . $sql->Param('a') . " OR APP_CATECODE LIKE " . $sql->Param('b') . ")";
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
$paging = new OS_Pagination($sql, $query, $limit, $lenght, $input, 'action=index&pg=2e5d8aa3dfa8ef34ca5131d20f9dad51&option=c8d19e12cef6c4814e9131c4adc51ed0');
//Get All Branches
//$stmbr = $engine->getAllBranch();
//Get All Level
//$stmbl = $engine->getAllLevel();
