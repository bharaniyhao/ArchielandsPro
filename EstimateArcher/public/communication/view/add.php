      <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Edit'; ?> Patient (Register) </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Patient </li>
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

    <div class="row">
        <div class="col-sm-3 form-group">
            <label for="firstname">First Name</label>
            <input class="form-control" type="text" name="firstname" id="firstname" value="<?= isset($firstname) ? $firstname : '' ?>" placeholder="First Name">
        </div>
        <div class="col-sm-3 form-group">
            <label for="lastname">Last Name</label>
            <input class="form-control" type="text" name="lastname" id="lastname" value="<?= isset($lastname) ? $lastname : '' ?>" placeholder="Last Name">
        </div>
        <div class="col-sm-3 form-group">
            <label for="othername">Other Name</label>
            <input class="form-control" type="text" name="othername" id="othername" value="<?= isset($othername) ? $othername : '' ?>" placeholder="Other Name">
        </div>
        </div>
        <div class="row">
                <div class="col-sm-3 form-group">
            <label for="dob">Date Of Birth</label>
            <input class="form-control" type="date" name="dob" id="dob" value="<?= isset($dob) ? $dob : '' ?>" placeholder="DateOfBirth">
        </div>
            <div class="col-sm-3 form-group">
                                <label for="Gender">Gender</label>
                                <select class="form-control" name="gender" id="gender" value="<?= isset($gender) ? $gender : '' ?>" placeholder="Gender">
                                    <option value="" selected disabled>Select Gender </option>
                                    <option value="1" <?= ($gender == '1') ? 'selected' : '' ?>>Male </option>
                                    <option value="2" <?= ($gender == '2') ? 'selected' : '' ?>>Female </option>
                                </select>
                            </div>
        <div class="col-sm-3 form-group">
            <label for="blood">Blood Group Type</label>
                                <input class="form-control" type="text" name="blood" id="blood" value="<?= isset($blood) ? $blood : '' ?>" placeholder="Blood Group">
        </div>
    </div> 

    <div class="row">
        <div class="col-sm-3 form-group">
            <label for="Occupation">Occupation</label>
            <input class="form-control" type="tel" name="occup" id="occup" value="<?= isset($occup) ? $occup : '' ?>" placeholder="Occupation">

        </div>
        <div class="col-sm-3 form-group">
            <label for="Marital">Marital Status</label>
            <select class="form-control" name="Marital" id="Marital" value="<?= isset($Marital) ? $Marital : '' ?>" placeholder="Marital">
                <option value="" selected disabled>Select Marital Status </option>
                <option value="1" <?= ($Marital == '1') ? 'selected' : '' ?>>Married </option>
                <option value="2" <?= ($Marital == '2') ? 'selected' : '' ?>>Widowed </option>
                <option value="3" <?= ($Marital == '3') ? 'selected' : '' ?>>Divorced or Separated </option>
                <option value="4" <?= ($Marital == '4') ? 'selected' : '' ?>>Never Married or Single </option>
                                </select>
                                        </div>
        <div class="col-sm-3 form-group">
            <label for="nationality">Nationality</label>
            <input class="form-control" type="text" name="nationality" id="nationality" value="<?= isset($nationality) ? $nationality : '' ?>" placeholder="Nationality">
        </div>
        </div> 
        <div class="row">
        <div class="col-sm-3 form-group">
            <label for="address">Address</label>
            <input class="form-control" type="Address" name="address" id="address" value="<?= isset($address) ? $address : '' ?>" placeholder="Address">
        </div>
            <div class="col-sm-3 form-group">
                                

            <label for="phonenumber">Phone</label>
            <input class="form-control" type="tel" name="phonenumber" id="phonenumber" value="<?= isset($phonenumber) ? $phonenumber : '' ?>" placeholder="Phone number">

                            </div>
        <div class="col-sm-3 form-group">
            
            <label for="email">Email</label>
            <input class="form-control" type="email" name="email" id="email" value="<?= isset($email) ? $email : '' ?>" placeholder="Email address">


        </div>
    </div>

    <div class="row">
        <div class="col-sm-3 form-group">
            <label for="currentcondition">Current Condition</label>
            <textarea class="form-control" name="currentcondition" id="currentcondition" placeholder="Description of current condition"><?= isset($currentcondition) ? $currentcondition : '' ?></textarea>
        </div>
        <div class="col-sm-3 form-group">
            <label for="symptoms">Symptoms</label>
            <textarea class="form-control" name="symptoms" id="symptoms" placeholder="Description of symptoms"><?= isset($symptoms) ? $symptoms : '' ?></textarea>
        </div>
    </div>
    
    <hr />
  
    <div class="form-group" id="showup">
         <!-- <button class="btn btn-default" type="button" onclick="console.log('Button yao clicked!');showConfirmationAlert('warning', 'Are you sure you want to save New Patient?', 'Save Patient' , 'btn-success' ,'Yes' ,function(){ document.getElementById('view').value='' ;document.getElementById('viewpage').value='savepatient';document.myform.submit(); })">Submit</button>  -->
        
          <button class="btn btn-success text-white" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='savepatient';document.myform.submit() ">Submit</button>
    </div>
        </form>
  </div>
            </div>
        </div>
       
            </div>
        </div>
    <!-- </div> -->

