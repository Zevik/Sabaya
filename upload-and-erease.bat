@echo off
SET GITHUB_USERNAME=Zevik
SET REPOSITORY_NAME=Sabaya

echo Initializing repository and adding all files...
git init
git add .

echo Creating a new commit...
git commit -m "Final version with English folder names"

echo Connecting to the remote repository...
git remote add origin https://github.com/%GITHUB_USERNAME%/%REPOSITORY_NAME%.git >nul 2>&1
git branch -M main

echo.
echo Forcing the update to GitHub. This will delete the old Hebrew folders...
git push -u origin main --force

echo.
echo Update complete! Your GitHub repository is now clean.
pause