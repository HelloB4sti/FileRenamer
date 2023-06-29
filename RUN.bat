@echo off
setlocal enabledelayedexpansion
set "folder_path=%~dp0"

echo.
echo Welcome to the batch file Renamer. This script offers the following options:
echo.
echo Rename all files in the current directory, excluding "RUN.bat" You will be prompted to enter a number which will be added at the start of each filename.
echo Undo the renaming operation. This will remove any number and " - " prefix from the filenames, excluding "RUN.bat"
echo Please choose an option from the menu below.
echo.
PowerShell -Command "Write-Host 'This Script Made by: ' -NoNewline; Write-Host 'HelloB4sti' -NoNewline -ForegroundColor Red; Write-Host"


:menu
echo.
echo 1. Rename all files
echo 2. Undo renaming
echo.
set /p choice=Choose an option (1-2): 
echo.

if "%choice%"=="1" (
    set /p number=Enter number to add in front of each file: 
    for /R "%folder_path%" %%a in (*.*) do (
        set "filename=%%~nxa"
        if /I not "!filename!"=="RENAME  RUN.bat" (
            ren "%%a" "!number! - !filename!"
        )
    )
    echo All files have been renamed.
) else if "%choice%"=="2" (
    for /R "%folder_path%" %%a in (*.*) do (
        set "filename=%%~nxa"
        set "newname=!filename:* - =!"
        if /I not "!filename!"=="RUN.bat" (
            if not "!filename!"=="!newname!" (
                ren "%%a" "!newname!"
            )
        )
    )
    echo All renaming has been undone.
) else (
    echo Invalid choice.
    goto menu
)

endlocal
pause