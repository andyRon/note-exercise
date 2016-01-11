<?php 


namespace yii\web;


interface UrlRuleInterface
{
    // 解析request生成路由和参数
    public function parseRequest($manager, $request);
    
    // 通过路由和参数生成url，与pareserequest相对印
    public function createUrl($manager, $route, $params);
}