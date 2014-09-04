<?php
//求阶乘  
//递归实现  
function show($i){  
	if($i == 1){   
		return 1;  
	}else{   
		return $i*show($i-1);    
	}  
}  

//循环实现  
function factorial($n){  
	$result=1;  
	for($i=2;$i<=$n;$i++){   
		$result*=$i;    
	}   
	return $result; 
}  