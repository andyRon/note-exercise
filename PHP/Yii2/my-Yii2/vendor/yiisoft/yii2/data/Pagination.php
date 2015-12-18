<?php

namespace yii\data;

use Yii;
use yii\base\Object;
use yii\web\Link;
use yii\web\Linkable;
use yii\web\Request;


class Pagination extends Object implements Linkable
{
    const LINK_NEXT = 'next';
    const LINK_PREV = 'prev';
    const LINK_FIRST = 'first';
    const LINK_LAST = 'last';

    public $pageParam = 'page';

    public $pageSizeParam = 'per-page';

    public $forcePageParam = true;

    public $route;

    public $params;

    public $urlManager;

    public $validatePage = true;

    public $totalCount = 0;

    public $defaultPageSize = 20;

    public $pageSizeLimit = [1, 50];

    // 每页条数
    private $_pageSize;

    // 获得总共页数
    public function getPageCount()
    {
        $pageSize = $this->getPageSize();
        if ($pageSize < 1) {
            return $this->totalCount > 0 ? 1 : 0;
        } else {
            $totalCount = $this->totalCount < 0 ? 0 : (int) $this->totalCount;

            return (int) ( ($totalCount + $pageSize -1) / $pageSize );
        }
    }

    private $_page;

    public function getPage($recalculate = false) 
    {
        if ($this->_page === null || $recalculate) {
            $page = (int) $this->getQueryParam($this->pageParam, 1) - 1;
            $this->setPage($page, true);
        }

        return $this->_page;
    }

    public function setPage($value, $validatePage = false)
    {
        if ($value === null) {
            $this->_page = null;
        } else {
            $value = (int) $value;
            if ($validatePage && $this->validatePage) {
                $pageCount = $this->getPageCount();
                if ($value >= $pageCount) {
                    $value = $pageCount - 1;
                }
            }
            if ($value < 0) {
                $value = 0;
            }
            $this->_page = $value;
        }
    }

    public function getPageSize()
    {
        if ($this->_pageSize === null) {
            if (empty($this->pageSizeLimit)) {
                $pageSize = $this->defaultPageSize;
                $this->setPageSize($pageSize);
            } else {
                $pageSize = (int) $this->getQueryParam($this->pageSizeParam, $this->defaultPageSize);
                $this->setPageSize($pageSize, true);
            }
        }

        return $this->_pageSize;
    }

    public function setPageSize($value, $validatePageSize = false)
    {
        if ($value === null) {
            $this->_pageSize = null;
        } else {
            $value = (int) $value;
            if ($validatePageSize && isset($this->pageSizeLimit[0], $this->pageSizeLimit[1]) && count($this->pageSizeLimit) === 2) {
                if ($value < $this->pageSizeLimit[0]) {
                    $value = $this->pageSizeLimit[0];
                } elseif ($value > $this->pageSizeLimit[1]) {
                    $value = $this->pageSizeLimit[1];
                }
            }

            $this->_pageSize = $value;
        }
    }

    public function createUrl($page, $pageSize = null, $absolute = false)
    
}