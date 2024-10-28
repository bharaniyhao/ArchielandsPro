<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include("controller.php");

switch (strtolower($target)) {
    case "addpatient":
        include("view/addpatient.php");
        break;

    case "editpatient":
        include("view/edit.php");
        break;
    case "details":
        include("view/details.php");
        break;

    default:
        include("view/mpatient.php");
        break;
}