

### 3.

- **Update Frames**  **Size to Fit Content**
- *correct runtime locations* **Resolve Auto Layout Issues**
- Simulator  Window\>Scale
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
	+ Create the iPhone Landscape Layout\*\*
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
	+ `ViewController.swift` \> `Switching ViewController.swift`
	+ 把view controller 的**Class**改为**Switching ViewController**
	+ 添加`BlueViewController.swift`和`YellowViewController.swift`
	+ Building a View with a Toolbar
	+ Linking the Toolbar Button to the View Controller
	+ Writing the Root View Controller
		* **Lazy loading**
	+ Implementing the Content Views
		1. 从Object Library 拖出 **View Controller**. 在*Identity Inspector*中修改class为*BlueViewController*,并填写*Storyboard ID*为**Blue**(与代码中对应).  
			*storyboard中的箭头是指默认scene，当然这个箭头是可以移动的*   
		2. 在*Attributes Inspector*中修改*background*为蓝色(随意).
		3. 添加button在正中央  Press Me ，添加constraints,Touch Up Inside  blueButtonPressed
		4. 改变button的 **Text Color**
		5.  重复
	+ Animating the Transition

### 7 Tab Bars and Pickers

- The Pickers Application
	1. Date picker
	2. Single-component picker
	3. Multicomponent picker
	4. Picker with dependent components
	5. Custom picker with images
- Delegates and Data Sources
	+ date picker 不能只是从对象库中拖出，还要有代理和数据源
- Creating the Pickers Application 
	1. create Pickers
	2. 在Pickers文件夹中创建五个新view控制器  
		DatePickerViewController  
		SingleComponentPickerViewController  DoubleComponentPickerViewController   DependentComponentPickerViewController  CustomPickerViewController
	3. Creating the Tab Bar Controller
		+ 修改viewController的基类为`UITabBarController` 
		+ 删除storyboard原本的view controller，添加**Tab Bar Controller**
		+ 选择roo controller： **Tab Bar Controller** 勾上 **Is Initial View Controller** ；class 改为 ViewController
		+ 添加图片
		+ 修改child view controllers 的 tab bar item 的 title和Image
		+ adding three more view controllers;  
			并关联：Control-drag from the tab bar controller to your new view controller(注意是从tab bar controller向新的托)  view controllers from the **Relationship Segue**
		分别修改title和image
		+ 链接五个scene到对应的viewController
- Implementing the Date Picker

- Implementing the Single-Component Picker

- Implementing a Multicomponent Picker

- Implementing Dependent Components 
	+ 添加数据源和代理
	+ 添加一些属性
	+ build the content view  与之前的类似  
		dependentPicker  onButtonPressed  Auto Layout constraints
	+ statedictionary.plist

- Creating a Simple Game with a Custom Picker 
	+ 消除**User Interaction Enabled**这个选项使用户不能控制picker

### 8 Introduction to Table Views

