<?php










namespace Composer\CaBundle;

use Psr\Log\LoggerInterface;
use Symfony\Component\Process\PhpProcess;





class CaBundle
{
private static $caPath;
private static $caFileValidity = array();
private static $useOpensslParse;






































public static function getSystemCaRootBundlePath(LoggerInterface $logger = null)
{
if (self::$caPath !== null) {
return self::$caPath;
}


 
 $envCertFile = getenv('SSL_CERT_FILE');
if ($envCertFile && is_readable($envCertFile) && static::validateCaFile($envCertFile, $logger)) {
return self::$caPath = $envCertFile;
}


 
 $envCertDir = getenv('SSL_CERT_DIR');
if ($envCertDir && is_dir($envCertDir) && is_readable($envCertDir)) {
return self::$caPath = $envCertDir;
}

$configured = ini_get('openssl.cafile');
if ($configured && strlen($configured) > 0 && is_readable($configured) && static::validateCaFile($configured, $logger)) {
return self::$caPath = $configured;
}

$configured = ini_get('openssl.capath');
if ($configured && is_dir($configured) && is_readable($configured)) {
return self::$caPath = $configured;
}

$caBundlePaths = array(
'/etc/pki/tls/certs/ca-bundle.crt', 
 '/etc/ssl/certs/ca-certificates.crt', 
 '/etc/ssl/ca-bundle.pem', 
 '/usr/local/share/certs/ca-root-nss.crt', 
 '/usr/ssl/certs/ca-bundle.crt', 
 '/opt/local/share/curl/curl-ca-bundle.crt', 
 '/usr/local/share/curl/curl-ca-bundle.crt', 
 '/usr/share/ssl/certs/ca-bundle.crt', 
 '/etc/ssl/cert.pem', 
 '/usr/local/etc/ssl/cert.pem', 
 );

foreach ($caBundlePaths as $caBundle) {
if (@is_readable($caBundle) && static::validateCaFile($caBundle, $logger)) {
return self::$caPath = $caBundle;
}
}

foreach ($caBundlePaths as $caBundle) {
$caBundle = dirname($caBundle);
if (@is_dir($caBundle) && glob($caBundle.'/*')) {
return self::$caPath = $caBundle;
}
}

return self::$caPath = static::getBundledCaBundlePath(); 
 }








public static function getBundledCaBundlePath()
{
return __DIR__.'/../res/cacert.pem';
}









public static function validateCaFile($filename, LoggerInterface $logger = null)
{
static $warned = false;

if (isset(self::$caFileValidity[$filename])) {
return self::$caFileValidity[$filename];
}

$contents = file_get_contents($filename);


 
 if (!static::isOpensslParseSafe()) {
if (!$warned && $logger) {
$logger->warning(sprintf(
'Your version of PHP, %s, is affected by CVE-2013-6420 and cannot safely perform certificate validation, we strongly suggest you upgrade.',
PHP_VERSION
));
$warned = true;
}

$isValid = !empty($contents);
} else {
$isValid = (bool) openssl_x509_parse($contents);
}

if ($logger) {
$logger->debug('Checked CA file '.realpath($filename).': '.($isValid ? 'valid' : 'invalid'));
}

return self::$caFileValidity[$filename] = $isValid;
}









public static function isOpensslParseSafe()
{
if (null !== self::$useOpensslParse) {
return self::$useOpensslParse;
}

if (PHP_VERSION_ID >= 50600) {
return self::$useOpensslParse = true;
}


 
 
 
 if (
(PHP_VERSION_ID < 50400 && PHP_VERSION_ID >= 50328)
|| (PHP_VERSION_ID < 50500 && PHP_VERSION_ID >= 50423)
|| (PHP_VERSION_ID < 50600 && PHP_VERSION_ID >= 50507)
) {

 return self::$useOpensslParse = true;
}

if (defined('PHP_WINDOWS_VERSION_BUILD')) {

 return self::$useOpensslParse = false;
}

$compareDistroVersionPrefix = function ($prefix, $fixedVersion) {
$regex = '{^'.preg_quote($prefix).'([0-9]+)$}';

if (preg_match($regex, PHP_VERSION, $m)) {
return ((int) $m[1]) >= $fixedVersion;
}

return false;
};


 if (
$compareDistroVersionPrefix('5.3.3-7+squeeze', 18) 
 || $compareDistroVersionPrefix('5.4.4-14+deb7u', 7) 
 || $compareDistroVersionPrefix('5.3.10-1ubuntu3.', 9) 
 ) {
return self::$useOpensslParse = true;
}


 if (!class_exists('Symfony\Component\Process\PhpProcess')) {
return self::$useOpensslParse = false;
}


 
 
 
 
 


 
 $cert = 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUVwRENDQTR5Z0F3SUJBZ0lKQUp6dThyNnU2ZUJjTUEwR0NTcUdTSWIzRFFFQkJRVUFNSUhETVFzd0NRWUQKVlFRR0V3SkVSVEVjTUJvR0ExVUVDQXdUVG05eVpISm9aV2x1TFZkbGMzUm1ZV3hsYmpFUU1BNEdBMVVFQnd3SApTOE9Ed3Jac2JqRVVNQklHQTFVRUNnd0xVMlZyZEdsdmJrVnBibk14SHpBZEJnTlZCQXNNRmsxaGJHbGphVzkxCmN5QkRaWEowSUZObFkzUnBiMjR4SVRBZkJnTlZCQU1NR0cxaGJHbGphVzkxY3k1elpXdDBhVzl1WldsdWN5NWsKWlRFcU1DZ0dDU3FHU0liM0RRRUpBUlliYzNSbFptRnVMbVZ6YzJWeVFITmxhM1JwYjI1bGFXNXpMbVJsTUhVWQpaREU1TnpBd01UQXhNREF3TURBd1dnQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBCkFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUEKQUFBQUFBQVhEVEUwTVRFeU9ERXhNemt6TlZvd2djTXhDekFKQmdOVkJBWVRBa1JGTVJ3d0dnWURWUVFJREJOTwpiM0prY21obGFXNHRWMlZ6ZEdaaGJHVnVNUkF3RGdZRFZRUUhEQWRMdzRQQ3RteHVNUlF3RWdZRFZRUUtEQXRUClpXdDBhVzl1UldsdWN6RWZNQjBHQTFVRUN3d1dUV0ZzYVdOcGIzVnpJRU5sY25RZ1UyVmpkR2x2YmpFaE1COEcKQTFVRUF3d1liV0ZzYVdOcGIzVnpMbk5sYTNScGIyNWxhVzV6TG1SbE1Tb3dLQVlKS29aSWh2Y05BUWtCRmh0egpkR1ZtWVc0dVpYTnpaWEpBYzJWcmRHbHZibVZwYm5NdVpHVXdnZ0VpTUEwR0NTcUdTSWIzRFFFQkFRVUFBNElCCkR3QXdnZ0VLQW9JQkFRRERBZjNobDdKWTBYY0ZuaXlFSnBTU0RxbjBPcUJyNlFQNjV1c0pQUnQvOFBhRG9xQnUKd0VZVC9OYSs2ZnNnUGpDMHVLOURaZ1dnMnRIV1dvYW5TYmxBTW96NVBINlorUzRTSFJaN2UyZERJalBqZGhqaAowbUxnMlVNTzV5cDBWNzk3R2dzOWxOdDZKUmZIODFNTjJvYlhXczROdHp0TE11RDZlZ3FwcjhkRGJyMzRhT3M4CnBrZHVpNVVhd1Raa3N5NXBMUEhxNWNNaEZHbTA2djY1Q0xvMFYyUGQ5K0tBb2tQclBjTjVLTEtlYno3bUxwazYKU01lRVhPS1A0aWRFcXh5UTdPN2ZCdUhNZWRzUWh1K3ByWTNzaTNCVXlLZlF0UDVDWm5YMmJwMHdLSHhYMTJEWAoxbmZGSXQ5RGJHdkhUY3lPdU4rblpMUEJtM3ZXeG50eUlJdlZBZ01CQUFHalFqQkFNQWtHQTFVZEV3UUNNQUF3CkVRWUpZSVpJQVliNFFnRUJCQVFEQWdlQU1Bc0dBMVVkRHdRRUF3SUZvREFUQmdOVkhTVUVEREFLQmdnckJnRUYKQlFjREFqQU5CZ2txaGtpRzl3MEJBUVVGQUFPQ0FRRUFHMGZaWVlDVGJkajFYWWMrMVNub2FQUit2SThDOENhRAo4KzBVWWhkbnlVNGdnYTBCQWNEclk5ZTk0ZUVBdTZacXljRjZGakxxWFhkQWJvcHBXb2NyNlQ2R0QxeDMzQ2tsClZBcnpHL0t4UW9oR0QySmVxa2hJTWxEb214SE83a2EzOStPYThpMnZXTFZ5alU4QVp2V01BcnVIYTRFRU55RzcKbFcyQWFnYUZLRkNyOVRuWFRmcmR4R1ZFYnY3S1ZRNmJkaGc1cDVTanBXSDErTXEwM3VSM1pYUEJZZHlWODMxOQpvMGxWajFLRkkyRENML2xpV2lzSlJvb2YrMWNSMzVDdGQwd1lCY3BCNlRac2xNY09QbDc2ZHdLd0pnZUpvMlFnClpzZm1jMnZDMS9xT2xOdU5xLzBUenprVkd2OEVUVDNDZ2FVK1VYZTRYT1Z2a2NjZWJKbjJkZz09Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K';
$script = <<<'EOT'

error_reporting(-1);
$info = openssl_x509_parse(base64_decode('%s'));
var_dump(PHP_VERSION, $info['issuer']['emailAddress'], $info['validFrom_time_t']);

EOT;
$script = '<'."?php\n".sprintf($script, $cert);

try {
$process = new PhpProcess($script);
$process->mustRun();
} catch (\Exception $e) {

 
 return self::$useOpensslParse = false;
}

$output = preg_split('{\r?\n}', trim($process->getOutput()));
$errorOutput = trim($process->getErrorOutput());

if (
count($output) === 3
&& $output[0] === sprintf('string(%d) "%s"', strlen(PHP_VERSION), PHP_VERSION)
&& $output[1] === 'string(27) "stefan.esser@sektioneins.de"'
&& $output[2] === 'int(-1)'
&& preg_match('{openssl_x509_parse\(\): illegal (?:ASN1 data type for|length in) timestamp in - on line \d+}', $errorOutput)
) {

 return self::$useOpensslParse = true;
}

return self::$useOpensslParse = false;
}




public static function reset()
{
self::$caFileValidity = array();
self::$caPath = null;
self::$useOpensslParse = null;
}
}
