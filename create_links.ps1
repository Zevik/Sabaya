# --- הגדרות ---
$baseUrl = "https://zevik.github.io/Sabaya/"
$outputFile = "links.txt"
$currentPath = $PSScriptRoot

# --- יצירת רשימה להחזקת הקישורים ---
$fileContent = @("Full list of your website links:", "")

# --- לולאה שעוברת על כל התיקיות במיקום הנוכחי ---
Get-ChildItem -Path $currentPath -Directory | ForEach-Object {
    # הוספת הקישור המלא לרשימה
    $link = "$baseUrl$($_.Name)/"
    $fileContent += $link
}

# --- שמירת הרשימה לקובץ טקסט בקידוד נכון (UTF-8) ---
Set-Content -Path (Join-Path $currentPath $outputFile) -Value $fileContent -Encoding UTF8

Write-Host "Success! The links file has been created."
Read-Host "Press ENTER to exit..."