<?php
$actordetails = $engine->getActorsDetails();
$actorlevel = $actordetails->USR_LEVEL;

$catmenu = $menus->getAllCategory();

/*
echo "<pre>";
print_r($catmenu);
echo "</pre>";
*/
?>
<!-- START SIDEBAR-->
<nav class="page-sidebar" id="sidebar">
    <div id="sidebar-collapse">
        <ul class="side-menu metismenu">
            <li class="sidebar-item"> 
                <a class="sidebar-link waves-effect waves-dark sidebar-link" href="index.php?action=index&pg=dashboard" aria-expanded="false">
                    <i class="sidebar-item-icon fa fa-th-large"></i>
                    <span class="nav-label">Dashboard</span>
                </a>
            </li>
            <li class="heading">PAGES</li>
            <?php
            $i = 1;
            $x = 1;
            while ($objcatmenu = $catmenu->FetchNextObject()) {
                $smtdetailsmenu = $menus->getMenuViewAccessRightSide($objcatmenu->MENUCAT_CODE);
            ?>
            <li class="sidebar-item"> 
                <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                    <i class="sidebar-item-icon fa fa-medkit"></i>                 
                        <span class="nav-label"><?php echo $objcatmenu->MENUCAT_NAME; ?></span>
                    </a>
                <ul aria-expanded="false" class="collapse first-level">
                        <?php 
                        while ($objdetailsmenu = $smtdetailsmenu->FetchNextObject()) {
                            if ($objdetailsmenu->MENUDET_STATUS != 0) {
                        ?>
            <li class="sidebar-item">
                <a href="index.php?action=index&pg=<?php echo md5($objcatmenu->MENUCAT_NAMESPACE) . '&option=' . md5($objdetailsmenu->MENUDET_NAMESPACE); ?>" class="sidebar-link">
                  <i class="sidebar-item-icon fa fa-user-o"></i>
                    <span class="nav-label"><?php echo $objdetailsmenu->MENUDET_NAME; ?></span>
                        </a>
                        </li>
                        <?php 
                        }
                        } 
                        ?>
                    </ul>
                </li>
            <?php 
            } 
            ?>
        </ul>
          <div class="sidebar-footer"><a href="javascript:;"><i class="fa fa-bullhorn"></i></a><a href="calendar.html"><i class="fa fa-calendar"></i></a><a href="javascript:;"><i class="fa fa-commenting"></i></a><a href="index.php?action=logout"><i class="fa fa-power-off"></i></a></div>
    <!-- </div> -->
    </div>
</nav>
