
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'View' : 'Patient'; ?>  Details </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'view' : 'Patient'; ?> Details </li>
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
        <!-- <form action="" method="get" enctype="multipart/form-data"> -->

<div class="row justify-content-center">
    <div class="container mt-2">
        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-4">
                  <div class="card-body text-left">
                  <img src="assets/img/users/yao.jpeg" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                  <h5 class="my-3"><strong>Patient ID:</strong> <?= !empty($patientid) ? $patientid : ''; ?></h5>
                  <p class="lead mb-1"><strong>Full Name:</strong> <?= (!empty($firstname) ? $firstname : '') . ' ' . (!empty($lastname) ? $lastname : '') . ' ' . (!empty($othername) ? $othername : ''); ?></p>
                  <p class="lead mb-1"><strong>Phone:</strong> <?= !empty($phonenumber) ? $phonenumber : ''; ?></p>
                  <p class="lead mb-1"><strong>Email:</strong> <?= !empty($email) ? $email : ''; ?></p>
                  <p class="lead mb-1"><strong>DOB:</strong> <?= !empty($dob) ? $dob : ''; ?></p>
                  <p class="lead mb-1"><strong>Height:</strong> <?= !empty($height) ? $height : ''; ?></p>
                  <p class="lead mb-1"><strong>Weight:</strong> <?= !empty($weight) ? $weight : ''; ?></p>
                  <p class="lead mb-1"><strong>BMI:</strong> <?= !empty( $bmi) ?></p>
              </div>

                </div>
            </div>
            <div class="col-md-8">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="objective">Objective</label>
                                
            <input class="form-control" name="objective" id="objective" readonly placeholder="Description of objective"><?= isset($objective) ? $objective : '' ?>
                                <!-- <input type="text" class="form-control" id="objective" required placeholder=" objective ID...">
                                <datalist id="patientSuggestions">
                                    <php
                                    if ($stmbr->RecordCount() > 0) {
                                        while (!$stmbr->EOF) {
                                            $obj = $stmbr->FetchNextObject(); 
                                    ?>
                                            <option value="<?= $obj->PATIENTID; ?>">
                                    <php  
                                        }
                                    }
                                    ?>
                                </datalist>  -->
                            </div>
                            <div class="form-group col-md-6">
                                <label for="diagnosis">Diagnosis</label>
                                <input type="text" class="form-control" id="diagnosis" readonly name="diagnosis" required placeholder="Enter patient's diagnosis" > <?= !empty( $diagnosis) ?>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="prognosis">Prognosis</label>
                                <input type="text" class="form-control" id="prognosis" readonly name="prognosis" required placeholder="Enter patient's prognosis" ><?= isset($prognosis) ? $prognosis : '' ?>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="subjective">Subjective</label>
                                <input type="text" class="form-control" id="subjective"  readonly name="subjective" required placeholder="Enter patient's subjective"  ><?= isset($subjective) ? $subjective : '' ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<hr />

  <!-- 
    <div class="form-group">
    
         <button class="btn btn-default" type="button" onclick="console.log('Button yao clicked!');showConfirmationAlert('warning', 'Are you sure you want to save New Patient?', 'Save Patient' , 'btn-success' ,'Yes' ,function(){ document.getElementById('view').value='' ;document.getElementById('viewpage').value='savepatient';document.myform.submit(); })">Submit</button>  --
        
          <button class="btn btn-success text-white" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='savepatient';document.myform.submit() ">Submit</button>
    </div>
         </form> -->
  </div>
  </div>
  </div>
        
       
          

