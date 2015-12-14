<?php

namespace yii\web;

use yii\base\UserException;


class HttpException extends UserException
{
    public $statusCode;

    public function __construct($status, $message = null, $code = 0, \Exception $previous = null)
    {
        $this->statusCode = $status;
        parent::__construct($message, $code, $previous);
    }

    public function getName()
    {
        if (isset(Respone::$httpStatuses[$this->statusCode])) {
            return Respone::$httpStatuses[$this->statusCode];
        } else {
            return 'Error';
        }
    }
}