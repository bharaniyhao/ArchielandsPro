<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Define directory separator
define('DS', DIRECTORY_SEPARATOR);

// Define root path
define('ROOT', __DIR__ . DS);

// Include the configuration file
include(ROOT . 'config.php');

// Include necessary library files
include(ROOT . 'adminpage' . DS . 'library' . DS . 'login.class.php');
include(ROOT . 'adminpage' . DS . 'library' . DS . 'engine.Class.php');
include(ROOT . 'adminpage' . DS . 'library' . DS . 'menufactory.class.php');
include(ROOT . 'adminpage' . DS . 'library' . DS . 'smsgetway.class.php');
set_time_limit(0);

// Handling login actions
if (isset($action) && strtolower($action) == 'login') {
    include(ROOT . '/' . DS . 'public' . DS . 'login' . DS . 'login.php');
    die();
}

// Create an instance of the Login class
$log = new Login();

// Handling logout actions
if (isset($action) && strtolower($action) == 'logout') {
    $log->logout();
}

// Handling system ping pass
if (isset($doLogin) && $doLogin == 'systemPingPass') {
    header('Location: index.php?action=index&pg=dashboard');
    die('Redirecting page');
}

// Initialize necessary classes
$engine = new engineClass();
$menus = new MenuClass();
include(ROOT . 'adminpage' . DS . 'public' . DS . 'platform.php');

ob_flush();
?>
