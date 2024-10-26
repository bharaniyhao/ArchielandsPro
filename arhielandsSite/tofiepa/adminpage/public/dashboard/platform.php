<?php
include("controller.php");

switch (strtolower($target)) {
    default:
        include("view/dashboard.php");
        break;
}
