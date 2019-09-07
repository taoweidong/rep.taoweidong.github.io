----------
title: 白鹭引擎打包APP过程

date: 2018-1-17 19:45:30 

toc: true

tag: 

- Egret
- 白鹭引擎

----------

## 打包所需软件：

1. Android SDK.zip  需下载对应的Android平台  Android7.0(跟白鹭引擎版本有关)
2. gradle-2.2-all.zip   白鹭引擎5.0.9 需2.2版本 否则打包报错
3. egret-android-support-4.0.0.zip   白鹭插件
4. android-studio-ide-171.4408382-windows.exe  Android开发工具
5. EgretWing  白鹭开发工具


## 打包流程
1. 一切OK的情况下使用Egret Wing工具直接使用移动打包，设置相关路径，点击生成，则会打包成功，生成APK文件。
2. 打包的原理是：先使用egret-android-support-4.0.0工具将Egret工程转换成对应的Android工程(Eclipse和Android Studio),然后使用gradle，SDK，Jdk将对应的Android工程编译打包成APK安装文件。
3. 注意：（Android SDK、gradle、egret-android-support）这些文件的所有安装路径中不能包含空格、汉字等特殊字符，因为后台在进行打包时，其实是在进行命令行的操作，如果存在空格则会将命令隔断导致打包失败。
4. 注意：SDK最好将Android4.0之上的版本以及Bulid Tools工具全部进行下载(文件大概76G左右)；
5. 我用流程1没有打包成功过，传说是跟系统等等环境有关系，一直没有搞定，我的流程是：使用egretWing进行打包，此时打包肯定报错，但是已经将egret工程转换成了Android工程，然后将Android工程导入到Android Studio中，导入后项目也存在问题，需要进行修改完善，主要是修改配置文件build.gradle，此问题后面会详细描述；工程bulid成功后按照Android Studio打包流程进行即可。


## 图解打包流程

### EgretWing 将项目转换为android studio工程

![EgretWing|center](https://i.imgur.com/KPKmGCW.png)

**注意**   

- 图中路径不能含有空格和中文字符;
- 注意Gradle的版本;
- 注意As Support选择和项目平台相对应;

![](https://i.imgur.com/1xiTkFn.png)

> 此时，在打包的过程中发生报错，但是android工程已经生成，这个是在编译成APP的时候报错，因为不影响后续操作。

![](https://i.imgur.com/vdkdxVM.png)

> 此时可以到【输出项目路径】查看生成的工程。

![](https://i.imgur.com/X3hc8ob.png)


### Android Studio打包APK文件

![](https://i.imgur.com/B59ENH6.png)

**注意：**

- 导入工程之后Gradle会自动进行工程构建，此时可能存在多个错误，等Gradle自动构建完毕之后进行Clean Project工程清理，然后手动Bulid一次；

![](https://i.imgur.com/1wkEN9H.png) 

> 等工程编译没有错误时，选择Build->Generate Signed APK,选择相关配置，点击Finish,开始生成，此时生成是报错的，报错信息如下：

![](https://i.imgur.com/iVKpiDX.png)

**注意:**
> 此处报错的原因是：Android6.0(API 23)SDK，不再提供org.apache.http.*(只保留几个类)，目前发现编译时使用的版本为：Android8.0 (API 27),所以转换之后的工程中不包含这几个类。

**解决方案：**

build.gradle中 在buildToolsVersion下边 defaultConfig上边

    android {
	//添加此项，声明编译时的依赖项
	useLibrary 'org.apache.http.legacy'
	}


![](https://i.imgur.com/oEeur4x.png)

- 对工程再次进行Clean Priject，Bulid无任何报错信息之后进行打包操作

![](https://i.imgur.com/CXqWmr0.png)

![](https://i.imgur.com/1gNspcc.png)

![](https://i.imgur.com/NFXiemM.png)

> 打开文件路径，查看打包好的APK文件(路径在工程里的app目录中)

![](https://i.imgur.com/blXmdWM.png)





----------
2018/1/16 8:31:10 

陶伟东
