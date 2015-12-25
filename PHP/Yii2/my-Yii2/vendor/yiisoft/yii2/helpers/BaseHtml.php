<?php

namespace yii\helpers;

use Yii;
use yii\base\InvalidParamException;
use yii\web\Request;
use yii\base\Model;

class BaseHtml
{
    /* void element  单标签？ 空标签？
    * @see http://www.w3.org/TR/html-markup/syntax.html#void-element
    */
    public static $voidElement = [
        'area' => 1,
        'base' => 1,
        'br' => 1,
        'col' => 1,
        'command' => 1,
        'embed' => 1,
        'hr' => 1,
        'img' => 1,
        'input' => 1,
        'keygen' => 1,
        'link' => 1,
        'meta' => 1,
        'param' => 1,
        'source' => 1,
        'track' => 1,
        'wbr' => 1,
    ];


    public static $attributeOrder = [
        'type',
        'id',
        'class',
        'name',
        'value',

        'href',
        'src',
        'action',
        'method',

        'selected',
        'checked',
        'readonly',
        'disabled',
        'multiple',

        'size',
        'maxlength',
        'width',
        'height',
        'rows',
        'cols',

        'alt',
        'title',
        'rel',
        'media',
    ];

    public static $dataAttributes = ['data', 'data-ng', 'ng'];

    public static function encode($content, $doubleEncode = true)
    {
        return htmlspecialchars($content, ENT_QUOTES | ENT_SUBSTITUTE, Yii::$app ? Yii::$app->charset : 'UTF-8', $doubleEncode);
    }

    public static function decode($content)
    {
        htmlspecialchars_decode($content, ENT_QUOTES);
    }

    public static function tag($name, $content = '', $options = [])
    {
        $html = "<$name ".static::renderTagAttributes($options).' >';

        return isset(static::$voidElement[$name]) ? $html : "$html$content</$name>";
    }

    public static function beginTag($name, $options = [])
    {
        return "<$name ".static::renderTagAttributes($options).' >';
    }

    public static function endTag($name)
    {
        return "</$name>";
    }

    public static function style($content, $options = [])
    {
        return static::tag('style', $content, $options);
    }

    public static function script($content, $options = [])
    {
        return static::tag('script', $content, $options);
    }

    public static function cssFile($url, $options = [])
    {
        if (!isset($options['rel'])) {
            $options['rel'] = 'stylesheet';
        }
        $options['href'] = Url::to($url);

        if (isset($options['condition'])) {
            $condition = $options['condition'];
            unset($options['condition']);
            return "<!--[if $condition]>\n".static::tag('link', '', $options). "\n<![endif]-->";
        } elseif (isset($options['noscript']) && $options['noscript'] === true) {
            unset($options['noscript']);
            return "<noscript>". static::tag('link', '', $options). "</noscript>";
        } else {
            return static::tag('link', '', $options);
        }
    }

    public static function jsFile($url, $options = [])
    {
        $options['src'] = Url::to($url);

        if (isset($options['condition'])) {
            $condition = $options['condition'];
            unset($options['condition']);
            return "<!--[if $condition]>\n". static::tag('script', '', $options). "\n<![endif]-->";
        } else {
            return static::tag('script', '', $options);
        }
    }

    public static function csrfMetaTags()
    {
        $request = Yii::$app->request;
        if ($request instanceof Request && $request->enableCsrfValidation()) {
            return static::tag('meta', '', ['name' => 'csrf-param', 'content' => $request->csrfParam])."\n".static::tag('meta', '', ['name' => 'csrf-token', 'content' => $request->getCsrfToken()])."\n";
        } else {
            return '';
        }
    }

    public static function beginForm($action = '', $method = 'post', $options = [])
    {

    }

    public static function endform()
    {
        return '</form>';
    }

    public static function a($text, $url = null, $options = [])
    {
        if ($url !== null) {
            $options['href'] = Url::to($options);
        }
        return static::tag('a', $text, $options);
    }

    

}