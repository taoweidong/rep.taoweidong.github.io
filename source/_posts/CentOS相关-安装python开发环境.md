----------
title: CentOS相关-安装python开发环境

date: 2018-5-12 16:42:56

toc: true

tag: 

- CentOS
- Python

----------

>  搭建Python开发环境，自己的阿里云服务器上的版本为Python 2.6.6，自己下载Python 2.7.9的源代码自己编译安装。



### 检查CentOS7.2中原先的版本： 

```
# python -V
Python 2.6.6
```

### 安装devtoolset

```
# yum groupinstall "Development tools"
```

### 安装编译Python需要的包

```
yum install zlib-devel
yum install bzip2-devel
yum install openssl-devel
yum install ncurses-devel
yum install sqlite-devel
```

### 下载最新的Python2.7.13

```
# wget --no-check-certificate https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tar.xz 
```

<!-- More -->

### 解压Python

```
# tar -jxvf Python-2.7.13.tar.bz2 
```

### 编译与安装Python2.7.13

```
# ./configure --prefix=/usr/local
# make && make altinstall
```

### 查看版本信息

```
# /usr/local/bin/python2.7 -V 
Python 2.7.13
```

### 建立软连接，使系统默认指向python2.7

```
# mv /usr/bin/python /usr/bin/python2.6.6 
# ln -s /usr/local/bin/python2.7 /usr/bin/python 
```

### 再次查看Python的版本

```
# python -V 
Python 2.7.13
```

### 解决系统 Python 软链接指向 Python2.7 版本后，因为yum是不兼容 Python 2.7的，所需要指定 yum 的Python版本

```
# vi /usr/bin/yum 

将头部的
#!/usr/bin/python
改成
#!/usr/bin/python2.6.6
```

### 如果有输入法，还要更改配置iBus，因为iBus也不支持Python2.7

```
# vi /usr/bin/ibus-setup 
# vi/usr/libexec/ibus-ui-gtk

打开这两个文件，找到exec python这一行
改成exec python2.6保存和退出；
```