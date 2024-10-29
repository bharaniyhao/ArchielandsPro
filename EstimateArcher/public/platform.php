<!DOCTYPE html>
  <?php
// $actorid = $session->get('userid');

// $stmt = $sql->Execute($sql->Prepare("SELECT * FROM tofiepa_users  WHERE USR_CODE = " . $sql->Param('a') . " "), array($actorid));
// $objuser = $stmt->FetchNextObject();
// $username = $objuser->USR_OTHERNAME . " " . $objuser->USR_SURNAME;
?>

<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title> ARCHER GROUP | Dashboard</title>
    <!-- GLOBAL MAINLY STYLES-->

  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5+zP1t69Jw7ib57swWA+79jG16a5PapKVXCbHIu5" crossorigin="anonymous"> -->

<!-- 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
    <link href="media/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="media/assets/js/jquery.min.js"></script>

    <link href="media/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="media/assets/vendors/line-awesome/css/line-awesome.min.css" rel="stylesheet" />
    <link href="media/assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
    <link href="media/assets/vendors/animate.css/animate.min.css" rel="stylesheet" />
    <link href="media/assets/vendors/toastr/toastr.min.css" rel="stylesheet" />
    <link href="media/assets/vendors/bootstrap-sweetalert/dist/sweetalert.css" rel="stylesheet" />
    <link href="media/assets/libs/sweetalert2/sweetalert2.min.css"/>
    <link href="media/assets/libs/sweet-modal/dist/min/jquery.sweet-modal.min.css"/>
    <!-- <link href="./media/assets/libs/sweetalert2/sweetalert2.min.css"/> -->


    <!-- PLUGINS STYLES-->
    <!-- THEME STYLES-->
    <link href="media/assets/css/main.css" rel="stylesheet" />
    <link href="media/assets/css/remstyle.css" rel="stylesheet" />
    <link href="media/assets/css/tree.css" rel="stylesheet" />
    <link href="media/assets/css/coord.css" rel="stylesheet" />
    <!-- <link href="assets/css/style.min.css" rel="stylesheet" /> -->
    <!-- PAGE LEVEL STYLES-->
</head>

<body class="fixed-navbar">
    <div class="page-wrapper">
        <?php include "patials/header.php"; ?>
        <!-- START SIDEBAR-->
        <?php include "patials/sidebar.php"; ?>
        <!-- END SIDEBAR-->
        <div class="wrapper content-wrapper">

               <form name="myform" id="myform" method="post" action="#" data-toggle="validator" role="form" enctype="multipart/form-data" autocomplete="off">
                <!-- <input type="hidden" value="<php echo $keys; ?>" name="keys" id="keys" /> -->
                      <!-- <input type="hidden" value="" name="keys" id="keys" />  -->
                <!-- <input type="hidden" value="<?php echo $photo; ?>" name="img" id="img" /> -->
                <!-- <input type="hidden" value="<?php echo $photo2; ?>" name="imgs" id="imgs" /> -->
                 <!-- <input type="text" value="" name="viewpage" id="viewpage" />
    <input type="text" value="" name="target" id="target" /> -->
    <input type="hidden" value="" name="monthinput" id="monthinput" />
                <input type="hidden" name="status" id="status" />
                <input type="hidden" name="fromdate" id="fromdate" />
                <input type="hidden" name="todate" id="todate" />
    <input type="hidden" value="" name="ukeys" id="ukeys" />
    <input type="hidden" value="" name="yearinput" id="yearinput" />
    <input type="hidden" value="" name="monthinput" id="monthinput" />
                <input type="hidden" name="nstatus" id="nstatus" />
                <input type="hidden" name="nfromdate" id="nfromdate" />
                <input type="hidden" name="ntodate" id="ntodate" />
                <input type="hidden" value="" id="view" name="view" />
                <input type="hidden" value="" id="target" name="target" />
                <input type="hidden" value="<?php echo !empty($keys)
                    ? $keys
                    : ""; ?>" id="viewpage" name="viewpage" />
                <!-- <input type="hidden" value="<php echo !empty($keys)
                    ? $keys
                    : ""; ?>" name="keys" id="keys" /> -->
                <input type="hidden" value="" name="pwd" id="pwd" />
                <input type="hidden" value=""  name="action_search" id="action_search"  />
                <input type="hidden" name="imag_url" id="imag_url" accept="image/*" >

                <input type="hidden" value="<?= bin2hex(
                    random_bytes(16)
                ) ?>" id="random_token" name="random_token">
                <!-- <input type="hidden" value="<php echo md5(microtime()); ?>"  name="microtime" id="microtime"  /> -->
                <!-- <input type="hidden" value="<php echo md5(microtime()); ?>" name="action_key" id="action_key" /> -->


                <!-- START PAGE CONTENT-->
                <?php switch (strtolower($pg)) {
                    case md5("theweb"):
                        include "theweb/platform.php";
                        break;
                    case md5("rooms"):
                        include "rooms/platform.php";
                        break;
                    case md5("monitoring"):
                        include "monitoring/platform.php";
                        break;
                    case md5("Utilites"):
                        include "utilities/platform.php";
                        break;
                    case md5("estimate"):
                        include "Estimate/platform.php";
                        break;
                    case md5("account"):
                        include "account/platform.php";
                        break;
                    case md5("treatment"):
                        include "mngeUser/platform.php";
                        break;
                    case md5("documents"):
                        include "documents/platform.php";
                        break;
                    case md5("monitoring"):
                        include "monitoring/platform.php";
                        break;
                    case md5("assessment"):
                        include "mangestimate/platform.php";
                        break;
                    case md5("channel"):
                        include "communication/platform.php";
                        break;
                    case md5("PageCont"):
                        include "PageCont/platform.php";
                        break;
                    case md5("reports"):
                        include "reports/platform.php";
                        break;
                    case md5("profile"):
                        include "profile/platform.php";
                        break;
                    case md5("settings"):
                        include "setup/platform.php";
                        break;
                    default:
                        include "dashboard/platform.php";
                        break;
                } ?>
                <?php
