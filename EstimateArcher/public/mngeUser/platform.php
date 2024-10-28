<?php

switch (strtolower($option)) {

    case md5("treatmentPlan"):
        include("treatmentPlan/platform.php");
        break;

    case md5("treatment"):
        include("treatment/platform.php");
        break;

}
