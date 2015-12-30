<?php

namespace yii\caching;

use yii\base\Component;
use yii\helpers\StringHelper;
/** 
* 不同种类cache的基类
* @param 
* @return 
* @author andyron <randy.njfu@gmail.com> 
* @date 2015年12月30日下午5:30:15 
*/

abstract class Cache extends Component implements \ArrayAccess
{
    public $keyPrefix;

    public $serializer;

    public function buildKey($key)
    {
        if (is_string($key)) {
            $key = ctype_alnum($key) && StringHelper::byteLength($key) <= 32 ? $key : md5($key);
        } else {
            $key = md5(json_decode($key));
        }

        return $this->keyPrefix . $key;
    }
    
    public function get($key)
    {
        $key = $this->buildKey($key);
        $value = $this->getValue($key);
        if (1) {
            
        }
    }
    
    abstract protected function getValue($key);
    
    abstract protected function setValue($key, $value, $duration);
    
    abstract protected function addValue($key, $value, $duration);
    
    abstract protected function deleteValue($key);
    
    abstract protected function flushVlues();
}