// include('dashboard/view/dashboard.php')
?>
                <!-- END PAGE CONTENT-->
                <?php include "patials/footer.php"; ?>
        </div>
    <!-- </div> -->


    <!-- BEGIN PAGA BACKDROPS-->

    <!-- END PAGA BACKDROPS-->
    <!-- Session-timeout modal-->
    <div class="modal fade" id="session-dialog">
        <div class="modal-dialog" style="width:400px;" role="document">
            <div class="modal-content">
                <div class="modal-header bg-silver-100">
                    <h4 class="modal-title">AUTOLOGOUT</h4>
                    <button class="close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="text-center m-b-20"><i class="ti-lock" style="font-size:90px"></i></div>
                    <p class="text-center m-b-20">You are about to be signed out due to inactivity.</p>
                    <div id="timeout-reset-box" style="display:none;">
                        <div class="form-group"><button class="btn btn-danger btn-block" id='timeout-reset'>Deactivate</button></div>
                    </div>
                    <div id="timeout-activate-box">
                        <div class="form-group">
                            <label>Minutes</label>
                            <input class="form-control" type="text" placeholder="Minutes" id="timeout-count">
                        </div>
                        <div class="form-group"><button class="btn btn-success btn-block" id='timeout-activate'>Activate</button></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Session-timeout modal-->
    <!-- CORE PLUGINS-->
    <script src="media/assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <script src="media/assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
    <script src="media/assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="media/assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
    <script src="media/assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="media/assets/vendors/jquery-idletimer/dist/idle-timer.min.js" type="text/javascript"></script>
    <script src="media/assets/vendors/toastr/toastr.min.js" type="text/javascript"></script>
    <script src="media/assets/vendors/bootstrap-sweetalert/dist/sweetalert.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL PLUGINS-->
    <script src="media/assets/vendors/chart.js/dist/Chart.min.js" type="text/javascript"></script>
    <script src="media/assets/vendors/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js" type="text/javascript"></script>
    <!-- CORE SCRIPTS-->
    <script src="media/assets/js/app.js" type="text/javascript"></script>
    <script src="media/assets/js/main.js" type="text/javascript"></script>
    <script src="media/assets/js/waves.js" type="text/javascript"></script>
    <script src="media/assets/js/custom.min.js" type="text/javascript"></script>
    <script src="media/assets/libs/flot/excanvas.js"></script>
    <script src="media/assets/libs/flot/jquery.flot.js"></script>
    <script src="media/assets/libs/flot/jquery.flot.pie.js"></script>
    <script src="media/assets/libs/flot/jquery.flot.time.js"></script>
    <script src="media/assets/libs/flot/jquery.flot.stack.js"></script>
    <script src="media/assets/libs/flot/jquery.flot.crosshair.js"></script>
    <script src="media/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>

    <!-- PAGE LEVEL SCRIPTS-->
    <script src="media/assets/js/scripts/dashboard_3_demo.js" type="text/javascript"></script>
    <link rel="stylesheet" href="media/assets/libs/sweet-modal/dist/min/jquery.sweet-modal.min.css" />
    <script src="media/assets/libs/sweet-modal/dist/min/jquery.sweet-modal.min.js"></script>
    <!-- <script src="media/assets/libs/sweetalert2/sweetalert2.min.js"></script> -->

    <!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> -->

    

    <!-- Place this snippet where you include your JavaScript -->
    <script>
        <?php if (isset($msg, $status)) { ?>
            showToastr(`<?= $status ?>`, `<?= $msg ?>`);
        <?php } ?>
    </script>

