@echo off
E:
cd E:\repTaoweidongGithubIo

REM 本地开发测试
REM hexo s

REM 备份博客，以码云的为主
Xcopy E:\taoweidongBlog\source E:\repTaoweidongGithubIo\source  /s /e /y

REM 部署github博客
cd E:\repTaoweidongGithubIo
REM hexo clean&&hexo g&&hexo d

REM 提交码云博客
cd E:\taoweidongBlog
REM git --version
git add -A
git commit -m "博客更新"
git push origin master
REM git branch -u origin/master master

REM 开始提交github仓库的博客
cd E:\repTaoweidongGithubIo
REM git --version
git add -A
git commit -m  "博客更新"
git push origin master
REM git branch -u origin/master master


pause