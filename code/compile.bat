@echo off
if "%1"=="" goto Q3A
echo beginning to compile %1
goto %1

:cgame
:game
:q3_ui
:ui
cd %1
call %1
cd ..
goto end

:cgame_ta
cd cgame
call cgame TA
cd ..
goto end

:game_ta
cd game
call game TA
cd ..
goto end

:Q3TA
cd game
call game TA

echo game done

cd ..\cgame
call cgame TA

echo cgame done

cd ..\ui
call ui

echo ui done

cd ..
goto end

:Q3A
cd game
call game

echo game done

cd ..\cgame
call cgame

echo cgame done

cd ..\q3_ui
call q3_ui

echo q3_ui done

cd ..
goto end

:end
echo all done..