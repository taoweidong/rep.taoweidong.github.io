@echo off
E:
cd E:\repTaoweidongGithubIo

REM ���ؿ�������
REM hexo s

REM ���ݲ��ͣ������Ƶ�Ϊ��
Xcopy E:\taoweidongBlog\source E:\repTaoweidongGithubIo\source  /s /e /y

REM ����github����
cd E:\repTaoweidongGithubIo
REM hexo clean&&hexo g&&hexo d

REM �ύ���Ʋ���
cd E:\taoweidongBlog
REM git --version
git add -A
git commit -m "���͸���"
git push origin master
REM git branch -u origin/master master

REM ��ʼ�ύgithub�ֿ�Ĳ���
cd E:\repTaoweidongGithubIo
REM git --version
git add -A
git commit -m  "���͸���"
git push origin master
REM git branch -u origin/master master


pause