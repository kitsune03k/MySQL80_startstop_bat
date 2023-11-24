@echo off

set "obj=MySQL80"
sc config %obj% start=auto

set "docPath=%USERPROFILE%\Documents\Scripts_%obj%"
set "dtPath=%USERPROFILE%\Desktop"

if exist "%docPath%" (
rd /s /q "%docPath%"
echo All .bat files are deleted
) else (
echo **Error** No .bat files to delete!)

set "deltgt=%dtpath%\*_MySQL80.lnk"

if exist "%deltgt%" (
del "%deltgt%"
echo All .lnk files are deleted
) else (
echo **Error** No .lnk files to delete!)

pause