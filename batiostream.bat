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
rem    nircmd sendmouse left click
    exit /b 0
)

if "%~1"=="?" (
    echo 不带参数让鼠标以所处位置疯狂点击，Crtl 停止
    echo nircmd可以进行系统管理、桌面操作、文件操作、网络操作等
    echo https://blog.csdn.net/hongkaihua1987/article/details/85050851 查看nircmd详细用法
    exit /b 0
)