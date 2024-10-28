<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\IOFactory;

class export_report
{
  private $sheet;
  private $PageMargins;
  private $style;
  private $objDrawing;
  private $spreadsheet;

  function  __construct()
  {
    global $sql, $excel;
    // $this->sql = $sql;

    $this->spreadsheet = new spreadsheet();
    $this->sheet = $this->spreadsheet->getActiveSheet();
    $sheet = $this->sheet;
    $spreadsheet = $this->spreadsheet;
  }

  function ReportHeader($header)
  {
    $sheet       = $this->sheet;
    $spreadsheet = $this->spreadsheet;
    // Set properties
    $spreadsheet->getProperties()
      ->setCreator("Maarten Balliauw")
      ->setLastModifiedBy("Maarten Balliauw")
      ->setTitle("Office 2007 XLSX Test Document")
      ->setSubject("Office 2007 XLSX Test Document")
      ->setDescription("Export Report XLSX, generated using PHP classes.")
      ->setKeywords("office 2007 openxml php")
      ->setCategory("Export Report file");



    $spreadsheet->getActiveSheet()
      ->getHeaderFooter()
      ->setOddHeader("&L&G&R&H" . $header[0] . "\n" . $header[1] . "\n" . $header[2] . "\n" . $header[3] . "\n" . $header[4] . "\n\n" . $header[5] . "\n" . $header[6] . "\n" . $header[7] . " ");

    $spreadsheet->getActiveSheet()
      ->getHeaderFooter()
      ->setOddFooter('&L&B' . $spreadsheet->getProperties()->getTitle() . '&RPage &P of &N');
  }

