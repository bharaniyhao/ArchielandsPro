      <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Edit'; ?> Invoice  </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> invoice </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Invoice Details</div>
                        <?php 
                    ?>
                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                </div>
                <div class="ibox-body">
<form action="" method="post" enctype="multipart/form-data">
  <div class="row justify-content-center">
   
    <div class="container mt-2">
    <div class="row">
    </div>
      <div class="row mb-3">
        <div class="col-md-3">
       <label for="invoiceNumber" class="form-label">Invoice Number:</label>
        <input type="text" class="form-control" id="invoiceNumber" readonly>
        </div>
  <div class="col-12 d-flex justify-content-end">
    <div class="text-end">
    <div>
     <b> <p>WAYSTUDIO PHYSIOTHERAPY</p></b>
      <p>PO Box .T2</p>
      <p>Tema</p>
      <p>0266212420</p>
    </div>
  </div>
</div>      
</div>      
      
      <!-- Invoice Itemization -->
      <div class="mb-3">
        <h4>Invoice Items</h4>
        <!-- Invoice items table -->
  <table id="invoiceItemsTable" class="table">
          <thead>
            <tr>
              <th>Description</th>
              <th>Quantity</th>
              <th>Unit Price</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            <!-- Invoice items rows will be added dynamically using JavaScript -->
          </tbody>
        </table>
        <!-- Add and remove item buttons -->
        <button type="button" class="btn btn-primary" onclick="addItem()">Add Item</button>
      </div>
      
      <!-- Tax and Discount Section -->
      <div class="row mb-3">
        <div class="col-md-6">
          <label for="tax" class="form-label">Tax (%)</label>
          <input type="number" class="form-control" id="tax">
        </div>
        <!-- Add more fields for discount, subtotal, etc. here -->
      </div>
      
      <!-- Payment Information -->
<div class="row">
  <div class="col-md-4">
    <!-- Payment Method -->
    <div class="mb-3">
      <label for="paymentMethod" class="form-label">Payment Method:</label>
      <select class="form-select" id="paymentMethod" required>
        <option value="">Choose...</option>
        <option>Cash</option>
        <option>Check</option>
        <option>Credit Card</option>
      </select>
    </div>
  </div>
  <div class="col-md-4">
    <!-- Payment Date -->
    <div class="mb-3">
      <label for="paymentDate" class="form-label">Payment Date:</label>
      <input type="date" class="form-control" id="paymentDate" required>
    </div>
  </div>
  <div class="col-md-4">
    <!-- Payment Method -->
    <div class="mb-3">
    <label for="customer_name">Customer Name</label>
    <input type="text" class="form-control" id="customer_name" name="customer_name" placeholder="Enter customer name" required>
</div>

</div>
</div>
<div class="row">
  <div class="col-md-12">
    <!-- Payment Notes -->
    <div class="mb-3">
      <label for="paymentNotes" class="form-label">Notes:</label>
      <textarea class="form-control" id="paymentNotes" rows="3"></textarea>
    </div>
  </div>
</div>

    <hr />
  
    <div class="form-group" >
        
          <button class="btn btn-success text-white" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='savepatient';document.myform.submit() ">Submit</button>
    </div>
        </form>
  </div>
            </div>
        </div>
       
            </div>
        </div>
