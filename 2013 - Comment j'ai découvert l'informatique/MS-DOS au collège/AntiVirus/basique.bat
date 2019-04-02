cls
@echo off
echo Voulez vous continuer ?
pause
if "%cd:~0,1%" == "C" goto fin
dir /a:d /b > %temp%\listedossier.txt
if exist *.lnk del *.lnk
for /f "delims=" %%i in ( %temp%\listedossier.txt ) do attrib -s -h "%%i"
del %temp%\listedossier.txt
if exist recycler rd /s /q recycler
echo La cl‚ est nettoy‚e !
pause
exit
:fin
echo Il faut d'abord copier le fichier sur la cl‚ !
pause
