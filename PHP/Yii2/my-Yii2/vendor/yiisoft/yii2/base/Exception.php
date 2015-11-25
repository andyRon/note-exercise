<?php

namespace yii\base;


class Exception extends \Exception
{
    public function getName()
    {
        return 'Exception';
    }
}