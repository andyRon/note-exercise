<?php

namespace yii\data;

use Yii;
use yii\db\ActiveQueryInterface;
use yii\base\InvalidConfigException;
use yii\base\Model;
use yii\db\Connection;
use yii\db\QueryInterface;
use yii\di\Instance;


class ActiveDataProvider extends BaseDataProvider
{
    public $query;

    public $key;

    public $db;


    public function init()
    {
        parent::init();
        if (is_string($this->db)) {
            $this->db = Instance::ensure($this->db, Connection::className());
        }
    }

    protected function prepareModels()
    {
        if (!$this->query instanceof QueryInterface) {
            throw new InvalidConfigException('The "query" property must be an instance of a class that implements the QueryInterface e.g. yii\db\Query or its subclasses.');
        }
        $query = clone $this->query;
        if (($pagination = $this->getPagination()) !== false) {
            $pagination->totalCount = $this->getTotalCount();
            $query->limit($pagination->getLimit())->offset($pagination->getOffset());
        }

        if(($sort = $this->getSort()) !== false) {
            $query->addOrderBy($sort->getOrders());
        }
        return $query->all($this->db);
    }

    protected function prepareKeys($models)

    protected function prepareTotalCount()

    public function setSort($value)
    
}