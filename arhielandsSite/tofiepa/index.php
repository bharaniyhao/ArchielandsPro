<!-- <?php


// $fullname = $actordetails->USR_OTHERNAME . ' ' . $actordetails->USR_SURNAME;
include("controller.php");
?> -->

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
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
    <!-- Example Font Awesome inclusion -->
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> -->
</head>
<body>
<div class="container-scroller">
    <?php
    include 'partials/navbar.php';
    $page = isset($_GET['page']) ? $_GET['page'] : 'home';

    $pagesWithoutSlide = ['properties', 'services', 'contact', 'about'];

    if (!in_array($page, $pagesWithoutSlide)) {
        
        include 'partials/slide.php';
    }

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
            include 'page/home.php';
            break;
    }
    ?>
</div>
     <!-- </div> -->

        <!-- Footer section -->
        <?php include_once 'partials/footer.php'; ?>
    </div>

    <!-- Include necessary scripts -->
    <!-- Example Bootstrap JS inclusion -->
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
    <!-- Your other scripts -->
