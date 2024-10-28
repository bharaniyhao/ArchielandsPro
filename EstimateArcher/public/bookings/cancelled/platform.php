<?php
include("controller.php");

switch (strtolower($target)) {
    case "assess":
        include("view/add.php");
        break;
    case "details":
        include("view/details.php");
        break;
        
    default:
        include("view/cancelled.php");
        break;
}
