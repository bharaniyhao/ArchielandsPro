<?php

// error_reporting(E_ALL);
// ini_set('display_errors', 1);

include("controller.php");

switch(strtolower($target)){
    case "users":
        include("view/user.php");
        break;
    case "edit":
        include("view/editmember.php");
         break;
    case "resetpassword":
        include("view/editpassword.php");
        break;
    default:
        include("view/list.php");
        break;
}
