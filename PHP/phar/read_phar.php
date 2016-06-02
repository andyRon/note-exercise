<?php 
$p = new Phar("./composer.phar");

// print_r($p->count());

// 释放composer.phar
// $p->extractTo("./composer");
var_dump($p->isCompressed());
