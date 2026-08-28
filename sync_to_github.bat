@echo off
setlocal

title DBMS - GitHub Sync

echo.
echo ==========================================
echo       DBMS GitHub Repository Sync
echo ==========================================
echo.

REM ------------------------------------------
REM Configuration
REM ------------------------------------------
set "REPO_URL=https://github.com/OfficiallyEra/DBMS.git"
set "SCRIPT_DIR=%~dp0"

REM Remove trailing backslash from path
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

REM ------------------------------------------
REM Check whether Git is installed
REM ------------------------------------------
where git >nul 2>&1
if errorlevel 1 (
echo [ERROR] Git is not installed or not available in PATH.
echo.
echo Install Git from:
echo https://git-scm.com/download/win
echo.
pause
exit /b 1
)

REM ------------------------------------------
REM Check whether this folder is already a Git repo
REM ------------------------------------------
if not exist "%SCRIPT_DIR%.git" (
echo This local DBMS folder is not yet connected to GitHub.
echo.
echo Initializing repository...

```
cd /d "%SCRIPT_DIR%"

git init

echo.
echo Adding GitHub remote...
git remote add origin "%REPO_URL%"

echo.
echo Fetching GitHub repository...
git fetch origin

echo.
echo Checking remote branches...

git branch -M main

REM Try to connect local repository to the existing GitHub main branch.
git reset --mixed origin/main 2>nul

if errorlevel 1 (
    echo.
    echo [INFO] Could not find an existing main branch.
    echo A new main branch will be created.
)
```

) else (
cd /d "%SCRIPT_DIR%"

```
echo Git repository detected.
```

)

echo.
echo ==========================================
echo Enter your update / commit message
echo ==========================================
echo.

set /p "COMMIT_MESSAGE=Update message: "

if "%COMMIT_MESSAGE%"=="" (
echo.
echo [ERROR] Update message cannot be empty.
pause
exit /b 1
)

echo.
echo ==========================================
echo Synchronizing local folder with GitHub...
echo ==========================================
echo.

cd /d "%SCRIPT_DIR%"

REM ------------------------------------------
REM Make sure origin points to your repository
REM ------------------------------------------
git remote get-url origin >nul 2>&1

if errorlevel 1 (
git remote add origin "%REPO_URL%"
) else (
git remote set-url origin "%REPO_URL%"
)

REM ------------------------------------------
REM Add EVERYTHING in the local folder.
REM Deleted files are also detected by Git.
REM ------------------------------------------
git add -A

echo.
echo ==========================================
echo Changes detected:
echo ==========================================
echo.

git status

echo.
echo ==========================================
echo Creating commit...
echo ==========================================
echo.

git commit -m "%COMMIT_MESSAGE%"

if errorlevel 1 (
echo.
echo [INFO] Nothing new to commit.
echo Your GitHub repository is already up to date.
echo.
pause
exit /b 0
)

echo.
echo ==========================================
echo Pushing changes to GitHub...
echo ==========================================
echo.

git push -u origin main

if errorlevel 1 (
echo.
echo ==========================================
echo [ERROR] Push failed.
echo ==========================================
echo.
echo Possible reasons:
echo 1. You are not authenticated with GitHub.
echo 2. The GitHub repository already contains files
echo    that are not present in your local repository.
echo 3. Your GitHub account does not have write access.
echo 4. The remote branch has changes that need to be pulled.
echo.
pause
exit /b 1
)

echo.
echo ==========================================
echo        SUCCESS!
echo ==========================================
echo.
echo Your local DBMS folder has been synchronized
echo with the GitHub repository.
echo.
echo Repository:
echo %REPO_URL%
echo.
echo Commit message:
echo %COMMIT_MESSAGE%
echo.
pause
endlocal
