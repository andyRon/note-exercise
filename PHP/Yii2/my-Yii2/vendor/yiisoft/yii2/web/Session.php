<?php


namespace yii\web;

use Yii;
use yii\base\Component;
use yii\base\InvalidConfigException;
use yii\base\InvalidParamException;

class Session extends Component implements \IteratorAggregate, \ArrayAccess, \Countable
{
    public $flashParam = '_flash';

    public $handler;

    public $_cookieParams = ['httponly' => true];

    public function init()
    {
        parent::init();
        register_shutdown_function([$this, 'close']);
    }

    public function getUseCustomStorage()
    {
        return false;
    }

    public function open()
    {
        if ($this->getIsActive()) {
            return;
        }

        $this->registerSessionHandler();

        $this->setCookieParamsInternal();

        @session_start();

        if ($this->getIsActive()) {
            Yii::info('Session started:', __METHOD__);
            $this->updateFlashCounters();
        } else {
            $error = error_get_last();
            $message = isset($error['message']) ? $error['message'] : 'Failed to start session.';
            Yii::error($message, __METHOD__);
        }
    }

    protected function registerSessionHandler()
    {
        if ($this->handler !== null) {
            if (!is_object($this->handler)) {
                $this->handler = Yii::createObject($this->handler);
            }
            if ($this->handler instanceof \SessionHandlerInterface) {
                throw new InvalidConfigException('"' . get_class($this) . '::handler" must implement the SessionHandlerInterface.');
            }
            @session_set_save_handler($this->handler, false);
        } elseif ($this->getUseCuntomStorage()) {
            @session_set_save_handler(
                [$this, 'openSession'], 
                [$this, 'closeSession'], 
                [$this, 'readSession'], 
                [$this, 'writeSession'], 
                [$this, 'destroySession'], 
                [$this, 'gcSession']);
        }
    }

    public function close() 
    {
        if ($this->getIsActive()) {
            @session_write_close();
        }
    }

    public function destroy() 
    {
        if ($this->getIsActive()) {
            @session_unset();
            @session_destroy();
        }
    }

    public function getIsActive()
    {
        return session_status() == PHP_SESSION_ACTIVE;
    }

    private $_hasSessionId;

    public function getHasSessionId()
    {
        if ($this->_hasSessionId === null) {
            $name = $this->getName();
            $request = Yii::$app->getRequest();
            if (!empty($_COOKIES[$name]) && ini_get('session.use_cookies')) {
                $this->_hasSessionId = true;
            } elseif (!ini_get('session.use_only_cookies') && ini_get('session.use_trans_sid')) {
                $this->_hasSessionId = $request->get($name) != '';
            } else {
                $this->_hasSessionId = false;
            }
        }

        return $this->_hasSessionId;
    }

    public function setHasSessionId($value)
    {
        $this->_hasSessionId = $value;
    }

    public function getId()
    {
        return session_id();
    }

    public function setId($value)
    {
        session_id($value)
    }

    public function regenerateID($deleteOldSession = false) 
    {
        @session_regenerate_id($deleteOldSession);
    }

    public function getName()
    {
        return session_name();
    }

    public function setName($value)
    {
        session_name($value);
    }

    public function getSavePath()
    {
        return session_save_path();
    }

    public function setSavePath($value)
    {
        $path = Yii::aliases($value);
        if (is_dir($path)) {
            session_save_path($path);
        } else {
            throw new InvalidParamException('Session save path in not valid directory:'.$value);
        }
    }

    public function getCookieParams()
    {
        return array_merge(session_get_cookie_params(), array_change_key_case($this->_cookieParams));
    }

    public function setCookieParams(array $value)
    {
        $this->_cookieParams = $value;
    }

    private function setCookieParamsInternal()
    {
        $data = $this->getCookieParams();
        extract($data);
        if (isset($lifetime, $path, $domain, $secure, $httponly)) {
            session_set_cookie_params($lifetime, $path, $domain, $secure, $httponly);
        } else {
            throw new InvalidParamException('Please make sure cookieParams contains these elements: lifetime, path, domain, secure and httponly.');
        }
    }

    public function getUseCookies()
    {
        if (ini_get('session.use_cookies') === '0') {
            return false;
        } elseif (ini_get('session.use_only_cookies') === '1') {
            return true;
        } else {
            return null;
        }
    }

    public function setUseCookies($value)
    {
        if ($value === false) {
            ini_set('session.use_cookies', '0');
            ini_set('session.use_only_cookies', '0');
        } elseif ($value === true) {
            ini_set('session.use_cookies', '1');
            ini_set('session.use_only_cookies', '1');
        } else {
            ini_set('session.use_cookies', '1');
            ini_set('session.use_only_cookies', '0');
        }
    }

    public function getGCProbability()
    {

    }

    public function setGCProbability()
    {

    }

    public function getUseTransparentSessionID()
    {

    }

    public function setUseTransparentSessionID($value)
    {

    }

    public function getTimeout()
    {

    }

    public function setTimeout($value)
    {

    }

    public function openSession($savePath, $sessionName)
    {

    }

    public function closeSession()
    {

    }

    public function readSession($id)
    {

    }

    public function writeSession($id, $data)
    {

    }

    public function destroySession($id)
    {

    }

    public function gcSession($maxLifetime)
    {

    }

    public function getIterator()
    {

    }

    public function getCount()
    {
        $this->open();
        return count($_SESSION);
    }

    public function count()
    {
        return $this->getCount();
    }

    public function get($key, $defaultValue = null)
    {
        $this->open();
        return isset($_SESSION[$key]) ? $_SESSION[$key] : $defaultValue;
    }

    public function set($key, $value)
    {
        $this->open();
        $_SESSION[$key] = $value;
    }

    public function remove($key)
    {
        $this->open();
        if (isset($_SESSION[$key])) {
            $value = $_SESSION[$key];
            unset($_SESSION[$key]);

            return $value;
        } else {
            return null;
        }
    }

    public function removeAll()
    {
        $this->open();
        foreach ($_SESSION as $key) {
            unset($_SESSION[$key]);
        }
    }

    public function has($key)
    {
        $this->open();
        return isset($_SESSION[$key]);
    }

    protected function updateFlashCounters()
    {

    }

    public function getFlash($key, $defaultValue = null, $delete = false)
    {

    }

    public function getAllFlashes($delete = false)
    {

    }

    public function setFlash($key, $value = true, $removeAfterAccess = true)
    {

    }

    public function addFlash($key, $value = true, $removeAfterAccess = true)
    {

    }

    public function removeFlash($key)
    {

    }

    public function removeAllFlashes()
    {

    }

    public function hasFlash($key)
    {

    }

    public function offsetExists($offset)
    {

    }

    public function offsetGet($offset)
    {

    }

    public function offsetSet($offset, $item)
    {

    }

    public function offsetUnset($offset)
    {
        
    }
}