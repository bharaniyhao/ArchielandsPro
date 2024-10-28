<?php
include("controller.php");

switch (strtolower($view)) {
    case "prog":
        include("view/add.php");
        break;
        case "details":
        include("view/details.php");
        break;
    default:
        include("view/progress.php");
        break;
}