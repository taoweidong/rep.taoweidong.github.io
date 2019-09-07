----------
title: SpringCloud微服务笔记-服务发现组件Eureka

date: 2018-1-18 20:09:18

toc: true

tag: 

- 微服务
- Eureka
- 服务发现组件

----------

# Why Eureka?

1. Eureka来自生产环境

它提供了完整的Service Registry和Service Discovery实现

首先是提供了完整的实现，并且也经受住了Netflix自己的生产环境考验，相对使用起来会比较省心。

2. Spring Cloud对Eureka的支持最好

我们的项目本身就使用了Spring Cloud和Spring Boot，同时Spring Cloud还有一套非常完善的开源代码来整合Eureka，所以使用起来非常方便。

另外，Eureka还支持在我们应用自身的容器中启动，也就是说我们的应用启动完之后，既充当了Eureka的角色，同时也是服务的提供者。这样就极大地提高了服务的可用性。


# Eureka简介

Eureka是Netflix开发的服务发现框架，本身是一个基于REST的服务，主要用于定位运行在AWS域中的中间层服务，以达到负载均衡和中间层服务故障转移的目的。SpringCloud将它集成在自己的子项目spring-cloud-netflix中，实现SpringCloud的服务发现功能。

<!--more-->

# Eureka原理

![](https://i.imgur.com/QWmPo0c.png)

> 上图简要描述了Eureka的基本架构，由3个角色组成：

- Eureka Server：提供服务注册和发现
- Service Provider：服务提供方，将自身服务注册到Eureka，从而使服务消费方能够找到
- Service Consumer：服务消费方，从Eureka获取注册服务列表，从而能够消费服务。

![](https://i.imgur.com/olTwZbA.png)

> 上图更进一步的展示了3个角色之间的交互

- Service Provider会向Eureka Server做Register（服务注册）、Renew（服务续约）、Cancel（服务下线）等操作；
- Eureka Server之间会做注册服务的同步，从而保证状态一致；
- Service Consumer会向Eureka Server获取注册服务列表，并消费服务。



# 实现一个Eureka Server

# 实现一个Eureka Client