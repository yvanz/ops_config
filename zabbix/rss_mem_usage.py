#!/usr/bin/env python
# coding=utf-8
from __future__ import print_function
import subprocess
import sys


def main():
    app_name = sys.argv[1]

    # Get the PID of the application
    app = subprocess.check_output(
        "ps U www | grep "+app_name, shell=True
    ).split('\n')[0].split(' ')[-1]
    app_pid = [
        i for i in subprocess.check_output(
            ['/usr/bin/pgrep', '-f', app]
        ).split('\n')
    ][0]

    status_str1 = subprocess.check_output(
        "ps aux | grep -v grep | grep "+app_pid+" | awk '{print $6}'",
        shell=True
    )
    vmrss = int(status_str1) / 1024
    print(vmrss)
    status_str2 = subprocess.check_output(
        "ps aux | grep -v grep | grep "+app_pid+" | awk '{print $5}'",
        shell=True
    )
    vmsize = int(status_str2) / 1024
    print(vmsize)


if __name__ == '__main__':
    main()

