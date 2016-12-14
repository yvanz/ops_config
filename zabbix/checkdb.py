#!/usr/bin/env python
import MySQLdb

mysql_user = ''
mysql_pw = ''
mysql_host = ''
mysql_port = 

with MySQLdb.connect(host = mysql_host, user = mysql_user, passwd = mysql_pw, port = mysql_port) as cursor:
    monitor_num = cursor.execute(""" select 1 """)

print monitor_num
