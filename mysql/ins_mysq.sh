#!/bin/bash

groupadd mysql
useradd mysql -g mysql

mkdir -p /data/mysql/data
chown -R mysql.mysql /data/mysql/data

yum install gcc-c++ ncurses-devel bison cmake readline-devel

tar xzf boost_1_59_0.tar.gz
tar xzf percona-server-5.7.16-10.tar.gz
cd percona-server-5.7.16-10

cmake -DCMAKE_INSTALL_PREFIX=/usr/local/webserver/mysql -DMYSQL_DATADIR=/data/mysql/data/ -DDEFAULT_CHARSET=utf8mb4 -DWITH_INNOBASE_STORAGE_ENGINE=1 -DWITH_MYISAM_STORAGE_ENGINE=1 -DSYSCONFDIR=/etc -DENABLED_LOCAL_INFILE=1 -DENABLE_DTRACE=0 -DWITH_BLACKHOLE_STORAGE_ENGINE=1 -DDEFAULT_COLLATION=utf8mb4_general_ci -DMYSQL_USER=mysql -DMYSQL_TCP_PORT=3306 -DWITH_EMBEDDED_SERVER=1 -DWITH_BOOST=../boost_1_59_0

sleep 5
make && make install 

mysqld --initialize-insecure --user=mysql --basedir=/usr/local/webserver/mysql/ --datadir=/data/mysql/data/
