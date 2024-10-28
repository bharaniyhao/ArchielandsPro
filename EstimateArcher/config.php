<?php
// GLOBAL VARIABLES
//error_reporting(E_ALL);
//ini_set('display_errors', 1);
global $sql,$paging, $session, $config, $engine, $phpmailer, $pg, $pingelt, $option, $target, $msg, $status, $activepage, $viewpage, $view, $fdsearch;
$target = (string)$target;

define("SPATH_ROOT", dirname(__FILE__));
define("DS", DIRECTORY_SEPARATOR);
define('SPATH_LIBRARIES', SPATH_ROOT . DS . 'library');
define('SPATH_PLUGINS', SPATH_ROOT . DS . 'plugins');
define('SPATH_PUBLIC', SPATH_ROOT . DS . 'public');
define('SPATH_MEDIA', SPATH_ROOT . DS . 'media');
define('SHOST_IMAGES', SPATH_MEDIA . DS . 'images' . DS);
define('SHOST_REPAYMENT', SPATH_MEDIA . DS . 'repayment' . DS);
define('SHOST_LOANFORM', SPATH_MEDIA . DS . 'images' . DS . 'loanform' . DS);
define('SPATH_CONFIGURATION', SPATH_ROOT . DS . 'configuration');
define('WEB_UPLOAD', 'images/upload/');

// Media paths
define('MEDIA_PATH', SPATH_ROOT . DS . 'assets' . DS . 'media');
define('VIDEO_PATH', MEDIA_PATH . DS . 'video');
define('AUDIO_PATH', MEDIA_PATH . DS . 'audio');
define('IMAGE_PATH', MEDIA_PATH . DS . 'image');

### SMS SETTINGS ###
define('SMS_CLIENT_ID', 'yaoid');
define('SMS_CLIENT_SECRET', 'yaosecret');

// Post Keeper
if ($_REQUEST) {
    foreach ($_REQUEST as $key => $value) {
        $prohibited = array('<script>', '</script>', '<style>', '</style>');
        $value = str_ireplace($prohibited, "", $value);
        // $$key = trim($value);
        $$key = $value;
    }
}

if ($_FILES) {
    foreach ($_FILES as $keyimg => $values) {
        foreach ($values as $key => $value) {
            $$key = $value;
        }
    }
}

// SYSTEM TIMEZONE FORMAT
date_default_timezone_set('UTC');

// This defines the maximum size for each image attached
$MAX_FILE_SIZE = 3;

// Class JConfig
class JConfig {
    public $secret = '1AL009123';
    public $debug = false;
    public $autoRollback = true;
    public $ADODB_COUNTRECS = false;
    private static $_instance;
    public $smsusername = "";
    public $smspassword = "";
    public $smsurl = "api.smsgh.com";

    private function __construct() {}

    private function __clone() {}

    public static function getInstance() {
        if (!self::$_instance instanceof self) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }
}

// Assign the instance to the $config variable
$config = JConfig::getInstance();

// Now you can access the secret property
//echo $config->secret;

// Included classes
include SPATH_LIBRARIES . DS . "session.Class.php";
include SPATH_PLUGINS . DS . "adodb" . DS . "adodb.inc.php";
include SPATH_CONFIGURATION . DS . "configuration.php";
include SPATH_LIBRARIES . DS . "sql.php";
include SPATH_LIBRARIES . DS . "cryptCls.php";
include SPATH_LIBRARIES . DS . "lib.mail.php";
//include SPATH_LIBRARIES . DS . "lib.import.php";
include SPATH_LIBRARIES . DS . "pagination.Class.php";
include SPATH_LIBRARIES . DS . "formating.class.php";
include SPATH_PLUGINS . DS . 'vendor' . DS . 'autoload.php'; // PHPSpreadsheet
// require SPATH_PLUGINS . DS . 'mailvendor/autoload.php';
?>
