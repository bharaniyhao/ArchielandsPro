      <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'Update' : 'ReSchedule'; ?> Appointments </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Appointments </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Appointments Details</div>
                        <?php 
                    ?>

                       <nav aria-label="breadcrumb">
  <button class="btn btn-success text-white" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='saveappoint';document.myform.submit()">Book Appointment</button>

                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                    </nav>
                </div>
                <div class="ibox-body">

  <div class="row justify-content-center">
    <div class="col-md-8">
        <div class="form-row">
        <div class="form-group col-md-6">
            <label for="firstname"> First Name</label>
            <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter first name" value="<?php echo $firstname; ?>" readonly >
          </div>
          <div class="form-group col-md-6">
            <label for="lastname"> Last Name </label>
            <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter last Name"  value="<?php echo $lastname; ?>" readonly>
          </div>
          <div class="form-group col-md-6">
            <label for="othername"> Other Name </label>
            <input type="text" class="form-control" id="othername" name="othername" placeholder="Enter othername" value="<?php echo $othername; ?>" readonly>
          </div>
          <div class="form-group col-md-6">
            <label for="patientID">Patient ID</label>
            <input type="text" class="form-control" id="patientID" name="patientID" placeholder="Enter patient ID" value="<?php echo $patientID; ?>" readonly>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="patientName">Phone Number</label>
            <input type="text" class="form-control" value="<?= isset($phonenumber) ? $phonenumber : '' ?>"id="Number" name="Number" placeholder="Enter patient's Number" readonly>
          </div>
          <div class="form-group col-md-6">
            <label for="patientID">Email Address</label>
            <input type="text" class="form-control" value="<?= isset($email) ? $email : '' ?>"id="Email" name="Email" placeholder="Enter patient Email Address" readonly>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="therapistsId">Physiotherapist</label>
            <select class="form-control" id="therapistsId" value="<?= isset($therapistsId) ? $therapistsId : '' ?>"name="therapistsId" >
                      <option value="" selected disabled>Select Therapist</option>
                        <?php
            if ($stmbl->RecordCount() > 0) {
                while (!$stmbl->EOF) {
                    $obj = $stmbl->FetchNextObject(); 
            ?>
                    <option value="<?php echo $obj->THERAPISTS_ID; ?>" <?php echo (($obj->THERAPISTS_ID == $therapistsId) ? 'selected="selected"' : ''); ?>>
                        <?php echo $obj->FIRST_NAME . ' ' . $obj->LAST_NAME . ' ' . $obj->OTHER_NAME; ?>
                    </option>
            <?php  
                }
            }
            ?>

            </select>
          </div>
          <div class="form-group col-md-6">
    <label for="appointmentType">Appointment Type</label>
    <select class="form-control" id="appointmentType" value="<?= isset($appointmentType) ? $appointmentType : '' ?>" name="appointmentType" required>
        <option value="" selected disabled>Select appointment type</option>
        <option value="consultation">Consultation</option>
        <option value="therapy_session">Therapy Session</option>
        <option value="follow_up">Follow-up</option>
    </select>
</div>
          <div class="form-group col-md-6">
            <label for="appointmentDate">Appointment Date</label>
            <input type="date" class="form-control" value="<?= isset($appointmentDate) ? $appointmentDate : '' ?>" id="appointmentDate" name="appointmentDate" required>
          </div>
        

         <div class="form-group col-md-6">
    <label for="duration">Duration (HH:MM)</label>
    <input type="time" class="form-control" id="duration" value="<?= isset($duration) ? $duration : '' ?>"name="duration" required>
</div>
</div>
        <div class="form-group">
          <label for="message">Reason for Appointment</label>
          <textarea class="form-control" id="message" value="<?= isset($appointmentReason) ? $appointmentReason : '' ?>"name="message" rows="3" placeholder="Enter reason for appointment" required></textarea>
        </div>
    <hr />
  </div>
            </div>
        </div>
        </div>
        </div>
        </div>
       
            
