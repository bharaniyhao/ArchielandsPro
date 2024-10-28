<?php
include("controller.php");

switch (strtolower($view)) {
    case "treat":
        include("view/add.php");
        break;
    case "details":
        include("view/details.php");
        break;
        
    default:
        include("view/treat.php");
        break;
}
