<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include("controller.php");

switch (strtolower($target)) {
    case "appoint":
        include("view/add.php");
        break;
    case "reschedule":
        include("view/reschedule.php");
        break;
        case "details":
        include("view/details.php");
        break;
    default:
        include("view/room.php");
        break;
}

