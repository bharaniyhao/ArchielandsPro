<?php
$actordetails = $engine->getActorsDetails();
$actorlevel = $actordetails->USR_LEVEL;

$catmenu = $menus->getAllCategory();

?>

<!-- START SIDEBAR-->
<nav class="page-sidebar" id="sidebar">
    <div id="sidebar-collapse">
        <ul class="side-menu metismenu">
            <li class="active"><a href="<?= 'index.php?pg=dashboard' ?>"><i class="sidebar-item-icon fa fa-th-large"></i><span class="nav-label">Dashboard</span></a>

            </li>

             <li class="heading">PAGES</li>

             
             <li><a href="#"><i class="sidebar-item-icon fa fa-user"></i><span class="nav-label"> Patient </span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">

                   <li>
                    <a href="<?= 'index.php?pg=' . md5('patient') . '&target=' . md5('patients') ?>"> Patient List </a>
                    </li>
                    
                    <li>
                        <a href="<?= 'index.php?pg=' . md5('patient') . '&target=' . md5('managepatient') ?>"> Manage Patient </a>
                    </li>
                
                </ul>
            </li>
             <li><a href="#"><i class="sidebar-item-icon fa fa-calendar"></i><span class="nav-label"> Appointments </span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                   <li><a href="<?= 'index.php?pg=' . md5('appointments') . '&target=' . md5('appointments') ?>"> Appointments </a>
                    </li>
                    <!-- <li><a href="<?= 'index.php?pg=' . md5('patient') . '&target=' . md5('patient') ?>"> Schedule </a> -->
                    </li>
                
                </ul>
            </li>
            <li><a href="#"><i class="sidebar-item-icon fa fa-smile-o"></i><span class="nav-label">Physiotherapist</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                   <li><a href="<?= 'index.php?pg=' . md5('therapist') . '&target=' . md5('therapist') ?>"> Therapist </a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('therapist') . '&target=' . md5('managetherapist') ?>"> Manager Therapist </a>
                    </li>
                
                </ul>
            </li>
             <li><a href="#"><i class="sidebar-item-icon fa fa-medkit"></i><span class="nav-label">Treatment </span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                   <li><a href="<?= 'index.php?pg=' . md5('treatment') . '&target=' . md5('treatment') ?>"> Treatment List</a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('customers') . '&target=' . md5('customers') ?>">Prescribe Exercise </a>
                    </li>
                
                </ul>
            </li>
             <li><a href="#"><i class="sidebar-item-icon fa fa-medkit"></i><span class="nav-label">Treatment plans</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                   <li><a href="<?= 'index.php?pg=' . md5('treatmentPlan') . '&target=' . md5('treatmentPlan') ?>"> Treatment plans </a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('customers') . '&target=' . md5('customers') ?>">Prescribe Exercise </a>
                    </li>
                
                </ul>
            </li>

              <li><a href="#"><i class="sidebar-item-icon fa fa-spinner"></i><span class="nav-label">Patient Progress</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                   <li><a href="<?= 'index.php?pg=' . md5('progress') . '&target=' . md5('progress') ?>"> Progress Tracking</a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('Progress') . '&target=' . md5('customers') ?>">Prescribe Exercise </a>
                    </li>
                
                </ul>
            </li>
             <li><a href="#"><i class="sidebar-item-icon fa fa-info"></i><span class="nav-label"> Financial </span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                   <li><a href="<?= 'index.php?pg=' . md5('financial') . '&target=' . md5('financial') ?>"> View Invoices</a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('customers') . '&target=' . md5('customers') ?>"> Create Invoice: </a>
                    </li>
                
                </ul>
            </li>
             <li><a href="#"><i class="sidebar-item-icon fa fa-file"></i><span class="nav-label"> Documents </span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                   <li><a href="<?= 'index.php?pg=' . md5('documents') . '&target=' . md5('documents') ?>"> view </a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('customers') . '&target=' . md5('customers') ?>"> Uploads Document  </a>
                    </li>
                
                </ul>
            </li>
            <li><a href=""><i class="sidebar-item-icon fa fa-pencil"></i><span class="nav-label">Monitoring/Evaluation</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li><a href="<?= 'index.php?pg=' . md5('monitoring') . '&target=' . md5('monitoring') ?>"> Monitoring List</a>
                    </li>
                    <li><a href="article.html">Article</a>
                    </li>
                </ul>
            </li> 
            <li><a href="#"><i class="sidebar-item-icon fa fa-pencil"></i><span class="nav-label">Discharge</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                <li><a href="<?= 'index.php?pg=' . md5('discharge') . '&target=' . md5('discharge') ?>"> Discharge List</a>
                    </li>
                    <li><a href="article.html">Article</a>
                    </li>
                </ul>
            </li> 
            

             <li><a href="#"><i class="sidebar-item-icon fa fa-medkit"></i><span class="nav-label">Assessment</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li><a href="<?= 'index.php?pg=' . md5('assesstment') . '&target=' . md5('assessment') ?>"> Assessment</a>
                    </li>
                   <li><a href="<?= 'index.php?pg=' . md5('assesstment') . '&target=' . md5('objective') ?>"> Objective</a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('assesstment') . '&target=' . md5('subjective') ?>">Subjective</a>
                    <li><a href="<?= 'index.php?pg=' . md5('assesstment') . '&target=' . md5('diagnosis') ?>">Diagnosis </a>
                    <li><a href="<?= 'index.php?pg=' . md5('assesstment') . '&target=' . md5('prognosis') ?>">Prognosis </a>
                    </li>
                
                </ul>
            </li>

              <li><a href="#"><i class="sidebar-item-icon fa fa-user"></i><span class="nav-label">Communication</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                   <li><a href="<?= 'index.php?pg=' . md5('communication') . '&target=' . md5('message') ?>">List</a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('customers') . '&target=' . md5('customers') ?>">Add</a>
                    </li>
                
                </ul>
            </li>
              <li><a href="#"><i class="sidebar-item-icon fa fa-flag"></i><span class="nav-label"> Reports & Analytics: </span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                   <li><a href="<?= 'index.php?pg=' . md5('products') . '&target=' . md5('allproducts') ?>">List</a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('products') . '&target=' . md5('products') ?>">Add</a>
                    </li>
                
                </ul>
            </li>

            
            <li class="heading">FEATURES</li>
            <li><a href="#"><i class="sidebar-item-icon fa fa-bookmark"></i><span class="nav-label">Settings</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li><a href="<?= 'index.php?pg=' . md5('setup') . '&target=' . md5('manageusers') ?>"> Manageusers</a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('setup') . '&target=' . md5('account') ?>"> Accounts </a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('products') . '&target=' . md5('allproducts') ?>"> products User </a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('setup') . '&target=' . md5('manageproductsbrands') ?>">Product Brands</a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('setup') . '&target=' . md5('platform_fees') ?>">Platform Fees</a>
                    </li>
                </ul>
            </li>

            <li><a href="#"><i class="sidebar-item-icon fa fa-table"></i><span class="nav-label"> Audit Trail </span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                   <li><a href="<?= 'index.php?pg=' . md5('trail') . '&target=' . md5('trail') ?>">All </a>
                    </li>
                    <li><a href="#">Bootstrap Tables</a>
                    </li>
                    <li><a href="#">Datatables</a>
                    </li>
                    <li><a href="#">Foo Tables</a>
                    </li>
                </ul>
            </li>
              <li><a href="#"><i class="sidebar-item-icon fa fa-user"></i><span class="nav-label">User Account</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                   <li><a href="<?= 'index.php?pg=' . md5('setup') . '&target=' . md5('users') ?>">List</a>
                    </li>
                    <li><a href="<?= 'index.php?pg=' . md5('users') . '&target=' . md5('users') ?>">Add</a>
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
            <!-- <li><a href="icons.html"><i class="sidebar-item-icon fa fa-smile-o"></i><span class="nav-label">Empty</span></a></li>
            <li><a href="calendar.html"><i class="sidebar-item-icon fa fa-calendar"></i><span class="nav-label">Calendar</span></a></li> -->
           
        </ul>
        <div class="sidebar-footer"><a href="javascript:;"><i class="fa fa-bullhorn"></i></a><a href="calendar.html"><i class="fa fa-calendar"></i></a><a href="javascript:;"><i class="fa fa-commenting"></i></a><a href="index.php?action=logout"><i class="fa fa-power-off"></i></a></div>
    </div>
</nav>