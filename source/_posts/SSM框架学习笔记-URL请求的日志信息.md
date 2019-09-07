----------
title: SSM框架一次URL请求的日志信息

date: 2018-6-14 12:52:04

toc: true

tag: 

- SSM

----------

# 记录一次SSM框架URL请求的日志信息

```
[org.springframework.web.servlet.DispatcherServlet]-[DEBUG] DispatcherServlet with name 'taowd-manager' processing GET request for [/item/536563]
[org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping]-[DEBUG] Looking up handler method for path /item/536563
[org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping]-[DEBUG] Returning handler method [public com.taowd.pojo.TbItem com.taowd.controller.ItemController.getItemById(java.lang.Long)]
[org.springframework.beans.factory.support.DefaultListableBeanFactory]-[DEBUG] Returning cached instance of singleton bean 'itemController'
[org.springframework.web.servlet.DispatcherServlet]-[DEBUG] Last-Modified value for [/item/536563] is: -1
[org.mybatis.spring.SqlSessionUtils]-[DEBUG] Creating a new SqlSession
[org.mybatis.spring.SqlSessionUtils]-[DEBUG] Registering transaction synchronization for SqlSession [org.apache.ibatis.session.defaults.DefaultSqlSession@1bae45b1]
[org.springframework.jdbc.datasource.DataSourceUtils]-[DEBUG] Fetching JDBC Connection from DataSource
[org.springframework.jdbc.datasource.DataSourceUtils]-[DEBUG] Registering transaction synchronization for JDBC Connection
[org.mybatis.spring.transaction.SpringManagedTransaction]-[DEBUG] JDBC Connection [com.mysql.jdbc.JDBC4Connection@3d12312e] will be managed by Spring
[com.taowd.dao.TbItemMapper.selectByExample]-[DEBUG] ==>  Preparing: select id, title, sell_point, price, num, barcode, image, cid, status, created, updated from tb_item WHERE ( id = ? ) 
[com.taowd.dao.TbItemMapper.selectByExample]-[DEBUG] ==> Parameters: 536563(Long)
[com.taowd.dao.TbItemMapper.selectByExample]-[DEBUG] <==      Total: 1
[org.mybatis.spring.SqlSessionUtils]-[DEBUG] Releasing transactional SqlSession [org.apache.ibatis.session.defaults.DefaultSqlSession@1bae45b1]
[org.mybatis.spring.SqlSessionUtils]-[DEBUG] Transaction synchronization deregistering SqlSession [org.apache.ibatis.session.defaults.DefaultSqlSession@1bae45b1]
[org.mybatis.spring.SqlSessionUtils]-[DEBUG] Transaction synchronization closing SqlSession [org.apache.ibatis.session.defaults.DefaultSqlSession@1bae45b1]
[org.springframework.jdbc.datasource.DataSourceUtils]-[DEBUG] Returning JDBC Connection to DataSource
[org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdviceChain]-[DEBUG] Invoking ResponseBodyAdvice chain for body=com.taowd.pojo.TbItem@54ce5b5e
[org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdviceChain]-[DEBUG] After ResponseBodyAdvice chain body=com.taowd.pojo.TbItem@54ce5b5e
[org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor]-[DEBUG] Written [com.taowd.pojo.TbItem@54ce5b5e] as "application/json;charset=UTF-8" using [org.springframework.http.converter.json.MappingJackson2HttpMessageConverter@950df6b]
[org.springframework.web.servlet.DispatcherServlet]-[DEBUG] Null ModelAndView returned to DispatcherServlet with name 'taowd-manager': assuming HandlerAdapter completed request handling
[org.springframework.web.servlet.DispatcherServlet]-[DEBUG] Successfully completed request
```

<!-- More -->