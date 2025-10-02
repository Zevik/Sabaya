@echo off

REM --- Settings ---
SET BASE_URL=https://zevik.github.io/Sabaya/
SET OUTPUT_FILE=links.txt

echo.
echo Starting to create the links list...
echo.

REM Deletes the old links file if it exists
IF EXIST "%OUTPUT_FILE%" (
    DEL "%OUTPUT_FILE%"
)

REM Creates the output file and adds a title
echo Full list of your website links: > "%OUTPUT_FILE%"
echo. >> "%OUTPUT_FILE%"

REM Loops through all directories in the current location
FOR /D %%d IN (*) DO (
    REM Appends the full link to the text file
    echo %BASE_URL%%%d/ >> "%OUTPUT_FILE%"
)

echo.
echo Process complete!
echo The full list has been saved in the file: %OUTPUT_FILE%
echo.
pause