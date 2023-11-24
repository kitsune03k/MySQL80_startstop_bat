@echo off

set "obj=MySQL80"
sc config %obj% start=demand

set "docPath=%USERPROFILE%\Documents\Scripts_%obj%"
set "dtPath=%USERPROFILE%\Desktop"

if not exist "%docPath%" mkdir "%docPath%"


:M0
echo 1. Make shortcut of %obj% to start, stop, and restart
echo 2. Make shortcut of %obj% start, stop, restart, pause, and continue
set /p choice="choice : "

if %choice% equ 1 (
goto M1
) else if %choice% equ 2 (
goto M2
) else (
echo input correctly!)
goto M0


:M2
set "n4=Pause_%obj%"
set "n5=Continue_%obj%"

set "bat4=%docPath%\%n4%.bat"
set "lnk4=%dtPath%\%n4%.lnk"

set "bat5=%docPath%\%n5%.bat"
set "lnk5=%dtPath%\%n5%.lnk"

(
    echo @echo off
    echo net pause MySQL80
) > "%bat4%"

(
    echo @echo off
    echo net continue MySQL80
) > "%bat5%"

powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%lnk4%'); $Shortcut.TargetPath = '%bat4%'; $Shortcut.Save()"
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%lnk5%'); $Shortcut.TargetPath = '%bat5%'; $Shortcut.Save()"

powershell -Command "$bytes = [System.IO.File]::ReadAllBytes('%lnk4%'); $bytes[0x15] = $bytes[0x15] -bor 0x20;[System.IO.File]::WriteAllBytes('%lnk4%', $bytes)"
powershell -Command "$bytes = [System.IO.File]::ReadAllBytes('%lnk5%'); $bytes[0x15] = $bytes[0x15] -bor 0x20;[System.IO.File]::WriteAllBytes('%lnk5%', $bytes)"


:M1
set "n1=Start_%obj%"
set "n2=Stop_%obj%"
set "n3=Restart_%obj%"

set "bat1=%docPath%\%n1%.bat"
set "lnk1=%dtPath%\%n1%.lnk"

set "bat2=%docPath%\%n2%.bat"
set "lnk2=%dtPath%\%n2%.lnk"

set "bat3=%docPath%\%n3%.bat"
set "lnk3=%dtPath%\%n3%.lnk"

(
    echo @echo off
    echo net start MySQL80
) > "%bat1%"

(
    echo @echo off
    echo net stop MySQL80
) > "%bat2%"

(
    echo @echo off
    echo net stop MySQL80
    echo net start MySQL80
) > "%bat3%"

powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%lnk1%'); $Shortcut.TargetPath = '%bat1%'; $Shortcut.Save()"
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%lnk2%'); $Shortcut.TargetPath = '%bat2%'; $Shortcut.Save()"
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%lnk3%'); $Shortcut.TargetPath = '%bat3%'; $Shortcut.Save()"

powershell -Command "$bytes = [System.IO.File]::ReadAllBytes('%lnk1%'); $bytes[0x15] = $bytes[0x15] -bor 0x20;[System.IO.File]::WriteAllBytes('%lnk1%', $bytes)"
powershell -Command "$bytes = [System.IO.File]::ReadAllBytes('%lnk2%'); $bytes[0x15] = $bytes[0x15] -bor 0x20;[System.IO.File]::WriteAllBytes('%lnk2%', $bytes)"
powershell -Command "$bytes = [System.IO.File]::ReadAllBytes('%lnk3%'); $bytes[0x15] = $bytes[0x15] -bor 0x20;[System.IO.File]::WriteAllBytes('%lnk3%', $bytes)"

echo .bat and .lnk files are created

pause