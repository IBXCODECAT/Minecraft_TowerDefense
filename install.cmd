@echo off
setlocal

:: Define the source directories relative to the location of the batch file
set "source_R=%~dp0R_PACK"
set "source_B=%~dp0B_PACK"

:: Define the target directories
set "target_R=%localappdata%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_resource_packs\R_PACK"
set "target_B=%localappdata%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_behavior_packs\B_PACK"

:: Check if the source directories exist
if not exist "%source_R%" (
    echo Source directory does not exist: %source_R%
    exit /b 1
)

if not exist "%source_B%" (
    echo Source directory does not exist: %source_B%
    exit /b 1
)

:: Ensure the target directories exist
if not exist "%target_R%" (
    mkdir "%target_R%"
)

if not exist "%target_B%" (
    mkdir "%target_B%"
)

:: Copy the source directories to the target directories
echo Copying R_PACK to development_resource_packs...
xcopy "%source_R%" "%target_R%" /E /H /C /I /Y
if %errorlevel% neq 0 (
    echo Failed to copy R_PACK.
    exit /b 1
) else (
    echo R_PACK copied successfully.
)

echo Copying B_PACK to development_behavior_packs...
xcopy "%source_B%" "%target_B%" /E /H /C /I /Y
if %errorlevel% neq 0 (
    echo Failed to copy B_PACK.
    exit /b 1
) else (
    echo B_PACK copied successfully.
)

endlocal
pause
