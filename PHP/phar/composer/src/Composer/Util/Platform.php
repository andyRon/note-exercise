<?php











namespace Composer\Util;






class Platform
{






public static function expandPath($path)
{
if (preg_match('#^~[\\/]#', $path)) {
return self::getUserDirectory() . substr($path, 1);
}
return preg_replace_callback('#^(\$|(?P<percent>%))(?P<var>\w++)(?(percent)%)(?P<path>.*)#', function($matches) {

 if (Platform::isWindows() && $matches['var'] == 'HOME') {
return (getenv('HOME') ?: getenv('USERPROFILE')) . $matches['path'];
}
return getenv($matches['var']) . $matches['path'];
}, $path);
}





public static function getUserDirectory()
{
if (false !== ($home = getenv('HOME'))) {
return $home;
} elseif (self::isWindows() && false !== ($home = getenv('USERPROFILE'))) {
return $home;
} elseif (function_exists('posix_getuid') && function_exists('posix_getpwuid')) {
$info = posix_getpwuid(posix_getuid());
return $info['dir'];
}
throw new \RuntimeException('Could not determine user directory');
}




public static function isWindows()
{
return defined('PHP_WINDOWS_VERSION_BUILD');
}





public static function strlen($str)
{
static $useMbString = null;
if (null === $useMbString) {
$useMbString = function_exists('mb_strlen') && ini_get('mbstring.func_overload');
}

if ($useMbString) {
return mb_strlen($str, '8bit');
}

return strlen($str);
}
}
