<?php
include('controller.php');
    switch($views){
		case "addnote":
		   include "views/add_note.html";
		break;
        default:
            include "views/dash.php";
        break;
    }
?>