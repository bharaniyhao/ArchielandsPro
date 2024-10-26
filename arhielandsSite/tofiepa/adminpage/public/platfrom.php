<!-- <php include("controller.php"); --
// include "config.php";
// -->
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Include necessary meta tags, CSS, and scripts -->
    <!-- For example: -->
    <meta charset="UTF-8">
    <title> Tofiepa | Dashboard </title>
    <!-- Include your CSS and JS files -->
    <!-- Include your CSS and JS files -->
    <!-- Bootstrap, Font Awesome, etc. -->
    <!-- Required meta tags -->
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="assets/vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="assets/images/tofiepa.png" />
    <!-- Example Bootstrap CSS inclusion -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
    <!-- Example Font Awesome inclusion -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> 
</head>
<!-- <php
$fullname = $actordetails->USR_OTHERNAME . ' ' . $actordetails->USR_SURNAME; --

// include("controller.php");-->
<body>
    <div class="container-scroller">
          <button id="bannerClose" class="btn border-0 p-0">
                <i class="mdi mdi-close text-white me-0"></i>
              </button>
        <!-- Navbar section -->
        <?php include('partials/navbar.php'); ?>
        <?php include('partials/sidebar.php'); ?>

        <!-- Main content section -->
        <!-- <div class="container"> -->
              <form name="myform" id="myform" method="post" action="#" data-toggle="validator" role="form" enctype="multipart/form-data" autocomplete="off">
                 <input type="hidden" value="<?php echo $keys; ?>" name="keys" id="keys" />
                <input type="hidden" value="<?php echo $photo; ?>" name="img" id="img" />
                <input type="hidden" value="<?php echo $photo2; ?>" name="imgs" id="imgs" />
                <input type="hidden" value="<?php echo $viewpage; ?>" name="viewpage" id="viewpage" /> 
                <input id="view" name="view" value="" type="hidden" />
                <input id="viewpage" name="viewpage" value="" type="hidden" />
                <input id="keys" name="keys" value="<?php echo (!empty($keys) ? $keys : ''); ?>" type="hidden" />
                <input id="action_search" name="action_search" value="" type="hidden" />
                <input id="microtime" name="microtime" value="<?php echo md5(microtime()); ?>" type="hidden" />
                <!-- START PAGE CONTENT-->
            <?php  
            // $page = isset($_GET['page']) ? $_GET['page'] : 'home';
        //   $doctordetails = $engine->getActorDetails();
           
switch (strtolower($pg)) {
    case 'settings':
        include('settings/platform.php');
        break;
    case 'users':
        include('users/platform.php');
        break;
    case 'products':
        include('products/platform.php');
        break;
    default:
        include('dashboard/platform.php');
        break;
            }
            ?>
              <?php include('partials/footer.php'); ?>
        </div>
        <!-- Footer section -->
    <!-- </div> -->
       </body> 
  <!-- Include necessary scripts -->
    <!-- Example Bootstrap JS inclusion -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Your other scripts -->

    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/Chart.min.js"></script>
    <script src="assets/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
    <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="assets/js/dashboard.js"></script>
    <!-- End custom js for this page -->
<script>
    <?php if (isset($msg, $status)) { ?>
        showToastr(`<?= $status ?>`, `<?= $msg ?>`);
    <?php } ?>
</script>

