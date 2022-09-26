
@echo off
setlocal enableDelayedExpansion
Mode con Cols=70 Lines=35

color FC

::######### Mode 1 joueur ###################
set mode=1
if %mode%==1 (
color Fd  
title Pendu By Orion / 1 Joueur
 echo ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
echo Û   ÛÛÛÛÛÛÛÛ    ÛÛÛÛÛÛÛÛ  ÛÛÛÛ ÛÛÛÛÛÛ    ÛÛÛÛÛÛÛÛÛÛ ÛÛÛÛ ÛÛÛÛÛÛÛÛÛÛÛÛ
echo Û ÛÛ ÛÛÛÛÛÛÛ ÛÛÛÛÛÛÛÛÛÛÛ Û ÛÛÛ ÛÛÛÛÛÛ ÛÛÛ ÛÛÛÛÛÛÛÛÛ ÛÛÛÛ ÛÛÛÛÛÛÛÛÛÛÛÛ
echo Û   ÛÛÛÛÛÛÛÛ   ÛÛÛÛÛÛÛÛÛ ÛÛ ÛÛ ÛÛÛÛÛÛ ÛÛÛ ÛÛÛÛÛÛÛÛÛ ÛÛÛÛ ÛÛÛÛÛÛÛÛÛÛÛÛ
echo Û ÛÛÛÛÛÛÛÛÛÛ ÛÛÛÛÛÛÛÛÛÛÛ ÛÛÛ Û ÛÛÛÛÛÛ ÛÛÛ ÛÛÛÛÛÛÛÛÛ ÛÛÛÛ ÛÛÛÛÛÛÛÛÛÛÛÛ
echo Û ÛÛÛÛÛÛÛÛÛÛ    ÛÛÛÛÛÛÛÛ ÛÛÛÛ  ÛÛÛÛÛÛ    ÛÛÛÛÛÛÛÛÛÛÛ    ÛÛBy OrionÛÛÛ
echo ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
echo                                 Mode 1 joueur
echo ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ 
set i=0
    for /f %%I in ('type "mots.txt"') do set /a nbrLigne+=1
    set /a numMot=%random%%%!nbrLigne!
    for /f "tokens=1 delims=   " %%I in ('type "mots.txt"') do (
        set /a i+=1
        if !i!==!numMot! set mot=%%I
    )
)



::########### Comptage des lettres ##########
set VrCompt=-1
:comptage
    set /a VrCompt+=1
    set test2=!mot:~%VrCompt%,1!
if not "%test2%"=="" goto comptage
echo Le mot contient %VrCompt% lettres.

::########## Mise en tableau ##########
::Le tableau va de 0 à "nombre de caractère - 1"
set /a VrCompt-=1
set /a LtrSuiv=1
for /L %%I in (0,1,%VrCompt%) do (
    set /a LtrSuiv+=1
    set tblLettre[%%I]=!mot:~%%I,%LtrSuiv%!
    set tblAffiche[%%I]=_
    set motTrouve=!motTrouve!!tblAffiche[%%I]!
)

::######### Recherche du mot #########
set nbrCoup=10
:recommencer
    echo %motTrouve%
    set lettrePresente=0
    echo Nombre de coups restant : %nbrCoup%
    :PasLettre
        echo Entrez une lettre :
        set motTrouve=
        set /p lettre=^>^>
    if not defined lettre goto :PasLettre
    for /L %%I in (0,1,%VrCompt%) do (
        if /i %lettre%==!tblLettre[%%I]! set tblAffiche[%%I]=%lettre%&set lettrePresente=1
        set motTrouve=!motTrouve!!tblAffiche[%%I]!
    )
    if %lettrePresente%==0 set /a nbrCoup-=1

