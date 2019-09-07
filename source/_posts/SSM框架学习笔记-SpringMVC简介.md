----------
title: SSM框架学习笔记-SpringMVC简介

date: 2018-5-13 10:49:48

toc: true

tag: 

- SSM
- SpringMVC

----------

# 简介

- Spring为展现层提供基于MVC设计理念的Web框架，是目前最主流的MVC框架之一。
- Spring3.0之后已经超越Struts2成为最优秀的MVC框架。
- SpringMVC通过一套MVC注解就让pojo成为处理请求控制器，无需实现任何接口(Struts2需要实现ActionSupport接口)。
- SpringMVC支持Rest风格的URL请求。
- SpringMVC采用松耦合可插拔组件结构，比其他的MVC框架更具扩展性和灵活性。

<!-- More -->

# Spring MVC的优点

- 易于通view框架无缝集成，采用IOC便于测试  
- 典型的纯MVC构架，Struts是不完全基于MVC框架的  

- 与tapestry是纯正的Servlet系统，（这也是相对于Struts的优势）

# SpringMVC的工作流程

![](https://i.imgur.com/syQgZF9.png)

1. 用户发送请求至前端控制器DispatcherServlet
2. DispatcherServlet收到请求调用HandlerMapping处理器映射器。
3. 处理器映射器根据请求url找到具体的处理器，生成处理器对象及处理器拦截器(如果有则生成)一并返回给DispatcherServlet。
4. DispatcherServlet通过HandlerAdapter处理器适配器调用处理器
5. 执行处理器(Controller，也叫后端控制器)。
6. Controller执行完成返回ModelAndView
7. HandlerAdapter将controller执行结果ModelAndView返回给DispatcherServlet
8. DispatcherServlet将ModelAndView传给ViewReslover视图解析器
9. ViewReslover解析后返回具体View
10. DispatcherServlet对View进行渲染视图（即将模型数据填充至视图中）。
11. DispatcherServlet响应用户