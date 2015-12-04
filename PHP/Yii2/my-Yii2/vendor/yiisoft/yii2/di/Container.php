<?php

namespace yii\di;


use yii\base\Component;
use yii\base\InvalidConfigException;

class Container extends Component
{
    private $_singletons = [];

    private $_definitions = [];

    private $_params = [];

    private $_reflections = [];

    private $_dependencies = [];

    public function get($class, $params = [], $config = [])
    {

    }

    public function set()
    {

    }

    public function setSingleton()
    {

    }

    public function has()
    {

    }

    public function hasSingleton()
    {

    }

    public function clear()
    {

    }

    protected function normalizeDefinition()
    {

    }

    public function getDefinitions()
    {

    }

    protected function bulid()
    {

    }

    protected function mergeParams()
    {

    }

    protected function getDependencies()
    {

    }

    protected function resolveDependencies()
    {
        
    }
}