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
        + 可变参数(tuple)
            ``` python
                def calc(*numbers):
                    sum = 0
                    for n in numbers:
                        sum = sum + n * n
                    return sum
            ```
            `*numbers` 表示接受到的是一个tuple
        + 关键字参数(dict)

                def person(name, age, **other):
                print 'name:', name, 'age:', age, 'other:', other

                person('andy', 25, location="shanghai", weight="70")

                kw = {'city': 'Beijing', 'job': 'Engineer'}
                person('Jack', 24, **kw)

        + 参数组合
            * 顺序必须是：必选参数、默认参数、可变参数和关键字参数。

            ````python
                def func(a, b, c=0, *args, **kw):
                    print 'a:', a, 'b:', b, 'c:', c, 'args:', args, 'kw:', kw 

                func(1, 3, 4, 5, 6, 23)
                func(1, 3, 4, 5, 6, ab=23)
                args = (12, 5, 6, 7)
                kw = {"key1": 90, 'x': 999}
                func(*args, **kw)
            ````
            * 对于任意函数，都可以通过类似func(*args, **kw)的形式调用它，无论它的参数是如何定义的。
    - 递归函数
        + 使用递归函数需要注意防止栈溢出。在计算机中，函数调用是通过栈（stack）这种数据结构实现的，每当进入一个函数调用，栈就会加一层栈帧，每当函数返回，栈就会减一层栈帧。由于栈的大小不是无限的，所以，递归调用的次数过多，会导致栈溢出。
        + **尾递归**
        + [尾调用](https://zh.wikipedia.org/wiki/%E5%B0%BE%E8%B0%83%E7%94%A8)
        + 在尾调用的情况中，电脑不需要记住尾调用的位置而可以从被调用的函数直接带着返回值返回调用函数的返回位置（相当于直接连续返回两次），尾调用消除即是在不改变当前调用栈（也不添加新的返回位置）的情况下跳到新函数的一种优化（完全不改变调用栈是不可能的，还是需要校正调用栈上形参与局部变量的信息。）

### 3 高级特性
    - 切片 (list, tuple, 字符串)
        + `L[:10:2]`    前10个数，每两个取一个
        + `L[::5]`      所有数，每5个取一个
    - 迭代 `for in` 
        + 任何 **可迭代对象** 都可以，如：list, tuple, dict, 字符串
        + 判断是否可迭代（通过collections模块的Iterable类型判断）：

                from collections import Iterable
                isinstance('abc', Iterable) # str是否可迭代
                isinstance(123, Iterable) # 整数是否可迭代 

        + dict的存储不是按照list的方式顺序排列，所以，迭代出的结果顺序很可能不一样。

    - 列表生成式
        + 运用列表生成式，可以快速生成list，可以通过一个list推导出另一个list，而代码却十分简洁。
        + `[x*x for x in range(1, 11)]`   =>  `[1x1, 2x2, 3x3, ..., 10x10]` (`[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]`)
        + `[x * x for x in range(1, 11) if x % 2 == 0]`  =>  `[4, 16, 36, 64, 100]`
        + `m + n for m in 'ABC' for n in 'XYZ']`  =>   `['AX', 'AY', 'AZ', 'BX', 'BY', 'BZ', 'CX', 'CY', 'CZ']`
        + `[d for d in os.listdir('.')]` 列出当前目录下文件和目录
    - 生成器Generator(保存的是算法)
        + 例子
        ```python
        g = (x*x for x in range(10))
        for n in g:
            print n 
        ````
        + 如果一个函数定义中包含yield关键字，那么这个函数就不再是一个普通函数，而是一个generator
        + 函数是顺序执行，遇到return语句或者最后一行函数语句就返回。而变成generator的函数，在每次调用next()的时候执行，遇到yield语句返回，再次执行时从上次返回的yield语句处继续执行


### 4 函数式编程
    - 高阶函数
        + 既然变量可以指向函数，函数的参数能接收变量，那么一个函数就可以接收另一个函数作为参数，这种函数就称之为高阶函数。
        + 编写高阶函数，就是让函数的参数能够接收别的函数。
    - map/reduce  （MapReduce: Simplified Data Processing on Large Clusters)[]
        + map()函数接收两个参数，一个是函数，一个是序列，map将传入的函数依次作用到序列的每个元素，并把结果作为新的list返回。
        + reduce把一个函数作用在一个序列[x1, x2, x3...]上，这个函数必须接收两个参数，reduce把结果继续和序列的下一个元素做累积计算，其效果就是：  `reduce(f, [x1, x2, x3, x4]) = f(f(f(x1, x2), x3), x4)`






