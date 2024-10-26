<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> Admin | Login </title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.png" />
  </head>
  <body>
         <?php if (isset($attempt_in)) { ?>
            <div class="alert-danger">
                <?php
                if ($attempt_in < 3) {
                    $msg =  'Invalid user name or password.';
                } else if ($attempt_in == '11') {
                    $msg = 'Invalid Code entered.';
                } else if ($attempt_in == '120') {
                    $msg = 'Suspended account.';
                } else if ($attempt_in == '140') {
                    $msg = 'Locked. Wait for 5min and try again.';
                } else if ($attempt_in == '110') {
                    $msg = 'User account locked.';
                }
                ?>
            </div>
        <?php } ?>
        <?php
        // $this->connect = $conn; //echo (($msg)) ? '<div>' . $msg . '</div>' : ''; 
        ?>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5">
                <div class="brand-logo">
                  <img src="assets/images/tofiepa.png">
                </div>
                <h4>Hello! Welcome Back</h4>
                <h6 class="font-weight-light">Sign in to continue.</h6>
                <form class="pt-3" id="login-form" action="index.php?action=index&pg=1" method="post" enctype="application/x-www-form-urlencoded" autocomplete="off">
                  <div class="form-group">
                    <input type="email" name= "uname" class="form-control form-control-lg"  placeholder="Username" autocomplete="off">
                  </div>
                  <div class="form-group">
                    <input type="password" name="pwd" class="form-control form-control-lg"  placeholder="Password">
                  </div>
                  <div class="mt-3">
                    <button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" >SIGN IN</button> <input type="hidden" name="doLogin" id="doLogin" value="systemPingPass" />
                  </div>
                  <div class="my-2 d-flex justify-content-between align-items-center">
                    <div class="form-check">
                      <label class="form-check-label text-muted">
                        <input type="checkbox" class="form-check-input"> Keep me signed in </label>
                    </div>
                    <a href="#" class="auth-link text-black">Forgot password?</a>
                  </div>
                 
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
     <script src="assets/js/main.js" type="text/javascript"></script>
    <?php echo (($msg)) ? '<script type="text/javascript">showToastr("error", "' . $msg . '")</script>' : ''; ?>
     <script type="text/javascript">
        $(function() {
            $('#login-form').validate({
                errorClass: "help-block",
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true
                    }
                },
                highlight: function(e) {
                    $(e).closest(".form-group").addClass("has-error")
                },
                unhighlight: function(e) {
                    $(e).closest(".form-group").removeClass("has-error")
                },
            });
        });
    </script>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <!-- endinject -->
  </body>
</html>