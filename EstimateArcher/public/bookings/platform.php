<?php

switch (strtolower($option)) {
    case md5("objective"):
        include("objective/platform.php");
        break;

    case md5("approved"):
        include("approved/platform.php");
        break;

    case md5("allbooking"):
        include("allbooking/platform.php");
        break;

    case md5("cancelled"):
        include("cancelled/platform.php");
        break;
}
