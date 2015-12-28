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

    public static function mailto($text, $email = null, $options = [])
    {
        $options['href'] = 'mailto:'.($email === null ? $text : $email);
        return static::tag('a', $text, $options);
    }

    public static function img($src, $options = [])
    {
        $options['src'] = Url::to($src);
        if (!isset($options['alt'])) {
            $options['alt'] = '';
        }
        return static::tag('img', '', $options);
    }

    public static function label($content, $for = null, $options = [])
    {
        $options['for'] = $for;
        return static::tag('label', $content, $options);
    }

    public static function button($content = 'Button', $options = [])
    {
        if (!isset($options['type'])) {
            $options['type'] = 'button';
        }
        return static::tag('button', $content, $options);
    }

    public static function submitButton($content = 'submit', $options = [])
    {
        $options['type'] = 'submit';
        return static::button($content, $options);
    }

    public static function resetButton($content = 'reset', $options = [])
    {
        $options['type'] = 'reset';
        return static::button($content, $options);
    }

    public static function input($type, $name = null, $value = null, $options = [])
    {
        if (!isset($options['type'])) {
            $options['type'] = $type;
        }
        $options['name'] = $name;
        $options['value'] = $value === null ? null : (string)$value;
        return static::tag('input', '', $options);
    }

    public static function buttonInput($label = 'Button', $options = [])
    {
        $options['type'] = 'button';
        $options['value'] = $label;
        return static::tag('input', '', $options);
    }

    public static function submitInput($label = 'Submit', $options = [])
    {
        $options['type'] = 'submit';
        $options['value'] = $label;
        return static::tag('input', '', $options);
    }

    public static function submitInput($label = 'Reset', $options = [])
    {
        $options['type'] = 'reset';
        $options['value'] = $label;
        return static::tag('input', '', $options);
    }

    public static function textInput($name, $value = null, $options = [])
    {
        return static::input('text', $name, $value, $options);
    }

    public static function hiddenInput($name, $value = null, $options = [])
    {
        return static::input('hidden', $name, $value, $options);
    }

    public static function passwordInput($name, $value = null, $options = [])
    {
        return static::input('password', $name, $value, $options);
    }

    public static function fileInput($name, $value = null, $options = [])
    {
        return static::input('file', $name, $value, $options);
    }

    public static function textarea($name, $value = '', $options = [])
    {
        $options['name'] = $name;
        return static::tag('textarea', static::encode($value), $options);
    }
    // 这边的label是双标签，不是单标签(for)
    public static function radio($name, $checked = false, $options = [])
    {
        $options['checked'] = (bool)$checked;
        $value = array_key_exists('value', $options) ? $options['value'] : 1;
        if (isset($options['uncheck'])) {
            $hidden = static::hiddenInput($name, $options['uncheck']);
            unset($options['uncheck']);
        } else {
            $hidden = '';
        }
        if (isset($options['label'])) {
            $label = $options['label'];
            $labelOptions = isset($options['labelOptions']) ? $options['labelOptions'] : [];
            unset($options['label'], $options['labelOptions']);
            $content = static::label(static::input('radio', $name, $value, $options).' '.$label, null, $labelOptions);
            return $hidden.$content;
        } else {
            return $hidden.static::input('radio', $name, $value, $options);
        }
    }

    public static function checkbox($name, $checked = false, $options = [])
    {
        $options['checked'] = (bool)$checked;
        $value = array_key_exists('value', $options) ? $options['value'] : 1;
        if (isset($options['uncheck'])) {
            $hidden = static::hiddenInput($name, $options['uncheck']);
            unset($options['uncheck']);
        } else {
            $hidden = '';
        }
        if (isset($options['label'])) {
            $label = $options['label'];
            $labelOptions = isset($options['labelOptions']) ? $options['labelOptions'] : [];
            unset($options['label'], $options['labelOptions']);
            $content = static::label(static::input('checkbox', $name, $value, $options).' '.$label, null, $labelOptions);
            return $hidden.$content;
        } else {
            return $hidden.static::input('checkbox', $name, $value, $options);
        }
    } 

    public static function dropDownList($name, $selection = null, $items = [], $options = [])
    {
        if (!empty($options['multiple'])) {
            return static::listBox($name, $selection, $items, $options);
        }
        $options['name'] = $name;
        unset($options['unselect']);
        $selectOptions = static::renderSelectOptions($selection, $items, $options);
        return static::tag('select', "\n".$selectOptions."\n", $options);
    }

    public static function listBox($name, $selection = null, $items = [], $options = [])
    {

    }

    public static function checkboxList($name, $selection = null, $items = [], $options = [])
    {

    }

    public static function radioList($name, $selection = null, $items = [], $options = [])
    {

    }

    public static function ul($items, $options = [])
    {

    }

    public static function ol($items, $options = [])
    {

    }

    public static function activeLabel($model, $attribute, $options = [])
    {

    }

    public static function activeHint($model, $attribute, $options = [])
    {

    }

    public static function errorSummary($models, $options = [])
    {

    }

    public static function error($model, $attribute, $options = [])
    {

    }

    public static function activeInput($type, $model, $attribute, $options = [])
    {

    }

    public static function activeTextInput($model, $attribute, $options = [])
    {

    }

    public static function activeHiddenInput($model, $attribute, $options = [])
    {

    }

    public static function activePasswordInput($model, $attribute, $options = [])
    {

    }

    public static function activeFileInput($model, $attribute, $options = [])
    {

    }

    public static function activeTextarea($model, $attribute, $options = [])
    {

    }

    public static function activeRadio($model, $attribute, $options = [])
    {

    }

    public static function activeCheckbox($model, $attribute, $options = [])
    {

    }

    public static function activeDropDownList($model, $attribute, $items, $options = [])
    {

    }

    public static function activeListBox($model, $attribute, $items, $options = [])
    {

    }

    public static function activeCheckboxList($model, $attribute, $items, $options = [])

    public static function activeRadioList($model, $attribute, $items, $options = [])

    protected static function activeListInput($type, $model, $attribute, $items, $options = [])

    public static function renderSelectOptions($selection, $items, &$tagOptions = [])


    public static function renderTagAttributes($attributes)
    {
        if (count($attributes) > 1) {
            $sorted = [];
            foreach (static::$attributeOrder as $name) {
                if (isset($attributes[$name])) {
                    $sorted[$name] = $attributes[$name];
                }
            }
            $attributes = array_merge($sorted, $attributes);
        }
        $html = '';
        foreach ($attributes as $name => $value) {
            if (is_bool($value)) {
                if($value) {
                    $html .= " $name";
                }
            } elseif (is_array($value)) {
                if (in_array($name, static::$dataAttributes)) {
                    foreach ($value as $n => $v) {
                        if (is_array($v)) {
                            $html .= " $name-$n='".Json::htmlEncode($v)."'";
                        } else {
                            $html .= " $name-$n=\"".static::encode($v).'"';
                        }
                    }
                } else {
                    $html .= " $name-$n='".Json::htmlEncode($v)."'";
                }
            } elseif ($value !== null) {
                $html .= " $name=\"".static::encode($v).'"';
            }
        }

        return $html;
    }

    public static function addCssClass(&$options, $class)

    public static function removeCssClass(&$options, $class)

    public static function addCssStyle(&$options, $style, $overwrite = true)

    public static function removeCssStyle(&$options, $properties)

    public static function cssStyleFromArray(array $style)

    public static function cssStyleToArray($style)

    public static function getAttributeName($attribute)

    public static function getAttributeValue($model, $attribute)

    public static function getInputName($model, $attribute)

    public static function getInputId($model, $attribute)
    
}