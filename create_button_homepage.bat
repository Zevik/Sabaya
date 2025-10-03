@echo off
SETLOCAL EnableDelayedExpansion

REM --- Settings ---
SET FILENAME="index.html"
SET SITES_FOLDER="sites"
SET TITLE="Zevik's Project Gallery"

echo Creating a new homepage with buttons...

REM --- כתיבת החלק הראשון של קובץ ה-HTML (כולל עיצוב) ---
(
    echo ^<!DOCTYPE html^>
    echo ^<html lang="en"^>
    echo ^<head^>
    echo    ^<meta charset="UTF-8"^>
    echo    ^<title^>%TITLE%^</title^>
    echo    ^<style^>
    echo        body, html { margin: 0; padding: 0; height: 100vh; font-family: sans-serif; display: flex; flex-direction: column; background-color: #f0f2f5; }
    echo        .header { padding: 15px; text-align: center; background-color: #fff; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
    echo        .button-container { display: flex; flex-wrap: wrap; justify-content: center; gap: 10px; padding: 15px; background-color: #fff; border-bottom: 1px solid #ddd; max-height: 25vh; overflow-y: auto; }
    echo        .button-container button { padding: 8px 15px; font-size: 14px; cursor: pointer; border: 1px solid #ccc; border-radius: 20px; background-color: #f9f9f9; transition: background-color 0.2s, color 0.2s; }
    echo        .button-container button:hover { background-color: #007bff; color: white; border-color: #007bff; }
    echo        .iframe-container { flex-grow: 1; }
    echo        iframe { width: 100%; height: 100%; border: none; }
    echo    ^</style^>
    echo ^</head^>
    echo ^<body^>
    echo    ^<div class="header"^>^<h1 style="margin:0;"^>%TITLE%^</h1^>^</div^>
    echo    ^<div class="button-container"^>
) > %FILENAME%

REM --- לולאה שמוסיפה כפתור לכל קובץ ---
FOR %%f IN (%SITES_FOLDER%\*.html) DO (
    (echo            ^<button onclick="loadSite('%%~nxf')"^>%%~nf^</button^>) >> %FILENAME%
)

REM --- כתיבת סוף קובץ ה-HTML (כולל ה-iframe וה-JavaScript) ---
(
    echo    ^</div^>
    echo    ^<div class="iframe-container"^>
    echo        ^<iframe id="content-frame" title="Loaded content"^>^</iframe^>
    echo    ^</div^>
    echo    ^<script^>
    echo        const sites = [
) >> %FILENAME%

REM --- לולאה שמוסיפה את כל שמות הקבצים למערך JavaScript ---
FOR %%f IN (%SITES_FOLDER%\*.html) DO (
    (echo            "%%~nxf",) >> %FILENAME%
)

(
    echo        ];
    echo        function loadSite(fileName) {
    echo            const sitePath = %SITES_FOLDER% + "/" + fileName;
    echo            document.getElementById('content-frame').src = sitePath;
    echo        }
    echo        function loadRandomSite() {
    echo            if (sites.length === 0) return;
    echo            const randomIndex = Math.floor(Math.random() * sites.length);
    echo            const randomSiteFile = sites[randomIndex];
    echo            loadSite(randomSiteFile);
    echo        }
    echo        /* Load a random site on initial page load */
    echo        loadRandomSite();
    echo    ^</script^>
    echo ^</body^>
    echo ^</html^>
) >> %FILENAME%

echo.
echo Button homepage created successfully!
pause