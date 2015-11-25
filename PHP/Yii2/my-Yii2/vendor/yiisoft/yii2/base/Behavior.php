<?php

namespace yii\base;

class Behavior extends Component 
{
    // 代指 某个`Component` 
    public $owner;

    public function events()
    {
        return [];
    }

    public function attach($owner)
    {
        $this->$owner = $owner;
        foreach ($this->events() as $event => $hanlder) {
            $owner->on($event, is_string($hanlder) ? [$this, $hanlder] : $hanlder);
        }
    }

    public function detach()
    {
        if($this->owner){
            foreach ($this->events() as $event => $hanlder) {
                $this->owner->off($event, is_string($hanlder) ? [$this, $hanlder] : $hanlder);
            }
            $this->owner = null;
        }
    }
}