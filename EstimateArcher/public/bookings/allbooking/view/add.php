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
        <select class="form-control" name="formattedRoomNum" id="formattedRoomNum">
                    <option value="" selected disabled>Select Number</option>
                    <?php
                    if ($stmbid->RecordCount() > 0) {
                        while (!$stmbid->EOF) {
                            $obj = $stmbid->FetchNextObject(); 
                    ?>
                            <option value="<?php echo $obj->ROOMNUMBER; ?>" <?php echo (($obj->ROOMNUMBER == $formattedRoomNum) ? 'selected="selected"' : ''); ?>> <?php echo $obj->ROOMNUMBER; ?></option>
                    <?php  
                        }
                    }
                    ?>
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
        <input type="number" class="form-control" name="phonenumber" id="phonenumber" value="<?= isset($phonenumber) ? $phonenumber : '' ?>" required>
            </div>
            </div>
    <div class="form-group row">
    <label for="duration" class="col-sm-2 col-form-label">Duration</label>
    <div class="col-sm-6">
        <select class="form-control" name="duration" id="duration">
            <option value="" disabled selected>Select Duration</option>
            <option value="A Day" <?php echo ($duration == 'A Day') ? 'selected' : ''; ?>>A Day</option>
            <option value="2 Days" <?php echo ($duration == '2 Days') ? 'selected' : ''; ?>>2 Days</option>
            <option value="3 Days" <?php echo ($duration == '3 Days') ? 'selected' : ''; ?>>3 Days</option>
            <option value="4 Days" <?php echo ($duration == '4 Days') ? 'selected' : ''; ?>>4 Days</option>
            <option value="5 Days" <?php echo ($duration == '5 Days') ? 'selected' : ''; ?>>5 Days</option>
            <option value="6 Days" <?php echo ($duration == '6 Days') ? 'selected' : ''; ?>>6 Days</option>
            <option value="1 Week" <?php echo ($duration == '1 Week') ? 'selected' : ''; ?>>1 Week</option>
            <option value="2 Weeks" <?php echo ($duration == '2 Weeks') ? 'selected' : ''; ?>>2 Weeks</option>
            <option value="3 Weeks" <?php echo ($duration == '3 Weeks') ? 'selected' : ''; ?>>3 Weeks</option>
            <option value="1 Month" <?php echo ($duration == '1 Month') ? 'selected' : ''; ?>>1 Month</option>
            <option value="2 Months" <?php echo ($duration == '2 Months') ? 'selected' : ''; ?>>2 Months</option>
            <option value="3 Months" <?php echo ($duration == '3 Months') ? 'selected' : ''; ?>>3 Months</option>
        </select>
    </div>
</div>

    <div class="form-group row">
        <label for="amount" class="col-sm-2 col-form-label"> Payment Status </label>
        <div class="col-sm-6">
    <select class="form-control" name="bstatus" id="bstatus"  placeholder="Gender">
            <option value="" selected disabled>Select Payment Mode</option>
                <option value="1" <?php echo (($bstatus == '1') ? 'selected="selected"' : ''); ?>>MoMo</option>
                    <option value="2" <?php echo (($bstatus == '2') ? 'selected="selected"' : ''); ?>>Cash</option>
                        <option value=3 <?= ($bstatus == '3') ? 'selected' : '' ?>> Visa Card  </option>
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

