<?php
require_once('inc/config.php');
require_once('inc/db.php');
// session_start();

include('inc/header.php');

$request_uri = $_SERVER['REQUEST_URI'];

switch ($request_uri) {
    case '/':
        include('pages/home.php');
        break;
    case '/products':
        include('pages/products.php');
        break;
    case '/product-details':
        include('pages/product_details.php');
        break;
    case '/cart':
        include('pages/cart.php');
        break;
    case '/checkout':
        include('pages/checkout.php');
        break;
    case '/order-history':
        include('pages/order_history.php');
        break;
    // More routes...

    default:
        http_response_code(404);
        include('pages/404.php');
        break;
}

include('inc/footer.php');
