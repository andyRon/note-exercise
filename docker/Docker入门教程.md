[Docker入门教程](http://www.docker.org.cn/book/docker/what-is-docker-16.html)
--------------------

官方网站：https://docs.docker.com/linux/started/

Docker系统有两个程序：docker服务端和docker客户端。其中docker服务端是一个服务进程，管理着所有的容器。docker客户端则扮演着docker服务端的远程控制器，可以用来控制docker的服务端进程。大部分情况下，docker服务端和客户端运行在一台机器上。


### 搜索可用docker镜像

`docker search 镜像名字`

[docker hub](index.docker.io)

### 下载容器镜像

`docker pull learn/tutorial`

### 在docker容器中运行hello world!

`docker run learn/tutorial echo "hello word"`

### 在容器中安装新的程序

`docker run learn/tutorial apt-get install -y ping`
 
### 保存对容器的修改
当你对某一个容器做了修改之后（通过在容器中运行某一个命令），可以把对容器的修改保存下来，这样下次可以从保存后的最新状态运行该容器。docker中保存状态的过程称之为committing，它保存的新旧状态之间的区别，从而产生一个新的版本。

`docker ps -l`  

`docker commit 51c2 learn/ping`

![](https://ws3.sinaimg.cn/large/006tNc79gy1fl47fyr95zj30th02fq33.jpg)


`docker images`   查看镜像


### 运行新的镜像

`docker run learn/ping ping www.baidu.com`

### 检查运行中的镜像

使用`docker ps`命令可以查看所有正在运行中的容器列表，使用`docker inspect`命令我们可以查看更详细的关于某一个容器的信息。


```
$ docker images
REPOSITORY          TAG                 IMAGE ID         CREATED         SIZE
learn/ping          latest              87c3badf35fd     16 minutesago   140MB
learn/tutorial      latest              a7876479f1aa     4 years ago     128MB
$ docker inspect 87c
[
    {
        "Id": "sha256:87c3badf35fd44ecc92401cd1e947dbb2c40efed8dba4e68b85d4fa7f1e2103b",
        "RepoTags": [
            "learn/ping:latest"
        ],
        "RepoDigests": [],
        "Parent": "sha256:a7876479f1aae32c0716d7a85b5151af26f533fe48efa086010105cba02f5163",
        "Comment": "",
        "Created": "2017-11-02T16:23:13.129808827Z",
        "Container": "51c280fe98a588921f142cdd495d1d03fafc8b31641209446b83392033308d3b",
        "ContainerConfig": {
            "Hostname": "51c280fe98a5",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": true,
            "AttachStderr": true,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [],
            "Cmd": [
                "apt-get",
                "install",
                "-y",
                "ping"
            ],
            "Image": "learn/tutorial",
            "Volumes": {},
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "17.09.0-ce",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [],
            "Cmd": [
                "apt-get",
                "install",
                "-y",
                "ping"
            ],
            "Image": "",
            "Volumes": {},
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 140000996,
        "VirtualSize": 140000996,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/06127edba2bb2675ffd1935b7ec2da2ef247323b41ad882f342e9abca7c4540a/diff",
                "MergedDir": "/var/lib/docker/overlay2/5418a701a6284f2a7d93dc1525519b6f3df58563bc3c606202797a0d1530d65f/merged",
                "UpperDir": "/var/lib/docker/overlay2/5418a701a6284f2a7d93dc1525519b6f3df58563bc3c606202797a0d1530d65f/diff",
                "WorkDir": "/var/lib/docker/overlay2/5418a701a6284f2a7d93dc1525519b6f3df58563bc3c606202797a0d1530d65f/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:ee1ba0cc9b81862329c6aeab9cbc44adcc56b33905bee97515c24e918f3a58e1",
                "sha256:7fb1b3b957da5ffba43c3b123663dd04d3fa15d1fce2817e3c7f2a2a8c644f7b"
            ]
        },
        "Metadata": {
            "LastTagTime": "2017-11-02T16:23:13.134354509Z"
        }
    }
]
```

### 发布自己的镜像

` docker push learn/ping`



