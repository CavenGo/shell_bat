@echo off
rem 必须要管理员权限启动，该命令可改变cmd命令行字体颜色
chcp 65001 > nul 2>&1
setlocal enabledelayedexpansion

rem 获取命令行参数
rem set "command=%~1"
rem set "value=%~2"
rem set "command2=%~3"
rem set "value2=%~4"

if "%~1"== "?" (
    echo 	0  = Black       8  = Gray
    echo 	1  = Blue        9  = Light Blue
    echo 	2  = Green       10 = Light Green
    echo 	3  = Aqua        11 = Light Aqua
    echo 	4  = Red         12 = Light Red
    echo 	5  = Purple      13 = Light Purple
    echo 	6  = Yellow      14 = Light Yellow
    echo 	7  = White       15 = Bright White
    exit /b 0 
)

if "%~1"=="-c" (
    rem 检查颜色值是否在有效范围内
    if %~2 lss 0 (
      echo 请输入godcolor ? 获取正确的参数
      exit /b 1
    )
    if %~2 gtr 15 (
      echo 请输入godcolor ? 获取正确的参数
      exit /b 1
    )
    
    rem 检查是否以管理员权限运行
    net session >nul 2>&1
    if %errorLevel% equ 0 (
      rem 修改注册表值
      reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor" /v DefaultColor /t REG_DWORD /d %~2 /f
      echo 请重启终端以使更改生效
      exit /b 0
    ) else (
      echo 请以管理员权限运行此命令
      exit /b 1
    )
)

rem 如果命令输入不正确，显示用法提示
echo 用法: color -c 颜色_英文
exit /b 1