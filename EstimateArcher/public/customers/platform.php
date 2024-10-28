<?php
include("controller.php");

switch (strtolower($target)) {
    case md5("customers"):
        include("view/add.php");
        break;
    default:
        include("view/cust.php");
        break;
}
