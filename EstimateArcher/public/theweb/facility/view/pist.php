     <?php $rs = $paging->paginate(); ?>
        <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
      <div class="page-heading">
    <h1 class="page-title">Manager Facilities </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard">Home</a></li>
        <li class="breadcrumb-item active">Facilities</li>
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
                            <input type="text" tabindex="1" value="<?php echo $fdsearch; ?>" class="form-control square-input" name="fdsearch" placeholder="Enter Physiotherapist Name to Search" />
                            <span class="input-group-btn">
                                <button type="submit" onclick="document.getElementById('action_search').value='search';document.getElementById('viewpage').value='';document.myform.submit;" class="btn btn-default btn-gyn-search"> <i class="fa fa-search"></i> </button>
                            </span>
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="input-group">
                            <button type="submit" onclick="document.getElementById('action_search').value='';document.getElementById('target').value=''; document.getElementById('viewpage').value='reset';document.myform.submit;" class="btn btn-success btn-square btn-refresh"> <i class="fa fa-refresh"></i> </button>
                        </div>
                    </div>
                    <div class="col-sm-3 pagination-right">
                        <button type="submit" onclick="document.getElementById('action_search').value='';document.getElementById('target').value='pist'; document.getElementById('viewpage').value='';document.myform.submit();" class="btn btn-success btn-square"> <i class="fa fa-user"></i> Add Facilities </button>
                    </div>
                    
                </div>
            </div>
            <div class="table-responsive">
    <table class="table table-striped table-bordered table-hover" id="example-table">
        <thead>
            <tr>
            <th> # </th>
                <th> Category Name </th>
                <th> Description </th>
                <th> Room Number </th>
                <th> Price </th> 
                <th> Status </th>
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
				// $brchname = $engine->getBranch($val['USR_BRCHID']); {
                    // var_dump($result);
                      $status_name = '';
                    $status_color = '';                 
                    if ($val['FAC_AVAIL'] == 1) {
                        $status_name = 'Available';
                        $status_color = 'success';
                    } elseif ($val['FAC_AVAIL'] == 2) {
                        $status_name = 'Booked';
                        $status_color = 'info';
                    } elseif ($val['FAC_AVAIL'] == 3) {
                        $status_name = 'waiting';
                        $status_color = 'Pending';
                    }
                    echo '<tr>
                        <td>'.$num++.'</td>
                        <td>'.$val['FACILITY_NAME'].'</td>
                        <td>'.$val['ROOM_DETAILS'].'</td>
                        <td>'.$val['ROOM_NUM'].' </td>
                        <td>'.$val['ROOM_NUM'].' </td>
                        <td><span class="badge badge-' . $status_color . '">' . $status_name . '</span></td>
                        <td>
                            <div align="center">
<button type="submit" class="btn btn-default btn-sm btn-primary" data-toggle="tooltip" data-original-title="Update Details" onclick="document.getElementById(\'keys\').value = \'' . $val['FACILITY_ID'] . '\';document.getElementById(\'target\').value = \'edit\';document.getElementById(\'viewpage\').value = \'editfacilities\';">
                                    <i class="fa fa-pencil"></i> Update Details
                                </button>

<button type="submit" class="btn btn-default btn-sm btn-info" data-toggle="tooltip" data-original-title="View" onclick="document.getElementById(\'keys\').value = \'' . $val['FACILITY_ID'] . '\';document.getElementById(\'target\').value = \'details\';document.getElementById(\'viewpage\').value = \'editfacilities\';">
                                    <i class="fa fa-eye"></i> View Details
                                </button>
<button type="submit" class="btn btn-default btn-sm btn-danger" data-toggle="tooltip" data-original-title="Delete" onclick="document.getElementById(\'keys\').value = \'' . $val['FACILITY_ID'] . '\';document.getElementById(\'target\').value = \'\';document.getElementById(\'viewpage\').value = \'deleteuser\';">
                                    <i class="fa fa-trash"></i> Delete
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