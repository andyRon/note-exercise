再次学习OC (http://blog.csdn.net/jiangwei0910410003/article/details/41657603)

1. 类的定义
    * OC中任何一个类都是继承NSObject,这个和Java中的Object是一个概念的，所以这里需要导入 #import <Foundation/Foundation.h> 
    * 在{}类定义类的属性，关于这里所说的属性和Java中的属性不是一个概念了，OC中只要定义在{}中的字段就是类的属性，而Java中是有getXXX/setXXX的方法，才叫属性。同时也得注意，OC中类中定义的属性名是以下划线:"_"开头，为什么要这样做，就是为了区分后面的局部变量与其重名了，当然我们在Java中一般是以m开头，或者其他方式，Java中没有那么强的规范，但是OC中还是强烈建议用这种方式的，还有一点要注意，在定义设置方法的时候，一般样式是setXXX,但是在定义取值的方法的时候直接是XXX,而不是getXXX了，这个也是和Java有区别的，至于为什么这么做，因为get开头的方法已经有其他用处了
    * "-",表示该方法是对象方法，"+",表示该方法是类方法
    * 实例化对象 `Person *person = [[Person alloc] init]; ` 
        * alloc方法是类方法，init是对象方法
        * alloc相当于给这个对象分配内存空间，init是调用这个类的构造方法，对属性和字段进行初始化操作
    * OC中的方法调用方式：
        * 对象方法：[对象变量  方法名 参数]
        * 类方法：[类名  方法名 参数] 
2. 类的初始化方法和点语法的使用
    * OC中的id类型，可以认为和C语言中的void*是相等的  

3. OC学习篇之---类的三大特性(封装，继承，多态)
    * 封装 
        - Java中有四种访问权限修饰符：public，default，protected，private，访问权限一次递减的
        - OC的属性有@public、@protected、@private、@package 其中默认的修饰符是@private
        - OC中的方法是没有修饰符的概念的，一般都是公开访问的，即public的怎么做到让OC中的一个方法不能被外界访问呢？  
            + 只需要在.m文件中实现这个方法，不要在头文件中进行定义，说白了就是：该方法有实现，没定义，这样外界在导入头文件的时候，是没有这个方法的，但是这个方法我们可以在自己的.m文件中进行使用。
    * 继承
    * 多态   **定义类型和实际类型，一般是基于接口的形式实现的**

4. @class关键字的作用以及#include和#import的区别
5. 类目的概念和使用
    * Java和OC是单继承的，不允许多继承
    * 类目的文件名的格式："需要添加类目的类名+类目的名称"
    * 如果在添加的类目中重新定义了类中的已有的方法，那么类目中的方法会被覆盖，和类的继承差不多，但是这里有一点需要注意，这里是不能使用super关键字去调用NSString的intValue方法的，所以intValue覆盖了NSString类中的intValue方法之后，NSString类中的intValue方法原先的功能就没有了，这个得注意一下。
    * 一个类是可以定义多个类目的。而且类目的作用可以沿袭到子类，就是父类的类目中的方法子类依然可以使用super关键字进行调用的。
    * `NSArray` 中的类目 

        ```
        @interface NSArray<ObjectType> (NSExtendedArray)

        @interface NSArray<ObjectType> (NSArrayCreation)
        ```

6. 协议的概念和用法
    - OC中的协议就是相当于Java中的接口(抽象类). 协议就是定义了一组方法，然后让其他类去实现.
    - 定义协议格式： 定义协议的关键字是@protocol,同时协议也是可以继承父协议的

    ```
    @protocol  协议名  <父协议>
    定义方法
    @required：这个表示这个方法是其他类必须实现的，也是默认的值
    @optional：这个表示这个方法对于其他类实现是可选的
    @end
    ```
    - 使用： 直接在继承类(NSObject)后面 <协议名>即可

    ```
    @interface Student : NSObject <WithProtocol>  
    ```

    - `#pragma mark - ruleProtocol`  标记后面的方法都是协议中的方法 方便浏览
    - `#warning` 

7. 代理模式 http://blog.csdn.net/jiangwei0910410003/article/details/41777627
