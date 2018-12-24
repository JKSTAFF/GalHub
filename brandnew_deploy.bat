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
:::  __  __  _       _        _   _            _
::: |  \/  || |     / \   ___| |_(_)_   ____ _| |_ ___  _ __
::: | |\/| / __)   / _ \ / __| __| \ \ / / _` | __/ _ \| '__|
::: | |  | \__ \  / ___ \ (__| |_| |\ V / (_| | || (_) | |
::: |_|  |_(   / /_/   \_\___|\__|_| \_/ \__,_|\__\___/|_|
:::         |_|                       Powered by Vector Di-gi
::: =========================================================
set /p host=Input host_path:
set /p para=Input parasite_path:

if exist %para% (move %para%\* %host%)
mklink /d "%para%" "%host%"

pause
