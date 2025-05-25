@echo off
setlocal EnableDelayedExpansion

:: List of target files to rename
set "file_list=dt00_4K_x64.cpk dt00_x64.cpk dt10_x64.cpk dt11_4K_x64.cpk dt11_x64.cpk dt12_g4.cpk dt13_all.cpk dt14_all.cpk dt15_x64.cpk dt16_all.cpk dt17_x64.cpk dt18_all.cpk dt19_x64.cpk dt20_eng_x64.cpk dt20_use_x64.cpk dt30_g4.cpk dt32_g4.cpk dt33_g4.cpk dt34_g4.cpk dt35_g4.cpk dt36_g4.cpk dt40_all.cpk dt41_eng_all.cpk dt41_jpn_all.cpk dt42_all.cpk dt43_eng_all.cpk dt43_jpn_all.cpk dt44_all.cpk dt70_x64.cpk"

:: Process each file in the current directory
for %%f in (%file_list%) do (
    if exist "%%f" (
        ren "%%f" "%%~nf.fl25_cpk"
        echo Renamed: %%f → %%~nf.fl25_cpk
    )
)

echo.
echo All specified files have been renamed.
pause
