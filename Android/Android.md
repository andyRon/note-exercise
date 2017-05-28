[Android](https://developer.android.com/index.html)
---------------
### Android 7.0 Nougat 新功能

### 开发 - 培训
- Getting Started
    + Building Your First App
        * Create 
            - **Minimum Required SDK**  为支持尽可能多的设备，您应将其设置成可让您的应用提供核心功能集的最低可用版本。 如果应用的任何功能只能在更新版本的 Android上运行，并且不属于核心功能集的关键功能，则可仅当在支持该功能的版本上运行时启用该功能
            - 项目文件
                + app > java > com.example.myfirstapp > MainActivity.java  完成新项目向导后，该文件将显示在 Android Studio 中。 它包含您之前创建的 Activity 的类定义。当您构建并运行应用时，Activity 会启动，并加载显示“Hello world!”的布局文件。
                + app > res > layout > activity_main.xml  此 XML 文件定义您的 Activity 的布局。它包含带有文本“Hello world!”的 TextView 元素。
                + app > manifests > AndroidManifest.xml  清单文件描述应用的基本特性并定义其每个组件。随着课程学习的深入和为应用添加组件的增多，您会反复用到这个文件。
                + Gradle Scripts > build.gradle  Android Studio 使用 Gradle 来编译和构建您的应用。您的项目的每个模块都有相应的 build.gradle 文件，整个项目也有相应的 build.gradle 文件。 通常您只关心模块（在本例中，为 app 或称应用模块）的 build.gradle 文件。
        * 运行您的应用
            - 实体设备
            - 模拟器
                +  Android Virtual Device (AVD)
        * 构建简单的用户界面 
            - `View`  `ViewGroup`  
            - `LinearLayout`  ` android:layout_width`  `android:layout_height`  ` android:orientation`
            - `EditText`    
            ...
        * 启动另一个 Activity
    + Supporting Different Devices
