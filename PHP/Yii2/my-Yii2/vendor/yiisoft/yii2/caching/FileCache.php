<?php

namespace yii\caching;

use Yii;
use yii\helpers\FileHelper;


class FileCahce extends Cache
{
    public $keyPrefix = '';

    public $cachePath = "@runtime/cache";

    public $cacheFileSuffix = '.bin';

    public $directoryLevel = 1;

    public $gcProbability = 10;

    /**
    *   chmod() 
    */
    public $fileMode;

    public $dirMode = 0775;

    public function init()
    {
        parent::init();
        $this->cachePath = Yii::aliases($this->cachePath);
        if (!is_dir($this->cachePath)) {
            FileHelper::createDirectory($this->cachePath, $this->dirMode, true);
        }
    }
    // ?
    public function exists($key)
    {
        $cacheFile = $this->getCacheFile($key);

        return @filemtime($cacheFile) > time();
    }

    protected function getValue($key)
    {
        $cacheFile = $this->getCacheFile($$key);
        if (@filemtime($cacheFile) > time()) {
            return @file_get_contents($cacheFile);
        } else {
            return false;
        }
    }

    protected function setValue($key, $value, $duration)
    {
        $cacheFile = $this->getCacheFile($key);
        if ($this->directoryLevel > 0) {
            @FileHelper::createDirectory(dirname($cacheFile), $this->dirMode, true);
        }
        if (@file_put_contents($cacheFile, $value, LOCK_EX) !== false) {
            if ($this->fileMode !== null) {
                @chmod($cacheFile, $this->fileMode);
            }
            if ($duration <= 0) {
                $duration = 31536000;
            }
            // ?? 
            return @touch($cacheFile, $duration + time());
        } else {
            return false;
        }
    }

    protected function addValue($key, $value, $duration) 
    {
        $cacheFile = $this->getCacheFile($key);
        if (@filemtime($cacheFile) > time()) {
            return false;
        }

        $this->setValue($key, $value, $duration);
    }

    protected function deleteValue($key) 
    {
        $cacheFile = $this->getCacheFile($key);

        @unlink($cacheFile);
    }

    protected function getCacheFile($key)
    {
        if ($this->directoryLevel > 0) {
            $base = $this->cachePath;
            for ($i = 0; $i < $this->directoryLevel; ++$i) {
                if ($prefix = substr($key, $i+$i, 2) !== false) {
                    $base .= DIRECTORY_SEPARATOR.$prefix;
                }
            }
            
            return $base. DIRECTORY_SEPARATOR . $key . $this->cacheFileSuffix; 
        } else {
            return $this->cachePath . DIRECTORY_SEPARATOR. $key. $this->cacheFileSuffix;
        }
    }
    
    protected function flushVlues()
    {
        $this->gc(true, false);
        
        return true;
    } 
    
    public function gc($force = false, $expiredOnly = true)
    {
        if ($force || mt_rand(0, 1000000) < $this->gcProbability) {
            $this->gcRecursive($this->cachePath, $expiredOnly);
        }
    }
    
    protected function gcRecursive($path, $expiredOnly)
    {
        if (($handle = opendir($path)) !== false) {
            while (($file = readdir($handle)) !== false) {
                if ($file[0] === '.') {
                    continue;
                }
                $fullPath = $path . DIRECTORY_SEPARATOR . $file;
                if (is_dir($fullPath)) {
                    $this->gcRecursive($fullPath, $expiredOnly);
                    if (!$expiredOnly) {
                        if (!@rmdir($fullPath)) {
                            $error = error_get_last();
                            Yii::warning("Unable to remove directory '{$fullPath}': {$error['message']}", __METHOD__);
                        }
                    }
                } elseif (!$expiredOnly || $expiredOnly && @filemtime($fullPath) < time()) {
                    if (!@unlink($fullPath)) {
                        $error = error_get_last();
                        Yii::warning("Unable to remove file '{$fullPath}': {$error['message']}", __METHOD__);
                    }
                }
            }
            closedir($handle);
        }
    }
}
