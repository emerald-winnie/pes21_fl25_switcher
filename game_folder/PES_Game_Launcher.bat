@echo off
setlocal enabledelayedexpansion

rem Set default FL25 executable
set FL25_EXE=FL_2025.exe

echo FL25/PES21 Game Launcher
echo ========================
echo.

rem Always launch Sider first
echo Launching Sider...
if exist "SiderAddons\sider.exe" (
    start "" "SiderAddons\sider.exe"
    echo Sider launched successfully!
    echo.
) else (
    echo Warning: SiderAddons\sider.exe not found!
    echo.
)

rem Check which version file exists and launch appropriate game
if exist "currentversion_FL25" (
    echo Found currentversion_FL25 - Launching FL 2025...
    if exist "%FL25_EXE%" (
        start "" "%FL25_EXE%"
        echo FL 2025 launched successfully!
    ) else (
        echo Error: %FL25_EXE% not found!
    )
) else if exist "currentversion_PES21" (
    echo Found currentversion_PES21 - Launching PES2021...
    if exist "PES2021.exe" (
        start "" "PES2021.exe"
        echo PES2021 launched successfully!
    ) else (
        echo Error: PES2021.exe not found!
    )
) else (
    echo Error: Neither currentversion_FL25 nor currentversion_PES21 found!
    echo Cannot determine which game to launch.
)

echo.
echo Launcher completed!
exit /b