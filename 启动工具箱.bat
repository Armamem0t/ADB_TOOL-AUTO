@echo off
COLOR 9f
SET AZ=Armamem0t
SET TITLE=ˢ��������
SET VERSION=1.0
DEL apkinstall.bat
TITLE %TITLE%V%VERSION% BY %AZ% 
SET CD_DEVIER=%~dp0%
SET "PATH=%PATH%;%CD_DEVIER%Bin"
TREE
DIR /s /b apk|| ECHO.����apk�ļ��� && MD apk && timeout /t 1 /nobreak > NUL
DIR /s /b img|| ECHO.����img�ļ��� && MD img && ECHO.�״����д����ļ��� && timeout /t 3 /nobreak > NUL 
:MENU
CD /d %CD_DEVIER%
DEL ..\apkinstall.bat
SET KEY=
CLS
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.************************************************************************************************************************
ECHO.��װӦ����                             I
ECHO.����������                           C
ECHO.�����밴                               R
ECHO.ˢд������                             S
ECHO.ˢд�ٷ�����Ϣ��                       G
ECHO.�鿴��Ϣ��                             F
ECHO.�س����˳�                             A
ECHO.Ĭ������ҳ���ǻس�����������󷵻�
ECHO.************************************************************************************************************************
SET /p key=-^-^-^-^-^> �����밴��:
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
ECHO.������װ��      P
ECHO.������װ��      C
ECHO.��APKĿ¼��   V
ECHO.��ѡĿ¼������  D
ECHO.
ECHO.
ECHO.
ECHO.�������ǰ�װĬ��Ŀ¼�µ�APK
ECHO.��ѡ��װĿ¼Ҳ����
ECHO.************************************************************************************************************************
SET /p INSTALLAPPS_DIVER=-^-^-^-^-^> �����밴��:

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
ECHO. ��ʼ����apkĿ¼��apk�ļ�
ECHO.************************************************************************************************************************
py Bin\Listapk.py
ECHO.************************************************************************************************************************
ECHO.��ʼ��װ����apk ȷ��������ok ȡ����س�
ECHO.************************************************************************************************************************
SET /p user_input=-^-^-^-^-^> ������:
IF "%user_input%"=="ok" (
  CLS
  ECHO.��ȷ�ϰ�װ ��ʼ��װ 
) else (
    GOTO MENU
timeout /t 2 /nobreak >NUL
GOTO MENU
)
CALL adbrestart.bat
ECHO. ���ڰ�װ
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
ECHO. ��ʼ����apkĿ¼��apk�ļ�
ECHO.************************************************************************************************************************
py Bin\Listapk.py
ECHO.************************************************************************************************************************
ECHO.����Ϸ�������Ҫ��װ��Ӧ��·�����뵽�·�
ECHO.************************************************************************************************************************
SET /p user_input=-^-^-^-^-^> ������:
ECHO.��Ҫ��װ%user_input%
ECHO.����Ϊadb install %user_input%
ECHO.��ȷ��
PAUSE
adb shell getprop ro.product.model || GOTO ERROR
adb install %user_input% || ECHO.��װʧ��
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
ECHO. ��ѡ��apkĿ¼
ECHO.************************************************************************************************************************
ECHO.������apk�ļ��о���Ŀ¼
ECHO.************************************************************************************************************************
SET /p INSTALLAPPS_DIVER=-^-^-^-^-^> ������:
ECHO.����Ŀ��%INSTALLAPPS_DIVER%Ŀ¼
CD %INSTALLAPPS_DIVER%
ECHO.************************************************************************************************************************
ECHO.����apk...
ECHO.************************************************************************************************************************
py %CD_DEVIER%\Bin\Listapk2.py
ECHO.************************************************************************************************************************
ECHO.��ȷ�ϰ�װ
PAUSE
CALL adbrestart.bat
ECHO. ���ڰ�װ
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
ECHO.�������
ECHO.************************************************************************************************************************
ECHO.ADB������        A
ECHO.FASTBOOT������   F
ECHO.
ECHO.
ECHO.�س��Է�����ҳ��
ECHO.************************************************************************************************************************
SET /p key=-^-^-^-^-^> �����밴��:
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
ECHO.adb�������
ECHO.************************************************************************************************************************
ECHO.������fastboot��    F
ECHO.������ϵͳ��        R
ECHO.������recovery��    C
ECHO.
ECHO.�س��Է�����ҳ
ECHO.************************************************************************************************************************
SET /p key=-^-^-^-^-^> �����밴��:
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
ECHO.fastboot�������
ECHO.************************************************************************************************************************
ECHO.������fastboot��   F
ECHO.������ϵͳ��       R
ECHO.������recovery��   C
ECHO.
ECHO.�س��Է�����ҳ
ECHO.************************************************************************************************************************
SET /p key=-^-^-^-^-^> �����밴��:
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
ECHO. �豸��Ϣ
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
ECHO.fastboot ˢд���񡪡�1
ECHO.************************************************************************************************************************
ECHO.������������ֵ����������
ECHO.recovery boot init_boot
ECHO.ע��ǧ��Ҫ��_ab ����ˢд����
ECHO.
ECHO.����back�Է�����ҳ     %KEY%
ECHO.************************************************************************************************************************
SET /p img_bin=�����뾵���������:
IF "%img_bin%"=="back" GOTO MENU
CLS
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.fastboot ˢд %img_bin% ����
ECHO.************************************************************************************************************************
ECHO.�븴�ƾ����ļ����ֵ����������
python %~dp0\Python\Listimg.py
ECHO.����back�Է�����ҳ     %KEY%
ECHO.************************************************************************************************************************
SET /p img_name=�����뾵���ļ�:
IF "%img_name%"=="back" GOTO MENU
CLS

