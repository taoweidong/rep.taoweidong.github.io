@echo off
E:
cd E:\repTaoweidongGithubIo

REM ���ؿ�������
call hexo clean
call hexo g
call hexo d

REM git --version
call git add -A
call git commit -m "���͸���"
call git push origin master
REM git branch -u origin/master master
echo GitHub���³ɹ�

pause