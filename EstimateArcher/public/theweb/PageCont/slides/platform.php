<?php
include("controller.php");

switch (strtolower($target)) {
    case "slides":
        include("view/add.php");
        break;
        case "details":
        include("view/details.php");
        break;
    default:
        include("view/slides.php");
        break;
}