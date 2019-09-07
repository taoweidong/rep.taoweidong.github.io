----------
title: 使用Jenkins和GitLab搭建CI环境

date: 2018-6-6 21:25:50

toc: true

tag: 

- GitLab
- Jenkins
- 持续集成
- CI

----------

> GitLab是一个代码仓库，用来管理代码。Jenkins是一个自动化服务器，可以运行各种自动化构建、测试或部署任务。所以这两者结合起来，就可以实现开发者提交代码到GitLab，Jenkins以一定频率自动运行测试、构建和部署的任务，帮组开发团队更高效的集成和发布代码。

<!-- More -->

# GitLab简介

GitLab是利用 Ruby on Rails 一个开源的版本管理系统，实现一个自托管的Git项目仓库，可通过Web界面进行访问公开的或者私人项目。

- 它拥有与Github类似的功能，能够浏览源代码，管理缺陷和注释。可以管理团队对仓库的访问，它非常易于浏览提交过的版本并提供一个文件历史库。
- 团队成员可以利用内置的简单聊天程序(Wall)进行交流。
- 它还提供一个代码片段收集功能可以轻松实现代码复用，便于日后有需要的时候进行查找。

## 准备环境

在正式开始安装之前，先更新软件包并打开相关服务的权限。

### 更新软件包 

```shell
yum update -y
```

![](https://i.imgur.com/mmgP5NC.png)

![](https://i.imgur.com/WLjZRfK.png)

### 安装 sshd 

- 安装 sshd：

```shell
yum install -y curl policycoreutils-python openssh-server
```

- 启用并启动 sshd

```shell
systemctl enable sshd
systemctl start sshd
```

### 配置防火墙 

打开 /etc/sysctl.conf 文件，在文件最后添加新的一行并按 `Ctrl + S` 保存： 

```
net.ipv4.ip_forward = 1
```

启用并启动防火墙： 

```
systemctl enable firewalld
systemctl start firewalld
```

放通 HTTP： 

```
firewall-cmd --permanent --add-service=http
```

重启防火墙： 

```
systemctl reload firewalld
```

在实际使用中，可以使用 `systemctl status firewalld` 命令查看防火墙的状态。 

### 安装 postfix 

> GitLab 需要使用 postfix 来发送邮件。当然，也可以使用 SMTP 服务器，具体步骤请参考 官方教程。 

#### 安装： 

```
yum install -y postfix
```

打开 /etc/postfix/main.cf 文件，在第 119 行附近找到 `inet_protocols = all`，将 `all` 改为 `ipv4` 并按 `Ctrl + S` 保存： 

```
inet_protocols = ipv4
```

启用并启动 postfix： 

```
systemctl enable postfix 
systemctl start postfix
```

### 配置 swap 交换分区 

> 由于 GitLab 较为消耗资源，我们需要先创建交换分区，以降低物理内存的压力。 在实际生产环境中，如果服务器配置够高，则不必配置交换分区。 

新建 2 GB 大小的交换分区： 

```shell
dd if=/dev/zero of=/root/swapfile bs=1M count=2048
```

![](https://i.imgur.com/MgdPJZJ.png)

格式化为交换分区文件并启用： 

```
mkswap /root/swapfile
swapon /root/swapfile
```

添加自启用。打开 /etc/fstab 文件，在文件最后添加新的一行并按 `Ctrl + S` 保存： 

```
/root/swapfile swap swap defaults 0 0
```

## 安装 GitLab

### 将软件源修改为国内源 

>  由于网络环境的原因，将 repo 源修改为 清华大学      。在 `/etc/yum.repos.d` 目录下新建 gitlab-ce.repo 文件并保存。内容如下： 

```
[gitlab-ce]
name=Gitlab CE Repository
baseurl=https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el$releasever/
gpgcheck=0
enabled=1
```

### 安装 GitLab 

> 刚才修改过了 yum 源，因此先重新生成缓存： （此步骤执行时间较长，一般需要 3~5 分钟左右，请耐心等待） 

```
yum makecache
```

>  安装 GitLab： （此步骤执行时间较长，一般需要 3~5 分钟左右，请耐心等待） 

```
yum install -y gitlab-ce
```



## 初始化 GitLab

### 配置 GitLab 的域名（非必需） 

> 打开 /etc/gitlab/gitlab.rb 文件，在第 13 行附近找到 `external_url 'http://gitlab.example.com'`，将单引号中的内容改为自己的域名（带上协议头，末尾无斜杠），并按 `Ctrl + S` 保存。   

```
external_url 'http://work.myteam.com'
```

> 记得将域名通过 A 记录解析到 `139.199.169.97` 。 

### 初始化GitLab[重要]

>  使用如下命令初始化 GitLab： （此步骤执行时间较长，一般需要 5~10 分钟左右，请耐心等待） 

```
sudo gitlab-ctl reconfigure
```

## GitLab 安装已完成

> 至此，我们已经成功地在 CentOS 7 上搭建了 GitLab。 现在可以在这里（http://139.199.169.97/）访问 GitLab 了。 在实际生产中，建议您使用 2 核 4 GB 或更高配置的 CVM。点击这里 可以查看 GitLab 官方推荐的配置和可承载人数对应表。 再次提醒您，定期执行 `yum update -y` 以保持各软件包的最新状态。 



# Jenkins简介

## 准备软件

- apache-tomcat-6.0.45.tar.gz(注意jdk版本要求)
- jdk-8u121-linux-x64.tar.gz(根据自己的需要安装版本)
- jenkins.war(注意：Jenkins的版本和jdk版本需对应)

![](https://i.imgur.com/mlV2WWt.png)

## 安装过程

Jenkins是依赖jdk的，因此需要先安装jdk并配置环境变量，配置完成后，安装tomcat，也就是解压tomcat压缩包；Jenkins安装包是一个war包，只需要将这个war包放置在tomcat的wabapp目录下，并运行tomcat就可以使用jenkins**注意：如果服务器上8080端口已经被占用，此处需要修改tomcat的端口，防止端口冲突** 

![](https://i.imgur.com/PJ93WVA.png)

![](https://i.imgur.com/JEC5lIU.png)

注意在用户根目录下存储的初识密码，根据打开的主页上的提示信息，找到初识密码并输入。

![](https://i.imgur.com/u6SXvxS.png)

![](https://i.imgur.com/OXmYbp7.png)

按照推荐安装Jenkins插件，一般情况下，推荐的插件已经足够使用了。

![](https://i.imgur.com/5D0S04H.png)

创建一个用户，然后安装就成功了，可以开始使用Jenkins了。

![](https://i.imgur.com/gUPX2iJ.png)

进入主页：

![](https://i.imgur.com/G7wKOq7.png)

