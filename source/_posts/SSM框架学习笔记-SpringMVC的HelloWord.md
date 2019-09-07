----------
title: SSM框架学习笔记-SpringMVC环境搭建以及HelloWord

date: 2018-5-13 11:13:18

toc: true

tag: 

- SSM
- SpringMVC

----------

# SpringMVC简介

- Spring为展现层提供基于MVC设计理念的Web框架，是目前最主流的MVC框架之一。
- Spring3.0之后已经超越Struts2成为最优秀的MVC框架。
- SpringMVC通过一套MVC注解就让pojo成为处理请求控制器，无需实现任何接口(Struts2需要实现ActionSupport接口)。
- SpringMVC支持Rest风格的URL请求。
- SpringMVC采用松耦合可插拔组件结构，比其他的MVC框架更具扩展性和灵活性。

<!-- More -->

# 环境搭建

- 创建JavaWeb工程
- 添加jar包依赖(Maven项目配置pom文件)
- 在Web.xml文件中配置SpringMVC核心处理器DispatchServlet并指定SpringMVC配置文件路径
- 创建SpringMVC配置文件并进行配置
- 编写请求控制器(Controller)
- 编写视图页面

## 创建JavaWeb工程

![](https://i.imgur.com/6C5WCw7.png)

## 添加Jar包

- commons-logging-1.1.3.jar 
- spring-aop-4.0.0.RELEASE.jar 
- spring-beans-4.0.0.RELEASE.jar 
- spring-context-4.0.0.RELEASE.jar 
- spring-core-4.0.0.RELEASE.jar 
- spring-expression-4.0.0.RELEASE.jar 
- spring-web-4.0.0.RELEASE.jar 
- spring-webmvc-4.0.0.RELEASE.jar

```xml
<dependencies>
		<!-- Spring strat -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-web</artifactId>
			<version>4.0.0.RELEASE</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-expression</artifactId>
			<version>4.0.0.RELEASE</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-core</artifactId>
			<version>4.0.0.RELEASE</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-aop</artifactId>
			<version>4.0.0.RELEASE</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context</artifactId>
			<version>4.0.0.RELEASE</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>4.0.0.RELEASE</version>
		</dependency>
		<!-- Spring end -->
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>3.8.1</version>
			<scope>test</scope>
		</dependency>
		<!-- common -->
		<dependency>
			<groupId>org.apache.commons</groupId>
			<artifactId>commons-lang3</artifactId>
			<version>3.3.2</version>
		</dependency>
		<dependency>
			<groupId>commons-io</groupId>
			<artifactId>commons-io</artifactId>
			<version>2.0.1</version>
		</dependency>
		<dependency>
			<groupId>commons-logging</groupId>
			<artifactId>commons-logging</artifactId>
			<version>1.1.3</version>
		</dependency>
		<dependency>
			<groupId>commons-fileupload</groupId>
			<artifactId>commons-fileupload</artifactId>
			<version>1.3.1</version>
		</dependency>
		<!-- servlet start -->
		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>javax.servlet-api</artifactId>
			<version>3.1.0</version>
			<scope>compile</scope>
		</dependency>
		<!-- servlet end -->

		<!-- log4j -->
		<dependency>
			<groupId>log4j</groupId>
			<artifactId>log4j</artifactId>
			<version>1.2.12</version>
		</dependency>
		<!-- fastjson -->
		<dependency>
			<groupId>com.alibaba</groupId>
			<artifactId>fastjson</artifactId>
			<version>1.2.3</version>
		</dependency>
	</dependencies>
```



## 在Web.xml文件中配置SpringMVC核心处理器DispatchServlet

```xml
<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >

<web-app>
	<!-- 注意：此处的display-name的值必须为项目名称 -->
	<display-name>SpringMVC-HelloWord</display-name>

	<!-- 配置 SpringMVC的核心处理器DispatcherServlet -->
	<servlet>
		<servlet-name>springDispatcherServlet</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<!-- 配置 DispatcherServlet 的一个初始化参数: 配置 SpringMVC 配置文件的位置和名称 -->
		<!-- 实际上也可以不通过 contextConfigLocation 来配置 SpringMVC 的配置文件, 而使用默认的. 默认的配置文件为: 
			/WEB-INF/<servlet-name>-servlet.xml -->
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<param-value>classpath:springMVC.xml</param-value>
		</init-param>
		<load-on-startup>1</load-on-startup>
	</servlet>

	<servlet-mapping>
		<servlet-name>springDispatcherServlet</servlet-name>
		<url-pattern>/</url-pattern>
	</servlet-mapping>

	<welcome-file-list>
		<welcome-file>index.jsp</welcome-file>
	</welcome-file-list>

</web-app>

```

## 创建SpringMVC配置文件并进行配置

```
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.0.xsd
		http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc-4.0.xsd">

	<!-- 配置自定扫描的包 -->
	<context:component-scan base-package="com.taowd.controller"></context:component-scan>

	<!-- 配置视图解析器: 如何把 handler 方法返回值解析为实际的物理视图 -->
	<bean
		class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<property name="prefix" value="/WEB-INF/views/"></property>
		<property name="suffix" value=".jsp"></property>
	</bean>
	<mvc:annotation-driven />
</beans>

```

## 编写请求控制器(Controller)

```java
package com.taowd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

	@RequestMapping("/hello")
	public String hello() {
		System.out.println("hello springMVC------>");
		return "success";
	}

}
```

## 编写视图页面

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SpringMVC视图页面</title>
</head>
<body>
	<h3 align="center">Success Page</h3>
</body>
</html>
```

## 测试结果

![](https://i.imgur.com/yBi5lQb.png)

