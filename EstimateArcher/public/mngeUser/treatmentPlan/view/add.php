      <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Edit'; ?> Treatment list </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Treatment </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Treatment Details</div>
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

      <label for="patientId">Patient ID:</label>
      <input type="text" class="form-control" id="patientId" placeholder="Enter Patient ID">
    </div>
    <div class="form-group col-md-4">
      <label for="patientName">Patient Name:</label>
      <input type="text" class="form-control" id="patientName" placeholder="Enter Patient Name">
    </div>
    </div>
     <div class="form-row">
    <div class="form-group col-md-4">
      <label for="dob">Date of Birth:</label>
      <input type="date" class="form-control" id="dob">
    </div>
       
    <div class="form-group col-md-4">
      <label for="treatmentDate">Date of Treatment Plan:</label>
      <input type="date" class="form-control" id="treatmentDate">
    </div>
    </div>
     <div class="form-row">
    <div class="form-group col-md-4">
      <label for="diagnosis">Diagnosis:</label>
      <textarea class="form-control" id="diagnosis" rows="3" placeholder="Enter Diagnosis"></textarea>
   
    </div>
    <div class="form-group col-md-4">
     <label for="goals">Treatment Goals:</label>
      <textarea class="form-control" id="goals" rows="3" placeholder="Enter Treatment Goals"></textarea>
     </div>
    </div>
    <div class="form-row">
    <div class="form-group col-md-4">
       <label for="plan">Treatment Plan:</label>
      <textarea class="form-control" id="plan" rows="5" placeholder="Enter Treatment Plan"></textarea>
   
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
    <!-- </div> -->

