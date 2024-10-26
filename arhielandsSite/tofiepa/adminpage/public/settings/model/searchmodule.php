<?php
ob_start();
include '../../../config.php';
include SPATH_LIBRARIES.DS."engine.Class.php";
include SPATH_LIBRARIES.DS."menufactory.Class.php";

$engine = new engineClass();
$menus = new MenuClass();
// $actor = $engine->getActorDetails();

// if($dashsearch != ''){
// $dashmenu = $menus->getMenuViewAccessRightDashSearch($dashsearch);
// }else{
//     $dashmenu = $menus->getMenuViewAccessRightDash();
// }

$dashmenu = $session->get('dashmenu') ;

//print_r($dashmenu);
if(is_array($dashmenu)){
    $output = '<div class="container-fluid dashboard" id="dashidash">
    <div class="row-fluid">';

    foreach($dashmenu as $key => $value){

        $menucode = $value['menudetcode'] ;

        $dashdt = $menus->getMenuDetails($menucode);

        if(!empty($dashdt[0]['menucatcode'])){
            $menugrp = $menus->getMenuGroup($dashdt[0]['menucatcode']);
            $groupname = $menugrp[0]['name'] ;
            $menuname = $dashdt[0]['name'];
    
    
            $linkview = 'index.php?pg='.md5($groupname).'&amp;option='.md5($menuname).'&uiid='.md5('1_pop');
    
            $output .= '<div class="dashcard ctrlnotification" id="ctrlnotification"><a href="#" onClick="CallWindow(\''.$linkview.'\')" class="list-group-item">'.(($dashdt[0]['notification'] == 1)?(($engine->getTotalNotification($dashdt[0]['code'],$usertype,$activeinstitution) > 0)?'<span class="badges" >'.$engine->getTotalNotification($dashdt[0]['code'],$usertype,$activeinstitution).'</span>':''):'').'<div class="tile-card" style="background-color: '.$dashdt[0]['bg'].'"><img src="media/img/icons/'.$dashdt[0]['imageuniname'].'" alt="Avatar"><div class="tile-card-text"><span><b>'.$dashdt[0]['name'].'</b></span></div></div></a></div>';

        }
    }
    $output .= '</div></div>' ;
}

echo $output;

?>