@echo off
echo welkom to my cmd mode
echo wat wil u gebruiken?
echo 1 : Restore
echo 2 : Formeren
echo 3 : Disk spliten
echo 4 : delet file
echo 5 : close
set /p cijfer=cijfer:
::set up

:loop (
    if %cijfer%==1 (
    @echo off
        md "Custom formeren"
        cd C:\Windows\System32\Custom formeren\

        :: bestand van .dat
        echo list disk > list_diskpart.txt
        echo > Driver.dat
        echo > spliten.dat

        :: Formeren
        echo Download .bat file
        powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Richard-s-2020/.bat/main/formeren.cmd -OutFile formeren.cmd"
        powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Richard-s-2020/.bat/main/Disk_spliten.cmd -OutFile Disk_spliten.cmd"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Richard-s-2020/.bat/main/start.bat -OutFile start.cmd"
        echo done 
        :: sluit af CMD
        if %cijfer%==1 (
        pause()
        taskkill /F /IM cmd.exe
            )
        )
    
)

if %cijfer%==1 (
goto :loop
)

if %cijfer%==2 (
cd C:\Windows\System32\Custom formeren
formeren.cmd
) 

if %cijfer%==3 (
cd C:\Windows\System32\Custom formeren
Disk_spliten.cmd
)

if %cijfer%==4 (
    cd C:\Windows\System32
    echo are you sure you whant to delet it?
    Rmdir /S "Custom formeren"
) 

if %cijfer%==5 (
break()
) 

loop: 1
pause 
