<?php

namespace yii\base;


class InvailCallException extends \BadMethodCallException
{
    public function getName()
    {
        return 'Invalid Call';
    }
}