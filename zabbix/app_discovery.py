#!/usr/bin/env python27
#coding=utf-8
import subprocess
import time

def main():
	#提取程序执行命令
	str_app_name = subprocess.check_output("ps aux | grep case | grep -v rsync | grep -v grep | awk '{print $NF}'",shell=True)
	list_app_name = [ i for i in str_app_name.split('\n') if i != '' ]

	print '{'
	print '    "data": ['

	#提取程序PID以及程序名称
	for app in list_app_name:
		if app != list_app_name[-1]:
			list_index = 0
		else:
			list_index = 1
		app_name = app.split('/')[-1]
		app_pid = [ i for i in subprocess.check_output(['/usr/bin/pgrep', '-f' ,app]).split('\n')][0]
		print '        {'
		print '            "{#APPNAME}": "%s"' %(app_name)
		if list_index != 1:
			print '        },'
		else:
			print '        }'

	print '    ]'
	print '}'

if __name__ == '__main__':
	main()
