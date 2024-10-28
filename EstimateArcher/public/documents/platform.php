<?php

switch (strtolower($option)) {

    case md5("documents"):
        include("documents/platform.php");
        break;

    case md5("patients"):
        include("patients/platform.php");
        break;

}
