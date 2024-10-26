<?php
$dashmenu = $session->get('dashmenu');

// echo "<pre>";
// print_r($dashmenu);
// echo "</pre>";
?>

<div class="main-content">
    <input type="hidden" name="option" id="option">
    <input type="hidden" name="pg" id="pg">
    <div class="page-wrapper">
        <div class="page" style="min-height:50vh; border: 10px solid #A9BA9D">
            <div class="row">
                <div class="col-md-12">
                    <div class="moduletitle" style="border-bottom:0px;margin-bottom: 10px">
                        <div class="moduletitleupper">Dashboard</div>
                        <div class="search-wrapper">
                            <input name="dashsearch" type="text" size="40" placeholder="Search menu item here..." id="searchdash" style="background-color: #D0F0C0" />
                        </div>


                        <div class="container-fluid dashboard" id="dashidash">
                            <div class="row-fluid">
                                <?php
                                if (is_array($dashmenu)) {
                                    foreach ($dashmenu as $key => $value) {

                                        $menucode = $value['menudetcode'];


                                        // $dashdt = $menus->getMenuDetails($menucode);
                                        $dashdt = $menus->getMenuDetails($menucode);

                                        // echo "<pre>";
                                        // print_r($dashdt);
                                        // echo "</pre>";

                                        if (!empty($dashdt[0]['menucatcode'])) {
                                            if ($dashdt[0]['dashboard'] == '1') {

                                                // $menugrp = $menus->getMenuGroup($dashdt['menucatcode']);
                                                // $groupname = $menugrp['name'] ;
                                                $groupname = $dashdt[0]['subname'];
                                                $menuname = $dashdt[0]['name'];


                                                $linkview = 'index.php?pg=' . md5($groupname) . '&amp;option=' . md5($menuname) . '&uiid=' . md5('1_pop');

                                                $totalnotif =  $engine->getTotalNotification($dashdt[0]['code'], $usertype, $activeinstitution);

                                                echo  '<div class="dashcard ctrlnotification" id="ctrlnotification"><a href="#" onClick="CallWindow(\'' . $linkview . '\')" class="list-group-item">' . (($dashdt[0]['notification'] == 1) ? (($totalnotif > 0) ? '<span class="badges" >' . $totalnotif . '</span>' : '') : '') . '<div class="tile-card" style="background-color: ' . $dashdt[0]['bg'] . '"><img src="media/img/icons/' . $dashdt[0]['imageuniname'] . '" alt="Avatar"><div class="tile-card-text"><span><b>' . $dashdt[0]['name'] . '</b></span></div></div></a></div>';
                                            }
                                        }
                                    }
                                }
                                ?>
                            </div>
                        </div>
                    </div>

                </div>



            </div>

        </div>
    </div>