<?php
// include("../../../../config.php");
// include SPATH_LIBRARIES . DS . "engine.Class.php";

// Ensure that $pdo is properly defined and connected
// try {
//     $pdo = new PDO('mysql:host=your_host;dbname=your_dbname', 'your_username', 'your_password');
//     $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
// } catch (PDOException $e) {
//     echo 'Connection failed: ' . $e->getMessage();
//     exit;
// }

$ufullname = $session->get('loginuserfulname');
$userid = $session->get('userid');
$actualdate = date("Y-m-d");

global $fromdate,$todate,$nfromdate, $ntodate;
switch ($viewpage) {
    case "export":
        print_r($_POST);
        $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

            include_once 'library/exportxml.php';
            $uploadtemplate = new ExportReport();

            // Convert date strings to MySQL date format
            // $fromdate = date("Y-m-d", strtotime($_GET['fromdate']));
            // $todate = date("Y-m-d", strtotime($_GET['todate']));
            // $vendorcode = $_GET['vendorcode'];

            // Database query to get results
            $query = "SELECT * FROM BookingRecord WHERE BR_ID = ? AND BK_CHECKIN BETWEEN ? AND ?";
            $stmt = $pdo->prepare($query);
            $stmt->execute([$nfromdate, $ntodate]);

            // Debugging output for results
            echo "<pre>";
            echo "Results: " . print_r($results, true) . "\n";
            echo "</pre>";

             $data = [];
            $columns = ["Cate Name", "Book Code", "Room Number", "Amount", "Check in", "Check out", "Remark", "Duration","Client Name","Status"];
            foreach ($results as $res) {
                
                $status = (($res['BK_PAYMENT_STATUS'] == "0" && $res['BK_PAYMENT_STATUS']=="0") ? 'Pending Approval' : (($res['BK_PAYMENT_STATUS'] == "1") ? 'Approved' : (($res['BK_PAYMENT_STATUS'] == "0" && $res['status']=="1") ? 'Rejected' : '')));

            $reportname = "Eventlog Report";

            $response = $uploadtemplate->tilloprations($data, $columns, $reportname, $ufullname);
        }}
        break;

    case "report":
                // print_r($_POST);

        // $fromdate = date("Y-m-d", strtotime($_GET['fromdate']));
        // $todate = date("Y-m-d", strtotime($_GET['todate']));
        
    $printpath = "public/reports/report/view/report.php?fromdate=" . $fromdate . "&todate=" . $todate . "&BK_PAYMENT_STATUS=" . $status;
        $fromdate = $fromdate;
        $todate = $todate;
        $status = $status;
        // You can add additional logic for the 'report' case if needed.
        break;

    default:
        break;
}

$limit = (!isset($limit) ? 10 : (empty($limit) ? $limit = 10 : $limit));
$session->set("limited", $limit);
$length = 10;
$offset = (isset($offset) && !empty($offset)) ? $offset : '0';

if (isset($action_search) && $action_search == "search") {
    if (!empty($fdsearch)) {
        $search = ["trackingcode" => $fdsearch, "limit" => $limit, "offset" => ((int)$offset), "sellercode" => $userid, "servicetype" => "2", "trackingstatus" => "1", "paystate" => '1'];
    } else {
        $search = ["limit" => $limit, "offset" => ((int)$offset), "sellercode" => $userid, "servicetype" => "2", "trackingstatus" => "1", "paystate" => '1'];
    }
} else {
    $search = ["limit" => $limit, "offset" => ((int)$offset), "sellercode" => $userid, "servicetype" => "2", "trackingstatus" => "1", "paystate" => '1'];
}

// Get all users
if (empty($fdsearch)) {
    $query = "SELECT * FROM BookingRecord WHERE BK_PAYMENT_STATUS in ('1','2','3','4') ORDER BY BK_CODE ASC";
    $input = array();   
} else {
    $query = "SELECT * FROM BookingRecord WHERE BK_PAYMENT_STATUS in ('1','2','3','4') AND ( BK_LTCODE LIKE ? OR BK_TITLE LIKE ? ) ORDER BY BK_CODE ASC";
    $input = array($fdsearch . "%", $fdsearch . "%");
}

// Create a pagination instance

$session->set("limited", $limit);
$lenght = 10;
$paging = new OS_Pagination($sql, $query, $limit, $lenght, $input, 'action=index&pg=2e5d8aa3dfa8ef34ca5131d20f9dad51&option=6831b98f85019ddb98bd98d44bdbac40');
?>
