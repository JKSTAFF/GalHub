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
title galhub_deployer
:::  ____       _ _   _       _
::: / ___| __ _| | | | |_   _| |__
:::| |  _ / _` | | |_| | | | | '_ \
:::| |_| | (_| | |  _  | |_| | |_) |
::: \____|\__,_|_|_| |_|\__,_|_.__/
:::          Powered by Vector Di-gi
::: ================================
echo.
choice /c /m:"Reflect Savedata Path?(y/N)"
if %errorlevel%==y goto relay
else 
choice /c /m:"Create Game Launcher?(y/N)"
if %errorlevel%==y goto generator
else pause

:relay
set /p host_path=Input Savedata Path For Host:
set /p para_path=Input Savedata Path For Pariasite:
if exist %para_path% (
    move %para_path%\* %host_path%
)else ( md %para_path% )
mklink /d "%para_path%" "%host_path%"
echo Now your game shall occupy other's cloud space.

:generator
set /p para_id=Input RuntimeId For Pariasite:
if exist %~dp0\launcher.bat(ren launcher.bat launcher.bak)
(
    echo @echo off
    echo title galhub_launcher
    echo ^:^:^:   ____       _ _   _       _
    echo ^:^:^:  / ___^| __ _^| ^| ^| ^| ^|_   _^| ^|__
    echo ^:^:^: ^| ^|  _ ^/ _` ^| ^| ^|_^| ^| ^| ^| ^| '_ \
    echo ^:^:^: ^| ^|_^| ^| ^(_^| ^| ^|  _  ^| ^|_^| ^| ^|_^) ^|
    echo ^:^:^:  \____^|\__,_^|_^|_^| ^|_^|\__,_^|_.__/
    echo ^:^:^:          Powered by Vector Di-gi
    echo ^:^:^:=================================
    echo echo.
    echo echo Don't close this console before you quit gameplay!!
    echo start steam://rungameid/%para_id%
    echo ^:sync
    echo ping 127.1 ^>nul -n 100
    echo goto sync
)>>launcher.bat
echo Then you should convert the generated script "launcher.bat" to .exe manually