----------
title: CentOS相关-CentOS6.5升级系统内核

date: 2018-1-19 23:31:16

toc: true

tag: 

- Linux
- CentOS

----------

#CentOS6.5升级方式
	
  通过以下命令查看您的 CentOS 内核：
	
	uname -r

如果执行以上命令后，输出的内核版本号低于 3.8，请参考下面的方法来来升级您的 Linux 内核。

对于 CentOS 6.5 而言，内核版本默认是 2.6。首先，可通过以下命令安装最新内核：

	rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
	
	rpm -ivh ftp://ftp.pbone.net/mirror/elrepo.org/elrepo/el6/x86_64/RPMS/elrepo-release-6-5.el6.elrepo.noarch.rpm
	
	yum -y --enablerepo=elrepo-kernel install kernel-lt

随后，编辑以下配置文件：
	
	vi /etc/grub.conf

将default=1修改为default=0。

最后，通过reboot命令重启操作系统。

重启后如果不出意外的话，再次查看内核，您的 CentOS 内核将会显示为 3.10。