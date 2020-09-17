

Created by ms__dos.
Thanks for using!


@echo off
title OTC Loader
set currentver=1.0.0

if exist %temp%\au.otc goto checkau

:doesntexist
cls
echo Would you like to enable autoupdates? (Y/N)
set /p autoupdate=">"
cd %temp%
echo %autoupdate% >au.otc
cls
goto start

:checkau
cls
set /p auvalue=< %temp%\au.otc
if %auvalue%==y goto check4update
if %auvalue%==Y goto check4update
if %auvalue%==N goto start
if %auvalue%==n goto start

:check4update
cls
echo Checking for updates...
cd %temp%
powershell (New-Object Net.WebClient).DownloadFile('https://github.com/stc208/otc/releases/download/0/latest.tmp', 'latestver.tmp')
set /p latestversion=< %temp%\latestver.tmp
if %currentver%==%latestversion% goto start
cls
echo You do not have the latest version!
echo Download the latest version now? (Y/N)
set /p downloadlatest=">"
if %downloadlatest%==y goto downloadnew
if %downloadlatest%==Y goto downloadnew
if %downloadlatest%==n goto start
if %downloadlatest%==N goto start

:downloadnew
cls
cd %~dp0
cls
echo Downloading...
powershell (New-Object Net.WebClient).DownloadFile('https://github.com/stc208/otc/releases/download/0/newest.bat', 'Latest.bat')
cls
color 04
echo Downloaded latest version!
echo Check the folder you have this file in.
echo After closing, please go ahead and delete this file.
echo (Press any key to exit.)
pause >nul
goto END


:start
cd %temp%
del latestver.tmp
cls
echo Welcome to the OTC Loader.
echo What would you like to do?
echo.
echo 1 = Load OTC v3
echo 2 = Load OTC v2
echo 3 = Extras
echo.
set /p ver=">"
if %ver%==3 goto extras
if %ver%==2 goto v2
if %ver%==1 goto v3
goto start

:v2
cd %temp%
cls
color 02
echo Please wait...
powershell (New-Object Net.WebClient).DownloadFile('https://github.com/stc208/otc/releases/download/0/OTC.v2.dll', 'otc.tmp')
powershell (New-Object Net.WebClient).DownloadFile('https://github.com/stc208/otc/releases/download/0/ManualInjector.exe', 'tmp.exe')
start tmp.exe
timeout /t 3 >nul
taskkill /f /im tmp.exe
del otc.tmp
del tmp.exe
cls
color 04
echo Injected, have fun!
echo (Press any key to exit)
pause >nul
goto END

:v3
cd %temp%
cls
color 02
echo Please wait...
powershell (New-Object Net.WebClient).DownloadFile('https://github.com/stc208/otc/releases/download/0/OTC.v3.dll', 'otc.tmp')
powershell (New-Object Net.WebClient).DownloadFile('https://github.com/stc208/otc/releases/download/0/ManualInjector.exe', 'tmp.exe')
start tmp.exe
timeout /t 3 >nul
taskkill /f /im tmp.exe
del otc.tmp
del tmp.exe
cls
color 04
echo Injected, have fun!
echo (Press any key to exit)
pause >nul
goto END

:extras
cls
echo Welcome to the extras!
echo What would you like to do?
echo.
echo 1 = Download OTC v3 Dll
echo 2 = Download OTC v2 Dll
echo 3 = Download Injector (Xenos)
echo 4 = Change Autoupdate
echo.
set /p extraxd=">"
if %extraxd%==1 goto dlv3
if %extraxd%==2 goto dlv2
if %extraxd%==3 goto dlinj
if %extraxd%==4 goto changeau
goto extras

:dlv3
cd %~dp0
cls
color 02
echo Please wait, downloading...
powershell (New-Object Net.WebClient).DownloadFile('https://github.com/stc208/otc/releases/download/0/OTC.v3.dll', 'OTCv3.dll')
cls
color 04
echo The OTC v3 dll has been downloaded to the folder you have this file in.
echo Have fun!
echo (Press any key to exit)
pause >nul
goto END

:dlv2
cd %~dp0
cls
color 02
echo Please wait, downloading...
powershell (New-Object Net.WebClient).DownloadFile('https://github.com/stc208/otc/releases/download/0/OTC.v2.dll', 'OTCv2.dll')
cls
color 04
echo The OTC v2 dll has been downloaded to the folder you have this file in.
echo Have fun!
echo (Press any key to exit)
pause >nul
goto END

:dlinj
cd %~dp0
cls
color 02
echo Please wait, downloading...
powershell (New-Object Net.WebClient).DownloadFile('https://github.com/stc208/otc/releases/download/0/Xenos.exe', 'XenosInjector.exe')
cls
color 04
echo Xenos has been downloaded to the folder you have this file in.
echo Have fun!
echo (Press any key to exit)
pause >nul
goto END

:changeau
cls
echo Would you like to enable autoupdates? (Y/N)
set /p autoupdateNEW=">"
cd %temp%
del au.otc
echo %autoupdateNEW% >au.otc
cls
goto END

:END






