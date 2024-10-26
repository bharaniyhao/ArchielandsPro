<?php
  error_reporting(E_ALL);
ini_set('display_errors', 1);
// error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_WARNING);
//GLOBAL VARiABLES
global $sql,$session,$config,$target,$viewpage,$msg,$status,$pg,$view,$currency,$default_photo,$default_logo,$activate,$currentusercode,$currentuserspeciality;

define("SPATH_ROOT", dirname(__FILE__));
define("DS", DIRECTORY_SEPARATOR);
define('SPATH_LIBRARIES',         SPATH_ROOT . DS . 'library');
define('SPATH_PLUGINS',        SPATH_ROOT . DS . 'plugins');
define('SPATH_PUBLIC',    SPATH_ROOT . DS . 'public');
define('SPATH_MEDIA',    SPATH_ROOT . DS . 'media');
define('SPATH_IMG',        SPATH_MEDIA . DS . 'img');
define('SHOST_IMAGES',    SPATH_MEDIA . DS . 'uploaded');
define('SPATH_ENCRYPT',         SPATH_ROOT . DS . 'encrypt');
define('SPATH_CONFIGURATION',         SPATH_ROOT . DS . 'configuration');


#######################################################
#######Payment Gateway Integration #####################

define('SLYDEPAY_API_BASE_URL','https://posapi.usebillbox.com');
define('SLYDEPAY_APP_REFERENCE',''); 
define('SLYDEPAY_SECRET',""); 
define('SLYDEPAY_APPID',"");

#######Payment Gateway Integration#####################
#######################################################


//SYSTEM TIMEZONE FORMAT
date_default_timezone_set('UTC');
//This defines the maximum size for each image attached
$MAX_FILE_SIZE = 3;

class JConfig {

//   public $secret='1AL009123';
  public $debug = false;
  public $autoRollback= true;
  public $ADODB_COUNTRECS = false;
  private static $_instance;  
  public $smsusername ="";
  public $smspassword="";
  public $smsurl="api.smsgh.com";
  
  public function __construct(){
  }
  
  private function __clone(){}
  
  public static function getInstance(){
  if(!self::$_instance instanceof self){
       self::$_instance = new self();
   }
      return self::$_instance;
  }

}

$config = JConfig::getInstance();
//Post Keeper
if ($_REQUEST) {
    foreach ($_REQUEST as $key => $value) {
        $prohibited = array('<script>', '</script>', '<style>', '</style>');
        $value = str_ireplace($prohibited, "", $value);
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

//included classes
// include SPATH_LIBRARIES.DS. "Session.class.php";
// include SPATH_PLUGINS.DS. "adodb" . DS . "adodb.inc.php";
// include SPATH_LIBRARIES.DS. "sql.php";
// include SPATH_LIBRARIES.DS. "cryptCls.php";
// include SPATH_CONFIGURATION.DS. "configuration";
// include SPATH_LIBRARIES.DS. "pagination.Class.php";

//included classes
include SPATH_LIBRARIES.DS."Session.class.php";
include SPATH_PLUGINS.DS."adodb".DS."adodb.inc.php";
include SPATH_CONFIGURATION.DS."configuration.php";
include SPATH_LIBRARIES.DS."sql.php";
include SPATH_LIBRARIES.DS."cryptCls.php";
include SPATH_LIBRARIES.DS."lib.mail.php";
include SPATH_LIBRARIES.DS."formating.class.php";
include (SPATH_PLUGINS.DS.'vendor'.DS.'autoload.php');//PHPSpreadsheet
require SPATH_PLUGINS . DS .'mailvendor/autoload.php';

$allmonths = array('','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sept','Oct','Nov','Dec');