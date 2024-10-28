<?php
include("controller.php");

switch (strtolower($target)) {
    case "docu":
        include("view/upload.php");
        break;

    case "details":
        include("view/details.php");
        break;

    default:
        include("view/docu.php");
        break;
}