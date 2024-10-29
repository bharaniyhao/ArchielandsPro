<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include("controller.php");

switch (strtolower($target)) {
    case "addest":
        include("view/add.php");
        break;

    case "editcat":
        include("view/edit.php");
        break;
    case "details":
        include("view/details.php");
        break;

    default:
        include("view/list.php");
        break;
}