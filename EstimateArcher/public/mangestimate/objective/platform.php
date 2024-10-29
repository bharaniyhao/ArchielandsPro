<?php
include("controller.php");

switch (strtolower($view)) {
    case "assess":
        include("view/add.php");
        break;
        
    default:
        include("view/assess.php");
        break;
}
