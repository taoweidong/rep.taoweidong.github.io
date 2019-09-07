------

title: Mybatis学习笔记-使用注解的方式实现CRUD功能

date: 2018-5-26 10:21:20

toc: true

tag: 

- Mybatis

------





> 上一篇博客是研究了下使用xml配置的方式进行数据库的增删改查功能，这篇研究了一下使用注解的方式实现数据库的CRUD功能。

# 项目结构 

详细见[Mybatis学习笔记-第一个增删改查的程序](http://www.taowd.xin/article/22)


# 定义sql映射的接口

```Java
package com.taowd.mybatis.services;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.taowd.mybatis.entry.User;

public interface UserMapper {
	@Insert("insert into users(name, age) values(#{name}, #{age})")
	public int insertUser(User user);

	@Delete("delete from users where id=#{id}")
	public int deleteUserById(int id);

	@Update("update users set name=#{name},age=#{age} where id=#{id}")
	public int updateUser(User user);

	@Select("select * from users where id=#{id}")
	public User getUserById(int id);

	@Select("select * from users")
	public List<User> getAllUser();

}

```
# 在config中注册这个映射接口

```xml
	<mapper class="com.taowd.mybatis.services.UserMapper" />
```

# 测试接口功能
![这里写图片描述](http://img.blog.csdn.net/20171010194932240?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdGFvd2VpZG9uZzE=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)



