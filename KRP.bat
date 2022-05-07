@echo off
echo Kaspersky Lab Password Reset v1.0
REM Kaspersky Lab Password Reset v1.0
REM By Hoang Gia Bao

setlocal ENABLEEXTENSIONS
setlocal enabledelayedexpansion

set VALUEA_NAME="EnablePswrdProtect"
set VALUEB_NAME="OPEP"
set VALUEC_NAME="OPEPSALT"
set VALUED_NAME="PLogin"
set KEY_NAME="chiave"
set KEY_NAME2="chiave2"
set PRODUCT="product"

REM SETTING UP ERRORS
set p01=Product version found: 
set p02=The operation completed successfully!
set p03=Error 404: Product not found, please contact Technical Support.
set p04=Error 5: Permission denied, please be sure to run this file in Safe-Mode.
set p05=Error 1: Permission denied, right-click on the file and choose "Run as Administrator".
    

REM FINDING YOUR INSTALLED KASPERSKY PRODUCT:

REM AVP21MR4_x86
set PRODUCT=21.4 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP21.4\settings\PasswordProtectionSettings" 
REG QUERY !KEY_NAME! /v !VALUEB_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist21

REM AVP21MR4_x64
set PRODUCT=21.4 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP21.4\settings\PasswordProtectionSettings" 
REG QUERY !KEY_NAME! /v !VALUEB_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist21

REM AVP21MR3_x86
set PRODUCT=21.3 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP21.3\settings\PasswordProtectionSettings" 
REG QUERY !KEY_NAME! /v !VALUEB_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist21

REM AVP21MR3_x64
set PRODUCT=21.3 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP21.3\settings\PasswordProtectionSettings" 
REG QUERY !KEY_NAME! /v !VALUEB_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist21

REM AVP21MR2_x86
set PRODUCT=21.2 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP21.2\settings\PasswordProtectionSettings" 
REG QUERY !KEY_NAME! /v !VALUEB_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist21

REM AVP21MR2_x64
set PRODUCT=21.2 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP21.2\settings\PasswordProtectionSettings" 
REG QUERY !KEY_NAME! /v !VALUEB_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist21

REM AVP21MR1_x86
set PRODUCT=21.1 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP21.1\settings"
set KEY_NAME2="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP21.1\Data\FlushedMsiCriticalSettings"
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist20

REM AVP21MR1_x64
set PRODUCT=21.1 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP21.1\settings"
set KEY_NAME2="HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\KasperskyLab\AVP21.1\Data\FlushedMsiCriticalSettings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist20

REM AVP21MR0_x86
set PRODUCT=21.0 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP21.0\settings"
set KEY_NAME2="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP21.0\Data\FlushedMsiCriticalSettings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist20

REM AVP21MR0_x64
set PRODUCT=21.0 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP21.0\settings"
set KEY_NAME2="HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\KasperskyLab\AVP20.0\Data\FlushedMsiCriticalSettings"  
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist20

REM AVP20MR0_x86
set PRODUCT=20.0 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP20.0\settings"
set KEY_NAME2="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP20.0\Data\FlushedMsiCriticalSettings"  
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist20

REM AVP20MR0_x64
set PRODUCT=20.0 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP20.0\settings" 
set KEY_NAME2="HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\KasperskyLab\AVP20.0\Data\FlushedMsiCriticalSettings"  
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist20

