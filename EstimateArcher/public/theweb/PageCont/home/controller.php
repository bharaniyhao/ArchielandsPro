<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
$crypt = new cryptCls();
$actorid = $session->get('userid');
$actualdate = date("Y-m-d");

global $uname, $pwd, $dob,$email,$phonenumber, $lastname, $firstname,$othername, $fname,$patientID, $gender,$lname, $phoneno,$symptoms, $emgno,$address, $status,$imag_url, $email,$swimmingPool,$picture, $inputbranch,$Marital,$occup, $inputlevel, $accstatus,$pstatus, $patientID, $firstname, $testimonial, $dob,$aboutUs, $ourMission, $ourVision,$carPark,$events,$happyChildren,$fundRaised, $img, $phonenumber, $currentcondition, $address, $symptoms;

switch($viewpage){
	case "details":
	
     if(!empty($keys)){ 
		 $stmt = $sql->Execute($sql->Prepare("SELECT * FROM PageCont WHERE ID = ".$sql->Param('a')." "),array($keys));
		if($stmt && !empty($stmt->RecordCount() > 0) ){
		$details = $stmt->FetchNextObject();
		$aboutUs = $details->ABOUTUS ;
		$sportsClub = $details->OURMISSION ;
        $swimmingPool = $details->OURVISION ;
        $gym = $details->YEARSEXPERIENCE ;
		$carPark = $details->EVENTS ;
		$testimonial = $details->TESTIMONIAL ;
		$conbody = $details->FUNDRAISED ;
		$restaurant = $details->IMAG_URL ;
		// $restaurant = $details->IMAG_URL ;
		// $restaurant = $details->IMAG_URL ;
		$picture = $details->CONTENTBODY ;
		// print_r($details);

		}
	}

break;

case "saveabout":
    print_r($_POST);
    print_r($_FILES); // Debugging line to check file upload details

    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        if (empty($aboutUs) || empty($conbody)) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = 'save';
        } else {
           // Handle file upload and convert to BLOB if necessary
                    $targetFile = $img; // Default value if no new image is uploaded
                    if (isset($_FILES['img']) && $_FILES['img']['error'] == 0) {
                        $image = $_FILES['img']['tmp_name'];
                        if (!empty($image)) {
                            $data = file_get_contents($image);
                            if (!empty($data)) {
                                $targetFile = $data;
                            }
                        }
                    }

            // Check if record already exists
            if (!empty($keys)) {
                $sql->Execute($sql->Prepare("UPDATE PageCont SET YearsExperience = " . $sql->Param('d') . ", Events = " . $sql->Param('e') . ", HappyChildren = " . $sql->Param('f') . ", FundRaised = " . $sql->Param('g') . ", imag_url = " . $sql->Param('h') . " WHERE AboutUs = " . $sql->Param('a') . " AND OurMission = " . $sql->Param('b') . " AND OurVision = " . $sql->Param('c')),
                    array($aboutUs, $restaurant, $sportsClub, $swimmingPool, $carPark, $bar, $gym, $picture, $conbody));
                print $sql->ErrorMsg();
            } else {
                // Insert new record
                $sql->Execute($sql->Prepare("INSERT INTO PageCont (AboutUs, OurMission, OurVision, YearsExperience, Events, HappyChildren, FundRaised, Testimonial, imag_url, ContentBody) VALUES (" . $sql->Param('a') . "," . $sql->Param('b') . "," . $sql->Param('c') . "," . $sql->Param('d') . "," . $sql->Param('e') . "," . $sql->Param('f') . "," . $sql->Param('g') . "," . $sql->Param('h') . "," . $sql->Param('i') . "," . $sql->Param('j') . ")"),
                        array($aboutUs, $restaurant, $sportsClub, $swimmingPool, $carPark, $bar, $gym, $testimonial, $picture, $conbody));
                print $sql->ErrorMsg();
            }

            $msg = "Information saved successfully.";
            $status = "success";
            $view = "";
            $activity = 'Information ' . $aboutUs . ' ' . $ourVision . ' added.';
            $engine->setEventLog("022", $activity);
        }
    }
    break;  
	case "deleteCon":
        if(!empty($keys)){
			$stmtpass = $sql->Execute($sql->Prepare("SELECT CONTENTBODY FROM PageCont WHERE ID = ".$sql->Param('b')." "),array($keys));
			$obj = $stmtpass->FetchNextObject();
			$inputuname = $obj->CONTENTBODY ;
			
			$sql->Execute("UPDATE PageCont SET PageContStatus = '0' WHERE ID = ".$sql->Param('f')." ", array($keys));
			print $sql->ErrorMsg();	

			$msg = "User updated successfully.";
			$status = "success";

			$activity = 'User with username '.$inputuname.' deleted ';
			$engine->setEventLog("006",$activity);
		}
	break;

	case "reset":
		$fdsearch = "";
	break;
}

//Get all users
if (empty($fdsearch)) {

	$query = "SELECT * FROM PageCont WHERE PageContStatus IN ('1','2') ORDER BY AboutUs ASC";
	$input = array();
} else {

	$query = "SELECT * FROM PageCont WHERE PageContStatus IN ('1','2') AND ( AboutUs LIKE " . $sql->Param('a') . " OR AboutUs LIKE " . $sql->Param('b')  . " ) ORDER BY AboutUs ASC";
	$input = array($fdsearch . "%", $fdsearch . "%", $fdsearch . "%");
}

//Fetch branches 
if (!isset($limit)) {
	$limit = $session->get("limited");
} else if (empty($limit)) {
	$limit = 20;
}

$session->set("limited", $limit);
$lenght = 10;
$paging = new OS_Pagination($sql, $query, $limit, $lenght,$input, 'action=index&pg=2e5d8aa3dfa8ef34ca5131d20f9dad51&option=6831b98f85019ddb98bd98d44bdbac40');
//Get All Branches
// $stmbr = $engine->getAllBranch();
//Get All Level
// $stmbl = $engine->getAllLevel();

