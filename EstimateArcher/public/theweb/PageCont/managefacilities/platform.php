<?php
include("controller.php");

switch (strtolower($view)) {
    case "pist":
        include("view/add.php");
        break;
    case "details":
        include("view/details.php");
        break;
    case "edit":
        include("view/edit.php");
        break;
    default:
        include("view/pist.php");
        break;
}
