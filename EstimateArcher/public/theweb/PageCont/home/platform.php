<?php
include("controller.php");

switch (strtolower($target)) {
    case "add":
        include("view/add.php");
        break;
    case "details":
        include("view/details.php");
        break;
    default:
        include("view/home.php");
        break;
}
