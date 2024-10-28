<?php
$crypt = new cryptCls();

$actorcode = $session->get("userid");
$actorname = $session->get("loginuserfulname");

$startdate = date("Y-m-d");
// $upload = new importClass();


switch ($viewpage) {

    case "edituser":
        if (isset($keys)) {
            $stmt = $sql->Execute($sql->Prepare("SELECT USR_USERNAME,USR_FIRSTNAME,USR_LASTNAME,USR_OTHERNAME,USR_SURNAME,USR_PHONENO,USR_EMERGENCYPHONE,USR_EMAIL,USR_BRCHID,USR_LEVEL,USR_STATUS FROM phys_users WHERE USR_CODE = ".$sql->Param('a')." "),array($keys));
            if (!empty($result['id'])) {
                $surname = $result['USR_USERNAME'];
                $othernames = $result['othernames'];
                $username = $result['USR_USERNAME'];
                $phoneno = $result['phoneno'];
                $email = $result['email'];
                $emergencyphone = $result['emergencyphone'];
                $position = $result['position'];
                $status = $result['status'];
                $level = $result['level'];
            }
        }

        break;


    case "reset":
        $fdsearch = $action_search = "";
        break;
}


//Get all users
if (empty($fdsearch)) {

	$query = "SELECT * FROM phys_users WHERE  USR_STATUS  IN ('1') ORDER BY USR_OTHERNAME ASC";
	$input = array();
} else {

	$query = "SELECT * FROM phys_users WHERE  USR_STATUS  IN ('1') AND ( USR_OTHERNAME LIKE " . $sql->Param('a') . " OR USR_SURNAME LIKE " . $sql->Param('b')  . " ) ORDER BY USR_OTHERNAME ASC";
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
$stmbr = $engine->getAllBranch();
//Get All Level
$stmbl = $engine->getAllLevel();

