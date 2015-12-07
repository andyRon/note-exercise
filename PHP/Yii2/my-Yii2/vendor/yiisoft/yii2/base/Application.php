<?php

namespace yii\base;


use Yii;


abstract Application extends Module
{
    const EVENT_BEFORE_REQUEST = 'beforeRequest';

    const EVENT_AFTER_REQUEST = 'afterRequest'; 

    const STATE_BEGIN = 0;

    const STATE_INIT = 1;

    const STATE_BEFORE_REQUEST = 2;

    const STATE_HANDLING_REQUEST = 3;

    const STATE_AFTER_REQUEST = 4;

    const STATE_SENDING_REPONSE = 5;

    const STATE_END = 6;

    public $constrollerNamespace = 'app\\constrollers';

    public $name = 'My Application';

    public $version = '1.0';

    public $charset = 'UTF-8';

    public $language = 'en-US';

    public $sourceLanguage = 'en-US';

    public $constroller;

    public $layout = 'main';

    public $requestedRoute;

    public $requestedAction;

    public $requestedParams;


    public $extension;

    public $bootstrap = [];

    public $state;

    public $loadModules = [];


    public function __construct($config = [])
    {

    }

    public function _preInit(&$config)
    {

    }

    public function init()
    {

    }

    protected function bootstrap()
    {

    }

    protected function registerErrorHandler(&$config)
    {

    }

    public function getUniqueId()
    {

    }

    public function setBasePath($path)
    {

    }

    public function run()
    {

    }

    abstract public function handleRequest($request);

    private $_runtimePath;

    public function getRuntimePath()
    {

    }

    public function setRuntimePath($path)
    {

    }

    public function getVendorPath()
    {

    }

    public function setVendorPath($path)
    {

    }

    public function getTimeZone()
    {

    }

    public function setTimeZone($value)
    {

    }

    public function getDb()
    {

    }

    public function getLog()
    {

    }

    public function getErrorHanler()
    {

    }

    public function getCache()
    {

    }

    public function getFormatter()
    {

    }

    public function getRequest()
    {

    }

    public function getResponse()
    {

    }

    public function getView()
    {

    }

    public function getUrlManager()
    {

    }

    public function getI18n()
    {

    }

    public function getMailer()
    {

    }

    public function getAuthManager()
    {

    }

    public function getAssetManager()
    {

    }

    public function getSecurity()
    {

    }

    public function coreComponents()
    {

    }

    public function end()
    {
        
    }
}