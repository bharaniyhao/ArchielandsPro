<?php
// Define your database connection parameters.
$servername = "localhost"; 
$username = "root"; 
$password = ""; 
$database = "archietour";

// Create a database connection.
$conn = new mysqli($servername, $username, $password, $database);

// Check the connection.
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Function to execute a SELECT query and fetch results as an associative array.
function execute_select_query($sql) {
    global $conn;
    $result = $conn->query($sql);
    
    if ($result && $result->num_rows > 0) {
        return $result->fetch_assoc();
    }
    
    return null;
}

// Function to execute an INSERT, UPDATE, or DELETE query.
function execute_query($sql) {
    global $conn;
    return $conn->query($sql);
}
