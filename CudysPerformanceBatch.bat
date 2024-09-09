@echo off                                                                           
  
:: Version #
Set Version=2.5                                                       
                                                                                                                      
:: Enable Delayed Expansion                                                                       
setlocal enabledelayedexpansion                                                                                                         
                                                                                                                                        
:: Set Powershell Execution Policy to Unrestricted                                                
powershell "Set-ExecutionPolicy Unrestricted"                           

:: Batch File Log
echo Ancel's Performance Batch Log>APB_Log.txt    Ancel's Optimization Hub : https://discord.gg/tweaking :: Made By  Ancel's Modified by Cudy :: Ancel's GitHub : https://github.com/ancel1x/Ancels-Performance-Batch
                                                          
:: Enable ANSI Escape Sequences          
reg add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f >> APB_Log.txt

set z=[7m
set i=[1m
set q=[0m
echo %z%Do you want to Create a Restore Point?%q%
echo.
echo %i%Yes = 1%q%          
echo.
echo %i%No = 2%q%
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto RestorePoint
if '%choice%'=='2' goto Continue

:RestorePoint
:: Creating Restore Point
echo Creating Restore Point
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d "0" /f >> APB_Log.txt
powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'Cudy's Tweaker Batch' -RestorePointType 'MODIFY_SETTINGS'" >> APB_Log.txt

:Continue
cls

:: Disable UAC
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f >> APB_Log.txt

:: Getting Admin Permissions https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file
echo Checking for Administrative Privelages...
timeout /t 3 /nobreak > NUL
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto GotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:GotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

:GotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

:: Main Menu
:Menu
chcp 65001 >nul 2>&1
cls
set c=[33m
set t=[0m
set w=[95m
set y=[0m
set u=[4m
set q=[0m
echo.
echo.
echo.
echo.
echo.               [94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗    [94m█[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗    [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ 
echo.              [94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[97m╚[94m█[94m█[97m╗ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝    [97m╚[97m══[94m█[94m█[97m╔═[97m═╝[94m█[94m█[97m║    [94m█[94m█[97m║[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[94m█[94m█[97m║ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║ [97m╚[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗       [94m█[94m█[97m║   [94m█[94m█[97m║ [94m█[97m╗ [94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║  [97m╚[94m█[94m█[97m╔╝  [97m╚[97m══[97m══[94m█[94m█[97m║       [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[94m█[97m╗[94m█[94m█[97m║[94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m║[94m█[94m█[97m╔═[94m█[94m█[97m╗ [94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝   [94m█[94m█[97m║   [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║       [94m█[94m█[97m║   [97m╚[94m█[94m█[94m█[97m╔[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║
echo.               [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝    [97m╚[97m═╝   [97m╚[97m══[97m═══[97m═╝       [97m╚[97m═╝    [97m╚═[97m═╝[97m╚═[97m═╝ [97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝
echo.                                       [97mCreated By: ancel_ Modified by Cudy[97m                                        
echo.                                                  [97m[97m%Version: %Version%[97m[97m                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
echo %w%[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══%y%      
echo.
echo.                                     
echo                    [97m[97m[[97m[94m [94m1 [94m[97m[97m][97m[97m NVIDIA Optimizations[97m[97m         [97m[97m[[97m[94m [94m5 [94m[97m[97m][97m[97m Revert NVIDIA Optimizations[97m[97m                        
echo.                     
echo.                          
echo                    [97m[97m[[97m[94m [94m2 [94m[97m[97m][97m[97m Power Optimizations[97m[97m          [97m[97m[[97m[94m [94m6 [94m[97m[97m][97m[97m Revert Power Optimizations[97m[97m
echo.                     
echo.
echo                    [97m[97m[[97m[94m [94m3 [94m[97m[97m][97m[97m BCD Optimizations[97m[97m            [97m[97m[[97m[94m [94m7 [94m[97m[97m][97m[97m Revert BCD Optimizations[97m[97m
echo.                                            
echo.                                                        
echo.                   [97m[97m[[97m[94m [94m4 [94m[97m[97m][97m[97m MMAgent Optimizations[97m[97m        [97m[97m[[97m[94m [94m8 [94m[97m[97m][97m[97m Revert MMAgent Optimizations[97m[97m
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto NVIDIA Optimizations
if '%choice%'=='2' goto Power Optimizations
if '%choice%'=='3' goto BCD Optimizations                                                                                                                                                                                                                                                                                                                                                                                                                                                         
if '%choice%'=='4' goto MMAgent Optimizations
if '%choice%'=='5' Revert NVIDIA Optimizations
if '%choice%'=='6' Revert Power Optimizations 
if '%choice%'=='7' Revert BCD Optimizations
if '%choice%'=='8' goto Revert MMAgent Optimizations

:BCD Optimizations                 
cls

set z=[7m
set i=[1m
set q=[0m
echo %z%Are you on Windows 10 or 11?%q%
echo.
echo %i%Windows 10 = 1%q%
echo.
echo %i%Windows 11 = 2%q%
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Windows10
if '%choice%'=='2' goto Windows11

:Windows10
cls

:: BCD Optimizations                                                   , Made By Me
echo Applying BCD Tweaks
:: Enable X2APIC, an advanced interrupt controller mode that can improve interrupt handling and performance in multi-core systems.
bcdedit /set "{current}" x2apicpolicy Enable
timeout /t 1 /nobreak > NUL

:: Set the configuration access policy to "Default," which is the recommended setting for most systems. It governs how devices access system configuration space.
bcdedit /set "{current}" configaccesspolicy Default
timeout /t 1 /nobreak > NUL

:: Configure Message Signaled Interrupts (MSI) for PCI devices. MSI can improve interrupt handling efficiency and reduce latency.
bcdedit /set "{current}" MSI Default
timeout /t 1 /nobreak > NUL

:: Disable the use of physical destination mode for PCI devices. This setting can help in certain compatibility scenarios.
bcdedit /set "{current}" usephysicaldestination No
timeout /t 1 /nobreak > NUL

:: Prevent Windows from using firmware-provided PCI settings, allowing for more control over PCI configuration.
bcdedit /set "{current}" usefirmwarepcisettings No
timeout /t 1 /nobreak > NUL

:: Remove the "useplatformclock" setting, which is related to clock synchronization. Avoid conflicts with other settings.
bcdedit /deletevalue "{current}" useplatformclock
timeout /t 1 /nobreak > NUL

:: Enable the use of the platform clock for more accurate timekeeping, potentially improving performance and responsiveness.
bcdedit /set "{current}" useplatformtick Yes
timeout /t 1 /nobreak > NUL

:: Disable dynamic tick, a feature that adjusts the system clock frequency based on system load. Disabling it can improve timer accuracy in certain applications.
bcdedit /set "{current}" disabledynamictick yes
timeout /t 1 /nobreak > NUL

:: Set an enhanced Time Stamp Counter (TSC) synchronization policy, aiming for better clock synchronization across cores and potentially reducing latency.
bcdedit /set "{current}" tscsyncpolicy Enhanced
timeout /t 1 /nobreak > NUL

:: Disable Data Execution Prevention (DEP) for all boot entries. Options are: AlwaysOn, OptIn (default), OptOut (need to manually set exclusions), AlwaysOff
bcdedit /set "{current}" nx OptIn
timeout /t 1 /nobreak > NUL

:: Disable the Boot Experience (UX) options. The Boot UX options are a set of options that allow you to customize the boot process. Disabling these options can help to reduce the amount of time it takes to boot your computer.
bcdedit /set "{current}" bootux disabled
timeout /t 1 /nobreak > NUL

:: Enable Quiet Boot. Quiet Boot is a feature that hides the boot menu and the Windows logo during the boot process. This can help to make the boot process appear faster. 
bcdedit /set "{current}" quietboot yes
timeout /t 1 /nobreak > NUL

:: Disable the launch of the hypervisor (virtualization platform), potentially freeing up resources if virtualization isn't needed.
bcdedit /set "{current}" hypervisorlaunchtype off
timeout /t 1 /nobreak > NUL


:Windows11
cls

:: BCD Optimizations                                                   , Made By Me                               
echo Applying BCD Tweaks
:: Enable X2APIC, an advanced interrupt controller mode that can improve interrupt handling and performance in multi-core systems.
bcdedit /set "{current}" x2apicpolicy Enable
timeout /t 1 /nobreak > NUL

:: Set the configuration access policy to "Default," which is the recommended setting for most systems. It governs how devices access system configuration space.
bcdedit /set "{current}" configaccesspolicy Default
timeout /t 1 /nobreak > NUL

:: Configure Message Signaled Interrupts (MSI) for PCI devices. MSI can improve interrupt handling efficiency and reduce latency.
bcdedit /set "{current}" MSI Default
timeout /t 1 /nobreak > NUL

:: Disable the use of physical destination mode for PCI devices. This setting can help in certain compatibility scenarios.
bcdedit /set "{current}" usephysicaldestination No
timeout /t 1 /nobreak > NUL
:: Prevent Windows from using firmware-provided PCI settings, allowing for more control over PCI configuration.

bcdedit /set "{current}" usefirmwarepcisettings No
timeout /t 1 /nobreak > NUL

:: Remove the "useplatformclock" setting, which is related to clock synchronization. Avoid conflicts with other settings.
bcdedit /deletevalue "{current}" useplatformclock
timeout /t 1 /nobreak > NUL

:: Enable the use of the platform clock for more accurate timekeeping, potentially improving performance and responsiveness.
bcdedit /deletevalue "{current}" useplatformtick
timeout /t 1 /nobreak > NUL

:: Disable dynamic tick, a feature that adjusts the system clock frequency based on system load. Disabling it can improve timer accuracy in certain applications.
bcdedit /set "{current}" disabledynamictick yes
timeout /t 1 /nobreak > NUL

:: Set an enhanced Time Stamp Counter (TSC) synchronization policy, aiming for better clock synchronization across cores and potentially reducing latency.
bcdedit /set "{current}" tscsyncpolicy Enhanced

:: Disable Data Execution Prevention (DEP) for all boot entries. Options are: AlwaysOn, OptIn (default), OptOut (need to manually set exclusions), AlwaysOff
bcdedit /set "{current}" nx OptIn
timeout /t 1 /nobreak > NUL

:: Disable the Boot Experience (UX) options. The Boot UX options are a set of options that allow you to customize the boot process. Disabling these options can help to reduce the amount of time it takes to boot your computer.
bcdedit /set "{current}" bootux disabled
timeout /t 1 /nobreak > NUL

:: Enable Quiet Boot. Quiet Boot is a feature that hides the boot menu and the Windows logo during the boot process. This can help to make the boot process appear faster. 
bcdedit /set "{current}" quietboot yes
timeout /t 1 /nobreak > NUL

:: Disable the launch of the hypervisor (virtualization platform), potentially freeing up resources if virtualization isn't needed.
bcdedit /set "{current}" hypervisorlaunchtype off
timeout /t 1 /nobreak > NUL
echo Registry changes applied.
pause
goto CompletedBCDOptimizations



:CompletedBCDOptimizations 
cls
echo CompletedBCDOptimizations 
timeout /t 3 /nobreak > NUL
cls
set c=[33m
set t=[0m
set w=[95m
set y=[0m
set u=[4m
set q=[0m
echo.
echo.
echo.
echo.
echo.               [94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗    [94m█[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗    [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ 
echo.              [94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[97m╚[94m█[94m█[97m╗ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝    [97m╚[97m══[94m█[94m█[97m╔═[97m═╝[94m█[94m█[97m║    [94m█[94m█[97m║[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[94m█[94m█[97m║ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║ [97m╚[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗       [94m█[94m█[97m║   [94m█[94m█[97m║ [94m█[97m╗ [94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║  [97m╚[94m█[94m█[97m╔╝  [97m╚[97m══[97m══[94m█[94m█[97m║       [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[94m█[97m╗[94m█[94m█[97m║[94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m║[94m█[94m█[97m╔═[94m█[94m█[97m╗ [94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝   [94m█[94m█[97m║   [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║       [94m█[94m█[97m║   [97m╚[94m█[94m█[94m█[97m╔[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║
echo.               [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝    [97m╚[97m═╝   [97m╚[97m══[97m═══[97m═╝       [97m╚[97m═╝    [97m╚═[97m═╝[97m╚═[97m═╝ [97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝
echo.                                       [97mCreated By: ancel_ Modified by Cudy[97m                                        
echo.                                                  [97m[97m%Version: %Version%[97m[97m                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
echo %w%[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══%y%      
echo.
echo.                                     
echo.                                             [97m[97m[[97m[94m [94m1 [94m[97m[97m][97m[97m Menu[97m[97m         [97m[97m[[97m[94m [94m2 [94m[97m[97m][97m[97m Exit[97m[97m                        
echo.                       
echo.                          
echo.                   
echo.                     
echo.
echo.                    
echo.                                            
echo.                                                        
echo.                           
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Menu
if '%choice%'=='2' goto Close



:MMAgent Optimizations                                     , Made By Me
cls

:: Memory Management Agent allows you to fine-tune how the operating system allocates and uses memory, potentially improving performance and resource optimization.
powershell.exe -Command "Get-MMAgent"

:: Enable Application Launch Prefetching - This can speed up app launches, potentially including games.
powershell.exe -Command "Enable-MMAgent -alp"

:: Disable Application Pre-Launch - this feature might interfere with gaming performance.
powershell.exe -Command "Disable-MMAgent -apl"

:: Adjust MaxOperationAPIFiles - Increase this value if you frequently experience memory-related issues in games. (default 512)
powershell.exe -Command "Set-MMAgent -moaf 4096"

:: Enable OperationAPI - This feature allows games to communicate memory requirements to MMAgent, potentially improving memory management
powershell.exe -Command "Enable-MMAgent -oa"

:: Disable Page Combining - Combining smaller memory pages into larger ones can improve memory efficiency in general use, but might not be optimal for gaming
powershell.exe -Command "Disable-MMAgent -pc"

:: Disable Memory Compression - Compressing memory to free up space can introduce latency, potentially impacting gaming performance. Use this command
powershell.exe -Command "Disable-MMAgent -mc"
echo Registry changes applied.
pause
goto CompletedMMAgentOptimizations



:CompletedMMAgentOptimizations  
cls
echo CompletedMMAgentOptimizations
timeout /t 3 /nobreak > NUL
cls
set c=[33m
set t=[0m
set w=[95m
set y=[0m
set u=[4m
set q=[0m
echo.
echo.
echo.
echo.
echo.               [94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗    [94m█[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗    [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ 
echo.              [94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[97m╚[94m█[94m█[97m╗ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝    [97m╚[97m══[94m█[94m█[97m╔═[97m═╝[94m█[94m█[97m║    [94m█[94m█[97m║[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[94m█[94m█[97m║ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║ [97m╚[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗       [94m█[94m█[97m║   [94m█[94m█[97m║ [94m█[97m╗ [94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║  [97m╚[94m█[94m█[97m╔╝  [97m╚[97m══[97m══[94m█[94m█[97m║       [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[94m█[97m╗[94m█[94m█[97m║[94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m║[94m█[94m█[97m╔═[94m█[94m█[97m╗ [94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝   [94m█[94m█[97m║   [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║       [94m█[94m█[97m║   [97m╚[94m█[94m█[94m█[97m╔[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║
echo.               [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝    [97m╚[97m═╝   [97m╚[97m══[97m═══[97m═╝       [97m╚[97m═╝    [97m╚═[97m═╝[97m╚═[97m═╝ [97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝
echo.                                       [97mCreated By: ancel_ Modified by Cudy[97m                                        
echo.                                                  [97m[97m%Version: %Version%[97m[97m                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
echo %w%[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══%y%      
echo.
echo.                                     
echo.                                             [97m[97m[[97m[94m [94m1 [94m[97m[97m][97m[97m Menu[97m[97m         [97m[97m[[97m[94m [94m2 [94m[97m[97m][97m[97m Exit[97m[97m                        
echo.                     
echo.                          
echo.                   
echo.                     
echo.
echo.                    
echo.                                            
echo.                                                        
echo.                           
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Menu
if '%choice%'=='2' goto Close



:Revert MMAgent Optimizations                                   , Made By Me
cls


:: Memory Management Agent allows you to fine-tune how the operating system allocates and uses memory, potentially improving performance and resource optimization.
powershell.exe -Command "Get-MMAgent"

:: Disable Application Launch Prefetching 
powershell.exe -Command "Disable-MMAgent -alp"

:: Disable Application Pre-Launch 
powershell.exe -Command "Disable-MMAgent -apl"

:: Adjust MaxOperationAPIFiles 
powershell.exe -Command "Set-MMAgent -moaf 512"

:: Disable OperationAPI 
powershell.exe -Command "Disable-MMAgent -oa"

:: Disable Page Combining 
powershell.exe -Command "Disable-MMAgent -pc"

:: Disable Memory Compression 
powershell.exe -Command "Disable-MMAgent -mc"
echo Registry changes applied.
pause
goto CompletedRevertMMAgentOptimizations



:CompletedRevertMMAgentOptimizations  
cls
echo CompletedRevertMMAgentOptimizations
timeout /t 3 /nobreak > NUL
cls
set c=[33m
set t=[0m
set w=[95m
set y=[0m
set u=[4m
set q=[0m
echo.
echo.
echo.
echo.
echo.               [94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗    [94m█[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗    [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ 
echo.              [94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[97m╚[94m█[94m█[97m╗ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝    [97m╚[97m══[94m█[94m█[97m╔═[97m═╝[94m█[94m█[97m║    [94m█[94m█[97m║[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[94m█[94m█[97m║ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║ [97m╚[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗       [94m█[94m█[97m║   [94m█[94m█[97m║ [94m█[97m╗ [94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║  [97m╚[94m█[94m█[97m╔╝  [97m╚[97m══[97m══[94m█[94m█[97m║       [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[94m█[97m╗[94m█[94m█[97m║[94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m║[94m█[94m█[97m╔═[94m█[94m█[97m╗ [94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝   [94m█[94m█[97m║   [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║       [94m█[94m█[97m║   [97m╚[94m█[94m█[94m█[97m╔[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║
echo.               [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝    [97m╚[97m═╝   [97m╚[97m══[97m═══[97m═╝       [97m╚[97m═╝    [97m╚═[97m═╝[97m╚═[97m═╝ [97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝
echo.                                       [97mCreated By: ancel_ Modified by Cudy[97m                                        
echo.                                                  [97m[97m%Version: %Version%[97m[97m                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
echo %w%[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══%y%      
echo.
echo.                                     
echo.                                             [97m[97m[[97m[94m [94m1 [94m[97m[97m][97m[97m Menu[97m[97m         [97m[97m[[97m[94m [94m2 [94m[97m[97m][97m[97m Exit[97m[97m                        
echo.                     
echo.                          
echo.                   
echo.                     
echo.
echo.                    
echo.                                            
echo.                                                        
echo.                           
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Menu
if '%choice%'=='2' goto Close



:NVIDIA Optimizations                                    , Made By 𝕯𝖗. 𝕷𝖚𝕾𝖑𝖔𝖜𝖊𝖗       His Discord Server :  https://discord.gg/K9kukCPzQ7
cls

:: Nvidia Tweaks Helping With Mangement of tasks and Dpc ::
echo Applying Nvidia Tweaks
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f                              
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f                        
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f                                   
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\NVAPI" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f                               
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f                      
timeout /t 1 /nobreak > NUL

:: Enable Nvidia Gpu Preemption ::
echo Applying Enable Nvidia Gpu Preemption
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL

:: Disable Nvidia Telemetry ::
echo Applying Disable Nvidia Telemetry
Reg.exe add "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData" /t REG_DWORD /d "0" /f  
timeout /t 1 /nobreak > NUL

:: Disable Nvidia nvpstate ::
echo Applying disable nvpstate
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f  
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableAsyncPstates" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL


:: Disable Nvidia hdcp  ::
echo Applying disable hdcp 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMHdcpKeyglobZero" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmDisableHdcp22" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMSkipHdcp22Init" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL

:: Disable Nvidia nvlogs ::
echo Applying disable nvlogs
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmLogonRC" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmRcWatchdog" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMCtxswLog" /t REG_DWORD /d "0" /f                             
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMIntrDetailedLogs" /t REG_DWORD /d "0" /f                                                     
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmDisableInforomNvlink" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL

:: Disable Nvidia core slowdown ::
echo Applying disable core slowdown
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMClkSlowdown" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL

:: Disable Nvidia nvaspm ::
echo Applying disable nvaspm
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMDisableGpuASPMFlags" /t REG_DWORD /d "3" /f 
timeout /t 1 /nobreak > NUL

:: Disable Nvidia ltr ::                                                          
echo Applying disable ltr
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMPcieLtrOverride" /t REG_DWORD /d "2" /f    
timeout /t 1 /nobreak > NUL

:: Disable Nvidia clock gating ::         
echo Applying disable clock gating
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMElcg" /t REG_DWORD /d "0x55555555" /f 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMBlcg" /t REG_DWORD /d "0x11111111" /f 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMElpgStateOnInit" /t REG_DWORD /d "3" /f 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMElpg" /t REG_DWORD /d "0xFFF" /f 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMSlcg" /t REG_DWORD /d "0x3FFF3" /f 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMFspg" /t REG_DWORD /d "5" /f 
timeout /t 1 /nobreak > NUL

:: Disable Nvidia  opsb ::
echo Applying disable opsb 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMOPSB" /t REG_DWORD /d "0x2AA2" /f 
timeout /t 1 /nobreak > NUL

:: Disable Nvidia power mizer ::
echo Applying disable power mizer 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerEnable" /t REG_DWORD /d "1" /f    
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevel" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevelAC" /t REG_DWORD /d "1" /f    
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerHardLevel" /t REG_DWORD /d "1" /f     
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerHardLevelAC" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerDefault" /t REG_DWORD /d "1" /f   
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerDefaultAC" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PerfLevelSrc" /t REG_DWORD /d "0x2222" /f                  
timeout /t 1 /nobreak > NUL

::  Disable Nvidia power saving ::
echo Applying related to power saving
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL

:: disable Nvidia Tdr ::
echo Applying  disable Tdr
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f                                                
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d "0" /f                                                 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDdiDelay" /t REG_DWORD /d "0" /f                                             
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDebugMode" /t REG_DWORD /d "0" /f                                            
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitCount" /t REG_DWORD /d "0" /f                                            
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitTime" /t REG_DWORD /d "0" /f                                             
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrTestMode" /t REG_DWORD /d "0" /f                                             
timeout /t 1 /nobreak > NUL
echo Registry changes applied.
pause
goto CompletedNVIDIAOptimizations



:CompletedNVIDIAOptimizations  
cls
echo CompletedNVIDIAOptimizations
timeout /t 3 /nobreak > NUL
cls
set c=[33m
set t=[0m
set w=[95m
set y=[0m
set u=[4m
set q=[0m
echo.
echo.
echo.
echo.
echo.               [94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗    [94m█[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗    [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ 
echo.              [94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[97m╚[94m█[94m█[97m╗ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝    [97m╚[97m══[94m█[94m█[97m╔═[97m═╝[94m█[94m█[97m║    [94m█[94m█[97m║[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[94m█[94m█[97m║ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║ [97m╚[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗       [94m█[94m█[97m║   [94m█[94m█[97m║ [94m█[97m╗ [94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║  [97m╚[94m█[94m█[97m╔╝  [97m╚[97m══[97m══[94m█[94m█[97m║       [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[94m█[97m╗[94m█[94m█[97m║[94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m║[94m█[94m█[97m╔═[94m█[94m█[97m╗ [94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝   [94m█[94m█[97m║   [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║       [94m█[94m█[97m║   [97m╚[94m█[94m█[94m█[97m╔[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║
echo.               [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝    [97m╚[97m═╝   [97m╚[97m══[97m═══[97m═╝       [97m╚[97m═╝    [97m╚═[97m═╝[97m╚═[97m═╝ [97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝
echo.                                       [97mCreated By: ancel_ Modified by Cudy[97m                                        
echo.                                                  [97m[97m%Version: %Version%[97m[97m                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
echo %w%[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══%y%      
echo.
echo.                                     
echo.                                             [97m[97m[[97m[94m [94m1 [94m[97m[97m][97m[97m Menu[97m[97m         [97m[97m[[97m[94m [94m2 [94m[97m[97m][97m[97m Exit[97m[97m                        
echo.                     
echo.                          
echo.                  
echo.                     
echo.
echo.                    
echo.                                            
echo.                                                        
echo.                           
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Menu
if '%choice%'=='2' goto Close



:Power Optimizations                              , Made By 𝕯𝖗. 𝕷𝖚𝕾𝖑𝖔𝖜𝖊𝖗              His Discord Server :  https://discord.gg/K9kukCPzQ7
cls
   

:: Disable hibernation ::
echo Applying Disable hibernation
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "AllowHibernate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateChecksummingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SkipHibernateMemoryMapValidation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ForceHibernateDisabled" /v "Policy" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL


:: Disable modern standby ::
echo Applying modern standby
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MSDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformRoleOverride" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL


:: Disable sleep study ::
echo Applying Disable sleep study
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDeviceAccountingLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SleepstudyAccountingEnabled" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL


:: Disable power throttling ::
echo Applying Disable power throttling
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo Registry changes applied.
pause
goto CompletedPowerOptimizations



:CompletedPowerOptimizations
cls
echo CompletedPowerOptimizations
timeout /t 3 /nobreak > NUL
cls
set c=[33m
set t=[0m
set w=[95m
set y=[0m
set u=[4m
set q=[0m
echo.
echo.
echo.
echo.
echo.               [94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗    [94m█[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗    [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ 
echo.              [94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[97m╚[94m█[94m█[97m╗ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝    [97m╚[97m══[94m█[94m█[97m╔═[97m═╝[94m█[94m█[97m║    [94m█[94m█[97m║[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[94m█[94m█[97m║ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║ [97m╚[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗       [94m█[94m█[97m║   [94m█[94m█[97m║ [94m█[97m╗ [94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║  [97m╚[94m█[94m█[97m╔╝  [97m╚[97m══[97m══[94m█[94m█[97m║       [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[94m█[97m╗[94m█[94m█[97m║[94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m║[94m█[94m█[97m╔═[94m█[94m█[97m╗ [94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝   [94m█[94m█[97m║   [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║       [94m█[94m█[97m║   [97m╚[94m█[94m█[94m█[97m╔[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║
echo.               [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝    [97m╚[97m═╝   [97m╚[97m══[97m═══[97m═╝       [97m╚[97m═╝    [97m╚═[97m═╝[97m╚═[97m═╝ [97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝
echo.                                       [97mCreated By: ancel_ Modified by Cudy[97m                                        
echo.                                                  [97m[97m%Version: %Version%[97m[97m                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
echo %w%[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══%y%      
echo.
echo.                                     
echo.                                             [97m[97m[[97m[94m [94m1 [94m[97m[97m][97m[97m Menu[97m[97m         [97m[97m[[97m[94m [94m2 [94m[97m[97m][97m[97m Exit[97m[97m                        
echo.                     
echo.                          
echo.                   
echo.                     
echo.
echo.                    
echo.                                            
echo.                                                        
echo.                           
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Menu
if '%choice%'=='2' goto Close



:Revert Power Optimizations                           , Made By 𝕯𝖗. 𝕷𝖚𝕾𝖑𝖔𝖜𝖊𝖗                 His Discord Server :  https://discord.gg/K9kukCPzQ7
cls


:: Reverting Disable hibernation ::
echo Reverting hibernation
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "AllowHibernate" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HiberbootEnabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateChecksummingEnabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SkipHibernateMemoryMapValidation" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ForceHibernateDisabled" /v "Policy" /f
timeout /t 1 /nobreak > NUL


:: Reverting Disable modern standby ::
echo Reverting modern standby
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MSDisabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformRoleOverride" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /f
timeout /t 1 /nobreak > NUL


:: Reverting Disable sleep study ::
echo Reverting Disable sleep study
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisabled" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDeviceAccountingLevel" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SleepstudyAccountingEnabled" /f
timeout /t 1 /nobreak > NUL


:: Reverting Disable power throttling ::
echo Reverting Disable power throttling
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /f
timeout /t 1 /nobreak > NUL
echo Registry changes applied.
pause
goto CompletedRevertingNvidia



:CompletedRevertPowerOptimizations
cls
echo CompletedRevertPowerOptimizations
timeout /t 3 /nobreak > NUL
cls
set c=[33m
set t=[0m
set w=[95m
set y=[0m
set u=[4m
set q=[0m
echo.
echo.
echo.
echo.
echo.               [94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗    [94m█[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗    [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ 
echo.              [94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[97m╚[94m█[94m█[97m╗ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝    [97m╚[97m══[94m█[94m█[97m╔═[97m═╝[94m█[94m█[97m║    [94m█[94m█[97m║[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[94m█[94m█[97m║ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║ [97m╚[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗       [94m█[94m█[97m║   [94m█[94m█[97m║ [94m█[97m╗ [94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║  [97m╚[94m█[94m█[97m╔╝  [97m╚[97m══[97m══[94m█[94m█[97m║       [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[94m█[97m╗[94m█[94m█[97m║[94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m║[94m█[94m█[97m╔═[94m█[94m█[97m╗ [94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝   [94m█[94m█[97m║   [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║       [94m█[94m█[97m║   [97m╚[94m█[94m█[94m█[97m╔[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║
echo.               [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝    [97m╚[97m═╝   [97m╚[97m══[97m═══[97m═╝       [97m╚[97m═╝    [97m╚═[97m═╝[97m╚═[97m═╝ [97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝
echo.                                       [97mCreated By: ancel_ Modified by Cudy[97m                                        
echo.                                                  [97m[97m%Version: %Version%[97m[97m                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
echo %w%[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══%y%      
echo.
echo.                                     
echo.                                             [97m[97m[[97m[94m [94m1 [94m[97m[97m][97m[97m Menu[97m[97m         [97m[97m[[97m[94m [94m2 [94m[97m[97m][97m[97m Exit[97m[97m                        
echo.                     
echo.                          
echo.                   
echo.                     
echo.
echo.                    
echo.                                            
echo.                                                        
echo.                           
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Menu
if '%choice%'=='2' goto Close



:Revrt NVIDIA Optimizations                  , Made By 𝕯𝖗. 𝕷𝖚𝕾𝖑𝖔𝖜𝖊𝖗               His Discord Server :  https://discord.gg/K9kukCPzQ7
cls


:: Reverting  Nvidia Tweaks ::
echo Reverting Nvidia Tweaks
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmGpsPsEnablePerCpuCoreDpc" /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGpsPsEnablePerCpuCoreDpc" /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\NVAPI" /v "RmGpsPsEnablePerCpuCoreDpc" /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "RmGpsPsEnablePerCpuCoreDpc" /f 
timeout /t 1 /nobreak > NUL


:: Reverting Nvidia Gpu Preemption ::
echo Reverting Nvidia Gpu Preemption
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /f 
timeout /t 1 /nobreak > NUL

:: Reverting Nvidia Telemetry ::
echo Reverting Nvidia Telemetry
Reg.exe delete "HKLM\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v "OptInOrOutPreference" /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\Startup" /v "SendTelemetryData"  /f
timeout /t 1 /nobreak > NUL


:: Reverting nvpstate ::
echo Reverting Nvidia nvpstate
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /f     
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableAsyncPstates" /f  
timeout /t 1 /nobreak > NUL


:: Reverting hdcp  ::
echo Reverting Nvidia hdcp 
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMHdcpKeyglobZero" /f 
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmDisableHdcp22" /f  
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMSkipHdcp22Init" /f 
timeout /t 1 /nobreak > NUL



:: Reverting nvlogs ::
echo Reverting Nvidia nvlogs
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmLogonRC" /f  
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmRcWatchdog" /f 
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMCtxswLog" /f 
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMIntrDetailedLogs" /f  
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmDisableInforomNvlink" /f 
timeout /t 1 /nobreak > NUL




:: Reverting core slowdown ::
echo Reverting Nvidia core slowdown
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableMClkSlowdown" /f 
timeout /t 1 /nobreak > NUL



:: Reverting Nvidia  nvaspm ::
echo Reverting Nvidia nvaspm
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMDisableGpuASPMFlags" /f   
timeout /t 1 /nobreak > NUL



:: Reverting Nvidia ltr ::                                                          
echo Reverting Nvidia ltr
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMPcieLtrOverride" /f 
timeout /t 1 /nobreak > NUL



:: Reverting Nvidia clock gating ::         
echo Reverting Nvidia clock gating
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMElcg" /f  
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMBlcg" /f 
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMElpgStateOnInit" /f 
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMElpg" /f 
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMSlcg" /f  
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMFspg" /f  
timeout /t 1 /nobreak > NUL


:: Reverting Nvidia opsb ::
echo Reverting Nvidia opsb 
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMOPSB" /f  
timeout /t 1 /nobreak > NUL



:: Reverting Nvidia power mizer ::
echo Reverting Nvidia power mizer 
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerEnable" /f 
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevel" /f
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerLevelAC" /f 
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerHardLevel" /f  
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerHardLevelAC" /f 
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerDefault" /f 
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerDefaultAC" /f  
Reg.exe delete "HKLM\System\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PerfLevelSrc" /f 
timeout /t 1 /nobreak > NUL


:: Reverting related to power saving ::
echo Reverting Nvidia power saving
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving"  /f 
timeout /t 1 /nobreak > NUL


:: Reverting Nvidia  Tdr ::
echo Reverting Nvidia disable Tdr
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDdiDelay" /f  
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDebugMode" /f  
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitCount" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLimitTime" /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrTestMode" /f 
timeout /t 1 /nobreak > NUL
echo Registry changes reverted.
pause
goto CompletedRevrtNVIDIAOptimizations  



:CompletedRevrtNVIDIAOptimizations
cls
echo CompletedRevrtNVIDIAOptimizations
timeout /t 3 /nobreak > NUL
cls
set c=[33m
set t=[0m
set w=[95m
set y=[0m
set u=[4m
set q=[0m
echo.
echo.
echo.
echo.
echo.               [94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗   [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗    [94m█[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m╗    [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[94m█[94m█[94m█[97m╗ [94m█[94m█[97m╗  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[97m╗ 
echo.              [94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[97m╚[94m█[94m█[97m╗ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝    [97m╚[97m══[94m█[94m█[97m╔═[97m═╝[94m█[94m█[97m║    [94m█[94m█[97m║[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗[94m█[94m█[97m║ [94m█[94m█[97m╔╝[94m█[94m█[97m╔[97m═══[97m═╝[94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║ [97m╚[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗       [94m█[94m█[97m║   [94m█[94m█[97m║ [94m█[97m╗ [94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║[94m█[94m█[94m█[94m█[94m█[97m╔╝ [94m█[94m█[94m█[94m█[94m█[97m╗  [94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝
echo.              [94m█[94m█[97m║     [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m║  [97m╚[94m█[94m█[97m╔╝  [97m╚[97m══[97m══[94m█[94m█[97m║       [94m█[94m█[97m║   [94m█[94m█[97m║[94m█[94m█[94m█[97m╗[94m█[94m█[97m║[94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m║[94m█[94m█[97m╔═[94m█[94m█[97m╗ [94m█[94m█[97m╔═[97m═╝  [94m█[94m█[97m╔[97m══[94m█[94m█[97m╗
echo.              [97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[97m╚[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[97m╔╝   [94m█[94m█[97m║   [94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m║       [94m█[94m█[97m║   [97m╚[94m█[94m█[94m█[97m╔[94m█[94m█[94m█[97m╔╝[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║[94m█[94m█[97m║  [94m█[94m█[97m╗[94m█[94m█[94m█[94m█[94m█[94m█[94m█[97m╗[94m█[94m█[97m║  [94m█[94m█[97m║
echo.               [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝ [97m╚[97m══[97m══[97m═╝    [97m╚[97m═╝   [97m╚[97m══[97m═══[97m═╝       [97m╚[97m═╝    [97m╚═[97m═╝[97m╚═[97m═╝ [97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m═╝  [97m╚[97m═╝[97m╚[97m══[97m═══[97m═╝[97m╚[97m═╝  [97m╚[97m═╝
echo.                                       [97mCreated By: ancel_ Modified by Cudy[97m                                        
echo.                                                  [97m[97m%Version: %Version%[97m[97m                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
echo %w%[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══[97m══%y%      
echo.
echo.                                     
echo.                                             [97m[97m[[97m[94m [94m1 [94m[97m[97m][97m[97m Menu[97m[97m         [97m[97m[[97m[94m [94m2 [94m[97m[97m][97m[97m Exit[97m[97m                        
echo.                     
echo.                          
echo.                   
echo.                     
echo.
echo.                    
echo.                                            
echo.                                                        
echo.                           
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Menu
if '%choice%'=='2' goto Close

goto Menu

:Close
cls 
exit



