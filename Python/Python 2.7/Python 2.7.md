### 0 简介
    - 缺点
        + 速度慢
        + 是代码不能加密

    - Python解释器
        + CPython
        + IPython
        + PyPy
        + Jython
    - 文本编辑器
        + Word保存的不是纯文本文件，而记事本会自作聪明地在文件开始的地方加上几个特殊字符（UTF-8 BOM）
    - 直接运行py文件
        + `#!/usr/bin/env python`  `$ chmod a+x hello.py`
    - Python的交互模式和直接运行.py文件的区别  
        + 交互模式： 启动Python解释器，等待输入，一行一行的解释
        + 直接运行： 启动了Python解释器，然后一次性把.py文件的源代码给执行了
    - 输入和输出
        + `print`
        + `raw_input`   

### 1 Python基础
    - 自然语言在不同的语境下有不同的理解，而计算机要根据编程语言执行任务，就必须保证编程语言写出的程序决不能有歧义
    - `#` 是注释，其他每一行都是一个语句，当语句以冒号“:”结尾时，缩进的语句视为代码块。
    - Python程序是大小写敏感的
    - 数据类型
        + 用r''表示''内部的字符串默认不转义

                >>> print '\\\t\\'
                \       \
                >>> print r'\\\t\\'
                \\\t\\

        + 多行字符串 '''...'''
        + True  False
        + 空值 `None`
        + 常量 没有
    - 字符串和编码
        + ASCII、Unicode和UTF-8
        + 在计算机内存中，统一使用Unicode编码，当需要保存到硬盘或者需要传输的时候，就转换为UTF-8编码。  
            用记事本编辑的时候，从文件读取的UTF-8字符被转换为Unicode字符到内存里，编辑完成后，保存的时候再把Unicode转换为UTF-8保存到文件：  
            ![](../img/1.1.png)  
            浏览网页的时候，服务器会把动态生成的Unicode内容转换为UTF-8再传输到浏览器：  
            ![](../img/1.2.png)  
        + Python的字符串*
            - `ord('A')`  `chr(65)`
            - `len()`

        + 格式化
            - 类似于C语言 ： `'Hi, %s, you have $%d.' % ('Michael', 1000000)`
    - 使用list和tuple
        + list
            * `classmates = ['Michael', 'Bob', 'Tracy']`
            * `classmates[-1]`
            * `classmates.append('Adam')`
            * `classmates.insert(1, 'Jack')`
            * `classmates.pop()`    `classmates.pop(1)`
        + tuple tuple一旦初始化就不能修改
            - 只有1个元素的tuple定义时必须加一个逗号,，来消除歧义 `t = (2)`
            - 在tuple中放入list，这样看上去就能修改tuple  `tt = ("a", "b", [4,5,9])`
    - 条件判断和循环
        + `if elif else`
        + `for x in ...`
        + `range()`
        + raw_input()读取的内容永远以字符串的形式返回
    - 使用dict和set
        + dict 

                d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
                d['Michael']
                d.get('Thomas')     # None
                d.get('Thomas', -1) # -1
                d.pop('Bob')

        + 和list比较，dict有以下几个特点：
            * 查找和插入的速度极快，不会随着key的增加而增加；
            * 需要占用大量的内存，内存浪费多。

### 2 函数
    - 函数就是最基本的一种代码抽象的方式。
    - 调用函数
        + `abs(2)`
        + `cmp(x,y)`
        + `int()`
        + `float()`
        + `str()`
        + `unicode()`
        + `bool()`
        + 函数名其实就是指向一个函数对象的引用，完全可以把函数名赋给一个变量，相当于给这个函数起了一个“别名”
    - 定义函数

            def my_abs(x):
                if x>=0:
                    return x
                else: 
                    return -x

        + 空函数   `pass`
        + 参数检查
        + 返回多个值
    - 函数的参数
        + 默认参数
            * 当函数有多个参数时，把变化大的参数放前面，变化小的参数放后面。变化小的参数就可以作为默认参数。
            * 当不按顺序提供部分默认参数时，需要把参数名写上
            * 默认参数必须指向不变对象

