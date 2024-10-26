<?php
$router = new Router();

// Define routes
$router->addRoute('/', 'HomeController@index');
$router->addRoute('/products', 'ProductController@index');
$router->addRoute('/product-details', 'ProductController@show');
$router->addRoute('/cart', 'CartController@index');
$router->addRoute('/checkout', 'CheckoutController@index');
$router->addRoute('/order-history', 'OrderController@index');
// More routes...

$request_uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$router->route($request_uri);
