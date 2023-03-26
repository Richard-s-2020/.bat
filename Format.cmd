@echo off

cd C:\Windows\RS_Remote
DISKPART /s list_diskpart.txt
echo "writch the disk that you whant to formeren."
set /p disk=disk:
echo sel disk %disk% > Driver.dat
echo clean >> Driver.dat
echo create par primary >> Driver.dat
echo format fs = ntfs quick >> Driver.dat


echo Welke leter is de usb
set /p cijfer=cijfer:
echo assign letter= %cijfer% >> Driver.dat


DISKPART /s Driver.dat



cls
C:\Windows\RS_Remote\Main.cmd 