REM AVP19MR1_x86
set PRODUCT=19.0.1 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP19.0.1\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP19MR1_x64
set PRODUCT=19.0.1 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP19.0.1\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP19MR0_x86
set PRODUCT=19.0.0 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP19.0.0\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP19MR0_x64
set PRODUCT=19.0.0 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP19.0.0\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP18MR3_x86
set PRODUCT=18.0.3 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP18.0.3\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP18MR3_x64
set PRODUCT=18.0.3 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP18.0.3\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP18MR2_x86
set PRODUCT=18.0.2 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP18.0.2\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP18MR2_x64
set PRODUCT=18.0.2 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP18.0.2\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP18MR1_x86
set PRODUCT=18.0.1 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP18.0.1\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP18MR1_x64
set PRODUCT=18.0.1 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP18.0.1\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP18MR0_x86
set PRODUCT=18.0.0 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP18.0.0\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP18MR0_x64
set PRODUCT=18.0.0 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP18.0.0\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP17MR3_x86
set PRODUCT=17.0.3 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP17.0.3\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP17MR3_x64
set PRODUCT=17.0.3 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP17.0.3\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP17MR2_x86
set PRODUCT=17.0.2 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP17.0.2\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP17MR2_x64
set PRODUCT=17.0.2 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP17.0.2\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP17MR1_x86
set PRODUCT=17.0.1 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP17.0.1\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP17MR1_x64
set PRODUCT=17.0.1 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP17.0.1\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP17MR0_x86
set PRODUCT=17.0.0 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP17.0.0\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP17MR0_x64
set PRODUCT=17.0.0 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP17.0.0\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP16MR3_x86
set PRODUCT=16.0.3 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP16.0.3\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP16MR3_x64
set PRODUCT=16.0.3 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP16.0.3\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP16MR2_x86
set PRODUCT=16.0.2 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP16.0.2\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP16MR2_x64
set PRODUCT=16.0.2 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP16.0.2\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP16MR1_x86
set PRODUCT=16.0.1 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP16.0.1\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP16MR1_x64
set PRODUCT=16.0.1 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP16.0.1\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP16MR0_x86
set PRODUCT=16.0.0 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP16.0.0\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP16MR0_x64
set PRODUCT=16.0.0 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP16.0.0\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP15MR2_x86
set PRODUCT=15.0.2.361 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP15.0.2\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP15MR2_x64
set PRODUCT=15.0.2.361 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP15.0.2\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP15MR1_x86
set PRODUCT=15.0.1.415 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP15.0.1\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP15MR1_x64
set PRODUCT=15.0.1.415 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP15.0.1\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP15MR0_x86
set PRODUCT=15.0.0.463 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP15.0.0\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP15MR0_x64
set PRODUCT=15.0.0.463 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP15.0.0\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP14_x86
set PRODUCT=14.0.0.4651 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\protected\AVP14.0.0\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM AVP14_x64
set PRODUCT=14.0.0.4651 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\protected\AVP14.0.0\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM KSOS13_x86
set PRODUCT=2013 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\protected\KSOS13\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM KSOS13_x64
set PRODUCT=2013 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\protected\KSOS13\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

REM PURE3_x86
set PRODUCT=2013 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\protected\PURE13\settings"
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1
if %errorlevel%==0 goto Rexist

REM PURE3_x64
set PRODUCT=2013 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\protected\PURE13\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1
if %errorlevel%==0 goto Rexist

REM AVP13_x86
set PRODUCT=2013 x86
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\protected\AVP13\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1
if %errorlevel%==0 goto Rexist

REM AVP13_x64
set PRODUCT=2013 x64
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\protected\AVP13\settings" 
REG QUERY !KEY_NAME! /v !VALUEA_NAME! >nul 2>&1 
if %errorlevel%==0 goto Rexist

echo %p03%
goto Done

:Rexist
echo %p01% !PRODUCT!
REG ADD !KEY_NAME! /v !VALUEA_NAME! /t REG_DWORD /d "0" /f >nul 2>&1
if %errorlevel%==1 goto Denied 
REG ADD !KEY_NAME! /v !VALUEB_NAME! /t REG_SZ /d "" /f >nul 2>&1
if %errorlevel%==1 goto Denied 
if %errorlevel%==0 echo %p02%
goto Done

:Rexist20
echo %p01% !PRODUCT!
REG ADD !KEY_NAME! /v !VALUEA_NAME! /t REG_DWORD /d "0" /f >nul 2>&1
if %errorlevel%==1 goto Denied 
REG ADD !KEY_NAME! /v !VALUEB_NAME! /t REG_SZ /d "" /f >nul 2>&1
if %errorlevel%==1 goto Denied 
REG ADD !KEY_NAME2! /v !VALUEA_NAME! /t REG_DWORD /d "0" /f >nul 2>&1
if %errorlevel%==1 goto Denied 
REG ADD !KEY_NAME2! /v !VALUEB_NAME! /t REG_SZ /d "" /f >nul 2>&1
if %errorlevel%==1 goto Denied 
if %errorlevel%==0 echo %p02%
goto Done

:Rexist21
echo %p01% !PRODUCT!
REG ADD !KEY_NAME! /v !VALUEB_NAME! /t REG_SZ /d "" /f >nul 2>&1
if %errorlevel%==1 goto Denied 
REG ADD !KEY_NAME! /v !VALUEC_NAME! /t REG_SZ /d "" /f >nul 2>&1
if %errorlevel%==1 goto Denied 
REG ADD !KEY_NAME! /v !VALUED_NAME! /t REG_SZ /d "KLAdmin" /f >nul 2>&1
if %errorlevel%==1 goto Denied 
if %errorlevel%==0 echo %p02%
goto Done

:Denied
echo %p04%

:Done
pause