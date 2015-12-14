<?php

namespace yii\web;

use Yii;
use yii\base\InvalidConfigException;
use yii\helper\StringHelper;

class Request extends yii\base\Request
{
    const CSRF_HEADER = 'X-CSRF-Token';

    const CSRF_MASK_LENGTH = 8;

    public $enableCsrfValidation = true;

    public $_csrfParam = '_csrf';

    public $csrfCookie = ['httpOnly' => true];

    public $enableCsrfCookie = true;

    public $enableCookieValidation = true;

    public $cookeValidationKey;

    public $methodParm = '_method';

    public $parsers = [];

    private $_cookies;

    private $_headers;

    public function resolve()
    {
        $result = Yii::$app->getUrlManager()->parseRequest($this);
        if ($result !== false) {
            list($route, $params) = $result;
            $_GET = $params + $_GET;

            return [$route, $_GET];
        } else {
            throw new NotFoundHttpException(Yii::t('yii', 'Page not found.'));
        }
    }

    public function getHeaders()
    {
        if ($this->_headers === null) {
            $this->_headers = new HeaderCollection();
            if (function_exists('getallheaders')) {
                $headers = getallheaders();
            } elseif (function_exists('http_get_request_headers')) {
                $headers = http_get_request_headers();
            } else {
                foreach ($_SERVER as $name => $val) {
                    if (strncmp($name, 'HTTP_', 5) === 0) {
                        $name = str_replace(' ', '-', ucwords(strtolower(str_replace(' ', '_', substr($name, 5)))));
                        $this->_headers->add($name, $val);
                    }
                }
                return $this->_headers;
            }

            foreach ($headers as $name => $val) {
                $this->_headers->add($name, $val);
            }
            return $this->_headers;
        }
    }

    public function getMethod()
    {
        if (isset($_POST[$this->methodParm])) {
            return strtoupper($_POST[$this->methodParm]);
        } elseif (isset($_SERVER['HTTP_X_HTTP_METHOD_OVERRIDE'])) {
            return strtoupper($_SERVER['HTTP_X_HTTP_METHOD_OVERRIDE']);
        } else {
            return isset($_POST['REQUEST_METHOD']) ? strtoupper($_POST['REQUEST_METHOD']) : 'GET';
        }
    }

    public function getIsGet()
    {
        return $this->getMethod() === 'GET';
    }

    public function getIsOptions()
    {
        return $this->getMethod() === 'OPTIONS';
    }

    public function getIsHead()
    {
        return $this->getMethod() === 'HEAD';
    }

    public function getIsPost()
    {
        return $this->getMethod() === 'POST';
    }

    public function getIsDelete()
    {
        return $this->getMethod() === 'DELETE';
    }


    public function getIsPut()
    {
        return $this->getMethod() === 'PUT';
    }


    public function getIsPatch()
    {
        return $this->getMethod() === 'PATCH';
    }

    public function getIsAjax()
    {
        return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] === 'XMLHttpRequest';
    }

    public function getIsPjax()
    {
        return $this->getIsAjax() && !empty($_SERVER['HTTP_X_PJAX']);
    }

    public function getIsFlash()
    {
        return isset($_SERVER['HTTP_USER_AGENT']) &&
        (stripos($_SERVER['HTTP_USER_AGENT'], 'Shockwave') !== false || stripos($_SERVER['HTTP_USER_AGENT'], 'Flash') !== false);
    }

    private $_rawBody;

    public function getRawBody()
    {
        if ($this->_rawBody === null) {
            $this->_rawBody = file_get_contents("php://input");
        }
        return $this->_rawBody;
    } 

    public function setRawBody($rawBody)
    {
        $this->_rawBody = $rawBody;
    }

    private $_bodyParams;

    public function getBodyParams()
    {

    }

    public function setBodyParams($values)
    {

    }

    public function getBodyparam($name, $defaultValue = null)

    public function post($name = null, $defaultValue = null)

    private $_queryParams;
    public function getQueryParams()
    public function setQueryParams($values)

    public function get($name = null, $defaultValue = null)

    public function getQueryParam($name, $defaultValue = null)

    private $_hostInfo;

    public function getHostInfo()

    public function setHostInfo($value)

    public function getBaseUrl()

    public function setBaseUrl($value)

    private $_scriptUrl;

    public function getScriptUrl()

    public function setScriptUrl($value)

    private $_scriptFile;

    public function getScriptFile()

    public function setScriptUrl($value)

    public $_pathInfo;

    public function getPathInfo()

    public function setPathInfo($value)

    protected function resovlePathInfo()

    public function getAbsoluteUrl()

    private $_url;

    public function getUrl()

    public function setUrl($value)

    protected function resovleRequestUri()

    public function getQueryString()

    public function getIsSecureConnection()

    public function getServerName()

    public function getServerPort()

    public function getReferrer()

    public function getUserAgent()

    public function getUserIp()

    public function getUserHost()

    public function getAuthUser()

    public function getAuthPassword()

    private $_port;

    public function getPort()

    public function setPort()

    private $_securePort;

    public function getSecurePort()

    public function setSecurePort($value)

    private function $_contentTypes;

    public function getAcceptableContentTypes()

    public function setAcceptableContentTypes($value)

    public function getContentType()

    private $_languages;

    public function getAcceptableLanguages()

    public function setAcceptableLanguages($value)

    public function parseAcceptableHeader($header)

    public function getPreferredLanguage(array $languages = [])

    public function getETags()

    public function getCookies()

    public function loadCookies()

    private $_csrfToken;

    public function getCsrfToken($regenerate = false)
    




}