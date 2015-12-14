<?php

namespace yii\web;


class TooManyRequestsHttpException extends HttpException
{
    public function __construct($message = null, $code = 0, \Exception $previous = null)
    {
        parent::__construct(429, $message, $code, $previous);
    }
}