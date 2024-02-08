#!/bin/sh

if [ -f "./ftp_config_done" ];
then
	echo "ftp server already configured"
else
	touch ftp_config_done
	adduser $FTP_USER --disabled-password
	echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null
    	chown -R $FTP_USER:$FTP_USER /var/www/html
    	echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null
fi

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
