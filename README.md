# rep.taoweidong.github.io

个人博客的开发仓库，与仓库taoweidong.github.io对应

# hexo常用命令
安装完成后，输入以下命令以启动服务器，您的网站会在 http://localhost:4000 下启动。在服务器启动期间，Hexo 会监视文件变动并自动更新，您无须重启服务器。

$ hexo server
如果您想要更改端口，或是在执行时遇到了 EADDRINUSE 错误，可以在执行时使用 -p 选项指定其他端口，如下：

$ hexo server -p 5000

# 开发步骤如下

- 安装git,node,hexo等开发环境
- 首先克隆当前仓库到本地
- 安装相关依赖 npm install
- 编写博文，保存到 \rep.taoweidong.github.io\source\_posts 目录下
- 在当前项目路径下执行命令
  - hexo clean 清理工程
  - hexo g 编译博文
  - hexo d 发布博文到githua仓库中

## 2019年12月8日
- 修改配置，增加博客发布时自定义提交记录的功能
  
