<?php 

namespace yii\web;

use Yii;
use yii\base\Object;
use yii\base\InvalidConfigException;

class UrlRule extends Object implements UrlRuleInterface
{
	const PARSING_ONLY = 1;

	const CREATION_ONLY = 2;

	public $name;

	public $pattern;
    
}