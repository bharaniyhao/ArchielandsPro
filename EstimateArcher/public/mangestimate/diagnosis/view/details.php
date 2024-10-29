<?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'Assessment' : 'Edit'; ?>   Details </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Assessment </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Patient Assessment Info</div>
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
            <p class="text-muted mb-1">  Phone  </p>
            <p class="text-muted mb-1"> Email </p>
            <p class="text-muted mb-4">DOB </p>
            <p class="text-muted mb-4"> Height  </p>
            <p class="text-muted mb-4"> Weight </p>
            <p class="text-muted mb-4"> BMI </p>
           
          </div>
          </div>
          </div>
        <div class="col-md-8">

          <div class="table-responsive">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Objective</a></li>
    <li><a data-toggle="tab" href="#menu1">Subjective</a></li>
    <li><a data-toggle="tab" href="#menu2">Diagnosis</a></li>
    <li><a data-toggle="tab" href="#menu3">Prognosis</a></li>
  </ul>
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>Objective</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    <textarea class="form-control" name="objective" id="objective" placeholder="Description of objective"><?= isset($objective) ? $objective : '' ?></textarea>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>Subjective</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    <textarea class="form-control" name="subjective" id="subjective" placeholder="Description of Subjective"><?= isset($subjective) ? $subjective : '' ?></textarea>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Diagnosis</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
      <textarea id="form2" class="md-textarea form-control" rows="3"></textarea>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Prognosis</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
      <textarea id="form3" class="md-textarea form-control" rows="3"></textarea>
    </div>
  </div>
</div>
        </div>
      </div>
  
    <hr />
  
    <div class="form-group">
    <!-- 
         <button class="btn btn-default" type="button" onclick="console.log('Button yao clicked!');showConfirmationAlert('warning', 'Are you sure you want to save New Patient?', 'Save Patient' , 'btn-success' ,'Yes' ,function(){ document.getElementById('view').value='' ;document.getElementById('viewpage').value='savepatient';document.myform.submit(); })">Submit</button>  -->
        
          <button class="btn btn-success text-white" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='savepatient';document.myform.submit() ">Submit</button>
    </div>
        </form>
  </div>
            </div>
        </div>
       
            </div>
        </div>
    <!-- </div> -->

