cls
@echo off
color 1A

IF EXIST licence.txt (
goto :run
) ELSE (
goto :error
pause
exit
)

:error
color CF
echo --------------------------------------------!
echo    _                                        !
echo   / \                                       !
echo  / ! \     COPIE DETECTE - LICENSE ILLEGALE !
echo /_____\                                     !
echo --------------------------------------------!
pause
exit

:run
@echo --------------------------------------------!
@echo Bonjour ,                                   !
@echo Mr Baptiste Duvieu                          !
@echo Comme vous le savez votre classe est : 5e 6 ! 
@echo --------------------------------------------!
@echo Veuillez faire un choix :
@echo 1 : Fermez la session
@echo 2 : Nettoyer La Clee Usb
@echo 3 : Travail
@echo 4 : Edit Mode
set /p choix=Choix : 
if "%choix%"=="1" goto session
if "%choix%"=="2" goto clean
if "%choix%"=="3" goto travail
if "%choix%"=="4" goto dev

:dev
O:\Apps\Notepad++Portable\Notepad++Portable.exe
pause
exit


:travail    
cls
@echo 1 : Ressource
@echo 2 : Repertoire
@echo 3 : Retour
set /p choix=Choix : 
if "%choix%"=="1" goto Ressource
if "%choix%"=="2" goto Me
if "%choix%"=="3" goto back



:ressource
%SystemRoot%\explorer.exe "W:\Classe_5eme6\_travail"
exit

:me
%SystemRoot%\explorer.exe "W:\Classe_5eme6\duvieub"
exit


:back
cls
@echo Veuillez faire un choix :
@echo 1 : Fermez la session
@echo 2 : Nettoyer La Clée Usb
@echo 3 : Travail
set /p choix=Choix : 
if "%choix%"=="1" goto session
if "%choix%"=="2" goto clean
if "%choix%"=="3" goto travail


:session
%windir%\System32\shutdown.exe -l -t 0
exit


:clean
@echo off
cls
if "%cd:~0,1%" == "C" goto fin
dir /a:d /b > %temp%\listedossier.txt
if exist *.lnk del *.lnk
for /f "delims=" %%i in ( %temp%\listedossier.txt ) do attrib -s -h "%%i"
del %temp%\listedossier.txt
if exist recycler rd /s /q recycler
echo ------------------------------------------------------!
echo Votre Clee est nettoyee                               !
echo ------------------------------------------------------!
pause
exit


:fin
echo Il faut l'utiliser que dans une clee Usb !
echo -> Veuillez changer de place le programme
pause


