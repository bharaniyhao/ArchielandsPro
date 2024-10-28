<?php
ob_start();
include "config.php";

use PhpOffice\PhpSpreadsheet\spreadsheet;

include SPATH_LIBRARIES . DS . "login.class.php";
include SPATH_LIBRARIES . DS . "engine.Class.php";
include SPATH_LIBRARIES . DS . "menufactory.Class.php";
// include SPATH_LIBRARIES.DS."smsgetway.class.php";
set_time_limit(0);
// Change to 'home' action

if (isset($action) && strtolower($action) == 'login') {
    include('public/login/login.php');
    die();
}



$log = new Login();

if (isset($action) && strtolower($action) == 'logout') {
    $log->logout();
}

if (isset($doLogin) && $doLogin == 'systemPingPass') {
    header('Location: index.php?action=index&pg=dashboard');
    die('Redirecting page');
}

//INSIDE THE SYSTEMS NOW
$engine = new engineClass();
$menus = new MenuClass();

// $smsgetway = new smsgetway();

// $to = "233208904948";
// $msg = "Welcome to CitizenEye";
// $smsgetway->sendSms($to, $msg);

include("public/platform.php");

ob_flush();
