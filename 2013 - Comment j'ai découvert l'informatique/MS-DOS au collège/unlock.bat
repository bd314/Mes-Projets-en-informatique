echo off
cls
title BD314 - Unlock Keys Beta 0.1

:shell
ECHO.             
ECHO.
echo ================================================================================
ECHO.
echo           $$$$$\      $$$$$$\     $$$$\      $\     $$³    $$³
echo           $$  $$\     $$   $$\       $$\    $$³     $$³    $$³
echo           $$  $$³     $$   $$³        $³   $ $³     $$³    $$³
echo           $$$$$ ³     $$   $$³     $$$$³     $³     $$$$$$$$/
echo           $$  $$³     $$   $$³        $³     $³           $$³
echo           $$  $$³     $$   $$³       $$³     $ \          $$³
echo           $$$$$ ³     $$$$$$ ³    $$$$ ³   $$$$$³         $$³
echo           \_____/     \_____/     \___/    \___/          \/
ECHO.
echo ================================================================================
ECHO.                                          
ECHO.
if EXIST "Poste de Travail.{20D04FE0-3AEA-1069-A2D8-08002B30309D}" goto DEVERROUILLE
if NOT EXIST private goto CREERVERROU
:DIALOGUE
echo Voulez-vous verrouiller ce dossier (O/N)
set/p "choix=>"
if %choix%==O goto VERROU
if %choix%==o goto VERROU
if %choix%==N goto FIN
if %choix%==n goto FIN
echo Mauvaise reponse. Essaye encore, avec O ou N.
goto DIALOGUE
:VERROU
ren private "Poste de Travail.{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
attrib +h +s "Poste de Travail.{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
echo Le dossier est verrouille
goto FIN
:DEVERROUILLE
echo Taper le mot de passe
set/p "mdp=>"
if NOT %mdp%== password goto RATE
attrib -h -s "Poste de Travail.{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
ren "Poste de Travail.{20D04FE0-3AEA-1069-A2D8-08002B30309D}" private
echo Le dossier a ete deverrouille
goto FIN
:RATE
echo Mauvaise reponse. Essaye encore, avec le bon mot de passe.
Pause
goto FIN
:CREERVERROU
md private
echo le dossier private a ete cree
pause
goto FIN
:FIN