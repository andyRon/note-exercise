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
}
