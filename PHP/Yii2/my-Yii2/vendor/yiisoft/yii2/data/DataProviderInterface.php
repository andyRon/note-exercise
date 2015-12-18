<?php

namespace yii\data;

interface DataProviderInterface
{
    public function prepare($forcePrepare = false);

    public function getCount();

    public function getTotalCount();

    public function getModels();

    public function getKeys();

    public function getSort();

    public function getPagination();

}