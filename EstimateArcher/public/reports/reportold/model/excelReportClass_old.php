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
	  function ActiveLoan($emplcont,$from,$to)
	  {

	  	// Define the limit of the grid
	  	$limitcadre = count($emplcont) + 11;
	  	$this->objExcel->getActiveSheet()->setSharedStyle($this->Style, "A10:H".$limitcadre);


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

	    $this->objExcel->getActiveSheet()->mergeCells('A1:H2');
		$this->objExcel->getActiveSheet()->getStyle('A1:H2')->getFont()->setSize(15);
        $this->objExcel->getActiveSheet()->getStyle('A1:H2')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$this->objExcel->getActiveSheet()->SetCellValue('A1', 'ACTIVE LOAN REPORT');

		$this->objExcel->getActiveSheet()->getStyle('A4:B8')->applyFromArray($styleArray2);
		$this->objExcel->getActiveSheet()->mergeCells('A4:B4');
		$this->objExcel->getActiveSheet()->getCell('A4')->setValue("@ ". date('M d, Y'));
		
		$this->objExcel->getActiveSheet()->mergeCells('A6:B6');
		$this->objExcel->getActiveSheet()->getCell('A6')->setValue("Period");
		$this->objExcel->getActiveSheet()->mergeCells('A7:B7');
		$this->objExcel->getActiveSheet()->getCell('A7')->setValue("From: ".$from);
		$this->objExcel->getActiveSheet()->mergeCells('A8:B8');
		$this->objExcel->getActiveSheet()->getCell('A8')->setValue("To: ".$to);
		



	    $this->objExcel->getActiveSheet()->getStyle('A10:H10')->applyFromArray($styleArray);
	  	//setting column width
	  	$this->objExcel->getActiveSheet()->getColumnDimension('A')->setWidth(12);
	  	$this->objExcel->getActiveSheet()->getColumnDimension('B')->setWidth(25);
	  	$this->objExcel->getActiveSheet()->getColumnDimension('C')->setWidth(16);
		$this->objExcel->getActiveSheet()->getColumnDimension('D')->setWidth(16);
		$this->objExcel->getActiveSheet()->getColumnDimension('E')->setWidth(16);
		$this->objExcel->getActiveSheet()->getColumnDimension('F')->setWidth(16);
		$this->objExcel->getActiveSheet()->getColumnDimension('G')->setWidth(16);
		$this->objExcel->getActiveSheet()->getColumnDimension('H')->setWidth(16);



	  	$this->objExcel->setActiveSheetIndex(0);
	  	$this->objExcel->getActiveSheet()->SetCellValue('A10', 'Start Date');
	  	$this->objExcel->getActiveSheet()->SetCellValue('B10', 'Staff ID');
	  	$this->objExcel ->getActiveSheet()->SetCellValue('C10', 'Full Name');
		$this->objExcel ->getActiveSheet()->SetCellValue('D10', 'Element Name');
		$this->objExcel ->getActiveSheet()->SetCellValue('E10', 'Initial Amt.');
		$this->objExcel ->getActiveSheet()->SetCellValue('F10', 'Number Installment');
		$this->objExcel ->getActiveSheet()->SetCellValue('G10', 'Amount');
		$this->objExcel ->getActiveSheet()->SetCellValue('H10', 'Balance');


	  	$i = 11;
	  	$n = 1;
		$totalamount = $totalbal = 0;
	  	if(is_array($emplcont) && count($emplcont) > 0){
	  		foreach($emplcont as $value){
	  			$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("0",$i,$value[0]);
	  			$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("1",$i,$value[1]);
	  			$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("2",$i,$value[2]);
	  			$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("3",$i,$value[3]);
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("4",$i,number_format($value[4],2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("5",$i,$value[5]);
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("6",$i,number_format($value[6],2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("7",$i,number_format($value[7],2));
	  			$i++; $n++;
				$totalamount = $totalamount + $value[6];
				$totalbal = $totalbal + $value[7];
	  		}
			    $this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("6",$i,number_format($totalamount,2));
				$this->objExcel->getActiveSheet()->SetCellValueByColumnAndRow("7",$i,number_format($totalbal,2));
			/*$this->objExcel->getActiveSheet()->getStyle('E10:E'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
			$this->objExcel->getActiveSheet()->getStyle('G10:G'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
			$this->objExcel->getActiveSheet()->getStyle('H10:H'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
			$this->objExcel->getActiveSheet()->getStyle('I10:I'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
			$this->objExcel->getActiveSheet()->getStyle('I10:I'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
			$this->objExcel->getActiveSheet()->getStyle('A10:A'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);*/
	  	}
		$this->objExcel->getActiveSheet()->getPageSetup()->setOrientation(PHPExcel_Worksheet_PageSetup::ORIENTATION_PORTRAIT);
	  	$this->objExcel->getActiveSheet()->getPageSetup()->setPaperSize(PHPExcel_Worksheet_PageSetup::PAPERSIZE_A4);

	  	$this->PageMargins->setBottom(0.5);
	  	$this->PageMargins->setTop(2.2);
	  	$this->PageMargins->setLeft(0.2);
	  	$this->PageMargins->setRight(0.2);

	  	$this->objExcel->getActiveSheet()->setPageMargins($this->PageMargins);

	  	// worksheet name
	  	$this->objExcel->getActiveSheet()->setTitle('Active Loan Report');

	  	//Output to client browser
	  	// Redirect output to a client's web browser (Excel2007)
		$filename = 'activeloanreport_xls_'.date("Y-m-d-h-i-s-A");
	  	header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
	  	header('Content-Disposition: attachment;filename='.$filename.'.xlsx');
	  	header('Cache-Control: max-age=0');

	  	$objWriter = PHPExcel_IOFactory::createWriter($this->objExcel, 'Excel2007');
	  	$objWriter->save('php://output');
	  	exit;
	  }//End of all terminated data


  }
