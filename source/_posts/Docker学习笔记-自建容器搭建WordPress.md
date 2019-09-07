----------
title: Docker学习笔记-自建容器搭建wordpress

date: 2018-4-12 13:01:47

toc: true

tag: 

- Docker

----------

## Dockerfile 文件简介

Docker 是一个容器工具，提供虚拟环境。很多人认为，它改变了我们对软件的认识。

站在 Docker 的角度，软件就是容器的组合：业务逻辑容器、数据库容器、储存容器、队列容器......Docker 使得软件可以拆分成若干个标准化容器，然后像搭积木一样组合起来。

![](http://www.ruanyifeng.com/blogimg/asset/2018/bg2018021306.png)

这正是微服务（microservices）的思想：软件把任务外包出去，让各种外部服务完成这些任务，软件本身只是底层服务的调度中心和组装层。
![](http://www.ruanyifeng.com/blogimg/asset/2018/bg2018021302.png)

微服务很适合用 Docker 容器实现，每个容器承载一个服务。一台计算机同时运行多个容器，从而就能很轻松地模拟出复杂的微服务架构。

![](http://www.ruanyifeng.com/blogimg/asset/2018/bg2018021303.png)

# 目的：

学习使用Docker搭建一个网站，开始运行

# 操作步骤

- 下载官方的php images


![52350998121](C:\Users\Taowd\AppData\Local\Temp\1523509981212.png)

上面的命令基于`php`的 image 文件新建一个容器，并且运行该容器。`php`的标签是`5.6-apache`，说明装的是 PHP 5.6，并且自带 Apache 服务器。该命令的三个参数含义如下。

> - `--rm`：停止运行后，自动删除容器文件。
> - `--name wordpress`：容器的名字叫做`wordpress`。
> - `--volume "$PWD/":/var/www/html`：将当前目录（`$PWD`）映射到容器的`/var/www/html`（Apache 对外访问的默认目录）。因此，当前目录的任何修改，都会反映到容器里面，进而被外部访问到。



## 参考文档



- [https://cloud.tencent.com/developer/article/1005172](https://cloud.tencent.com/developer/article/1005172)
- [https://www.zhihu.com/question/28300645](https://www.zhihu.com/question/28300645)
- [https://www.docker.com/](https://www.docker.com/)
- [http://www.docker.org.cn/book/docker/what-is-docker-16.html](http://www.docker.org.cn/book/docker/what-is-docker-16.html)
- http://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html