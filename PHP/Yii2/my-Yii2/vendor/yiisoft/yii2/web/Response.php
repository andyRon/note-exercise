<?php

namespace yii\web;

use Yii;
use yii\base\InvalidConfigException;
use yii\base\InvalidParamException;
use yii\helpers\Url;
use yii\helpers\FileHelper;
use yii\helpers\StringHelper;

class Response extends yii\base\Response
{
    const EVENT_BEFORE_SEND = 'beforeSend';

    const EVENT_AFTER_SEND = 'afterSend';

    const EVENT_AFTER_PREPARE = 'afterPrepare';

    const FORMAT_RAW = 'raw';
    const FORMAT_HTML = 'html';
    const FORMAT_JSON = 'json';
    const FORMAT_JSONP = 'jsonp';
    const FORMAT_XML = 'xml';

    public $format = self::FORMAT_HTML;

    public $acceptMimeType;

    public $acceptParams = [];

    public $formatters = [];

    public $data;

    public $content;

    public $stream;

    public $charset;

    public $statusText = 'OK';

    public $version;

    public $isSent = false;

    public static $httpStatus = [
        100 => 'Continue',
        101 => 'Switching Protocols',
        102 => 'Processing',
        118 => 'Connection timed out',
        200 => 'OK',
        201 => 'Created',
        202 => 'Accepted',
        203 => 'Non-Authoritative',
        204 => 'No Content',
        205 => 'Reset Content',
        206 => 'Partial Content',
        207 => 'Multi-Status',
        208 => 'Already Reported',
        210 => 'Content Different',
        226 => 'IM Used',
        300 => 'Multiple Choices',
        301 => 'Moved Permanently',
        302 => 'Found',
        303 => 'See Other',
        304 => 'Not Modified',
        305 => 'Use Proxy',
        306 => 'Reserved',
        307 => 'Temporary Redirect',
        308 => 'Permanent Redirect',
        310 => 'Too many Redirect',
        400 => 'Bad Request',
        401 => 'Unauthorized',
        402 => 'Payment Required',
        403 => 'Forbidden',
        404 => 'Not Found',
        405 => 'Method Not Allowed',
        406 => 'Not Acceptable',
        407 => 'Proxy Authentication Required',
        408 => 'Request Time-out',
        409 => 'Conflict',
        410 => 'Gone',
        411 => 'Length Required',
        412 => 'Precondition Failed',
        413 => 'Request Entity Too Large',
        414 => 'Request-URI Too Long',
        415 => 'Unsupported Media Type',
        416 => 'Requested range unsatisfiable',
        417 => 'Expectation failed',
        418 => 'I\'m a teapot',
        422 => 'Unprocessable entity',
        423 => 'Locked',
        424 => 'Method failure',
        425 => 'Unordered Collection',
        426 => 'Upgrade Required',
        428 => 'Precondition Required',
        429 => 'Too Many Requests',
        431 => 'Request Header Fields Too Large',
        449 => 'Retry With',
        450 => 'Blocked by Windows Parental Controls',
        500 => 'Internal Server Error',
        501 => 'Not Implemented',
        502 => 'Bad Gateway or Proxy Error',
        503 => 'Service Unavailable',
        504 => 'Gateway Time-out',
        505 => 'HTTP Version not supported',
        507 => 'Insufficient storage',
        508 => 'Loop Detected',
        509 => 'Bandwidth Limit Exceeded',
        510 => 'Not Extended',
        511 => 'Network Authentication Required',

    ];

    private $_statusCode = 200;

    private $_headers;

    public function init()
    {
        if ($this->version === null) {
            if (isset($_SERVER['SERVER_PROTOCOL']) && $_SERVER['SERVER_PROTOCOL'] === 'HTTP/1.0') {
                $this->version = '1.0';
            } else {
                $this->version = '1.1';
            }
        }

        if ($this->charset === null) {
            $this->charset = Yii::$app->charset;
        }
        $this->formatters = array_merge($this->defaultFormatters(), $this->formatters);
    }

    public function getStatusCode()
    {
        return $this->_statusCode;
    }

    public function setStatusCode($value, $text = null)
    {
        if ($value === null) {
            $value = 200;
        }
        $this->_statusCode = (int)$value;
        if ($this->getIsInvalid()) {
            throw new InvalidParamException('The HTTP status code is invalid: '.$value);
        }
        if ($text === null) {
            $this->statusText = isset(static::$httpStatus[$this->_statusCode]) ? static::$httpStatus[$this->_statusCode] : '';
        } else {
            $this->statusText = $text;
        }
    }

    public function getHeaders()
    {
        if ($this->_headers === null) {
            $this->_headers = new HeaderCollection;
        }
        return $this->_headers;
    }

