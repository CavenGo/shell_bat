@echo off
REM 此脚本可以查看神创建的脚本功能及用法:  godview -e 需要查看的命令
setlocal enabledelayedexpansion

set "rootDir=C:\godcmd"

if "%~1" == "-e" (
    set "targetFile=%rootDir%\%2.bat"
    echo !targetFile!
    if exist "!targetFile!" (
        set "lineCount=0"
        for /F "usebackq delims=" %%L in ("!targetFile!") do (
            set /A "lineCount+=1"
            if !lineCount! == 2 (
                echo 该命令的使用方式为: %%L
                exit /B
            )
        )
        echo 该命令尚未完善。
    ) else (
        echo 未找到指定的命令。
    )
)

endlocal