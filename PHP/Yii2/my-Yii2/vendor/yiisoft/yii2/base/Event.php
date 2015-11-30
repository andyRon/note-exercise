<?php

namespace yii\base;


class Event extends Object 
{
    public $name;

    public $sender;

    public $hanlded = false;

    public $data;

    public $_events = [];

    public static function on($class, $name, $handler, $data = null, $append = true)
    {
        $class = ltrim($class, '\\');
        if ($append || empty(self::$_events[$name][$class])) {
            self::$_events[$name][$class][] = [$handler, $data];
        } else {
            array_unshift(self::$_events[$name][$class], [$handler, $data]);
        }
    }

    public static function off($class, $name, $handler = null)
    {
        $class = ltrim($class, '\\');
        if (empty(self::$_events[$name][$class])) {
            return false;
        }
        if ($handler === null) {
            unset(self::$_evnets[$name][$class]);
            return true;
        } else {
            //...
        }
    }

    public static function hasHanlders($class, $name)
    {
        if (empty(self::$_evnets[$name])) {
            return false;
        }
        if (is_object($class)) {
            $class = get_class($class);
        } else {
            $class = ltrim($class, '\\');
        }
        //...
    }

    public static function trigger($class, $name, $event = null)
    {
        //...
    }
}
