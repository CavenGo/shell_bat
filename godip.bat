@echo off
rem 本命令用于ip操作，依赖于jq，curl工具
chcp 65001 > nul 2>&1

if "%~1"=="" (
    ipconfig /all
    exit /b 0
)

if "%~1"=="?" (
    echo godip    //ipconfig /all
    echo godip -p //public ip
    exit /b 0
)

if "%~1"=="-p" (
    curl -s https://api64.ipify.org?format=json
    exit /b 0
)
