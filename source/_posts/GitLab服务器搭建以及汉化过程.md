----------
title: GitLab服务器搭建以及汉化过程

date: 2020-2-22 21:14:28

toc: true

tag: 

- GitLab
- git
- 服务器

----------


# Gitlab简介

GitLab是利用Ruby on Rails一个开源的版本管理系统，实现一个自托管的Git项目仓库，可通过Web界面进行访问公开的或者私人项目。

与Github类似，GitLab能够浏览源代码，管理缺陷和注释。可以管理团队对仓库的访问，它非常易于浏览提交过的版本并提供一个文件历史库。团队成员可以利用内置的简单聊天程序(Wall)进行交流。

它还提供一个代码片段收集功能可以轻松实现代码复用，便于日后有需要的时候进行查找。

# Gitlab环境部署

ECS配置要求：**内存2G以上**


# 下载软件包

国内镜像地址：[https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el7/?C=M&O=D](https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el7/?C=M&O=D)

```shell
[root@taoweidong ~]# wget https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el7/gitlab-ce-12.6.7-ce.0.el7.x86_64.rpm
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200222211721753.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)
# 安装gitLab

```shell
[root@taoweidong ~]# rpm -i gitlab-ce-12.6.7-ce.0.el7.x86_64.rpm
```
![安装gitLab](https://img-blog.csdnimg.cn/20200222212150212.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)

## 修改gitlab配置文件指定服务器ip和自定义端口

```shell
[root@taoweidong ~]# vi /etc/gitlab/gitlab.rb
```
![
](https://img-blog.csdnimg.cn/2020022222365311.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)

<!-- more -->

## 重启gitLab

- 检查8080端口是否被占用，如果已经被使用需要修改unicon的端口
```shell
# 检查端口是否被占用
netstat  -anp  |grep   端口号
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200222223904482.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)
```shell
[root@taoweidong ~]# gitlab-ctl reconfigure       重新加载配置文件(耗时较长)
[root@taoweidong ~]# gitlab-ctl restart   重新启动
```



# 访问：[http://192.168.88.128:8888](http://192.168.88.128:8888/users/sign_in)
## 第一次访问时的页面
![第一次访问时的页面](https://img-blog.csdnimg.cn/2020022222401914.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)这里是让你修改登录密码的地方，输入新密码并且保存后会跳转到登录页面
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200222224219418.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)

## 登录页面

**账户为：root
密码为：上一个页面修改后的密码**
登录后会进入主页面，如下图
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200222224326828.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)

> 能进入这里，说明gitLab服务安装成功


## 中文配置
高版本的gitLab已经支持中文，可以在设置页面进行设置，进入主页面后
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200222224520701.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)![在这里插入图片描述](https://img-blog.csdnimg.cn/20200222224616864.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)选择中文简体，点击保存后刷新页面即可切换为中文。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200222224837862.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)
## 服务器生成SSH-Key密钥文件
```shell
[root@taoweidong ~]# ssh-keygen
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200223205140765.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)

## 查询SSH-key秘钥

![查询SSH-key秘钥](https://img-blog.csdnimg.cn/20200223205305169.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)



## 配置SSH-key秘钥

![配置SSH-key秘钥](https://img-blog.csdnimg.cn/20200223205613510.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)




# 使用教程

参考：https://www.cnblogs.com/niuben/p/10867877.html


# 参考

- gitlab访问错误Whoops问题处理：[https://blog.csdn.net/weixin_40816738/article/details/90551565](https://blog.csdn.net/weixin_40816738/article/details/90551565)

- 安装指南：[https://blog.csdn.net/qq_34129814/article/details/100043914](https://blog.csdn.net/qq_34129814/article/details/100043914)

- GitLab简介：[https://www.cnblogs.com/niuben/p/10867877.html](https://www.cnblogs.com/niuben/p/10867877.html)

  

