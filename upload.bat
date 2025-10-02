@echo off
REM --- הגדרות ---
SET GITHUB_USERNAME=Zevik
SET REPOSITORY_NAME=Sabaya

REM --- אתחול מאגר Git מקומי ---
echo Initializing Git repository...
git init

REM --- הוספת כל הקבצים למעקב ---
git add .

REM --- יצירת קומיט ---
git commit -m "Upload 150 HTML sites"

REM --- קישור למאגר המרוחק ב-GitHub ---
REM בודק אם ה-remote כבר קיים, ואם לא, מוסיף אותו
git remote add origin https://github.com/%GITHUB_USERNAME%/%REPOSITORY_NAME%.git >nul 2>&1

REM --- הגדרת הענף הראשי לשם main ---
git branch -M main

REM --- דחיפת הקבצים ל-GitHub ---
echo Pushing files to GitHub...
git push -u origin main

echo.
echo Upload complete! The files were pushed to Zevik/Sabaya repository.
pause