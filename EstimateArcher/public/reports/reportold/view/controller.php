<?php
require_once(SPATH_PLUGINS . DS . "/PHPExcel/PHPExcel.php");
$exportto = array(array("excel", "To Excel"));

$actorid = $session->get('userid');
$actualdate = date("Y-m-d");
global $mtittle, $murname, $mother, $mnationality, $meamil, $mmobilen, $midn, $midt, $mplacei, $mss, $mstaffid, $mmsalary, $dob, $mgender, $mnkema, $mrac, $maddress, $nemail, $mgps, $mbox, $mtown, $mappdate, $msaffl, $mjstatu, $mperc, $mbmobile, $mwsector, $mdep, $mnksurn, $mnkoth, $mnknum, $mpc, $mscs, $mrw, $mappno, $mnkdob, $mnet, $macc, $mfullname, $mrw, $mnksn, $mrwah, $mbdob, $mdob, $mbother, $mitpi,$inputelt, $month, $year, $fulname;

switch ($viewpage) {
	case "showreports":
print_r($_POST);  

		$printpath = "public/reports/report/view/viewreport";
		break;
		
}
