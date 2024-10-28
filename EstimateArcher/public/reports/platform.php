<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
switch (strtolower($option)) {

    case md5("reports"):
        include("report/platform.php");
        break;

    case md5("booksrecords"):
        include("booksrecords/platform.php");
        break;
    case md5("reportold"):
        include("reportold/platform.php");
        break;

}
