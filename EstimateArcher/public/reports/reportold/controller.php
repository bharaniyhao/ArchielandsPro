<?php
$crypt = new cryptCls();
// include(SPATH_LIBRARIES . DS . "pagination.Class.php");
// include(SPATH_LIBRARIES . DS . "engine.Class.php");

require_once(SPATH_PLUGINS . DS . "/PHPExcel/PHPExcel.php");
$exportto = array(array("excel", "To Excel"));
$activescheme = $session->get('activescheme');
global $inputmonth, $inputyear, $schtype;

$actorid = $session->get('userid');
$actualdate = date("Y-m-d");


switch ($viewpage) {
	case "exportxml":
print_r($_POST);  
    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);
			if (!empty($ukeys)) {

				include_once 'view/exportxml.php';
				$uploadtemplate = new export_report();

				$records = $engine->getAllbookrecords();
				if ($records->RecordCount() > 0) {
					while (!$records->EOF) {
						$obj = $records->FetchNextObject();
						if ($obj->SCH_ID == $ukeys) {
							$schemename =  $obj->SCH_NAME;
						}
					}
				}
 			 

				$stmtcomp = $sql->Execute($sql->Prepare("SELECT * FROM daa_compsettings"), array());
				$obj = $stmtcomp->FetchNextObject();
				$surcharge = $obj->CP_SURCHARGE_PERCENT;
				$surchargedate = $obj->CP_SURCHARGE_DATE;

				$stmtaccount = $sql->Execute($sql->Prepare("SELECT CP_NAME,CP_SSNITNO,CP_ACCOUNTNO,CP_STARTDATE,CP_CONTACTNO,CP_CODE,CP_NOEMPLOYEE,CP_CONTRIBUTIONMONTH,CP_LOCATION,CP_POSTALADDRESS,CP_CONTACTPERSON,CP_AMOUNTDEFAULTED,CP_SURCHAGE,CP_LASTMONTH FROM daa_defaulters WHERE CP_SCHID = " . $sql->Param('a') . " AND   CP_MONTH =" . $sql->Param('a') . " AND CP_YEAR = " . $sql->Param('a') . ""), array($ukeys, $monthinput, $yearinput));
				if (($stmtaccount->RecordCount() > 0)) {
					foreach ($stmtaccount as $val) {

					 
						$data[] = array('accountname' => $val['CP_NAME'], 'snnit' => $val['CP_SSNITNO'], 'accountno' => strval($val['CP_ACCOUNTNO']), 'conno' => strval($val['CP_CONTACTNO']), 'noOfEmployees' => $val['CP_NOEMPLOYEE'], 'surcharge' => $val['CP_SURCHAGE'],'postal_address' => strval($val['CP_POSTALADDRESS']),'amount_defaulted' => strval($val['CP_AMOUNTDEFAULTED']),'contribution_month' => strval($val['CP_CONTRIBUTIONMONTH']),'last_month' => strval($val['CP_LASTMONTH']),'contact_person' => strval($val['CP_CONTACTPERSON']),'location' => strval($val['CP_LOCATION']), 'startdate' => date("d/m/Y", strtotime($val['CP_STARTDATE'])));
					}

					$result = $uploadtemplate->tilloprations($data, $schemename,$monthinput,$yearinput);

					return $result;
				} else {
					$status = 'error';
					$msg = 'There are no records';
				}
			}
		}
		break;


	case "report":
print_r($_POST);  

		    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);
			if (empty($inputmonth) || empty($inputyear)) {
				$msg = "Failed. Required fields cannot be empty ";
				$status = "error";
				$target = "viewreport";
			} else {
				// $year = $inputyear;
				// $month = $inputmonth;
				// $inputelt = $schtype;
				// echo $year . " " . $month . " " . $inputelt;
				$printpath = "public/reports/report/view/report.php?month=" . $inputmonth . " &year=" . $inputyear . "&inputelt=" . $schtype;
			}
		}

		break;
}

// $schemes = $engine->getAllScheme();
$records = $engine->getAllbookrecords();

