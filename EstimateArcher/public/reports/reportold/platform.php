<?php
include("controller.php");
switch(strtolower($target)){
    // case "report":
    //      include("view/viewreport.php");
    // break;

    default:
        include("view/viewreport.php");
    break; 
    
}
?>