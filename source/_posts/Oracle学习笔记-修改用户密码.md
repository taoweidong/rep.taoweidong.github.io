----------
title: Oracle学习笔记-修改用户密码

date: 2018-4-27 10:11:07

toc: true

tag: 

- Oracle

----------

# 登录用户

![](https://i.imgur.com/OeaKDx3.png)

# 查看用户列表

```sql
select username from dba_users
```

![](https://i.imgur.com/mbcvJp8.png)

# 修改密码

```sql
alter user 用户名 identified by 新密码；
以system 为例，密码修改为 123456. 可输入
alter user tellerdb identified by tellerdb;
```

![](https://i.imgur.com/kIy3pmG.png)

# 参考文档

- [https://www.cnblogs.com/xujiating/p/6337511.html](https://cloud.tencent.com/developer/article/1005172)

  ​