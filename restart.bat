@ECHO OFF                                                                                                  
::�����н�����Ϣ����list.txt�ļ����棨����Ĭ�ϵ�ǰĿ¼��
tasklist >list.txt
::��list.txt�ļ�������������
::type list.txt


find /i "FDA.exe" list.txt
::������̴��ڣ�ɱ������                                           
if "%errorlevel%"=="0" (
::ɱ������
taskkill /f /im FDA.exe)

find /i "TSServerU.exe" list.txt
::������̴��ڣ�ɱ������
if "%errorlevel%"=="0" (
taskkill /f /im TSServerU.exe)

find /i "TSWebService_EMCS_WDU.exe" list.txt
::������̴��ڣ�ɱ������                                           
if "%errorlevel%"=="0" (
::ɱ������
taskkill /f /im TSWebService_EMCS_WDU.exe)


echo ����TSServerU
start "" "G:\wanda3\TSServerU.exe"
echo ����TSWebService_EMCS_WDU
start "" "G:\wanda3\TSWebService_EMCS_WDU.exe"
choice /t 30 /d y /n >nul
echo ����FDA
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