<?php
include("controller.php");

switch (strtolower($view)) {
    case "assess":
        include("view/add.php");
        break;
        case "details":
        include("view/details.php");
        break;
    default:
        include("view/diagno.php");
        break;
}