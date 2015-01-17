@echo off
echo compiling cgame\cg_main.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_main.c"
@if errorlevel 1 goto quit
echo compiling game\bg_slidemove.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\game\bg_slidemove.c"
@if errorlevel 1 goto quit
echo compiling game\bg_pmove.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\game\bg_pmove.c"
@if errorlevel 1 goto quit
echo compiling game\bg_lib.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\game\bg_lib.c"
@if errorlevel 1 goto quit
echo compiling game\bg_misc.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\game\bg_misc.c"
@if errorlevel 1 goto quit
echo compiling game\q_math.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\game\q_math.c"
@if errorlevel 1 goto quit
echo compiling game\q_shared.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\game\q_shared.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_consolecmds.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_consolecmds.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_draw.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_draw.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_drawtools.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_drawtools.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_effects.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_effects.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_ents.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_ents.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_event.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_event.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_info.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_info.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_localents.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_localents.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_marks.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_marks.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_players.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_players.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_playerstate.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_playerstate.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_predict.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_predict.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_scoreboard.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_scoreboard.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_servercmds.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_servercmds.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_snapshot.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_snapshot.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_view.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_view.c"
@if errorlevel 1 goto quit
echo compiling cgame\cg_weapons.c
lcc -DQ3_VM -DCGAME -S -Wf-target=bytecode -Wf-g  -I"F:\Quake3\hello\code\cgame" -I"F:\Quake3\hello\code\game" -I"F:\Quake3\hello\code\q3_ui" "F:\Quake3\hello\code\cgame\cg_weapons.c"
@if errorlevel 1 goto quit

q3asm -o "F:\Quake3\hello\vm\cgame"  cg_main cg_syscalls bg_slidemove bg_pmove bg_lib bg_misc q_math q_shared cg_consolecmds cg_draw cg_drawtools cg_effects cg_ents cg_event cg_info cg_localents cg_marks cg_players cg_playerstate cg_predict cg_scoreboard cg_servercmds cg_snapshot cg_view cg_weapons
:quit
del *.asm