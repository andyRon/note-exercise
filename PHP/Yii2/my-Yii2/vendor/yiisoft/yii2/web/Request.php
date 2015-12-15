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
        if ($this->_bodyParams === null) {
            if (isset($_POST[$this->methodParm])) {
                $this->_bodyParams = $_POST;
                unset($this->_bodyParams[$this->methodParm]);
                return $this->_bodyParams;
            }

            $contentType = $this->getContentType();
            if (($pos = strpos($contentType, ':')) !== false) {
                //e.g. text/plain;charset=UTF-8    
                $contentType = substr($contentType, 0, $pos);
            }

            if (isset($this->parsers[$contentType])) {
                $parser = Yii::createObject($this->parsers[$contentType]);
                if (!($parser instanceof RequestParserInterface)) {
                    throw new InvalidConfigException("The '$contentType' request parser is invalid. It must implement the yii\\web\\RequestParserInterface.");
                }
                $this->_bodyParams = $parser->parse($this->getRawBody(), $contentType);
            } elseif (isset($this->parsers['*'])) {
                $parser = Yii::createObject($this->parsers['*']);
                if (!($parser instanceof RequestParserInterface)) {
                    throw new InvalidConfigException("The fallback request parser is invalid. It must implement the yii\\web\\RequestParserInterface.");
                }
                $this->_bodyParams = $parser->parse($this->getRawBody(), $contentType);
            } elseif ($this->getMethod() === 'POST') {
                // PHP has already parsed the body so we have all params in $_POST
                $this->_bodyParams = $_POST;
            } else {
                $this->_bodyParams = [];
                mb_parse_str($this->getRawBody(), $this->_bodyParams);
            }
        }

        return $this->_bodyParams;
    }

    public function setBodyParams($values)
    {
        $this->_bodyParams = $values;
    }

    public function getBodyParam($name, $defaultValue = null)
    {
        $bodyParams = $this->getBodyParams();

        return isset($bodyParams[$name]) ? $bodyParams[$name] : $defaultValue;
    }

    public function post($name = null, $defaultValue = null)
    {
        if ($name === null) {
            return $this->getBodyParams();
        } else {
            return $this->getBodyParam($name, $defaultValue);
        }
    }

    private $_queryParams;

    public function getQueryParams()
    {
        if ($this->_queryParams === null) {
            return $_GET;
        }
        return $this->_queryParams;
    }

    public function setQueryParams($values)
    {
        $this->_queryParams = $values;
    }

    public function get($name = null, $defaultValue = null)
    {
        if ($name === null) {
            return $this->getQueryParams();
        } else {
            return $this->getQueryParam($name, $defaultValue);
        }
    }

    public function getQueryParam($name, $defaultValue = null)
    {
        $queryParams = $this->getQueryParams();

        return isset($queryParams[$name]) ? $queryParams[$name] : $defaultValue;
    }

    private $_hostInfo;

    public function getHostInfo()
    {
        if ($this->_hostInfo === null) {
            $secure = $this->getIsSecureConnection();
            $http = $secure ? 'https' : 'http';
            if (isset($_SERVER['HTTP_HOST'])) {
                $this->_hostInfo = $http.'://'.$_SERVER['HTTP_HOST'];
            } else {
                $this->_hostInfo = $http.'://'.$_SERVER['SERVER_NAME'];
                $port = $secure ? $this->getSecurePort() : $this->getPort();
                if (($post !== 80 && !$secure) || ($post !== 443 && $secure)) {
                    $this->_hostInfo .= ':'.$port;
                }
            }
        }
        return $this->_hostInfo;
    }

    public function setHostInfo($value)
    {
        $this->_hostInfo = rtrim($value, '/');
    }

    private $_baseUrl;

    public function getBaseUrl()
    {
        if ($this->_baseUrl === null) {
            $this->_baseUrl = rtrim(dirname($this->getScriptUrl()), '\\/');
        }
        return $this->_baseUrl;
    }

    public function setBaseUrl($value)
    {
        $this->_baseUrl = $value;
    }

    private $_scriptUrl;

    public function getScriptUrl()
    {
        if ($this->_scriptUrl === null) {
            $scriptFile = $this->getScriptFile();
            $scriptName = basename($scriptFile);
            if (basename($_SERVER['SCRIPT_NAME']) === $scriptName) {
                $this->_scriptUrl = $_SERVER['SCRIPT_NAME'];
            } elseif (basename($_SERVER['PHP_SELF']) === $scriptName) {
                $this->_scriptUrl = $_SERVER['PHP_SELF'];
            } elseif (isset($_SERVER['ORIG_SCRIPT_NAME']) && basename($_SERVER['ORIG_SCRIPT_NAME']) === $scriptName) {
                $this->_scriptUrl = $_SERVER['ORIG_SCRIPT_NAME'];
            } elseif (($pos = strpos($_SERVER['PHP_SELF'], '/' . $scriptName)) !== false) {
                $this->_scriptUrl = substr($_SERVER['SCRIPT_NAME'], 0, $pos) . '/' . $scriptName;
            } elseif (!empty($_SERVER['DOCUMENT_ROOT']) && strpos($scriptFile, $_SERVER['DOCUMENT_ROOT']) === 0) {
                $this->_scriptUrl = str_replace('\\', '/', str_replace($_SERVER['DOCUMENT_ROOT'], '', $scriptFile));
            } else {
                throw new InvalidConfigException('Unable to determine the entry script URL.');
            }
        }

        return $this->_scriptUrl;
    }

    public function setScriptUrl($value)
    {
        $this->_scriptUrl = '/' . trim($value, '/');
    }

    private $_scriptFile;

    public function getScriptFile()
    {
        return isset($this->_scriptFile) ? $this->_scriptFile : $_SERVER['SCRIPT_FILENAME'];
    }

    public function setScriptFile($value)
    {
        $this->_scriptFile = $value;
    }

    public $_pathInfo;
    // e.g. site/index
    public function getPathInfo()
    {
        if ($this->_pathInfo === null) {
            $this->_pathInfo = $this->resolvePathInfo();
        }

        return $this->_pathInfo;
    }

    public function setPathInfo($value)
    {
        $this->_pathInfo = ltrim($value, '/');
    }

    protected function resovlePathInfo()

    public function getAbsoluteUrl()

    private $_url;
    // e.g. /index.php/site/index
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