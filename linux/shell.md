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
### 更多bash shell 命令
1. 监测程序  
  + `ps`
     * `ps -ef` 查看所有进程的完整形式
     * `ps -l`	更多信息
     * `ps -H`  简单的树状形式	
  + 实时监测进程
     - linux系统管理的要点在于*如何定义系统的高负载*
     - `top`
  + 结束进程
  	 - xnix系统通过向运行的进程发送*进程信号*来已特定方式结束进程
  	 - `kill -l` 可以查看linux上的进程信号，默认是15-TERM-尽可能终止，1-HUP-挂起，2-INT-中断等
  	 - `kill -s HUP 3940` kill只能识别进程号，通过ps或top命令查看进程是否停止
  	 - `killall http*` 可通过进程名，或者通配符。**当用root登陆时，注意**
2. 监测磁盘空间
  + 挂载存储媒体
     - `mount` 提供四种信息：媒体的设备文件名，挂载点，文件系统类型，访问状态。如： `dev/sda1 on /boot type xfs (rw,relatime,seclabel,attr2,inode64,noquota)`
     - `mount -t vfat /dev/sdb1 /media/disk` 把设备/dev/sdb1以vfat文件系统挂载到/media/disk上
     - `mount -t iso9660 -o loop test.iso /mnt` 把test.iso文件挂载到/mnt上，`-o loop`代表挂载一个文件
     - `umount /mnt` 或 `umount test.iso` 卸载文件test.iso
  - `df`
  - `du -s 目录名` 查看目录的文件总大小
3. 处理数据文件
  - 排序数据
  	  + `sort tmp.txt` 以文件每行的的字符排序显示
  	  +  `sort -n tmp.txt` 把数字识别成字符而不是字符
  	  +  `sort -t ':' -k 3 -n /etc/passwd` 对/etc/passwd的每行以：分隔，再议分隔后的第三个参数排序显示
  	  +  `sort -sh | sort -nr` r是降序的意思
  - 搜索数据
     + `grep RPC /etc/passwd` 匹配/etc/passwd中 含有RPC的行
     + `grep -v RPC /etc/passwd` 反向匹配
     + `grep -n RPC /etc/passwd` 显示行号
     + `grep -c RPC /etc/passwd` 显示多少行匹配
     + `grep -e t -e f /etc/passwd` 匹配含有字符t或者f的行。类似的正则 `grep [tf] /etc/passwd`
     + grep的两个衍生版本 `egrep` `fgrep`
  - 压缩数据
     + bzip2工具 .bz2
         * `bzip2`
         * `bzcat`
         * `bunzip2`
         * `bzip2recover`
     + gzip 工具 .gz
         * `gzip`
         * `gzcat`
         * `gunzip`
     + zip工具 .zip
     	 * `zip`
     	 * `zipcloak`
     	 * `zipnote`
     	 * `zipsplit`
     	 * `unzip`
     + compress .Z 
  - `tar`

### linux环境变量
1. 环境变量
	+ 全局环境变量 `printenv`
	+ `set` 查看全局环境变量和局部变量（不同shell中自定义的）
	+ 全局变量是在设定该全局环境变量的进程创建的所有子进程中都是可见的。
	+ `export` 导出局部变量变成全局的
	+ `unset`  删除环境变量
2. 定位系统环境变量  	  
