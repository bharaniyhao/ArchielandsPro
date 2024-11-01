<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include_once ( 'model/js.php');
$crypt = new cryptCls();
$actorid = $session->get('userid');
$actorname = $session->get("loginuserfulname");
$actualdate = date("Y-m-d");
global 	$total,$PhoneNumber, $lastname, $firstname,$othername, $quantityCell,$catname, $unitPrice,$paymentDate, $phoneno,$amount, $description,$descriptionCell, $status,$EstimateName,$invoice, $email,$currentcondition,$paymentNotes, $inputbranch,$tax,$notes, $inputlevel, $accstatus,$pstatus, $firstname, $financialID,$catname, $invoiceNumber, $email, $phonenumber, $invoiceItems, $address, $paymod;

switch($viewpage){
	case "Findetails":
    if (!empty($keys)) { 
		    // print $sql->ErrorMsg();

        $stmt = $sql->Execute($sql->Prepare("SELECT * FROM Estimate WHERE id = ?"), array($keys));
        
    print $sql->ErrorMsg();
        // print_r($stmt);
        // echo"$stmt";
        // var_dump($stmt); edd

        // if ($stmt && $stmt->RecordCount() > 0) {
        //     $Financialdetails = $stmt->FetchNextObject();
        //     $transaction_id = $Financialdetails->TRANSACTION_ID;
        //     $patientID = $Financialdetails->PATIENT_ID;
        //     $total = $Financialdetails->AMOUNT;
        //     $paymentDate = $Financialdetails->TRANSACTION_DATE;
		// 	$transaction_type = $Financialdetails->TRANSACTION_TYPE ;	
		// 	$invoiceNumber = $Financialdetails->INVOICENUMBER ;	
		// 	$quantityCell = $Financialdetails->SESSION ;	
		// 	$durationCell = $Financialdetails->DURATION ;	
		// 	$unitPrice = $Financialdetails->UNITPRICE ;	
		// 	$CustomerName = $Financialdetails->CUSTOMERNAME ;	
		// 	$fulname = $Financialdetails->CUSTOMERNAME ;	
		// 	$descriptionCell = $Financialdetails->DESCRIPTION ;	
		// 	$tax = $Financialdetails->TAX ;	
		// 	$paymod = $Financialdetails->PAYMENT_METHOD ;
		// 	$paymentNotes = $Financialdetails->PAYMENTNOTES;	
        // print_r($Financialdetails);

		// }
	}
	break;
case "save":
    print_r($_POST);
    
    // Prevent duplicate submissions using a session token
    $duplicatekeeper = $session->get("post_key");
    if ($random_token != $duplicatekeeper) {
        $session->set("post_key", $random_token);

        // Check for required fields
        if (empty($EstimateName) || empty($PhoneNumber)) {
            $msg = "Failed. Required field(s) cannot be empty.";
            $status = "error";
            $target = '';
        } else {
            // Start transaction
            $sql->BeginTrans();

            try {
                $estimateID = $engine->estimateCode('Estimate', 'estimateCode', 'EST');

                // Insert into the Financial table
                $result = $sql->Execute($sql->Prepare("
                    INSERT INTO Estimate 
                        (customerName, CategoryName,estimateCode, totalAmount, invoiceNumber, phoneNumber, estimateNotes, userid) 
                    VALUES 
                        (" . $sql->Param('a') . ", " . $sql->Param('b') . ", " . $sql->Param('c') . ", " . $sql->Param('d') . ", " . $sql->Param('e') . ", " . $sql->Param('f') . ", " . $sql->Param('g') . ",". $sql->Param('i') . ")
                "), array(
                    $EstimateName, 
                    $catname, 
                    $estimateID, 
                    $overallTotal, 
                    $invoiceNumber,
                    $PhoneNumber, 
                    $notes, 
                    $actorname
                ));

                // Check if financial insertion was successful
                if ($result === false) {
                    throw new Exception("Error inserting financial information: " . $sql->ErrorMsg());
                }

                // Get the financialID for the InvoiceItems
                $financialID = $sql->Insert_ID();

                // Loop through each invoice item in $_POST['invoiceItems'] to insert into InvoiceItems table
                if (!empty($_POST['invoiceItems']) && is_array($_POST['invoiceItems'])) {
                    foreach ($_POST['invoiceItems'] as $index => $item) {
                        // Ensure each item has all required fields
                        if (!isset($item['description'], $item['qty'], $item['unit'], $item['unitPrice'], $item['total']) ||
                            $item['description'] === "" || $item['qty'] === "" || $item['unit'] === "" || $item['unitPrice'] === "" || $item['total'] === "") {
                            
                            // Output debugging information for the incomplete item
                            print "Error with item at index $index: ";
                            print_r($item); // Show exactly what’s in this item to identify the missing field
                            throw new Exception("Incomplete data for one or more invoice items.");
                        }

                        // Insert the valid item
                        $result = $sql->Execute($sql->Prepare("
                            INSERT INTO InvoiceItems 
                                (financialID, description, qty, unit, unitPrice, total) 
                            VALUES 
                                (" . $sql->Param('a') . ", " . $sql->Param('b') . ", " . $sql->Param('c') . ", " . $sql->Param('d') . ", " . $sql->Param('e') . ", " . $sql->Param('f') . ")
                        "), array(
                            $financialID, 
                            $item['description'], 
                            $item['qty'], 
                            $item['unit'], 
                            $item['unitPrice'], 
                            $item['total']
                        ));

                        // Check if invoice item insertion was successful
                        if ($result === false) {
                            throw new Exception("Error inserting InvoiceItems: " . $sql->ErrorMsg());
                        }
                    }
                } else {
                    throw new Exception("No invoice items found.");
                }

                // Commit transaction if everything is successful
                $sql->CommitTrans();
                $msg = "Financial information and all invoice items saved successfully. Estimate Code: $estimateID";
                $status = "success";

            } catch (Exception $e) {
                // Rollback transaction if there's an error
                $sql->RollbackTrans();
                print "Transaction failed: " . $e->getMessage();
                $msg = $e->getMessage();
                $status = "error";
            }
        }
    }
    break;

	case "deletest":
        if(!empty($keys)){

            $stmtpass = $sql->Execute($sql->Prepare("SELECT CustomerName FROM Estimate WHERE estimateCode = ".$sql->Param('b')." "),array($keys));
			$obj = $stmtpass->FetchNextObject();
			$CustomerName = $obj->CUSTOMERNAME ;

			$sql->Execute("UPDATE Estimate SET Estimatestatus = '-1' WHERE estimateCode = ".$sql->Param('f')." ", array($keys));
			print $sql->ErrorMsg();	

			$msg = "Estimate $CustomerName Deleted successfully.";
			$status = "success";

			$activity = 'User with username '.$EstimateName.' deleted ';
			$engine->setEventLog("016",$activity);
		}
	break;

	case "reset":
		$fdsearch = "";
	break;
}
//Get all users
if (empty($fdsearch)) {

$query = "SELECT * FROM Estimate WHERE Estimatestatus IN ('1', '2') ORDER BY id DESC";
	$input = array();
} else {

	$query = "SELECT * FROM Estimate WHERE Estimatestatus IN ('1','2') AND ( CustomerName LIKE " . $sql->Param('a') . " OR invoiceNumber LIKE " . $sql->Param('b')  . " ) ORDER BY id  DESC";
	$input = array($fdsearch . "%", $fdsearch . "%");
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
//Get All AllPatientID
$stmbr = $engine->categoryName();
//Get All Level
// $stmbl = $engine->getAllLevel();

