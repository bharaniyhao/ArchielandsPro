<?php
require_once('inc/db.php');

// Site URL
define('SITE_URL', 'http://localhost/proje/arhielandsSite/ArchieSite/'); // Base URL of your site

// Paths
define('INCLUDES_PATH', __DIR__ . '/inc/'); // Path to the includes directory
define('ASSETS_PATH', __DIR__ . '/assets/');     // Path to the assets directory
define('CONTROLLERS_PATH', __DIR__ . '/controllers/'); // Path to the controllers directory

// Other Configuration Settings
define('DEBUG_MODE', true); // Set to true during development for detailed error reporting

// Paystack API Key
define('PAYSTACK_API_KEY', 'your_paystack_api_key'); // Your Paystack API key

// Session Configuration
session_start(); // Start the session for session-based functionality

// Database Connection
$db = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
if ($db->connect_errno) {
    die("Database connection failed: " . $db->connect_error);
}
$db->set_charset('utf8mb4');

// Error Reporting and Logging
if (DEBUG_MODE) {
    error_reporting(E_ALL);
    ini_set('display_errors', '1');
} else {
    error_reporting(0);
    ini_set('display_errors', '0');
}

// Autoload Function for Classes (if using autoloading)
spl_autoload_register(function ($class_name) {
    $class_file = CONTROLLERS_PATH . $class_name . '.php';
    if (file_exists($class_file)) {
        require_once($class_file);
    }
});

// Load Additional Configuration Files
// You can include other configuration files here as needed

// Ensure secure API key handling (using environment variables, etc.) in production
