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
                            <input type="text" tabindex="1" value="<?php echo $fdsearch; ?>" class="form-control square-input" name="fdsearch" placeholder="Search Customer" />
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
                        <button type="submit" onclick="document.getElementById('action_search').value='';document.getElementById('view').value='add'; document.getElementById('viewpage').value='';document.myform.submit();" class="btn btn-success btn-square"> <i class="fa fa-user"></i> Add Customers</button>
                    </div>
                </div>
            </div>

           <div class="table-responsive">
    <table class="table table-striped table-bordered table-hover" id="example-table">
        <thead>
            <tr>
                <th>#</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if ($result['count'] > 0 && !empty($result['results'])) {
                $num = 1;
                foreach ($result['results'] as $cust) {
                    var_dump($result);
                    if ($cust['status'] == '1') {
                        $status_name = 'Active';
                        $status_color = 'success';
                    } else {
                        $status_name = 'Inactive';
                        $status_color = 'danger';
                    }

                    echo '<tr>
                        <td>' . $num++ . '</td>
                        <td>' . $cust['firstname'] . ' ' . $cust['lastname'] . '</td>
                        <td>' . $cust['email'] . '</td>
                        <td>' . $cust['Phonenumber'] . '</td>
                        <td>' . date('d-m-Y', strtotime($cust['dateadded'])) . '</td>
                        <td><span class="badge badge-' . $status_color . '">' . $status_name . '</span></td>
                        <td>
                            <button type="submit" class="btn btn-default btn-sm btn-flat" data-toggle="tooltip" data-original-title="Edit" onclick="document.getElementById(\'keys\').value = \'' . $cust['id'] . '\';document.getElementById(\'view\').value = \'add\';document.getElementById(\'viewpage\').value = \'customersedit\';"><i class="fa fa-pencil font-14"></i></button>
                            <button type="button" class="btn btn-default btn-sm btn-flat" data-toggle="tooltip" data-original-title="Delete"><i class="fa fa-trash font-14"></i></button>
                        </td>
                    </tr>';
                }
            } else {
                echo '<tr>
                    <td colspan="6">No Records Found...</td>
                </tr>';
            }
            ?>
        </tbody>
    </table>
</div>

        </div>
    </div>
</div>