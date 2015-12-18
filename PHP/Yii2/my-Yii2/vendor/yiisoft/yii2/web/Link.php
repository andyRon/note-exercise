<?php

namespace yii\web;


use yii\base\Object;
/*
[JSON Hypermedia API Language](https://tools.ietf.org/html/draft-kelly-json-hal-03).
*/

class Link extends Object
{
    const REL_SELF = 'self';

    public $href;

    public $name;

    public $type;

    public $templated = false;

    public $profile;

    public $title;

    public $hreflang;

    public static function serialize(array $links)
    {
        foreach ($links as $rel => $link) {
            if (is_array($link)) {
                foreach ($link as $i => $l) {
                    $link[$i] = $l instanceof self ? array_filter((array) $l) : ['href' => $l];
                }
                $links[$rel] = $link;
            } elseif (!$link instanceof self) {
                $links[$rel] = ['href' => $link];
            }
        }

        return $links;
    }
}