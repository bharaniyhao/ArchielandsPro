<?php
include("controller.php");

switch (strtolower($view)) {
    case "patient":
        include("view/add.php");
        break;
        case "details":
        include("view/details.php");
        break;
    default:
        include("view/patient.php");
        break;
}