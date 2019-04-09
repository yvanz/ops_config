#!/usr/bin/env python
# coding=utf-8
from __future__ import print_function
import subprocess
import json


def main():
    # 提取程序执行命令
    str_app_name = subprocess.check_output("ps U www | grep case | awk '{print $NF}'", shell=True)
    list_app_name = [i for i in str_app_name.split('\n') if i != '']

    l = []
    app_json = dict()

    # 提取程序名称
    for app in list_app_name:
            temp_dict = dict()
            app_name = app.split('/')[-1]
            temp_dict["{#APPNAME}"] = app_name
            l.append(temp_dict)

    app_json["data"] = l
    print(json.dumps(app_json))


if __name__ == '__main__':
    main()

