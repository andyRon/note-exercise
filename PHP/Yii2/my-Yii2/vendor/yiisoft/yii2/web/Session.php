<?php


namespace yii\web;

use Yii;
use yii\base\Component;
use yii\base\InvalidConfigException;
use yii\base\InvalidParamException;

class Session extends Component implements \IteratorAggregate, \ArrayAccess, \Countable
{
    public $flashParam = '_flash';

    public $handler;

    public $_cookieParams = ['httponly' => true];

    public function init()
    {
        parent::init();
        register_shutdown_function([$this, 'close']);
    }

    public function getUseCustomStorage()
    {
        return false;
    }

    public function open()
    {
        if ($this->getIsActive()) {
            return;
        }

        $this->registerSessionHandler();

        $this->setCookieParamsInternal();

        @session_start();

        if ($this->getIsActive()) {
            Yii::info('Session started:', __METHOD__);
            $this->updateFlashCounters();
        } else {
            $error = error_get_last();
            $message = isset($error['message']) ? $error['message'] : 'Failed to start session.';
            Yii::error($message, __METHOD__);
        }
    }

    
}