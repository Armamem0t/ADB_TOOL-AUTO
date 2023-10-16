@echo off
COLOR 9f
SET AZ=Armamem0t
SET TITLE=刷机工具箱
SET VERSION=1.0
DEL apkinstall.bat
TITLE %TITLE%V%VERSION% BY %AZ% 
SET CD_DEVIER=%~dp0%
SET "PATH=%PATH%;%CD_DEVIER%Bin"
TREE
DIR /s /b apk|| ECHO.创建apk文件夹 && MD apk && timeout /t 1 /nobreak > NUL
DIR /s /b img|| ECHO.创建img文件夹 && MD img && ECHO.首次运行创建文件夹 && timeout /t 3 /nobreak > NUL 
:MENU
CD /d %CD_DEVIER%
DEL ..\apkinstall.bat
SET KEY=
CLS
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.************************************************************************************************************************
ECHO.安装应用请                             I
ECHO.打开命令行请                           C
ECHO.重启请按                               R
ECHO.刷写镜像请                             S
ECHO.刷写官方包信息请                       G
ECHO.查看信息请                             F
ECHO.回车以退出                             A
ECHO.默认所有页面是回车或者输入错误返回
ECHO.************************************************************************************************************************
SET /p key=-^-^-^-^-^> 请输入按键:
IF "%key%"=="I" GOTO INSTALLAPPS
IF "%key%"=="i" GOTO INSTALLAPPS
IF "%key%"=="R" GOTO RESTART
IF "%key%"=="r" GOTO RESTART
IF "%key%"=="C" GOTO CMDM
IF "%key%"=="c" GOTO CMDM
IF "%key%"=="F" GOTO INFO
IF "%key%"=="f" GOTO INFO
IF "%key%"=="S" GOTO FLASH_BIN_IMG
IF "%key%"=="s" GOTO FLASH_BIN_IMG
IF "%key%"=="G" GOTO FLASH_TGR_BAG
IF "%key%"=="g" GOTO FLASH_TGR_BAG
EXIT


:INSTALLAPPS
CLS
SET INSTALLAPPS_DIVER=
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.************************************************************************************************************************
ECHO.批量安装请      P
ECHO.单独安装请      C
ECHO.打开APK目录请   V
ECHO.自选目录批量请  D
ECHO.
ECHO.
ECHO.
ECHO.本程序是安装默认目录下的APK
ECHO.自选安装目录也可以
ECHO.************************************************************************************************************************
SET /p INSTALLAPPS_DIVER=-^-^-^-^-^> 请输入按键:

IF "%INSTALLAPPS_DIVER%"=="P" GOTO INSTALLAPPS_P
IF "%INSTALLAPPS_DIVER%"=="p" GOTO INSTALLAPPS_P
IF "%INSTALLAPPS_DIVER%"=="C" GOTO INSTALLAPPS_C
IF "%INSTALLAPPS_DIVER%"=="c" GOTO INSTALLAPPS_C
IF "%INSTALLAPPS_DIVER%"=="V" start explorer apk && GOTO INSTALLAPPS
IF "%INSTALLAPPS_DIVER%"=="v" start explorer apk && GOTO INSTALLAPPS
IF "%INSTALLAPPS_DIVER%"=="D" GOTO INSTALLAPPS_D
IF "%INSTALLAPPS_DIVER%"=="d" GOTO INSTALLAPPS_D
GOTO MENU



:INSTALLAPPS_P
CLS
SET KEY=
SET user_input=
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.************************************************************************************************************************
ECHO. 开始搜索apk目录的apk文件
ECHO.************************************************************************************************************************
py Bin\Listapk.py
ECHO.************************************************************************************************************************
ECHO.开始安装所有apk 确认请输入ok 取消请回车
ECHO.************************************************************************************************************************
SET /p user_input=-^-^-^-^-^> 请输入:
IF "%user_input%"=="ok" (
  CLS
  ECHO.已确认安装 开始安装 
) else (
    GOTO MENU
timeout /t 2 /nobreak >NUL
GOTO MENU
)
CALL adbrestart.bat
ECHO. 正在安装
CD apk
CALL ..\apkinstall.bat
DEL ..\apkinstall.bat
CD /d "%CD_DEVIER%"
PAUSE
GOTO MENU

:INSTALLAPPS_C
CLS
SET KEY=
SET user_input=
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.************************************************************************************************************************
ECHO. 开始搜索apk目录的apk文件
ECHO.************************************************************************************************************************
py Bin\Listapk.py
ECHO.************************************************************************************************************************
ECHO.请从上方复制需要安装的应用路径输入到下方
ECHO.************************************************************************************************************************
SET /p user_input=-^-^-^-^-^> 请输入:
ECHO.将要安装%user_input%
ECHO.命令为adb install %user_input%
ECHO.请确认
PAUSE
adb shell getprop ro.product.model || GOTO ERROR
adb install %user_input% || ECHO.安装失败
PAUSE
GOTO MENU


