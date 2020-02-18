----------
title: Docker学习笔记-Docker基础知识

date: 2018-4-9 20:21:57

toc: true

tag: 

- Docker

----------

# Docker简介

是一个开源的应用容器引擎，可以轻松的为任何应用创建一个轻量级的、可移植的、自给自足的容器。利用Linux的LXC、AUFS、Go语言、cgroup实现了资源的独立，可以很轻松的实现文件、资源、网络等隔离，其最终的目标是实现类似PaaS平台的应用隔离。

----------
# docker值得关注的特性
1. 文件系统隔离：每个进程容器运行在一个完全独立的根文件系统里。
2. 资源隔离：系统资源，像CPU和内存等可以分配到不同的容器中，使用cgroup。
3. 网络隔离：每个进程容器运行在自己的网络空间，虚拟接口和IP地址。
4. 日志记录：Docker将会收集和记录每个进程容器的标准流（stdout/stderr/stdin），用于实时检索或批量检索。
5. 变更管理：容器文件系统的变更可以提交到新的映像中，并可重复使用以创建更多的容器。无需使用模板或手动配置。
6. 交互式shell：Docker可以分配一个虚拟终端并关联到任何容器的标准输入上，例如运行一个一次***互shell。

# Docker通常用于如下场景
- web应用的自动化打包和发布；
- 自动化测试和持续集成、发布；
- 在服务型环境中部署和调整数据库或其他的后台应用；
- 从头编译或者扩展现有的OpenShift或Cloud Foundry平台来搭建自己的PaaS环境。

<!--more-->

# Docker环境的安装

## 准备学习环境

1. 安装虚拟机：VMwareworkstation_full_12.1.0.2487.1453173744

2. 安装Linux操作系统：CentOS-7-x86_64-DVD-1708.iso

3. 系统环境检查：

 ```shell
   uname -a
 ```
![环境检查](https://img-blog.csdnimg.cn/20200218165324394.png)

4. 检查系统硬件：

```shell
top
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/2020021816543185.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)

## docker安装

- 官网安装手册：https://docs.docker.com/install/linux/docker-ce/centos/#docker-ee-customers

- Docker 软件包和依赖包已经包含在默认的 CentOS-Extras 软件源里，安装命令如下：

 ```shell
  [root@Taowd-PC docker]# yum -y install docker
 ```
![](https://imgconvert.csdnimg.cn/aHR0cDovL3d3dy5ydW5vb2IuY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDE2LzA1L2RvY2tlcjA5LnBuZw?x-oss-process=image/format,png)

## 启动 Docker 后台服务

```shell
[root@runoob ~]# service docker start
```

[外链图片转存失败,源站可能有防盗链机制,建议将图片保存下来直接上传(img-rVNcMgur-1582015869451)(https://i.imgur.com/nOah2AT.png)]

## 查看docker版本信息

```shell
[root@Taowd-PC ~]# docker version
```

[外链图片转存失败,源站可能有防盗链机制,建议将图片保存下来直接上传(img-noFJ7o9j-1582015869452)(https://i.imgur.com/RtFd9f0.png)]

## 测试运行docker的 hello-world

```shell
[root@Taowd-PC ~]# docker run hello-world
```

[外链图片转存失败,源站可能有防盗链机制,建议将图片保存下来直接上传(img-4kClIB30-1582015869452)(https://i.imgur.com/t9A0BzX.png)]

由于本地没有hello-world这个镜像，所以会下载一个hello-world的镜像，并在容器内运行。

## 镜像加速

鉴于国内网络问题，后续拉取 Docker 镜像十分缓慢，我们可以需要配置加速器来解决，我使用的是网易的镜像地址：http://hub-mirror.c.163.com。

新版的 Docker 使用 /etc/docker/daemon.json（Linux） 或者 %programdata%\docker\config\daemon.json（Windows） 来配置 Daemon。

请在该配置文件中加入（没有该文件的话，请先建一个）：

```shell
{
  "registry-mirrors": ["http://hub-mirror.c.163.com"]
}
```

# 参考
- [https://www.runoob.com/docker/docker-tutorial.html](https://www.runoob.com/docker/docker-tutorial.html)
- [https://www.docker.com/](https://www.docker.com/)
- [Docker中文社区](http://www.docker.org.cn/)
