@echo off
REM 该命令将列出神创建的命令

REM REM是bat脚本的注释符
REM 转换中文格式以便在控制台打印
chcp 65001 > mul 2>&1

echo 神创建的所有命令：

set "folder=C:\godcmd"

for %%F in ("%folder%\*.bat") do (
    REM echo %%~nxF 输出的脚本名有.bat后缀	
    echo %%~nF
)

echo 输入godview -e 命令名   查看命令使用方式 