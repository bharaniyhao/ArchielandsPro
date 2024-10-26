<?php
// Initialize your session, database connection, and any necessary functions.
require_once 'inc/session.php';
require_once 'inc/db.php';
require_once 'inc/functions.php';

// Define the base URL for the site (adjust this as needed).
$base_url = 'http://localhost/waystudio/arhielandsSite/Travel-&-Tourism/';

// Define the requested URL.
$request_uri = $_SERVER['REQUEST_URI'];
$script_name = $_SERVER['SCRIPT_NAME'];
$base = dirname($script_name);

// Remove the base directory from the request URI.
if ($base !== '/' && strpos($request_uri, $base) === 0) {
    $request_uri = substr($request_uri, strlen($base));
}

// Break the request URI into parts.
$uri_parts = explode('?', $request_uri);

// Define the available pages and routes.
$routes = [
    '' => 'pages/index.php',
    'contact' => 'pages/contact.php',
    'about' => 'pages/about.php',
    'package' => 'pages/package.php',
    'singlepackage' => 'pages/singlepackage.php',
    'linepackage' => 'pages/linepackage.php',
    'blog' => 'pages/blog.php',
    'contact' => 'pages/contact.php',
    'contact' => 'pages/contact.php',
    'contact' => 'pages/contact.php',
    'booking-confirmation' => 'pages/booking_confirmation.php',
    'admin' => 'admin/index.php',
    'user' => 'user/index.php',
];

// Get the requested page from the URL.
$page = $uri_parts[0];

// Check if the requested page exists in the routes array.
if (array_key_exists($page, $routes)) {
    include $routes[$page];
} else {
    // If the requested page does not exist, display the website's home page.
    include 'pages/index.php';
}
