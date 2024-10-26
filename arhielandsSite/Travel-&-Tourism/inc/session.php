<?php
// Start a session or resume the current session.
session_start();

// Define the base URL for the site (adjust this as needed).
//$base_url = 'https://www.your-website.com/'; // Replace with your website URL.
//$base_url = 'http:localhost/waystudio/arhielandsSite/Travel-&-Tourism/pages'; // Replace with your website URL.

// Function to check if a user is logged in as a regular user.
function is_user_logged_in() {
    return isset($_SESSION['user_id']);
}

// Function to check if a user is logged in as an admin.
function is_admin_logged_in() {
    return isset($_SESSION['admin_id']);
}

// Function to log in a user as a regular user.
function login_user($user_id) {
    $_SESSION['user_id'] = $user_id;
}

// Function to log in a user as an admin.
function login_admin($admin_id) {
    $_SESSION['admin_id'] = $admin_id;
}

// Function to log out a user.
function logout() {
    session_unset();
    session_destroy();
}

// Check if a user is logged in, and if not, redirect them to the login page.
if (!is_user_logged_in() && !is_admin_logged_in()) {
    // You can adjust the URL based on your project's structure.
    header('Location: ' . $base_url . 'user/login.php');
    exit();
}
