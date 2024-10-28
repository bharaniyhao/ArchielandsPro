     <?php $rs = $paging->paginate(); ?>
        <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
      <div class="page-heading">
    <h1 class="page-title">Communication Channel </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard">Home</a></li>
        <li class="breadcrumb-item active">communication</li>
    </ol>
</div>
<div class="page-content fade-in-up">
    <div class="ibox">
        <div class="ibox-body">
            <div class="pagination-tab pt-3 pb-3">
                <?php 
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
                            <input type="text" tabindex="1" value="<?php echo $fdsearch; ?>" class="form-control square-input" name="fdsearch" placeholder="Enter Patients ID or Name to Search" />
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
                    <!-- <div class="col-sm-3 pagination-right">
                        <button type="submit" onclick="document.getElementById('action_search').value='';document.getElementById('view').value='comm'; document.getElementById('viewpage').value='';document.myform.submit();" class="btn btn-success btn-square"> <i class="fa fa-user"></i> Add Chat </button>
                    </div> -->
                    
                </div>
            </div>
            <div class="row">
                    <div class="col-12">

                    <!-- <div class="card col-md-6 float-left">  -->
    <div class="card-body">
            <div class="table-responsive">
    <table class="table table-striped table-bordered table-hover" id="example-table">
        <thead>
            <tr>
                <th> # </th>
                <th>  Full Name </th>
                <th> Occupation </th>
                <th> Status </th>
                <th> Action </th>
            </tr>
        </thead>
        <tbody>
            <?php 
            	$num = 1;
				
			if($paging->total_rows > 0){
				$page = (empty($page))? 1:$page;
			 $num = (isset($page))? ($limit*($page-1))+1:1;
             foreach ($rs as $val){
				// $brchname = $engine->getBranch($val['USR_BRCHID']); {
                    // var_dump($result);
                      $status_name = '';
                    $status_color = '';

                    if ($val['USR_STATUS'] == 1) {
                        $status_name = 'Active';
                        $status_color = 'success';
                    } elseif ($val['USR_STATUS'] == 2) {
                        $status_name = 'Pending';
                        $status_color = 'info';
                    } elseif ($val['USR_STATUS'] == 0) {
                        $status_name = 'Disable';
                        $status_color = 'danger';
                    }

                          $status_level = '';
                    $status_colors = '';

                    if ($val['USR_LEVEL'] == 1) {
                        $status_level = 'Administrator';
                        $status_colors = 'success';
                    } elseif ($val['USR_LEVEL'] == 2) {
                        $status_level = 'Frontdesk,';
                        $status_colors = 'info';
                    } elseif ($val['USR_LEVEL'] == 3) {
                        $status_level = 'Therapist';
                        $status_colors = 'danger';
                    }
                    echo '<tr>
                        <td>'.$num++.'</td>
                        <td>'.$val['USR_SURNAME'].' '.$val['USR_FIRSTNAME'].'</td>
                    <td><span class="badge badge-' . $status_colors . '">' . $status_level . '</span></td>
                        <td><span class="badge badge-' . $status_color . '">' . $status_name . '</span></td>
                        
                        <td>
                            <div align="center">
                                <button type="submit" class="btn btn-info text-white" role="button" onClick="document.getElementById(\'target\').value=\'message\';document.getElementById(\'viewpage\').value=\'message\';document.getElementById(\'keys\').value=\''.$val['USR_USERID'].'\';document.myform.submit()">
                                    <i class="fa fa-pencil"></i> Send Chat
                                </button>
                            </div>
                        </td>';
                }
            }
        // }
            ?>
        </tbody>
    </table>
                            </div> 
                            </div> 
                            </div> 

<!-- 
<div class="card col-md-6 float-md-end">

                            <div class="card-body">
         <div class="container mt-5">
    <!-- <h1 class="text-center">chatbot</h1> --
    <div class="row bg-light">
        <div class="col-auto">
            <img src="assets/img/users/yao.jpeg" class="rounded-circle img-thumbnail mt-2" width="55px" alt="...."/>
        </div>
        <div class="col">
            <h5 class="mt-2"><?= isset($systemuser) ? $systemuser : '' ?>  </h5>
            <span class="text-success">online</span>
        </div>
    </div>
   <div id="chatContainer" class="chat-box container border overflow-auto mt-3" style="height: 300px;">
    <!-- Chat messages will be displayed here --
</div>
<div class="input-group mt-3">
    <input id="textbox" type="text" class="form-control" name="incomingId" value="" placeholder=" Type your message here..." />

    <div class="input-group-append">
        <button id="sendBtn" type="button" class="btn btn-primary">Send</button>
    </div>
</div>
</div>
</div>

                            </div> -->
                        </div>
                    </div>
                    </div>
                    </div>
                    </div>
        </form>
    <script src="../model/js.js"> </script>