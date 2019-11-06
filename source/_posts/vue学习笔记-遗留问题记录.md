----------
title: vue学习笔记-遗留问题记录

date: 2019-11-6 19:21:21

toc: true

tag: 

- vue
- node.js

----------

# Node.js是什么？对node.js的理解

> 官网解释：Node.js 是一个基于 Chrome V8 引擎的 JavaScript 运行时。 

- 这是一种通过JavaScript语言开发web服务端的东西
- Node 是一个服务器程序。但是，基础 Node 产品肯定不 像 Apache 或 Tomcat
- node.js有非阻塞，事件驱动I/O等特性，从而让高并发（high concurrency）在的轮询（Polling）和comet构建的应用中成为可能
- Node 是一个程序，能够完成 Apache 能够完成的所有任务（借助一些模块），而且，作为一个可以将其作为基础进行构建的可扩展 JavaScript 平台，Node 还能完成更多的任务。
- Node 并不只是 Apache 的一个替代品，它旨在使 PHP Web 应用程序更容易伸缩。


代码示例，开发一个简单的Http服务HelloWorldJs.js，代码如下：

```javascript
// Node 随机数字生成器
var http = require("http")
var url = require("url");

// 创建一个Http服务
http.createServer(function(request,response){
     // 设置返回头信息
     response.writeHead(200, {"Content-Type": "text/plain"});
 
     // 获取参数等
     var params = url.parse(request.url, true).query;

      
     // 返回给浏览器的信息或者数据
     response.write("Hello World Node.js.......");
      
     // 结束返回
     response.end();
 
   // 指定监听端口信息
}).listen(8005);

// 控制台输出信息
console.log("Hello World Node.js Running...");

```

运行
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191106200734769.png)
访问
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191106200801461.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)

参考链接1： [https://www.zhihu.com/question/33578075/answer/56951771](https://www.zhihu.com/question/33578075/answer/56951771)

参考链接2：[https://www.ibm.com/developerworks/cn/opensource/os-nodejs/](https://www.ibm.com/developerworks/cn/opensource/os-nodejs/)



# Chrome V8 引擎是什么？
V8 JavaScript 引擎是 Google 用于其 Chrome 浏览器的底层 JavaScript 引擎。很少有人考虑 JavaScript 在客户机上实际做了些什么？实际上，JavaScript 引擎负责解释并执行代码。Google 使用 V8 创建了一个用 C++ 编写的超快解释器，该解释器拥有另一个独特特征；您可以下载该引擎并将其嵌入任何 应用程序。V8 JavaScript 引擎并不仅限于在一个浏览器中运行。因此，Node 实际上会使用 Google 编写的 V8 JavaScript 引擎，并将其重建为可在服务器上使用。太完美了！既然已经有一个不错的解决方案可用，为何还要创建一种新语言呢？

# NPM是什么？
Node 的一个特性是 Node Package Module，这是一个内置功能，用于安装和管理 Node 模块。它自动处理依赖项，因此您可以确定：您想要安装的任何模块都将正确安装并包含必要的依赖项。它还支持将您自己的模块发布到 Node 社区，假如您选择加入社区并编写自己的模块的话。您可以将 NPM 视为一种允许轻松扩展 Node 功能的方法，不必担心这会破坏您的 Node 安装。同样，如果您选择深入学习 Node，那么 NPM 将是您的 Node 解决方案的一个重要组成部分。


# vue和vue-cli的区别？
vue值得是node.js里面的vue这个模块，也就是直接引用是的vue.js文件，执行npm install vue相当于下载vue.js这个核心的依赖文件

vue-cli是vue官方提供的一个工具，可以用来快速创建vue模板工程
这两者的区别可以参考[vue官网解释](https://cn.vuejs.org/v2/guide/installation.html#%E7%9B%B4%E6%8E%A5%E7%94%A8-lt-script-gt-%E5%BC%95%E5%85%A5) 

![在这里插入图片描述](https://img-blog.csdnimg.cn/20191106202357185.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)


# vue是用什么语言开发的？

> < 2.0  使用javascript开发
> \>2.0  使用TypeScript开发

# Vue打包的原理？为什么打包之后必须放在容器中运行？

> **说明** 在命令行执行npm run build命令执行的打包操作其实是对项目资源的压缩和优化，为了提高项目在生产环境下运行效率，内部执行的操作应该是将相关的js,css，图片等内容压缩之后放在指定的文件夹中(在confi/index.js)配置文件中进行配置。

如果想在打包之后本地直接打开，可以修改以下配置：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191106204810407.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)修改路由规则为hash:
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191106205707184.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3Rhb3dlaWRvbmcx,size_16,color_FFFFFF,t_70)


- 参考1： [https://blog.csdn.net/zx_p24/article/details/80360312](https://blog.csdn.net/zx_p24/article/details/80360312)
- 参考2：[https://blog.csdn.net/weixin_41439996/article/details/80844635](https://blog.csdn.net/weixin_41439996/article/details/80844635)
- 参考3：[https://blog.csdn.net/CWW2016/article/details/101169145](https://blog.csdn.net/CWW2016/article/details/101169145)
- 参考4：[https://blog.csdn.net/u013727805/article/details/93519061](https://blog.csdn.net/u013727805/article/details/93519061)

