<?php
include("../../../../config.php");
include SPATH_LIBRARIES . DS . "engine.Class.php";
$engine = new engineClass();
$actualdate = date("Y-m-d");
?>
<!doctype html>
<html>

<head>
  <meta charset="utf-8">
  <title>Bookings Report</title>
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
</head>

<body>
<div class="container">
    <div class="row my-4">
        <div class="col text-center">
            <?php
            // Define the query to select booking records
            $query = "SELECT CODE, BK_LTCODE, BK_TITLE, BK_USERNAME, BK_PAYMENT_STATUS, 
                             BK_CLIENT_LASTNAME, BR_AMOUNT, BK_CHEKOUT, BK_CHECKIN, 
                             BK_ROOM_NUM, BR_REMARK, BR_DURATION 
                      FROM BookingRecord 
                      WHERE BR_ID = " . $sql->Param('a') . " AND BK_CHEKOUT = " . $sql->Param('b') . " AND CREATEDDATE = " . $sql->Param('c') . " 
                      ORDER BY BK_CHEKOUT ASC";

            // Prepare and execute the query
            $stmt = $sql->Prepare($query);
            $records = $sql->Execute($stmt, array($inputelt, $month, $year));

            // Fetch the logo and surcharge settings
            $stmtlogo = $sql->Prepare("SELECT * FROM daa_compsettings");
            $stmtlogo = $sql->Execute($stmtlogo);
            $obj = $stmtlogo->FetchNextObject();
            $logo = $obj->CP_LOGO;
            $surcharge = $obj->CP_SURCHARGE_PERCENT;
            $surchargedate = $obj->CP_SURCHARGE_DATE;

            // Process booking records
            $schemename = ''; // Initialize $schemename
            if ($records->RecordCount() > 0) {
                while (!$records->EOF) {
                    $obj = $records->FetchNextObject();
                    if ($obj->SCH_ID == $inputelt) {
                        $schemename = $obj->BK_ROOM_NUM;
                    }
                }
            }

            ?>
            <img src="<?= htmlspecialchars($logo) ?>" class="img-fluid" style="width: 140px;" alt="Company Logo" />
        </div>
    </div>

    <div class="row">
        <div class="col text-right">
            <p>
                <?= htmlspecialchars($obj->CP_NAME); ?><br />
                <?= htmlspecialchars($obj->CP_ADDRESS); ?><br />
                <?= htmlspecialchars($obj->CP_BOX); ?><br />
                <?= htmlspecialchars($obj->CP_EMAIL); ?><br />
                <?= htmlspecialchars($obj->CP_CONTACTNO); ?>
            </p>
        </div>
    </div>

    <div class="row my-4">
        <div class="col text-center">
            <h4><u>BOOKINGS REPORT (<?= htmlspecialchars($schemename) ?>)</u></h4>
        </div>
    </div>

    <div class="row my-4">
        <div class="col">
            <p><b>@ <?= date("F d, Y"); ?></b></p>
            <p><b>Period: <?= strtoupper(date("F", mktime(0, 0, 0, $month, 10))) . " " . $year ?></b></p>
        </div>
    </div>

    <div class="row my-4">
        <div class="col">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>No</th>
                        <th>Code</th>
                        <th>BK Code</th>
                        <th>Username</th>
                        <th>Payment</th>
                        <th>Client Name</th>
                        <th>Amount</th>
                        <th>Check-In</th>
                        <th>Check-Out</th>
                        <th>Room Number</th>
                        <th>Remark</th>
                        <th>Duration</th>
                        <th></th>
                        <th>Registration Date</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $n = 1;
                    if ($records->RecordCount() > 0) {
                        foreach ($records as $acc) {
                            // Determine background color based on payment status
                            $bgcolor = '';
                            if ($acc['BK_PAYMENT_STATUS'] == 1) {
                                $bgcolor = 'bg-success';
                            } elseif ($acc['BK_PAYMENT_STATUS'] == 2) {
                                $bgcolor = 'bg-danger';
                            } elseif ($acc['BK_PAYMENT_STATUS'] == 3) {
                                $bgcolor = 'bg-warning';
                            }

                            // Calculate month difference
                            $lastmonthyear = explode("/", $acc['CREATEDDATE']);
                            $lastmonth = $allmonths[(int)$lastmonthyear[0]];
                            $lastyear = $lastmonthyear[1];
                            $lastdate = $lastmonthyear[1] . '-' . $lastmonthyear[0] . '-01';
                            $datetime1 = new DateTime($actualdate);
                            $datetime2 = new DateTime($lastdate);
                            $diff = $datetime1->diff($datetime2);
                            $monthdiff = $diff->m;
                            ?>
                            <tr class="<?= htmlspecialchars($bgcolor) ?>">
                                <td><?= htmlspecialchars($n) ?></td>
                                <td><?= htmlspecialchars($acc['BK_ROOM_NUM']) ?></td>
                                <td><?= htmlspecialchars($acc['BK_ROOM_NUM']) ?></td>
                                <td><?= htmlspecialchars($acc['BK_ROOM_NUM']) ?></td>
                                <td><?= htmlspecialchars($acc['BK_PAYMENT_STATUS']) ?></td>
                                <td><?= htmlspecialchars($acc['BK_CLIENT_LASTNAME']) ?></td>
                                <td><?= htmlspecialchars($acc['BR_AMOUNT']) ?></td>
                                <td><?= htmlspecialchars($acc['BK_CHECKIN']) ?></td>
                                <td><?= htmlspecialchars($acc['BK_CHEKOUT']) ?></td>
                                <td><?= htmlspecialchars($acc['BK_ROOM_NUM']) ?></td>
                                <td><?= htmlspecialchars($acc['BR_REMARK']) ?></td>
                                <td><?= htmlspecialchars($acc['BR_DURATION']) ?></td>
                                <td></td>
                                <td><?= date("m/d/Y", strtotime($acc['CREATEDDATE'])) ?></td>
                            </tr>
                            <?php
                            $n++;
                        }
                    } else {
                        echo '<tr><td colspan="14" class="text-center">No Records Found</td></tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
