@echo off
setlocal enabledelayedexpansion

echo Starting to organize HTML files...
echo.

REM לולאה שעוברת על כל קובץ עם סיומת .html
FOR %%f IN (*.html) DO (
    REM לוקח את שם הקובץ ללא הסיומת
    SET FOLDER_NAME=%%~nf
    
    echo Processing file: "%%f"
    
    REM יוצר תיקייה עם שם הקובץ
    MKDIR "!FOLDER_NAME!"
    
    REM מעביר את הקובץ לתוך התיקייה החדשה
    MOVE "%%f" "!FOLDER_NAME!\"
    
    REM משנה את שם הקובץ ל-index.html
    REN "!FOLDER_NAME!\%%f" "index.html"
    
    echo   -> Created folder "!FOLDER_NAME!" and renamed file to index.html
    echo.
)

echo Organization complete!
pause