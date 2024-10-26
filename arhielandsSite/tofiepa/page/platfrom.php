<?php
$fullname = $actordetails->USR_OTHERNAME . ' ' . $actordetails->USR_SURNAME;
include("controller.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Include necessary meta tags, CSS, and scripts -->
    <!-- For example: -->
    <meta charset="UTF-8">
    <title> Tofiepa | Home </title>
    <!-- Include your CSS and JS files -->
    <!-- Bootstrap, Font Awesome, etc. -->

    <!-- Example Bootstrap CSS inclusion -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
    <!-- Example Font Awesome inclusion -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> 
</head>
<body>
    <div class="container-scroller">
        <!-- Navbar section -->
        <?php include('partials/navbar.php'); ?>

        <!-- Main content section -->
      <div class="container-scroller">
        <!-- Navbar section -->
        <?php include('partials/navbar.php'); ?>
       <?php include('partials/slide.php'); ?>
        <!-- Main content section -->
        <!-- <div class="container"> -->
             <?php
            $page = isset($_GET['page']) ? $_GET['page'] : 'home';

            switch ($page) {
                case 'home':
                    include 'page/home.php';
                    break;
                case 'about':
                    include 'page/about.php';
                    break;
                case 'buy':
                    include 'page/buy.php';
                    break;
                case 'propertyDetails':
                    include 'page/propertyDetails.php';
                    break;
                case 'properties':
                    include 'page/properties.php';
                    break;
                case 'services':
                    include 'page/services.php';
                    break;
                case 'contact':
                    include 'page/contact.php';
                    break;
                default:
                case'home':
                    include 'page/home.php';
                    break;
            }
            ?>
        <!-- </div> -->
        <!-- Footer section -->
        <?php include_once 'Partials/footer.php'; ?>
    </div>

</body>
</html>
