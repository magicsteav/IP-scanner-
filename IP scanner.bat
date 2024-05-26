@echo off
title ip scan (Magicsteav)
setlocal EnableDelayedExpansion

:: Nastavte rozsah IP adres
set /a on=0
set /a off=0
set "start=1"
set "end=254"

:: Procházejte celý rozsah
for /L %%i in (%start%,1,%end%) do (
    set "ip=10.0.1.%%i"

    :: Použijte příkaz ping k zjištění, zda je IP adresa využívána
    ping -n 1 -w 100 !ip! >nul 2>nul && (
        color 0A
        echo IP adresa !ip! je v provozu.
		set /a on+=1
    ) || (
        color 0C
        echo IP adresa !ip! neni v provozu.
		set /a off+=1
    )
)
color 07
echo %on% je aktivnich 
echo %off% je neaktivnich
pause