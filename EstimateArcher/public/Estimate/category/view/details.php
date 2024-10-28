      <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Category'; ?> Details  </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active">
            <?php echo empty($keys) ? 'Add' : 'View'; ?> Details </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Category Details</div>
                        <?php 
                    ?>
                       <nav aria-label="breadcrumb">
        <!-- <button class="btn btn-success text-white" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='saveappoint';document.myform.submit()">Add Category</button> -->
        
        <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                        </nav>
                </div>
                
      <div class="ibox-body">
        
  <div class="row justify-content-center">
    <div class="col-md-8">
        <div class="form-group row">
        <label for="heading" class="col-sm-2 col-form-label"> Category Name</label>
        <div class="col-sm-9">
        <input type="text" class="form-control" name="heading" id="heading" value="<?= isset($branchname) ? $branchname : '' ?>" readonly>
            </div>
            </div>
        <div class="form-group row">
        <label for="heading" class="col-sm-2 col-form-label"> Number of Room</label>
        <div class="col-sm-9">
        <input type="text" class="form-control" name="heading" id="heading" value="<?= isset($catnum) ? $catnum : '' ?>" readonly>
            </div>
            </div>

            <div class="form-group row">
        <label for="price" class="col-sm-2 col-form-label">Price Range(pear room)</label>
        <div class="col-sm-9">
        <input type="price"  class="form-control" name="price" id="price" value="<?= isset($catpric) ? $catpric : '' ?>" readonly>
            </div>
            </div>
        <div class="form-group row">
        <label for="date" class="col-sm-2 col-form-label">Status</label>
        <div class="col-sm-9">
        <select class="form-control" name="catstatus" id="catstatus"  placeholder="Status" disabled>
                                    <option value="" selected disabled>Select Availability </option>
                                    <option value="1" <?php echo (($catstatus == '1') ? 'selected="selected"' : ''); ?>>Active</option>
                                    <option value="0" <?php echo (($catstatus == '0') ? 'selected="selected"' : ''); ?>>Inactive</option>
                                    <!-- <option value="2" <?php echo ($catstatus == '0') ? 'selected' : '' ?>>In progress </option> -->
                                </select>
            </div>
            </div>
                        <!-- <div class="form-group row">
        <label for="Publish" class="col-sm-2 col-form-label">Added by</label>
        <div class="col-sm-9">
        <input type="Publish"  class="form-control" name="Publish" id="Publish" required>
            </div>
            </div> -->


            <div class="form-group row">
        <label for="body" class="col-sm-2 col-form-label">Details Description </label>
        <div class="col-sm-9">
        <textarea name="body" class="form-control" id="body" value="<?= isset($catdesc) ? $catdesc : '' ?>" readonly></textarea>
            </div>
            </div>
             
    <hr />
 
  </div>
            </div>
        </div>
       
            </div>
        </div>
    <!-- </div> -->