:INSTALLAPPS_D
CLS
SET KEY=
SET user_input=
SET INSTALLAPPS_DIVER=
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.************************************************************************************************************************
ECHO. 请选择apk目录
ECHO.************************************************************************************************************************
ECHO.请输入apk文件夹绝对目录
ECHO.************************************************************************************************************************
SET /p INSTALLAPPS_DIVER=-^-^-^-^-^> 请输入:
ECHO.进入目标%INSTALLAPPS_DIVER%目录
CD %INSTALLAPPS_DIVER%
ECHO.************************************************************************************************************************
ECHO.查找apk...
ECHO.************************************************************************************************************************
py %CD_DEVIER%\Bin\Listapk2.py
ECHO.************************************************************************************************************************
ECHO.请确认安装
PAUSE
CALL adbrestart.bat
ECHO. 正在安装
CD %INSTALLAPPS_DIVER%
CALL apkinstall.bat
DEL apkinstall.bat
CD /d "%CD_DEVIER%"
PAUSE
GOTO MENU




:CMDM
CLS
call adbrestart.bat
echo.adb help
echo.fastboot help
@echo on
@cmd


:RESTART
SET KEY=
CLS
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.重启面板
ECHO.************************************************************************************************************************
ECHO.ADB重启请        A
ECHO.FASTBOOT重启请   F
ECHO.
ECHO.
ECHO.回车以返回主页面
ECHO.************************************************************************************************************************
SET /p key=-^-^-^-^-^> 请输入按键:
IF "%key%"=="a" GOTO RESTART_A
IF "%key%"=="A" GOTO RESTART_A
IF "%key%"=="f" GOTO RESTART_B
IF "%key%"=="F" GOTO RESTART_B
GOTO MENU


:RESTART_A
SET KEY=
CLS
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.adb重启面板
ECHO.************************************************************************************************************************
ECHO.重启到fastboot请    F
ECHO.重启到系统请        R
ECHO.重启到recovery请    C
ECHO.
ECHO.回车以返回主页
ECHO.************************************************************************************************************************
SET /p key=-^-^-^-^-^> 请输入按键:
IF "%key%"=="F" adb reboot bootloader
IF "%key%"=="f" adb reboot bootloader
IF "%key%"=="R" adb reboot
IF "%key%"=="r" adb reboot
IF "%key%"=="C" adb reboot recovery
IF "%key%"=="c" adb reboot recovery
GOTO MENU


:RESTART_B
SET KEY=
CLS
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.fastboot重启面板
ECHO.************************************************************************************************************************
ECHO.重启到fastboot请   F
ECHO.重启到系统请       R
ECHO.重启到recovery请   C
ECHO.
ECHO.回车以返回主页
ECHO.************************************************************************************************************************
SET /p key=-^-^-^-^-^> 请输入按键:
IF "%key%"=="F" fastboot reboot bootloader
IF "%key%"=="f" fastboot reboot bootloader
IF "%key%"=="R" fastboot reboot
IF "%key%"=="r" fastboot reboot
IF "%key%"=="C" fastboot reboot recovery
IF "%key%"=="c" fastboot reboot recovery
GOTO MENU


:INFO
CLS
SET KEY=
ECHO. 设备信息
ECHO.************************************************************************************************************************
adb devices
ECHO.
ECHO.************************************************************************************************************************
adb shell getprop ro.product.model || GOTO ERROR
ECHO.************************************************************************************************************************
adb shell dumpsys battery
ECHO.************************************************************************************************************************
adb shell wm size
adb shell wm density
adb shell dumpsys window displays
ECHO.************************************************************************************************************************
adb shell SETtings get secure android_id
adb shell getprop ro.build.version.release
ECHO.************************************************************************************************************************
adb shell IFconfig
adb shell IFconfig wlan0
adb shell netcfg
adb shell cat /sys/class/net/wlan0/address
ECHO.************************************************************************************************************************
adb shell cat /proc/cpuinfo
ECHO.************************************************************************************************************************
adb shell cat /proc/meminfo
ECHO.************************************************************************************************************************
adb shell cat /system/build.prop
adb shell cat /system/build.prop
ECHO.************************************************************************************************************************
PAUSE
GOTO MENU


