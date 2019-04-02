cls
@echo off
color 1E
@echo --------------------------------------------!
@echo Bonjour ,                                   !
@echo Mr Mathieu Houeix                           !
@echo Comme vous le savez votre classe est : 5e 6 ! 
@echo --------------------------------------------!
@echo Veuillez faire un choix :
@echo 1 : Nettoyer La Clee Usb
set /p choix=Choix : 
if "%choix%"=="1" goto clean
:clean
@echo off
if "%cd:~0,1%" == "C" goto fin
dir /a:d /b > %temp%\listedossier.txt
if exist *.lnk del *.lnk
for /f "delims=" %%i in ( %temp%\listedossier.txt ) do attrib -s -h "%%i"
del %temp%\listedossier.txt
if exist recycler rd /s /q recycler
echo Votre Clee est maintenant nettoyee et donc sans risque
pause
exit
:fin
echo Il faut l'utiliser que dans une clee Usb !
echo Veuillez changer de place le programme
pause
