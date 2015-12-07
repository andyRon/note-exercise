<?php

namespace yii\base;

use Yii;
use yii\di\ServiceLocator;
/*
Module is the base class for module and application classes.

*/
class Module extends ServiceLocator
{
    const EVENT_BEFORE_ACTION = 'beforeAction';

    const EVENT_AFTER_ACTION = 'afterAction';

    public $params = [];

    public $id;

    public $module;

    public $layout;

    public $controllerMap = [];

    public $controllerNamespace;

    public $defaultRoute = 'default';


    private $_basePath;

    private $_viewPath;

    private $_layoutPath;

    private $_modules = [];

    public function __construct($id, $parent = null, $config = [])
    {
        $this->id = $id;
        $this->module = $parent;
        parent::__construct($config);
    }

    public static function getInstance()
    {
        $class = get_called_class();
        return isset(Yii::$app->loadedModules[$class]) ? Yii::$app->loadedModules[$class] : null;
    }

    public static function setInstance($instance)
    {
        if ($instance === null) {
            unset(Yii::$app->loadedModules[get_called_class()]);
        } else {
            Yii::$app->loadedModules[get_class($instance)] = $instance;
        }
    }
    
    public function init()
    {
    	if ($this->controllerNamespace === null) {
    		$class = get_class($this);
    		if (($pos = strrpos($class, '\\')) !== false) {
    			$this->controllerNamespace = substr($class, 0, $pos).'\\controllers';
    		}
    	}
    }

    public function getUniqueId()
    {
        return $this->module ? ltrim($this->module->getUniqueId.'/'.$this->id.'/') : $this->id;
    }

    public function getBasePath()
    {
        if ($this->_basePath === null) {
            $class = new \ReflectionClass($this);
            $this->_basePath = dirname($class->getFileName());
        }

        return $this->_basePath;
    }

    public function setBasePath($path)
    {
        $path = Yii::getAlias($path);
        $p = realpath($path);

        if ($p !== false && is_dir($p)) {
            $this->_basePath = $p;
        } else {
            throw new InvalidParamException('The directory does not exist: '.$path);
        }
    }

    public function getControllerPath()
    {
        return Yii::getAlias('@'.str_replace('\\', '/', $this->controllerNamespace));
    }

    public function getViewPath()
    {
        if ($this->_viewPath !== null) {
            return $this->_viewPath;
        } else {
            return $this->_viewPath = $this->getBasePath().DIRECTORY_SEPARATOR.'views';
        }
    }

    public function setViewPath($path)
    {
        $this->_viewPath = Yii::getAlias($path);
    }

    public function getLayoutPath()
    {
        if ($this->_layoutPath !== null) {
            return $thi->_viewPath;
        } else {
            return $this->_viewPath = $this->getBasePath().DIRECTORY_SEPARATOR.'layouts';
        }
    }

    public function setLayoutPath($path)
    {
        $this->_layoutPath = Yii::getAlias($path);
    }

    public function setAliases($aliases)
    {
        foreach ($aliases as $name => $alias) {
            Yii::setAlias($name, $alias);
        }
    }

    public function hasModule($id)
    {
        if (($pos = strpos($id, '/')) !== false) {
            $module = $this->getModule(substr($id, 0, $pos));

            return $module === null ? false : $module->hasModule(substr($id, $pos+1));
        } else {
            return isset($this->_modules[$id]);
        }
    }

    public function getModule($id, $load = true)
    {
        if (($pos = strpos($id, '/')) !== flase) {
            $module = $this->getModule(substr($id, 0, $pos));

            return $module === null ? null : $module->getModule(substr($id, $pos+1), $load);
        }

        if (isset($this->_modules[$id])) {
            if ($this->_modules[$id] instanceof Module) {
                return $this->_modules[$id];
            } elseif ($load) {
                Yii::trace('Loading module:'.$id, __METHOD__);

                $module = Yii::createObject($this->_modules[$id], [$id, $this]);
                $module->setInstance($module);
                return $this->_modules[$id] = $module;
            }
        }

        return null;
    }

    public function setModule($id, $module)
    {
        if ($module === null) {
            unset($this->_modules[$id]);
        } else {
            $this->_modules[$id] = $module;
        }
    }

    public function getModules($loadedOnly = false)
    {
        if ($loadedOnly) {
            $modules = [];
            foreach ($this->_modules as $name => $module) {
                if ($module instanceof Module) {
                    $modules[] = $module;
                }
            }
            return $modules;
        } else {
            return $this->_modules;
        }
    }

    public function setModules($modules)
    {
        foreach ($this->_modules as $id => $module) {
            $this->_modules[$id] = $module;
        }
    }

    public function runAction($route, $params = [])
    {

    }

    public function createController($route)
    {

    }

    public function createControllerById($id)
    {

    }

    public function beforeAction($action)
    {

    }

    public function afterAction($action, $result)
    {
        
    }
}

