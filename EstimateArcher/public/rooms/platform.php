<?php

switch (strtolower($option)) {

    case md5("managerooms"):
        include("managerooms/platform.php");
        break;

    case md5("room"):
        include("room/platform.php");
        break;

}
