      <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'Update' : 'Edit'; ?> Appointments </h1>
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
                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                </div>
                <div class="ibox-body">
        <form action="" method="post" enctype="multipart/form-data">

  <div class="row justify-content-center">
    <div class="col-md-8">
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="patientName">Patient's Name</label>
            <input type="text" class="form-control" id="patientName" name="patientName" placeholder="Enter patient's name" required>
          </div>
          <div class="form-group col-md-6">
            <label for="patientID">Patient ID</label>
            <input type="text" class="form-control" id="patientID" name="patientID" placeholder="Enter patient ID" required>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="patientName">Phone Number</label>
            <input type="text" class="form-control" id="Number" name="Number" placeholder="Enter patient's Number" required>
          </div>
          <div class="form-group col-md-6">
            <label for="patientID">Email Address</label>
            <input type="text" class="form-control" id="Email" name="Email" placeholder="Enter patient Email Address" required>
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="physiotherapist">Physiotherapist</label>
            <select class="form-control" id="physiotherapist" name="physiotherapist" required>
              <option value="">Select Physiotherapist</option>
              <option value="John Doe">John Doe</option>
              <option value="Jane Smith">Jane Smith</option>
              <!-- Add more physiotherapists as needed -->
            </select>
          </div>
          <div class="form-group col-md-6">
            <label for="appointmentDate">Appointment Date</label>
            <input type="date" class="form-control" id="appointmentDate" name="appointmentDate" required>
          </div>
        </div>
        <div class="form-group">
          <label for="message">Reason for Appointment</label>
          <textarea class="form-control" id="message" name="message" rows="3" placeholder="Enter reason for appointment" required></textarea>
        </div>
    <hr />
  
    <div class="form-group">
          <button class="btn btn-success text-white" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='savepatient';document.myform.submit() ">Book Appointment</button>
    </div>

    </form>
  </div>
            </div>
        </div>
        </div>
        </div>
       
            
