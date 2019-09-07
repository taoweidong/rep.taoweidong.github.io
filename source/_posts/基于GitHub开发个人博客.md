----------
title: 基于GitHub开发个人博客

date: 2018-1-20 14:54:51

toc: true

tag: 

- GitHub
- 个人博客

----------


# 所需软件

![](https://i.imgur.com/j2LXxPa.png)

安装 Hexo 相当简单。然而在安装前，您必须检查电脑中是否已安装下列应用程序：

- Node.js
- Git

使用 npm 即可完成 Hexo 的安装。

	$ npm install -g hexo-cli
	$ npm install hexo-deployer-git --save

解压图中的压缩包到本地

![](https://i.imgur.com/dSZgf2b.png)
	
写好的博客位置：TaciturnK.github.io\source\_posts

![](https://i.imgur.com/te0xLke.png)

然后到根目录下打开命令窗口，依次执行三条命令：

	$ hexo clean
	$ hexo g
	$ hexo d

OK 这样博客发布完成

<!--more-->

# 前期需要准备的东西

- 注册GitHub,创建仓库，参考：[https://www.jianshu.com/p/465830080ea9](https://www.jianshu.com/p/465830080ea9)
- 使用hexo的主题yilia 参考：[https://www.jianshu.com/p/863f3f2d1733](https://www.jianshu.com/p/863f3f2d1733)

