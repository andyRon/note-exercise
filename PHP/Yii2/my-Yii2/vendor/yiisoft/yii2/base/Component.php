<?php

namespace yii\base;

use Yii;

class Component extends Object
{
    private $_events = [];

    private $_behaviors;

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

    public function __clone($name)
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

    public function behaviors()
    {

    }

    public function hasEventHandlers($name)
    {

    }

    public function on($name, $handlers, $data = null, $append = true)
    {

    }

    public function off($name, $handlers = null)
    {

    }

    public function trigger($name, EVENT $evnet = null)
    {

    }

    public function getBehavior($name)
    {

    }

    public function getBehaviors($name)
    {

    }

    public function attachBehavior($name, $behavior)
    {

    }

    public function attachBehaviors($behaviors)
    {

    }

    public function detachBehavior($name)
    {

    }

    public function detachBehaviors()
    {

    }
    /*
    通过方法 [[behaviors()]] 添加行为 
    */
    public function ensureBehaviors()
    {

    }

    private function attachBehaviorInternal($name, $behavior)
    {
        if (!($behavior instanceof Behavior)) {
            $behavior = Yii::createObject($behavior);
        }
        if (is_int($name)) {
            $behavior->attach($this);
            $this->_behaviors[] = $behavior;
        } else {
            if (isset($this->_behaviors[$name])) {
                $this->_behaviors[$name]->detach();
            }
            $behavior->attach($this);
            $this->_behaviors[$name] = $behavior;
        }
        return $behavior;
    }
}