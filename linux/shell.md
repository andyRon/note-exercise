### 基础知识
* **swap space&=** 交换空间
* **page** 页面 	物理内存或交换空间
* `/proc/meminfo`
* **共享内存页面**	`ipcs -m`
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
