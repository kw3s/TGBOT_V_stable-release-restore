@echo off
echo ========================================
echo Updating GitHub Repository
echo ========================================
echo.

cd /d "%~dp0"

echo Checking if git is initialized...
if not exist .git (
    echo Initializing git repository...
    git init
    git branch -M main
    echo.
)

echo Setting remote origin...
git remote remove origin 2>nul
git remote add origin https://github.com/kw3s/TGBOT_V_stable-release-restore.git

echo.
echo Adding all files...
git add .

echo.
echo Committing changes...
git commit -m "feat: Add /logs command and fix link processing" -m "- Added circular buffer logging system (lib/logger.js)" -m "- Added /logs command for admin debugging" -m "- Fixed DSP link processing (HTML entities, en-dash support)" -m "- Added Apple Music specific pattern handling" -m "- Cleaned error messages" -m "- Added 'he' dependency for HTML decoding"

echo.
echo Pushing to GitHub...
git push -u origin main --force

echo.
echo ========================================
echo Done! Repository updated.
echo ========================================
echo.
echo Your GitHub repo: https://github.com/kw3s/TGBOT_V_stable-release-restore
echo Vercel will auto-deploy from GitHub!
echo ========================================
pause
