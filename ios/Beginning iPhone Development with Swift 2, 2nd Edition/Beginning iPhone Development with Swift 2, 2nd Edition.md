

### 3. 

- **Update Frames**  **Size to Fit Content**
- *correct runtime locations* **Resolve Auto Layout Issues**
- Simulator  Window>Scale
- Previewing Layout   **Preview Assistant**

### 4

- Implementing the Image View and Text Field
    + a tint color
    + Opaque  Alpha
    + Clip Subviews
    + **Add Missing Constraints**  便捷的加constraints
    +

### 5 Rotation and Adaptive Layout
- The Mechanics of Rotation
    + immersive apps
    + landscape orientation   portrait orientation
- 两种视图自动旋转的支持方式
    + Supported Orientations at the App Level
        - interface orientation   device orientation
- Designing an Interface Using Constraints
    + **trailing space**  尾部(一般右边)
    + **leading space**   头部(一般左边)
    +  `Editor ➤ Resolve Auto Layout Issues ➤ Add Missing Constraints`  *ALl Views* and *Selected Views* ?
    +  missing constraint  可以理解为必要的、不可缺少的限制
    +  orange lines   means not match(the current postion and at runtime) constraint导致
- Creating Adaptive Layouts
    + **Size Classes**
    + Create the iPhone Landscape Layout**
...

### 6 Multiview Applications 
- Common Types of Multiview Apps
    + **tab bar**   the bottom of the Phone or Music application
    + **toolbar**   main Safari view
    + **navigation bar**  the top of Music application(MY Music)
    + `UIKit`  `UITabBarController`  `UINavigationController`
- The Architecture of a Multiview Application 
    + **The Root Controller**
- Building View Switcher
    + ` ViewController.swift` > `Switching ViewController.swift`
    + 把view controller 的**Class**改为**Switching ViewController**
    + 添加`BlueViewController.swift`和`YellowViewController.swift`
    + Building a View with a Toolbar
    + Linking the Toolbar Button to the View Controller




