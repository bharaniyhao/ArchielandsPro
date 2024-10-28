     <?php $rs = $paging->paginate(); ?>
        <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
      <div class="page-heading">
    <h1 class="page-title"> Patients progress  List </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard">Home</a></li>
        <li class="breadcrumb-item active">Patient progress</li>
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
                    <div class="col-sm-3 pagination-right">
                        <button type="submit" onclick="document.getElementById('action_search').value='';document.getElementById('view').value='prog'; document.getElementById('viewpage').value='';document.myform.submit();" class="btn btn-success btn-square"> <i class="fa fa-user"></i> New progress </button>
                    </div> 
                    
                </div>
            </div>
            <div class="table-responsive">
    <table class="table table-striped table-bordered table-hover" id="example-table">
        <thead>
            <tr>
                <th> # </th>
                <th> Patients ID </th>
                <!-- <th> Full Name </th>  -->
                <th> Date of Assessment </th>                
                <th> Treatment Plan </th> 
                <th> Progress Notes </th>
                <th> Actions </th>
            </tr>
        </thead>
        <tbody>
            <?php 
            	$num = 1;
				
			if($paging->total_rows > 0){
				$page = (empty($page))? 1:$page;
			 $num = (isset($page))? ($limit*($page-1))+1:1;
             foreach ($rs as $val){
                // foreach ($patientProgressList as $progress) {
				// $brchname = $engine->getBranch($val['USR_BRCHID']); {
                    // var_dump($result);
                    //   $status_name = '';
                    // $status_color = '';

                    // if ($val['P_status'] == 1) {
                    //     $status_name = 'Active';
                    //     $status_color = 'success';
                    // } elseif ($val['P_status'] == 2) {
                    //     $status_name = 'Pending';
                    //     $status_color = 'info';
                    // } elseif ($val['P_status'] == 0) {
                    //     $status_name = 'Disable';
                    //     $status_color = 'danger';
                    // }
                    echo '<tr>
                        <td>'.$num++.'</td>
                        <td>'.$val['PatientID'].'</td>
                        
                        <td>'.$val['AssessmentData'].'</td>
                        <td>'.$val['TreatmentPlan'].'</td>
                        <td>'.$val['ProgressNotes'].'</td>
                        <td>
                            <div align="center">
                                <button type="submit" class="btn btn-info text-white" role="button" onClick="document.getElementById(\'target\').value=\'editpatient\';document.getElementById(\'view\').value=\'details\';document.getElementById(\'keys\').value=\''.$val['PatientID'].'\';document.myform.submit()">
                                    <i class="fa fa-eye"></i> View Details
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
                    </div>
        </form>