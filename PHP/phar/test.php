<?php
// 生成1
$phar = new Phar('swoole.phar');
$phar->buildFromDirectory(__DIR__.'/../', '/\.php$/');
$phar->compressFiles(Phar::GZ);
$phar->stopBuffering();
$phar->setStub($phar->createDefaultStub('lib_config.php'));


// try{  
//     $p = new Phar(dirname(__FILE__) . "my.phar", 0, 'my.phar');  
// } catch (UnexpectedValueException $e) {  
//     die('Could not open my.phar');  
// } catch (BadMethodCallException $e) {  
//     echo 'technically, this cannot happen';  
// }

// $p->startBuffering();  
// $p['file.txt'] = 'hi';   
// $p['file2.txt'] = 'there';  
// $p['file3.txt'] = 'babyface';  
// $p['file3.txt']->setMetadata(42);  
// $p['test/time.php'] = file_get_contents('time.php');  