</body>

</html>

<script>
    $("#logout").click(function() {
        Swal.fire({
            title: "Are you sure?",
            text: "You want to logout of the system?",
            type: "warning",
            showCancelButton: !0,
            confirmButtonColor: "#31cb72",
            cancelButtonColor: "#ff5b5b",
            confirmButtonText: "Logout!"
        }).then(function(t) {
            console.log(t.value);
            if (t.value === true) {
                window.location.href = 'index.php?action=logout';
            }
        });
    });

    function confirmSubmit(title, icon = 'warning', message, confirmbtn, action, key) {
        Swal.fire({
            title: title,
            text: message,
            type: icon,
            showCancelButton: true,
            confirmButtonColor: '',
            confirmButtonText: confirmbtn,
            closeOnConfirm: false
        }).then((result) => {
            if (result.value) {
                document.getElementById('viewpage').value = action;
                document.getElementById('keys').value = key;
                document.myform.submit();
            }
        });
    }

    function confirmSubmitBene(title, icon = 'warning', message, confirmbtn, action, key) {
        Swal.fire({
            title: title,
            text: message,
            type: icon,
            showCancelButton: true,
            confirmButtonColor: '',
            confirmButtonText: confirmbtn,
            closeOnConfirm: false
        }).then((result) => {
            if (result.value) {
                document.getElementById('viewpage').value = action;
                document.getElementById('mkeys').value = key;
                document.myform.submit();
            }
        });
    }


    function rejectSubmit(title, icon = 'warning', message, confirmbtn, action, key) {
        Swal.fire({
            title: title,
            type: icon,
            text: message,
            input: 'text',
            showCancelButton: true,
            confirmButtonText: confirmbtn,
            inputValidator: (value) => {
                return !value && 'Please fill out this field.'
            }
        }).then((result) => {
            if (result.value) {
                var inp = result.value;
                document.getElementById('viewpage').value = action;
                document.getElementById('keys').value = key;
                document.getElementById('reason').value = inp;
                document.myform.submit();
            }
        });
    }

    function approveSubmit(title, icon = 'warning', message, confirmbtn, action, key) {
        Swal.fire({
            title: title,
            type: icon,
            text: message,
            input: 'text',
            showCancelButton: true,
            confirmButtonText: confirmbtn,
            inputValidator: (value) => {
                return !value && 'Please fill out this field.'
            }
        }).then((result) => {
            if (result.value) {
                var inp = result.value;
                document.getElementById('viewpage').value = action;
                document.getElementById('keys').value = key;
                document.getElementById('reason').value = inp;
                document.myform.submit();
            }
        });
    }

    function throwError(title, icon = 'warning', message) {
        Swal.fire({
            title: title,
            text: message,
            type: icon,
            showCancelButton: false,
            // confirmButtonColor: '',
            // confirmButtonText: confirmbtn,
            // closeOnConfirm: false
        })
        // .then((result)=>{
        //     if(result.value){
        //         document.getElementById('viewpage').value=action;
        //         document.getElementById('keys').value=key;
        //         document.myform.submit();
        //     }
        // });
    }


    function Terminate(title, icon = 'warning', message, confirmbtn, action, key) {
        Swal.fire({
            title: title,
            type: icon,
            text: message,
            input: 'text',
            showCancelButton: true,
            confirmButtonText: confirmbtn,
            inputValidator: (value) => {
                return !value && 'Please fill out this field.'
            }
        }).then((result) => {
            if (result.value) {
                var inp = result.value;
                document.getElementById('viewpage').value = action;
                document.getElementById('keys').value = key;
                document.getElementById('reason').value = inp;
                document.myform.submit();
            }
        });
    }



    function confirmSubmitCusto(title, icon = 'warning', message, confirmbtn, action, key) {
        Swal.fire({
            title: title,
            text: message,
            type: icon,
            showCancelButton: true,
            confirmButtonColor: '',
            confirmButtonText: confirmbtn,
            closeOnConfirm: false
        }).then((result) => {
            if (result.value) {
                document.getElementById('viewpage').value = action;
                document.getElementById('mkeys').value = key;
                document.myform.submit();
            }
        });
    }

    function confirmSubmitTrust(title, icon = 'warning', message, confirmbtn, action, key) {
        Swal.fire({
            title: title,
            text: message,
            type: icon,
            showCancelButton: true,
            confirmButtonColor: '',
            confirmButtonText: confirmbtn,
            closeOnConfirm: false
        }).then((result) => {
            if (result.value) {
                document.getElementById('viewpage').value = action;
                document.getElementById('mkeys').value = key;
                document.myform.submit();
            }
        });
    }


    function confirmSubmitFund(title, icon = 'warning', message, confirmbtn, action, key) {
        Swal.fire({
            title: title,
            text: message,
            type: icon,
            showCancelButton: true,
            confirmButtonColor: '',
            confirmButtonText: confirmbtn,
            closeOnConfirm: false
        }).then((result) => {
            if (result.value) {
                document.getElementById('viewpage').value = action;
                document.getElementById('mkeys').value = key;
                document.myform.submit();
            }
        });
    }


    function confirmSubmitProvider(title, icon = 'warning', message, confirmbtn, action, key) {
        Swal.fire({
            title: title,
            text: message,
            type: icon,
            showCancelButton: true,
            confirmButtonColor: '',
            confirmButtonText: confirmbtn,
            closeOnConfirm: false
        }).then((result) => {
            if (result.value) {
                document.getElementById('viewpage').value = action;
                document.getElementById('mkeys').value = key;
                document.myform.submit();
            }
        });
    }




    function confirmSubmitAuditor(title, icon = 'warning', message, confirmbtn, action, key) {
        Swal.fire({
            title: title,
            text: message,
            type: icon,
            showCancelButton: true,
            confirmButtonColor: '',
            confirmButtonText: confirmbtn,
            closeOnConfirm: false
        }).then((result) => {
            if (result.value) {
                document.getElementById('viewpage').value = action;
                document.getElementById('mkeys').value = key;
                document.myform.submit();
            }
        });
    }


    function AddMember(title, icon = 'warning', message, confirmbtn, action, key) {
        Swal.fire({
            title: title,
            type: icon,
            text: message,
            input: 'text',
            showCancelButton: true,
            confirmButtonText: confirmbtn,
            inputValidator: (value) => {
                return !value && 'Please fill out this field.'
            }
        }).then((result) => {
            if (result.value) {
                var inp = result.value;
                document.getElementById('viewpage').value = action;
                document.getElementById('keys').value = key;
                document.getElementById('reason').value = inp;
                document.myform.submit();
            }
        });
    }
