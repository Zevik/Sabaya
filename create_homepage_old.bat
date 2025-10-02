@echo off
SETLOCAL EnableDelayedExpansion

REM --- Settings (English Only) ---
SET FILENAME=index.html
SET TITLE=My Project Gallery
SET HEADLINE=My Project Gallery

echo Creating the homepage file: !FILENAME!...

echo ^<!DOCTYPE html^> > !FILENAME!
echo ^<html lang="en"^> >> !FILENAME!
echo ^<head^> >> !FILENAME!
echo    ^<meta charset="UTF-8"^> >> !FILENAME!
echo    ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> !FILENAME!
echo    ^<title^>!TITLE!^</title^> >> !FILENAME!
echo    ^<style^> >> !FILENAME!
echo        body { font-family: sans-serif; background-color: #f4f4f9; color: #333; margin: 0; padding: 20px; } >> !FILENAME!
echo        .container { max-width: 1200px; margin: 0 auto; } >> !FILENAME!
echo        h1 { color: #444; text-align: center; border-bottom: 2px solid #ddd; padding-bottom: 10px; } >> !FILENAME!
echo        .link-list { list-style-type: none; padding: 0; display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr^)^); gap: 15px; } >> !FILENAME!
echo        .link-list li a { display: block; background-color: #ffffff; color: #0056b3; text-decoration: none; padding: 15px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1^); transition: transform 0.2s, box-shadow 0.2s; } >> !FILENAME!
echo        .link-list li a:hover { transform: translateY(-5px^); box-shadow: 0 4px 10px rgba(0,0,0,0.15^); background-color: #eef; } >> !FILENAME!
echo    ^</style^> >> !FILENAME!
echo ^</head^> >> !FILENAME!
echo ^<body^> >> !FILENAME!
echo    ^<div class="container"^> >> !FILENAME!
echo        ^<h1^>!HEADLINE!^</h1^> >> !FILENAME!
echo        ^<ul class="link-list"^> >> !FILENAME!

FOR /D %%d IN (*) DO (
    IF /I NOT "%%d"=="docs" (
        IF /I NOT "%%d"==".claude" (
            IF /I NOT "%%d"==".git" (
                echo            ^<li^>^<a href="%%d/index.html"^>%%d^</a^>^</li^> >> !FILENAME!
            )
        )
    )
)

echo        ^</ul^> >> !FILENAME!
echo    ^</div^> >> !FILENAME!
echo ^</body^> >> !FILENAME!
echo ^</html^> >> !FILENAME!

echo.
echo Homepage created successfully!
echo The file index.html is ready.
pause
