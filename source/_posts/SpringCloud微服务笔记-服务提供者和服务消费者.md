----------
title: SpringCloud微服务笔记- 服务提供者和服务消费者

date: 2018-1-17 19:45:30 

toc: true

tag: 

- 微服务
- 服务提供者
- 服务消费者

----------

#  服务消费者

## 概念

- 服务提供者：是指服务的被调用方（即：为其它服务提供服务的服务）
- 服务消费者：是指服务的调用方（即：依赖其它服务的服务）


<!--more-->

## 创建项目[服务提供者]

1. 创建项目结构

	- 服务提供者

![](https://i.imgur.com/PfdSmz2.png)

	- 服务消费者

![](https://i.imgur.com/yI69hlb.png)


2. 创建数据库
3. 添加数据
4. 开始编码


----------

# 服务发现与服务注册

## 服务注册

1. 如何解决硬编码的问题
2. 服务发现
3. 服务注册组件的功能
	1. 服务注册表
	2. 服务注册
	3. 健康检查
4. 服务发现的方式
	
- 客户端发现
	1. Eureka(SpringCloud支持最完整)
	2. ZK

- 服务器端发现
	
	1. Consul+nginx

5. 术语解释

6. 优秀文档：

[http://blog.daocloud.io/microservices-4/](http://blog.daocloud.io/microservices-4/)


