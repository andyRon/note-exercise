<?php

namespace yii\web;

use Yii;
use yii\base\InvalidRouteException;

class Application extends yii\base\Application
{
    public $defaultRoute = 'site';

    public $catchAll;

    public $controller;

    protected function bootstrap()
    {
        $request = $this->getRequest();
        Yii::setAlias('@webroot', dirname($request->getScriptFile()));
        Yii::setAlias('@web', $request->getBaseUrl());

        parent::bootstrap();
    }

    public function handleRequest($request)
    {
        if (empty($this->catchAll)) {
            list($route, $params) = $request->resovle();
        } else {
            $route = $this->catchAll[0];
            $params = $this->catchAll;
            unset($params[0]);
        }

        //...
    }
}