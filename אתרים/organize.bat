@echo off
setlocal enabledelayedexpansion
chcp 65001 > nul

FOR %%f IN (*.html) DO (
    SET FOLDER_NAME=%%~nf
    MKDIR "!FOLDER_NAME!"
    MOVE "%%f" "!FOLDER_NAME!\index.html"
)

echo Organization complete!
pause