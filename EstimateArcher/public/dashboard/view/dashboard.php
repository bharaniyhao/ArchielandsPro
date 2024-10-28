<?php
 $url = basename($_SERVER['PHP_SELF']);
 $query = $_SERVER['QUERY_STRING'];
 if($query){
 $url .= "?".$query;
 }
 $_SESSION['current_page'] = $url;
 
 ?>
     <?php $rs = $paging->paginate(); ?>



    <!-- Your HTML code here -->
    <div class="page-content fade-in-up">
    
        <!-- <div class="col-lg-3 col-md-6">
            <div class="ibox widget-stat">
                <div class="ibox-body">
                    <h2 class="m-b-5">$5800</h2>
                    <div class="text-muted m-b-20">TOTAL INCOME</div><i class="la la-money widget-stat-icon text-success"></i>
                    <div class="progress m-b-5">
                        <div class="progress-bar progress-bar-success" role="progressbar" style="width:50%; height:5px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="d-flex justify-content-between"><small>Progress</small><span class="text-success font-12"><i class="fa fa-level-up"></i> +33%</span></div>
                </div>
            </div>
        </div> -->
    
        <!-- <div class="col-lg-4">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Statistics</div>
                    <div class="ibox-tools"><a class="dropdown-toggle" data-toggle="dropdown"><i class="ti-more-alt"></i></a>
                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item">option 1</a><a class="dropdown-item">option 2</a></div>
                    </div>
                </div>
                <div class="ibox-body">
                    <div class="h2 m-0">$12,400<sup>.60</sup><i class="ti-stats-up float-right text-success" style="font-size:40px;"></i></div>
                    <div class="text-muted m-t-5">MONTH INCOME</div>
                    <div class="m-t-20 m-b-20">
                        <div class="h4 m-0">120</div>
                        <div class="d-flex justify-content-between"><small>Data Example</small><span class="text-success font-12" style="font-size: 12px;"><i class="fa fa-level-up"></i> +24%</span></div>
                        <div class="progress m-t-5">
                            <div class="progress-bar progress-bar-success" role="progressbar" style="width:50%; height:5px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <div class="m-b-20">
                        <div class="h4 m-0">86</div>
                        <div class="d-flex justify-content-between"><small>Data Example</small><span class="text-warning font-12" style="font-size: 12px;"><i class="fa fa-level-down"></i> -12%</span></div>
                        <div class="progress m-t-5">
                            <div class="progress-bar progress-bar-warning" role="progressbar" style="width:50%; height:5px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
    </div>


     <!-- Your else HTML code here -->
     <div class="page-content fade-in-up">
    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="ibox widget-stat">
                <div class="ibox-body">
                    <h2 class="m-b-5"><?= ($totalactive ?? '0') ?></h2>
                    <div class="text-muted m-b-20"> Booked </div><i class="ti-user widget-stat-icon text-success"></i>
                    <div class="progress m-b-5">
                        <div class="progress-bar progress-bar-success" role="progressbar" style="width:50%; height:5px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="d-flex justify-content-between"><small>Progress</small><span class="text-success font-12"><i class="fa fa-level-up"></i> +24%</span></div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="ibox widget-stat">
                <div class="ibox-body">
                    <h2 class="m-b-5">605</h2>
                    <div class="text-muted m-b-20">Pending Payment</div><i class="ti-shopping-cart widget-stat-icon text-success"></i>
                    <div class="progress m-b-5">
                        <div class="progress-bar progress-bar-warning" role="progressbar" style="width:50%; height:5px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="d-flex justify-content-between"><small>Progress</small><span class="text-warning font-12"><i class="fa fa-level-down"></i> -12%</span></div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="ibox widget-stat">
                <div class="ibox-body">
                    <h2 class="m-b-5">00</h2>
                    <div class="text-muted m-b-20">available rooms</div><i class="la la-money widget-stat-icon text-success"></i>
                    <div class="progress m-b-5">
                        <div class="progress-bar progress-bar-success" role="progressbar" style="width:50%; height:5px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="d-flex justify-content-between"><small>Progress</small><span class="text-success font-12"><i class="fa fa-level-up"></i> +33%</span></div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="ibox widget-stat">
                <div class="ibox-body">
                    <h2 class="m-b-5">405</h2>
                    <div class="text-muted m-b-20">Site Vister's</div><i class="ti-eye widget-stat-icon text-success"></i>
                    <div class="progress m-b-5">
                        <div class="progress-bar progress-bar-danger" role="progressbar" style="width:50%; height:5px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="d-flex justify-content-between"><small>Progress</small><span class="text-danger font-12"><i class="fa fa-level-down"></i> -22%</span></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8">
            <div class="ibox">
                <div class="ibox-body">
                    <div>
                        <canvas id="bar_chart" style="height:260px;"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Statistics</div>
                    <div class="ibox-tools"><a class="dropdown-toggle" data-toggle="dropdown"><i class="ti-more-alt"></i></a>
                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item">option 1</a><a class="dropdown-item">option 2</a></div>
                    </div>
                </div>
                <div class="ibox-body">
                    <div class="h2 m-0">$12,400<sup>.60</sup><i class="ti-stats-up float-right text-success" style="font-size:40px;"></i></div>
                    <div class="text-muted m-t-5">MONTH INCOME</div>
                    <div class="m-t-20 m-b-20">
                        <div class="h4 m-0">120</div>
                        <div class="d-flex justify-content-between"><small>Data Example</small><span class="text-success font-12" style="font-size: 12px;"><i class="fa fa-level-up"></i> +24%</span></div>
                        <div class="progress m-t-5">
                            <div class="progress-bar progress-bar-success" role="progressbar" style="width:50%; height:5px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <div class="m-b-20">
                        <div class="h4 m-0">86</div>
                        <div class="d-flex justify-content-between"><small>Data Example</small><span class="text-warning font-12" style="font-size: 12px;"><i class="fa fa-level-down"></i> -12%</span></div>
                        <div class="progress m-t-5">
                            <div class="progress-bar progress-bar-warning" role="progressbar" style="width:50%; height:5px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8">
            <div class="ibox ibox-fullheight">
                <div class="ibox-head">
                    <div class="ibox-title">All Bookings</div>
                    <div class="ibox-tools"><a class="dropdown-toggle" data-toggle="dropdown"><i class="ti-more-alt"></i></a>
                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item">option 1</a><a class="dropdown-item">option 2</a></div>
                    </div>
                </div>
                <div class="ibox-body">
                    <div class="ibox-fullwidth-block">
                        <table class="table table-striped table-hover no-border m-b-0">
                            <thead>
                                <tr>
                                    <th class="p-l-05">#</th>
                                    <th>Category</th>
                                    <!-- <th>Description</th> -->
                                    <th>Room Number</th>
                                    <th>Bookedby</th>
                                    <th>Status</th>
                                    <!-- <th>Status</th> -->
                                    <!-- <th class="p-r-05" width="91px">Date</th> -->
                                </tr>
                            </thead>
                            <tbody>
            <?php 
                $num = 1;
                
            if($paging->total_rows > 0){
                $page = (empty($page))? 1:$page;
             $num = (isset($page))? ($limit*($page-1))+1:1;
             foreach ($rs as $val){
                
                      $status_name = '';
                    $status_color = '';

                    if ($val['estimateCode'] == 1) {
                        $status_name = 'Pending';
                        $status_color = 'success';
                    } elseif ($val['estimateCode'] == 2) {
                        $status_name = 'Booked';
                        $status_color = 'info';
                    } elseif ($val['estimateCode'] == 3) {
                        $status_name = 'Refunded';
                        $status_color = 'warning';
                    }elseif ($val['estimateCode'] == 4) {
                        $status_name = 'Rejected';
                        $status_color = 'danger';
                    }
                    echo '<tr>
                        <td>'.$num++.'</td>
                        <td>'.$val['estimator_name'].'</td>
                        <td>'.$val['estimator_category'].'</td>
                            <td>'.$val['amount']. '</td>   
                        
                                         
                        <td><span class="badge badge-' . $status_color . '">' . $status_name . '</span></td>';
                }
            }
        // }
            ?>
        </tbody>                        </table>
                    </div>
                </div>
                <div class="ibox-footer text-center"><a href="<?= 'index.php?pg=' . md5('assessment') . '&option=' . md5('allbooking') ?>">View All</a></div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="ibox ibox-fullheight">
                <div class="ibox-head">
                    <div class="ibox-title">Tasks</div>
                    <div class="ibox-tools"><a><i class="ti-plus"></i></a></div>
                </div>
                <div class="ibox-body">
                    <ul class="list-group list-group-divider list-group-full tasks-list">
                        <li class="list-group-item task-item">
                            <div>
                                <label class="ui-checkbox ui-checkbox-gray ui-checkbox-success">
                                    <input type="checkbox" checked=""><span class="input-span"></span><span class="task-title">Send photos to Jack</span>
                                </label>
                            </div>
                            <div class="task-data"><small class="text-muted">29 May 2018</small></div>
                            <div class="task-actions"><a class="dropdown-toggle" data-toggle="dropdown"><i class="ti-more-alt"></i></a>
                                <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item"><i class="ti-pencil-alt m-r-10"></i>Edit</a><a class="dropdown-item"><i class="ti-close m-r-10"></i>Remove</a></div>
                            </div>
                        </li>
                        <li class="list-group-item task-item">
                            <div>
                                <label class="ui-checkbox ui-checkbox-gray ui-checkbox-success">
                                    <input type="checkbox"><span class="input-span"></span><span class="task-title">Create Financial Report</span>
                                </label>
                            </div>
                            <div class="task-data"><small class="text-muted">No due date</small></div>
                            <div class="task-actions"><a class="dropdown-toggle" data-toggle="dropdown"><i class="ti-more-alt"></i></a>
                                <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item"><i class="ti-pencil-alt m-r-10"></i>Edit</a><a class="dropdown-item"><i class="ti-close m-r-10"></i>Remove</a></div>
                            </div>
                        </li>
                        <li class="list-group-item task-item">
                            <div>
                                <label class="ui-checkbox ui-checkbox-gray ui-checkbox-success">
                                    <input type="checkbox" checked=""><span class="input-span"></span><span class="task-title">Meeting with Ann</span>
                                </label><span class="badge badge-warning m-l-5"><i class="ti-alarm-clock"></i> 1 hrs</span>
                            </div>
                            <div class="task-data"><small class="text-muted">29 May 2018</small></div>
                            <div class="task-actions"><a class="dropdown-toggle" data-toggle="dropdown"><i class="ti-more-alt"></i></a>
                                <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item"><i class="ti-pencil-alt m-r-10"></i>Edit</a><a class="dropdown-item"><i class="ti-close m-r-10"></i>Remove</a></div>
                            </div>
                        </li>
                        <li class="list-group-item task-item">
                            <div>
                                <label class="ui-checkbox ui-checkbox-gray ui-checkbox-success">
                                    <input type="checkbox"><span class="input-span"></span><span class="task-title">Edit the blog post</span>
                                </label>
                            </div>
                            <div class="task-data"><small class="text-muted">29 May 2018</small></div>
                            <div class="task-actions"><a class="dropdown-toggle" data-toggle="dropdown"><i class="ti-more-alt"></i></a>
                                <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item"><i class="ti-pencil-alt m-r-10"></i>Edit</a><a class="dropdown-item"><i class="ti-close m-r-10"></i>Remove</a></div>
                            </div>
                        </li>
                        <li class="list-group-item task-item">
                            <div>
                                <label class="ui-checkbox ui-checkbox-gray ui-checkbox-success">
                                    <input type="checkbox"><span class="input-span"></span><span class="task-title">Send message to Bob</span>
                                </label><span class="badge badge-success m-l-5">Today</span>
                            </div>
                            <div class="task-data"><small class="text-muted">29 May 2018</small></div>
                            <div class="task-actions"><a class="dropdown-toggle" data-toggle="dropdown"><i class="ti-more-alt"></i></a>
                                <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item"><i class="ti-pencil-alt m-r-10"></i>Edit</a><a class="dropdown-item"><i class="ti-close m-r-10"></i>Remove</a></div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
 



    <!--
    <div class="row">
        <div class="col-lg-8">
            <div class="ibox ibox-fullheight">
                <div class="ibox-head">
                    <div class="ibox-title">New Posts</div>
                    <div class="ibox-tools"><a class="dropdown-toggle" data-toggle="dropdown"><i class="ti-more-alt"></i></a>
                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item"> <i class="ti-pencil-alt m-r-10"></i>Edit</a><a class="dropdown-item"> <i class="ti-close m-r-10"></i>Remove</a></div>
                    </div>
                </div>
                <div class="ibox-body">
                    <ul class="media-list media-list-divider m-0">
                        <li class="media"><a class="media-img" href="javascript:;"><img src="assets/img/blog/macarons.jpg" width="120px" /></a>
                            <div class="media-body d-flex">
                                <div class="flex-1">
                                    <h5 class="media-heading"><a href="article.html">Perfect Programming</a></h5>
                                    <p class="font-13">Cillum in incididunt reprehenderit qui reprehenderit nulla ut sint</p>
                                    <div class="font-13"><span class="mr-4">Created: <a class="text-success" href="javascript:;">10.08.2018</a></span><span class="text-muted mr-4"><i class="fa fa-heart mr-1"></i> 56</span><span class="text-muted"><i class="fa fa-comment mr-1"></i> 124</span></div>
                                </div>
                                <div class="text-right" style="width:100px;">
                                    <h3 class="mb-1 font-strong text-success">5800</h3>
                                    <div class="text-muted">views</div>
                                </div>
                            </div>
                        </li>
                        <li class="media"><a class="media-img" href="javascript:;"><img src="assets/img/blog/magnifying-glass.jpg" width="120px" /></a>
                            <div class="media-body d-flex">
                                <div class="flex-1">
                                    <h5 class="media-heading"><a href="article.html">Perfect Programming</a></h5>
                                    <p class="font-13">Cillum in incididunt reprehenderit qui reprehenderit nulla ut sint</p>
                                    <div class="font-13"><span class="mr-4">Created: <a class="text-success" href="javascript:;">10.08.2018</a></span><span class="text-muted mr-4"><i class="fa fa-heart mr-1"></i> 56</span><span class="text-muted"><i class="fa fa-comment mr-1"></i> 124</span></div>
                                </div>
                                <div class="text-right" style="width:100px;">
                                    <h3 class="mb-1 font-strong text-success">5240</h3>
                                    <div class="text-muted">views</div>
                                </div>
                            </div>
                        </li>
                        <li class="media"><a class="media-img" href="javascript:;"><img src="assets/img/blog/seascape.jpg" width="120px" /></a>
                            <div class="media-body d-flex">
                                <div class="flex-1">
                                    <h5 class="media-heading"><a href="article.html">Perfect Programming</a></h5>
                                    <p class="font-13">Cillum in incididunt reprehenderit qui reprehenderit nulla ut sint</p>
                                    <div class="font-13"><span class="mr-4">Created: <a class="text-success" href="javascript:;">10.08.2018</a></span><span class="text-muted mr-4"><i class="fa fa-heart mr-1"></i> 56</span><span class="text-muted"><i class="fa fa-comment mr-1"></i> 124</span></div>
                                </div>
                                <div class="text-right" style="width:100px;">
                                    <h3 class="mb-1 font-strong text-success">4780</h3>
                                    <div class="text-muted">views</div>
                                </div>
                            </div>
                        </li>
                        <li class="media"><a class="media-img" href="javascript:;"><img src="assets/img/blog/candles.jpg" width="120px"></a>
                            <div class="media-body d-flex">
                                <div class="flex-1">
                                    <h5 class="media-heading"><a href="article.html">Perfect Programming</a></h5>
                                    <p class="font-13">Cillum in incididunt reprehenderit qui reprehenderit nulla ut sint</p>
                                    <div class="font-13"><span class="mr-4">Created: <a class="text-success" href="javascript:;">10.08.2018</a></span><span class="text-muted mr-4"><i class="fa fa-heart mr-1"></i> 56</span><span class="text-muted"><i class="fa fa-comment mr-1"></i> 124</span></div>
                                </div>
                                <div class="text-right" style="width:100px;">
                                    <h3 class="mb-1 font-strong text-success">4200</h3>
                                    <div class="text-muted">views</div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
       <div class="col-lg-4">
            <div class="ibox ibox-fullheight">
                <div class="ibox-head">
                    <div class="ibox-title">Best Tags</div>
                    <div class="ibox-tools"><a class="dropdown-toggle" data-toggle="dropdown"><i class="ti-more-alt"></i></a>
                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item"> <i class="ti-pencil-alt m-r-10"></i>Edit</a><a class="dropdown-item"> <i class="ti-close m-r-10"></i>Remove</a></div>
                    </div>
                </div>
                <div class="ibox-body">
                    <ul class="media-list media-list-divider m-0">
                        <li class="media"><a class="media-img" href="javascript:;"><img src="assets/img/devicons/bootstrap.svg" width="40px" /></a>
                            <div class="media-body d-flex">
                                <div class="flex-1">
                                    <div class="media-heading">Bootstrap</div>
                                    <p class="font-13">Lorem ipsum dolar set...</p>
                                </div>
                                <div class="text-right" width="100px">
                                    <h4 class="mb-1 font-strong">1200</h4>
                                    <div class="text-muted">posts</div>
                                </div>
                            </div>
                        </li>
                        <li class="media"><a class="media-img" href="javascript:;"><img src="assets/img/devicons/angularjs.svg" width="40px" /></a>
                            <div class="media-body d-flex">
                                <div class="flex-1">
                                    <div class="media-heading">AngularJS</div>
                                    <p class="font-13">Lorem ipsum dolar set...</p>
                                </div>
                                <div class="text-right" width="100px">
                                    <h4 class="mb-1 font-strong">1140</h4>
                                    <div class="text-muted">posts</div>
                                </div>
                            </div>
                        </li>
                        <li class="media"><a class="media-img" href="javascript:;"><img src="assets/img/devicons/laravel.svg" width="40px" /></a>
                            <div class="media-body d-flex">
                                <div class="flex-1">
                                    <div class="media-heading">Laravel</div>
                                    <p class="font-13">Lorem ipsum dolar set...</p>
                                </div>
                                <div class="text-right" width="100px">
                                    <h4 class="mb-1 font-strong">980</h4>
                                    <div class="text-muted">posts</div>
                                </div>
                            </div>
                        </li>
                        <li class="media"><a class="media-img" href="javascript:;"><img src="assets/img/devicons/php.svg" width="40px" /></a>
                            <div class="media-body d-flex">
                                <div class="flex-1">
                                    <div class="media-heading">PHP</div>
                                    <p class="font-13">Lorem ipsum dolar set...</p>
                                </div>
                                <div class="text-right" width="100px">
                                    <h4 class="mb-1 font-strong">745</h4>
                                    <div class="text-muted">posts</div>
                                </div>
                            </div>
                        </li>
                        <li class="media"><a class="media-img" href="javascript:;"><img src="assets/img/devicons/react.svg" width="40px" /></a>
                            <div class="media-body d-flex">
                                <div class="flex-1">
                                    <div class="media-heading">ReactJS</div>
                                    <p class="font-13">Lorem ipsum dolar set...</p>
                                </div>
                                <div class="text-right" width="100px">
                                    <h4 class="mb-1 font-strong">620</h4>
                                    <div class="text-muted">posts</div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>