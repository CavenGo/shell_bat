@echo off
REM 此脚本可以查看神创建的脚本功能及用法:  godview -e 需要查看的命令
if "%~1"=="" (
    echo 请输入godview ?获取参数
    exit /b 0
)

setlocal enabledelayedexpansion


set "rootDir=C:\shell_windows"
if "%~1" == "?" (
    echo -e bat.name  //view script discript 
    echo -fp file.name //view file permison
)

if "%~1" == "-e" (
    set "targetFile=%rootDir%\%2.bat"
    if exist "!targetFile!" (
        set "lineCount=0"
        for /F "usebackq delims=" %%L in ("!targetFile!") do (
            set /A "lineCount+=1"
            if !lineCount! == 2 (
                echo !targetFile!
                echo %%L
                exit /B
            )
        )
        echo 该命令尚未完善。
    ) else (
        echo 未找到指定的命令。
    )
)

endlocal