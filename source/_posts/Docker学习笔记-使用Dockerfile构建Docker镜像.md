----------
title: Docker学习笔记-使用Dockerfile构建Docker镜像

date: 2018-4-10 22:07:42

toc: true

tag: 

- Docker

----------

## Dockerfile 文件简介

学会使用 image 文件以后，接下来的问题就是，如何可以生成 image 文件？如果你要推广自己的软件，势必要自己制作 image 文件。

这就需要用到 Dockerfile 文件。它是一个文本文件，用来配置 image。Docker 根据 该文件生成二进制的 image 文件。

## 新建Dockerfile文件，并进行编辑

![](https://i.imgur.com/eVPVT6z.png)

![](https://i.imgur.com/Vn1M3hu.png)

<!-- more -->

## 在dockerfile所在路径执行构建命令构建镜像

`-t`参数用来指定 image 文件的名字，后面还可以用冒号指定标签。如果不指定，默认的标签就是`latest`。最后的那个点表示 Dockerfile 文件所在的路径，上例是当前路径，所以是一个点。

![](https://i.imgur.com/ljBQxYv.png)

## 使用自制的镜像启动一个docker容器

![](https://i.imgur.com/FzPRszy.png)

![](https://i.imgur.com/6lFxIx8.png)





## 参考文档



- [https://cloud.tencent.com/developer/article/1005172](https://cloud.tencent.com/developer/article/1005172)
- [https://www.zhihu.com/question/28300645](https://www.zhihu.com/question/28300645)
- [https://www.docker.com/](https://www.docker.com/)
- [http://www.docker.org.cn/book/docker/what-is-docker-16.html](http://www.docker.org.cn/book/docker/what-is-docker-16.html)
- http://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html