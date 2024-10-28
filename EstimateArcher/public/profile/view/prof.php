<div class="page-content fade-in-up">
    <div class="ibox">
        <div class="ibox-body">
            <div class="pagination-tab pt-3 pb-3">
                <?php 
                ?>
                
    
           <div class="table-responsive">
    <table class="table table-striped table-bordered table-hover" id="example-table">
      

    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="#" alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px;">
            <h5 class="my-3"><?= !empty($actorname) ? $actorname : ''; ?></h5>
            <p class="text-muted mb-1">Full Stack Developer</p>
            <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
            <!-- <div class="d-flex justify-content-center mb-2">
              <button type="button" class="btn btn-primary">Follow</button>
              <button type="button" class="btn btn-outline-primary ms-1">Message</button>
            </div> -->
          </div>
        </div>
      
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
             <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Username</p>
              </div>
              <div class="col-sm-9">
               <p class="text-muted mb-0"><?= !empty($username) ? $username : ''; ?></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><?= !empty($othername) && !empty($othername) ? $othername . ' ' . $othername : ''; ?></p>

              </div>
            </div>
            <hr>
             <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Position</p>
              </div>
              <div class="col-sm-9">
              <p class="text-muted mb-0"><?= !empty($position) ? $position : ''; ?></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><?= !empty($email) ? $email : ''; ?></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                 <p class="text-muted mb-0"><?= !empty($phoneno) ? $phoneno : ''; ?></p>
              </div>
            </div>
            <hr>
           
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">licensed by</p>
              </div>
              <div class="col-sm-9">
               <p class="text-muted mb-0"><?= !empty($level) ? $level : ''; ?></p>
              </div>
            </div>
            <hr>
              <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">licensed No</p>
              </div>
              <div class="col-sm-9">
               <p class="text-muted mb-0"><?= !empty($level) ? $level : ''; ?></p>
              </div>
            </div>
</hr>

          </div>
        </div>
      
    </table>
    </div>
</div>
</div>
</div>
</div>
