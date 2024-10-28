<?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'New'; ?>  Booking  </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Book'; ?>  Room </li>
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
    <label for="heading" class="col-sm-2 col-form-label">Category Name</label>
    <div class="col-sm-9">
        <select class="form-control" name="CatID" id="CatID">
            <option value="" selected disabled>Select Category</option>
            <?php
            if ($Catname->RecordCount() > 0) {
                while (!$Catname->EOF) {
                    $obj = $Catname->FetchNextObject(); 
            ?>
                <option value="<?php echo $obj->CAT_ID; ?>" <?php echo (($obj->CAT_ID == $CatID) ? 'selected="selected"' : ''); ?>><?php echo $obj->CAT_NAME; ?></option>
            <?php  
                }
            }
            ?>
        </select>
    </div>
</div>

<?php
$Catname = $engine->getAllCategories();
?>

                <div class="form-group row">
    <label for="room" class="col-sm-2 col-form-label"> Descriptions	</label>
    <div class="col-sm-9">
        <select class="form-control selectpicker" data-live-search="true" name="CatDec" id="CatDec" placeholder="Select Category Descriptions">
            <option value="" <?= empty($CatDec) ? $CatDec : '' ?>>Select Descriptions</option>
            <?php
                    if ($Dec->RecordCount() > 0) {
                        while (!$Dec->EOF) {
                            $obj = $Dec->FetchNextObject(); 
                    ?>
                            <option value="<?php echo $obj->CAT_DESC; ?>" <?php echo (($obj->CAT_ID == $CatDec) ? 'selected="selected"' : ''); ?>> <?php echo $obj->CAT_DESC; ?></option>
                    <?php  
                        }
                    }
                    ?>
        </select>
    </div>
</div>
        <div class="form-group row">
    <label for="room" class="col-sm-2 col-form-label">Room Number</label>
    <div class="col-sm-9">
        <select class="form-control selectpicker" data-live-search="true" name="formattedRoomNum" id="formattedRoomNum" placeholder="Select Room Number">
            <option value="">Select Room Number</option>
            <?php for ($i = 1; $i <= 25; $i++): ?>
                <?php $formattedRoomNum = "Apple Grand " . str_pad($i, 3, '0', STR_PAD_LEFT); ?>
                <option value="<?= $formattedRoomNum ?>" <?= ($roomNum == $formattedRoomNum) ? 'selected="selected"' : '' ?>>
                    <?= $formattedRoomNum ?>
                </option>
            <?php endfor; ?>
        </select>
    </div>
</div>

            <div class="form-group row">
        <label for="date" class="col-sm-2 col-form-label">Date:</label>
        <div class="col-sm-9">
        <input type="text"  class="form-control" name="date" id="date" value="<?= isset($date) ? $date : '' ?>">
            </div>
            </div>
        <div class="form-group row">
        <label for="text" class="col-sm-2 col-form-label">Status</label>
        <div class="col-sm-9">
        <select class="form-control" name="roomstatus" id="roomstatus"  placeholder="Gender">
                                        <option value="" selected disabled>Select Availability </option>
                                    <option value="1" <?php echo (($roomstatus == '1') ? 'selected="selected"' : ''); ?>>Active</option>
                                    <option value="0" <?php echo (($roomstatus == '0') ? 'selected="selected"' : ''); ?>>Inactive</option>
                                    <option value=0 <?= ($roomstatus == '0') ? 'selected' : '' ?>>In progress </option>
                                </select>
            </div>
            </div>
                        <div class="form-group row">
        <label for="Publish" class="col-sm-2 col-form-label">Added by:</label>
        <div class="col-sm-9">
        <input type="text"  class="form-control" name="addby" id="addby" value="<?= isset($addby) ? $addby : '' ?>"  required>
            </div>
            </div>


            <!-- <div class="form-group row">
        <label for="body" class="col-sm-2 col-form-label">Details:</label>
        <div class="col-sm-9">
        <textarea name="body" class="form-control" id="body" required></textarea>
            </div>
            </div> -->
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

    <script>
    $(document).ready(function() {
        $('.selectpicker').selectpicker();
    });
</script>