----------
title: CentOS相关-CentOS安装Java环境

date: 2018-1-19 23:33:09

toc: true

tag: 

- CentOS
- java

----------


# 安装jdk

JDK 是开发Java程序必须安装的软件，我们查看一下 yum 源里面的 JDK：

	yum list java*

选择适合本机的JDK，并安装：

	yum install java-1.7.0-openjdk* -y

安装完成后，查看是否安装成功：

	java -version

# 安装tomcat

Tomcat 是一个应用服务器，是开发和调试 jsp 程序的首选，可以利用它来响应 HTML 页面的访问请求。进入本地文件夹：

	cd /usr/local

到官网找到 Tomcat 的下载链接，并下载到服务器中, 这里提供了一个快速下载 Tomcat 的地址：

	wget https://mc.qcloudimg.com/static/archive/fa66329388f85c08e8d6c12ceb8b2ca3/apache-tomcat-7.0.77.tar.gz

<!--more-->

解压这个文件夹：

	tar -zxf apache-tomcat-7.0.77.tar.gz

重命名这个文件：

	mv apache-tomcat-7.0.77 /usr/local/tomcat7

进入 bin 文件夹：

	cd /usr/local/tomcat7/bin

给这个文件夹下的所有 shell 脚本授予权限：

	chmod 777 *.sh

开启tomcat服务：

	./startup.sh
	
# 安装mysql
	
使用 yum 安装 MySQL：

	yum install -y mysql-server mysql mysql-devel

安装完成后，启动 MySQL 服务：

	service mysqld restart

设置 MySQL 账户 root 密码：	

	/usr/bin/mysqladmin -u root password '123456'
	
将 MySQL 设置为开机自动启动：

	chkconfig mysqld on
	
	mysql -uroot --password='newpassword'

