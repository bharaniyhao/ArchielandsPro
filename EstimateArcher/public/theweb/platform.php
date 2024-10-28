<?php

switch (strtolower($option)) {

    case md5("managefacilities"):
        include("facility/platform.php");
        break;

    case md5("facility"):
        include("facility/platform.php");
        break;
        case md5("PageCont"):
        include("PageCont/platform.php");
        break;

}
