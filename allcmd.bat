@echo off
REM 此脚本将列出当前终端的所有可执行命令，建议不要使用这个命令，命令数量太多了
echo 当前终端的所有可用命令：

REM 获取 cmd 命令列表
echo CMD:
tree /F "%SystemRoot%\System32"

REM 获取 PowerShell 命令列表
echo PowerShell:
powershell -command "Get-Command | Format-Wide -Column 1"