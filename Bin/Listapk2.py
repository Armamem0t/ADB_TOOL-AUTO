# !/usr/bin/env python
# -*- encoding: utf-8 -*-
 
import glob
import os
apk_path = './' 
apk_list=os.listdir(apk_path)
 
with open('apkinstall.bat','w') as f:
    for apk_name in apk_list:
        f.write('echo. \n'+"ECHO.INSTALL "+apk_name+'\n'+"adb install -r "+apk_name+' || ECHO.安装失败\n\n')
path1 = (".")
file = glob.iglob(path1+"\\"+"*.apk")
file
for i in file:
    print(i)
