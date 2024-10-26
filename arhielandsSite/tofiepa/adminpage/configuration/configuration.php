<?php

/**
###################################################
### This file contains database server settings ###
###################################################
 **/
$engine    = "mysqli";
$server    = "localhost";
$username  = "bharani";
$password  = "Password";
$database  = "tofiepa";


$conn = new mysqli($server, $username, $password, $database);

if ($conn->connect_error) {
    die("Database connection failed. Check credentials or server status.");
} else {
    echo "Connected successfully"; 
}

