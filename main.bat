@echo off
title SWU_Auto_Install (version 0.1)

:: Initialize selection variables
set "install_app1=0"
set "install_app2=0"
set "install_app3=0"

:BANNER
echo =======================================
echo            SWU_Auto_Install
echo             version : 0.1
echo =======================================
echo.
echo Please select the programs you want to install:
echo [1] AOMEI Backupper(7.3.5.0)
echo [2] WinRAR(7.01.0)
echo [3] UltraViewer(6.6.87)
echo [4] Install selected programs
echo [5] Install all programs
echo [6] View selected programs
echo [7] Exit
echo.


:CHOICE
set /p choice=Enter your choice (1-7): 

if "%choice%"=="1" (
    if "%install_app1%"=="1" (
        set "install_app1=0"
        echo AOMEI Backupper 7.3.5.0 deselected.
    ) else (
        set "install_app1=1"
        echo AOMEI Backupper 7.3.5.0 selected.
    )
    goto CHOICE
)
if "%choice%"=="2" (
    if "%install_app2%"=="1" (
        set "install_app2=0"
        echo WinRAR 7.01.0 deselected.
    ) else (
        set "install_app2=1"
        echo WinRAR 7.01.0 selected.
    )
    goto CHOICE
)
if "%choice%"=="3" (
    if "%install_app3%"=="1" (
        set "install_app3=0"
        echo UltraViewer 6.6.87 deselected.
    ) else (
        set "install_app3=1"
        echo UltraViewer 6.6.87 selected.
    )
    goto CHOICE
)
if "%choice%"=="4" goto InstallSelected
if "%choice%"=="5" goto InstallAll
if "%choice%"=="6" goto ViewSelected
if "%choice%"=="7" goto End

if "%choice%" GTR "7" (
    echo Invalid choice, please select a valid option (1-7).
    pause
    goto CHOICE
)
if "%choice%" LSS "1" (
    echo Invalid choice, please select a valid option (1-7).
    pause
    goto CHOICE
)

goto CHOICE

:InstallSelected
cls
echo Installing selected programs...

if "%install_app1%"=="1" (
    echo Installing AOMEI Backupper 7.3.5.0 ...
    winget install AOMEI.Backupper.Standard --silent
    if "%ERRORLEVEL%"=="0" (
        echo AOMEI Backupper 7.3.5.0 installed successfully.
        msg * "AOMEI Backupper(7.3.5.0) installed successfully."
    ) else (
        echo Failed to install AOMEI Backupper 7.3.5.0.
        msg * "Failed to install AOMEI Backupper(7.3.5.0)."
    )
)

if "%install_app2%"=="1" (
    echo Installing WinRAR 7.01.0 ...
    winget install RARLab.WinRAR --silent
    if "%ERRORLEVEL%"=="0" (
        echo WinRAR 7.01.0 installed successfully.
        msg * "WinRAR(7.01.0) installed successfully."
    ) else (
        echo Failed to install WinRAR 7.01.0.
        msg * "Failed to install WinRAR(7.01.0)."
    )
)

if "%install_app3%"=="1" (
    echo Installing UltraViewer 6.6.87 ...
    winget install DucFabulous.UltraViewer --silent
    if "%ERRORLEVEL%"=="0" (
        echo UltraViewer 6.6.87 installed successfully.
        msg * "UltraViewer(6.6.87) installed successfully."
    ) else (
        echo Failed to install UltraViewer 6.6.87.
        msg * "Failed to install UltraViewer(6.6.87)."
    )
)

echo.
echo Programs selected for installation:
if "%install_app1%"=="1" echo - AOMEI Backupper(7.3.5.0)
if "%install_app2%"=="1" echo - WinRAR(7.01.0)
if "%install_app3%"=="1" echo - UltraViewer(6.6.87)
echo.
echo Installation of selected programs completed.
msg * "Installation of selected programs completed."
pause
goto BANNER

:InstallAll
echo Installing all programs...

set "install_app1=1"
set "install_app2=1"
set "install_app3=1"

call :InstallSelected
goto End

:ViewSelected
cls
echo selected programs for installation :
if "%install_app1%"=="1" echo  - AOMEI Backupper(7.3.5.0)
if "%install_app2%"=="1" echo  - WinRAR(7.01.0)
if "%install_app3%"=="1" echo  - UltraViewer(6.6.87)
echo.
pause
goto BANNER

:End
echo Exiting the installer.
pause
exit
