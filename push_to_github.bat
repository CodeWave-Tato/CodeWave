@echo off
chcp 65001 >nul
title CodeWave 一键推送到 GitHub
echo 正在启动推送脚本...
powershell -ExecutionPolicy Bypass -NoProfile -File "%~dp0push_to_github.ps1"
echo.
echo 按任意键关闭窗口...
pause >nul
