@echo off
echo.
echo -----------------------------------
echo @Author: muhualing
echo @Github: http://github.com/muhualing/tools/huawei-kunpeng
echo @License: MIT
rem  @time:2019/8/14
echo -----------------------------------

set host=muhualing.ddns.net
set port=6001
echo connecting to: %host%
curl %host%:3978
rem sleep 5s waiting for server to run
ping -n 5 127.0.0.1>null
set encryption=1
call:encrypt %encryption% >nul
set randomName=%random%

pushd %CD%
cd /d "client"
start gameclient.bat 5000 %host% %port%
popd
echo curling remote service and waiting for server and client compete to each other
rem sleep 60s waiting for server and client compete to each other
ping -n 60 127.0.0.1>null
pushd %CD%
echo %CD%
REM call:client %randomName% %host% %port%
curl --header "Content-Type:text/plain" "http://%host%:3978/download/%encryption%.txt" > %CD%\server\replay.txt


:encrypt
@echo off&setlocal EnableDelayedExpansion
:a
set a=abcdefghijklmnopqrstuvwxyz1234567890
set/a b=%random%%%36
set/a c+=1
set Str=%Str%!a:~%b%,1!
if not !c! == 16 goto a
endlocal&set encryption=%Str%
goto:eof

REM :client
REM @echo off
REM pushd %CD%
REM cd /d "client"
REM set defaultName=1002
REM if "%1" == "" echo Team Name: %defaultName%
REM if not "%1" == "" echo Team Name: %1
REM if "%1" == "" call gameclient.bat %defaultName% %2 %3
REM if not "%1" == "" call gameclient.bat %1 %2 %3
REM popd
REM goto:eof