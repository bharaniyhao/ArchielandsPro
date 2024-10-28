<!-- START HEADER-->
<header class="header clf">
    <div class="page-brand"><a class="link" href="index.html"><span class="brand"><span class="brand-tip">physiotherapy</span></span><span class="brand-mini">PS</span></a></div>
    <!-- START TOP-LEFT TOOLBAR-->
    <ul class="nav pull-left navbar-toolbar">
        <li><a class="nav-link sidebar-toggler js-sidebar-toggler"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></a></li>
        <li><a class="nav-link search-toggler js-search-toggler"><i class="fa fa-search"></i><span>Search here...</span></a></li>
    </ul>
    <!-- END TOP-LEFT TOOLBAR-->
    <!-- START TOP-RIGHT TOOLBAR-->
    <ul class="nav pull-right navbar-toolbar">
        <!-- <li class="timeout-toggler"><a class="nav-link" data-toggle="modal" data-target="#session-dialog"><i class="fa fa-android timeout-toggler-icon rel"><span class="notify-signal"></span></i></a></li> -->
        <li class="dropdown dropdown-inbox"><a class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i><span class="envelope-badge">9</span></a>
            <ul class="dropdown-menu dropdown-menu-right dropdown-menu-media">
                <li class="dropdown-menu-header">
                    <div><span><strong>9 New</strong> Messages</span><a class="pull-right" href="mailbox.html">view all</a></div>
                </li>
                <li class="list-group list-group-divider scroller" data-height="240px" data-color="#71808f">
                    <div><a class="list-group-item">
                            <div class="media">
                                <div class="media-img"><img class="img-circle" src="media/assets/img/users/u1.jpg" />
                                </div>
                                <div class="media-body">
                                    <div class="font-strong">Jeanne Gonzalez</div>
                                    <div class="font-13">Your proposal interested me.</div><small class="text-muted">Just now</small>
                                </div>
                            </div>
                        </a><a class="list-group-item">
                            <div class="media">
                                <div class="media-img"><img class="img-circle" src="media/assets/img/users/u2.jpg" />
                                </div>
                                <div class="media-body">
                                    <div class="font-strong">Becky Brooks</div>
                                    <div class="font-13">Lorem Ipsum is simply.</div><small class="text-muted">18 mins</small>
                                </div>
                            </div>
                        </a><a class="list-group-item">
                            <div class="media">
                                <div class="media-img"><img class="img-circle" src="media/assets/img/users/u3.jpg" />
                                </div>
                                <div class="media-body">
                                    <div class="font-strong">Frank Cruz</div>
                                    <div class="font-13">Lorem Ipsum is simply.</div><small class="text-muted">18 mins</small>
                                </div>
                            </div>
                        </a><a class="list-group-item">
                            <div class="media">
                                <div class="media-img"><img class="img-circle" src="media/assets/img/users/u4.jpg" />
                                </div>
                                <div class="media-body">
                                    <div class="font-strong">Rose Pearson</div>
                                    <div class="font-13">Lorem Ipsum is simply.</div><small class="text-muted">3 hrs</small>
                                </div>
                            </div>
                        </a></div>
                </li>
            </ul>
        </li>
        <li class="dropdown dropdown-notification"><a class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell rel"><span class="envelope-badge">9</span><span class="notify-signal"></span></i></a>
            <ul class="dropdown-menu dropdown-menu-right dropdown-menu-media">
                <li class="dropdown-menu-header">
                    <div><span><strong>5 New</strong> Notifications</span><a class="pull-right" href="javascript:;">view all</a></div>
                </li>
                <li class="list-group list-group-divider scroller" data-height="240px" data-color="#71808f">
                    <div><a class="list-group-item">
                            <div class="media">
                                <div class="media-img"><span class="badge badge-success badge-circle-big"><i class="fa fa-check"></i></span></div>
                                <div class="media-body">
                                    <div class="font-13">4 task compiled</div><small class="text-muted">22 mins</small>
                                </div>
                            </div>
                        </a><a class="list-group-item">
                            <div class="media">
                                <div class="media-img"><span class="badge badge-default badge-circle-big"><i class="fa fa-shopping-basket"></i></span></div>
                                <div class="media-body">
                                    <div class="font-13">You have 12 new orders</div><small class="text-muted">40 mins</small>
                                </div>
                            </div>
                        </a><a class="list-group-item">
                            <div class="media">
                                <div class="media-img"><span class="badge badge-danger badge-circle-big"><i class="fa fa-bolt"></i></span></div>
                                <div class="media-body">
                                    <div class="font-13">Server #7 rebooted</div><small class="text-muted">2 hrs</small>
                                </div>
                            </div>
                        </a><a class="list-group-item">
                            <div class="media">
                                <div class="media-img"><span class="badge badge-success badge-circle-big"><i class="fa fa-user"></i></span></div>
                                <div class="media-body">
                                    <div class="font-13">New user registered</div><small class="text-muted">2 hrs</small>
                                </div>
                            </div>
                        </a></div>
                </li>
            </ul>
        </li>
        <li class="dropdown dropdown-user"><a class="nav-link dropdown-toggle link" data-toggle="dropdown"><span><?= $session->get('loginuserfulname'); ?></span><img src="media/assets/img/users/thumb-1%402x.png"></a>
            <ul class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item"   href="<?= 'index.php?pg=' . md5('profile') . '&target=' . md5('profile') ?>"><i class="ti-user"></i>Profile</a>
                <a class="dropdown-item"   href="<?= 'index.php?pg=' . md5('settings') . '&target=' . md5('settings') ?>"><i class="ti-settings"></i>Settings</a>
                <a class="dropdown-item"   href="<?= 'index.php?pg=' . md5('support') . '&target=' . md5('support') ?>"><i class="ti-support"></i>Support</a>
                <li class="dropdown-divider"></li><a class="dropdown-item" href="index.php?action=logout"><i class="ti-power-off"></i>Logout</a>
            </ul>
             
        </li>
    </ul>
    <!-- END TOP-RIGHT TOOLBAR-->
</header>
<!-- END HEADER-->