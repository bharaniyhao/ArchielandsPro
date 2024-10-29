        <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Update'; ?> Invoice  </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Progressing'; ?> invoice </li>
    </ol>
</div>

<
<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Invoice Details</div>
                    <nav aria-label="breadcrumb">
                        <button class="btn btn-success text-white" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='savepatient';document.myform.submit()">Save</button>
                        <button type="reset" class="btn btn-dark" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();">
                            <i class="fa fa-arrow-left"></i> Back
                        </button>
                    </nav>
                </div>
                <div class="ibox-body">
                    <div class="row justify-content-center">
                        <div class="container mt-2">
                            <div class="row mb-3">
                                <div class="col-md-3">
                                    <label for="invoiceNumber" class="form-label">Invoice Number:</label>
                                    <input type="text" class="form-control" value="<?= isset($invoiceNumber) ? $invoiceNumber : '' ?>"  id="invoiceNumber" readonly>
                                </div>
                                <div class="col-12 d-flex justify-content-end">
                                    <div class="text-end">
                                        <div>
                                            <b><p>WAYSTUDIO PHYSIOTHERAPY</p></b>
                                            <p>PO Box .T2</p>
                                            <p>Tema</p>
                                            <p>0266212420</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

<?php
  $invoice =$sql->Execute($sql->Prepare("SELECT * FROM Financial WHERE transaction_id = ?"), array($keys));
?>
                            <!-- Invoice Itemization -->
                            <div class="mb-3">
                                <h4>Invoice Items</h4>
                                <table id="invoiceItemsTable" class="table">
                                    <thead>
                                        <tr>
                                                <!-- <th > # </th> -->
                                            <th>Description</th>
                                            <th>Session</th>
                                            <th>Duration</th>
                                            <th>Unit Price</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $num = 1;
                                          if ($invoice->RecordCount() > 0) {
              foreach ($invoice as $invoices){
                                    echo '<tr>
                                        <td>'.$invoices['description'].'</td>
                                        <td>'.$invoices['Session'].'</td>
                                        <td>'.$invoices['Duration'].'</td>
                                        <td>'.$invoices['UnitPrice'].'</td>
                                        <td>'.$invoices['amount'].'</td>
                                        <td></td>
                                    </tr>';
                                            }
                                        }
                                        ?>
                                    </tbody>
                                </table>
                                <!-- <button type="button" class="btn btn-primary" onclick="addItem()">Add Fee</button> -->
                            <!-- </div> -->

                            <!-- Tax and Discount Section -->
                            <div class="row mt-5 mb-4" >
                                <div class="col-md-6">
                                    <label for="tax" class="form-label">Tax (%)</label>
                                    <input type="number" class="form-control" value="<?= isset($tax) ? $tax : '' ?>" id="tax">
                                </div>
                            </div>

                            <!-- Payment Information -->
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="paymentMethod" class="form-label">Payment Method:</label>
                                        <select class="form-select" id="paymentMethod" name="paymentMethod" required>
                                            <option value="">Choose...</option>
                                            <option value="Momo">MoMO</option>
                                            <option value="Cash">Cash</option>
                                            <option value="Check">Check</option>
                                            <option value="Credit Card">Credit Card</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="paymentDate" class="form-label">Payment Date:</label>
                                        <input type="date" class="form-control" value="<?= isset($paymentDate) ? $paymentDate : '' ?>" id="paymentDate" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="fulname">Patient Name</label>
                                        <input type="text" class="form-control" id="fulname" value="<?= isset($fulname) ? $fulname : '' ?>" name="full name" placeholder="Enter customer name" readonly>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <label for="customer_name">Customer Name</label>
                                        <input type="text" class="form-control" value="<?= isset($CustomerName) ? $CustomerName : '' ?>" id="CustomerName" name="CustomerName" placeholder="Enter customer name" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="patientID">Patient ID</label>
                                        <input type="text" class="form-control" id="patientID" name="patientID" value="<?= isset($patientID) ? $patientID : '' ?>" placeholder="Patient ID" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label for="paymentNotes" class="form-label">Notes:</label>
                                        <textarea class="form-control" id="paymentNotes" name="paymentNotes" rows="3">  <?= isset($paymentNotes) ? $paymentNotes : '' ?> </textarea>
                                    </div>
                                </div>
                            </div>

                            <hr />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
