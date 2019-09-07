----------
title: CentOS相关-搭建 FTP 文件服务

date: 2018-4-26 13:18:47

toc: true

tag: 

- CentOS
- Git

----------

>  搭建 FTP 文件服务    FTP 是一个很实用的文件传输协议，方便在客户端和服务器之间进行文件的传输。



# 安装并启动 FTP 服务 

安装 VSFTPD 使用 yum 安装 vsftpd：

```
yum install vsftpd -y
```

# 启动 VSFTPD

安装完成后，启动 FTP 服务：

```
service vsftpd start
```

启动后，可以看到系统已经监听了 21 端口：

```
netstat -nltp | grep 21
```

此时，访问 ftp://119.29.148.232 可浏览机器上的 /var/ftp 目录了。

> 注意：安装完毕后要注意应该使用cmd命令进行测试，是否可以访问，不能使用网页或者windows资源管理器进行测试，有可能无法访问。可以使用Filezilla等软件进行测试。

<!-- More -->

# 配置 FTP 权限

目前 FTP 服务登陆允许匿名登陆，也无法区分用户访问，我们需要配置 FTP 访问权限
了解 VSFTP 配置vsftpd 的配置目录为 /etc/vsftpd，包含下列的配置文件：
vsftpd.conf 为主要配置文件
ftpusers 配置禁止访问 FTP 服务器的用户列表
user_list 配置用户访问控制
阅读上述配置以了解更多信息。如果准备好了，点击下一步开始修改配置来设置权限。

# 阻止匿名访问和切换根目录

匿名访问和切换根目录都会给服务器带来安全风险，我们把这两个功能关闭。
编辑 /etc/vsftpd/vsftpd.conf，找到下面两处配置
并修改：# 禁用匿名用户 anonymous_enable=NO

禁止切换根目录  chroot_local_user=YES

编辑完成后，按 Ctrl + S 保存配置，重新启动 FTP 服务，如：

```
service vsftpd restart
```

# 创建 FTP 用户

创建一个用户 ftpuser ：

```
useradd ftpuser
```

为用户 ftpuser 设置密码 ：

```
echo "dg1eoacv" | passwd ftpuser --stdin
```

# 限制该用户仅能通过 FTP 访问

限制用户 ftpuser 只能通过 FTP 访问服务器，而不能直接登录服务器：

```
usermod -s /sbin/nologin ftpuser
```

# 为用户分配主目录

为用户 ftpuser 创建主目录并约定：/data/ftp 为主目录, 该目录不可上传文件/data/ftp/pub 文件只能上传到该目录下

```
mkdir -p /data/ftp/pub
```

创建登录欢迎文件：

```
echo "Welcome to use FTP service." > /data/ftp/welcome.txt
```

设置访问权限：

```
chmod a-w /data/ftp && chmod 777 -R /data/ftp/pub
```

设置为用户的主目录：

```
usermod -d /data/ftp ftpuser
```