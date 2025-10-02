@echo off
SETLOCAL EnableDelayedExpansion

REM --- Settings ---
SET FILENAME=index.html
SET TITLE=Random Project

echo Creating random redirect homepage: !FILENAME!...

REM Create the HTML header
echo ^<!DOCTYPE html^> > !FILENAME!
echo ^<html lang="en"^> >> !FILENAME!
echo ^<head^> >> !FILENAME!
echo     ^<meta charset="UTF-8"^> >> !FILENAME!
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> !FILENAME!
echo     ^<title^>!TITLE!^</title^> >> !FILENAME!
echo     ^<script^> >> !FILENAME!
echo         const sites = [ >> !FILENAME!

REM Add all directories to the sites array
SET FIRST=1
FOR /D %%d IN (*) DO (
    IF /I NOT "%%d"=="docs" (
        IF /I NOT "%%d"==".claude" (
            IF /I NOT "%%d"==".git" (
                IF !FIRST!==1 (
                    echo             "%%d/index.html" >> !FILENAME!
                    SET FIRST=0
                ) ELSE (
                    echo             ,"%%d/index.html" >> !FILENAME!
                )
            )
        )
    )
)

REM Complete the JavaScript and HTML
echo         ]; >> !FILENAME!
echo. >> !FILENAME!
echo         const randomSite = sites[Math.floor(Math.random() * sites.length^)]; >> !FILENAME!
echo         window.location.href = randomSite; >> !FILENAME!
echo     ^</script^> >> !FILENAME!
echo ^</head^> >> !FILENAME!
echo ^<body^> >> !FILENAME!
echo     ^<p^>Redirecting to a random project...^</p^> >> !FILENAME!
echo ^</body^> >> !FILENAME!
echo ^</html^> >> !FILENAME!

echo.
echo Random redirect homepage created successfully!
echo The file index.html is ready.
pause
