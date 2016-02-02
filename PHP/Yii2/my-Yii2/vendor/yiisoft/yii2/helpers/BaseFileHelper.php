<?php

namespace yii\helpers;

use Yii;
use yii\base\InvalidConfigException;
use yii\base\InvalidParamException;

class BaseFileHelper
{
    const PATTERN_NODIR = 1;
    const PATTERN_ENDSWITH = 4;
    const PATTERN_MUSTBEDIR = 8;
    const PATTERN_NEGATIVE = 16;
    const PATTERN_CASE_INSENSITIVE = 32;

    public static $mimeMagicFile = '@yii/helpers/mimeTypes.php';

    /**
    *  格式化路径
    *  主要有下面几种处理
    *
    * - Convert all directory separators into `DIRECTORY_SEPARATOR` (e.g. "\a/b\c" becomes "/a/b/c")
    * - Remove trailing directory separators (e.g. "/a/b/c/" becomes "/a/b/c")
    * - Turn multiple consecutive slashes into a single one (e.g. "/a///b/c" becomes "/a/b/c")
    * - Remove ".." and "." based on their meanings (e.g. "/a/./b/../c" becomes "/a/c")
    *
    */
    public static function normalizePath($path, $ds = DIRECTORY_SEPARATOR)
    {
        
    }
}