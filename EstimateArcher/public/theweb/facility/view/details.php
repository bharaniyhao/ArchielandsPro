      <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'Details' : 'Details'; ?> Facility </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'add' : 'View'; ?> Facility </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Facility Info</div>
                        <?php 
                    ?>
                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                </div>
                <div class="ibox-body">
    
  <div class="row justify-content-center">
    <div class="col-md-8">
            <div class="form-group row">
        <label for="inputlevel" class="col-sm-2 col-form-label"> Category Name</label>
        <div class="col-sm-9">
        <select class="form-control" name="inputlevel" id="inputlevel">
                    <option value="" selected disabled>Select Category</option>
                    <?php
                    if ($stmbr->RecordCount() > 0) {
                        while (!$stmbr->EOF) {
                            $obj = $stmbr->FetchNextObject(); 
                    ?>
                            <option value="<?php echo $obj->CAT_NAME; ?>" <?php echo (($obj->CAT_NAME == $inputlevel) ? 'selected="selected"' : ''); ?>> <?php echo $obj->CAT_NAME; ?></option>
                    <?php  
                        }
                    }
                    ?>
                </select>
    </div>
            </div>
        <div class="form-group row">
        <label for="roomnum" class="col-sm-2 col-form-label">Room Number</label>
        <div class="col-sm-9">
        <input type="number" class="form-control" name="roomnum" id="roomnum" value="<?= isset($roomnum) ? $roomnum : '' ?>">
            </div>
            </div>

            <div class="form-group row">
        <label for="inputdate" class="col-sm-2 col-form-label"> Date </label>
        <div class="col-sm-9">
        <input type="date"  class="form-control" name="inputdate" id="inputdate" value="<?= isset($inputdate) ? $inputdate : '' ?>">
            </div>
            </div>
        <div class="form-group row">
        <label for="facilitiesstatus" class="col-sm-2 col-form-label"> Status </label>
        <div class="col-sm-9">
        <select class="form-control" name="facilitiesstatus" id="facilitiesstatus"  placeholder="Gender">
            <option value="" selected disabled>Select Availability </option>
            <option value="1" <?php echo (($facilitiesstatus == '1') ? 'selected="selected"' : ''); ?>>Booked</option>
            <option value="0" <?php echo (($facilitiesstatus == '0') ? 'selected="selected"' : ''); ?>>Available</option>
            <option value=0 <?= ($facilitiesstatus == '0') ? 'selected' : '' ?>> Pending </option>
                                </select>
            </div>
            </div>
                <!-- <div class="form-group row">
        <label for="USR_CODE" class="col-sm-2 col-form-label">Added by:</label>
        <div class="col-sm-9">
        <input type="Text"  class="form-control" name="USR_CODE" id="USR_CODE" required>
            </div>
            </div> -->


            <div class="form-group row">
        <label for="roomdetails" class="col-sm-2 col-form-label">Details:</label>
        <div class="col-sm-9">
        <textarea name="roomdetails" class="form-control" id="roomdetails" value="<?= isset($roomdetails) ? $roomdetails : '' ?>"></textarea>
            </div>
            </div>
              <!-- <div class="form-group row">
   <label for="img"  class="col-sm-2 col-form-label">Upload Images:</label>
   <div class="col-sm-4">
        <input type="file" class="form-control" name="img[]" id="img" multiple required>
            </div>
            </div> -->
    <hr />
 
  </div>
            </div>
        </div>
       
            </div>
        </div>
    <!-- </div> -->

