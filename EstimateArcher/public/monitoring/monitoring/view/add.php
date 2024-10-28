      <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Edit'; ?> Monitoring/Evaluation  </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Monitoring/Evaluation </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Monitoring/Evaluation</div>
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
       
  <div class="col-12 d-flex justify-content-end">
   <div class="container mt-5">
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="patientID">Patient ID:</label>
          <input type="text" class="form-control" id="patientID" name="patientID" required>
          <small class="error-message" id="patientIDError"></small>
        </div>
        <div class="form-group col-md-6">
          <label for="date">Date:</label>
          <input type="date" class="form-control" id="date" name="date" required>
          <small class="error-message" id="dateError"></small>
        </div>
      </div>

      <!-- Monitoring Parameters -->
      <div class="form-group">
        <label for="parameter1">Parameter 1:</label>
        <input type="text" class="form-control" id="parameter1" name="parameter1" required>
        <small class="error-message" id="parameter1Error"></small>
      </div>
      <div class="form-group">
        <label for="parameter2">Parameter 2:</label>
        <input type="text" class="form-control" id="parameter2" name="parameter2" required>
        <small class="error-message" id="parameter2Error"></small>
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
        </div></div></div>
        </div>
