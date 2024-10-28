<?php

switch (strtolower($option)) {

    case md5("addestimate"):
        include("estimate/platform.php");
        break;

    case md5("category"):
        include("category/platform.php");
        break;
        // case md5("estimate"):
        // include("estimate/platform.php");
        // break;

}
