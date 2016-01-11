<?php

namespace yii\web;

use Yii;
use yii\base\InvalidRouteException;

class Application extends yii\base\Application
{
    // 默认的路由
    public $defaultRoute = 'site';

    // array 该数组的第一个元素为路由，剩下的元素会（以名值对的形式）指定绑定于该操作的各个参数。
    // 全拦截路由， 有时需要把所有路由指向一个路由(维护模式)
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