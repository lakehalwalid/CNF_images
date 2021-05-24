FROM open5gs_kamailio

ADD mysql_db /var/lib/mysql
ADD mysql /mnt/mysql

EXPOSE 3306/tcp


CMD bash /mnt/mysql/init_mysql.sh
