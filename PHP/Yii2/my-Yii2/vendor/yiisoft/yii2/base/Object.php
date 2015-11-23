<?php

namespace yii\base;

use Yii;

class Object
{
    public static function className()
    {
        return get_called_class();
    }

    public function __construct($config = [])
    {
        if(!empty($config)){
            Yii::configure($this,$config);
        }
        $this->init();
    }

    public function init()
    {

    }

    public function __get($name)
    {

    }

    public function __set($name, $value)
    {

    }

    public function __isset($name)
    {

    }

    public function __unset($name)
    {

    }

    public function __call($name)
    {

    }

    public function hasProperty($name, $checkVars = true)
    {

    }

    public function canGetproperty($name, $checkVars = true)
    {

    }

    public function canSetproperty($name, $checkVars = true)
    {
        
    }

    public function hasMethod($name)
    {
        return method_exists($this, $name);
    }
}