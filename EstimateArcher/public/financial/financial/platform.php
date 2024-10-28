<?php
include("controller.php");

switch (strtolower($view)) {
    case "financial":
        include("view/add.php");
        break;
    case "details":
        include("view/details.php");
        break;
        
    default:
        include("view/finan.php");
        break;
}
