     <?php $rs = $paging->paginate(); ?>
        <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
      <div class="page-heading">
    <h1 class="page-title">ESTIMATE List </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard">Home</a></li>
        <li class="breadcrumb-item active">ESTIMATE</li>
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
                        <button type="submit" onclick="document.getElementById('action_search').value='';document.getElementById('target').value='addest'; document.getElementById('viewpage').value='';document.myform.submit();" class="btn btn-success btn-square"> <i class="fa fa-user"></i> Generate Estimate </button>
                    </div> 
                    
                </div>
            </div>
            <div class="table-responsive">
    <table class="table table-striped table-bordered table-hover" id="example-table">
    <thead>
        <tr>
            <th> # </th>
            <!-- <th> estimateID</th> -->
            <th> Estimator Name </th>
            <th> Phone Number </th> 
            <th> Category </th>
            <th> Invoice Number</th>
            <!-- <th> Category </th> -->
            <th> Total Amount </th>
            <th> Status </th>
            <th> Actions </th>
        </tr>
    </thead>
    <tbody>
    <?php 
    $num = 1;
    
    if ($paging->total_rows > 0) {
        $page = isset($page) && is_numeric($page) ? (int)$page : 1;
        $limit = isset($limit) && is_numeric($limit) ? (int)$limit : 10; // Default limit if not set or invalid
        $num = ($limit * ($page - 1)) + 1;

        foreach ($rs as $val) {
            $status_name = '';
            $status_color = '';

            if ($val['Estimatestatus'] == 2) {
                $status_name = 'Paid';
                $status_color = 'success';
            } elseif ($val['Estimatestatus'] == 1) {
                $status_name = 'Processing';
                $status_color = 'info';
            } elseif ($val['Estimatestatus'] == 0) {
                $status_name = 'Disable';
                $status_color = 'danger';
            }

            echo '<tr>
                <td>'.$num++.'</td>
                <td>'.$val['customerName'].'</td>
                <td>'.$val['phoneNumber'].'</td>
                <td>'.$val['CategoryName'].'</td>
                <td>'.$val['invoiceNumber'].'</td>
                <td>Gh₵'.$val['totalAmount'].'</td>
                <td><span class="badge badge-' . $status_color . '">' . $status_name . '</span></td>
                <td>
                    <div align="center">
                        <button type="submit" class="btn btn-default btn-sm btn-info" data-toggle="tooltip" data-original-title="View Details" onclick="document.getElementById(\'keys\').value = \'' . $val['estimateCode'] . '\';document.getElementById(\'target\').value = \'details\';document.getElementById(\'viewpage\').value = \'Findetails\';">
                            <i class="fa fa-eye"></i> View Details
                        </button>

                        <button type="submit" class="btn btn-default btn-sm btn-info" data-toggle="tooltip" data-original-title="Update Estimate" onclick="document.getElementById(\'keys\').value = \'' . $val['estimateCode'] . '\';document.getElementById(\'target\').value = \'details\';document.getElementById(\'viewpage\').value = \'Findetails\';">
                            <i class="fa fa-pencil"></i> Update Estimate
                        </button>
                        <button type="button" class="btn btn-danger text-white" role="button" data-toggle="tooltip" data-original-title="Delete" onclick="showConfirmationAlert(\'warning\', \'Are you sure you want to Delete this Estimate?\', \'Terminate Estimate\' , \'btn-success\' ,\'Yes\' ,function()
                        
                        { document.getElementById(\'view\').value=\'\'; document.getElementById(\'keys\').value = \'' . $val['estimateCode'] . '\';document.getElementById(\'viewpage\').value=\'deletest\';document.myform.submit(); })">
                            <i class="fa fa-trash"></i> Delete
                        </button>
                        
                        
                    </div>
                </td>
            </tr>';
        }
    }
?>

    </tbody>             
</table>

</div>

                            </div>
                        </div>
                    </div>
        