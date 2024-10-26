<?php
include('controller.php');
   switch (strtolower($target)){
		// case "addnote":
		//    include "views/add_note.html";
		// break;
        default:
            include "view/settings.php";
        break;
    }
