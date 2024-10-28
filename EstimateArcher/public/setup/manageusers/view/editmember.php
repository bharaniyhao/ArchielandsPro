<input type="hidden" value="<?php echo $inputbranch; ?>" name="inputbranch" id="inputbranch" />
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'Edit' : 'Update'; ?>  User  Detail</h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> User Info</li>
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

                     <nav aria-label="breadcrumb">
                     <button class="btn btn-success text-white" onClick="document.getElementById('target').value='edit';document.getElementById('viewpage').value='save';document.myform.submit() "> Save Update </button>

                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                        </nav>
                </div>
                <div class="ibox-body">
        
            <!-- <div class="container-fluid"> -->
                <div class="row">
                    <div class="col-12">

                    <div class="card col-md-6 float-left"> 
    <div class="card-body">
                                <h4 class="card-title">Bio Details</h4>

                            <div class="row">
            <div class="col-sm-6 form-group">                                    <label for="hue-demo">Username </label>
                                    <input type="text" name= "uname" id="uname" class="form-control demo" data-control="hue"
                                         value="<?= isset($uname) ? $uname : '' ?>" readonly >
                                  </div>

                                </div>


                            <div class="col-sm-6 form-group">

                                    <label for="hue-demo">First Name <span class="mandatory">*</span></label>
                                    <input type="text" name= "firstname" id="firstname" class="form-control demo" data-control="hue"
                                        value="<?= isset($othername) ? $othername : '' ?>" >
                                  </div>

    <div class="col-sm-6 form-group">                                  <label for="position-bottom-left">Last Name <span class="mandatory">*</span></label>
                                    <input type="text" name= "lastname" id="lastname" class="form-control demo"
                                        data-position="bottom left" value="<?php echo $lastname ; ?>">
                                  </div>
                                  

    <div class="col-sm-6 form-group">                                      <label for="hue-demo">Phone Number <span class="mandatory">*</span></label>
                                       <input type="text" name= "phoneno" id="phoneno" class="form-control demo" data-control="hue" value="<?php echo $phoneno ; ?>">
                                      </div>


                                      
    <div class="col-sm-6 form-group">                                      <label for="hue-demo">Emergency Number</label>
                                       <input type="text" name= "emgno" id="emgno" class="form-control demo" data-control="hue" value="<?php echo $emgno ; ?>">
                                      </div>


    <div class="col-sm-6 form-group">                                      <label for="position-bottom-left">Email Address</label>
                                      <input type="email" name= "email" id="email" class="form-control demo" data-position="bottom left" value="<?php echo $email ; ?>">
                                      </div>

                                <div class="col-sm-6 form-group">
                                <label for="inputlevel">Access Level</label>
                                <select class="form-control" name="inputlevel" id="inputlevel" value="<?= isset($inputlevel) ? $inputlevel : '' ?>" >
                                    <option value="" selected disabled>Select User Level</option>
                                      <?php
                                            if($stmbl->RecordCount()>0){
                                                while(!$stmbl->EOF){
                                                $obj = $stmbl->FetchNextObject(); 
    
                                          ?>
                                               <option value="<?php echo $obj->ACL_NUMBER; ?>" <?php echo (($obj->ACL_NUMBER == $inputlevel)?'selected="selected"':'') ;?> > <?php echo $obj->ACL_NAME; ?></option>

                                           <?php  
                                               }}
                                            ?>

                                </select>
                            </div>
                <div class="col-sm-6 form-group">
                                    <label for="accstatus">Status</label>
                                <select class="form-control" name="accstatus" id="accstatus" value="<?= isset($accstatus) ? $accstatus : '' ?>" placeholder="Status ">
                                            
                                                <option value="1" <?php echo (($accstatus == '1')?'selected="selected"':'') ;?> >Enable</option>
                                                <option value="0" <?php echo (($accstatus == '0')?'selected="selected"':'') ;?>>Disable</option>
                                        
                                        </select>
                                    </div>

                                </div>
                               
                            </div>
                            
                        <!-- </div> --> 


<div class="card col-md-6 float-md-end">

                            <div class="card-body">
                                <h4 class="card-title">Module Accessibility</h4>
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
                                                    $syspermission = array();
                                                    $catsubft = $menus->getSubMenuPreselection($objcat->MENUCAT_CODE);
                                                    
                                                    while($objsubft = $catsubft->FetchNextObject()){  
                                                           //get user accessibilities per category
                                                            $stmtt = $menus->getUserUnitAccess($keys,$objsubft->MENUDET_CODE);
														           if($stmtt->RecordCount() > 0){
															            $objdet = $stmtt->FetchNextObject();
															            $syscheckbox[$objsubft->MENUDET_CODE] = $objdet->MENUCT_MENUDETCODE;					
														            }else{ $syscheckbox[$objsubft->MENUDET_CODE] =  '' ; }

                                                            //Get User Permission
                                                            $stmtp = $menus->getUserUnitPermission($keys,$objsubft->MENUDET_CODE);
                                                            if($stmtp->RecordCount() > 0){
                                                                 $objdep = $stmtp->FetchNextObject();
                                                                 $syspermission[$objsubft->MENUDET_CODE] = $objdep->MENUCT_MENUDETCODE;					
                                                             }else{ $syspermission[$objsubft->MENUDET_CODE] =  '' ; }
                                                                    
                                                ?>
                                                 <li>
                                                        <input type="checkbox" id="node-0-<?php echo $sub ;?>-0" name="menubox-<?php echo $sub ;?>" /><label><input type="checkbox" value="<?php echo $objsubft->MENUDET_CODE ?>" name="syscheckbox[<?php echo   $objsubft->MENUDET_CODE ?>]" <?php echo (($objsubft->MENUDET_CODE == $syscheckbox[$objsubft->MENUDET_CODE])?'checked':'') ; ?> /><span></span></label>
                                                        <label for="node-0-<?php echo $sub ;?>-0"><a href="#0"><input type="checkbox" name="syscheckbox[<?php echo $objsubft->MENUDET_CODE ?>]" id="menubox" value="<?php echo $objsubft->MENUDET_CODE ; ?>"><?php echo $objsubft->MENUDET_NAME ; ?></a></label>

                                                        <!--Define read and write access-->
                                                        :: <span style="color:#f00">W</span><input type="checkbox" id="node-0-<?php echo $sub ;?>-0" name="menubox-<?php echo $sub ;?>" /><label><input type="checkbox" value="<?php echo $objsubft->MENUDET_CODE ; ?>" name="syspermission[<?php echo $objsubft->MENUDET_CODE ?>]" <?php echo (($objsubft->MENUDET_CODE == $syspermission[$objsubft->MENUDET_CODE])?'checked':'') ; ?> /><span></span></label> &nbsp;&nbsp; 

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
  <!--
    <div class="form-group">
                                     <button class="btn btn-success text-white" onClick="document.getElementById('target').value='';document.getElementById('viewpage').value='save';document.myform.submit() ">Save</button> -->

        
                                    <!-- <button type="submit" class="btn btn-danger text-white">Cancel</button> -->
                            
                        </div>

                                </div>
                            </div>
                            
                        </div>

                            </div>
                        </div>
                    <!-- </div> -->

        </form>