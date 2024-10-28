<input type="hidden" name="patientID"  id = "patientID" value="<?php echo $patientid ?>" />
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
<div class="row">
    <div class="container mt-2">
        <div class="row">
            <div class="col-lg-5">
                <div class="card mb-2">
                    <div class="card-body text-left">

                        <div class="form-group">
                        <img src="assets/img/users/user.png" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                        <!-- <h6>Upload a different photo...</h6> -->
                        <input type="file" class="form-group text-center center-block file-upload">
                    <hr></div>
                    <!-- <div class="card-body"> -->
                        <h5 class="my-3"><strong>Patient ID:</strong> <?= !empty($patientid) ? $patientid : ''; ?></h5>
                        <p class="lead mb-1"><strong>Full Name:</strong> <?= (!empty($firstname) ? $firstname : '') . ' ' . (!empty($lastname) ? $lastname : '') . ' ' . (!empty($othername) ? $othername : ''); ?></p>
                        <p class="lead mb-1"><strong>Phone:</strong> <?= !empty($phonenumber) ? $phonenumber : ''; ?></p>
                        <p class="lead mb-1"><strong>Email:</strong> <?= !empty($email) ? $email : ''; ?></p>
                        <p class="lead mb-1"><strong>DOB:</strong> <?= !empty($dob) ? $dob : ''; ?></p>
                        <p class="lead mb-1"><strong>Height:</strong> <?= !empty($height) ? $height : ''; ?></p>
                        <p class="lead mb-1"><strong>Weight:</strong> <?= !empty($weight) ? $weight : ''; ?></p>
                        <p class="lead mb-1"><strong>BMI:</strong> <?= !empty($bmi) ? $bmi : ''; ?> </p>
                    </div>
                </div>
            </div>
            <!-- </div> -->

            <div class="col-lg-7">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#home">Assessments</a></li>
                    <li><a data-toggle="tab" href="#settings">Appointment</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="home">
                        <hr>
                        <div class="form-group">
                             <div class="col-xs-6">
                            <label for="Objective"><h4>Objective</h4></label>
                            <textarea type="text" class="form-control" id="Objective" list="Objective" placeholder="Objective" readonly>
                            </textarea>
                        </div>
                        </div>
                        <div class="form-group">
                             <div class="col-xs-6">
                            <label for="diagnosis"><h4>Diagnosis</h4></label>
                            <textarea type="text" class="form-control" id="diagnosis" name="diagnosis" placeholder="diagnosis" title="enter your first name if any."readonly>
                            </textarea>
                        </div>
                        </div>
                        <div class="form-group">
                             <div class="col-xs-6">
                            <label for="prognosis"><h4>Prognosis</h4></label>
                            <textarea type="text" class="form-control" id="prognosis" name="prognosis" placeholder=" prognosis" title="enter your first name if any." readonly>
                            </textarea>
                        </div>
                        </div>
                        <div class="form-group">

                             <div class="col-xs-6">
                            <label for="subjective"><h4>Subjective</h4></label>
                            <textarea type="text" class="form-control" id="subjective" name="subjective" placeholder=" subjective" title="enter your first name if any." readonly>
                            </textarea>
                        </div>
                        </div>
                        <div class="form-group">

                             <div class="col-xs-6">
                            <label for="Objectiveass"><h4> Objective Outcome measures </h4></label>
                            <textarea type="text" class="form-control" name="Objectiveass" id="Objectiveass" placeholder="Objective Assessments" title="enter your first name if any." readonly>
                            </textarea>
                        </div>
                        </div>
                        <!-- <hr> -->
                    </div>

                    <div class="tab-pane" id="settings">
                        <hr>
                        <div class="form-group">

                             <div class="col-xs-6">
                            <label for="email"><h4>Appointment Type</h4></label>
                            <textarea type="email" class="form-control" name="email" id="email" placeholder="Appointment Type" title="enter your email." readonly>
                            </textarea>
                        </div>
                        </div>
                        <div class="form-group">

                             <div class="col-xs-6">
                            <label for="location"><h4>Assign to Therapist</h4></label>
                            <textarea type="email" class="form-control" id="location" placeholder="Assign to Therapist" title="enter a location" readonly>
                            </textarea>
                        </div>
                        </div>
                        <div class="form-group">

                             <div class="col-xs-6">
                            <label for="last_name"><h4> Reason for Appointment </h4></label>
                            <textarea type="text" class="form-control" name="last_name" id="last_name" placeholder="Reason for Appointment" title="enter your last name if any." readonly>
                            </textarea>
                        </div>
                        </div>
                        <div class="form-group">

                             <div class="col-xs-6">
                            <label for="phone"><h4>Duration (HH:MM)</h4></label>
                            <textarea type="text" class="form-control" name="phone" id="phone" placeholder="Duration" title="enter your phone number if any." readonly>
                            </textarea>
                        </div>
                        </div>
                        <div class="form-group">

                             <div class="col-xs-6">
                            <label for="mobile"><h4>Appointment Date</h4></label>
                            <textarea type="text" class="form-control" name="mobile" id="mobile" placeholder="Appointment Date" title="enter your mobile number if any." readonly>
                            </textarea>
                        </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

            </div>
        </div>
    </div>

