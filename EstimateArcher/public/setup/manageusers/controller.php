<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);
$crypt = new cryptCls();
include_once ('model/tree.php');
include_once ('model/jquery.min.php');
$actorid = $session->get('userid');
$actorname = $session->get('loginuserfulname');

// echo $actorid.'hggjhjhjh';

$actualdate = date("Y-m-d");
global $uname, $pwd , $action_key, $surname,$dob,$email,$phonenumber, $lastname, $firstname,$othername, $fname,$patientID, $gender,$lname, $phoneno,$symptoms, $emgno,$address, $emgno,$email, $inputbranch, $accstatus, $sub,$uname,$inputpwd,$lastname,$firstname,$inputlevel,$phoneno,$actorid,$accstatus,$usrcode,$actualdate,$email, $emgno;

switch($viewpage){
	case "editmember":
	
    if(!empty($keys)){ 
	$stmt = $sql->Execute($sql->Prepare("SELECT USR_USERNAME,USR_FIRSTNAME,USR_LASTNAME,USR_OTHERNAME,USR_SURNAME,USR_PHONENO,USR_EMERGENCYPHONE,USR_EMAIL,USR_BRCHID,USR_LEVEL,USR_STATUS FROM phys_users WHERE USR_CODE = ".$sql->Param('a')." "),array($keys));
	print $sql->ErrorMsg();	
		 // print_r($stmt);
         //    print_r($sql);
         //    var_dump($sql);
	if($stmt && !empty($stmt->RecordCount() > 0) ){
	$userDetails = $stmt->FetchNextObject();
	$uname = $userDetails->USR_USERNAME ;
	$othername = $userDetails->USR_OTHERNAME ;
    $firstname = $userDetails->USR_FIRSTNAME ;
         // $surname = $userDetails->USR_SURNAME ;
    $lastname = $userDetails->USR_SURNAME ;
    $phoneno = $userDetails->USR_PHONENO ;
	$emgno = $userDetails->USR_EMERGENCYPHONE ;
	$email = $userDetails->USR_EMAIL ;
	$inputbranch = $userDetails->USR_BRCHID ;
	$inputlevel = $userDetails->USR_LEVEL ;
	$accstatus = $userDetails->USR_STATUS ;
		 // print_r($userDetails);

	}
	}
	
	break;
	case "save":
                print_r($_POST);

    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        if (empty($uname) || empty($firstname) || empty($lastname) || empty($phoneno)) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = '';
        } else {
            if (!empty($keys)) {
                $sql->Execute(
                    "UPDATE phys_users SET USR_BRCHID = " . $sql->Param('a') . ",
                     USR_SURNAME = " . $sql->Param('b') . ",
                     USR_OTHERNAME = " . $sql->Param('c') . ",
                     USR_LEVEL = " . $sql->Param('d') . ",
                     USR_PHONENO = " . $sql->Param('e') . ",
                     USR_STATUS = " . $sql->Param('f') . ",
                     USR_EMAIL = " . $sql->Param('g') . ",
                     USR_EMERGENCYPHONE = " . $sql->Param('h') . " 
                     WHERE USR_CODE = " . $sql->Param('i') . " ",
                array($inputbranch,$lastname,$firstname,$inputlevel,$phoneno,$accstatus,$email, $emgno, $keys));
                print $sql->ErrorMsg();

                $sql->Execute("DELETE FROM menusubusers WHERE MENUCT_USRUSERID = " . $sql->Param('a') . " ", array($keys));

                if (isset($_POST['syscheckbox']) && is_array($_POST['syscheckbox'])) {
                    foreach ($_POST['syscheckbox'] as $value) {
                        $sql->Execute("INSERT INTO menusubusers(MENUCT_USRUSERID, MENUCT_MENUDETCODE, MENUCT_ADDEDBY) VALUES(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . ")", array($keys, $value, $actorid));
                        // Populate module in an array for event log
                        $menuaccess[] = $value;
                        print $sql->ErrorMsg();
                    }
                }

                // Build the permission table for the users
                $sql->Execute("DELETE FROM userspermission WHERE MENUCT_USRUSERID = " . $sql->Param('a') . " ", array($keys));

                if (isset($_POST['syspermission']) && is_array($_POST['syspermission'])) {
                    foreach ($_POST['syspermission'] as $value) {
                        $sql->Execute("INSERT INTO userspermission(MENUCT_USRUSERID, MENUCT_MENUDETCODE, MENUCT_ADDEDBY, MENUCT_STATUS) VALUES(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . ")", array($keys, $value, $actorid, '1'));
                        // Populate module in an array for event log
                        print $sql->ErrorMsg();
                    }
                }

                $msg = "User updated successfully.";
                $status = "success";

                $stmtpass = $sql->Execute($sql->Prepare("SELECT USR_USERNAME FROM phys_users WHERE USR_CODE = " . $sql->Param('b') . " "), array($keys));
                $inputuname = $stmtpass->FetchNextObject()->USR_USERNAME;
                $activity = 'User with username '.$inputuname.' updated by user with id '.$actorid;
                $engine->setEventLog("010",$activity);
            } else {
                $suffix = date('ymd');

                $usrcode = $engine->generateUniqueID('phys_users', 'USR_CODE', 'U');

                $uname = str_replace(' ', '', $uname);
                $stmtpass = $sql->Execute($sql->Prepare("SELECT USR_USERNAME FROM phys_users WHERE USR_USERNAME = " . $sql->Param('a') . " "), array($uname));
                print $sql->ErrorMsg();
                if ($stmtpass && $stmtpass->RecordCount() == 0) {
                    $number = preg_match('@[0-9]@', $pwd);
                    $specialChars = preg_match('@[^\w]@', $pwd);
                    $uppercase = preg_match('@[A-Z]@', $pwd);

                    if (strlen($pwd) >= 6 && $uppercase && $number && $specialChars) {
                        // Encrypt the password
                        $inputpwd = $crypt->loginPassword($uname, $pwd);

                        // Prepare the SQL statement to insert into phys_users table
                        $phys_users_query = "
                            INSERT INTO phys_users(USR_BRCHID, USR_USERNAME, USR_PASSWORD, USR_SURNAME, USR_OTHERNAME, USR_LEVEL, USR_PHONENO, USR_ACTORID, USR_STATUS, USR_CODE, USR_STARTDATE, USR_EMAIL, USR_EMERGENCYPHONE)
                            VALUES(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . "," . $sql->Param('e') . "," . $sql->Param('f') . "," . $sql->Param('g') . "," . $sql->Param('h') . "," . $sql->Param('i') . "," . $sql->Param('j') . "," . $sql->Param('k') . "," . $sql->Param('l') . "," . $sql->Param('m') . ")
                        ";

                        // Execute the SQL statement to insert into phys_users table
                        $sql->Execute($sql->Prepare($phys_users_query), array($inputbranch, $uname, $inputpwd, $lastname, $firstname, $inputlevel, $phoneno, $actorid, $accstatus, $usrcode, $actualdate, $email, $emgno));

//                     if ($inputlevel == 2) {
//     // Insert into therapists table
//     $therapistsID = $engine->therapistsID('therapists', 'THERAPISTS_ID');
//     $therapists_query = "
//         INSERT INTO therapists(THERAPISTS_ID,USR_CODE,FIRST_NAME, OTHER_NAME, PHONE_NUMBER, T_STATUS, EMAIL, EMERGENCY_CONTACT_NUMBER)
//         VALUES(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . "," . $sql->Param('e') . "," . $sql->Param('f') . "," . $sql->Param('g') . "," . $sql->Param('h') . ")
//     ";
//     // Execute the SQL statement to insert into therapists table
//     $sql->Execute($sql->Prepare($therapists_query), array($therapistsID,$usrcode, $firstname, $lastname, $phoneno, $accstatus, $email, $emgno));
//     // Print any error message
//     print $sql->ErrorMsg();
    
// } elseif ($inputlevel == 3) {
//     // Insert into frontDeskUsers table
//     $fdid = $engine->frontDeskID('frontDeskUsers', 'USER_CODCODE');
//     $fdid_query = "
//         INSERT INTO frontDeskUsers(USER_CODCODE,USR_CODE,FIRST_NAME, OTHER_NAME, PHONE_NUMBER, T_STATUS, EMAIL, EMERGENCY_CONTACT_NUMBER)
//         VALUES(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . "," . $sql->Param('e') . "," . $sql->Param('f') . "," . $sql->Param('g') ."," . $sql->Param('h') . ")
//     ";
//     // Execute the SQL statement to insert into frontDeskUsers table
//     $sql->Execute($sql->Prepare($fdid_query), array($fdid, $usrcode,$firstname, $lastname, $phoneno, $accstatus, $email, $emgno));
    // Print any error message
    // print $sql->ErrorMsg();
// }


                        // Build the permission table for the users
                        $sql->Execute("DELETE FROM menusubusers WHERE MENUCT_USRUSERID = " . $sql->Param('a') . " ", array($usrcode));

                        if (isset($_POST['syscheckbox']) && is_array($_POST['syscheckbox'])) {
                            foreach ($_POST['syscheckbox'] as $value) {
                                $sql->Execute("INSERT INTO menusubusers(MENUCT_USRUSERID,MENUCT_MENUDETCODE,MENUCT_ADDEDBY) VALUES(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . ")", array($usrcode, $value, $actorid));
                                // Populate module in an array for event log
                                $menuaccess[] = $value;
                                print $sql->ErrorMsg();
                            }
                        }

                        // Build the permission table for the users
                        $sql->Execute("DELETE FROM userspermission WHERE MENUCT_USRUSERID = " . $sql->Param('a') . " ", array($usrcode));

                        if (isset($_POST['syspermission']) && is_array($_POST['syspermission'])) {
                            foreach ($_POST['syspermission'] as $value) {
                                $sql->Execute("INSERT INTO userspermission(MENUCT_USRUSERID,MENUCT_MENUDETCODE,MENUCT_ADDEDBY,MENUCT_STATUS) VALUES(" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . ")", array($usrcode, $value, $actorid, '1'));
                                // Populate module in an array for event log
                                print $sql->ErrorMsg();
                            }
                        }

                        $msg = "User account created successfully.";
                        $status = "success";

                        $activity = 'Account with username '.$uname.' and user code '.$usrcode.' added by user with id  '.$actorid;
	                    $engine->setEventLog("011",$activity);                    } else {
                        $msg = "Failed. Password should contain uppercase letters, numbers, and special characters.";
                        $status = "error";
                        $target = 'users';
                    }
                } else {
                    $msg = "Failed. Username already exists.";
                    $status = "error";
                    $target = 'users';
                }
            }
        }
    }
    break;

	case "resetpassword":
		if(!empty($keys)){ 
			$stmt = $sql->Execute($sql->Prepare("SELECT USR_USERNAME FROM phys_users WHERE USR_CODE = ".$sql->Param('a')." "),array($keys));
			if($stmt && !empty($stmt->RecordCount() > 0) ){
			$obj = $stmt->FetchNextObject();
			$uname = $obj->USR_USERNAME ;
		
			}
		}
	break;
	case "savepassword":
		$duplicatekeeper = $session->get("post_key");
		if($random_token != $duplicatekeeper){
		$session->set("post_key",$random_token);
		if(empty($pwd)) {

		 $msg = "Failed. Required field(s) cannot be empty.";
		 $status = "error";
		 $target ='resetpassword';
		 }else {
			$pwd = str_replace(' ','',$pwd);
		  
		   if(!empty($keys)){
			$number = preg_match('@[0-9]@', $pwd);
			$specialChars = preg_match('@[^\w]@', $pwd);
			$uppercase = preg_match('@[A-Z]@', $pwd);
  
		    if(strlen($pwd) >= 6 ){
		    if($uppercase && $number && $specialChars) {

				$stmtpass = $sql->Execute($sql->Prepare("SELECT USR_USERNAME FROM phys_users WHERE USR_CODE = ".$sql->Param('b')." "),array($keys));
				$inputuname = $stmtpass->FetchNextObject()->USR_USERNAME ;
			    $inputpwd = $crypt->loginPassword($inputuname,$pwd);

				$sql->Execute("UPDATE phys_users SET USR_PASSWORD = ".$sql->Param('a')." WHERE USR_CODE = ".$sql->Param('f')." ", array($inputpwd,$keys));
				print $sql->ErrorMsg();	

	           $msg = "User password updated successfully.";
	           $status = "success";

	           $activity = 'Password reset for user with username '.$inputuname;
			$engine->setEventLog("012",$activity);
		  }else{
			$msg = "Failed. Password must contains uppercase and special characters.";
			$status = "error";
			$target ='resetpassword';
		  
	    }
       }else{
		$msg = "Failed. Password length cannot be less than 6 characters.";
		$status = "error";
		$target ='resetpassword';
	   }
       }
	  }
	}
	break;
	case "deleteuser":
        if(!empty($keys)){
			$stmtpass = $sql->Execute($sql->Prepare("SELECT USR_USERNAME FROM phys_users WHERE USR_USERID = ".$sql->Param('b')." "),array($keys));
			$obj = $stmtpass->FetchNextObject();
			$inputuname = $obj->USR_USERNAME ;
			
			$sql->Execute("UPDATE phys_users SET USR_STATUS = '-1' WHERE USR_USERID = ".$sql->Param('f')." ", array($keys));
			print $sql->ErrorMsg();	

			$msg = "User updated successfully.";
			$status = "success";

			$activity = 'User with username '.$inputuname.' deleted ';
			$engine->setEventLog("013",$activity);
		}
	break;
	case "reset":
		$fdsearch = "";
	break;
}


//Get all users
if (empty($fdsearch)) {

	$query = "SELECT * FROM phys_users WHERE  USR_STATUS  IN ('1') ORDER BY USR_OTHERNAME ASC";
	$input = array();
} else {

	$query = "SELECT * FROM phys_users WHERE  USR_STATUS  IN ('1') AND ( USR_OTHERNAME LIKE " . $sql->Param('a') . " OR USR_SURNAME LIKE " . $sql->Param('b')  . " ) ORDER BY USR_OTHERNAME ASC";
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
$stmbr = $engine->getAllBranch();
//Get All Level
$stmbl = $engine->getAllLevel();

