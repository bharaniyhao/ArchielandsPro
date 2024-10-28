<?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Edit'; ?> Patients progress  </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Patients progress  </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Patients progress Details</div>
                        <?php 
                    ?>
                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                </div>
                <div class="ibox-body">
        <form action="" method="post" enctype="multipart/form-data">

  <div class="row justify-content-center">
        <div class="col-md-8">
        <div class="form-row">
          <div class="form-group col-md-4">

             <label for="patient_id">Patient ID:</label>
                <input type="text" class="form-control" id="patient_id" name="patient_id" required>
           
        </div>
        <div class="col-sm-3 form-group">
        <label for="date_of_assessment">Date of Assessment:</label>
                <input type="date" class="form-control" id="date_of_assessment" name="date_of_assessment" required>
            </div>
        
        </div>
       
    <div class="row">
        <div class="col-sm-4 form-group">
            <label for="treatment">Treatment Plan</label>
            <textarea class="form-control" name="treatment" id="treatment" placeholder="Description of treatment"><?= isset($treatment) ? $treatment : '' ?></textarea>
        </div>
        <div class="col-sm-4 form-group">
            <label for="progress">Progress Note</label>
            <textarea class="form-control" name="progress" id="progress" placeholder="Description of progress"><?= isset($progress) ? $progress : '' ?></textarea>
        </div>
    </div>

    <div class="row">
    <div class="col-sm-3 form-group">
           <label for="assessment_data">Assessment Data:</label>
                <textarea class="form-control" id="assessment_data" name="assessment_data" rows="3" required></textarea>
             </div>
             </div>
    
    <hr />
  
    <div class="form-group">
        
          <button class="btn btn-success text-white" onClick="document.getElementById('view').value='savepatient';document.getElementById('viewpage').value='savepatient';document.myform.submit() ">Submit</button>
    </div>
        </form>
  </div>
            </div>
        </div>
       
            </div>
        </div>
    </div>

