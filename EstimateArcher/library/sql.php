<?php
$sql = ADONewConnection($engine);
$sql->debug = $config->debug;
//$sql->debug = 'true';
$sql->autoRollback = $config->autoRollback;
$sql->bulkBind = true;
$sql->SetFetchMode(ADODB_FETCH_ASSOC);
//GENERAL CONNECTION
$pconnected = @$sql->Connect($server, $username, $password, $database);
//ODBC MSSQL
//$sql->PConnect($dsn, $username, $password);

if (!$pconnected) {
    echo '<title>Connect Down</title>';
    echo '<div id="standard_status" style="width:600px; margin:0 auto"><h2 class="main_message"><i></i><span> Sorry connection is currently down.<br />
       Please try again later.</span></h2></div>';
    die();
}

$session = new Session();

