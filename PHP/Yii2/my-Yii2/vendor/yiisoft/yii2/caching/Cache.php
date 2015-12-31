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
        if ($value === false || $this->serializer === false) {
            return $value;
        } elseif ($this->serializer === null) {
            $value = unserialize($value);
        } else {
            $value = call_user_func($this->serializer[1], $value);
        }
        if (is_array($value) && !($value[1] instanceof Dependency && $value[1]->getHasChanged($this))) {
            return $value[0];
        } else {
            return false;
        }
    }
    
    public function exists($key)
    {
        $key = $this->buildKey($key);
        $value = $this->getValue($key);
        
        return $value !== false;
    }
    
    public function mget($keys)
    {
        $keyMap = [];
        foreach ($keys as $key) {
            $keyMap[key] = $this->buildKey($key);
        }
        $values = $this->getValues(array_values($keyMap));
        $results = [];
        foreach ($keyMap as $key => $newKey) {
            $results[$key] = false;
            if (isset($values[$newKey])) {
                if ($this->serializer === false) {
                    $results[$key] = $values[$newKey];
                } else {
                    $value = $this->serializer === null ? unserialize($values[$newKey]) : call_user_func($this->serializer[1], $values[$newKey]);
                    
                    if (is_array($value) && !($value[1] instanceof Dependency && $value[1]->getHasChanged($this))) {
                        $results[$key] = $value[0];
                    }
                }
            }
        }
        return $results;       
    }
    
    public function set($key, $value, $duration = 0, $dependency = null) 
    {
        if ($dependency !== null && $this->serializer !== false) {
            $dependency->evaluateDependency($this);
        }
        
        if ($this->serializer === null) {
            $value = serialize([$value, $dependency]);
        } elseif ($this->serializer !== false) {
            $value = call_user_func($this->serializer[0], [$value, $dependency]);
        }
        
        $key = $this->buildKey($key);
        $this->setValue($key, $value, $duration);
    }
    
    public function mset($items, $duration = 0, $dependency = null)
    {
        if ($dependency !== null && $this->serializer !== false) {
            $dependency->evaluateDependency($this);
        }
    
        $data = [];
        foreach ($items as $key => $value) {
            if ($this->serializer === null) {
                $value = serialize([$value, $dependency]);
            } elseif ($this->serializer !== false) {
                $value = call_user_func($this->serializer[0], [$value, $dependency]);
            }
    
            $key = $this->buildKey($key);
            $data[$key] = $value;
        }
    
        return $this->setValues($data, $duration);
    }
    
    public function madd($items, $duration = 0, $dependency = null)
    {
        if ($dependency !== null && $this->serializer !== false) {
            $dependency->evaluateDependency($this);
        }
    
        $data = [];
        foreach ($items as $key => $value) {
            if ($this->serializer === null) {
                $value = serialize([$value, $dependency]);
            } elseif ($this->serializer !== false) {
                $value = call_user_func($this->serializer[0], [$value, $dependency]);
            }
    
            $key = $this->buildKey($key);
            $data[$key] = $value;
        }
    
        return $this->addValues($data, $duration);
    }
    
    public function add($key, $value, $duration = 0, $dependency = null)
    {
        if ($dependency !== null && $this->serializer !== false) {
            $dependency->evaluateDependency($this);
        }
        if ($this->serializer === null) {
            $value = serialize([$value, $dependency]);
        } elseif ($this->serializer !== false) {
            $value = call_user_func($this->serializer[0], [$value, $dependency]);
        }
        $key = $this->buildKey($key);
    
        return $this->addValue($key, $value, $duration);
    }
    
    public function delete($key)
    {
        $key = $this->buildKey($key);
    
        return $this->deleteValue($key);
    }
    
    public function flush()
    {
        $this->flushVlues();
    }
    
    abstract protected function getValue($key);
    
    abstract protected function setValue($key, $value, $duration);
    
    abstract protected function addValue($key, $value, $duration);
    
    abstract protected function deleteValue($key);
    
    abstract protected function flushVlues();
    
    protected function getValues($keys)
    {
        $results = [];
        foreach ($keys as $key) {
            $results[$key] = $this->getValue($key);
        }    
        return $results;
    }
    
    protected function setValues($data, $duration)
    {
        $failedKeys = [];
        foreach ($data as $key => $value) {
            if ($this->setValue($key, $value, $duration) === false) {
                $failedKeys[] = $key;
            }
        }
        
        return $failedKeys;
    }
    
    protected function addValues($data, $duration)
    {
        $failedKeys = [];
        foreach ($data as $key => $value) {
            if ($this->addValue($key, $value, $duration) === false) {
                $failedKeys = $key;
            }
        }
        return $failedKeys;
    }
    
    public function offsetExists($key) 
    {
        return $this->get($key) !== false;
    }

    public function offsetGet($key)
    {
        return $this->get($key);
    }
    
    public function offsetSet($key, $value)
    {
        $this->set($key, $value);
    }
    
    public function offsetUnset($key)
    {
        $this->delete($key);
    }
    
    
    
    
}