:FLASH_BIN_IMG
CLS
SET key=
SET img_name=
SET img_bin=
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.fastboot 刷写镜像——1
ECHO.************************************************************************************************************************
ECHO.请输入分区名字到下面输入框
ECHO.recovery boot init_boot
ECHO.注意千万不要加_ab 否则刷写错误
ECHO.
ECHO.输入back以返回主页     %KEY%
ECHO.************************************************************************************************************************
SET /p img_bin=请输入镜像分区名字:
IF "%img_bin%"=="back" GOTO MENU
CLS
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.fastboot 刷写 %img_bin% 分区
ECHO.************************************************************************************************************************
ECHO.请复制镜像文件名字到下面输入框
python %~dp0\Python\Listimg.py
ECHO.输入back以返回主页     %KEY%
ECHO.************************************************************************************************************************
SET /p img_name=请输入镜像文件:
IF "%img_name%"=="back" GOTO MENU
CLS

ECHO. 请确认 fastboot flash %img_bin%_ab %img_name%
PAUSE
adb reboot bootloader
fastboot flash %img_bin%_ab %img_name%
PAUSE
GOTO MENU



:FLASH_TGR_BAG
CLS
SET CD_NAME=
SET KEY_USER_INPUT=

ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.刷写MIUI官方镜像--1
ECHO.************************************************************************************************************************
ECHO.请复制文件绝对路径到输入框内
ECHO.打开文件夹即可看见image文件夹即为正确
ECHO.如果命令行左上角出现选择俩字请回车或者按鼠标左键解除状态    
ECHO.回车返回
ECHO.输入back以返回主页
ECHO.请输入绝对路径
ECHO.               
ECHO.************************************************************************************************************************

SET /p CD_NAME=-^-^-^-^-^> 请输入:
IF "%CD_NAME%"=="" GOTO MENU
IF "%CD_NAME%"=="back" GOTO MENU
for /f "tokens=1" %%b in (%CD_NAME%\misc.txt) do (
    SET %%b
)
CD %CD_NAME%
CLS
ECHO.正在查找必须文件 如果此时弹出错误请注意
DIR %CD_NAME%
dir /s /b misc.txt || ECHO.找不到misc.txt 无法显示刷机包信息请仔细辨别 避免黑砖 && GOTO FLASH_TGR_BAG_NO_DATA
dir /s /b flash_all.bat || ECHO.找不到flash_all.bat 无法不保留用户数据刷机 && PAUSE
dir /s /b flash_all_except_storage.bat || ECHO.找不到flash_all_except_storage.bat 无法保留用户数据刷机 && PAUSE
dir /s /b flash_all_lock.bat || ECHO.找不到flash_all_lock.bat 无法不保留用户数据并锁定BL锁刷机 && PAUSE
CLS
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.刷写官方镜像--2
ECHO.************************************************************************************************************************
ECHO.已选择刷机包 %CD_NAME%
ECHO.
ECHO.请确认刷机包信息：
ECHO.                设备代号：%device%
ECHO.                MIUI版本：%build_number%
ECHO.                用户数据版本：%userdata_version%
ECHO.                版本号：%custom_bulid_number%
ECHO.
ECHO.不保留用户数据刷机            请按Q
ECHO.保留用户数据刷机              请按T
ECHO.不保留用户数据并锁定BL锁刷机   请按P
ECHO.************************************************************************************************************************
ECHO.    
SET /p user_in=-^-^-^-^-^> 请输入:
IF "%user_in%"=="" GOTO MENU
GOTO shuaji
pause
exit
:FLASH_TGR_BAG_NO_DATA
dir /s /b flash_all.bat || ECHO.找不到flash_all.bat 无法不保留用户数据刷机
dir /s /b flash_all_except_storage.bat || ECHO.找不到flash_all_except_storage.bat 无法保留用户数据刷机
dir /s /b flash_all_lock.bat || ECHO.找不到flash_all_lock.bat 无法不保留用户数据并锁定BL锁刷机
ECHO.已选择刷机包 %CD_NAME%
ECHO.
ECHO.不保留用户数据刷机            请按Q
ECHO.保留用户数据刷机              请按T
ECHO.不保留用户数据并锁定BL锁刷机   请按P
SET /p user_in=-^-^-^-^-^> 请输入:
IF "%user_in%"=="" GOTO MENU


:shuaji
CLS
DIR images
ECHO.开始刷机
ECHO.重启设备到FASTBOOT
ECHO.请最后一次确认刷入
ECHO.回车退出到主页
pause
IF "%user_in%"=="Q" adb reboot bootloader & call flash_all.bat || ECHO.刷机失败 && PAUSE
IF "%user_in%"=="T" adb reboot bootloader & call flash_all_except_storage.bat || ECHO.刷机失败 && PAUSE
IF "%user_in%"=="P" adb reboot bootloader & call flash_all_lock.bat|| ECHO.刷机失败 && PAUSE
CLS
ECHO.安装脚本运行完成请查看日志
ECHO.因为本程序不支持检测其他批处理的运行所以结果成功或失败请自行辨别
PAUSE
GOTO MENU



:ERROR
ECHO.设备未连接请重新尝试
ECHO.请确认usb调试已获得授权
PAUSE
GOTO MENU