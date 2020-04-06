@echo off
E:
cd E:\repTaoweidongGithubIo

REM 本地开发测试
call hexo clean
call hexo g
call hexo d

REM git --version
call git add -A
call git commit -m "博客更新"
call git push origin master
REM git branch -u origin/master master
echo GitHub更新成功

pause