----------
title: Docker学习笔记-Docker镜像常用命令

date: 2018-4-10 14:01:34

toc: true

tag: 

- Docker

----------

# image 文件

Docker镜像是一个只读模板，它包括创建Docker容器的说明。和系统安装光盘类似-使用系统光盘可以安装系统，使用Docker镜像可以运行Docker镜像中的程序。

**Docker 把应用程序及其依赖，打包在 image 文件里面。**只有通过这个文件，才能生成 Docker 容器。image 文件可以看作是容器的模板。Docker 根据 image 文件生成容器的实例。同一个 image 文件，可以生成多个同时运行的容器实例。

image 是二进制文件。实际开发中，一个 image 文件往往通过继承另一个 image 文件，加上一些个性化设置而生成。举例来说，你可以在 Ubuntu 的 image 基础上，往里面加入 Apache 服务器，形成你的 image。

```
# 列出本机的所有 image 文件。
$ docker image ls

# 删除 image 文件
$ docker image rm [imageName]
```

image 文件是通用的，一台机器的 image 文件拷贝到另一台机器，照样可以使用。一般来说，为了节省时间，我们应该尽量使用别人制作好的 image 文件，而不是自己制作。即使要定制，也应该基于别人的 image 文件进行加工，而不是从零开始制作。

为了方便共享，image 文件制作完成后，可以上传到网上的仓库。Docker 的官方仓库 [Docker Hub](https://hub.docker.com/) 是最重要、最常用的 image 仓库。此外，出售自己制作的 image 文件也是可以的。

<!-- more -->

# image相关命令

## 搜索镜像

```shell
[root@Taowd-PC docker]# docker search java
```

![](https://i.imgur.com/oZ8iLFf.png)

## 下载镜像

```shell
[root@Taowd-PC docker]# docker pull java
```

使用命令docker pull 命令即可从Docker Registry上下载镜像，执行下载命令后，docker会从docker Hub中的java仓库中下载最新版本的java镜像，若是镜像下载缓慢，可以配置镜像加速器，我配置的是阿里云提供的镜像加速地址。

![](https://i.imgur.com/yTK4JLI.png)

![](https://i.imgur.com/mdWrnSd.png)

## 列出镜像 

```
[root@Taowd-PC docker]# docker images

```

使用docker images命令列出已下载的镜像，如下图所示：

![](https://i.imgur.com/Aozlw01.png)

## 删除镜像

```
[root@Taowd-PC docker]# docker rmi -f hello-world
```

使用docker rmi命令删除指定镜像，-f参数表示强制删除(有可能在删除的时候该镜像正在被使用，增加-f即可强制删除)

![](https://i.imgur.com/x05EAi6.png)

删除所有镜像

```
[root@Taowd-PC docker]# docker rmi -f ${docker images}
```



# 参考文档



- [https://cloud.tencent.com/developer/article/1005172](https://cloud.tencent.com/developer/article/1005172)
- [https://www.zhihu.com/question/28300645](https://www.zhihu.com/question/28300645)
- [https://www.docker.com/](https://www.docker.com/)
- [http://www.docker.org.cn/book/docker/what-is-docker-16.html](http://www.docker.org.cn/book/docker/what-is-docker-16.html)
- http://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html