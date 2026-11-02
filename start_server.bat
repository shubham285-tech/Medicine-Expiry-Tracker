@echo off
title Medical Expiry Tracker 3D - Dev Server
color 0B
cd /d "%~dp0"
echo.
echo  ============================================================
echo   Medical Expiry Tracker 3D  -  Starting Flask Server
echo  ============================================================
echo.

REM Check if Python is available
python --version >nul 2>&1
if errorlevel 1 (
    echo  [ERROR] Python is not installed or not on PATH.
    echo          Download Python 3.10+ from https://www.python.org/downloads/
    pause
    exit /b 1
)

REM Install/verify Flask is available
echo  [SETUP] Checking dependencies...
python -m pip install flask werkzeug --quiet --no-warn-script-location
echo  [SETUP] Dependencies OK.
echo.

REM Start the server (will automatically open http://127.0.0.1:5000 in your browser)
echo  [INFO]  Opening browser and starting server at: http://127.0.0.1:5000
echo  [INFO]  Demo login: admin / admin123
echo  [INFO]  Press Ctrl+C to stop.
echo.

python run.py

pause