- Tabel View Basics
	+ `UITableView`, `UITableViewCell`, `UITableViewDelegate`, `UITableViewDataSource`   
	+ 一个`UITableViewCell`中可以放许多数据    
	+ Grouped and Plain Tables
	+ Implementing a Simple Table
		* create new project 
		* drag a Table View to View window
		* add Constraints
		* makes controller class both the data source and delegate
		* writing the controller
		* adding the image
		* using table view  cell styles
			- `UITableViewCellStyle`
			- `Image`  `Text label` `Detail text label`
		* Setting the Indent Level (设置缩进风格)
		* Handling row selection （操作row的选择）
		* Changing the Font Size and Row Height
	+ Customizing Table View Cells （改造Table View Cells）
		- 三个方法
			* 加载一个子UITableViewCell
			* 载入一个 nib 文件
			* 载入一个 storyboard 
		- Adding Subviews to the Table View Cell
			* 创建新项目Table Cells
			* main.storyboard  添加 `Table View`
			* `dataSource` `delegate` 到 `View Controller`
			* constraints
		- Creating a UITableViewCell Subclass
			* Adding New Cells 
				+ 创建新文件 `Cocoa Touch Class`, 
				+ 在 NameAndColorCell.swift 中添加 两个属性和接口
						class NameAndColorCell: UITableViewCell {
						var name: String = ""
						var color: String = ""
						var nameLabel: UILabel!
						var colorLabel: UILabel!
				+ init
			* Implementing the Controller's Code ??
		- Loading a UITableViewCell from a Nib

### 9 Navigation Controllers and Table Views
- Navigation Controller Basics  
    > the child view controllers of a `UINavigationController are organized in a stack` 
    
	+ Stacky Goodness  
        **last in, first out.** 
	+ A Stack of Controllers
	+ Fonts: A Simple Font Browser
		* Meet the Subcontrollers
			- The Font List Controller  
			- The Font Sizes View Controller
			- The Font Info View Controller
		* The Fonts Application’s Skeleton
			- Setting up the Navigation Controller  
				`UINavigationController`:管理 view controllers 的 stack

				+ 选择 Main.storyboard
				+ 删除 basic view controller ，使storyboard为空
				+ 拖动 `UINavigation Controller` 到编辑区（实际得到两个：UINavigation Controller, Root View Controller）
				+ 选中左边的`UINavigation Controller`, 打开**the Attributes Inspector** 勾选 **Is Initial View Controller**, 让应用启动时调用这个控制器
				+ 修改 `Root View Controller` 的 title 为 `Fonts`.
				也要修改`Navigation Item`的 Title为`Fonts`?
			- Keeping Track of Favorites
				+ 建立新文件 "FavoritesList.swift"
	+ Creating the Root View Controller
	+ Initial Storyboard Setup
	+ First Subcontroller: The Font List View
		* Storyboarding the Font List
		    - 添加一个新的 `Table View Controller` 到 `Main.storyboard`的编辑区
            - 选择这个新的table view controller,通过身份检查器设置**class**为**FontListViewController**
            - 选择新的table view controller下的`Table View Cell`, 修改**Style**为*Subtitle*, **Identifier**为*FontName*, **Accessory**为*Detail Disclosure*

            - Control-dragging 两个cell到 `FontListViewController`
            - 
        * Making the Root View Controller Prepare for Segues
    + Creating the Font Sizes View Controller
        * Storyboarding the Font Sizes View Controller
            - Control-drag `FontListViewController`中的cell到 `FontListViewController`, 弹出菜单选择 **Selection Segue** 的 **show**
        * Making the Font List View Controller Prepare for Segues
    + Creating the Font Info View Controller
    
        * Storyboarding the Font Info View Controller
            - 添加 `View Controller` **class** 为 `FontInfoViewController`
            - 添加 3个`label`, 1个`swithc`, 1个`slider`
            - 修改上面的`label`的 **Lines** 为 0;修改另外两个`label`为 `right-align`;修改`slider`的**Minimum**为1, **Maximum**为200
            - 选中`FontInfoViewController`，打开连接检查器。
            - 关联 `Outlets`  
                拖动`fontSampleLabel`到上面的`label`  
                拖动`fontSizeLabel`到下面右边`label`  
                拖动`favoriteSwitch`  
                拖动`fontSizeSlider`
            - 关联 `Actions`  
                拖动`slideFontSize` 弹出菜单选中**Value Changed**  
                拖动`toggleFavorite` 弹出菜单选中**Value Changed** 
            - 创建过渡或"转场"(segue) 
                Control-drag `Font List View Controller`里的table cell 到 `FontSizesViewController`, 弹出菜单选择 **Accessory Action** 的 **show**  
                修改`Font List View Controller`到`Font Sizes View Controller`的segue的**Identifier**为**f**   
                修改`Font List View Controller`到`Font Info View Controller`的segue的**Identifier**为**ShowFontInfo** 
        * Setting Up Constraints
            - 给上面的label增加3 Constraints
        
        * Adapting the Font List View Controller for Multiple Segues
        * My Favorite Fonts
    ?? 运行报错 the Font Info View Controller 应该是这个问题
    + Table View Niceties
        * Implementing Swipe-to-Delete
        * Implementing Drag-to-Reorder

### 10 Collection View and Stack View 
    
- Creating the DialogViewer Project 
    + 建立单页项目 **DialogViewer**
    + 修改 `ViewController` 的父类为 `UICollectionViewController`
    + 选中`Main.storyboard`, 删除 ` View Controller `, 添加 `Collection View Controller `
    + 修改`Collection View Controller `的 **Class** 为 **ViewController** 
    + 勾选** Is Initial View Controller **
- Defining Custom Cells 
    
- Configuring the View Controller 

- Providing Contetnt Cells

- Making the Layout Flow

- Providing Header Views 

- Working with UIStackView 


### 11 Using Split Views and Popovers


### 12 Applicatoin Settings and User Defaults
    

        
                
            

