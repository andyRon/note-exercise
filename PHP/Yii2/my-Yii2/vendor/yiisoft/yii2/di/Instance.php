<?php

namespace yii\di;

use Yii;
use yii\base\InvalidConfigException;

class Instance
{
    public $id;
    
    protected function __construct($id)
    {
        $this->id = $id;
    }

    public static function of($id)
    {

    }

    public static function ensure($reference, $type = null, $container = null)
    {

    }

    public function get($container = null)
    {
        
    }
}