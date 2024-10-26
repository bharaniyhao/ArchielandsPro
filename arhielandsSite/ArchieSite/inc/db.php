<?php
// Database Configuration
define('DB_HOST', 'localhost'); // Database host (e.g., localhost)
define('DB_USER', 'root'); // Database username
define('DB_PASS', ''); // Database password
define('DB_NAME', 'archdb'); // Database name

// Create a database connection
$db = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

// Check the connection
if ($db->connect_error) {
    die("Database connection failed: " . $db->connect_error);
}

// Set UTF-8 Charset for Database
$db->set_charset('utf8mb4');
