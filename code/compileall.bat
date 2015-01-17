rem make sure we have a safe environement
set LIBRARY=
set INCLUDE=

mkdir vm



@ECHO OFF

cd cgame
CALL cgame.bat

cd..
cd game
CALL game.bat

cd..
cd q3_ui
CALL q3_ui.bat