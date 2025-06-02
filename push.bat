@echo off
cd /d "%~dp0"
echo.
echo [Git Auto Push]
echo -------------------------
echo Enter commit message:
set /p msg="> "
if "%msg%"=="" (
    echo Commit message cannot be empty.
    pause
    exit /b
)
echo.
echo Adding files...
git add .
echo Committing with message: "%msg%"
git commit -m "%msg%"
echo Pushing to GitHub...
git push
echo.
echo Done!
pause