    public function send()
    {
        if ($this->isSent) {
            return;
        }
        $this->trigger(self::EVENT_BEFORE_SEND);
        $this->prepare();
        $this->trigger(self::EVENT_AFTER_PREPARE);
        $this->sendHeaders();
        $this->sendContent();
        $this->trigger(self::EVENT_AFTER_SEND);
        $this->isSent = true;
    }
    public function clear()
    {
        $this->_headers = null;
        $this->_cookies = null;
        $this->_statusCode = 200;
        $this->statusText = 'OK';
        $this->data = null;
        $this->stream = null;
        $this->content = null;
        $this->isSent = false;
    }

    protected function sendHeaders()
    {
        if (headers_sent()) {
            return;
        }
        $statusCode = $this->getStatusCode();
        header("HTTP/{$this->version} $statusCode {$this->statusText}");

        if ($this->_headers) {
            $headers = $this->getHeaders();
            foreach ($headers as $name => $values) {
                //先把-转换成空字符 ，为了能够通过空字符区分每一个单词，然后把单词首字母大写，最后
                $name = str_replace(' ', '-', ucwords(str_replace('-', ' ', $name)));
                // 这一步是为了可以设置相同head选项
                $replace = true;
                foreach ($values as $value) {
                    header("$name: $value", $replace);
                    $replace = false;
                }
            }
        }

        $this->sendCookies();
    }

    protected function sendCookies()
    {
        if ($this->_cookies === null) {
            return;
        }
        $cookies = Yii::$app->getRequest();

        if ($request->enableCookieValidation) {
            if ($request->cookieValidationKey == '') {
                throw new InvalidConfigException(get_class($request) . '::cookieValidationKey must be configured with a secret key.').
            }
            $validationKey = $request->cookieValidationKey;
        }
        foreach ($this->getCookies() as $cookie) {
            $value = $cookie->value;
            if ($cookie->expire != 1 && isset($validationKey)) {
                $value = Yii::$app->getSecurity()->hashData(serialize([$cookie->name, $value]), $validationKey);
            }
            setcookie($cookie->name, $value, $cookie->expire, $cookie->path, $cookie->domain, $cookie->secure, c$cookie->httpOnly);
        }
    }

    protected function sendContent()
    {
        //...
    }

    public function sendFile($filePath, $attachmentName = null, $options = [])
    {

    }

    public function sendContentAsFile($content, $attachmentName, $options = [])
    {

    }

    public function sendStreamAsFile($content, $attachmentName, $options = [])
    {
        
    }

    public function setDownloadHeaders($attachmentName, $mimeType = null, $inline = false, $contentLength = null)
    {

    }

    protected function getHttpRange($fileSize)
    {

    }

    public function xSendFile($filePath, $attachmentName = null, $options = [])
    {

    }

    public function redirect($url, $statusCode = 302, $checkAjax = true)
    {

    }

    public function refresh()
    {

    }

    private $_cookies;

    public function getCookies() 
    {
        if ($this->_cookies === null) {
            $this->_cookies = new CookieCollection;
        }

        return $this->_cookies;    
    }

    public function getIsInvalid() 
    {
        return $this->getStatusCode() < 100 || $this->getStatusCode() >= 600; 
    }

    public function getIsInformational()
    {
        return $this->getStatusCode() >= 100 && $this->getStatusCode() < 200;
    }

    public function getIsSuccessful()
    {
        return $this->getStatusCode() >= 200 && $this->getStatusCode() < 300;
    }

    public function getIsRedirection()
    {
        return $this->getStatusCode() >= 300 && $this->getStatusCode() < 400;
    }

    public function getIsClientError()
    {
        return $this->getStatusCode() >= 400 && $this->getStatusCode() < 500;
    }

    public function getIsServerError()
    {
        return $this->getStatusCode() >= 500 && $this->getStatusCode() < 600;
    }

    public function getIsOk()
    {
        return $this->getStatusCode() == 200;
    }

    public function getIsForbidden()
    {
        return $this->getStatusCode() == 403;
    }

    public function getIsNotFound()
    {
        return $this->getStatusCode() == 404;
    }

    public function getIsEmpty()
    {
        return in_array($this->getStatusCode(), [201, 204, 304]);
    }

    protected function defaultFormatters()
    {
        return [
            self::FORMAT_HTML => 'yii\web\HtmlResponseFormatter',
            self::FORMAT_XML => 'yii\web\XmlResponseFormatter',
            self::FORMAT_JSON => 'yii\web\JsonResponseFormatter',
            self::FORMAT_JSONP => [
                'class' => 'yii\web\JsonResponseFormatter',
                'useJsonp' => true,
            ],
        ];
    }

    protected function prepare()
    {
        //...
    }
}