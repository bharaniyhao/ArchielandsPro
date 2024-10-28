 <?php 
 error_reporting(E_ALL);
 ini_set('display_errors', 1);

?> 
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Edit'; ?> User </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard">Home</a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Account </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">User Account Info</div>
                        <?php 
                    ?>
                      <nav aria-label="breadcrumb">

                         <button class="btn btn-success text-white" onClick="document.getElementById('view').value='save';document.getElementById('viewpage').value='save';document.myform.submit() "> Save Account </button>

                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('target').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                    </nav>

                </div>
                <div class="ibox-body">
        <!-- <form action="" method="post" enctype="multipart/form-data"> -->
    <div class="row">

                    <div class="col-12">
<div class="card col-md-6 float-left"> 
    <div class="card-body">
        <h4 class="card-title">Bio Details</h4>
        <div class="row">
            <div class="col-sm-6 form-group">
                <label for="firstname">First Name</label>
                <input class="form-control" type="text" name="firstname" id="firstname" value="<?= isset($firstname) ? $firstname : '' ?>" placeholder="First Name">
            </div>
            <div class="col-sm-6 form-group">
                <label for="lastname">Last Name</label>
                <input class="form-control" type="text" name="lastname" id="lastname" value="<?= isset($lastname) ? $lastname : '' ?>" placeholder="Last Name">
            </div>
            <!-- <div class="col-sm-6 form-group">
                <label for="othername">Other Name</label>
                <input class="form-control" type="text" name="othername" id="othername" value="<?= isset($othername) ? $othername : '' ?>" placeholder="Other Name">
            </div> --
            <div class="col-sm-6 form-group">
                <label for="email">Email</label>
                <input class="form-control" type="email" name="email" id="email" value="<?= isset($email) ? $email : '' ?>" placeholder="Email address">
            </div> -->
            <div class="col-sm-6 form-group">
                <label for="phoneno">Phone</label>
                <input class="form-control" type="tel" name="phoneno" id="phoneno" value="<?= isset($phoneno) ? $phoneno : '' ?>" placeholder="Phone number">
            </div>
           <!--  <div class="col-sm-6 form-group">
                <label for="dob">Date Of Birth</label>
                <input class="form-control" type="date" name="dob" id="dob" value="<?= isset($dob) ? $dob : '' ?>" placeholder="Date Of Birth">
            </div>
            <div class="col-sm-6 form-group">
                <label for="address">Address</label>
                <input class="form-control" type="Address" name="address" id="address" value="<?= isset($address) ? $address : '' ?>" placeholder="Address">
            </div> -->
            <div class="col-sm-6 form-group">
                <label for="emgno">Emergency Number</label>
                <input class="form-control" type="text" name="emgno" id="emgno" value="<?= isset($emgno) ? $emgno : '' ?>" placeholder="Emergency Number">
            </div>
            
             <div class="col-sm-6 form-group">
                <label for="hue-demo">Location</label>
                <select class="select2 form-select shadow-none" style="width: 100%; height:36px;" name="inputbranch" id="inputbranch" >

                    <option>Select a branch</option>
                    <?php
                        if($stmbr->RecordCount()>0){
                        while(!$stmbr->EOF){
                            $obj = $stmbr->FetchNextObject(); 
                        
                                    ?>
                    <option value="<?php echo $obj->BRCH_CODE; ?>"<?php echo (($obj->BRCH_CODE == $inputbranch)?'selected="selected"':'') ;?> > <?php echo $obj->BRCH_NAME; ?></option>

                        <?php  
                        }}
                        ?>
                </select>
            </div> 

            <div class="col-sm-6 form-group">
                <label for="inputlevel">User Level</label>
                <select class="form-control" name="inputlevel" id="inputlevel">
                    <option value="" selected disabled>Select User Level</option>
                    <?php
                    if ($stmbl->RecordCount() > 0) {
                        while (!$stmbl->EOF) {
                            $obj = $stmbl->FetchNextObject(); 
                    ?>
                            <option value="<?php echo $obj->ACL_NUMBER; ?>" <?php echo (($obj->ACL_NUMBER == $inputlevel) ? 'selected="selected"' : ''); ?>> <?php echo $obj->ACL_NAME; ?></option>
                    <?php  
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="col-sm-6 form-group">
                <label for="accstatus">Status</label>
                <select class="form-control" name="accstatus" id="accstatus">
                    <option value="1" <?php echo (($accstatus == '1') ? 'selected="selected"' : ''); ?>>Enable</option>
                    <option value="0" <?php echo (($accstatus == '0') ? 'selected="selected"' : ''); ?>>Disable</option>
                </select>
            </div>
            <div class="col-sm-6 form-group">
                <label for="email">Email</label>
                <input class="form-control" type="email" name="email" id="email" value="<?= isset($email) ? $email : '' ?>" placeholder="Email address">
            </div>
        </div>
        <hr />
        <?php if (empty($keys)) { ?>
            <div class="row">
                <div class="col-sm-6 form-group">
                    <label for="usernamme">Username<span class="mandatory">*</span></label>
                    <input class="form-control" type="text" name="uname" id="uname" value="<?= isset($uname) ? $uname : '' ?>" placeholder="Username" required>
                </div>
                <div class="col-sm-6 form-group">
                    <label for="pwd">Password<span class="mandatory">*</span></label>
                    <input class="form-control" type="text" name="pwd" id="pwd" placeholder="Password" autocomplete="none" required>
                </div>
            </div>
        <?php } ?>
    </div>
</div>
    <!-- </div> -->

<div class="card col-md-6 float-md-end">
    <div class="card-body">
        <h4 class="card-title"> Module Accessibility </h4>
        <div class="form-group">
             <div class="gyn-treeview">
                                        <ul>
                                            <?php
                                                $num = 1;
                                                $catstmt = $menus->getMenuPreselection();
                                                //getMenuPreselection();
                                                while($objcat = $catstmt->FetchNextObject()){
                                                // $feaurename = $engine->getFeatureName($objcat->FACFE_MENUCATCODE);
                                            ?>

                                            <li class="has-children">
                                                <input type="checkbox" id="node-0-<?php echo $num ;?>" name="group-<?php echo $num ;?>" id="group-<?php echo $num ;?>">
                                                <label><input type="checkbox" /><span></span></label>
                                                <label for="node-0-<?php echo $num ;?>"><?php echo $objcat->MENUCAT_NAME ;?></label>

                                                <ul>
                                                <?php 
                                                    $sub =1;
                                                    $syscheckbox = array();
                                                    $catsubft = $menus->getSubMenuPreselection($objcat->MENUCAT_CODE);
                                                    
                                                    while($objsubft = $catsubft->FetchNextObject()){  
                                                                    
                                                ?>
                                                 <li>
                                                        <input type="checkbox" id="node-0-<?php echo $sub ;?>-0" name="menubox-<?php echo $sub ;?>" /><label><input type="checkbox" value="<?php echo $objsubft->MENUDET_CODE ?>" name="syscheckbox[<?php echo   $objsubft->MENUDET_CODE ?>]" /><span></span></label>
                                                        <label for="node-0-<?php echo $sub ;?>-0"><a href="#0"><input type="checkbox" name="syscheckbox[<?php echo $objsubft->MENUDET_CODE ?>]" id="menubox" value="<?php echo $objsubft->MENUDET_CODE ; ?>"><?php echo $objsubft->MENUDET_NAME ; ?></a></label>

                                                        <!--Define read and write access-->
                                                        :: <span style="color:#f00">W</span><input type="checkbox" id="node-0-<?php echo $sub ;?>-0" name="menubox-<?php echo $sub ;?>" /><label><input type="checkbox" value="<?php echo $objsubft->MENUDET_CODE ; ?>" name="syspermission[<?php echo   $objsubft->MENUDET_CODE ?>]" /><span></span></label> &nbsp;&nbsp; 

                                                    </li> 
                                                <?php $sub++; } ?>
                                                </ul>
                                            </li>
                                            <?php $num++ ; } ?>
                                        </ul>
                                    </div>
    </div>
    </div>
</div> 
</div>
</div>    
    <hr />
  
    <!--<div class="form-group">
    
        < <button class="btn btn-success text-white" onClick="document.getElementById('view').value='save';document.getElementById('viewpage').value='save';document.myform.submit() "> Submit</button> --
    </div>
</form>-->

                </div>
            </div>
        </div>
            </div>
        </div>
    <!-- </div> -->
