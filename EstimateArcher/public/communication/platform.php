<?php
include("controller.php");

switch (strtolower($target)) {
    case "comm":
        include("view/add.php");
        break;
        case "message":
        include("view/chat.php");
        break;
        
        
    default:
        include("view/comm.php");
        break;
}
