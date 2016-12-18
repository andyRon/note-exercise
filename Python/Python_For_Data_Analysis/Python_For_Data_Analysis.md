
### 2 引言
```
path = "ch02/usagov_bitly_data2012-03-16-1331923249.txt"
open(path).readline()
import json
records = [json.loads(line) for line in open(path)]   # 列表推导式

%hist -f ipython-hist.py  # 把ipython中的历史命令操作导入到文件中

```

sys.getsizeof(obj)  # 计算变量大小

pandas.pivot_table(data, values=None, index=None, columns=None, aggfunc='mean', fill_value=None, margins=False, dropna=True, margins_name='All')

pandas.pivot_tabled的参数名有变化

http://pandas.pydata.org/pandas-docs/stable/api.html 

### 3 IPthon 
执行-探索(execute explore)

1. IPython基础
```
In [4]: from numpy.random import randn

In [5]: data = {i: randn() for i in range(7)}
In [8]: data
Out[8]:
{0: -0.20903168975023634,
 1: 1.5955624584684658,
 2: -0.33680000709143043,
 3: -1.574354342147286,
 4: -0.7422870315889739,
 5: 0.7043391065474919,
 6: 2.0973350198881224}


 from numpy.random import randn
 data = {i: randn() for i in range(7)}
 data
{0: -0.39815164566414896, 1: 0.5139570416647582, 2: 0.2404397444022375, 3: 1.715522816173272, 4: -1.6803101909139944, 5: -1.3720839242024556, 6: 0.11749903228803951}


```
- 优点
    + TAB 
    + 执行一般shell命令

2. tab键提示
    - 匹配变量（对象、函数等），自己定义和已定义的都可以，关键字，内置函数
    - 对象后的句点显示方法和属性，框，不能左右键选择
    - 默认不显示下划线开头的方法和属性，输入_后再按tab就会显示（主要是避免显示太多东西）
    - 自动完成文件路径，在字符串中也是可以
3. 对象内省 (object introspection)
    - `?` 这个功能对于初学者太好用了，对python中任何东西不清怎么使用时只用在后面加一个`?`就可以获得一些简单的介绍和使用方法，不需要再去查文档，很方便
    ```
    sys?
    sys.path?
    In [309]: dict?
    Docstring:
    dict() -> new empty dictionary
    dict(mapping) -> new dictionary initialized from a mapping object's
        (key, value) pairs
    dict(iterable) -> new dictionary initialized as if via:
        d = {}
        for k, v in iterable:
            d[k] = v
    dict(**kwargs) -> new dictionary initialized with the name=value pairs
        in the keyword argument list.  For example:  dict(one=1, two=2)
    Type:      type
    ```
    - 函数或方法的`docstring`
    - `??` 显示函数的源代码（如果可能）
    - `np.*load*?` 通配符（*）与？一起用
4. `%run ipython_script_test.py` 在IPython环境中运行Python文件 
    - `%run argv.py 1 "argv2"`
    - `%run -i argv.py`  脚本（argv.py）能够使用之前IPython中的定义的变量
    - **Ctrl-C**  KeyboradInterrupt  中断正在执行的代码
5. 执行剪贴板中的代码

    ```
x = 5
y = 7
if x >= 5:
    x +=1 
    y = 8
    ```

    - %paste 
    - $cpaste **Ctrl-C**终止
6. IPython与编辑器和IDE之间的交互
7. 键盘快捷键
8. 异常和跟踪
    - `%xmode`
9. 魔术命令 (以%为前缀)
    - 魔术命令可以看做是IPython中的命令行程序，它们也有“命令行选项”，可通过`?`查看
    - `%timeit`  检测python语句执行时间
    ```
    a = np.random.randn(100, 100)
    %timeit np.dot(a, a)
    ```
    - `%reset` 删除interactive命名空间中的全部变量/名称 
    - `%automagic`
    - `%quickref`
    - `%magic`
    - `%degug`
    - `%hist`
    - `%pdb`
    - `%paste`
    - `%cpaste`
    - `%page OBJECT`
10. 基于Qt的富GUI控制台
11. matplotlib集成与pylab模式
12. 使用命令历史
13. 与操作系统交互
14. 软件开发工具
15. IPthon HTML Notebook
16. 





In [46]: tz_counts[:10].plot(kind="barh", rot=0)
/Users/andyron/anaconda/lib/python2.7/site-packages/matplotlib/font_manager.py:273: UserWarning: Matplotlib is building the font cache using fc-list. This may take a moment.
  warnings.warn('Matplotlib is building the font cache using fc-list. This may take a moment.')
Out[46]: <matplotlib.axes._subplots.AxesSubplot at 0x113a80a50>

### 3 IPython



### 附录 Python语言精要
- IPython  `%run hello.py`

- 只想知道某个对象是否有某些方法或行为
    + 如是否可迭代  
        
        ``` 
        def isiterable(obj):
            try: 
                iter(obj)
                return True
            except: TypeError:
                return False