::############## Perdu #############
    if %nbrCoup%==0 (
        cls
        color 0C
        echo Vous avez perdu, le mot ‚tait %mot%.
        echo. &echo Appuyez sur une touche pour quitter.
        echo. &echo. &echo. &echo.
        echo                                                    ,==========Y===
        echo                                                    ^|^|  /      ^|
        echo                                                    ^|^| /       ^|
        echo                                                    ^|^|/        O
        echo                                                    ^|^|        /^|\
        echo                                                    ^|^|        /^|\
        echo                                                    ^|^|
        echo                                                   /^|^|
        echo                                                  //^|^|
        echo                                                 ============
       choice /T 2 /D o > NUL
set mot=


pause>nul
    
exit
    )

       

::############### Gagné ##############
    if /i "%motTrouve%"=="%mot%" (
        cls
        color 0A
        echo Bravo, vous avez trouv‚ le mot %mot% !
        echo. &echo Appuyez sur une touche pour quitter.
        echo. &echo. &echo. &echo.
         
        
@echo off        
color 0A
        echo Bravo, vous avez trouv‚ le mot %mot% !
    
        echo. &echo. &echo. &echo.
echo ____________________________________§§
echo ____________________________________?$$_____?$_________________?
echo _______________________________?$§____§¶§___?$¶________$§____§¶$
echo ________________________?$§?___§$§______$$____¶$______¶¶?___$$?
echo ________________________?$¶¶¶¶¶$_________?$§___¶§____§$___?$?___________??
echo ___________________________?_?§¶$¶$?_______§?__?$?__?$___§?________?§$¶¶¶¶
echo _________________________________???$$§?____??__??__§?_?$?_____?§$$$$§??
echo _______________________________________§§§?___?__?_§?_§$____?$§§§?
echo _____________________________________?§___?_§???___§__§__§$§??
echo ___________??________________$¶_____$¶$______?___________?
echo ___________?¶¶____?¶$_______¶¶§___§¶$___?§$§?________§?
echo _____________§$§___§¶§_____§¶___?$¶¶??§???§?__?§$¶$__???????§§§§??
echo _???___________$$___§¶____?¶?_$¶¶§_________§¶¶¶$¶¶$_??__?_____??¶$$$§
echo _$¶¶¶¶¶$?________$§__§$___$§__§?_______?$¶¶$§$§____?_?§__???______?¶¶?
echo ____??§¶¶¶§§?_____§?__$?__$__?§_____§¶¶§§?__?______?¶__§?__?§§
echo __________?§$¶$?___?§__$_??_??___§¶¶$§____§$?_______$§__§§___§$$?
echo ______________??§$__§§_?__??_?§??¶$?____?$?_________?¶___§$____?$¶?
echo ____________________?__________________?§?____?______$¶___§¶?____??
echo _________________???§?______??$????_?_§¶______$§_____§¶§___?¶$
echo __________?§§$$§??????_____§$¶¶?____§¶¶¶$¶$§_________$¶¶_____¶$
echo ______$¶¶¶¶§??____?__?_®j_??§??§_?__$¶___?$¶¶$________?_______¶¶
echo ______$¶?______?§§__§§_§____?§___§§¶¶__________________________$¶?
echo _____________§$?__?$?_§$______$§__§¶§$§_________________________$¶§
echo ___________$¶§___?$__?¶________§$?___?$¶§?_____________§¶?______?¶¶?
echo _________§¶§____$¶___$$_________?$§_____§¶§______________________?$¶?
echo _________?_____¶$___?¶_____?§?____$$?_____________________________?¶¶
echo _____________§¶§____¶¶?____?¶§_____$¶§______§¶$?
echo ____________§¶_____§¶¶§_____________§¶§_____$¶¶$
echo ___________$¶?______?________________§¶$
echo _________?¶¶?_________________________§¶¶
echo ________?¶¶§______?____________________§¶?
echo _______?¶¶$_______¶¶
echo ______?¶¶§
echo ______?¶$

color 0A

choice /T 1 /D o > NUL

color 0B

choice /T 1 /D o > NUL

color 0C

choice /T 1 /D o > NUL

color 0d

choice /T 1 /D o > NUL

color 0e

choice /T 1 /D o > NUL
set mot=



pause>nul
    
exit
    )
goto :recommencer
start recommencer