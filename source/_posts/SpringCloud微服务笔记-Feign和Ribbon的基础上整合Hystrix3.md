----------
title: SpringCloud微服务笔记-Feign和Ribbon的基础上整合Hystrix3

date: 2018-3-18 17:20:05 

toc: true

tag: 

- 微服务
- Feign
- Hystrix
- SpringCloud

----------

> 本项目记录在Feign和Ribbon的基础上整合Hystrix,此处使用的是

# Hystrix简介

Hystrix 能使你的系统在出现依赖服务失效的时候，通过隔离系统所依赖的服务，防止服务级联失败，同时提供失败回退机制，更优雅地应对失效，并使你的系统能更快地从异常中恢复。

注意：此工程中使用的Hystrix中的方法回退方式为在FeignClient类中使用fallbackFactory属性

注意2： **使用UserFeignClientFallbackFactory中捕获的异常时，注意判断是否为null**

<!--more-->

# Hystrix特性

## 断路器机制
断路器很好理解, 当Hystrix Command请求后端服务失败数量超过一定比例(默认50%), 断路器会切换到开路状态(Open). 这时所有请求会直接失败而不会发送到后端服务. 断路器保持在开路状态一段时间后(默认5秒), 自动切换到半开路状态(HALF-OPEN). 这时会判断下一次请求的返回情况, 如果请求成功, 断路器切回闭路状态(CLOSED), 否则重新切换到开路状态(OPEN). Hystrix的断路器就像我们家庭电路中的保险丝, 一旦后端服务不可用, 断路器会直接切断请求链, 避免发送大量无效请求影响系统吞吐量, 并且断路器有自我检测并恢复的能力.

## Fallback
Fallback相当于是降级操作. 对于查询操作, 我们可以实现一个fallback方法, 当请求后端服务出现异常的时候, 可以使用fallback方法返回的值. fallback方法的返回值一般是设置的默认值或者来自缓存.

## 资源隔离
在Hystrix中, 主要通过线程池来实现资源隔离. 通常在使用的时候我们会根据调用的远程服务划分出多个线程池. 例如调用产品服务的Command放入A线程池, 调用账户服务的Command放入B线程池. 这样做的主要优点是运行环境被隔离开了. 这样就算调用服务的代码存在bug或者由于其他原因导致自己所在线程池被耗尽时, 不会对系统的其他服务造成影响. 但是带来的代价就是维护多个线程池会对系统带来额外的性能开销. 如果是对性能有严格要求而且确信自己调用服务的客户端代码不会出问题的话, 可以使用Hystrix的信号模式(Semaphores)来隔离资源.

# 功能实现

1、添加依赖
   
	<dependency>
	<groupId>org.springframework.cloud</groupId>
	<artifactId>spring-cloud-starter-hystrix</artifactId>
	</dependency>

2、启动类添加注解

	@SpringBootApplication
	@EnableCircuitBreaker
	public class Application {
	public static void main(String[] args) {
	        new SpringApplicationBuilder(Application.class).web(true).run(args);
	    }
	}

3、对应接口上添加注解
在FeignClient注解中添加fallback属性，在服务熔断的时候返回fallback类中的内容。
	
    @FeignClient(value = "microservice-provider-user",fallback = UserFeignClientFallBack.class)
    public interface UserFeignClient {
    .....省略
    }
4、创建UserFeignClient对应的返回类UserFeignClientFallBack
   
注意：UserFeignClientFallBack类必须实现UserFeignClient接口中的方法，方法体内即发生故障之后返回的内容
	
	@Component
    public class UserFeignClientFallBack implements UserFeignClient {
        @Override
        public String sayHello() {
            return "这里是sayHello方法调用时返回的 FallBack方法";
        }
    
        @Override
        public User getUserInfo() {
    
            User user = new User();
            user.setId(90000);
            user.setName("李fallback");
            user.setAge(24);
    
            return user;
        }
    }

# 测试结果

- 启动Eureka注册中心：microservice-discovery-eureka
- 启动服务提供者：microservice-provider-user
- 启动服务消费者： microservice-consume-movie-feign-hystrix  其中包括Hystrix熔断机制的方法回退
- 访问microservice-consume-movie-feign-hystrix中的方法，正常
- 关闭服务提供者：microservice-provider-user
- 访问microservice-consume-movie-feign-hystrix中的方法，返回编写的回退方法内的内容

![](https://i.imgur.com/6Re7sz4.png)