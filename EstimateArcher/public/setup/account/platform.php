<?php
include("controller.php");

switch (strtolower($view)) {
    case "patient":
        include("view/add.php");
        break;
        case "editpatient":
        include("view/edit.php");
        break;
    default:
        include("view/patient.php");
        break;
}