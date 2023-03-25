@echo off
echo welkom to my cmd mode
echo wat wil u gebruiken?
echo 1 : Restore Files
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

        :: bestand van .dat
        echo list disk > list_diskpart.txt
        echo > Driver.dat
        echo > spliten.dat

        :: Formeren
        echo Download .bat file
        powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Richard-s-2020/.bat/main/Format.cmd -OutFile Format.cmd"
        powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Richard-s-2020/.bat/main/Disk_spliten.cmd -OutFile Disk_spliten.cmd"
        powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Richard-s-2020/.bat/main/start.bat -OutFile start.cmd"
        
        echo done 
        :: sluit af CMD
        if %cijfer%==1 (
        pause()
        cls
            )
        )
        C:\Windows\RS_Remote\start.cmd
    
)

if %cijfer%==1 (
goto :loop
)

if %cijfer%==2 (
cd C:\Windows\RS_Remote
Format.cmd
) 

if %cijfer%==3 (
cd C:\Windows\RS_Remote
Disk_spliten.cmd
)

if %cijfer%==4 (
    cd C:\Windows\
    echo are you sure you whant to delet it?
    Rmdir /S "RS_Remote"
) 

if %cijfer%==5 (
break()
) 

loop: 1
pause 
