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
    {
        //...
    }

    public function getAbsoluteUrl()
    {
        return $this->getHostInfo().$this->getUrl()
    }

    private $_url;
    // e.g. /index.php/site/index
    public function getUrl()
    {
        if ($this->_url === null) {
            $this->_url = $this=>resovleRequestUri();
        }

        return $this->_url;
    }

    public function setUrl($value)
    {
        $this->_url = $value;
    }

    protected function resovleRequestUri()
    {
        //...
    }

    public function getQueryString()
    {
        return isset($_SERVER['QUERY_STRING']) ? $_SERVER['QUERY_STRING'] : '';
    }

    public function getIsSecureConnection()
    {
        return isset($_SERVER['HTTPS']) && (strcasecmp($_SERVER['HTTPS'], 'on') === 0 || $_SERVER['HTTPS'] == 1)
            || isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && strcasecmp($_SERVER['HTTP_X_FORWARDED_PROTO'], 'https') === 0;
    }

    public function getServerName()
    {
        return $_SERVER['SERVER_NAME'];
    }

    public function getServerPort()
    {
        return (int) $_SERVER['SERVER_PORT'];
    }
    /*
    HTTP Referer是header的一部分，当浏览器向web服务器发送请求的时候，一般会带上Referer，告诉服务器我是从哪个页面链接过来的，服务器籍此可以获得一些信息用于处理
    */
    public function getReferrer()
    {
        return isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : null;
    }

    public function getUserAgent()
    {
        return isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : null;
    }

    public function getUserIp()
    {
        return isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : null;
    }

    public function getUserHost()
    {
        return isset($_SERVER['REMOTE_HOST']) ? $_SERVER['REMOTE_HOST'] : null;
    }

    public function getAuthUser()
    {
        return isset($_SERVER['PHP_AUTH_USER']) ? $_SERVER['PHP_AUTH_USER'] : null;
    }

    public function getAuthPassword()
    {
        return isset($_SERVER['PHP_AUTH_PW']) ? $_SERVER['PHP_AUTH_PW'] : null;
    }

    private $_port;

    public function getPort()
    {
        if ($this->_port === null) {
            $this->_port = !$this->getIsSecureConnection() && isset($_SERVER['SERVER_PORT']) ? (int) $_SERVER['SERVER_PORT'] : 80;
        }

        return $this->_port;
    }

    public function setPort()
    {
        if ($value != $this->_port) {
            $this->_port = (int) $value;
            $this->_hostInfo = null;
        }
    }

    private $_securePort;

    public function getSecurePort()
    {
        if ($this->_securePort === null) {
            $this->_securePort = $this->getIsSecureConnection() && isset($_SERVER['SERVER_PORT']) ? (int) $_SERVER['SERVER_PORT'] : 443;
        }

        return $this->_securePort;
    }

    public function setSecurePort($value)
    {
        if ($value != $this->_securePort) {
            $this->_securePort = (int) $value;
            $this->_hostInfo = null;
        }
    }


    private $_contentTypes;

    public function getAcceptableContentTypes()
    {
        if ($this->_contentTypes === null) {
            if (isset($_SERVER['HTTP_ACCEPT'])) {
                $this->_contentTypes = $this->parseAcceptHeader($_SERVER['HTTP_ACCEPT']);
            } else {
                $this->_contentTypes = [];
            }
        }
        return $this->_contentTypes;
    }

    public function setAcceptableContentTypes($value)
    {
        $this->_contentTypes = $value;
    }

    public function getContentType()
    {
        if (isset($_SERVER["CONTENT_TYPE"])) {
            return $_SERVER["CONTENT_TYPE"];
        } elseif (isset($_SERVER["HTTP_CONTENT_TYPE"])) {
            //fix bug https://bugs.php.net/bug.php?id=66606
            return $_SERVER["HTTP_CONTENT_TYPE"];
        }

        return null;
    }

    private $_languages;

    public function getAcceptableLanguages()
    {
        if ($this->_languages === null) {
            if (isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])) {
                $this->_languages = array_keys($this->parseAcceptHeader($_SERVER['HTTP_ACCEPT_LANGUAGE']));
            } else {
                $this->_languages = [];
            }
        }
        return $this->_languages;
    }

    public function setAcceptableLanguages($value)
    {
        $this->_languages = $value;
    }

    public function parseAcceptHeader($header)
    {
        //...
    }

    public function getPreferredLanguage(array $languages = [])
    {
        //...
    }

    /*
    Etags（Entity tags）是服务器和浏览器的一个功能，它用来判断浏览器缓存里的元素是否和原来服务器上的一致。ETags比last-modified date更具有弹性，它用一个独一无二的字符串来标识一个元素的版本。 
    */
    public function getETags()
    {
        //...
    }

    public function getCookies()
    {
        //...
    }

    public function loadCookies()
    {
        //...
    }

    private $_csrfToken;

    public function getCsrfToken($regenerate = false)
    {
        //...
    }
    
    protected function loadCsrfToken()
    {
        //...
    }

    protected function generateCsrfToken()
    {
        //...
    }

    private function xorTokens($token1, $token2)
    {

    }

    public function getCsrfTokenFromHeader()

    protected function createCsrfCookie($token)

    public function validateCsrfToken($token = null)

    private function validateCsrfTokenInternal($token, $trueToken)
    






}