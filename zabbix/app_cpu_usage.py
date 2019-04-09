#!/usr/bin/env python
# coding=utf-8
from __future__ import division, print_function
import subprocess
import time
import sys


def cpu_usage(app_pid, app, proctime, totaltime):
    prevproctime = proctime
    prevtotaltime = totaltime
    proctime = int(subprocess.check_output(['cat', '/proc/'+app_pid+'/stat']).split()[13])
    totaltime = sum([int(i) for i in subprocess.check_output(['grep', '^cpu ', '/proc/stat']).split()[1:]])
    perc = ('{0:.2f}'.format((proctime - prevproctime) / (totaltime - prevtotaltime) * 100))
    # perc = ('{0:.2%}'.format((proctime - prevproctime) / ( totaltime - prevtotaltime)))
    print(perc)


def main():
    app_name = sys.argv[1]
    # Get the PID of the application
    # app = '/opt/case/' + app_name + '/' + app_name
    app = subprocess.check_output("ps U www | grep "+app_name, shell=True).split('\n')[0].split(' ')[-1]
    app_pid = [i for i in subprocess.check_output(['/usr/bin/pgrep', '-f', app]).split('\n')][0]
    proctime = int(subprocess.check_output(['cat', '/proc/'+app_pid+'/stat']).split()[13])
    totaltime = sum([int(i) for i in subprocess.check_output(['grep', '^cpu ', '/proc/stat']).split()[1:]])
    time.sleep(0.5)
    cpu_usage(app_pid, app, proctime, totaltime)


if __name__ == '__main__':
    main()

