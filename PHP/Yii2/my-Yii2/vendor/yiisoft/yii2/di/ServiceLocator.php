<?php

namespace yii\di;

use Yii;
use Closure;
use yii\base\Component;
use yii\base\InvalidConfigException;

class ServiceLocator extends Component
{
    // 用于缓存服务、组件等的实例
    private $_components = [];

    // 用于保存服务和组件的定义，通常为配置数组，可以用来创建具体的实例
    private $_definitions = [];

    public function __get($name)
    {
        if ($this->has($name)) {
            return $this->get($name);
        } else {
            return parent::__get($name);
        }
    }

    public function __isset($name)
    {
        if ($this->has($name)) {
            return true;
        } else {
            return parent::__isset($name);
        }
    }
    // 当 $checkInstance === false 时，用于判断是否已经定义了某个服务或组件
    // 当 $checkInstance === true 时，用于判断是否已经有了某人服务或组件的实例
    public function has($id, $checkInstance = false)
    {
        return $checkInstance ? isset($this->_components[$id]) : isset($this->definition[$id]);
    }

    public function get($id, $throwException = true)
    {
        if (isset($this->_components[$id])) {
            return $this->_components[$id];
        }

        if (isset($this->_definitions[$id])) {
            $definition = $this->_definitions[$id];
            if (is_object($definition) && !$definition instanceof Closure) {
                return $this->_components[$id] = $definition;
            } else {
                return $this->_components[$id] = Yii::createOject($definition);
            }
        } elseif ($throwException) {
            throw new InvalidConfigException('Unkown component ID: '.$id);
        } else {
            return null;
        }
    }
    // 用于注册一个组件或服务，其中 $id 用于标识服务或组件。
    // $definition 可以是一个类名，一个配置数组，一个PHP callable，或者一个对象
    public function set($id, $definition)
    {
        if ($definition === null) {
            unset($this->_definitions[$id], $this->_components[$id]);
            return;
        }

        unset($this->_components[$id]);

        if (is_object($definition) || is_callable($definition, true)) {
            $this->_definitions[$id] = $definition;
        } elseif (is_array($definition)) {
            if (isset($definition['class'])) {
                $this->_definitions[$id] = $definition;
            } else {
                throw new InvalidConfigException('The configuration for the "'.$id.'" component must contain a "class" element.');
            }
        } else {
            throw new InvalidConfigException('Unexpected configuration type for the '.$id.' component: '.get_type($definition));
        }
    }

    public function clear($id)
    {
        unset($this->_definitions[$id], $this->_components[$id]);
    }

    public function getComponents($returnDefinitions = true)
    {
        return $returnDefinitions ? $this->_definitions : $this->_components;
    }
    // 批量方式注册服务或组件，同时也是 components 属性的setter函数
    public function setComponents($components)
    {
        foreach ($components as $id => $component) {
            $this->set($id, $component);
        }
    }
}