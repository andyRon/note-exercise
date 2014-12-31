### 基础知识
* **swap space&=** 交换空间
* **page** 页面 	物理内存或交换空间
* `/proc/meminfo`
* **共享内存页面**	 多个进程可在同一块共用内存区域进行读取和写入操作。 
`ipcs -m`
* 系统开机自动启动的进程：  
`/etc/inittab`  
`/etc/init.d`	`/etc/rcX.d`  
* 硬件设备管理
  - 编译进内核的设备驱动代码
  - 可插入讷河的设备驱动模块
* **设备文件**
  - 字符型 每次只能处理一个字符的设备。如调制解调器和终端。
  - 块设备 每次能处理大块数据的设备。如硬盘。
  - 网络设备	采用数据包发送和接收数据的设备。如网卡，回环设备。
* 设备的 **主设备号** **次设备号**	  
		[root@localhost dev]# ls -al sda* ttyS*
		brw-rw----. 1 root disk    8,  0 Dec 12  2014 sda
		brw-rw----. 1 root disk    8,  1 Dec 12  2014 sda1
		brw-rw----. 1 root disk    8,  2 Dec 12  2014 sda2
		crw-rw----. 1 root dialout 4, 64 Dec 12  2014 ttyS0
		crw-rw----. 1 root dialout 4, 65 Dec 12  2014 ttyS1
		crw-rw----. 1 root dialout 4, 66 Dec 12  2014 ttyS2
		crw-rw----. 1 root dialout 4, 67 Dec 12  2014 ttyS3
		
> mac 的 /proc/meminfo ?

* linux内核采用虚拟文件系统（VFS）作为和每个文件系统交互的接口。当每个文件系统被挂载和是使用时，VFS将信息都缓存在内存中。
* GNU工具链
	- coreutils(core utilities)软件包
		+ 处理文件
		+ 操作文本
		+ 管理进程
	- shell 为用户提供了启动程序，管理文件系统上的文件以及管理运行在Linux系统上的进程的途径。  
	**命令行提示符**  
	**shell**  
* terminfo数据库 （和终端模拟器通信时使用的控制码）  
常见位置：`/usr/share/terminfo`,`/etc/terminfo`,`/lib/terminfo`  
`infocmp`  
`echo $TERM`	目前使用哪个终端		

### 基本bash shell 命令
* `ls -F` 区分目录和文件
* `ls -R` 列出包含的目录中的文件
* `ls -c` 按最后一次修改时间排序
* `touch` `cp`(-p 保持时间，-R 复制目录，-l 复制成硬链接，-s 创建软连接) `mv` `rm` `mkdir` `rmdir`
*  `stat` 查看文件信息
*  `cat -n` `cat -b`
