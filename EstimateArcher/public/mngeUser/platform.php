<?php

switch (strtolower($option)) {

    case md5("tanent"):
        include("tanent/platform.php");
        break;

    case md5("clients"):
        include("clients/platform.php");
        break;

}
