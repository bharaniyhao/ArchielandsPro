<?php
include("controller.php");

switch (strtolower($view)) {
    case "financial":
        include("view/add.php");
        break;
        
    default:
        include("view/moni.php");
        break;
}
