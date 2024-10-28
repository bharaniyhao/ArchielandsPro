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

        }


	  function ReportHeader($header)
	  {

		   // Set properties
          $this->objExcel->getProperties()->setCreator($header[0])
							 ->setLastModifiedBy($header[0])
							 ->setTitle($header[0])
							 ->setSubject("Excel Report Document")
							 ->setDescription("Report Document for Office 2007 XLSX.")
							 ->setKeywords("office excel 2007 ")
							 ->setCategory("Exported Excel Reports");
		// Set header and footer. When no different headers for odd/even are used, odd header is assumed.

         $this->objExcel->getActiveSheet()->getHeaderFooter()->setOddHeader("&L&G&R&H".$header[0]."\n".$header[1]."\n".$header[2]."\n".$header[3]."\n".$header[4]."\n\n".$header[5]."\n".$header[6]."\n".$header[7]." ");
         $this->objExcel->getActiveSheet()->getHeaderFooter()->setOddFooter('&L&B' . $this->objExcel->getProperties()->getTitle() . '&RPage &P of &N');
	  }

	  // Summary Statement Report
	  // AllTransactions Data Report
	  function SummarySheet($emplcont)
	  {

	  	// Define the limit of the grid
	  	$limitcadre = count($emplcont) + 11;
	  	$this->objExcel->getActiveSheet()->setSharedStyle($this->Style, "A10:K".$limitcadre);


	  	//Formating Table header

	  	$styleArray = array(
	  			'font' => array(
	  					'bold' => true,
	  			),
	  			'alignment' => array(
	  					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
	  			),
	  	);
		$styleArray2 = array(
	  			'alignment' => array(
	  					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
	  			),
	  	);

	    $this->objExcel->getActiveSheet()->mergeCells('A1:K2');
		$this->objExcel->getActiveSheet()->getStyle('A1:K2')->getFont()->setSize(15);
        $this->objExcel->getActiveSheet()->getStyle('A1:K2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$this->objExcel->getActiveSheet()->SetCellValue('A1', 'ACTIVE LOAN REPORT');

		$this->objExcel->getActiveSheet()->getStyle('A4:B8')->applyFromArray($styleArray2);
		$this->objExcel->getActiveSheet()->mergeCells('A4:B4');
		$this->objExcel->getActiveSheet()->getCell('A4')->setValue("@ ". date('M d, Y'));

	    $this->objExcel->getActiveSheet()->getStyle('A10:K10')->applyFromArray($styleArray);
	  	//setting column width
	  	$this->objExcel->getActiveSheet()->getColumnDimension('A')->setWidth(12);
	  	$this->objExcel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
	  	$this->objExcel->getActiveSheet()->getColumnDimension('C')->setWidth(16);
		$this->objExcel->getActiveSheet()->getColumnDimension('D')->setWidth(16);
		$this->objExcel->getActiveSheet()->getColumnDimension('E')->setWidth(16);
		$this->objExcel->getActiveSheet()->getColumnDimension('F')->setWidth(16);
		$this->objExcel->getActiveSheet()->getColumnDimension('G')->setWidth(16);
		$this->objExcel->getActiveSheet()->getColumnDimension('H')->setWidth(16);
		$this->objExcel->getActiveSheet()->getColumnDimension('I')->setWidth(16);
		$this->objExcel->getActiveSheet()->getColumnDimension('J')->setWidth(16);
		$this->objExcel->getActiveSheet()->getColumnDimension('K')->setWidth(16);

	  	$this->objExcel->setActiveSheetIndex(0);
		$this->objExcel ->getActiveSheet()->SetCellValue('A10', 'Year');
	  	$this->objExcel->getActiveSheet()->SetCellValue('B10', 'Month');
	  	$this->objExcel->getActiveSheet()->SetCellValue('C10', 'Number Of Loans');
	  	$this->objExcel ->getActiveSheet()->SetCellValue('D10', 'Pincipal Amount');
		$this->objExcel ->getActiveSheet()->SetCellValue('E10', 'Total Repayment');
		$this->objExcel ->getActiveSheet()->SetCellValue('F10', 'Principal Repaid');
		$this->objExcel ->getActiveSheet()->SetCellValue('G10', 'Principal Outstanding');
		$this->objExcel ->getActiveSheet()->SetCellValue('H10', 'Interest');
		$this->objExcel ->getActiveSheet()->SetCellValue('I10', 'Interest Repaid');
		$this->objExcel ->getActiveSheet()->SetCellValue('J10', 'Interest Outstanding');
		$this->objExcel ->getActiveSheet()->SetCellValue('K10', 'Balance');

	  	$i = 11;
	  	$n = 1;
		$totalpay = $totalprinc = $overallrep = $overallpaid = 0;
	  	if(is_array($emplcont) && count($emplcont) > 0){
	  		foreach($emplcont as $value){
				  $totalbalrow = $value[9] + $value[6];
	  			$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("0",$i,$value[0]);
	  			$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("1",$i,$value[1]);
	  			$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("2",$i,$value[2]);
	  			$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("3",$i,number_format($value[3],2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("4",$i,number_format($value[4],2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("5",$i,number_format($value[5],2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("6",$i,number_format($value[6],2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("7",$i,number_format($value[7],2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("8",$i,number_format($value[8],2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("9",$i,number_format($value[9],2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("10",$i,number_format($totalbalrow,2));
				

				$totalpay = $value[2] + $totalpay;
				$totalprinc = $value[3] + $totalprinc;
				$overallrep = $value[4]+ $overallrep;
				$overallpaid = $value[5] + $overallpaid + $totalpaid2;
				$totalprincipaloutstanding = $totalprincipaloutstanding + $value[6];
				$totalinterest = $totalinterest + $value[7];
				$totalinterestrepaid = $totalinterestrepaid + $value[8];
				$totalinterestoutstanding = $totalinterestoutstanding + $value[9];

		if( $startmonth == 12){
			$startmonth = 1;
			$startyear = $startyear + 1;
		}else{
		$startmonth = $startmonth + 1;
		}
				$i++;
			  }
			  
			  $totaloutstbalance = $totalprincipaloutstanding + $totalinterestoutstanding;
			
			$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("0",$i,'Total');
			    $this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("2",$i,number_format($totalpay,2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("3",$i,number_format($totalprinc,2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("4",$i,number_format($overallrep,2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("5",$i,number_format($overallpaid,2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("6",$i,number_format($totalprincipaloutstanding,2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("7",$i,number_format($totalinterest,2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("8",$i,number_format($totalinterestrepaid,2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("9",$i,number_format($totalinterestoutstanding,2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("10",$i,number_format($totaloutstbalance,2));
				
			$this->objExcel->getActiveSheet()->getStyle('E10:E'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
			$this->objExcel->getActiveSheet()->getStyle('G10:G'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
			$this->objExcel->getActiveSheet()->getStyle('H10:H'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
			$this->objExcel->getActiveSheet()->getStyle('I10:I'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
			$this->objExcel->getActiveSheet()->getStyle('I10:I'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
			$this->objExcel->getActiveSheet()->getStyle('A10:A'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
	  	}
		$this->objExcel->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_PORTRAIT);
	  	$this->objExcel->getActiveSheet()->getPageSetup()->setPaperSize(PHPExcel_Worksheet_PageSetup::PAPERSIZE_A4);

	  	$this->PageMargins->setBottom(0.5);
	  	$this->PageMargins->setTop(2.2);
	  	$this->PageMargins->setLeft(0.2);
	  	$this->PageMargins->setRight(0.2);

	  	$this->objExcel->getActiveSheet()->setPageMargins($this->PageMargins);

	  	// worksheet name
	  	$this->objExcel->getActiveSheet()->setTitle('Summary Sheet Report');

	  	//Output to client browser
	  	// Redirect output to a client's web browser (Excel2007)
		$filename = 'active_xls_'.date("Y-m-d-h-i-s-A");
	  	header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
	  	header('Content-Disposition: attachment;filename='.$filename.'.xlsx');
	  	header('Cache-Control: max-age=0');

	  	$objWriter = PHPExcel_IOFactory::createWriter($this->objExcel, 'Excel2007');
	  	$objWriter->save('php://output');
	  	exit;
	  }//End of all terminated data


  }
