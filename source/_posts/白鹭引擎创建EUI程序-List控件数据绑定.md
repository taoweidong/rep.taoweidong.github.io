----------
title: 白鹭引擎创建EUI程序-List控件进行数据绑定

date: 2018-2-8 15:55:35

toc: true

tag: 

- 白鹭引擎
- List控件数据绑定

----------

> 编写一个EUI界面，添加List控件，并在后台给List绑定相关数据。

# 搭建开发环境

1. 开发工具EgretWing和Egret Launcher
2. 创建工程

![创建工程|center](https://i.imgur.com/okqRYNt.png)

3. 工程结构

![工程结构|center](https://i.imgur.com/ZH8o5tJ.png)

4. 新建工程运行结果

![新建工程运行结果|center](https://i.imgur.com/Momu89W.png)

# 开发过程

## 创建EUI组件，注意exml文件的路径

![](https://i.imgur.com/fl36o6T.png)

<!--more-->

## 设计List控件界面

*注意事项*

1. 注意List条目皮肤有两种设置方式，一个是内嵌皮肤，在List控件上右键选择最后一个进行设置，另外一个就是选择分类属性中的条目皮肤进行设置。

 ![](https://i.imgur.com/aZmWZQZ.png)

2. 使用内嵌皮肤时，在List上双击就进入了设置item条目的界面，此界面设置每一个Item的样式，注意绑定数据时需要使用{data.List的Id}的形式

![](https://i.imgur.com/z05N6nP.png)


## 后台绑定数据

![](https://i.imgur.com/KFKVrjw.png)

## 主界面加载这个控件进行测试

![](https://i.imgur.com/ZxPzrcI.png)





