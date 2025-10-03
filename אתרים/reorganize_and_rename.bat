@echo off
setlocal enabledelayedexpansion

echo Reorganizing folders and renaming files...

REM יוצר את תיקיית היעד אם היא לא קיימת
IF NOT EXIST "sites" (
    MKDIR sites
)

REM לולאה שעוברת על כל התיקיות
FOR /d %%d IN (*) DO (
    REM מוודא שלא נטפל בתיקיית sites עצמה
    IF /I NOT "%%d"=="sites" (
        echo Processing folder: "%%d"
        
        REM בודק אם קיים קובץ index.html בתוך התיקייה
        IF EXIST "%%d\index.html" (
            REM מעביר ומשנה את שם הקובץ לשם התיקייה עם סיומת .html
            MOVE "%%d\index.html" "sites\%%d.html"
            
            REM מוחק את התיקייה הריקה שנשארה
            RMDIR "%%d"
        ) ELSE (
            echo   -> Warning: No index.html found in folder "%%d". Skipping.
        )
    )
)

echo.
echo Reorganization complete!
echo All HTML files are now inside the 'sites' folder with new names.
pause