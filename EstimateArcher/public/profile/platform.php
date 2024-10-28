<?php
include("controller.php");

switch (strtolower($target)) {
    // case md5("profile"):
    //     include("view/add.php");
    //     break;
    default:
        include("view/prof.php");
        break;
}
