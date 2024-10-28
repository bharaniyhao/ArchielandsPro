      <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'Details' : 'Update'; ?> physiotherapist </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'View' : 'Edit'; ?> Facilities </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Physiotherapist Info</div>
                        <?php 
                    ?> 
                <nav aria-label="breadcrumb">

                    <button class="btn btn-success text-white" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='savetherapist';document.myform.submit() ">Update </button>


                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>                                            </nav>

                </div>
                <div class="ibox-body">
        <form action="" method="post" enctype="multipart/form-data">

    <div class="row">
        <div class="col-sm-3 form-group">
            <label for="firstname">First Name</label>
            <input class="form-control" type="text" name="firstname" id="firstname" value="<?= isset($firstname) ? $firstname : '' ?>" placeholder="First Name" >
        </div>
        <div class="col-sm-3 form-group">
            <label for="lastname">Last Name</label>
            <input class="form-control" type="text" name="lastname" id="lastname" value="<?= isset($lastname) ? $lastname : '' ?>" placeholder="Last Name" >
        </div>
        <div class="col-sm-3 form-group">
            <label for="othername">Other Name</label>
            <input class="form-control" type="text" name="othername" id="othername" value="<?= isset($othername) ? $othername : '' ?>" placeholder="Other Name" >
        </div>
        </div>
        <div class="row">
                <div class="col-sm-3 form-group">
            <label for="dob">Date Of Birth</label>
            <input class="form-control" type="date" name="dob" id="dob" value="<?= isset($dob) ? $dob : '' ?>" placeholder="DateOfBirth" >
        </div>
            <div class="col-sm-3 form-group">
                                <label for="Gender">Gender</label>
                                <select class="form-control" name="gender" id="gender" value="<?= isset($gender) ? $gender : '' ?>" placeholder="Gender" >
                                     <option value="" selected disabled>Select Gender </option>
                                    <option value="1" <?= ($gender == '1') ? 'selected' : '' ?>>Male </option>
                                    <option value="2" <?= ($gender == '2') ? 'selected' : '' ?>>Female </option>
                                    <option value=0 <?= ($gender == '0') ? 'selected' : '' ?>>Prefer Not to say </option>
                                </select> 
                            </div>
        <div class="col-sm-3 form-group">
            <label for="specialization "> Specialization </label>
                                <input class="form-control" type="text" name="specialization " id="specialization " value="<?= isset($specialization ) ? $specialization  : '' ?>" placeholder="specialization " >
        </div>
    </div> 

    <div class="row">
        <div class="col-sm-3 form-group">
            <label for="licensedby	">licensed by	</label>
            <input class="form-control" type="tel" name="licensedby" id="licensedby" value="<?= isset($licensedby) ? $licensedby : '' ?>" placeholder="licensedby">

        </div> 
        <div class="col-sm-3 form-group">
            <label for="Marital">Marital Status</label>
            <select class="form-control" name="Marital" id="Marital" value="<?= isset($Marital) ? $Marital : '' ?>" placeholder="Marital" >
                <option value="" selected disabled>Select Marital Status </option>
                <option value="Married" <?= ($Marital == '1') ? 'selected' : '' ?>>Married </option>
                <option value="Widowed" <?= ($Marital == '2') ? 'selected' : '' ?>>Widowed </option>
                <option value="Divorced/Separated" <?= ($Marital == '3') ? 'selected' : '' ?>>Divorced or Separated </option>
                <option value="Never Married/Single" <?= ($Marital == '4') ? 'selected' : '' ?>>Never Married or Single </option>
                                </select> 
                                        </div>
        <div class="col-sm-3 form-group">
            <label for="nationality">Nationality</label>
            <input class="form-control" type="text" name="nationality" id="nationality" value="<?= isset($nationality) ? $nationality : '' ?>" placeholder="Nationality" >
        </div>
        </div> 
        <div class="row">
        <div class="col-sm-3 form-group">
            <label for="address">Address</label>
            <input class="form-control" type="Address" name="address" id="address" value="<?= isset($address) ? $address : '' ?>" placeholder="Address" >
        </div>
            <div class="col-sm-3 form-group">
                                

            <label for="phonenumber">Phone</label>
            <input class="form-control" type="tel" name="phonenumber" id="phonenumber" value="<?= isset($phonenumber) ? $phonenumber : '' ?>" placeholder="Phone number" >

                            </div>
        <div class="col-sm-3 form-group">
            
            <label for="email">Email</label>
            <input class="form-control" type="email" name="email" id="email" value="<?= isset($email) ? $email : '' ?>" placeholder="Email address" >


        </div>
    </div>

    <div class="row">
        <div class="col-sm-3 form-group">
            <label for="emergencycontact">Emergency Contact Number</label>
            <input class="form-control" name="emergencynum" id="emergencynum" value="<?= isset($emergencynum) ? $emergencynum : '' ?>" placeholder="Description of current condition" >
        </div>
        <div class="col-sm-3 form-group">
            <label for="emergencynum">Emergency Contact Name</label>
            <input class="form-control" name="emergencycontact" id="emergencycontact" value="<?= isset($emergencycontact) ? $emergencycontact : '' ?>" placeholder="Description of emergency Number" >
        </div>
        <div class="col-sm-3 form-group">
            <label for="licensedno">licensed Number </label>
            <input class="form-control" name="licensedno" id="licensedno" value="<?= isset($licensedno) ? $licensedno : '' ?>" placeholder="Enter licensed Number" >
        </div>
    </div>
    
    <hr />
  <!--
    <div class="form-group">
          <button class="btn btn-default" type="button" onclick="console.log('Button yao clicked!');showConfirmationAlert('warning', 'Are you sure you want to save New Patient?', 'Save Patient' , 'btn-success' ,'Yes' ,function(){ document.getElementById('view').value='' ;document.getElementById('viewpage').value='savepatient';document.myform.submit(); })">Submit</button>  
        
         
    </div>-->

  </div>
            </div>
        </div>
       
            </div>
        </div>
    <!-- </div> -->

