<?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Edit'; ?> Book Room </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Book Room </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Booking Info</div>
                        <?php 
                    ?>
                       <nav aria-label="breadcrumb">

          <button class="btn btn-success text-white" onClick="document.getElementById('target').value='';document.getElementById('viewpage').value='savebooking';document.myform.submit() "> Save </button>

                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                        </nav>
                </div>
                <div class="ibox-body">
    
  <div class="row justify-content-center">
    <div class="col-md-8">
    <div class="form-group row">
        <label for="inputlevel" class="col-sm-2 col-form-label"> Category Name</label>
        <div class="col-sm-6">
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
    <label for="room" class="col-sm-2 col-form-label">Room Number</label>
    <div class="col-sm-6">
        <select class="form-control selectpicker" data-live-search="true" name="formattedRoomNum" id="formattedRoomNum" placeholder="Select Room Number">
            <option value="">Select Room Number</option>
            <?php for ($i = 1; $i <= 25; $i++): ?>
                <?php $formattedRoomNum = "Apple Grand " . str_pad($i, 3, '0', STR_PAD_LEFT); ?>
                <option value="<?= $formattedRoomNum ?>" <?= ($roomnumb == $formattedRoomNum) ? 'selected="selected"' : '' ?>>
                    <?= $formattedRoomNum ?>
                </option>
            <?php endfor; ?>
        </select>
    </div>
</div>
    <div class="form-group row">
        <label for="checkin" class="col-sm-2 col-form-label"> Price </label>
        <div class="col-sm-2">
            <input type="number"  class="form-control" name="amount" id="amount" placeholder="000.00" value="<?= isset($amount) ? $amount : '' ?>" required>
            </div>
        
        <label for="checkout" class="col-sm-1 col-form-label">Check In</label>
        <div class="col-sm-3">
            <input type="date" class="form-control" name="checkin" id="checkin" value="<?= isset($checkin) ? $checkin : '' ?>" required>
            </div>
            </div>
    <div class="form-group row">
        <label for="checkin" class="col-sm-2 col-form-label"> Number Of Guess </label>
        <div class="col-sm-2">
    <input type="number" class="form-control" name="guess" id="guess" value="<?= isset($guess) ? $guess : '' ?>" required>
            </div>
        
        <label for="checkout" class="col-sm-1 col-form-label">Check Out</label>
        <div class="col-sm-3">
        <input type="date" class="form-control" name="checkout" id="checkout" value="<?= isset($checkout) ? $checkout : '' ?>" required>
            </div>
            </div>
    <div class="form-group row">
        <label for="client" class="col-sm-2 col-form-label"> Client Name </label>
        <div class="col-sm-6">
        <input type="text" class="form-control" name="client" id="client" value="<?= isset($client) ? $client : '' ?>" required>
            </div>
            </div>
            <div class="form-group row">
                <label for="client" class="col-sm-2 col-form-label"> Client Phone No </label>
        <div class="col-sm-6">
        <input type="number" class="form-control" name="phone" id="phone" value="<?= isset($phone) ? $phone : '' ?>" required>
            </div>
            </div>
            <div class="form-group row">
    <label for="duration" class="col-sm-2 col-form-label"> Duration </label>
    <div class="col-sm-6">
        <select class="form-control" name="duration" id="duration">
            <option value="" selected disabled>Select Duration</option>
            <option value="24"<?php echo (($duration == '24') ? 'selected="selected"' : ''); ?>>24 Hours ( Day)</option>
            <option value="48"><?php echo (($duration == '48') ? 'selected="selected"' : ''); ?>48 Hours (2 Days)</option>

            <option value="72"><?php echo (($duration == '72') ? 'selected="selected"' : ''); ?>72 Hours (3 Days)</option>

            <option value="96"><?php echo (($duration == '96') ? 'selected="selected"' : ''); ?>96 Hours (4 Days)</option>

            <option value="120"><?php echo (($duration == '120') ? 'selected="selected"' : ''); ?>120 Hours (5 Days)</option>

            <option value="144"><?php echo (($duration == '144') ? 'selected="selected"' : ''); ?>144 Hours (6 Days)</option>

                <option value="168"><?php echo (($duration == '168') ? 'selected="selected"' : ''); ?>168 Hours (week)</option>
                <option value="336"><?php echo (($duration == '336') ? 'selected="selected"' : ''); ?>336 Hours (2 week)</option>
                <option value="504"><?php echo (($duration == '504') ? 'selected="selected"' : ''); ?>504 Hours (3 week)</option>
                <option value="month"><?php echo (($duration == 'month') ? 'selected="selected"' : ''); ?>month</option>
                <option value="twomonth"><?php echo (($duration == 'twomonth') ? 'selected="selected"' : ''); ?> 2 Month </option>
                <option value="threemonth"><?php echo (($duration == 'threemonth') ? 'selected="selected"' : ''); ?> 3 Month</option>


            </select>
    </div>
</div>

    <div class="form-group row">
        <label for="amount" class="col-sm-2 col-form-label"> Book Status </label>
        <div class="col-sm-6">
    <select class="form-control" name="bstatus" id="bstatus"  placeholder="Gender">
            <option value="" selected disabled>Select Book </option>
                <option value="1" <?php echo (($bstatus == '1') ? 'selected="selected"' : ''); ?>>Booked</option>
                    <option value="0" <?php echo (($bstatus == '2') ? 'selected="selected"' : ''); ?>>Refunded</option>
                        <option value=0 <?= ($bstatus == '3') ? 'selected' : '' ?>> Reserved  </option>
                                </select>

            </div>
            </div>
            <div class="form-group row">
        <label for="catdesc" class="col-sm-2 col-form-label">Remark/ Note </label>
        <div class="col-sm-6">
        <textarea name="catdesc" class="form-control" id="catdesc" value="<?= isset($catdesc) ? $catdesc : '' ?>" required></textarea>
            </div>
            </div>
             
    <hr />
 
  </div>
            </div>
        </div>
       
            </div>
        </div>
    </div>

