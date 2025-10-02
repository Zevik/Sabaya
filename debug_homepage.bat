@echo off
chcp 65001 >nul
setlocal enableextensions
cd /d "%~dp0"

echo [%DATE% %TIME%] start > debug.log
call "%~dp0\create_homepage.bat" >> debug.log 2>&1
echo [%DATE% %TIME%] ExitCode=%ERRORLEVEL% >> debug.log
notepad debug.log
