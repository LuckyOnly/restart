@ECHO OFF                                                                                                  
::将所有进程信息列入list.txt文件里面（这里默认当前目录）
tasklist >list.txt
::从list.txt文件里查找这个进程
::type list.txt


find /i "FDA.exe" list.txt
::如果进程存在，杀死进程                                           
if "%errorlevel%"=="0" (
::杀掉进程
taskkill /f /im FDA.exe)

find /i "TSServerU.exe" list.txt
::如果进程存在，杀死进程
if "%errorlevel%"=="0" (
taskkill /f /im TSServerU.exe)

find /i "TSWebService_EMCS_WDU.exe" list.txt
::如果进程存在，杀死进程                                           
if "%errorlevel%"=="0" (
::杀掉进程
taskkill /f /im TSWebService_EMCS_WDU.exe)


echo 重启TSServerU
start "" "G:\wanda3\TSServerU.exe"
echo 重启TSWebService_EMCS_WDU
start "" "G:\wanda3\TSWebService_EMCS_WDU.exe"
choice /t 30 /d y /n >nul
echo 重启FDA
start "" "G:\wanda3\FDA.exe"

del list.txt

tasklist >list1.txt

find /i "TSServerU.exe" list1.txt
if "%errorlevel%"=="1" (
echo TSServerU  restart failure
start "" "G:\wanda3\TSServerU.exe")
echo TSServerU restart successful

find /i "TSWebService_EMCS_WDU.exe" list1.txt                                          
if "%errorlevel%"=="1" (
echo TSWebService_EMCS_WDU restart failure
start "" "G:\wanda3\TSWebService_EMCS_WDU.exe")
echo TSWebService_EMCS_WDU restart successful



find /i "FDA.exe" list1.txt
if "%errorlevel%"=="1" (
echo FDA restart failure
start "" "G:\wanda3\FDA.exe") 
echo FDA restart successful




del list1.txt
pause
::exit