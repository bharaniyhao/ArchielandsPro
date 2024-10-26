<?php
/*
* This represents the excel report class
* It contains the header, property and various excel's report functions 
*/

 class excelReport
 {
	  private $sql;
	  private $objExcel;
	  private $PageMargins;
	  private $Style;
	  private $objDrawing;
	  
      function  __construct() {
            global $sql;
        $this->sql=$sql;
		$this->objExcel = new PHPExcel();
		$this->PageMargins = new PHPExcel_Worksheet_PageMargins();
		$this->Style = new PHPExcel_Style();
		
		
		
		//Stylings
		$this->Style->applyFromArray(
	array(
		  'borders' => array(
								'top'	=> array('style' => PHPExcel_Style_Border::BORDER_THIN),
								'right'		=> array('style' => PHPExcel_Style_Border::BORDER_THIN)
							)
		 ));
		 
		 //Hearder && Footer
		 //echo ;
		 //exit;
		
        }
        
        public function getNumberAccountFormat($amount){
        	if($amount !=""){
        		if($amount < 0){
        			return "(".number_format(abs($amount),2).")";
        		}else{
        			return  number_format($amount,2);
        		}
        	}
        	return 0.00;
        }//end of getNumberAccountFormat
	 
	
	  function ReportHeader($header)
	  {
		  
		   // Set properties
          $this->objExcel->getProperties()->setCreator($header[0])
							 ->setLastModifiedBy($header[0])
							 ->setTitle('Loans Report')
							 ->setSubject("Excel Report Document")
							 ->setDescription("Report Document for Office 2007 XLSX.")
							 ->setKeywords("office excel 2007 ")
							 ->setCategory("Exported Excel Reports");
		// Set header and footer. When no different headers for odd/even are used, odd header is assumed.
		 
$this->objExcel->getActiveSheet()->getHeaderFooter()->setOddHeader("&L&G&R&H Dues &amp; Loans Management System");
         $this->objExcel->getActiveSheet()->getHeaderFooter()->setOddFooter('&L&B' . $this->objExcel->getProperties()->getTitle() . '&RPage &P of &N');		
	  }  
 
	  
  }//end of class
?>