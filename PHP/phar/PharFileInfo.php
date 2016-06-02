<?php 
// PharFileInfo
$file = new PharFileInfo('phar://./my.phar/testfile.txt');
$tmp = '';
foreach ($file as $line => $text) {
    $tmp .= "line number $line: $text";
}
// echo $tmp;
var_dump($file->getMetaData());