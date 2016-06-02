<?php 

try {
    $p = new Phar('my.phar', 0, 'my.phar');
    $p['testfile.txt'] = "hi\nthere\ndude";
    $file = $p['testfile.txt'];
    foreach ($file as $line => $text) {
        echo "line number $line: $text";
    }

} catch (Exception $e) {
    echo 'Phar operations failed: ', $e;
}