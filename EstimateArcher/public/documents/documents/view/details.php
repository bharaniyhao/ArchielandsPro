<?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Edit'; ?> Patient Details </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Details </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Patient Info</div>
                        <?php 
                    ?>
                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                </div>
                <div class="ibox-body">
        <form action="" method="post" enctype="multipart/form-data">

  <div class="row justify-content-center">
   
    <div class="container mt-2">
 
    <div class="row">
       <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="./" alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px;">
            <h5 class="my-3"> Patients ID  </h5>
            <p class="text-muted mb-1"> Full Name </p>
            <p class="text-muted mb-1">  Document ID  </p>
            <p class="text-muted mb-1"> Email </p>
            <p class="text-muted mb-4">DOB </p>
           
          </div>
          </div>
          </div>
        <div class="col-md-8">


          <div class="table-responsive">
  
            <label class="form-label"> Document </label>
        <div class="image-preview-container">
            <iframe id="documentPreview" class="document-preview d-none" src=""></iframe>
            <img id="imagePreview" class="image-preview d-none" src="" alt="Preview">
            <span id="noDocumentPreview" class="text-muted">No document </span>
        </div>
</div>
        </div>
      </div>
  
    <hr />
  
   <!--  <div class="form-group">
   
          <button class="btn btn-success text-white" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='savepatient';document.myform.submit() ">Submit</button>
    </div> -->
        </form>
  </div>
            </div>
        </div>
       
            </div>
        </div>