  function tilloprations($result, $schemename, $month, $year)
  {
    $limitcadre = count($result) + 1;
    $sheet = $this->sheet;
    $spreadsheet = $this->spreadsheet;
    $spreadsheet->getDefaultStyle()
      ->getFont()
      ->setName('Arial')
      ->setSize(10);

    $styleArray = [
      'font' => [
        'bold' => true,
      ],
      'alignment' => [
        'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
      ],
      'borders' => [
        'top' => [
          'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
        ],
      ],
      'fill' => [
        'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_GRADIENT_LINEAR,
        'rotation' => 90,
        'startColor' => [
          'argb' => '90EE90',
        ],
        'endColor' => [
          'argb' => '90EE90',
        ],
      ],
    ];
    $HeadingstyleArray = [
      'font' => [
        'bold' => true,
      ],
      'alignment' => [
        'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT,
      ],
      'borders' => [
        'top' => [
          'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
        ],
      ],
      'fill' => [
        'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_GRADIENT_LINEAR,
        'rotation' => 90,
        'startColor' => [
          'argb' => 'FFFFFF',
        ],
        'endColor' => [
          'argb' => 'FFFFFF',
        ],
      ],
    ];

    //Report and Company Name
    $spreadsheet->setActiveSheetIndex(0);
    //setting column width
    $spreadsheet->getActiveSheet()->getColumnDimension('A')->setWidth(5);
    $spreadsheet->getActiveSheet()->getColumnDimension('B')->setWidth(70);
    $spreadsheet->getActiveSheet()->getColumnDimension('C')->setWidth(20);
    $spreadsheet->getActiveSheet()->getColumnDimension('D')->setWidth(20);
    $spreadsheet->getActiveSheet()->getColumnDimension('E')->setWidth(30);
    $spreadsheet->getActiveSheet()->getColumnDimension('F')->setWidth(20);
    $spreadsheet->getActiveSheet()->getColumnDimension('G')->setWidth(40);
    $spreadsheet->getActiveSheet()->getColumnDimension('H')->setWidth(30);
    $spreadsheet->getActiveSheet()->getColumnDimension('I')->setWidth(20);
    $spreadsheet->getActiveSheet()->getColumnDimension('J')->setWidth(30);
    $spreadsheet->getActiveSheet()->getColumnDimension('K')->setWidth(20);
    $spreadsheet->getActiveSheet()->getColumnDimension('L')->setWidth(15);
    $spreadsheet->getActiveSheet()->getColumnDimension('M')->setWidth(30);
    $spreadsheet->getActiveSheet()->getColumnDimension('N')->setWidth(30);
    // $spreadsheet->getActiveSheet()->getColumnDimension('O')->setWidth(30);
    // $spreadsheet->getActiveSheet()->getColumnDimension('P')->setWidth(30);



    $spreadsheet->setActiveSheetIndex(0);
    $spreadsheet->getActiveSheet()->SetCellValue('A5', 'No.');
    $spreadsheet->getActiveSheet()->SetCellValue('B5', 'Account Name');
    $spreadsheet->getActiveSheet()->SetCellValue('C5', 'Enrollment Reg No');
    $spreadsheet->getActiveSheet()->SetCellValue('D5', 'SSNIT ER No');
    $spreadsheet->getActiveSheet()->SetCellValue('E5', 'Location');
    $spreadsheet->getActiveSheet()->SetCellValue('F5', 'P.O Box');
    $spreadsheet->getActiveSheet()->setCellValue('G5', 'Contact Number');
    $spreadsheet->getActiveSheet()->setCellValue('H5', 'Contact Person');
    $spreadsheet->getActiveSheet()->setCellValue('I5', 'No of Employees');
    $spreadsheet->getActiveSheet()->setCellValue('J5', 'Contribution Month');
    $spreadsheet->getActiveSheet()->setCellValue('K5', 'Defaulted Amount');
    $spreadsheet->getActiveSheet()->setCellValue('L5', 'Surcharge');
    $spreadsheet->getActiveSheet()->setCellValue('M5', 'Last Month Of Cont.');
    $spreadsheet->getActiveSheet()->setCellValue('N5', 'Start Date');


    $spreadsheet->getActiveSheet()->mergeCells('A1:D1')->getStyle('A1')->getFont()->setSize(15);
    $spreadsheet->getActiveSheet()->mergeCells('A2:D2')->getStyle('A2')->getFont()->setSize(15);
    $spreadsheet->getActiveSheet()->mergeCells('A3:D3')->getStyle('A3')->getFont()->setSize(15);
    $spreadsheet->getActiveSheet()->mergeCells('A4:D4')->getStyle('A4')->getFont()->setSize(15);


    $i = 6;
    $j = 1;
 
    $monthName = date("F", mktime(0, 0, 0, $month, 10));
    $spreadsheet->getActiveSheet()->SetCellValue('A1', 'DEFAULTERS REPORT')
      ->getStyle('A1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
    $spreadsheet->getActiveSheet()->SetCellValue('A2', $schemename)
      ->getStyle('A2')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
    $spreadsheet->getActiveSheet()->SetCellValue('A3', 'DATE: ' . date("F j, Y, g:i a"))
      ->getStyle('A3')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
    $spreadsheet->getActiveSheet()->SetCellValue('A4', 'Period: ' . $monthName . " " . $year)
      ->getStyle('A2')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
    if (is_array($result) && count($result) > 0) {

      //	var_dump( count($result)); die;
      foreach ($result as $value) {

        //	$spreadsheet->getActiveSheet()->SetCellValueByColumnAndRow("0",$i,$b);
        $spreadsheet->getActiveSheet()->SetCellValueByColumnAndRow("1", $i, $j);
        $spreadsheet->getActiveSheet()->SetCellValueByColumnAndRow("2", $i, $value['accountname']);
        $spreadsheet->getActiveSheet()->SetCellValueByColumnAndRow("3", $i, $value['accountno']);
        $spreadsheet->getActiveSheet()->SetCellValueByColumnAndRow("4", $i,  $value['snnit']);
        $spreadsheet->getActiveSheet()->SetCellValueByColumnAndRow("5", $i,  $value['location']);
        $spreadsheet->getActiveSheet()->SetCellValueByColumnAndRow("6", $i,  $value['postal_address']);
        $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow('7', $i,  $value['conno']);
        $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow('8', $i,  $value['contact_person']);
        $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow('9', $i,  $value['noOfEmployees']);
        $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow('10', $i,  $value['contribution_month']);
        $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow('11', $i,  $value['amount_defaulted']);
        $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow('12', $i,  $value['surcharge']);
        $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow('13', $i,  $value['last_month']);
        $spreadsheet->getActiveSheet()->setCellValueByColumnAndRow('14', $i,  $value['startdate']);
        $i++;
        $j++;
      }
    } else {
      $spreadsheet->getActiveSheet()->mergeCellsByColumnAndRow(1, 3, 12, 4)->SetCellValue('A5', 'No Record Found...')->getStyle('A5')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
      $spreadsheet->getActiveSheet()->mergeCellsByColumnAndRow(1, 3, 12, 4)->getStyle('A5')->getFont()->setSize(15);
    }

    $spreadsheet->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
    $spreadsheet->getActiveSheet()->getStyle('A1')->applyFromArray($HeadingstyleArray);
    $spreadsheet->getActiveSheet()->getStyle('A2')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
    $spreadsheet->getActiveSheet()->getStyle('A2')->applyFromArray($HeadingstyleArray);
    $spreadsheet->getActiveSheet()->getStyle('A3')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
    $spreadsheet->getActiveSheet()->getStyle('A3')->applyFromArray($HeadingstyleArray);
    $spreadsheet->getActiveSheet()->getStyle('A4')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
    $spreadsheet->getActiveSheet()->getStyle('A4')->applyFromArray($HeadingstyleArray);
    $spreadsheet->getActiveSheet()->getStyle('A5:N5')->applyFromArray($styleArray);

    //$i++;
    /*  $spreadsheet->getActiveSheet()->getStyle('A1:AO1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT);
        $spreadsheet->getActiveSheet()->getPageSetup()->setOrientation(\PhpSpreadsheet_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);
        $spreadsheet->getActiveSheet()->getPageSetup()->setPaperSize(\PhpSpreadsheet_Worksheet_PageSetup::PAPERSIZE_A4);

        */


    //Set header first, so the result will be treated as an Xlsx file
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    //Make an attachment so we can define the filename.
    header('Content-Disposition: attachment;filename="BOOKING RECORDS ' . date('Y-m-d-H-i') . '".xlsx"');
    header('Cache-Control: max-age=0');

    //Create IOFactory object
    $writer =  IOFactory::createWriter($spreadsheet, 'Xlsx');
    ob_end_clean();
    //Save into php Output

    $writer->save('php://output');
    die;
  }
}
