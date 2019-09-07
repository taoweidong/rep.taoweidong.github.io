----------
title: SpringCloud微服务笔记-Hystrix的基础上整合Hystrix Dashboard

date: 2018-3-22 08:32:34

toc: true

tag: 

- 微服务
- Hystrix
- Dashboard

----------

> 本项目记录在Hystrix的基础上整合Hystrix Dashboard

# Hystrix简介

Hystrix Dashboard是Hystrix的仪表盘组件，主要用来实时监控Hystrix的各项指标信息，通过界面反馈的信息可以快速发现系统中存在的问题。

注意： 
- Hystrix的主要优点之一是它收集关于每个HystrixCommand的一套指标。Hystrix仪表板以有效的方式显示每个断路器的运行状况。

<!--more-->

# Dashboard使用时注意事项：
## Dashboard服务是个独立的结点，不需要配置eureka信息，只需要依赖以下jar包

	<dependency>  
		<groupId>org.springframework.cloud</groupId>  
		<artifactId>spring-cloud-starter-hystrix</artifactId>  
	</dependency>  
	<dependency>  
		<groupId>org.springframework.cloud</groupId>  
		<artifactId>spring-cloud-starter-hystrix-dashboard</artifactId>  
	</dependency>  
	<dependency>  
		<groupId>org.springframework.boot</groupId>  
		<artifactId>spring-boot-starter-actuator</artifactId>  
	</dependency>  

## Dashboard主程序也很简单，就是个标准的Spring boot应用，多了个@EnableHystrixDashboard注解

	@SpringBootApplication  
	@EnableHystrixDashboard  
	public class HystrixDashboardApplication {  
		  
		public static void main(String[] args) {  
			SpringApplication.run(HystrixDashboardApplication.class, args);  
		}  
	}  

# 测试结果

- 启动Eureka注册中心：microservice-discovery-eureka
- 启动服务提供者：microservice-provider-user
- 启动服务消费者： microservice-consume-movie-feign-hystrix  其中包括Hystrix熔断机制的方法回退
注意：此项目必须要确保被监控的服务打开了Actuator（依赖spring-boot-starter-actuator），
启动程序开启了断路器（@EnableCircuitBreaker注解）。
- 启动Hystrix DashBoard监控项目： microservice-hystrix-dashboard  
注意：此项目无需注册到Eureka中
- 访问注册中心： http://127.0.0.1:8761/  检查服务是否启动
- 访问服务消费者： http://127.0.0.1:9103/say2
- 访问监控面板： http://127.0.0.1:9090/hystrix
   填写相应参数:http://127.0.0.1:9103/hystrix.stream

![](https://i.imgur.com/EmyEpOP.png)

![](https://i.imgur.com/IkQefMc.png)