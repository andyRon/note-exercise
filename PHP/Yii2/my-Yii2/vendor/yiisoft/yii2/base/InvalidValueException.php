<?php

namespace yii\base;


class InvailValueException extends \UnexpectedValueException
{
    public function getName()
    {
        return 'Invalid Return Value';
    }
}