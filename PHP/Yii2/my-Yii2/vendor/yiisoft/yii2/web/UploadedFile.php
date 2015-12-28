<?php

namespace yii\web;

use yii\base\Object;
use yii\helpers\Html;

class UploadedFile extends Object
{
    public $name;

    public $tempName;

    public $type;

    public $size;

    public $error;

    private static $_files;

    public function __toString()
    {
        return $this->name;
    }

    public static function getInstance($model, $attribute)
    {
        $name = Html::getInputName($model, $attribute);
        return static::getInstanceByName($name);
    }

    public static function getInstances($model, $attribute)
    {
        $name = Html::getInputName($model, $attribute);
        return static::getInstancesByName($name);
    }

    public static function getInstanceByName($name)
    {
        $files = self::loadFiles();
        return isset($files[$name]) ? $files[$name] : null;
    }

    public static function getInstancesByName($name)
    {
        $files = self::loadFiles();
        if (isset($files[$name])) {
            return [$files[$name]];
        }
        $results = [];
        foreach ($files as $key => $file) {
            if (strpos($key, "{$name}[") === 0) {
                $results[] = $file;
            }
        }
        return $results;
    }

    public static function reset()
    {
        self::$_files = null;
    }

    public function saveAs($file, $deleteTempFile = true)

    public function getBaseName()
    
    public function getExtension()

    public function getHasError()

    private static function loadFiles()

    private static function loadFilesRecursive($key, $names, $tempNames, $types, $sizes, $errors)
    
}