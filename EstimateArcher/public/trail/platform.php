<?php
include("controller.php");

switch (strtolower($view)) {
    case "trail":
        include("view/add.php");
        break;
        
    default:
        include("view/trail.php");
        break;
}
