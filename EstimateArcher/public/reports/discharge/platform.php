<?php

switch (strtolower($option)) {
    case md5("discharge"):
        include("discharge/platform.php");
        break;
    case md5("summary"):
        include("summary/platform.php");
        break;
}

