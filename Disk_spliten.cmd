@echo off
cd C:\Windows\System32\Custom formeren
DISKPART /s list_diskpart.txt
echo "writch the disk that you whant to formeren."
set /p disk=disk:
echo sel disk %disk% > spliten.dat
echo clean >> spliten.dat

set /p size=size:
echo create primary size= %size% >> spliten.dat
echo format fs = ntfs quick >> spliten.dat


echo Welke leter is de usb
set /p cijfer=cijfer:
echo assign letter= %cijfer% >> spliten.dat

echo Welke leter wil je de 2de disk hebben?
set /p cijfer2=leter:

echo active >> spliten.dat
echo create partition primary >> spliten.dat
echo format fs = ntfs quick >> spliten.dat
echo assign letter= %cijfer2% >> spliten.dat

pause
end