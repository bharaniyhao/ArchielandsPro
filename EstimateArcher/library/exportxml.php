<?php
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\IOFactory;

class ExportReport
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

  function tilloprations($result,$columns,$reportname,$appname)
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
    $alphabets = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
    
    $spreadsheet->getActiveSheet()->getColumnDimension('A')->setWidth(5);
    for($c = 0; $c < sizeof($columns); $c++){
      $spreadsheet->getActiveSheet()->getColumnDimension($alphabets[$c+1])->setWidth(30);
    }

    $spreadsheet->setActiveSheetIndex(0);
    //set column names
    $spreadsheet->getActiveSheet()->SetCellValue('A4', 'No.');
    for($c = 0; $c < sizeof($columns); $c++){
      $spreadsheet->getActiveSheet()->SetCellValue($alphabets[$c+1].'4', $columns[$c]);
    }

    $spreadsheet->getActiveSheet()->mergeCells('A1:E1')->getStyle('A1')->getFont()->setSize(12);
    $spreadsheet->getActiveSheet()->mergeCells('A2:E2')->getStyle('A2')->getFont()->setSize(12);
    $spreadsheet->getActiveSheet()->mergeCells('A3:E3')->getStyle('A3')->getFont()->setSize(12);
    $i = 5;
    $j = 1;
    $spreadsheet->getActiveSheet()->SetCellValue('A1',  (strtoupper($reportname) ?? ''));
    $spreadsheet->getActiveSheet()->SetCellValue('A2', strtoupper(($appname) ?? ''));

    if (is_array($result) && count($result) > 0) {
      foreach($result as $res) {

        $spreadsheet->getActiveSheet()->SetCellValueByColumnAndRow("1", $i, $j );
        $count = 2;
        $keys = array_keys($res);
        foreach($keys as $key){
          $spreadsheet->getActiveSheet()->SetCellValueByColumnAndRow((string)$count, $i, $res[$key]);
          $count++;
        }
      
        $i++;
        $j++;
      }
    } else {
      $spreadsheet->getActiveSheet()->mergeCellsByColumnAndRow(1, 3, 12, 4)->SetCellValue('A3', 'No Record Found...')->getStyle('A3')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
      $spreadsheet->getActiveSheet()->mergeCellsByColumnAndRow(1, 3, 12, 4)->getStyle('A3')->getFont()->setSize(15);
    }

    $spreadsheet->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
    $spreadsheet->getActiveSheet()->getStyle('A1')->applyFromArray($HeadingstyleArray);
    $spreadsheet->getActiveSheet()->getStyle('A2')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
    $spreadsheet->getActiveSheet()->getStyle('A2')->applyFromArray($HeadingstyleArray);
    $spreadsheet->getActiveSheet()->getStyle('A3')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
    $spreadsheet->getActiveSheet()->getStyle('A3')->applyFromArray($HeadingstyleArray);
    $spreadsheet->getActiveSheet()->getStyle('A4:M4')->applyFromArray($styleArray);

    //$i++;
    /*  $spreadsheet->getActiveSheet()->getStyle('A1:AO1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT);
        $spreadsheet->getActiveSheet()->getPageSetup()->setOrientation(\PhpSpreadsheet_Worksheet_PageSetup::ORIENTATION_LANDSCAPE);
        $spreadsheet->getActiveSheet()->getPageSetup()->setPaperSize(\PhpSpreadsheet_Worksheet_PageSetup::PAPERSIZE_A4);

        */


    //Set header first, so the result will be treated as an Xlsx file
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    //Make an attachment so we can define the filename.
    header('Content-Disposition: attachment;filename="'.strtoupper($reportname).' ' . date('Y-m-d-H-i') . '".xlsx"');
    header('Cache-Control: max-age=0');

    //Create IOFactory object
    $writer =  IOFactory::createWriter($spreadsheet, 'Xlsx');
    ob_end_clean();
    //Save into php Output

    $writer->save('php://output');
    die;
  }
}

