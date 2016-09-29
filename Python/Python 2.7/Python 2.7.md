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
        + map/reduce  （MapReduce: Simplified Data Processing on Large Clusters)[]
            * map()函数接收两个参数，一个是函数，一个是序列，map将传入的函数依次作用到序列的每个元素，并把结果作为新的list返回。
            * reduce把一个函数作用在一个序列[x1, x2, x3...]上，这个函数必须接收两个参数，reduce把结果继续和序列的下一个元素做累积计算，其效果就是：    
            `reduce(f, [x1, x2, x3, x4]) = f(f(f(x1, x2), x3), x4)`
        + filter  filter()函数接收两个参数，一个是函数，一个是序列,把传入的函数依次作用于每个元素，然后根据返回值是True还是False决定保留还是丢弃该元素。
        + sorted
            * 排序也是在程序中经常用到的算法。无论使用冒泡排序还是快速排序，排序的核心是比较两个元素的大小。如果是数字，我们可以直接比较，但如果是字符串或者两个dict呢？直接比较数学上的大小是没有意义的，因此，比较的过程必须通过函数抽象出来。通常规定，对于两个元素x和y，如果认为x < y，则返回-1，如果认为x == y，则返回0，如果认为x > y，则返回1，这样，排序算法就不用关心具体的比较过程，而是根据比较结果直接排序。
    - 返回函数
    - 匿名函数(lambda)
        + 只能有一个表达式，不用写return，返回值就是该表达式的结果
    - 装饰器**
        + 在代码运行期间动态增加功能的方式，称之为“装饰器”（Decorator）。
        + `__name__`
    - 偏函数（Partial function）
        + `functools.partial`的作用就是，把一个函数的某些参数给固定住（也就是设置默认值），返回一个新的函数，调用这个新函数会更简单。

