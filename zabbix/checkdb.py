#!/usr/bin/env python
from __future__ import print_function
import MySQLdb

mysql_user = ''
mysql_pw = ''
mysql_host = ''
mysql_port = 3306

try:
    with MySQLdb.connect(
            host=mysql_host,
            user=mysql_user,
            passwd=mysql_pw,
            port=mysql_port
    ) as cursor:
        monitor_num = cursor.execute(""" select 1 """)
except Exception as e:
    print(0)
else:
    print(monitor_num)

