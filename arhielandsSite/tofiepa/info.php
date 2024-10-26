<?php
include "config.php";
include SPATH_LIBRARIES.DS."engine.Class.php";
include SPATH_LIBRARIES.DS."smsgetway.class.php";

$engine = new engineClass();
$smsgetway = new smsgetway();
$crypt = new cryptCls();

include("page/platform.php");

?>