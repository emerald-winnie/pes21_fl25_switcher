@echo off
setlocal EnableDelayedExpansion

:: ======================================
:: Switch Save and Data Files to PES21 Only
:: Checks version marker to determine action
:: ======================================

:: --- Configuration ---
set "cpk_files_to_version=dt00_4K_x64.cpk dt00_x64.cpk dt10_x64.cpk dt11_4K_x64.cpk dt11_x64.cpk dt12_g4.cpk dt13_all.cpk dt14_all.cpk dt15_x64.cpk dt16_all.cpk dt17_x64.cpk dt18_all.cpk dt19_x64.cpk dt20_eng_x64.cpk dt20_use_x64.cpk dt30_g4.cpk dt32_g4.cpk dt33_g4.cpk dt34_g4.cpk dt35_g4.cpk dt36_g4.cpk dt40_all.cpk dt41_eng_all.cpk dt41_jpn_all.cpk dt42_all.cpk dt43_eng_all.cpk dt43_jpn_all.cpk dt44_all.cpk dt70_x64.cpk"

set "save_file_basenames=EDIT00000000 FILELIST00000000 GRAPHICS000000 ML00000000 SYSTEM00000000"

set "current_script_dir=%~dp0"

set "docs_root=%USERPROFILE%\Documents"
if exist "%USERPROFILE%\OneDrive\Documents" (
    set "docs_root=%USERPROFILE%\OneDrive\Documents"
)

set "docs_save_path=%docs_root%\KONAMI\eFootball PES 2021 SEASON UPDATE\76561197990587099\save"

:: --- End Configuration ---


:: --- Step 0: Check version marker ---
if exist "%current_script_dir%currentversion_PES21" (
    echo Current version is already PES21. No changes needed.
    goto :launch_game
) else if not exist "%current_script_dir%currentversion_FL25" (
    echo ERROR: No currentversion marker found for PES21 or FL25.
    echo Please make sure one of the marker files exists.
    pause
    exit /b
) else (
    echo Current version: FL25. Switching files to PES21...
)

:: --- Step 1: Update version marker ---
ren "%current_script_dir%currentversion_FL25" "currentversion_PES21"
echo Updated version marker: FL25 → PES21

:: --- Step 2: Rename .cpk files in /data folder ---
if exist "%current_script_dir%data" (
    pushd "%current_script_dir%data"
    :: Backup FL25 .cpk files by renaming to .fl25_cpk
    for %%f in (%cpk_files_to_version%) do (
        if exist "%%f" (
            ren "%%f" "%%~nf.fl25_cpk"
            echo Backed up: %%f → %%~nf.fl25_cpk
        )
    )
    :: Restore PES21 .cpk files by renaming .pes21_cpk to .cpk
    for %%f in (*.pes21_cpk) do (
        if exist "%%f" (
            ren "%%f" "%%~nf.cpk"
            echo Restored: %%f → %%~nf.cpk
        )
    )
    popd
) else (
    echo Warning: data folder not found.
)

:: --- Step 3: Rename save files in Documents save folder ---
if exist "%docs_save_path%" (
    pushd "%docs_save_path%"
    :: Backup FL25 save files by adding .fl25_save extension
    for %%f in (%save_file_basenames%) do (
        if exist "%%f" (
            ren "%%f" "%%f.fl25_save"
            echo Backed up: %%f → %%f.fl25_save
        )
    )
    :: Restore PES21 save files by renaming .pes21_save to no extension
    for %%f in (%save_file_basenames%) do (
        if exist "%%f.pes21_save" (
            ren "%%f.pes21_save" "%%f"
            echo Restored: %%f.pes21_save → %%f
        )
    )
    popd
) else (
    echo WARNING: Save folder not found at:
    echo %docs_save_path%
)

:: --- Step 4: Rename polo.txt to marco.txt if polo.txt exists ---
if exist "%docs_save_path%" (
    pushd "%docs_save_path%"
    if exist "polo.txt" (
        ren "polo.txt" "marco.txt"
        echo Renamed: polo.txt → marco.txt
    )
    popd
)

:launch_game
echo.
echo Launching PES_Game_Launcher.bat...
start "" "%current_script_dir%PES_Game_Launcher.bat"

echo.
echo Done.
exit /b
