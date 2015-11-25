<?php

namespace yii\base;


class UnknownClassException extends Exception
{
    public function getName()
    {
        return 'Unknown Class';
    }
}
