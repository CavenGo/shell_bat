@echo off
rem 一键上传至github，godgit ? 查看使用方法

chcp 65001 > nul 2>&1
setlocal enabledelayedexpansion

rem 获取命令行参数
set "command=%~1"
set "value=%~2"

if "%command%"== "?" (
    echo -g 选择上传的分支
    exit /b 0
)

if "%command%"== "-g" (	
    git add .
    git commit -m "优化"
    git push -u origin %value%
    echo 上传完毕
    exit /b 0
)