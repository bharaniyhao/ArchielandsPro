<!-- START SIDEBAR-->
<nav class="page-sidebar" id="sidebar">
    <div id="sidebar-collapse">
        <ul class="side-menu metismenu">
            <li class="active"><a href="<?= 'index.php?pg=dashboard' ?>"><i class="sidebar-item-icon fa fa-th-large"></i><span class="nav-label">Dashboard</span></a>

            </li>
            <li class="heading">FEATURES</li>
            <li><a href="#"><i class="sidebar-item-icon fa fa-bookmark"></i><span class="nav-label">Settings</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li><a href="<?= 'index.php?pg=' . md5('settings') . '&target=' . md5('manageusers') ?>">Users</a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('settings') . '&target=' . md5('account') ?>" >Account</a>
                    </li>
                    <li><a href="buttons.html">Buttons</a>
                    </li>
                </ul>
            </li>

            <li><a href="href%3d_javascript_%3b_.html"><i class="sidebar-item-icon fa fa-table"></i><span class="nav-label">account</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                   <li><a href="<?= 'index.php?pg=' . md5('products') . '&target=' . md5('allproducts') ?>">All Products and Services</a>
                    </li>
                    <li><a href="table_bootstrap.html">Bootstrap Tables</a>
                    </li>
                    <li><a href="datatables.html">Datatables</a>
                    </li>
                    <li><a href="footable.html">Foo Tables</a>
                    </li>
                </ul>
            </li>
             <li><a href="href%3d_javascript_%3b_.html"><i class="sidebar-item-icon fa fa-user"></i><span class="nav-label">Customers</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                   <li><a href="<?= 'index.php?pg=' . md5('customers') . '&target=' . md5('customers') ?>">List</a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('customers') . '&target=' . md5('customers') ?>">Add</a>
                    </li>
                
                </ul>
            </li>

            <li><a href="widgets.html"><i class="sidebar-item-icon fa fa-puzzle-piece"></i><span class="nav-label">Clients</span></a></li>
            <li><a href="href%3d_javascript_%3b_.html"><i class="sidebar-item-icon fa fa-map"></i><span class="nav-label">Maps</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li><a href="maps_google.html">Google maps</a>
                    </li>
                    <li><a href="datamaps.html">Datamaps</a>
                    </li>
                    <li><a href="maps_vector.html">Vector maps</a>
                    </li>
                </ul>
            </li>
            <li><a href="icons.html"><i class="sidebar-item-icon fa fa-smile-o"></i><span class="nav-label">Sellers</span></a></li>
            <li class="heading">PAGES</li>

            <li><a href="href%3d_javascript_%3b_.html"><i class="sidebar-item-icon fa fa-pencil"></i><span class="nav-label">Blog</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li><a href="blog_list.html">List</a>
                    </li>
                    <li><a href="article.html">Article</a>
                    </li>
                </ul>
            </li>
            <li><a href="calendar.html"><i class="sidebar-item-icon fa fa-calendar"></i><span class="nav-label">Calendar</span></a></li>
        </ul>
        <div class="sidebar-footer"><a href="javascript:;"><i class="fa fa-bullhorn"></i></a><a href="calendar.html"><i class="fa fa-calendar"></i></a><a href="javascript:;"><i class="fa fa-commenting"></i></a><a href="login.html"><i class="fa fa-power-off"></i></a></div>
    </div>
</nav>