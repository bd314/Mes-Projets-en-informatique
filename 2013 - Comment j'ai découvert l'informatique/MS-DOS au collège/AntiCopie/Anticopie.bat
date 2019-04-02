cls
@echo off
color 1A

IF EXIST 1.txt (
goto :run
) ELSE (
echo Erreur numero : 401
pause
exit
)

:run
echo reussis
IF EXIST 2.txt (
goto :run2
) ELSE (
echo Erreur numero : 401
pause
exit
)

:run2
echo reussis
IF EXIST 3.txt (
goto :run3
) ELSE (
echo Erreur numero : 401
pause
exit
)

:run3
echo reussis
IF EXIST 4.txt (
goto :run4
) ELSE (
echo Erreur numero : 401
pause
exit
)

:run4
echo reussis
IF EXIST 5.txt (
goto :run5
) ELSE (
echo Erreur numero : 401
pause
exit
)

:run5
echo reussis
IF EXIST 6.txt (
echo [Anti-Copie] : Rien a signaler !
pause
exit
) ELSE (
echo Erreur numero : 401
pause
exit
)