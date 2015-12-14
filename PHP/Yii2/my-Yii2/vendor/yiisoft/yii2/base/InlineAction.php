<?php

namespace yii\base;

use Yii;

class InlineAction extends Action
{
    public $actionMethod;

    public function __construct($id, $controller, $actionMethod, $config = [])
    {
        $this->actionMethod = $actionMethod;
        parent::__construct($id, $controller, $config);
    }

    public function runWithParams($params)
    {
        $args = $this->controller->bindActionParams($this, $params);
        Yii::trace('Running action:'.get_class($this->controller).'::'.$this->actionMethod.'()', __METHOD__);

        if (Yii::$app->requestedParams == null) {
            Yii::$app->requestedParams = $args;
        }

        return call_user_func_array([$this->controller, $this->actionMethod], $args);
    }
}