</script>


<script>
    $(document).ready(function(e) {
        /*
         * This is a dynamic search
         * on the dashboard
         *
         */
        $('.searchdash').keyup(function() {
            var dashsearch = $("#searchdash2").val();

            $.ajax({
                type: 'POST',
                url: 'public/dashboard/model/searchmodule.php',
                data: {
                    'dashsearch': dashsearch
                },
                success: function(e) {
                    if (dashsearch != '') {
                        $('.workingtable').show();
                        $('#dashidash').html(e);
                        $('.fancydash').hide();
                    } else {
                        $('.fancydash').show();
                        $('.workingtable').hide();
                    }
                },
                error: function(e) {
                    console.log(e);
                }
            });

        });
        //End dashboard search


        //to allow only numbers
        if ($('.onlynums')) {
            $('.onlynums').keydown(function(event) {

                // Allow: backspace, delete, tab, escape, and enter

                if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 || event.keyCode == 190 || event.keyCode == 110 || event.keyCode == 173 || event.keyCode == 109 || event.keyCode == 189) {
                    // let it happen, don't do anything
                    return;
                } else {
                    // Ensure that it is a number and stop the keypress
                    if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                        event.preventDefault();
                    }
                }

            });

        }

    });
</script>
    <script>
    $(document).ready(function() {
        $('.selectpicker').selectpicker();
    });
</script>
