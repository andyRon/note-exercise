<?php

namespace yii;

use yii\base\InvalidParamException;

defined("YII2_PATH") or define("YII2_PATH", __DIR__);

class BaseYii
{
    public static $classMap;

    public static $app;
    /*
    别名数组，可通过setAlias() 添加
    */
    public static $aliases = ['@yii' => __DIR__];

    public static $container;

    public static function getVersion()
    {
        return '2.0.7-andyron';
    }

    public static function getAlias($alias, $throwException = true)
    {
        if (strncmp($alias, '@', 1)) {
            return $alias;
        }

        $pos = strpos($alias, '/');
        $root = $pos === false ? $alias : substr($alias, 0, $pos);

        if (isset(static::$aliases[$root])) {
            if (is_string(static::$aliases[$root])) {
                return $pos === false ? static::$aliases[$root] : static::$aliases[$root].substr($alias, $pos);
            } else {
                // ...
            }
        }

        if ($throwException) {
            throw new InvalidParamException("Invalid path alias: $alias");
        } else {
            return false;
        }
    }
    
    public static function getRootAlias($alias)
    {
        $pos = strpos($alias, '/');
        $root = $pos === false ? $alias : substr($alias, 0, $pos);

        if (isset(static::$aliases[$root])) {
            if (is_string(static::$aliases[$root])) {
                return $root;
            } else {
                //...
            }
        }
        return false;
    }    

    public static function setAlias($alias, $path)
    {

    }

    public static function autoload($className)
    {

    }

    public static function createObject($type, array $params = [])
    {

    }


    private static $_logger;

    public static function getLogger()
    {

    }

    public static function setLogger()
    {

    }

    public static function trace($message, $category = 'application')
    {

    }

    public static function error($message, $category = 'application')
    {

    }

    public static function warning($message, $category = 'application')
    {
        
    }

    public static function info($message, $category = 'application')
    {
        
    }

    public static function beginProfile($message, $category = 'application')
    {
        
    }

    public static function endProfile($message, $category = 'application')
    {
        
    }

    public static function powered()
    {

    }


    public static function t($category, $message, $params = [], $languge = null)
    {

    }

    public static function configure($object, $properties)
    {

    }

    public static function getObjectVars($object)
    {
        return get_object_vars($object);
    }
}