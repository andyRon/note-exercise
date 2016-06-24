Python学习
---------


### [廖雪峰-Python 2.7教程](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000)



-------

### 模块安装
一、方法1： 单文件模块
直接把文件拷贝到 $python_dir/Lib

二、方法2： 多文件模块，带setup.py

下载模块包，进行解压，进入模块文件夹，执行：
python setup.py install

三、 方法3：easy_install 方式

 先下载ez_setup.py,运行python ez_setup 进行easy_install工具的安装，之后就可以使用easy_install进行安装package了。
  easy_install  packageName
  easy_install  package.egg

四、 方法4：pip 方式 

