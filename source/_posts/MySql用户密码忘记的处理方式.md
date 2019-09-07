----------
title: MySql用户密码忘记的处理方式

date: 2018-1-25 11:26:57

toc: true

tag: 

- MySql

----------

# windows：

1. 停止MYSQL服务，CMD打开DOS窗口，输入 net stop mysql 
2. 在CMD命令行窗口，进入MYSQL安装目录 比如E:\Program Files\MySQL\MySQL Server 5.0\bin 
示范命令: 
输入 e:回车, 
输入cd "E:\Program Files\MySQL\MySQL Server 5.0\bin" 
注意双引号也要输入,这样就可以进入Mysql安装目录了. 
3. 进入mysql安全模式，即当mysql起来后，不用输入密码就能进入数据库。 
命令为： mysqld -nt --skip-grant-tables (注意-nt前面的空格!)
4. 重新打开一个CMD命令行窗口，输入mysql -u root -p，使用空密码的方式登录MySQL（不用输入密码，直接按回车） 
5. 输入以下命令开始修改root用户的密码（注意：命令中mysql.user中间有个“点”） 
	mysql> update mysql.user set password=PASSWORD('新密码') where User='root';
6. 刷新权限表 
	mysql> flush privileges;
7. 退出 
	mysql> quit
 
这样MYSQL超级管理员账号 ROOT已经重新设置好了，接下来 在任务管理器里结束掉 mysql-nt.exe 这个进程，重新启动MYSQL即可！（也可以直接重新启动服务器） 
MYSQL重新启动后，就可以用新设置的ROOT密码登陆MYSQL了！ 

如果报错，注销下机器。

 

# Linux：

> 如果忘记了 MySQL 的 root 密码，可以用以下方法重新设置：
1. KILL掉系统里的MySQL进程；或者关闭Mysql的服务： 
	service mysqld stop
2. 用以下命令启动MySQL，以不检查权限的方式启动；
	mysqld_safe --skip-grant-tables &
3. 然后用空密码方式使用root用户登录 MySQL；
	mysql -u root
4. 修改root用户的密码；
	mysql> update mysql.user set password=PASSWORD ('taoweidong') where User='root' and host='localhost';
	mysql> flush privileges；
	mysql> quit
5. 重新启动MySQL，就可以使用新密码登录了。
    mysql -u root -p123456

# 远程登陆报错的处理方式
> user表中 Host列 'localhost' 改成 '%'  (也可以是固定ip、本地登陆localhost、%指不限登陆地址)

	//注意host为user表的主键，不能将所有的都改成%，后面的条件必须跟User和host
	update mysql.user set host='%' where User='root' and host='localhost';
