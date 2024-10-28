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
                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                </div>
                <div class="ibox-body">
        <!-- <form action="" method="post" enctype="multipart/form-data"> -->
    <div class="row">
        <div class="col-sm-3 form-group">
            <label for="firstname">First Name</label>
            <input class="form-control" type="text" name="firstname" id="firstname" value="<?= isset($firstname) ? $firstname : '' ?>" placeholder="First Name">
        </div>
        <div class="col-sm-3 form-group">
            <label for="lastname">Last Name</label>
            <input class="form-control" type="text" name="lastname" id="lastname" value="<?= isset($lastname) ? $lastname : '' ?>" placeholder="Last Name">
        </div>
        <div class="col-sm-3 form-group">
            <label for="othername">Other Name</label>
            <input class="form-control" type="text" name="othername" id="othername" value="<?= isset($othername) ? $othername : '' ?>" placeholder="Other Name">
        </div>
        </div>
    <div class="row">
        <div class="col-sm-3 form-group">
            <label for="email">Email</label>
            <input class="form-control" type="email" name="email" id="email" value="<?= isset($email) ? $email : '' ?>" placeholder="Email address">
        </div>
        <div class="col-sm-3 form-group">
            <label for="phonenumber">Phone</label>
            <input class="form-control" type="tel" name="phonenumber" id="phonenumber" value="<?= isset($phonenumber) ? $phonenumber : '' ?>" placeholder="Phone number">
        </div>
        <div class="col-sm-3 form-group">
            <label for="dob">Date Of Birth</label>
            <input class="form-control" type="date" name="dob" id="dob" value="<?= isset($dob) ? $dob : '' ?>" placeholder="DateOfBirth">
        </div>
        </div>
        <div class="row">
        <div class="col-sm-3 form-group">
            <label for="address">Address</label>
            <input class="form-control" type="Address" name="address" id="address" value="<?= isset($address) ? $address : '' ?>" placeholder="Address">
        </div>
        <div class="col-sm-3 form-group">
                                <label for="level">User Level</label>
                                <select class="form-control" name="level" id="level" value="<?= isset($level) ? $level : '' ?>" placeholder="Username Level">
                                    <option value="" selected disabled>Select User Level</option>
                                    <option value="1" <?= ($level == '1') ? 'selected' : '' ?>>Level 1</option>
                                    <option value="2" <?= ($level == '2') ? 'selected' : '' ?>>Level 2</option>
                                </select>
                            </div>
                <div class="col-sm-3 form-group">
                    <label for="position">Position</label>
                        <select class="form-control" placeholder="Phone number">
                <option value="">Position</option>
                        </select>
                            </div>
    </div>

    <div class="row">
                    <?php if (empty($keys)) { ?>
                                <div class="col-sm-3 form-group">
                                    <label for="usernamme">Username</label>
                                    <input class="form-control" type="text" name="username" id="username" value="<?= isset($username) ? $username : '' ?>" placeholder="Username" required />
                                </div>
                                <div class="col-sm-3 form-group">
                                    <label for="password">Password</label>
                                    <input class="form-control" type="password" name="password" id="password" placeholder="Password" autocomplete="none" required />
                                </div>
                            <?php } ?>
    </div>
    
    <hr />
  
    <div class="form-group">
         <button class="btn btn-success text-white" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='savepatient';document.myform.submit() ">Submit</button>
    </div>
</form>

                </div>
            </div>
        </div>
            </div>
        </div>
    <!-- </div> -->
