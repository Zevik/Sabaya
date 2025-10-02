@echo off
git init
git remote add origin https://github.com/Zevik/Sabaya.git >nul 2>&1
git add .
git commit -m "Restructure project for iframe random content"
git branch -M main
git push -u origin main --force

echo.
echo New structure uploaded successfully!
pause