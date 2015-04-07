<?php 
//http://app.com/list.php?page=1&pagesize=12

$page = isset($_GET['page']) ? $_GET['page'] : 1;
$pageSize = isset($_GET['pagesize']) ? isset($_GET['pagesize']) : 1;
if(!is_numeric($page) || !is_numeric($pageSize)){
	
}