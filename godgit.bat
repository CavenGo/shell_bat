@echo off
rem 一键上传至github，godgit ? 查看使用方法

chcp 65001 > nul 2>&1
setlocal enabledelayedexpansion

rem 获取命令行参数
set "command=%~1"
set "value=%~2"
set "command1=%~3"
set "value1=%~4"

if "%command%"== "?" (
    echo godgit -b branch -m commit  //已绑定远程仓库且已有分支
    echo godgit -r remote -b branch   //第一次上传
    exit /b 0
)

if "%command%"== "-b" (
    if "%command1%"== "-m" (	
        git add .
        git commit -m "%value1%"
        git push -u origin %value%
        exit /b 0
    )
)

if "%command%"== "-r" (	
    if "%command1%"== "-b" (	
        git init
        git add .
        git commit -m "初始化"
        git branch -M %value1%
        git remote add
        git remote add origin %value%
	git push -u origin %value1%
        exit /b 0
    )
)