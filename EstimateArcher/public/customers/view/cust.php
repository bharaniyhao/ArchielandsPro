     <?php $rs = $paging->paginate(); ?>
        <form name="myform" class="pager-form" method="post" action="#">

      <input type="hidden" name="action_key" id="action_key" value="<?php echo md5(microtime());?>" />
      <input type="hidden" value="" name="viewpage" id="viewpage" />
      <input type="hidden" value="" name="target" id="target" />
      <input type="hidden" value="" name="keys" id="keys" /> 
<div class="page-content fade-in-up">
    <div class="ibox">
        <div class="ibox-body">
            <div class="pagination-tab pt-3 pb-3">
                <?php //$engine->msgBox($msg, $status); 
                ?>
                <div class="table-title d-flex">
                    <div class="col-sm-3 d-flex align-items-center">
                        <div id="pager">
                            <?php echo $paging->renderFirst('<span class="fa fa-angle-double-left"></span>'); ?>
                            <?php echo $paging->renderPrev('<span class=""></span>', '<span class="fa fa-arrow-circle-left"></span>'); ?>
                            <input name="page" id="pagecount" type="text" class="pagedisplay short" value="<?php echo $paging->renderNavNum(); ?>" readonly />
                            <?php echo $paging->renderNext('<span class="fa fa-arrow-circle-right"></span>', '<span class="fa fa-arrow-circle-right"></span>'); ?>
                            <?php echo $paging->renderLast('<span class="fa fa-angle-double-right"></span>'); ?>
                            <?php $paging->limitList($limit, "myform"); ?>
                        </div>
                    </div>
                    <div class="col-sm-5">
                        <div class="input-group">
                            <input type="text" tabindex="1" value="<?php echo $fdsearch; ?>" class="form-control square-input" name="fdsearch" placeholder="Enter Stock to Search" />
                            <span class="input-group-btn">
                                <button type="submit" onclick="document.getElementById('action_search').value='search';document.getElementById('viewpage').value='';document.myform.submit;" class="btn btn-default btn-gyn-search"> <i class="fa fa-search"></i> </button>
                            </span>
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="input-group">
                            <button type="submit" onclick="document.getElementById('action_search').value='';document.getElementById('view').value=''; document.getElementById('viewpage').value='reset';document.myform.submit;" class="btn btn-success btn-square btn-refresh"> <i class="fa fa-refresh"></i> </button>
                        </div>
                    </div>
                    <div class="col-sm-3 pagination-right">
                        <button type="submit" onclick="document.getElementById('action_search').value='';document.getElementById('view').value='add'; document.getElementById('viewpage').value='';document.myform.submit();" class="btn btn-success btn-square"> <i class="fa fa-user"></i> Add User</button>
                    </div>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="example-table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Phone</th>
                             <th>Position</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                           <?php 
				$num = 1;
				
			if($paging->total_rows > 0){
				$page = (empty($page))? 1:$page;
			 $num = (isset($page))? ($limit*($page-1))+1:1;
             foreach ($rs as $val){
				$brchname = $engine->getBranch($val['USR_BRCHID']);
                echo '<tr>
                  <td>'.$num++.'</td>
                  <td>'.$val['USR_OTHERNAME'].'</td>
				  <td>'.$val['USR_SURNAME'].'</td>
				  <td>'.$val['USR_USERNAME'].'</td>
                   <td>'.$val['USR_USERNAME'].'</td>
				  <td>'.$brchname.'</td>
                  <td>'.(($val['USR_STATUS'] == 1)?'Active':'Disable').'</td>
                  <td> <div align="center">
                  <button type="submit" class="btn btn-success text-white"  role="button" onClick="document.getElementById(\'target\').value=\'editmember\';document.getElementById(\'viewpage\').value=\'editmember\';document.getElementById(\'keys\').value=\''.$val['USR_CODE'].'\';document.myform.submit() ">
                                    <i class="fa fa-edit"></i> Edit
                                    </button>

                  <button type="submit" class="btn btn-warning text-white"  role="button" onClick="document.getElementById(\'target\').value=\'resetpassword\';document.getElementById(\'viewpage\').value=\'resetpassword\';document.getElementById(\'keys\').value=\''.$val['USR_CODE'].'\';document.myform.submit() ">
                                    <i class="fa fa-window-restore"></i> Reset
                                    </button>

                    <button type="button" class="btn btn-danger text-white"  role="button"  onClick="confirmSubmit(\'Warning!\',\'warning\',\'You are about to delete this user.\n\n Note: This process cannot be reversed.\n \n Are you sure ?\',\'Yes\',\'deleteuser\','.$val['USR_USERID'].')"><i class="fa fa-trash"></i> Delete</button></div></td>';
			   }} ?>
         
                                        </tbody>
                                       
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
    
        </div>
      
    
        </form>