
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'View' : 'Book'; ?>  Details </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'view' : 'View'; ?> Details </li>
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
                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                                            </nav>

                </div>
                <div class="ibox-body">
            <!-- <div class="ibox-body"> -->
    
  <div class="row justify-content-center">
    <div class="col-md-8">
    <div class="form-group row">
        <label for="inputlevel" class="col-sm-2 col-form-label"> Category Name</label>
        <div class="col-sm-6">
            <input type="text"  class="form-control" name="inputlevel" id="inputlevel" value="<?= isset($inputlevel) ? $inputlevel : '' ?>" readonly    >
    </div>
            </div>
            <div class="form-group row">
    <label for="room" class="col-sm-2 col-form-label">Room Number</label>
    <div class="col-sm-6">
        <input type="text"  class="form-control" name="roomnumb" id="roomnumb" value="<?= isset($roomnumb) ? $roomnumb : '' ?>" readonly>
    </div>
</div>
    <div class="form-group row">
        <label for="checkin" class="col-sm-2 col-form-label"> Price </label>
        <div class="col-sm-2">
            <input type="number"  class="form-control" name="amount" id="amount" placeholder="000.00" value="<?= isset($amount) ? $amount : '' ?>" readonly>
            </div>
        
        <label for="checkout" class="col-sm-1 col-form-label">Check In</label>
        <div class="col-sm-3">
            <input type="date" class="form-control" name="checkin" id="checkin" value="<?= isset($checkin) ? $checkin : '' ?>" readonly>
            </div>
            </div>
        <div class="form-group row">
        <label for="checkin" class="col-sm-2 col-form-label"> Number Of Guess </label>
        <div class="col-sm-2">
    <input type="text" class="form-control" name="guess" id="guess" value="<?= isset($guess) ? $guess : '' ?>" readonly>
            </div>
        
        <label for="checkout" class="col-sm-1 col-form-label">Check Out</label>
        <div class="col-sm-3">
        <input type="text" class="form-control" name="checkout" id="checkout" value="<?= isset($checkout) ? $checkout : '' ?>" readonly>
            </div>
            </div>
    <div class="form-group row">
        <label for="client" class="col-sm-2 col-form-label"> Client Name </label>
        <div class="col-sm-6">
        <input type="text" class="form-control" name="client" id="client" value="<?= isset($client) ? $client : '' ?>" readonly>
            </div>
            </div>
            <div class="form-group row">
                <label for="client" class="col-sm-2 col-form-label"> Client Phone No </label>
        <div class="col-sm-6">
        <input type="number" class="form-control" name="$phone" id="$phone" value="<?= isset($phone) ? $phone : '' ?>" readonly>
            </div>
            </div>
            <div class="form-group row">
    <label for="duration" class="col-sm-2 col-form-label">Duration</label>
    <div class="col-sm-6">
            <input type="text" class="form-control" name="duration" id="duration" value="<?= isset($duration) ? $duration : '' ?>" readonly>
    </div>
</div>

        <div class="form-group row">
            <label for="amount" class="col-sm-2 col-form-label">Payment Status</label>
            <div class="col-sm-6">
                <select class="form-control" name="bstatus" id="bstatus" disabled>
                    <option value="" disabled>Select Payment Status</option>
                    <option value="1" <?php echo (($bstatus == '1') ? 'selected="selected"' : ''); ?>>Pending</option>
                    <option value="2" <?php echo (($bstatus == '2') ? 'selected="selected"' : ''); ?>>Paid</option>
                    <option value="3" <?= ($bstatus == '3') ? 'selected' : '' ?>>Cancelled</option>
                </select>
                <input type="hidden" name="bstatus" value="<?= $bstatus ?>">
            </div>
        </div>


        <div class="form-group row">
        <label for="catdesc" class="col-sm-2 col-form-label">Remark/ Note </label>
        <div class="col-sm-6">
                <input type="text" class="form-control" name="catdesc" id="catdesc" value="<?= isset($catdesc) ? $catdesc : '' ?>" readonly>
            </div>
            </div>
                <div class="form-group row">
        <label for="ufullname" class="col-sm-2 col-form-label"> Login User </label>
        <div class="col-sm-6">
                <input type="text" class="form-control" name="ufullname" id="ufullname" value="<?= isset($ufullname) ? $ufullname : '' ?>" readonly>
            </div>
            </div>
             
    <hr />
 
  </div>
            </div>
        </div>
       
            </div>
        </div>
