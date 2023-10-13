@echo off
rem 本命令用于ip操作，依赖于jq，curl工具
chcp 65001 > nul 2>&1

if "%~1"=="" (
    ipconfig /all
    exit /b 0
)

if "%~1"=="?" (
    echo godhttp   		 //ipconfig /all
    echo godhttp -p 		//public ip
    echo godhttp -get  route  	//Send get request
    echo godhttp -poet route -raw/-param data  	//Send post request,data = `{"key1":"value1","key2":"value2"}`
    echo curl -O URL  or curl -o 文件路径/文件名 URL	//Can be specified for download
    echo curl -T 文件路径 目标URL   //upload
    echo curl -u 用户名:密码 -T 文件路径 目标URL    //if upload need password
    exit /b 0
)

rem 获取公网ip
if "%~1"=="-p" (
    curl -s https://api64.ipify.org?format=json
    exit /b 0
)

if "%~1"=="-get" (
    curl "%~2"
    exit /b 0
)

if "%~1"=="-post" (
    if "%~3"=="-raw" (
        curl -X POST -H "Content-Type: application/json" -d  %~4 "%~2"
    )
    if "%~3"=="-param" (
        curl -X POST -H "Content-Type: application/json" -d  %~4 "%~2"
    )
)