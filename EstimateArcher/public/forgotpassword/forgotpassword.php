<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Waystudio © 2024. Your favourite physiotherapist software | Forgot Password</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link href="../../media/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- THEME STYLES-->
    <link href="../../media/assets/css/main.css" rel="stylesheet" />
    <!-- PAGE LEVEL STYLES-->
    <link href="../../media/assets/css/pages/auth-light.css" rel="stylesheet" />
</head>

<body>
    <div class="content">
        <div class="brand"><a class="link" href="index.html">physioVerse</a></div>
        <form id="forgot-form" action="#" method="post">
            <h3 class="m-t-10 m-b-10">Forgot password</h3>
            <p class="m-b-20">Enter your email address below and we'll send you password reset instructions.</p>
            <div class="form-group">
                <input class="form-control" type="email" name="email" placeholder="Email" autocomplete="off">
            </div>
            <div class="form-group">
                <button class="btn btn-info btn-block" type="submit">Submit</button>
            </div>
        </form>
        <div class="font-13 text-center text-white m-t-10 m-b-10">physioVerse © <script>
                document.write(new Date().getFullYear())
            </script>. Your favourite physioVerse marketplace.</div>
    </div>
    <!-- CORE PLUGINS -->
    <script src="../../media/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL PLUGINS -->
    <script src="../../media/vendors/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL SCRIPTS-->
    <script type="text/javascript">
        $(function() {
            $('#forgot-form').validate({
                errorClass: "help-block",
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
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
</body>

</html>