<?php
include("controller.php");

switch (strtolower($view)) {
    case "discharge":
        include("view/add.php");
        break;
        
    default:
        include("view/discharge.php");
        break;
}
