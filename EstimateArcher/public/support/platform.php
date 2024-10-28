<?php
include("controller.php");

switch (strtolower($view)) {
    case "add":
        include("view/cust.php");
        break;
    default:
        include("view/add.php");
        break;
}
