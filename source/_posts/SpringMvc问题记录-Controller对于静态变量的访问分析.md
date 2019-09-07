----------
title: SpringMvc问题记录-Controller对于静态变量的访问分析

date: 2019-9-7 12:05:19

toc: true

tag: 

- Java
- SpringMVC

----------

# 问题描述
在于朋友的讨论中分析到一种场景，即：Controller对于一个类中的静态变量进行访问时，如果第一个接口修改该静态变量的数据，另外一个接口获取该静态变量的数据，那么返回的结果是什么？

操作步骤是，先进行修改接口的访问，然后再进行获取接口的访问。

# 实际验证
##  创建一个SpringBoot项目，项目结构如下：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190625213857879.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)

## 创建Controller接口

```java
package com.taowd.controller;
import com.taowd.util.Constants;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Taoweidong
 */
@RestController
@RequestMapping("/")
public class HelloWorld {

    /**
     * @return
     */
    @PostMapping("/set")
    public String set() {
        //修改操作
        Constants.HELLO_WORLD = "修改之后的数据";
        return "已修改";
    }
    /**
     * @return
     */
    @PostMapping("/get")
    public String get() {
        //获取操作
        return Constants.HELLO_WORLD;
    }
}

```

## 创建静态变量类

```java
package com.taowd.util;
/**
 * @author Taoweidong
 */
public class Constants {
    /**
     * 静态常量.
     */
    public static String HELLO_WORLD = "Hello World";
}

```

## 测试过程
测试使用postman工具进行接口测试

### 第一次访问get接口查看原数据
http://127.0.0.1:8080/get
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190625214859404.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)
### 第二次访问set接口重新设置静态变量值
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190625215124672.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)
### 第三次访问get接口查看静态变量的值
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190625215335765.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)
# 结果分析
### static变量
参考：https://www.cnblogs.com/dolphin0520/p/3799052.html

static变量也称作静态变量，静态变量和非静态变量的区别是：静态变量被所有的对象所共享，在内存中只有一个副本，它当且仅当在类初次加载时会被初始化。而非静态变量是对象所拥有的，在创建对象的时候被初始化，存在多个副本，各个对象拥有的副本互不影响。

static成员变量的初始化顺序按照定义的顺序进行初始化。

**在Constants类中的HELLO_WORLD变量即被static修饰符修饰，属于静态变量，在内存中只有一个副本，当类初次加载时被初始化，后面系统的使用，都是修改查询这一个副本，因此修改接口被触发后HELLO_WORLD变量就被修改，然后调用get查询接口查询时，获取的就是修改后的数据。**

# 參考
https://www.cnblogs.com/dolphin0520/p/3799052.html
https://www.cnblogs.com/zxf330301/articles/6105127.html
https://www.cnblogs.com/wenhuang/p/9784419.html
