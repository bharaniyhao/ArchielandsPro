<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../../../../media/assets/css/style.css">
<?php
include("../../../../config.php");
include SPATH_LIBRARIES . DS . "engine.Class.php";

$engine = new engineClass();
$ufullname = $session->get('loginuserfulname');
$userid = $session->get('userid');
$actualdate = date("Y-m-d");

// Get parameters
$fromdate = isset($_GET['fromdate']) ? date("Y-m-d", strtotime($_GET['fromdate'])) : '';
$todate = isset($_GET['todate']) ? date("Y-m-d", strtotime($_GET['todate'])) : '';
$status = isset($_GET['BK_PAYMENT_STATUS']) ? $_GET['BK_PAYMENT_STATUS'] : '';
$approvalstatus = "";

// Set status and approval status
if ($status == "all") {
    $approvalstatus = "";
    $status = "";
} else if ($status == "2") {
    $approvalstatus = "0";
    $status = "1";
} else if ($status == "1") {
    $approvalstatus = "1";
    $status = "1";
} else if ($status == "0") {
    $approvalstatus = "0";
    $status = "0";
}

// Construct base SQL query
$sqlQuery = "SELECT * FROM BookingRecord WHERE Bk_STATUS IN ('1')";
$params = [];

if (!empty($fromdate) && !empty($todate)) {
    $sqlQuery .= " AND BK_CHECKIN BETWEEN " . $sql->Param('a') . " AND " . $sql->Param('b');
    $params[] = $fromdate;
    $params[] = $todate;
}

if (!empty($status)) {
    $sqlQuery .= " AND BK_PAYMENT_STATUS = " . $sql->Param('c');
    $params[] = $status;
}

// Print the SQL query and parameters for debugging
// echo "SQL Query: " . $sqlQuery . "<br>";
// echo "Parameters: ";
// print_r($params);
// echo "<br>";

// Execute the query
$stmt = $sql->Prepare($sqlQuery);
$results = $sql->Execute($stmt, $params);

// Check if query execution was successful
// if (!$results) {
//     echo "Error executing query: " . $sql->ErrorMsg();
// } else {
//     echo "Query executed successfully.<br>";
// }
// Determine display status
$displayStatus = '';
if ($status === '0') {
    $displayStatus = 'Pending Approval';
} elseif ($status === '1') {
    $displayStatus = 'Approved';
} elseif ($status === '2') {
    $displayStatus = 'Rejected';
}

?>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card pt-3 bg-secondary pb-0">
            <div class="text-center font-weight-bold  text-white py-2">
            Booking Report
        </div>
        <div class="text-center text-white mt-2">
                    <?php
                    $caption = "";
                    if (!empty($fromdate) && !empty($todate)) {
                        $caption = "From " . date("M d, Y", strtotime($fromdate)) . " to " . date("M d, Y", strtotime($todate));
                        if (!empty($status)) {
                            $displayStatus = ($status == '0') ? 'Pending Approval' : (($status == '1') ? 'Approved' : 'Rejected');
                            $caption .= " for status " . $displayStatus;
                        }
                    }
                    echo $caption;
                    ?>
                </p>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 text-left" style="display:flex; justify-content: start;">
            <img class="img-fluid" style="max-width: 140px; height: auto;" src="../../../../media/assets/img/logos/Apple Grand Logo 1.jpg" alt="Apple Grand Logo">
        </div>
        <div class="col-md-4"></div>
        <div class="col-md-4 text-right">
            <p>Greater Accra Region, Afienya <br>Frega junction,Akosombo-Tema Rd/Tema - Akosombo Rd/Tema-Jasikan Rd/N2 road. <br>Tel. (+233) 598867392 <br>Email: info@applgrand.net</p>
        </div>
    </div>
    <div class="row">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="example-table">
                <thead class="thead-light thead-50 text-capitalize">
                    <tr>
                        <th>#</th>
                        <th>Cate Name</th>
                        <!-- <th>Book Code</th> -->
                        <th>Room Number</th>
                        <th>Amount</th>
                        <th>Check In</th>
                        <th>Check Out</th>
                        <th>Remark</th>
                        <th>Duration</th>
                        <th>Client Name</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $num = 0;
                    if (!empty($results)) {
                        while ($bookrecords = $results->FetchRow()) {
                            $status = ($bookrecords['BK_PAYMENT_STATUS'] == "0") ? 'Pending Approval' : (($bookrecords['BK_PAYMENT_STATUS'] == "2") ? 'Approved' : 'Rejected');
                            echo '<tr>
                                    <td>' . ++$num . '</td>
                                    <td>' . $bookrecords['BK_TITLE'] . '</td>
                                    
                                    <td>' . $bookrecords['BK_ROOM_NUM'] . '</td>
                                    <td>' . $bookrecords['BR_AMOUNT'] . '</td>
                                    <td>' . $bookrecords['BK_CHECKIN'] . '</td>
                                    <td>' . $bookrecords['BK_CHEKOUT'] . '</td>
                                    <td>' . $bookrecords['BR_REMARK'] . '</td>
                                    <td>' . $bookrecords['BR_DURATION'] . '</td>
                                    <td>' . $bookrecords['BK_CLIENT_LASTNAME'] . '</td>
                                    <td class="text-center">' . $status . '</td>
                                </tr>';
                        }
                    } else {
                        echo '<tr>
                                <td colspan="11">No Records Found</td>
                              </tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
