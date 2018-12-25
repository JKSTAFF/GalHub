@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
title brandnew_deploy
:::  ____       _ _   _       _
::: / ___| __ _| | | | |_   _| |__
:::| |  _ / _` | | |_| | | | | '_ \
:::| |_| | (_| | |  _  | |_| | |_) |
::: \____|\__,_|_|_| |_|\__,_|_.__/
:::                  brandnew_deploy
::: ================================
set /p host_path=Input savedata path for host:
set /p para_path=Input savedata path for pariasite:
if exist %para_path% (
    move %para_path%\* %host_path%
)else ( md %para_path% )
mklink /d "%para_path%" "%host_path%"
echo Deployed once for all
pause