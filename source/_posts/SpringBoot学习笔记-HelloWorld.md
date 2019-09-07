----------
title: SpringBoot学习项目-HelloWorld 

date: 2018-3-23 18:11:25

toc: true

tag: 

- SpringBoot

----------

> SpringBoot第一个项目 HelloWorld 

- 它是Spring的升级版，Spring容器能做到的事情，它都能做到，而且更简便，从配置形式上来说，SpringBoot完全抛弃了繁琐的XML文件配置方式，而是替代性地用注解方式来实现，虽然本质来说，是差不多的（类似包扫描，注解扫描，类加载之类。
- SpringBoot集成的插件更多，从而使用很多服务，都只是引入一个依赖，几个注解和Java类就可以用了，具体的参考相关手册。
- 在Web应用开发这一块，之前的应用一般来说是打包成war包，再发布到相关服务器容器下（例如Tomcat），虽然SpringBoot也可以这么做，但在SpringBoot下更常见的形式是将SpringBoot应用打包成可执行jar包文件。之所以这么做，源于你可以直接将SpringBoot应用看成是一个Java Application，其Web应用可以没有webapp目录（更不用说web.xml了），它推荐使用html页面，并将其作为静态资源使用。

# SpringBoot特点(为什么用它)

- 独立运行的Spring项目
- 内嵌Servlet容器
- 提供starter简化Maven配置
- 自动配置Spring 
- 准生产的应用监控
- 无代码生成和xml配置

<!--more-->

# SpringBoot的缺点

- 引入许多自己不需要的jar包，导致项目臃肿


# 前提条件

- Java基础
- 了解Maven
- 了解SpringMVC,Spring框架的使用
- Mybatis,Hibernate等的使用
- 熟悉STS,Eclipse,Idea等开发工具的使用


# 学习软件

- apache-maven-3.5.0（Maven版本）
- nexus-2.14.8-01-bundle(Maven私库)
- jdk1.8（jdk版本）
- IntelliJ IDEA 2017.3.2 x64（开发工具）
- Lomback（Idea插件 代码助手 简化代码）
- GitHub（代码仓库）


# 学习思路

> 使用Maven进行项目管理，创建顶级的父工程管理项目jar包版本等信息，使用目前最流行的Java开发工具Idea工具进行开发；再父工程下创建相应的子项目进行学习，每个学习点创建一个工程，完全分离，这样便于后期查漏补缺。


# 学习计划

- SpringBoot-HelloWorld：创建项目结构，发布GitHub仓库，创建第一个HelloWorld程序，并封装返回JSON对象的功能
- SpringBoot-thymeleaf: 学习SpringBoot整合Thymleaf技术
- SpringBoot-Exception: 学习SpringBoot异常处理功能
- SpringBoot-Mybatis: 学习SpringBoot整合MyBatis
- SpringBoot-Redis :学习SpringBoot整合Redis功能
- SpringBoot-task: 学习SpringBoot整合定时任务功能
- SpringBoot-AsyncTask: 学习SpringBoot整合异步任务功能
- SpringBoot-Interceptor: 学习SpringBoot整合拦截器
- SpringBoot-StudentManager: 完成SpringBoot的一个小项目


# 本节要点
- 使用Maven创建工程结构

![](https://i.imgur.com/owoA5OC.png)

- 编写控制器，启动访问

![](https://i.imgur.com/hDku22Y.png)

- 访问：[http://127.0.0.1:8090/getUser](http://127.0.0.1:8090/getUser)

![](https://i.imgur.com/Bojo9RN.png)