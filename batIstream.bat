@echo off
REM 必须要管理员权限启动，该命令可操控鼠标，依赖于nircmd工具包


chcp 65001 > nul 2>&1
if "%~1"=="" (
REM 设置循环次数，这里将其设置为一个很大的值
set num_clicks=999999999

REM 循环执行鼠标左键点击
for /L %%i in (1,1,%num_clicks%) do (
    echo Performing click %%i
    nircmd sendmouse left click
)
    nircmd sendmouse left click
    exit /b 0
)

if "%~1"=="?" (
    echo 不带参数让鼠标以所处位置疯狂点击，Crtl 停止
    exit /b 0
)