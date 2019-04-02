cls
@echo off
color 1A
:licence
cls
IF EXIST licence.txt (
echo ------------------------------------------------------
echo Bienvenue sur le Createur de licence 
echo Veuillez faire un choix :
echo 1 : Creer une licence
echo 2 : Supprimer la licence 
echo ------------------------------------------------------
set /p choix=Choix : 
if "%choix%"=="1" goto :licence
if "%choix%"=="2" goto :del
) ELSE (
echo ------------------------------------------------------
echo Bienvenue sur le Createur de licence 
echo Veuillez faire un choix :
echo 1 : Creer une licence
echo ------------------------------------------------------
pause 
goto :create
)


:del
cls
echo ------------------------------------------------------
echo Veuillez patienter nous effacons la licence !
echo ------------------------------------------------------
del licence.txt
pause
goto :fin

:create
cls
echo ------------------------------------------------------
echo Nous creeons une licence . . .
echo ------------------------------------------------------
copy h:\anticopie\base.txt h:\base.txt
ren base.txt licence.txt
pause
goto :fin


:fin
cls
echo ------------------------------------------------------
echo Merci d'avoir utiliser Createur de licence a bientot !
echo ------------------------------------------------------
pause
exit