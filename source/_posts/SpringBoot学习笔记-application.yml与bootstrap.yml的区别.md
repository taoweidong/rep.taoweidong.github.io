----------
title: Spring Boot中application.yml与bootstrap.yml的区别

date: 2018-3-5 10:04:31

toc: true

tag: 

- SpringBoot
- application.yml
- bootstrap.yml

----------



Spring Boot中application.yml与bootstrap.yml的区别（转）

> 说明：其实yml和properties文件是一样的原理，主要是说明application和bootstrap的加载顺序。且一个项目上要么yml或者properties，二选一的存在。

Bootstrap.yml（bootstrap.properties）在application.yml（application.properties）之前加载，就像application.yml一样，但是用于应用程序上下文的引导阶段。它通常用于“使用Spring Cloud Config Server时，应在bootstrap.yml中指定spring.application.name和spring.cloud.config.server.git.uri”以及一些加密/解密信息。技术上，bootstrap.yml由父Spring ApplicationContext加载。父ApplicationContext被加载到使用application.yml的之前。

例如，当使用Spring Cloud时，通常从服务器加载“real”配置数据。为了获取URL（和其他连接配置，如密码等），您需要一个较早的或“bootstrap”配置。因此，您将配置服务器属性放在bootstrap.yml中，该属性用于加载实际配置数据（通常覆盖application.yml [如果存在]中的内容）。

当然，在一些情况上不用那么区分这两个文件，你只需要使用application文件即可，把全部选项都写在这里，效果基本是一致的，在不考虑上面的加载顺序覆盖的问题上。

<!--more-->

参考：

[http://www.jianshu.com/p/bc573e0b4f91](http://www.jianshu.com/p/bc573e0b4f91)（以上内容基本翻译自此篇文章）

[https://stackoverflow.com/questions/32997352/what-is-the-diference-between-putting-a-property-on-application-yml-or-bootstrap](https://stackoverflow.com/questions/32997352/what-is-the-diference-between-putting-a-property-on-application-yml-or-bootstrap)

[https://my.oschina.net/u/3523423/blog/1526026](https://my.oschina.net/u/3523423/blog/1526026)

[http://bbs.itmayiedu.com/article/1492421998131?m=0](http://bbs.itmayiedu.com/article/1492421998131?m=0)

[http://www.bijishequ.com/detail/517437?p=](http://www.bijishequ.com/detail/517437?p=)

[https://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-external-config.html](https://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-external-config.html)

[https://hoserdude.com/2014/06/19/spring-boot-configurationproperties-and-profile-management-using-yaml/](https://hoserdude.com/2014/06/19/spring-boot-configurationproperties-and-profile-management-using-yaml/)

[https://dzone.com/articles/using-yaml-java-application](https://dzone.com/articles/using-yaml-java-application)
