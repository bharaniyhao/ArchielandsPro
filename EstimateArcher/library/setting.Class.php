<?php
class settingsClass extends engineClass {
    //put your code here
    function  __construct() {
        parent::__construct();
    }

/**
 *
 * @param <type> $setting_type
 * @return <type> 
 */
   public function getSettingsValue($setting_type){
       $stmt = $this->sql->Prepare("SELECT ST_VALUE FROM sp_settings WHERE ST_TYPE =".$this->sql->Param('a'));
       $stmt = $this->sql->Execute($stmt,array($setting_type));
       if($stmt->RecordCount() > 0){
       $obj = $stmt->FetchNextObject();
       return $obj->ST_VALUE;
            }else{
           return false;
       }
   }//end of getSettingsValue

   
}
