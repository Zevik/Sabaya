@echo off
SETLOCAL EnableDelayedExpansion

REM --- Settings ---
SET FILENAME="index.html"
SET SITES_FOLDER="sites"
SET TITLE="Zevik's Project Gallery"

echo Creating main page with corrected code...

REM --- כתיבת החלק הראשון של קובץ ה-HTML עם CSS תקין ---
(
    echo ^<!DOCTYPE html^>
    echo ^<html lang="en"^>
    echo ^<head^>
    echo    ^<meta charset="UTF-8"^>
    echo    ^<title^>%TITLE%^</title^>
    echo    ^<style^>
    echo        body, html { margin: 0; padding: 0; height: 100%; overflow: hidden; }
    echo        iframe { width: 100%; height: 100%; border: none; }
    echo    ^</style^>
    echo ^</head^>
    echo ^<body^>
    echo    ^<iframe id="content-frame" title="Randomly loaded content"^>^</iframe^>
    echo    ^<script^>
    echo        const sites = [
) > %FILENAME%

REM --- לולאה שמוסיפה קבצים ומוודאת ש-index.html לא נכנס לרשימה ---
FOR %%f IN (%SITES_FOLDER%\*.html) DO (
    IF /I NOT "%%~nxf"=="index.html" (
        (echo            "%%~nxf",) >> %FILENAME%
    )
)

REM --- כתיבת סוף קובץ ה-HTML ---
(
    echo        ];
    echo        function loadRandomSite() {
    echo            if (sites.length === 0) return;
    echo            const randomIndex = Math.floor(Math.random() * sites.length);
    echo            const randomSiteFile = sites[randomIndex];
    echo            const sitePath = %SITES_FOLDER% + "/" + randomSiteFile;
    echo            document.getElementById('content-frame').src = sitePath;
    echo        }
    echo        loadRandomSite();
    echo    ^</script^>
    echo ^</body^>
    echo ^</html^>
) >> %FILENAME%

echo.
echo Main page created successfully!
pause```
3.  שמור את הקובץ.
4.  **לחץ לחיצה כפולה** על `create_main_page_FIXED.bat`. הוא ייצור לך קובץ `index.html` חדש ותקין.

**שלב 3: העלאת התיקון ל-GitHub**
*   הרץ את סקריפט ה-`upload.bat` שלך כדי להעלות את קובץ ה-`index.html` המתוקן ואת כל שאר הקבצים.

לאחר שההעלאה תסתיים, המתן דקה או שתיים לעדכון של GitHub Pages, ורענן את הדף. הפעם זה יעבוד