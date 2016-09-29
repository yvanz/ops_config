#!/bin/bash
/usr/local/webserver/mysql/bin/mysql -h172.16.20.75 -uzabbix -e 'show slave status\G' |grep -E "Slave_IO_Running|Slave_SQL_Running"|awk '{print $2}'|grep -c Yes
