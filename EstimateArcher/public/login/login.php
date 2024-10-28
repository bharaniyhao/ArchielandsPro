
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title> ESTIMATE | Login </title>
    <!-- GLOBAL MAINLY STYLES-->
    <link href="./media/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="./media/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="./media/assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
    <link href="./media/assets/vendors/toastr/toastr.min.css" rel="stylesheet" />
    <link href="./media/assets/vendors/bootstrap-sweetalert/dist/sweetalert.css" rel="stylesheet" />
    <!-- THEME STYLES-->
    <link href="./media/assets/css/main.css" rel="stylesheet" />
    <!-- PAGE LEVEL STYLES-->
    <link href="./media/assets/css/pages/auth-light.css" rel="stylesheet" />
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> ARCHER GROUP  </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <main id="main" class="bg-light">
        <div class="container-fluid">
            <div class="row vh-100">
                <div id="login-left" class="col-md-8 d-flex flex-column justify-content-center align-items-center bg-dark text-white">
                    <img src="./media/assets/img/logos/logoback.png" alt="Logo" class="img-fluid mb-4" style="max-width: 550px;">
                    <!-- <h1 class="display-4"> WAYSTUDIO </h1>
                    <p class="lead"> Tomorrow Never Wait's </p> -->
                </div>
                <div id="login-right" class="col-md-4 d-flex justify-content-center align-items-center bg-light">
                    <div class="w-100">
                        <div class="content  mt-0">
                            <?php if (isset($attempt_in)) { ?>
                                <div class="alert alert-danger text-center">
                                    <?php
                                    if ($attempt_in < 3) {
                                        $msg = 'Invalid user name or password.';
                                    } else if ($attempt_in == '11') {
                                        $msg = 'Invalid Code entered.';
                                    } else if ($attempt_in == '120') {
                                        $msg = 'Suspended account.';
                                    } else if ($attempt_in == '140') {
                                        $msg = 'Locked. Wait for 5min and try again.';
                                    } else if ($attempt_in == '110') {
                                        $msg = 'User account locked.';
                                    }
                                    echo $msg;
                                    ?>
                                </div>
                                
                            <?php } ?>
                            <div class="d-flex justify-content-center mt-1">
    <div class="col-auto justify-content-center">
        <div class="brand text-center">
            <!-- <a class="link" href="#"> -->
                <h2 class="text-warning"> ARCHER GROUP OF <span class="text-danger ml-1">COMPANY </span></h2>
            <!-- </a> -->
        </div>
    </div>
</div>

<div class="d-flex justify-content-center mt-2">
    <div class="col-md-12 mx-auto">
        <!-- <div class="card-body"> -->
            <form id="login-form" action="index.php?action=index&pg=1" method="post" enctype="application/x-www-form-urlencoded" autocomplete="off">
                <!-- <div class="text-center mt-2">
                    <span class="login-img display-4 text-info"><i class="fa fa-plus-circle"></i></span>
                </div>
                <h3 class="login-title text-center mt-2">Log in</h3> -->
                <div class="form-group">
                    <input class="form-control" type="email" name="uname" id="uname" placeholder="Username" autocomplete="off">
                </div>
                <div class="form-group">
                    <input class="form-control" type="password" name="pwd" id="pwd" placeholder="Password">
                </div>
                <div class="form-group d-flex justify-content-between">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                    </div>
                    <a href="forgot_password.html">Forgot password?</a>
                </div>
                <div class="form-group">
                    <button class="btn btn-info btn-block" type="submit">Login</button>
                    <input type="hidden" name="doLogin" id="doLogin" value="systemPingPass" />
                </div>
            </form>
            <div class="font-13 text-center text-dark mt-3 mb-3">
                Waystudio © <script>document.write(new Date().getFullYear())</script>. Your favorites Content Management  software.
            </div>
        </div>
    </div>
</div>

                        </div>
                    </div>
                </div>
    </main>
<script src="assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL PLUGINS -->
    <script src="assets/vendors/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
    <script src="assets/vendors/toastr/toastr.min.js" type="text/javascript"></script>
    <script src="assets/vendors/bootstrap-sweetalert/dist/sweetalert.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL SCRIPTS-->
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
      </main>
</body>

</html>