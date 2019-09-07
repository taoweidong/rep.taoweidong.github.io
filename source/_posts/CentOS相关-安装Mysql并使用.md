----------
title: CentOS相关-安装Mysql并使用

date: 2018-6-18 16:57:28

toc: true

tag: 

- CentOS
- Mysql

----------

> 目的：在Linux(3.10.0-862.3.2.el7.x86_64)上安装Mysql数据库，并可以远程连接使用。

> 注意：从最新版本的linux系统开始，默认的是 Mariadb而不是mysql！这里依旧以mysql为例进行展示 



## 先检查系统是否装有mysql 

```shell
rpm -qa | grep mysql
```


因为centos-7默认是Mariadb，所以执行以下命令只是更新Mariadb数据库yum install mysql ，删除已经存在的mysql数据库。

```
yum remove mysql
```

## 下载mysql的repo源 

```
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
```

安装mysql-community-release-el7-5.noarch.rpm包 

```
rpm -ivh mysql-community-release-el7-5.noarch.rpm
```
<!-- More -->

安装这个包后，会获得两个mysql的yum repo源：/etc/yum.repos.d/mysql-community.repo，/etc/yum.repos.d/mysql-community-source.repo。 



## 安装mysql 

```
yum install mysql-server
```

根据步骤安装就可以了，不过安装完成后，没有密码，需要重置密码。安装后再次查看mysql 



## 重置密码 

重置密码前，首先要登录 `mysql -u root `登录时有可能报这样的错：ERROR 2002 (HY000): Can’t connect to local MySQL server through socket ‘/var/lib/mysql/mysql.sock’ (2)，原因是/var/lib/mysql的访问权限问题。下面的命令把/var/lib/mysql的拥有者改为当前用户： 

```
chown -R openscanner:openscanner /var/lib/mysql
```

> 如果报chown: 无效的用户: "openscanner:openscanner"错误，更换命令，并用 ll 查看目录权限列表 

```
chown root /var/lib/mysql/
```

## 启动服务

```
service mysqld start
```

## 重启服务

```
service mysqld restart
```

## 登录重置密码 

```
[root@Taowd-PC ~]# mysql -u root -p
mysql > use mysql;
mysql > update user set password=password('123456') where user='root';
mysql > exit;
```

重启mysql服务后才生效 `service mysqld restart `

## 为root添加远程连接的能力 

- 查看host下面有没有%，我的表中已经有%数据行，如果没有添加一个。 

![](https://i.imgur.com/rtr0I1V.png)

- 进行授权如果想root用户使用password从任何主机连接到mysql服务器的话。

```
GRANT ALL PRIVILEGES ON . TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
```

- 如果想用户root从ip为192.168.1.13的主机连接到mysql服务器，并使用mypassword作为密码

```
GRANT ALL PRIVILEGES ON . TO 'root'@'192.168.1.13' IDENTIFIED BY 'root' WITH GRANT OPTION;
```

- 重启服务，从本地登录，成功 

## 开放3306端口号 

firewalld 防火墙（centos-7）运行命令,并重启： 

```
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload
```

iptables 防火墙（centos6.5及其以前）运行命令 

```
vim /etc/sysconfig/iptables
```

在文件内添加下面命令行，然后重启 

```
-A INPUT -p tcp -m state --state NEW -m tcp --dport 3306 -j ACCEPT
service iptables restart
```

