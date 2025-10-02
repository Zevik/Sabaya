@echo off
setlocal enabledelayedexpansion

echo Reorganizing folder structure for iframe setup...

REM יוצר את תיקיית היעד
MKDIR sites

REM לולאה שעוברת על כל התיקיות
FOR /d %%d IN (*) DO (
    REM מוודא שלא נטפל בתיקיית sites החדשה
    IF /I NOT "%%d"=="sites" (
        echo Processing folder: "%%d"
        
        REM מעביר ומשנה את שם הקובץ index.html לשם התיקייה עם סיומת .html
        MOVE "%%d\index.html" "sites\%%d.html"
        
        REM מוחק את התיקייה הריקה שנשארה
        RMDIR "%%d"
    )
)

echo.
echo Reorganization complete!
echo All HTML files are now inside the 'sites' folder.
pause