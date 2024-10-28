<?php
include("controller.php");

switch (strtolower($view)) {
    case "therapy":
        include("view/add.php");
        break;
        
    default:
        include("view/therapy.php");
        break;
}
