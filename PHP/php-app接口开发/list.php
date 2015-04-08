<?php 
//http://app.com/list.php?page=1&pagesize=12
require_once("./response.php")
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$pageSize = isset($_GET['pagesize']) ? isset($_GET['pagesize']) : 1;
if(!is_numeric($page) || !is_numeric($pageSize)){
	return Response::show(401,'数据不合法');		//记得加return，虽然show中又exit，但return让代码更可读
}