### 5 模块
    - 一个.py文件就称之为一个模块（Module）
        + [内置函数](https://docs.python.org/2/library/functions.html)
        + 为了避免模块名冲突，Python又引入了按目录来组织模块的方法，称为**包（Package）**
        + 每一个包目录下面都必须有一个`__init__.py`的文件
    - **别名**

            try:
                import cStringIO as StringIO
            except ImportError: # 导入失败会捕获到ImportError
                import StringIO

            try:
                import json # python >= 2.6
            except ImportError:
                import simplejson as json # python <= 2.5

    - 作用域
    - 安装第三方模块
        + 在Python中，安装第三方模块，是通过setuptools这个工具完成的。Python有两个封装了setuptools的包管理工具：easy_install和pip。
            * mac中自带 `easy_install`, 
            * mac 安装 `pip`: `sudo easy_install pip`
            * 第三方库都会在Python官方 [网站](https://pypi.python.org/pypi) 上注册
            * 安装 `pillow`(代替`PIL`)：`sudo pip install pillow`
            * 使用 [github](https://github.com/python-pillow/Pillow) [中文文档](http://pillow-cn.readthedocs.io/zh_CN/latest/index.html)

                    from PIL import Image
                    im = Image.open("/Users/andyron/Downloads/bash.jpg")  #录取要是完整路径
                    im.size
                    im.mode
                    im.format 
                    im.show()       # 以临时文件打开

            * 其他系统 `sudo apt-get install python-pip` `sudo apt-get install python-pip`    
        + 模块搜索路径

                import sys
                sys.path
                sys.path.append()

    - 使用__future__
        + Python提供了__future__模块，把下一个新版本的特性导入到当前版本，于是我们就可以在当前版本中测试一些新版本的特性。

### 6 面向对象编程
    - 对比
        + 面向过程的程序设计把计算机程序视为一系列的命令集合，即一组函数的顺序执行。为了简化程序设计，面向过程把函数继续切分为子函数，即把大块函数通过切割成小块函数来降低系统的复杂度。

        + 面向对象的程序设计把计算机程序视为一组对象的集合，而每个对象都可以接收其他对象发过来的消息，并处理这些消息，计算机程序的执行就是一系列消息在各个对象之间传递。

    - 类和实例
        + `__init__`方法的第一个参数永远是self，表示创建的实例本身
        + 和普通的函数相比，在类中定义的函数只有一点不同，就是第一个参数永远是实例变量self，并且，调用时，不用传递该参数。
        + Python允许对实例变量绑定任何数据
    - 访问限制
        + 实例的变量名如果以`__`开头，就变成了一个私有变量（private），只有内部可以访问，外部不能访问
        + Python本身没有任何机制阻止你干坏事，一切全靠自觉。

    - 继承和多态

    - 获取对象信息
        + `type()` `types`
        + `isinstance()`
        + `dir()` 获得一个对象的所有属性和方法
            * 类似__xxx__的属性和方法在Python中都是有特殊用途的.如，`str`类型中有 `__len__`方法，就可以 `len('ABC')` 或 'ABC'.__len__(), 并且这里的 'ABC'必须是`str`
            * `getattr()` `setattr()` `hasattr()`
### 7 面向对象高级编程
    - 使用__slots__
        + 动态绑定
        + 定义class的时候，定义一个特殊的__slots__变量，来限制该class能添加的属性(仅对当前类起作用，对继承的子类是不起作用的)
    - 使用@property(限制属性)
        + 装饰器
        + getter setter
    - 多重继承
        + Mixin的目的就是给一个类增加多个功能，这样，在设计类的时候，我们优先考虑通过多重继承来组合多个Mixin的功能，而不是设计多层次的复杂的继承关系。
    - 定制类
        + `__str__` : `print`时调用
        + `__repr__` : 直接显示时调用
        + `__iter__` : 如果一个类想被用于for ... in循环，类似list或tuple那样，就必须实现一个__iter__()方法，该方法返回一个迭代对象，然后，Python的for循环就会不断调用该迭代对象的next()方法拿到循环的下一个值，直到遇到StopIteration错误时退出循环。
        + `__getitem__` : 直接作为list时调用
        + `__getattr__` : 当调用不存在的属性或方法是调用
        + `__call__`
        + [更多定制](https://docs.python.org/2/reference/datamodel.html#special-method-names)
    - 使用元类
        + `type()`
        + metaclass
### 8 错误、调试和测试
    - 错误 
        + `try...except...finally...`   可以跨越多层
        + [`BaseException`](https://docs.python.org/2/library/exceptions.html#exception-hierarchy)
        + 调用堆栈
        + 记录错误  `logging`模块
        + 抛出错误  `raise`
            * 只有在必要的时候才定义我们自己的错误类型。如果可以选择Python已有的内置的错误类型（比如ValueError，TypeError），尽量使用Python内置的错误类型。
            * raise语句如果不带参数，就会把当前错误原样抛出。
    - 调式 
        + 直接用`print`
        + 断言 `assert`      可以关闭断言 `python -O err.py`
        + `logging`
            * `debug` `info` `warning` `error` 级别由低到高，级别设置的越高低级别的信息就不会显示（如`logging.basicConfig(level=logging.INFO)`, 就不会显示debug信息）
            * 一条语句可以同时输出到不同的地方，比如console和文件。
        + pdb  调试器，让程序以单步方式运行
            * `python -m pdb err.py`
            * `l` 来查看代码
            * `n` 下一步
            * `p 变量名` 查看变量值
            * `q` 退出
        + pdb.set_trace() 
            * 只需要import pdb，然后，在可能出错的地方放一个pdb.set_trace()，就可以设置一个断点，运行到此处暂停并进入pdb调式环境
        + IDE   PyCharm
    - 单元测试
        + “测试驱动开发”（TDD：Test-Driven Development）
        + 单元测试是用来对一个模块、一个函数或者一个类来进行正确性检验的测试工作。


    - 文档测试


### 9 IO编程
>同步IO  CPU等着
>异步IO  CPU不等待      回调模式    轮询模式

    - 文件读写
        + open()
        + read()
        + readline()
        + readlines()
        + **file-like Object**: 像open()函数返回的这种有个read()方法的对象,也可以是内存的字节流，网络流，自定义流等等。
        + `StringIO`
        + 二进制文件 `f = open('test.jpg', 'rb')`
        + 字符编码 `codecs`模块
        + 写文件  write().当写文件时，操作系统往往不会立刻把数据写入磁盘，而是放到内存缓存起来，空闲的时候再慢慢写入。只有调用close()方法时，操作系统才保证把没有写入的数据全部写入磁盘
        + with  as 
    - 操作文件和目录
    


-------------
### linux等系统安装 pip
    - `wget https://bootstrap.pypa.io/get-pip.py`  下载 文件
    - `sudo python get-pip.py`
### 安装
    - `sudo pip install requests`
### 记录
    - Python格式化中如何使用%



