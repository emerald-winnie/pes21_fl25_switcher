@echo off
setlocal EnableDelayedExpansion

:: ======================================
:: FL25 / PES21 Version Switcher Script
:: ======================================

:: --- Configuration ---

:: List of .cpk files to rename depending on version
set "cpk_files_to_version=dt00_4K_x64.cpk dt00_x64.cpk dt10_x64.cpk dt11_4K_x64.cpk dt11_x64.cpk dt12_g4.cpk dt13_all.cpk dt14_all.cpk dt15_x64.cpk dt16_all.cpk dt17_x64.cpk dt18_all.cpk dt19_x64.cpk dt20_eng_x64.cpk dt20_use_x64.cpk dt30_g4.cpk dt32_g4.cpk dt33_g4.cpk dt34_g4.cpk dt35_g4.cpk dt36_g4.cpk dt40_all.cpk dt41_eng_all.cpk dt41_jpn_all.cpk dt42_all.cpk dt43_eng_all.cpk dt43_jpn_all.cpk dt44_all.cpk dt70_x64.cpk"

:: Save file base names used in PES21
set "save_file_basenames=EDIT00000000 FILELIST00000000 GRAPHICS000000 ML00000000 SYSTEM00000000"

:: Root script path (where this .bat is located)
set "current_script_dir=%~dp0"

:: Construct default Documents path
set "docs_root=%USERPROFILE%\Documents"
if exist "%USERPROFILE%\OneDrive\Documents" (
    set "docs_root=%USERPROFILE%\OneDrive\Documents"
)

:: Final save path for PES21 based on Steam ID
set "docs_save_path=%docs_root%\KONAMI\eFootball PES 2021 SEASON UPDATE\76561197990587099\save"

:: --- End Configuration ---


:: --- Version Detection ---
if exist "%current_script_dir%currentversion_FL25" (
    echo Found FL25 version marker. Switching to PES21...
    call :switch_version "FL25" "PES21" "fl25" "pes21"
) else if exist "%current_script_dir%currentversion_PES21" (
    echo Found PES21 version marker. Switching to FL25...
    call :switch_version "PES21" "FL25" "pes21" "fl25"
) else (
    echo Error: No version marker found.
    goto :pause_exit
)

:: --- End Script ---
:pause_exit
echo.
echo Press Enter to close...
pause >nul
goto :eof


:: ====================================
:: Main Logic: Version Switching Logic
:: ====================================
:switch_version
:: %1 - Current version name (e.g. FL25)
:: %2 - New version name (e.g. PES21)
:: %3 - Current file suffix (e.g. fl25)
:: %4 - New file suffix (e.g. pes21)

:: Switch version marker file
ren "%current_script_dir%currentversion_%1" "currentversion_%2"

:: --- Step 1: Rename .cpk files in /data folder ---
if exist "%current_script_dir%data" (
    pushd "%current_script_dir%data"
    for %%f in (%cpk_files_to_version%) do (
        if exist "%%f" (
            ren "%%f" "%%~nf.%3_cpk"
            echo Backed up: %%f → %%~nf.%3_cpk
        )
    )
    for %%f in (*.%4_cpk) do (
        if exist "%%f" (
            ren "%%f" "%%~nf.cpk"
            echo Restored: %%f → %%~nf.cpk
        )
    )
    popd
)

:: --- Step 2: Rename Save Files ---
if exist "%docs_save_path%" (
    pushd "%docs_save_path%"
    for %%f in (%save_file_basenames%) do (
        if exist "%%f" (
            ren "%%f" "%%f.%3_save"
            echo Backed up: %%f → %%f.%3_save
        )
    )
    for %%f in (%save_file_basenames%) do (
        if exist "%%f.%4_save" (
            ren "%%f.%4_save" "%%f"
            echo Restored: %%f.%4_save → %%f
        )
    )
    popd
) else (
    echo WARNING: Save folder not found at:
    echo %docs_save_path%
)

:: --- Step 3: Marco / Polo Rename Toggle ---
if exist "%docs_save_path%" (
    pushd "%docs_save_path%"
    if exist "marco.txt" (
        ren "marco.txt" "polo.txt"
        echo Renamed: marco.txt → polo.txt
    ) else if exist "polo.txt" (
        ren "polo.txt" "marco.txt"
        echo Renamed: polo.txt → marco.txt
    )
    popd
)

echo.
echo Switched to %2 version.
exit /b
