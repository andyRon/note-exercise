### linux常用网络指令
1. 网络参数设定命令
   - `/etc/sysconfig/network-scripts/`目录中各种配置脚本
   - `ifconfig`
   
			[root@localhost network-scripts]# ifconfig
			eno16777736: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
			        inet 192.168.30.160  netmask 255.255.255.0  broadcast 192.168.30.255
			        inet6 fe80::20c:29ff:fef0:632b  prefixlen 64  scopeid 0x20<link>
			        ether 00:0c:29:f0:63:2b  txqueuelen 1000  (Ethernet)
			        RX packets 27115  bytes 5969948 (5.6 MiB)
			        RX errors 0  dropped 0  overruns 0  frame 0
			        TX packets 3387  bytes 1719224 (1.6 MiB)
			        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
			
			lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
			        inet 127.0.0.1  netmask 255.0.0.0
			        inet6 ::1  prefixlen 128  scopeid 0x10<host>
			        loop  txqueuelen 0  (Local Loopback)
			        RX packets 80  bytes 5020 (4.9 KiB)
			        RX errors 0  dropped 0  overruns 0  frame 0
			        TX packets 80  bytes 5020 (4.9 KiB)
			        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
		
	  +  `eth0` 网卡代号 ，cetos7改成`eno16777736`,lo是loopback
	  +   MTU (Maximum Transmission Unit,最大传输单位)
	  +   txqueuelen：用来传输数据的缓冲区的存储长度
	  +   RX：网络有启动到目前的封包接收情况
	  +   TX：封包传送情况
	  +   collisions：封包碰撞情况，太多表示网络不好
  - `ifconfig eth0 192.168.100.100` 临时改变网卡ip，远程终端修改会掉线
  - `ifconfig eth0 192.168.100.100  netmask 255.255.255.128 mtu 8000` 同时设定不同网络接口
  - `ifconfig eth0 up | down`
  - `/etc/init.d/network restart` 以上手动设定的网络参数全部失效，会以`/etc/sysconfig/network-scripts/ifcfg-eno16777736`等的设定为标准
  - `ifup eth0`,`ifdown eth0` 这两个程序搜索/etc/sysconfig/network-scripts目录下ifcfg-*来启动与关闭。 当目前的网络参数与ifcfg-*不相符，就不能执行，也就是用ifconfig临时修改网络参数要已`ifconfig eth0 down`来关闭
  - 查看局域网中的ip `sudo yum install nmap` `nmap -sP 192.168.30.0/24`
  -  `route`   路由 ？？？
  -  `ip` 网络参数综合指令    
     + `ip link` 装置接口相关设定  （osi第二层）
     	 + `ip link show`
     	 + `ip -s link show eth0`
     	 + `ip link set eth0 up | down`
     	 + `ip link set eth0 mtu 1000`
     	 + `ip link set eno16777736 name andy` 修改网络卡名，需关闭
     + `ip address` 额外的ip相关设定 （osi第三层）
     	 + `ip address show` 
     	 + `ip address add`
     	 + `ip address del`
     + `ip route` 路由的相关设定
     	 + `ip route show`
     	 + `ip route add`
     	 + `ip route del`
   - 无线网络： `iwlist` `iwconfig`
   - `dhclient eno16777736` 手动设定网卡亿dhcp协议去尝试取得ip

2. 网络侦错与观察指令
	  