<?php
   error_reporting(E_ALL);
ini_set('display_errors', 1);

switch (strtolower($option)) {
    case md5("objective"):
        include("objective/platform.php");
        break;

    case md5("managefacilities"):
        include("managefacilities/platform.php");
        break;
        case md5("managefacil"):
        include("managefacili/platform.php");
        break;


    case md5("PageCont"):
        include("home/platform.php");
        break;

    case md5("slides"):
        include("slides/platform.php");
        break;
}
