@echo off
rem 进行防火墙操作，需要要启动管理员终端执行
chcp 65001 > nul 2>&1

if "%~1"=="?" (
    echo godfirewall -s on   //open firewall
    echo godfirewall -s off  //close firewall
    exit /b 0
)

if "%~1"=="-s" (
    if "%~2"=="off" (
    netsh advfirewall set allprofiles state off
    exit /b 0
    )
    if "%~2"=="on" (
    netsh advfirewall set allprofiles state on
    exit /b 0
    )
)
