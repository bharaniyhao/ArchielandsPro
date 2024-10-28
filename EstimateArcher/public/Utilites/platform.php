<?php

switch (strtolower($option)) {

    case md5("progress"):
        include("progress/platform.php");
        break;

    case md5("patients"):
        include("patients/platform.php");
        break;

}
