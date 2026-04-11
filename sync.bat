@echo off
SET msg=%~1

if "%msg%"=="" (
    echo Error: Please provide a commit message.
    echo Usage: sync.bat "your message here"
    exit /b 1
)

echo Syncing changes to GitHub...
git add . && git commit -m "%msg%" && git push origin main
