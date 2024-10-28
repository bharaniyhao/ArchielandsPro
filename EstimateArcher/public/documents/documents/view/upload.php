<?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Edit'; ?> Document </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Document </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Document Info</div>
                        <?php 
                    ?>
  <nav aria-label="breadcrumb">
                    
          <button class="btn btn-success text-white" onClick="document.getElementById('target').value='savepatient';document.getElementById('viewpage').value='savedoc';document.myform.submit() ">Save</button>
                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
</nav>
                </div>
                <div class="ibox-body">
        <!-- <form action="" method="post" enctype="multipart/form-data"> -->
 <div class="container">

    <div class="row">
        <div class="col-sm-3 form-group">
            <label for="patientID">Patient ID</label>
    <select class="form-control" id="patientID" name="patientID">
        <option value="" selected disabled>Select patient ID</option>

                    <?php
            if ($stmbr->RecordCount() > 0) {
                while (!$stmbr->EOF) {
                    $obj = $stmbr->FetchNextObject(); 
            ?>
                    <option value="<?php echo $obj->PATIENTID; ?>" <?php echo (($obj->ID == $patientID) ? 'selected = "selected"' : ''); ?>>
                        <?php echo $obj->PATIENTID; ?>
                    </option>
            <?php  
                }
            }
            ?>
    </select>  
                </div>
                <div class="mb-3 form-group">
                    <label for="patientID" hidden class="form-label">Patient Name</label>
                    <input type="text" class="form-control" id="patientID" name="patientID" hidden>
                    
                </div>
                </div>

    <div class="row">
        <div class="col-sm-6 form-group">
                <!-- <div class="mb-3"> -->
                    <label for="documentDescription" class="form-label">Document Description</label>
                    <textarea type="text" class="form-control" id="documentDescription" value="<?= isset($documentDescription) ? $documentDescription : '' ?>"  name="documentDescription" >
                </textarea>
                </div>
                </div>
                
   <div class="row">
    <div class="col-sm-2 form-group">
        <label for="documentFile" class="form-label">Upload Document</label>
        <div class="custom-file">
            <input type="file" class="custom-file-input" value="<?= isset($documentFile) ? $documentFile : '' ?>"  id="documentFile" name="documentFile" multiple required>
            <label class="custom-file-label" for="documentFile">Choose file</label>
        </div>
    </div>
    <div class="col-sm-10">
        <label class="form-label">Preview</label>
        <div class="image-preview-container">
            <iframe id="documentPreview" class="document-preview d-none" src=""></iframe>
            <img id="imagePreview" class="image-preview d-none" src="" alt="Preview">
            <span id="noDocumentPreview" class="text-muted">No document selected</span>
        </div>
    </div>
</div>


    <hr />
  
    <!-- <div class="form-group">
    
    </div> -->
  </div>
  </form>
   </div>
        </div>
       
            </div>
        </div>
    <!-- </div> -->
