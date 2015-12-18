<?php

namespace yii\data;

use Yii;
use yii\base\Component;
use yii\base\InvalidParamException;

abstract class BaseDataProvider extends Component implements DataproviderInterface
{
    public $id;

    private $_sort;
    private $_pagination;
    private $_keys;
    private $_models;
    private $_totalCount;

    abstract protected function prepareModels();

    abstract protected function prepareKeys($models);

    abstract protected function prepareTotalCount();

    public function prepare($forcePrepare = false) 
    {
        if ($forcePrepare || $this->_models === null) {
            $this->_models = $this->prepareModels();
        }
        if ($forcePrepare || $this->_keys === null) {
            $this->_keys = $this->prepareKeys($this->_models);
        }
    }

    public function getModels()
    {
        $this->prepare();

        return $this->_models;
    }

    public function setModels($models)
    {
        $this->_models = $models;
    }

    public function getKeys()
    {
        $this->prepare();

        return $this->_keys;
    }

    public function setKeys($keys)
    {
        $this->_keys = $keys;
    }

    public function getCount()
    {
        return count($this->getModels());
    }

    public function getTotalCount()
    {
        if ($this->getPagination() === false) {
            return $this->getCount();
        } elseif ($this->_totalCount === null) {
            $this->_totalCount = $this->prepareTotalCount();
        }

        return $this->_totalCount;
    }

    public function setTotalCount($value)
    {
        $this->_totalCount = $value;
    }

    public function getPagination()
    {
        if ($this->_pagination === null) {
            $this->setPagination([]);
        }

        return $this->_pagination;
    }

    public function setPagination($value)
    {
        if (is_array($value)) {
            $config = ['class' => Pagination::className()];
            if ($this->id !== null) {
                $config['pageParam'] = $this->id.'-page';
                $config['pageSizeParam'] = $this->id.'-per-page';
            }
            $this->_pagination = Yii::createObject(array_merge($config, $value));
        } elseif ($value instanceof Pagination || $value === false) {
            $this->_pagination = $value;
        } else {
            throw new InvalidParamException('Only Pagination instance, configuration array or false is allowed.');
        }
    }

    public function getSort()
    {
        if ($this->_sort === null) {
            $this->setSort([]);
        }
        return $this->_sort;
    }

    public function setSort($value)
    {
        if (is_array($value)) {
            $config = ['class' => Sort::className()];
            if ($this->id !== null) {
                $config['sortParam'] = $this->id . '-sort';
            }
            $this->_sort = Yii::createObject(array_merge($config, $value));
        } elseif ($value instanceof Sort || $value === false) {
            $this->_sort = $value;
        } else {
            throw new InvalidParamException('Only Sort instance, configuration array or false is allowed.');
        }
    }

    public function refresh()
    {
        $this->_totalCount = null;
        $this->_models = null;
        $this->_keys = null;
    }
}