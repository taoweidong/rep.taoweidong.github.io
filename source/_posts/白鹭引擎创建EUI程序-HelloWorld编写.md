----------
title: 白鹭引擎创建EUI程序-HelloWorld编写

date: 2018-1-17 19:45:30 

toc: true

tag: 

- 白鹭引擎
- EUI

----------

> 使用Egret创建一个游戏工程，目标是自己编写一个EUI界面，替换默认打开界面；目的是通过创建了解exml文件的创建使用流程，以及注意事项。

# 搭建开发环境

1. 开发工具EgretWing和Egret Launcher
2. 创建工程

![创建工程|center](https://i.imgur.com/okqRYNt.png)

3. 工程结构

![工程结构|center](https://i.imgur.com/ZH8o5tJ.png)

4. 新建工程运行结果

![新建工程运行结果|center](https://i.imgur.com/Momu89W.png)

<!--more-->

# 开发过程

## 图片等背景资源引入

1. 引入背景图片

注意：必须将图片放在resource目录下，可以创建文件夹

2. 配置资源 
	
在default.res.json文件中进行配置，直接拖入背景照片即可，检查在Preload资源组中是否引入该背景图，没有的话必须引入。

![配置资源|center](https://i.imgur.com/a2ifZy0.png)

## 创建exml视图界面，并设计界面

1. 创建exml文件

![创建exml文件|center](https://i.imgur.com/tbmwKgr.png)


2. 配置exml文件对应的类文件

![配置exml文件对应的类文件|center](https://i.imgur.com/QCJcvfp.png)

> 这里需要注意的是，在Egret中EUI界面文件和后台逻辑类不需要文件名相同，可以自己命名，只需要保证类名和界面后台Class属性保持一致即可。

![](https://i.imgur.com/UWe5vnZ.png)

## 使用exml文件

![](https://i.imgur.com/ICGzTTW.png)


----------

>至此，EUI的简单使用已完毕，可以创建页面并进行使用，但需要注意的是，在页面的后台编写后台逻辑时，添加框架的点击或者失焦事件时，一定要注意在构造函数中添加UI加载完毕的监听事件，在监听事件中进行事件的添加，这样可以保证在添加事件时UI已经加载完毕。

![](https://i.imgur.com/U4o0ybf.png)



