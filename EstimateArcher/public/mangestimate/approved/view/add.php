      <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Edit'; ?> ESTIMATE  </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> ESTIMATE </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">ESTIMATE Details</div>
                        <?php 
                    ?>
                      <nav aria-label="breadcrumb">
                      
          <button class="btn btn-success text-white" onClick="document.getElementById('target').value='';document.getElementById('viewpage').value='save';document.myform.submit() "> Save </button>

                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                    </nav>
                </div>
        <div class="ibox-body">
    <div class="row justify-content-center">
        <!-- Fields in a single row -->
        <div class="col-md-2">
            <!-- Estimate Name -->
            <div class="mb-3">
                <label for="EstimateName">Estimator Name</label>
                <input type="text" class="form-control" value="<?= isset($EstimateName) ? $EstimateName : '' ?>" id="EstimateName" name="EstimateName" placeholder="Enter Your name here">
            </div>
        </div>
        <div class="col-md-2">
            <!-- Phone Number -->
            <div class="mb-3">
                <label for="PhoneNumber">Phone Number</label>
                <input type="number" class="form-control" value="<?= isset($PhoneNumber) ? $PhoneNumber : '' ?>" id="PhoneNumber" name="PhoneNumber" placeholder="Enter Your Phone Number">
            </div>
        </div>
        <div class="col-md-2">
            <!-- Estimate Category Name -->
            <div class="mb-3">
                <label for="catname">Estimate Category </label>
                <select class="form-control selectpicker" data-live-search="true" name="catname" id="catname">
                    <option value="" <?= empty($catname) ? 'selected' : '' ?>>Select category Name</option>
                    <?php if ($stmbr->RecordCount() > 0): ?>
                        <?php while (!$stmbr->EOF): $obj = $stmbr->FetchNextObject(); ?>
                            <option value="<?= $obj->CAT_NAME; ?>" <?= isset($catname) && $catname == $obj->CAT_NAME ? 'selected' : '' ?>>
                                <?= $obj->CAT_NAME; ?>
                            </option>
                        <?php endwhile; ?>
                    <?php endif; ?>
                </select>
            </div>
        </div>
    </div>

    <!-- Invoice Information -->
    <div class="container mt-2">
        <div class="row mb-3">
            <div class="col-md-3">
                <label for="invoiceNumber" class="form-label">Invoice Number:</label>
                <input type="text" class="form-control" value="<?= isset($invoiceNumber) ? $invoiceNumber : '' ?>" id="invoiceNumber" name="invoiceNumber" readonly>
            </div>
            <div class="col-12 d-flex justify-content-end">
                <div class="text-end">
                    <div>
                        <b><p>ARCHIE GROUPS LTD</p></b>
                        <!-- <p>PO Box T2</p> -->
                        <p> Haatso-Atomic Road,</p>
                        <p> Accra, Ghana</p>
                        <p>+233 24 592 9061</p>
                        <p>info@archiegroups.com</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Invoice Itemization -->
        <div class="container">
            <div class="mb-3">
                <table id="invoiceItemsTable" class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>Description</th>
                            <th>QTY</th>
                            <th>UNIT</th>
                            <th>Unit Price</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Dynamically added rows will go here -->
                    </tbody>
                </table>
                <button type="button" class="btn btn-primary" onclick="addItem()">Add Item</button>
            </div>

            <div class="row mt-4">
                <div class="col-md-6"></div> 
                <div class="col-md-6 d-flex justify-content-end">
                    <div class="form-group">
                        <label for="overallTotal" class="form-label">Overall Total:Gh₵</label>
                        <input type="text" value="<?= isset($overallTotal) ? $overallTotal : '' ?>" id="overallTotal" name="overallTotal" class="form-control text-end" readonly>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <!-- Payment Notes -->
                  <div class="mb-3">
    <label for="paymentNotes" class="form-label" title="Enter any additional information or specific requirements here.">Notes:(Enter any additional information or specific requirements here.)</label>
    <textarea class="form-control" id="notes" name="notes" rows="3"><?= isset($notes) ? $notes : '' ?></textarea>
</div>

                </div>
            </div>

            <hr />
        </div>
    </div>
</div>
</div>

</div>
    <!-- <script>
    $(document).ready(function() {
        $('.selectpicker').selectpicker();
    });
</script> -->