<?php

namespace yii\base;


class UnknownMethodException extends Exception
{
    public function getName()
    {
        return 'Unknown Method';
    }
}
