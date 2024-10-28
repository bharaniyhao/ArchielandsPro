<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'New' : 'Edit'; ?> Customer</h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Customer</li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-6">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Customer Info</div>
                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back</button>
                </div>
                <div class="ibox-body">
                    <form>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label for="firstname">First Name</label>
                                <input class="form-control" type="text" name="firstname" id="firstname" value="<?= isset($firstname) ? $firstname : '' ?>" placeholder="First Name">
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="lastname">Last Name</label>
                                <input class="form-control" type="text" name="lastname" id="lastname" value="<?= isset($lastname) ? $lastname : '' ?>" placeholder="Last Name">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <label for="email">Email</label>
                                <input class="form-control" type="email" name="email" id="email" value="<?= isset($email) ? $email : '' ?>" placeholder="Email address">
                            </div>
                            <div class="col-sm-6 form-group">
                                <label for="phonenumber">Phone</label>
                                <input class="form-control" type="tel" name="phonenumber" id="phonenumber" value="<?= isset($phonenumber) ? $phonenumber : '' ?>" placeholder="Phone number">
                            </div>
                        </div>
                        
                        <hr />
                      
                        <div class="form-group">
                            <button class="btn btn-default" type="button" onclick="showConfirmationAlert('warning', 'Are you sure you want to save New Customer?', 'Save Customer' , 'btn-success' ,'Yes' ,function(){ document.getElementById('view').value='' ;document.getElementById('viewpage').value='savecustomer';document.myform.submit(); })">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
       
            </div>
        </div>
    </div>

</div>