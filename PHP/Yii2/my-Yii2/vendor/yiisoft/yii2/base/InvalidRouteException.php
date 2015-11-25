<?php

namespace yii\base;


class InvailRouteException extends UserException
{
    public function getName()
    {
        return 'Invalid Route';
    }
}