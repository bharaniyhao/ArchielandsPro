  <?php
  error_reporting(E_ALL);
ini_set('display_errors', 1);

ob_start();
include "config.php";

include SPATH_LIBRARIES . DS . "login.class.php";
include SPATH_LIBRARIES . DS . "engine.Class.php";
include SPATH_LIBRARIES . DS . "menufactory.class.php";
include SPATH_LIBRARIES . DS . "smsgetway.class.php";
set_time_limit(0);

if (isset($action) && strtolower($action) == 'login') {
    // include('public/login/login.php');
include SPATH_PUBLIC.DS."login" .DS."login.php";

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
// include("public/platform.php");
include SPATH_PUBLIC.DS."platfrom.php";
    // die();


ob_flush();


