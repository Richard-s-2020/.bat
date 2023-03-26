@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

::ENTER YOUR CODE BELOW:
cls
echo welkom to my cmd mode
echo wat wil u gebruiken?
echo 1 : Restore Files and update files.
echo 2 : Format the disk
echo 3 : slit the Disk in 2
echo 4 : delet RS_Remote file
echo 5 : close
set /p cijfer=cijfer:

::set up

:loop (
    if %cijfer%==1 (
    @echo off
        cd C:\Windows\
        md "RS_Remote"
        cd C:\Windows\RS_Remote\
        del /S /Q "C:\Windows\RS_Remote\*cmd"

        :: bestand van .dat
        echo list disk > list_diskpart.txt
        echo "1" > Driver.dat
        echo "1" > spliten.dat

        :: Formeren
        echo Download .bat file
        powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Richard-s-2020/.bat/main/Format.cmd -OutFile Format.cmd"
        powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Richard-s-2020/.bat/main/Disk_spliten.cmd -OutFile Disk_spliten.cmd"
        powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Richard-s-2020/.bat/main/Main.bat -OutFile main.cmd"
        
        echo done 
        cls
        C:\Windows\RS_Remote\start.cmd 
    )
        
)

if %cijfer%==1 (
goto :loop
)

if %cijfer%==2 (
    cls
    cd C:\Windows\RS_Remote
    Format.cmd
) 

if %cijfer%==3 (
    cls
    cd C:\Windows\RS_Remote
    Disk_spliten.cmd
)

if %cijfer%==4 (
    cls
    cd C:\Windows\
    echo are you sure you whant to delet it?
    Rmdir /S "RS_Remote"
) 

if %cijfer%==5 (
    exit
)
