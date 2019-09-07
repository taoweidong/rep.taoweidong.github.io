----------
title: CentOS相关-Nginx使用记录

date: 2018-6-13 22:21:58

toc: true

tag: 

- CentOS
- Nginx

----------

# Nginx简介

​	Nginx是一个高性能的HTTP和反向代理服务器，也是一个IMAP/POP3/SMTP代理服务器。

​        Nginx是一款轻量级的Web服务器/反向代理服务器以及电子邮件代理服务器，并在一个BSD-like协议下发行。由俄罗斯的程序设计师lgor  Sysoev所开发，供俄国大型的入口网站及搜索引擎Rambler使用。其特点是占有内存少，并发能力强，事实上nginx的并发能力确实在同类型的网页服务器中表现较好。

​	Nginx相较于Apache\lighttpd具有占有内存少，稳定性高等优势，并且依靠并发能力强，丰富的模块库以及友好灵活的配置而闻名。在Linux操作系统下，nginx使用epoll事件模型,得益于此，nginx在Linux操作系统下效率相当高。同时Nginx在OpenBSD或FreeBSD操作系统上采用类似于Epoll的高效事件模型kqueue。

# 代理服务器 

一般是指局域网内部的机器通过代理服务器发送请求到互联网上的服务器，代理服务器一般作用在客户端。 

<!-- More -->

# 反向代理 

​	客户端（用户A）向反向代理的命名空间（name-space）中的内容发送普通请求，接着反向代理将判断向何处（原始服务器）转交请求，并将获得的内容返回给客户端。而客户端始终任务它访问的事原始服务器B而不是服务器Z。由于防火墙作用，只允许服务器Z进出，防火墙和反向代理共同作用保护了院子资源服务器B。 

![img](https://img-blog.csdn.net/20150630214513300?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbGl1dGVuZ3RlbmcxMzA=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center) 

用途：将防火墙后面的服务器提供给Internet用户访问。反向代理还可以为后端的多台服务器提供负载平衡或为后端较慢的服务器提供缓冲服务。 

# 正向代理 

​	正向代理是一个位于客户端A和原始服务器（服务器B）之间的服务器（代理服务器Z），为了从原始服务器取得内容，用户A向代理服务器Z发送一个请求并指定目标（服务器B），然后代理服务器Z向服务器B转交请求并将获得的内容返回给客户端。客户端必须要进行一些特别的设置才能使用正向代理。 

![img](https://img-blog.csdn.net/20150630214532017?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbGl1dGVuZ3RlbmcxMzA=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center) 

用途：在防火墙内的局域网客户端提供访问Internet的途径。还可以使用缓冲特性减少网络使用率。 

# Nginx VS Apache 

相同点：

- 都是HTTP服务器软件
- 功能上都采用模块化结构设计
- 都支持通用的语言接口，如PHP、Perl、Python等
- 支持正向、反向代理、虚拟主机、URL重写、压缩传输、SSL加密传输

 

不同点：

- Apache处理速度很慢，占用很多内存资源
- 功能上，Apache所有模块支持动静态编译，Nginx模块都是静态编译的
- 对Fcgi的支持：Apache支持的很不好，Nginx支持非常好
- 处理连接方式：Nginx支持epoll,Apache不支持
- 空间使用上：Nginx安装包仅几百K

# Nginx优势 

- 作为Web服务器，Nginx处理静态文件、索引文件，自动索引的效率非常高

- 作为代理服务器，Nginx可以实现无缓存的反向代理加速，提高网站运行速度

- 作为负载均衡服务器，Nginx既可以在内部直接支持Rails和PHP，也可以支持HTTP代理服务器对外进行服务，同时还支持简单的容错和利用算法进行负载均衡

- 在性能方面，Nginx是专门为性能优化而开发的，实现上非常注重效率。它采用内核Poll模型，可以支持更多的并发连接，最大可以支持对5万个并发连接数的响应，而且只占用很低的内存资源

- 在稳定性方面，Nginx采取了分阶段资源分配技术，使得CPU与内存的占用率非常低。Nginx官方表示，Nginx保持1万个没有活动的连接，而这些连接只占用2.5MB内存，因此，类似DOS这样的攻击对Nginx来说基本上是没有任何作用的

- 在高可用性方面，Nginx支持热部署，启动速度特别迅速，因此可以在不间断服务的情况下，对软件版本或者配置进行升级，即使运行数月也无需重新启动，几乎可以做到7x24小时不间断地运行

​	Nginx具有很高的稳定性；支持热部署；代码质量非常高，代码很规范，手法成熟，模块扩展也很容易；采用了一些os提供的最新特性如对sendfile(Linux2.2+),accept-filter（FreeBSD4.1+）,TCP_DEFER_ACCEPT(Linux 2.4+)的支持，从而大大提高了性能。 

# 实践记录

## 目的：

> 为了通过www.taoweidong.com域名访问在阿里云服务器上的9000端口搭建的个人博客

## 过程

安装nginx之后进行配置，使用nginx的代理功能

![](https://i.imgur.com/DaKCbmF.png)

原理分析：

这个nginx用来代理本地的9000端口   nginx监听80端口 当客户使用浏览器http://www.taoweidong.com访问时会被80端口捕捉到，然后nginx会去访问>本地的9000端口，返回个人博客网页信息。

## 结果

![](https://i.imgur.com/4HH9B4G.png)