ECHO. ��ȷ�� fastboot flash %img_bin%_ab %img_name%
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
ECHO.ˢдMIUI�ٷ�����--1
ECHO.************************************************************************************************************************
ECHO.�븴���ļ�����·�����������
ECHO.���ļ��м��ɿ���image�ļ��м�Ϊ��ȷ
ECHO.������������Ͻǳ���ѡ��������س����߰����������״̬    
ECHO.�س�����
ECHO.����back�Է�����ҳ
ECHO.���������·��
ECHO.               
ECHO.************************************************************************************************************************

SET /p CD_NAME=-^-^-^-^-^> ������:
IF "%CD_NAME%"=="" GOTO MENU
IF "%CD_NAME%"=="back" GOTO MENU
for /f "tokens=1" %%b in (%CD_NAME%\misc.txt) do (
    SET %%b
)
CD %CD_NAME%
CLS
ECHO.���ڲ��ұ����ļ� �����ʱ����������ע��
DIR %CD_NAME%
dir /s /b misc.txt || ECHO.�Ҳ���misc.txt �޷���ʾˢ������Ϣ����ϸ��� �����ש && GOTO FLASH_TGR_BAG_NO_DATA
dir /s /b flash_all.bat || ECHO.�Ҳ���flash_all.bat �޷��������û�����ˢ�� && PAUSE
dir /s /b flash_all_except_storage.bat || ECHO.�Ҳ���flash_all_except_storage.bat �޷������û�����ˢ�� && PAUSE
dir /s /b flash_all_lock.bat || ECHO.�Ҳ���flash_all_lock.bat �޷��������û����ݲ�����BL��ˢ�� && PAUSE
CLS
ECHO.************************************************************************************************************************
ECHO.%TITLE% %VERSION%
ECHO.%AZ%
ECHO.ˢд�ٷ�����--2
ECHO.************************************************************************************************************************
ECHO.��ѡ��ˢ���� %CD_NAME%
ECHO.
ECHO.��ȷ��ˢ������Ϣ��
ECHO.                �豸���ţ�%device%
ECHO.                MIUI�汾��%build_number%
ECHO.                �û����ݰ汾��%userdata_version%
ECHO.                �汾�ţ�%custom_bulid_number%
ECHO.
ECHO.�������û�����ˢ��            �밴Q
ECHO.�����û�����ˢ��              �밴T
ECHO.�������û����ݲ�����BL��ˢ��   �밴P
ECHO.************************************************************************************************************************
ECHO.    
SET /p user_in=-^-^-^-^-^> ������:
IF "%user_in%"=="" GOTO MENU
GOTO shuaji
pause
exit
:FLASH_TGR_BAG_NO_DATA
dir /s /b flash_all.bat || ECHO.�Ҳ���flash_all.bat �޷��������û�����ˢ��
dir /s /b flash_all_except_storage.bat || ECHO.�Ҳ���flash_all_except_storage.bat �޷������û�����ˢ��
dir /s /b flash_all_lock.bat || ECHO.�Ҳ���flash_all_lock.bat �޷��������û����ݲ�����BL��ˢ��
ECHO.��ѡ��ˢ���� %CD_NAME%
ECHO.
ECHO.�������û�����ˢ��            �밴Q
ECHO.�����û�����ˢ��              �밴T
ECHO.�������û����ݲ�����BL��ˢ��   �밴P
SET /p user_in=-^-^-^-^-^> ������:
IF "%user_in%"=="" GOTO MENU


:shuaji
CLS
DIR images
ECHO.��ʼˢ��
ECHO.�����豸��FASTBOOT
ECHO.�����һ��ȷ��ˢ��
ECHO.�س��˳�����ҳ
pause
IF "%user_in%"=="Q" adb reboot bootloader & call flash_all.bat || ECHO.ˢ��ʧ�� && PAUSE
IF "%user_in%"=="T" adb reboot bootloader & call flash_all_except_storage.bat || ECHO.ˢ��ʧ�� && PAUSE
IF "%user_in%"=="P" adb reboot bootloader & call flash_all_lock.bat|| ECHO.ˢ��ʧ�� && PAUSE
CLS
ECHO.��װ�ű����������鿴��־
ECHO.��Ϊ������֧�ּ��������������������Խ���ɹ���ʧ�������б��
PAUSE
GOTO MENU



:ERROR
ECHO.�豸δ���������³���
ECHO.��ȷ��usb�����ѻ����Ȩ
PAUSE
GOTO MENU