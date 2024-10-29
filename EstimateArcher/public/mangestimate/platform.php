<?php

switch (strtolower($option)) {
    case md5("estimatelist"):
        include("estimatelist/platform.php");
        break;

    case md5("approved"):
        include("approved/platform.php");
        break;

    case md5("pending"):
        include("pending/platform.php");
        break;

    case md5("cancelled"):
        include("cancelled/platform.php");
        break;
}
