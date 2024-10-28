<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

switch (strtolower($option)) {
	case md5("manageusers"):
		include("manageusers/platform.php");
		break;
	case md5("users"):
		include("users/platform.php");
		break;
	case md5("setup"):
        include("managetherapist/platform.php");
        break;
	case md5("managepatient"):
		include("managepatient/platform.php");
		break;

	case md5("summary"):
		include("summary/platform.php");
		break;

	case md5("Change Password"):
		include("changepassword/platform.php");
		break;
		
	case md5("manage_fee"):
		include("fee/platform.php");
		break;
}
