<?php

namespace yii\base;


class Response extends Component
{
    public $exitStatus;

    public function send()
    {

    }

    public function clearOutputBuffers()
    {
        for ($level = ob_get_level(); $level > 0; --$level) {
            if (!@ob_end_clean()) {
                ob_clean();
            }
        }
    }
}