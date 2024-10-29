
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Edit'; ?> Patient Objective Assessment </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Objective </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Patient Objective Info</div>
                        <?php 
                    ?>
                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                </div>
                <div class="ibox-body">
        <form action="" method="post" enctype="multipart/form-data">

    <div class="row">
   
        <div class="col-sm-3 form-group">
                <!-- <label for="patientID"> Patient ID </label>
    <input type="text" class="form-control" id="patientID" value="<= isset($patientID) ? $patientID : '' ?>" placeholder="Search Patient ID..."> -->

        <label for="patientID"> Patient ID </label>
            <input class="form-control" type="text" name="patientID" id="patientID" value="<?= isset($patientID) ? $patientID : '' ?>" placeholder="Patient ID">
        

        </div>
        <div class="col-sm-3 form-group">
            <label for="firstname"> First Name </label>
            <input class="form-control" type="text" name="firstname" id="firstname" value="<?= isset($firstname) ? $firstname : '' ?>" placeholder="First Name">
        
        </div>
        <div class="col-sm-3 form-group">
            <label for="lastname">Last Name</label>
            <input class="form-control" type="text" name="lastname" id="lastname" value="<?= isset($lastname) ? $lastname : '' ?>" placeholder="Other Name">
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
                                    <option value=0 <?= ($gender == '0') ? 'selected' : '' ?>>Prefer Not to say </option>
                                </select>
                            </div>
        <div class="col-sm-3 form-group">
            <label for="blood">Blood Group Type</label>
                                <input class="form-control" type="text" name="blood" id="blood" value="<?= isset($blood) ? $blood : '' ?>" placeholder="Blood Group">
        </div>
    </div> 

    <div class="row">
        <div class="col-sm-3 form-group">
            <label for="occup">Occupation</label>
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
   <!--      <div class="row">
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
    </div> -->

    <div class="row">
      <!--   <div class="col-sm-3 form-group">
            <label for="currentcondition">Objective </label>
            <textarea class="form-control" name="currentcondition" id="currentcondition" placeholder="Description of current condition"><?= isset($currentcondition) ? $currentcondition : '' ?></textarea>
        </div>
        <div class="col-sm-3 form-group">
            <label for="symptoms">Subjective</label>
            <textarea class="form-control" name="symptoms" id="symptoms" placeholder="Description of symptoms"><?= isset($symptoms) ? $symptoms : '' ?></textarea>
        </div> -->
        <div class="col-sm-3 form-group">
            <label for="symptoms">Objective</label>
            <textarea class="form-control" name="symptoms" id="symptoms" placeholder="Description of symptoms"><?= isset($jective) ? $symptoms : '' ?></textarea>
        </div>
    </div>
    
    <hr />
  
    <div class="form-group">
    <!-- 
         <button class="btn btn-default" type="button" onclick="console.log('Button yao clicked!');showConfirmationAlert('warning', 'Are you sure you want to save New Patient?', 'Save Patient' , 'btn-success' ,'Yes' ,function(){ document.getElementById('view').value='' ;document.getElementById('viewpage').value='savepatient';document.myform.submit(); })">Submit</button>  -->
        
          <button class="btn btn-success text-white" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='saveass';document.myform.submit() ">Submit</button>
    </div>
        </form>
  </div>
            </div>
        </div>
       
            </div>
        </div>
    <!-- </div> -->
  <script>
    function searchPatients(inputValue) {
        var dataList = document.getElementById("patientSuggestions");
        var options = dataList.getElementsByTagName("option");
        for (var i = 0; i < options.length; i++) {
            var option = options[i];
            if (option.value.toLowerCase().indexOf(inputValue.toLowerCase()) !== -1) {
                option.style.display = "block";
            } else {
                option.style.display = "none";
            }
        }
    }

    // Function to populate Patient's Name field based on selected Patient ID
    document.getElementById('patientID').addEventListener('change', function() {
        var selectedID = this.value;
        var patientName = getAllPatientName(selectedID);
        document.getElementById('patientName').value = patientName;
    });

    // Function to get patient's name based on selected Patient ID
    function getAllPatientName(patientID) {
        // Loop through the result set obtained from PHP
        <?php
        if ($stmbr->RecordCount() > 0) {
            while (!$stmbid->EOF) {
                $obj = $stmbid->FetchNextObject(); 
        ?>
                if (<?php echo $obj->PATIENTID; ?> == patientID) {
                    return '<?php echo $obj->FIRSTNAME . ' ' . $obj->LASTNAME . ' ' . $obj->OTHERNAME; ?>';
                }
        <?php  
            }
        }
        ?>
    }

</script>

