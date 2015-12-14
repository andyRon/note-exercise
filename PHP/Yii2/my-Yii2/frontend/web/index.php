<?php
/*
两个类自动加载：第三方的（这边是composer）和yii本身的。
都依赖与`spl_autoload_register()`, 这个函数用于注册自动加载函数，并插入到自动加载函数栈的最前面，
这边的顺序不能变，yii的自动加载函数必须在后面注册，也就是必须在栈的最前面
*/
// require(__DIR__."/../../vendor/autoload.php");
require(__DIR__."/../../vendor/yiisoft/yii2/Yii.php");


$config =  require(__DIR__."/../../common/config/main.php");
use yii\base\Object;

// class test extends Object
// {
//     private $a;
//     function geta(){
//         return 12;
//     }
// }
// $obj = new test();
// print_r($obj->a);die();

$application = new yii\web\Application($config);
$application->run();
