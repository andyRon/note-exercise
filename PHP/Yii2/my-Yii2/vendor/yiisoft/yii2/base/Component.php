<?php

/*
member variables     直接定义的，结构上的概念
 properties          逻辑上的概念 可通过 getter获得
*/


namespace yii\base;

use Yii;

class Component extends Object
{
    private $_events = [];

    private $_behaviors;

    public function __get($name)
    {
        $getter = 'get'.$name;
        if (method_exists($this, $getter)) {
            return $this->$getter();
        } else {
            $this->ensureBehaviors();
            foreach ($this->_behaviors as $behavior) {
                if ($behavior->canGetproperty($name)) {
                    return $behavior->$name;
                }
            }
        }

        if (method_exists($this, 'set'.$name)) {
            throw new InvalidCallException('Getting write-only property:'.get_class($this).'::'.$name);
        } else {
            throw new UnknowPropertyException('Getting unknow property:'.get_class($this).'::'.$name);
        }
    }

    public function __set($name, $value)
    {
        $setter = 'set'.$name;
        if (method_exists($this, $setter)){
            $this->$setter($value);
            return;
        } elseif(strncmp($name, 'on ', 3) === 0) {
            $this->on(trim(substr($name, 3)), $value);
            return;
        } elseif (strncmp($name, 'as ', 3) === 0) {
            $this->attachBehavior(trim(substr($name, 3)), $value instanceof Behavior ? $value : Yii::createObject($value));
            return;
        } else {
            $this->ensureBehaviors();
            foreach ($this->_behaviors as $behavior) {
                if ($behavior->canSetProperty($name)) {
                    $behavior->$name = $value;
                }
            }
        }

         if (method_exists($this, 'get'.$name)) {
            throw new InvalidCallException('Getting read-only property:'.get_class($this).'::'.$name);
        } else {
            throw new UnknowPropertyException('Getting unknow property:'.get_class($this).'::'.$name);
        }
    }
    /*
    当 用isset() 判断对象不可见的属性时(protected/private/不存在的属性)  会引发 __isset()来执行  
    */
    public function __isset($name)
    {
        $getter = 'get'.$name;
        if (method_exists($this, $getter)) {
            return $this->$getter() !== null;
        } else {
            $this->ensureBehaviors();
            foreach ($this->_behaviors as $behavior) {
                if ($behavior->canGetProperty($name)) {
                    return $behavior->$name !== null;
                }
            }
        }

        return false;
    }
    /* 
    当 用unset 销毁对象的不可见属性时,  会引发 __unset();  
    */
    public function __unset($name)
    {
        $setter = 'set'.$name;
        if (method_exists($this, $setter)) {
            $this->$setter(null);
            return;
        } else {
            $this->ensureBehaviors();
            foreach ($this->_behaviors as $behavior) {
                if($behavior->canSetProperty($name)) {
                    $behavior->$name = null;
                    return;
                }
            }
        }
        throw new InvalidCallException('Unsetting unknow or read-only property:'.get_class($name).'::'.$name);
    }
    /*
    在对象中调用一个不可访问方法时，__call() 会被调用
    */
    public function __call($name, $parms)
    {
        $this->ensureBehaviors();
        foreach ($this->_behaviors as $Object) {
            if ($Object->hasMethod($name)) {
                return call_user_func_array([$Object, $name], $parms);
            }
        }
        throw new UnkonwMethodException('Calling unknow method:'.get_class($name).'::'.$name.'()')
    }

    public function __clone($name)
    {
        $this->_events = [];
        $this->_behaviors = null;
    }

    public function hasProperty($name, $checkVars = true, $checkBehaviors = true)
    {
        return $this->canGetproperty($name, $checkVars, $checkBehaviors) || $this->canSetProperty($name, $checkVars, $checkBehaviors);
    }

    public function canGetProperty($name, $checkVars = true, $checkBehaviors = true)
    {
        if (method_exists($this, 'get'.$name) || $checkVars && property_exists($this, $name)) {
            return true;
        } elseif ($checkBehaviors) {
            $this->ensureBehaviors();
            foreach ($this->_behaviors as $behavior) {
                if ($behavior->canGetProperty($name, $checkVars)) {
                    return true;
                }
            }
        }

        return false;
    }

    public function canSetProperty($name, $checkVars = true, $checkBehaviors = true)
    {
        if (method_exists($this, 'set'.$name) || $checkVars && property_exists($this, $name)) {
            return true;
        } elseif ($checkBehaviors) {
            $this->ensureBehaviors();
            foreach ($this->_behaviors as $behavior) {
                if ($behavior->canSetProperty($name, $checkVars)) {
                    return true;
                }
            }
        }

        return false;
    }

    public function hasMethod($name, $checkBehaviors = true)
    {
        if (method_exists($this, $name)) {
            return true;
        } elseif($checkBehaviors) {
            $this->ensureBehaviors();
            foreach ($this->_behaviors as $behavior) {
                if ($behavior->hasMethod($name)) {
                    return true;
                }
            }
        }

        return false;
    }

    public function behaviors()
    {
        return [];
    }

    public function hasEventHandlers($name)
    {
        $this->ensureBehaviors();
        return !empty($this->_events[$name]) || Event::hasHandlers($this, $name);
    }

    public function on($name, $handlers, $data = null, $append = true)
    {
        $this->ensureBehaviors();
        if ($append || empty($this->_events[$name])) {
            $this->_events[$name][] = [$handlers, $name];
        } else {
            array_unshift($this->_events[$name], [$handlers, $name]);
        }
    }

    public function off($name, $handlers = null)
    {
        $this->ensureBehaviors();
        if (empty($this->_events[$name])) {
            return false;
        }
        if ($handlers === null ) {
            unset($this->_events[$name]);
            return true;
        } else {
            //...
        }

    }

    public function trigger($name, EVENT $evnet = null)
    {
        //...
    }

    public function getBehavior($name)
    {
        $this->ensureBehaviors();
        return isset($this->_behaviors[$name]) ? $this->_behaviors[$name] : null;
    }

    public function getBehaviors($name)
    {
        $this->ensureBehaviors();
        return $this->_behaviors;
    }

    public function attachBehavior($name, $behavior)
    {
        $this->ensureBehaviors();
        return $this->attachBehaviorInternal($name, $behavior);
    }

    public function attachBehaviors($behaviors)
    {
        $this->ensureBehaviors();
        foreach ($behaviors as $name => $behavior) {
            $this->attachBehaviorInternal($name, $behaviors);
        }
    }

    public function detachBehavior($name)
    {
        $this->ensureBehaviors();
        if (isset($this->_behaviors[$name])) {
            $behavior = $this->_behaviors[$name];
            unset($this->_behaviors[$name]);
            $behavior->detach();
            return $behavior;
        } else {
            return null;
        }
    }

    public function detachBehaviors()
    {
        $this->ensureBehaviors();
        foreach ($this->_behaviors as $name => $behavior) {
            $this->detachBehavior($name);
        }
    }
    /*
    通过方法 [[behaviors()]] 添加行为 
    只要涉及到类的属性、方法、事件这个函数都会被调用到
    确保 behaviors() 中所描述的行为已经进行了绑定
    */
    public function ensureBehaviors()
    {
        if ($this->_behaviors === null) {
            $this->_behaviors = [];
            foreach ($this->behaviors() as $name => $behavior) {
                $this->attachBehaviorInternal($name, $behavior);
            }
        }
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