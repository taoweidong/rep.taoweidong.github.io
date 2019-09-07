# 个人博客

> 使用github+github page+git+hexo完成个人博客

> 安装 Hexo 相当简单。然而在安装前，您必须检查电脑中是否已安装下列应用程序：

- Node.js
- Git

## 使用 npm 即可完成 Hexo 的安装
`
$ npm install -g hexo-cli
$ npm install hexo-deployer-git --save

`

## 博客编写
- 编写mkdirdown文件，放至到/source/_posts文件夹中
- 根目录执行命令：
- hexo clean 清理缓存内容
- hexo g  构建新内容
- hexo d 发布文件至github


## 更换域名步骤
- 申请域名
- 进行域名解析
- 修改/source/CNAME文件，改为自己的域名
