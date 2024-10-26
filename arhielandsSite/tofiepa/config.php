<?php
//GLOBAL VARiABLES

header("Content-Type: application/json; charset=utf-8");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST,GET,UPDATE,DELETE");

error_reporting( 1 );
global $sql,$session,$config,$phpmailer,$pingelt,$target,$option,$targets,$msg,$status,$viewpage,$view,$fdsearch,$ukeys;

define("SPATH_ROOT",dirname(__FILE__));
define("DS",DIRECTORY_SEPARATOR);
define( 'SPATH_LIBRARIES',	 	SPATH_ROOT.DS.'library' );
define( 'SPATH_PLUGINS',		SPATH_ROOT.DS.'plugins'   );
define( 'SPATH_PUBLIC'	   ,	SPATH_ROOT.DS.'public' );
define( 'SPATH_CONFIGURATION' , SPATH_ROOT.DS.'configuration' );
// define('API_URL', 'http://34.123.2.156:8090/ghmarket/'); 
// define('API_AUTH', 'http://34.123.2.156:8090/auth/token/');
// define('API_KEY', 'fc28390a49167c912e94a29a68cca70fde423a49');

//Post Keeper
if($_REQUEST){
	foreach($_REQUEST as $key => $value){
		$prohibited = array('<script>','</script>','<style>','</style>');
		$value = str_ireplace($prohibited,"",$value);
		//$$key = @trim($value);
		$$key = $value;
	}
}

if($_FILES){
		foreach($_FILES as $keyimg => $values){	
			foreach($values as $key => $value){
				$$key = $value;
				}
		}
	}
//SYSTEM TIMEZONE FORMAT
date_default_timezone_set('UTC');
//This defines the maximum size for each image attached
$MAX_FILE_SIZE = 3;

class JConfig {

	public $secret='yaocodesmshere';
	public $debug = true;
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
	
//included classes
include SPATH_LIBRARIES.DS."Session.class.php";
include SPATH_PLUGINS.DS."adodb".DS."adodb.inc.php";
include SPATH_LIBRARIES.DS."sql.php";
include SPATH_LIBRARIES.DS."cryptCls.php";
include SPATH_LIBRARIES.DS."formating.class.php";

include (SPATH_PLUGINS.DS.'vendor'.DS.'autoload.php');


?>