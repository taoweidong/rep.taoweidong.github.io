----------
title: ngrok反向代理工具

date: 2018-1-17 19:45:30 

toc: true

tag: 

- ngrok
- 反向代理工具

----------

# ngrok介绍

> ngrok 是一个反向代理，通过在公共的端点和本地运行的 Web 服务器之间建立一个安全的通道。ngrok 可捕获和分析所有通道上的流量，便于后期分析和重放

> 简单来说，就是通过ngrok建立一个隧道，你在外网也也可以访问自己的电脑，通常我们是自己的电脑访问外网，这就是所谓的反向代理。

<!--more-->

# 使用方法

首先注册并下载ngrok，得到一串授权码 

运行 ngrok -authtoken 你的授权码80，80是你本地Web服务的端口，而之后ngrok会记住你的授
权码，直接ngrok 80就OK了

官网： https://ngrok.com/

# 国内的版本

下载ngrok,我下在的上win64.zip 
下载地址：https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip

然后启动下载的ngrok客户端 

- 有以下一种启动方式

![](https://i.imgur.com/8mGvcOq.png)

- 启动ngrok并映射本机的8080端口

![](https://i.imgur.com/2hRhACV.png)


- 访问地址为上图中的生成URL地址

![](https://i.imgur.com/1zJrbsB.png)

- 查看当前端口访问情况

![](https://i.imgur.com/AnmBzA6.png)