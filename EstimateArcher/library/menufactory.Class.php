<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);
class MenuClass extends engineClass{
	
	function __construct(){

		parent::__construct();
		
	   } 
		
	   /*
	    * This function loads the default menu aceess right
		*/
	   public function getMenuViewAccessRightSide($catcode){
		     $userid = $this->session->get('userid'); 
		     $stmt = $this->sql->Execute($this->sql->Prepare("SELECT * FROM menusubusers JOIN menusubgroupdetail ON MENUCT_MENUDETCODE = MENUDET_CODE WHERE MENUCT_USRUSERID = ".$this->sql->Param('a')." AND MENUCT_STATUS = '1' AND MENUDET_MENUCATCODE = ".$this->sql->Param('a')." AND MENUDET_STATUS = '1' AND MENUDET_SIDEBAR = '1'  "),array($userid,$catcode));
			print $this->sql->ErrorMsg();
			if($stmt){
				return $stmt;
				
			}else{return false ;}
		}

	   /*
	    * This function loads the default menu aceess right
		*/
		public function getMenuViewAccessDashSide($catcode){
			$userid = $this->session->get('userid');
				 $stmt = $this->sql->Execute($this->sql->Prepare("SELECT * FROM menusubusers JOIN menusubgroupdetail ON MENUCT_MENUDETCODE = MENUDET_CODE WHERE MENUCT_USRUSERID = ".$this->sql->Param('a')." AND MENUCT_STATUS = '1' AND MENUDET_MENUCATCODE = ".$this->sql->Param('a')." AND MENUDET_STATUS = '1' AND MENUDET_DASHBOARD = '1'  "),array($userid,$catcode));
				print $this->sql->ErrorMsg();
				if($stmt){
					return $stmt;
					
				}else{return false ;}
			}
		
	   /*
	    * This function loads the default menu for the inner Dashboard
		*/
		public function getInstitutionViewInnerDash($catcode){
			$userid = $this->session->get('userid');
			$stmt = $this->sql->Execute($this->sql->Prepare("SELECT * FROM menusubusers JOIN menusubgroupdetail ON MENUCT_MENUDETCODE = MENUDET_CODE WHERE MENUCT_USRUSERID = ".$this->sql->Param('a')." AND MENUCT_STATUS = '1' AND MENUDET_MENUCATCODE = ".$this->sql->Param('a')." AND MENUDET_STATUS = '1' AND MENUDET_WINDVIEW = '1'  "),array($userid,$catcode));
		   print $this->sql->ErrorMsg();
		   if($stmt){
			   return $stmt;
			   
		   }else{return false ;}
	   }

		
		/*
		 * This function gets all categories for the 
		 */
		public function getAllCategory(){
			$userid = $this->session->get('userid'); 
			
			$stmt = $this->sql->Execute($this->sql->Prepare("SELECT DISTINCT MENUCAT_NAME,MENUCAT_NAMESPACE,MENUCAT_CODE,MENUCAT_ICONS FROM  menusubgroup JOIN menusubgroupdetail ON MENUCAT_CODE = MENUDET_MENUCATCODE JOIN menusubusers ON MENUCT_MENUDETCODE = MENUDET_CODE WHERE MENUCT_USRUSERID = ".$this->sql->Param('a')." AND MENUDET_STATUS = '1'  "),array($userid));
			print $this->sql->ErrorMsg();
			if($stmt){
			return $stmt;
			}else{ return false;}
		}	
		/*
		  * This function preselect menu for user module
		  * accessibility
		  */
		public function getMenuPreselection(){
			$stmt = $this->sql->Execute($this->sql->Prepare("SELECT * FROM menusubgroup WHERE MENUCAT_MENUGPCODE = '001' AND MENUCAT_STATUS = '1' "),array());
			print $this->sql->ErrorMsg();
			if($stmt){
				return $stmt ;
			}  
		}
	/*
        * This function get the sub features for selection
        */
        public function getSubMenuPreselection($subcatcode){
        	$stmt = $this->sql->Execute($this->sql->Prepare("SELECT * FROM menusubgroupdetail WHERE MENUDET_MENUCATCODE = ".$this->sql->Param('a')." AND MENUDET_STATUS = '1' AND MENUDET_ADMIN_ACCESSRIGHT = '1' "),array($subcatcode));
        print $this->sql->ErrorMsg();

        if($stmt){
            return $stmt;
        }else{
            return false;
        }
	}
	   

	   //This function return the accessibility per user and per unit
	   public function getUserUnitAccess($userid,$unitcode){
        $stmt = $this->sql->Execute($this->sql->Prepare("SELECT * FROM menusubusers WHERE MENUCT_USRUSERID = ".$this->sql->Param('a')." AND MENUCT_MENUDETCODE = ".$this->sql->Param('b')." "),array($userid,$unitcode));
        print $this->sql->ErrorMsg();
        if($stmt){ 
            return $stmt;
        }else{return false ;}

       }



	   //This function return the accessibility per user and per unit
		public function getUserUnitPermission($userid,$unitcode){
		  $stmt = $this->sql->Execute($this->sql->Prepare("SELECT * FROM userspermission WHERE MENUCT_USRUSERID = ".$this->sql->Param('a')." AND MENUCT_MENUDETCODE = ".$this->sql->Param('b')." "),array($userid,$unitcode));
		  print $this->sql->ErrorMsg();
		  if($stmt){ 
			return $stmt;
		  }else{return false ;}
		
		}
	   

 }
?>