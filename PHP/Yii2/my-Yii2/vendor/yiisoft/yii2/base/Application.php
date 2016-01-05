<?php

namespace yii\base;


use Yii;


abstract class Application extends Module
{
    // 定义了两个事件，分别在处理请求的前后触发
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
        Yii::$app = $this;
        $this->setInstance($this);

        $this->state = self::STATE_BEGIN;

        $this->preInit($config);

        $this->registerErrorHandler($config);

        Component::__construct($config);
    }

    public function preInit(&$config)
    {
        if (!isset($config['id'])) {
            throw new InvalidCofigException('The "id" configuration for a Application is required.');
        }
        if (isset($config['basePath'])) {
            $this->setBasePath($config['basePath']);
            unset($config['basePath']);
        } else {
            throw new InvalidCofigException('The "basePath" configuration for a Application is required.');
        }

        if (isset($config['vendorPath'])) {
            $this->setVendorPath($config['vendorPath']);
            unset($config['vendorPath']);
        } else {
            $this->getVendorPath();
        }       
        if (isset($config['runtimePath'])) {
            $this->setRuntimePath($config['runtimePath']);
            unset($config['runtimePath']);
        } else {
            $this->getRuntimePath();
        }

        if (isset($config['timeZone'])) {
            $this->setTimeZone($config['timeZone']);
            unset($config['timeZone']);
        } elseif (!ini_get('date.timezone')) {
            $this->setTimeZone('UTC');
        }

        foreach ($this->coreComponents() as $id => $component) {
            if (!isset($config['component'][$id])) {
                $config['component'][$id] = $component;
            } elseif (is_array($config['component'][$id]) && !isset($config['component'][$id]['class'])) {
                $config['component'][$id]['class'] = $component['class'];
            }
        }
    }

    public function init()
    {
        $this->state = self::STATE_INIT;
        $this->bootstrap;
    }

    protected function bootstrap()
    {
        if ($this->extensions === null) {
            $file = Yii::getAlias('@vendor/yiisoft/extensions.php');
            $this->extensions = is_file($file) ? include($file) : [];
        }
        foreach ($this->extensions as $extension) {
            if (!empty($extension['alias'])) {
                foreach ($extension['alias'] as $name => $path) {
                    Yii::setAlias($name, $path);
                }
            }
            if (isset($extension['bootstrap'])) {
                $component = Yii::createObject($extension['bootstrap']);
                if ($component instanceof BootstrpInterface) {
                    Yii::trace("Bootstrap with " . get_class($component) . '::bootstrap()', __METHOD__);
                    $component->bootstrap($this);
                } else {
                    Yii::trace("Bootstrap with " . get_class($component), __METHOD__);
                } 
            }
        } 

        foreach ($this->bootstrap as $class) {
            $component = null;
            if (is_string($class)) {
                if ($this->has($class)){
                    $component = $this->get($class);
                } elseif ($this->hasModule($class)) {
                    $component = $this->getModule($class);
                } elseif (strpos($class, '\\') === false) {
                    throw new InvalidCofigException('Unkwon bootstrapping component ID: '.$class);
                }
            }

            if (!isset($component)) {
                $component = Yii::createObject($class);
            }

            if ($component instanceof BootstrpInterface) {
                Yii::trace("Bootstrap with " . get_class($component) . '::bootstrap()', __METHOD__);
                $component->bootstrap($this);
            } else {
                Yii::trace("Bootstrap with " . get_class($component), __METHOD__);
            } 
        }
    }

    protected function registerErrorHandler(&$config)
    {
        if (YII_ENABLE_ERROR_HANDLER) {
            if (!isset($config['component']['errorHandler']['class'])) {
                echo "Error: no errorHandler component is configured.\n";
                exit(1);
            }
            $this->set('errorHandler', $config['component']['errorHandler']);
            unset($config['component']['errorHandler']);
            $this->getErrorHanler()->register();
        }
    }

    public function getUniqueId()
    {
        return '';
    }

    public function setBasePath($path)
    {
        parent::setBasePath($path);
        Yii::setAlias('@app', $this->getBasePath());
    }

    public function run()
    {
        try {
            $this->state = self::STATE_BEFORE_REQUEST;
            $this->trigger(self::EVENT_BEFORE_REQUEST);

            $this->state = self::STATE_HANDLING_REQUEST;
            $response = $this->handleRequest($this->getRequest());

            $this->state = self::STATE_AFTER_REQUEST;
            $this->trigger(self::STATE_AFTER_REQUEST);

            $this->state = self::STATE_SENDING_REPONSE;
            $response->send();

            $this->state = self::STATE_END;

            return $response->exitStatus;

        } catch (ExitException $e) {
            $this->end($e->statusCode, isset($response) ? $response : null);
            return $e->statusCode;
        }
    }

    abstract public function handleRequest($request);

    private $_runtimePath;

    public function getRuntimePath()
    {
        if ($this->_runtimePath === null) {
            $this->setRuntimePath($this->getBasePath().DIRECTORY_SEPARATOR.'runtime');
        }

        return $this->_runtimePath;
    }

    public function setRuntimePath($path)
    {
        $this->_runtimePath = Yii::getAlias($path);
        $this->setAlias('@runtime', $this->_runtimePath);
    }


    private $_vendorPath;

    public function getVendorPath()
    {
        if ($this->_vendorPath === null) {
            $this->setVendorPath($this->getBasePath().DIRECTORY_SEPARATOR.'vendor');
        }
    }

    public function setVendorPath($path)
    {
        $this->_vendorPath = Yii::getAlias($path);
        $this->setAlias('@vendor', $this->_vendorPath);
        $this->setAlias('@bower', $this->_vendorPath.DIRECTORY_SEPARATOR.'bower');
        $this->setAlias('@npm', $this->_vendorPath.DIRECTORY_SEPARATOR.'npm');

    }

    public function getTimeZone()
    {
        return date_default_timezone_get();
    }

    public function setTimeZone($value)
    {
        date_default_timezone_set($value);
    }

    public function getDb()
    {
        return $this->get('db');
    }

    public function getLog()
    {
        return $this->get('log');
    }

    public function getErrorHandler()
    {
        return $this->get('errorHandler');
    }

    public function getCache()
    {
        return $this->get('cache', false);
    }

    public function getFormatter()
    {
        return $this->get('formatter');
    }

    public function getRequest()
    {
        return $this->get('request');
    }

    public function getResponse()
    {
        return $this->get('response');
    }

    public function getView()
    {
        return $this->get('view');
    }

    public function getUrlManager()
    {
        return $this->get('urlManager');
    }

    public function getI18n()
    {
        return $this->get('i18n');
    }

    public function getMailer()
    {
        return $this->get('mailer');
    }

    public function getAuthManager()
    {
        return $this->get('authManager', false);
    }

    public function getAssetManager()
    {
        return $this->get('assertManager');
    }

    public function getSecurity()
    {
        return $this->get('security');
    }

    public function coreComponents()
    {
        return [
            'log' => ['class' => 'yii\log\Dispathcher'],
            'view' => ['class' => 'yii\web\View'],
            'formatter' => ['class' => 'yii\i18n\Formatter'],
            'i18n' => ['class' => 'yii\i18n\I18n'],
            'authManager' => ['class' => 'yii\web\AuthManager'],
            'assertManager' => ['class' => 'yii\web\AssertManager'],
            'security' => ['class' => 'yii\base\Security'],
        ];
    }

    public function end($status = 0, $response = null)
    {
        if ($this->state === self::STATE_BEFORE_REQUEST || $this->state === self::STATE_HANDLING_REQUEST) {
            $this->state = self::STATE_AFTER_REQUEST;
            $this->trigger(self::EVENT_AFTER_REQUEST);
        }

        if ($this->state !== self::STATE_SENDING_RESPONSE && $this->state !== self::STATE_END) {
            $this->state = self::STATE_END;
            $response = $response ? : $this->getResponse();
            $response->send();
        }

        if (YII_ENV_TEST) {
            throw new ExitException($status);
        } else {
            exit($status);
        }
    }
}