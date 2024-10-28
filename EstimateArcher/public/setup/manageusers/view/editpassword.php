<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'Edit' : 'Update'; ?>  User Password </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> User </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">User Info</div>
                        <?php 
                    ?>
                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                </div>
                <div class="ibox-body">
                <div class="row">
                    <div class="col-12">
                    
<div class="card col-md-6 float-left"> 
                            <div class="card-body">
                                <h4 class="card-title">User Details</h4>

                                <div class="form-group fieldspacedown" >
                                  <div class="col-md-12 fieldspaceout">
                                    <label for="hue-demo">Username </label>
                                    <input type="text" name= "uname" id="uname" class="form-control demo" data-control="hue"
                                        value="<?php echo $uname ; ?> " readonly >
                                  </div>
                                  <div class="col-md-12 fieldspaceout">
                                    <label for="hue-demo">New Password </label>
                                    <input type="text" name= "pwd" id="pwd" class="form-control demo" data-control="hue" value="<?php echo $pwd ; ?> " autocomplete="off">
                                  </div>
                                </div>                       
                            </div>
                        </div>
                          
                </div>
                </div>
                <hr />
    <div class="form-group">
                        <h4 class="page-title">Password Reset</h4>
                        <div class="ms-auto text-end">
                            <nav aria-label="breadcrumb">
                                    <button class="btn btn-success text-white" onClick="document.getElementById('target').value='';document.getElementById('viewpage').value='savepassword';document.myform.submit() ">Save</button>
                                    <!-- <button type="submit" class="btn btn-danger text-white">Cancel</button> -->
                            </nav>
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

        </form>