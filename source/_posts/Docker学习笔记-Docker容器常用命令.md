----------
title: Docker学习笔记-Docker容器常用命令

date: 2018-4-10 13:55:29

toc: true

tag: 

- Docker

----------

# 容器文件

容器是镜像的可运行实例。一个镜像可以多次运行生成多个容器。两者的关系就像类和对象的关系。可以通过Docker API或者CLI命令来启停、移动、删除容器。

**image 文件生成的容器实例，本身也是一个文件，称为容器文件。**也就是说，一旦容器生成，就会同时存在两个文件： image 文件和容器文件。而且关闭容器并不会删除容器文件，只是容器停止运行而已。

```
# 列出本机正在运行的容器
$ docker container ls

# 列出本机所有容器，包括终止运行的容器
$ docker container ls --all
```
![](https://i.imgur.com/pZZPW0N.png)

终止运行的容器文件，依然会占据硬盘空间，可以使用[`docker container rm`](https://docs.docker.com/engine/reference/commandline/container_rm/)命令删除。

![](https://i.imgur.com/cl4fMBt.png)

<!-- more -->

# 容器常用命令

## 新建并启动容器

使用docker run命令即可新建并启动一个容器

常用选项：

- -d选项：表示后台启动
- -P选项：随机端口映射
- -p选项：指定端口映射，有以下四种格式。
  - ip:hostPort:containerPort
  - ip::containerPort
  - hostPort:containerPort
  - containerPort
- --network 选项：指定网络模式，该选项有以下可选参数：
  - --network=bridge:默认选项，表示连接到默认的网桥
  - --network=host:容器使用的宿主机的网络
  - --network=container:NAME_or_ID: 告诉Docker让新建的容器使用已有容器的网络配置
  - --network=none:不配置该容器的网络，用户可自定义网络配置

```
[root@Taowd-PC ~]# docker run -d -p 99:80 c5c4e8fa2cf7
```

两个参数的含义：

- -d # 后台启动
- -p 宿主机端口：容器端口 # 开放的容器端口到宿主机端口

![](https://i.imgur.com/Worzh17.png)

![](https://i.imgur.com/BzaroGq.png)

## 列出容器

使用docekr ps命令即可列出运行中的容器

```shell
[root@Taowd-PC ~]# docker ps
```

![](https://i.imgur.com/1KEzuWE.png)



## 停止容器

使用docker stop命令，即可停止容器

```shell
[root@Taowd-PC ~]# docker stop 31833a8c1628
```

![](https://i.imgur.com/HHoncQC.png)

强行停止容器

```
[root@Taowd-PC ~]# docker kill 6b62afa7c0e1
```

![](https://i.imgur.com/pkC0ABL.png)

## 启动已停止的容器

使用docker start 命令来启动已经停止的容器

![](https://i.imgur.com/2eqwAFR.png)



## 重启容器

使用docker start命令来重启容器，该命令实际上先执行docker stop命令，然后执行docker start命令

## 进入容器中



## 删除容器

使用docker rm命令即可删除指定容器。

- 删除指定容器:docker rm xxxxxxxxxx

- 删除正在运行的容器：docker rm -f xxxxxxx  -f参数强制删除的意思

- 删除所有容器：docker rm -f ${docker ps -a -q}

  ​

# 参考文档


- [https://cloud.tencent.com/developer/article/1005172](https://cloud.tencent.com/developer/article/1005172)
- [https://www.zhihu.com/question/28300645](https://www.zhihu.com/question/28300645)
- [https://www.docker.com/](https://www.docker.com/)
- [http://www.docker.org.cn/book/docker/what-is-docker-16.html](http://www.docker.org.cn/book/docker/what-is-docker-16.html)
- http://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html