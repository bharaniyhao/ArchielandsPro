<?php
// Start the session
session_start();


$page = isset($_GET['page']) ? $_GET['page'] : 'home';


include_once 'inc/header.php';


switch ($page) {
    case 'home':
        include '/home.php';
        break;
    case 'resources':
        include 'pages/resources.php';
        break;
    case 'volunteer':
        include 'pages/volunteer.php';
        break;
    case 'support':
        include 'pages/support.php';
        break;
    case 'gallery':
        include 'pages/gallery.php';
        break;
    case 'about':
        include 'pages/about.php';
        break;
    case 'contact':
        include 'pages/contact.php';
        break;
    case 'schools':
        include 'pages/schools.php';
        break;
    case 'partnerships':
        include 'pages/partnerships.php';
        break;
    case 'form':
        include 'pages/form.php'; 
        break;
    default:
        include 'pages/home.php';
        break;
}

// Include the footer file
include_once 'inc/footer.php';
