----------
title: SpringCloud微服务笔记-SpringCloud学习

date: 2018-01-16 19:28:25
 
toc: true

tag: 

- SpringCloud


----------

# SpringCloud是什么

## 官网地址

[http://projects.spring.io/spring-cloud/](http://projects.spring.io/spring-cloud/ "SpringCloud")

## 是否与云计算有关？

不是

## Spring Boot

Spring Cloud是基于SpringBoot的快速构建分布式系统的工具集(全家桶，整合了各种工具便于开发)

# SpringCloud的版本

![版本|center](https://i.imgur.com/Z3WhXi9.png)

# SpringCloud的特点

- 约定优于配置
- 开箱即用，快速启动
- 适用于各种环境
- 轻量级的组件
	1. 服务发现--->Eureka 
- 组件的支持很丰富，功能很齐全
	1. 配置中心
	2. 注册中心
	3. 智能路由
- 选型中立
	1. Eureka
	2. Zookeeper
	3. Consul

<!--more-->

# 需要的技术储备

- Java
- 构建工具
	1. Maven
	2. Gradle:将Maven项目转为Gradle项目，在项目路径下执行命令[gradle init --type pom]   
- Spring Boot

# 使用的软件版本

> 原则：使用最新的版本进行讲解


1. JDK1.8
2. Maven 3.3.9
3. IDE Spring Tool Suite 3.8.2
4. SpringBoot 1.4.1
5. SpringCloud Camden SR1
 

