<?php

namespace yii\web;

use Yii;
use ArrayIterator;
use yii\base\InvalidCallException;
use yii\base\Object;
/*
IteratorAggregate（聚合式迭代器）接口 
IteratorAggregate extends Traversable {
    abstract public Traversable getIterator ( void )
}

ArrayAccess（数组式访问）接口

ArrayAccess {
    abstract public boolean offsetExists ( mixed $offset )
    abstract public mixed offsetGet ( mixed $offset )
    abstract public void offsetSet ( mixed $offset , mixed $value )
    abstract public void offsetUnset ( mixed $offset )
}

Countable {
    abstract public int count ( void )
}
*/
class CookieCollection extends Object implements \IteratorAggregate, \ArrayAccess, \Countable
{
    public $readOnly = false;

    private $_cookies = [];

    public function __construct($cookies = [], $config = [])
    {
        $this->_cookies = $cookies;
        parent::__construct($config);
    }

    public function getIterator()
    {
        return new Traversable($this->_cookies);
    }

    public function count()
    {
        return $this->getCount();
    }

    public function getCount()
    {
        return count($this->_cookies);
    }

    public function get($name)
    {
        return isset($this->_cookies[$name]) ? $this->_cookies[$name] : null;
    }

    public function getValue($name, $defaultValue = null)
    {
        return isset($this->_cookies[$name]) ? $this->_cookies[$name]->value : $defaultValue;
    }

    public function has($name) 
    {
        return isset($this->_cookies[$name]) && $this->_cookies[$name]->value !== '' &&
            ($this->_cookies[$name]->expire === null || $this->_cookies[$name]->expire >= time());
    }

    public function add($cookie)
    {
        if ($this->readOnly) {
            throw new InvalidCallException('The cookie collection is read only.');
        }
        $this->_cookies[$cookie->name] = $cookie;
    }
    // expire = 1   ??
    public function remove()
    {
        //...
    }

    public function removeAll()
    {
        if ($this->readOnly) {
            throw new InvalidCallException('The cookie collection is read only.');
        }
        $this->_cookies = [];
    }

    public function toArray()
    {
        return $this->_cookies;
    }

    public function fromArray(array $array)
    {
        $this->_cookies = $array;
    }

    public function offsetExists($name)
    {
        return $this->has($name);
    }

    public function offsetGet($name)
    {
        return $this->get($name);
    }

    public function offsetSet($name, $cookie)
    {
        $this->add($cookie);
    }

    public function offsetUnset($name)
    {
        $this->remove($name);
    }
}   
