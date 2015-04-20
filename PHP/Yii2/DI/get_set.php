<?php
error_reporting(2047);
class comment
{
	public $s;
	public function setEmail($v){
		$this->s = $v;
	}
	public function __set($p,$v){
		$this->s = '@@'.$v;
	}
}

$com = new comment;

$com->Email = 23;

 var_dump($com->s);