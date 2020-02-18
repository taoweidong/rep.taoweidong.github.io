----------
title: CentOS相关-CentOS 6.5安装Docker

date: 2018-1-31 20:19:13

toc: true

tag: 

- CentOS6.5
- Docker

----------

## Docker支持以下的CentOS版本

- CentOS 7 (64-bit)
- CentOS 6.5 (64-bit) 或更高的版本

## 前提条件

> 目前，CentOS 仅发行版本中的内核支持 Docker。

- Docker 运行在 CentOS 7 上，要求系统为64位、系统内核版本为 3.10 以上。
- Docker 运行在 CentOS-6.5 或更高的版本的 CentOS 上，要求系统为64位、系统内核版本为 2.6.32-431 或者更高版本。

<!--more-->

## 使用 yum 安装（CentOS 7下）

> Docker 要求 CentOS 系统的内核版本高于 3.10 ，查看本页面的前提条件来验证你的CentOS 版本是否支持 Docker 。

*通过 uname -r 命令查看你当前的内核版本*
![](https://i.imgur.com/39gxH2z.png) 

## 更新yum源

![](https://i.imgur.com/TbcgF8e.png)

## 安装docker

	yum -y install docker-io

![](https://i.imgur.com/siuOlVZ.png)
![](https://i.imgur.com/GarT7YX.png)

## 启动docker服务

     service docker start

![](https://i.imgur.com/XxSbbUB.png)

## 查看docker版本信息

	docker version

![](https://i.imgur.com/sap48ve.png)


## 测试docker

> 运行docker helloworld

	docker run hello-world

![](https://i.imgur.com/TqQ4QQL.png)

由于本地没有hello-world这个镜像，所以会下载一个hello-world的镜像，并在容器内运行。

## 查看当前已经下载的所有镜像

![](https://i.imgur.com/VMlCwL4.png)

## 相关命令

```shell
docker version 查看docker的版本号，包括客户端、服务端、依赖的Go等

docker info 查看系统(docker)层面信息，包括管理的images, containers数等

docker search <image> 在docker index中搜索image

docker pull <image> 从docker registry server 中下拉image

docker push <image|repository> 推送一个image或repository到registry

docker push <image|repository>:TAG 同上，指定tag

docker inspect <image|container> 查看image或container的底层信息

docker images TODO filter out the intermediate image layers (intermediate image layers 是什么)

docker images -a 列出所有的images

docker ps 默认显示正在运行中的container

docker ps -l 显示最后一次创建的container，包括未运行的

docker ps -a 显示所有的container，包括未运行的

docker logs <container> 查看container的日志，也就是执行命令的一些输出

docker rm <container...> 删除一个或多个container

docker rm docker ps -a -q 删除所有的container

docker ps -a -q | xargs docker rm 同上, 删除所有的container

docker rmi <image...> 删除一个或多个image

docker start/stop/restart <container> 开启/停止/重启container

docker start -i <container> 启动一个container并进入交互模式

docker attach <container> attach一个运行中的container

docker run <image> <command> 使用image创建container并执行相应命令，然后停止

docker run -i -t <image> /bin/bash 使用image创建container并进入交互模式, login shell是/bin/bash

docker run -i -t -p host_port:contain_port 将container的端口映射到宿主机的端口

docker commit <container> [repo:tag] 将一个container固化为一个新的image，后面的repo:tag可选

docker build <path> 寻找path路径下名为的Dockerfile的配置文件，使用此配置生成新的image

docker build -t repo[:tag] 同上，可以指定repo和可选的tag

docker build - < <dockerfile> 使用指定的dockerfile配置文件，docker以stdin方式获取内容，使用此配置生成新的image

docker port <container> <container port> 查看本地哪个端口映射到container的指定端口，其实用docker ps 也可以看到

docker 把宿主机的目录挂载到docker容器里

```

