export CG_TargetCommand_f
code
proc CG_TargetCommand_f 20 12
file "../cg_consolecmds.c"
line 14
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_consolecmds.c -- text commands typed in at the local console, or
;4:// executed by a key binding
;5:
;6:#include "cg_local.h"
;7:#include "../ui/ui_shared.h"
;8:#ifdef MISSIONPACK
;9:extern menuDef_t *menuScoreboard;
;10:#endif
;11:
;12:
;13:
;14:void CG_TargetCommand_f( void ) {
line 18
;15:	int		targetNum;
;16:	char	test[4];
;17:
;18:	targetNum = CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 19
;19:	if (!targetNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $80
line 20
;20:		return;
ADDRGP4 $79
JUMPV
LABELV $80
line 23
;21:	}
;22:
;23:	trap_Argv( 1, test, 4 );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 24
;24:	trap_SendConsoleCommand( va( "gc %i %i", targetNum, atoi( test ) ) );
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $82
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 25
;25:}
LABELV $79
endproc CG_TargetCommand_f 20 12
proc CG_SizeUp_f 4 8
line 36
;26:
;27:
;28:
;29:/*
;30:=================
;31:CG_SizeUp_f
;32:
;33:Keybinding command
;34:=================
;35:*/
;36:static void CG_SizeUp_f (void) {
line 37
;37:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer+10)));
ADDRGP4 $85
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $84
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 38
;38:}
LABELV $83
endproc CG_SizeUp_f 4 8
proc CG_SizeDown_f 4 8
line 48
;39:
;40:
;41:/*
;42:=================
;43:CG_SizeDown_f
;44:
;45:Keybinding command
;46:=================
;47:*/
;48:static void CG_SizeDown_f (void) {
line 49
;49:	trap_Cvar_Set("cg_viewsize", va("%i",(int)(cg_viewsize.integer-10)));
ADDRGP4 $85
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $84
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 50
;50:}
LABELV $87
endproc CG_SizeDown_f 4 8
proc CG_Viewpos_f 0 20
line 60
;51:
;52:
;53:/*
;54:=============
;55:CG_Viewpos_f
;56:
;57:Debugging command to print the current position
;58:=============
;59:*/
;60:static void CG_Viewpos_f (void) {
line 61
;61:	CG_Printf ("(%i %i %i) : %i\n", (int)cg.refdef.vieworg[0],
ADDRGP4 $90
ARGP4
ADDRGP4 cg+109044+24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109044+24+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109044+24+8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109412+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 64
;62:		(int)cg.refdef.vieworg[1], (int)cg.refdef.vieworg[2], 
;63:		(int)cg.refdefViewAngles[YAW]);
;64:}
LABELV $89
endproc CG_Viewpos_f 0 20
proc CG_ScoresDown_f 0 4
line 67
;65:
;66:
;67:static void CG_ScoresDown_f( void ) {
line 72
;68:
;69:#ifdef MISSIONPACK
;70:		CG_BuildSpectatorString();
;71:#endif
;72:	if ( cg.scoresRequestTime + 2000 < cg.time ) {
ADDRGP4 cg+110460
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $102
line 75
;73:		// the scores are more than two seconds out of data,
;74:		// so request new ones
;75:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+110460
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 76
;76:		trap_SendClientCommand( "score" );
ADDRGP4 $108
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 80
;77:
;78:		// leave the current scores up if they were already
;79:		// displayed, but if this is the first hit, clear them out
;80:		if ( !cg.showScores ) {
ADDRGP4 cg+114320
INDIRI4
CNSTI4 0
NEI4 $103
line 81
;81:			cg.showScores = qtrue;
ADDRGP4 cg+114320
CNSTI4 1
ASGNI4
line 82
;82:			cg.numScores = 0;
ADDRGP4 cg+110464
CNSTI4 0
ASGNI4
line 83
;83:		}
line 84
;84:	} else {
ADDRGP4 $103
JUMPV
LABELV $102
line 87
;85:		// show the cached contents even if they just pressed if it
;86:		// is within two seconds
;87:		cg.showScores = qtrue;
ADDRGP4 cg+114320
CNSTI4 1
ASGNI4
line 88
;88:	}
LABELV $103
line 89
;89:}
LABELV $101
endproc CG_ScoresDown_f 0 4
proc CG_ScoresUp_f 0 0
line 91
;90:
;91:static void CG_ScoresUp_f( void ) {
line 92
;92:	if ( cg.showScores ) {
ADDRGP4 cg+114320
INDIRI4
CNSTI4 0
EQI4 $116
line 93
;93:		cg.showScores = qfalse;
ADDRGP4 cg+114320
CNSTI4 0
ASGNI4
line 94
;94:		cg.scoreFadeTime = cg.time;
ADDRGP4 cg+114328
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 95
;95:	}
LABELV $116
line 96
;96:}
LABELV $115
endproc CG_ScoresUp_f 0 0
proc CG_TellTarget_f 264 20
line 163
;97:
;98:#ifdef MISSIONPACK
;99:extern menuDef_t *menuScoreboard;
;100:void Menu_Reset();			// FIXME: add to right include file
;101:
;102:static void CG_LoadHud_f( void) {
;103:  char buff[1024];
;104:	const char *hudSet;
;105:  memset(buff, 0, sizeof(buff));
;106:
;107:	String_Init();
;108:	Menu_Reset();
;109:	
;110:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
;111:	hudSet = buff;
;112:	if (hudSet[0] == '\0') {
;113:		hudSet = "ui/hud.txt";
;114:	}
;115:
;116:	CG_LoadMenus(hudSet);
;117:  menuScoreboard = NULL;
;118:}
;119:
;120:
;121:static void CG_scrollScoresDown_f( void) {
;122:	if (menuScoreboard && cg.scoreBoardShowing) {
;123:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qtrue);
;124:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qtrue);
;125:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qtrue);
;126:	}
;127:}
;128:
;129:
;130:static void CG_scrollScoresUp_f( void) {
;131:	if (menuScoreboard && cg.scoreBoardShowing) {
;132:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qfalse);
;133:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qfalse);
;134:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qfalse);
;135:	}
;136:}
;137:
;138:
;139:static void CG_spWin_f( void) {
;140:	trap_Cvar_Set("cg_cameraOrbit", "2");
;141:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
;142:	trap_Cvar_Set("cg_thirdPerson", "1");
;143:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
;144:	trap_Cvar_Set("cg_thirdPersonRange", "100");
;145:	CG_AddBufferedSound(cgs.media.winnerSound);
;146:	//trap_S_StartLocalSound(cgs.media.winnerSound, CHAN_ANNOUNCER);
;147:	CG_CenterPrint("YOU WIN!", SCREEN_HEIGHT * .30, 0);
;148:}
;149:
;150:static void CG_spLose_f( void) {
;151:	trap_Cvar_Set("cg_cameraOrbit", "2");
;152:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
;153:	trap_Cvar_Set("cg_thirdPerson", "1");
;154:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
;155:	trap_Cvar_Set("cg_thirdPersonRange", "100");
;156:	CG_AddBufferedSound(cgs.media.loserSound);
;157:	//trap_S_StartLocalSound(cgs.media.loserSound, CHAN_ANNOUNCER);
;158:	CG_CenterPrint("YOU LOSE...", SCREEN_HEIGHT * .30, 0);
;159:}
;160:
;161:#endif
;162:
;163:static void CG_TellTarget_f( void ) {
line 168
;164:	int		clientNum;
;165:	char	command[128];
;166:	char	message[128];
;167:
;168:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 169
;169:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $123
line 170
;170:		return;
ADDRGP4 $122
JUMPV
LABELV $123
line 173
;171:	}
;172:
;173:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 174
;174:	Com_sprintf( command, 128, "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $125
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 175
;175:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 176
;176:}
LABELV $122
endproc CG_TellTarget_f 264 20
proc CG_TellAttacker_f 264 20
line 178
;177:
;178:static void CG_TellAttacker_f( void ) {
line 183
;179:	int		clientNum;
;180:	char	command[128];
;181:	char	message[128];
;182:
;183:	clientNum = CG_LastAttacker();
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 184
;184:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $127
line 185
;185:		return;
ADDRGP4 $126
JUMPV
LABELV $127
line 188
;186:	}
;187:
;188:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 189
;189:	Com_sprintf( command, 128, "tell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $125
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 190
;190:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 191
;191:}
LABELV $126
endproc CG_TellAttacker_f 264 20
proc CG_VoiceTellTarget_f 264 20
line 193
;192:
;193:static void CG_VoiceTellTarget_f( void ) {
line 198
;194:	int		clientNum;
;195:	char	command[128];
;196:	char	message[128];
;197:
;198:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 199
;199:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $130
line 200
;200:		return;
ADDRGP4 $129
JUMPV
LABELV $130
line 203
;201:	}
;202:
;203:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 204
;204:	Com_sprintf( command, 128, "vtell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $132
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 205
;205:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 206
;206:}
LABELV $129
endproc CG_VoiceTellTarget_f 264 20
proc CG_VoiceTellAttacker_f 264 20
line 208
;207:
;208:static void CG_VoiceTellAttacker_f( void ) {
line 213
;209:	int		clientNum;
;210:	char	command[128];
;211:	char	message[128];
;212:
;213:	clientNum = CG_LastAttacker();
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 214
;214:	if ( clientNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $134
line 215
;215:		return;
ADDRGP4 $133
JUMPV
LABELV $134
line 218
;216:	}
;217:
;218:	trap_Args( message, 128 );
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 219
;219:	Com_sprintf( command, 128, "vtell %i %s", clientNum, message );
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $132
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 220
;220:	trap_SendClientCommand( command );
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 221
;221:}
LABELV $133
endproc CG_VoiceTellAttacker_f 264 20
proc CG_StartOrbit_f 1028 12
line 396
;222:
;223:#ifdef MISSIONPACK
;224:static void CG_NextTeamMember_f( void ) {
;225:  CG_SelectNextPlayer();
;226:}
;227:
;228:static void CG_PrevTeamMember_f( void ) {
;229:  CG_SelectPrevPlayer();
;230:}
;231:
;232:// ASS U ME's enumeration order as far as task specific orders, OFFENSE is zero, CAMP is last
;233://
;234:static void CG_NextOrder_f( void ) {
;235:	clientInfo_t *ci = cgs.clientinfo + cg.snap->ps.clientNum;
;236:	if (ci) {
;237:		if (!ci->teamLeader && sortedTeamPlayers[cg_currentSelectedPlayer.integer] != cg.snap->ps.clientNum) {
;238:			return;
;239:		}
;240:	}
;241:	if (cgs.currentOrder < TEAMTASK_CAMP) {
;242:		cgs.currentOrder++;
;243:
;244:		if (cgs.currentOrder == TEAMTASK_RETRIEVE) {
;245:			if (!CG_OtherTeamHasFlag()) {
;246:				cgs.currentOrder++;
;247:			}
;248:		}
;249:
;250:		if (cgs.currentOrder == TEAMTASK_ESCORT) {
;251:			if (!CG_YourTeamHasFlag()) {
;252:				cgs.currentOrder++;
;253:			}
;254:		}
;255:
;256:	} else {
;257:		cgs.currentOrder = TEAMTASK_OFFENSE;
;258:	}
;259:	cgs.orderPending = qtrue;
;260:	cgs.orderTime = cg.time + 3000;
;261:}
;262:
;263:
;264:static void CG_ConfirmOrder_f (void ) {
;265:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_YES));
;266:	trap_SendConsoleCommand("+button5; wait; -button5");
;267:	if (cg.time < cgs.acceptOrderTime) {
;268:		trap_SendClientCommand(va("teamtask %d\n", cgs.acceptTask));
;269:		cgs.acceptOrderTime = 0;
;270:	}
;271:}
;272:
;273:static void CG_DenyOrder_f (void ) {
;274:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_NO));
;275:	trap_SendConsoleCommand("+button6; wait; -button6");
;276:	if (cg.time < cgs.acceptOrderTime) {
;277:		cgs.acceptOrderTime = 0;
;278:	}
;279:}
;280:
;281:static void CG_TaskOffense_f (void ) {
;282:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF) {
;283:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONGETFLAG));
;284:	} else {
;285:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONOFFENSE));
;286:	}
;287:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_OFFENSE));
;288:}
;289:
;290:static void CG_TaskDefense_f (void ) {
;291:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONDEFENSE));
;292:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_DEFENSE));
;293:}
;294:
;295:static void CG_TaskPatrol_f (void ) {
;296:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONPATROL));
;297:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_PATROL));
;298:}
;299:
;300:static void CG_TaskCamp_f (void ) {
;301:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONCAMPING));
;302:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_CAMP));
;303:}
;304:
;305:static void CG_TaskFollow_f (void ) {
;306:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOW));
;307:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_FOLLOW));
;308:}
;309:
;310:static void CG_TaskRetrieve_f (void ) {
;311:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONRETURNFLAG));
;312:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_RETRIEVE));
;313:}
;314:
;315:static void CG_TaskEscort_f (void ) {
;316:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOWCARRIER));
;317:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_ESCORT));
;318:}
;319:
;320:static void CG_TaskOwnFlag_f (void ) {
;321:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_IHAVEFLAG));
;322:}
;323:
;324:static void CG_TauntKillInsult_f (void ) {
;325:	trap_SendConsoleCommand("cmd vsay kill_insult\n");
;326:}
;327:
;328:static void CG_TauntPraise_f (void ) {
;329:	trap_SendConsoleCommand("cmd vsay praise\n");
;330:}
;331:
;332:static void CG_TauntTaunt_f (void ) {
;333:	trap_SendConsoleCommand("cmd vtaunt\n");
;334:}
;335:
;336:static void CG_TauntDeathInsult_f (void ) {
;337:	trap_SendConsoleCommand("cmd vsay death_insult\n");
;338:}
;339:
;340:static void CG_TauntGauntlet_f (void ) {
;341:	trap_SendConsoleCommand("cmd vsay kill_guantlet\n");
;342:}
;343:
;344:static void CG_TaskSuicide_f (void ) {
;345:	int		clientNum;
;346:	char	command[128];
;347:
;348:	clientNum = CG_CrosshairPlayer();
;349:	if ( clientNum == -1 ) {
;350:		return;
;351:	}
;352:
;353:	Com_sprintf( command, 128, "tell %i suicide", clientNum );
;354:	trap_SendClientCommand( command );
;355:}
;356:
;357:
;358:
;359:/*
;360:==================
;361:CG_TeamMenu_f
;362:==================
;363:*/
;364:/*
;365:static void CG_TeamMenu_f( void ) {
;366:  if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
;367:    CG_EventHandling(CGAME_EVENT_NONE);
;368:    trap_Key_SetCatcher(0);
;369:  } else {
;370:    CG_EventHandling(CGAME_EVENT_TEAMMENU);
;371:    //trap_Key_SetCatcher(KEYCATCH_CGAME);
;372:  }
;373:}
;374:*/
;375:
;376:/*
;377:==================
;378:CG_EditHud_f
;379:==================
;380:*/
;381:/*
;382:static void CG_EditHud_f( void ) {
;383:  //cls.keyCatchers ^= KEYCATCH_CGAME;
;384:  //VM_Call (cgvm, CG_EVENT_HANDLING, (cls.keyCatchers & KEYCATCH_CGAME) ? CGAME_EVENT_EDITHUD : CGAME_EVENT_NONE);
;385:}
;386:*/
;387:
;388:#endif
;389:
;390:/*
;391:==================
;392:CG_StartOrbit_f
;393:==================
;394:*/
;395:
;396:static void CG_StartOrbit_f( void ) {
line 399
;397:	char var[MAX_TOKEN_CHARS];
;398:
;399:	trap_Cvar_VariableStringBuffer( "developer", var, sizeof( var ) );
ADDRGP4 $137
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 400
;400:	if ( !atoi(var) ) {
ADDRLP4 0
ARGP4
ADDRLP4 1024
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $138
line 401
;401:		return;
ADDRGP4 $136
JUMPV
LABELV $138
line 403
;402:	}
;403:	if (cg_cameraOrbit.value != 0) {
ADDRGP4 cg_cameraOrbit+8
INDIRF4
CNSTF4 0
EQF4 $140
line 404
;404:		trap_Cvar_Set ("cg_cameraOrbit", "0");
ADDRGP4 $143
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 405
;405:		trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $145
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 406
;406:	} else {
ADDRGP4 $141
JUMPV
LABELV $140
line 407
;407:		trap_Cvar_Set("cg_cameraOrbit", "5");
ADDRGP4 $143
ARGP4
ADDRGP4 $146
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 408
;408:		trap_Cvar_Set("cg_thirdPerson", "1");
ADDRGP4 $145
ARGP4
ADDRGP4 $147
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 409
;409:		trap_Cvar_Set("cg_thirdPersonAngle", "0");
ADDRGP4 $148
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 410
;410:		trap_Cvar_Set("cg_thirdPersonRange", "100");
ADDRGP4 $149
ARGP4
ADDRGP4 $150
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 411
;411:	}
LABELV $141
line 412
;412:}
LABELV $136
endproc CG_StartOrbit_f 1028 12
data
align 4
LABELV commands
address $152
address CG_TestGun_f
address $153
address CG_TestModel_f
address $154
address CG_TestModelNextFrame_f
address $155
address CG_TestModelPrevFrame_f
address $156
address CG_TestModelNextSkin_f
address $157
address CG_TestModelPrevSkin_f
address $158
address CG_Viewpos_f
address $159
address CG_ScoresDown_f
address $160
address CG_ScoresUp_f
address $161
address CG_ZoomDown_f
address $162
address CG_ZoomUp_f
address $163
address CG_SizeUp_f
address $164
address CG_SizeDown_f
address $165
address CG_NextWeapon_f
address $166
address CG_PrevWeapon_f
address $167
address CG_Weapon_f
address $168
address CG_TellTarget_f
address $169
address CG_TellAttacker_f
address $170
address CG_VoiceTellTarget_f
address $171
address CG_VoiceTellAttacker_f
address $172
address CG_TargetCommand_f
address $173
address CG_StartOrbit_f
address $174
address CG_LoadDeferredPlayers
export CG_ConsoleCommand
code
proc CG_ConsoleCommand 16 8
line 495
;413:
;414:/*
;415:static void CG_Camera_f( void ) {
;416:	char name[1024];
;417:	trap_Argv( 1, name, sizeof(name));
;418:	if (trap_loadCamera(name)) {
;419:		cg.cameraMode = qtrue;
;420:		trap_startCamera(cg.time);
;421:	} else {
;422:		CG_Printf ("Unable to load camera %s\n",name);
;423:	}
;424:}
;425:*/
;426:
;427:
;428:typedef struct {
;429:	char	*cmd;
;430:	void	(*function)(void);
;431:} consoleCommand_t;
;432:
;433:static consoleCommand_t	commands[] = {
;434:	{ "testgun", CG_TestGun_f },
;435:	{ "testmodel", CG_TestModel_f },
;436:	{ "nextframe", CG_TestModelNextFrame_f },
;437:	{ "prevframe", CG_TestModelPrevFrame_f },
;438:	{ "nextskin", CG_TestModelNextSkin_f },
;439:	{ "prevskin", CG_TestModelPrevSkin_f },
;440:	{ "viewpos", CG_Viewpos_f },
;441:	{ "+scores", CG_ScoresDown_f },
;442:	{ "-scores", CG_ScoresUp_f },
;443:	{ "+zoom", CG_ZoomDown_f },
;444:	{ "-zoom", CG_ZoomUp_f },
;445:	{ "sizeup", CG_SizeUp_f },
;446:	{ "sizedown", CG_SizeDown_f },
;447:	{ "weapnext", CG_NextWeapon_f },
;448:	{ "weapprev", CG_PrevWeapon_f },
;449:	{ "weapon", CG_Weapon_f },
;450:	{ "tell_target", CG_TellTarget_f },
;451:	{ "tell_attacker", CG_TellAttacker_f },
;452:	{ "vtell_target", CG_VoiceTellTarget_f },
;453:	{ "vtell_attacker", CG_VoiceTellAttacker_f },
;454:	{ "tcmd", CG_TargetCommand_f },
;455:#ifdef MISSIONPACK
;456:	{ "loadhud", CG_LoadHud_f },
;457:	{ "nextTeamMember", CG_NextTeamMember_f },
;458:	{ "prevTeamMember", CG_PrevTeamMember_f },
;459:	{ "nextOrder", CG_NextOrder_f },
;460:	{ "confirmOrder", CG_ConfirmOrder_f },
;461:	{ "denyOrder", CG_DenyOrder_f },
;462:	{ "taskOffense", CG_TaskOffense_f },
;463:	{ "taskDefense", CG_TaskDefense_f },
;464:	{ "taskPatrol", CG_TaskPatrol_f },
;465:	{ "taskCamp", CG_TaskCamp_f },
;466:	{ "taskFollow", CG_TaskFollow_f },
;467:	{ "taskRetrieve", CG_TaskRetrieve_f },
;468:	{ "taskEscort", CG_TaskEscort_f },
;469:	{ "taskSuicide", CG_TaskSuicide_f },
;470:	{ "taskOwnFlag", CG_TaskOwnFlag_f },
;471:	{ "tauntKillInsult", CG_TauntKillInsult_f },
;472:	{ "tauntPraise", CG_TauntPraise_f },
;473:	{ "tauntTaunt", CG_TauntTaunt_f },
;474:	{ "tauntDeathInsult", CG_TauntDeathInsult_f },
;475:	{ "tauntGauntlet", CG_TauntGauntlet_f },
;476:	{ "spWin", CG_spWin_f },
;477:	{ "spLose", CG_spLose_f },
;478:	{ "scoresDown", CG_scrollScoresDown_f },
;479:	{ "scoresUp", CG_scrollScoresUp_f },
;480:#endif
;481:	{ "startOrbit", CG_StartOrbit_f },
;482:	//{ "camera", CG_Camera_f },
;483:	{ "loaddeferred", CG_LoadDeferredPlayers }	
;484:};
;485:
;486:
;487:/*
;488:=================
;489:CG_ConsoleCommand
;490:
;491:The string has been tokenized and can be retrieved with
;492:Cmd_Argc() / Cmd_Argv()
;493:=================
;494:*/
;495:qboolean CG_ConsoleCommand( void ) {
line 499
;496:	const char	*cmd;
;497:	int		i;
;498:
;499:	cmd = CG_Argv(0);
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 501
;500:
;501:	for ( i = 0 ; i < sizeof( commands ) / sizeof( commands[0] ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $179
JUMPV
LABELV $176
line 502
;502:		if ( !Q_stricmp( cmd, commands[i].cmd ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $180
line 503
;503:			commands[i].function();
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands+4
ADDP4
INDIRP4
CALLV
pop
line 504
;504:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $175
JUMPV
LABELV $180
line 506
;505:		}
;506:	}
LABELV $177
line 501
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $179
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 23
LTU4 $176
line 508
;507:
;508:	return qfalse;
CNSTI4 0
RETI4
LABELV $175
endproc CG_ConsoleCommand 16 8
export CG_InitConsoleCommands
proc CG_InitConsoleCommands 4 4
line 520
;509:}
;510:
;511:
;512:/*
;513:=================
;514:CG_InitConsoleCommands
;515:
;516:Let the client system know about all of our commands
;517:so it can perform tab completion
;518:=================
;519:*/
;520:void CG_InitConsoleCommands( void ) {
line 523
;521:	int		i;
;522:
;523:	for ( i = 0 ; i < sizeof( commands ) / sizeof( commands[0] ) ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $187
JUMPV
LABELV $184
line 524
;524:		trap_AddCommand( commands[i].cmd );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 525
;525:	}
LABELV $185
line 523
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $187
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 23
LTU4 $184
line 531
;526:
;527:	//
;528:	// the game server will interpret these commands, which will be automatically
;529:	// forwarded to the server after they are not recognized locally
;530:	//
;531:	trap_AddCommand ("kill");
ADDRGP4 $188
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 532
;532:	trap_AddCommand ("say");
ADDRGP4 $189
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 533
;533:	trap_AddCommand ("say_team");
ADDRGP4 $190
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 534
;534:	trap_AddCommand ("tell");
ADDRGP4 $191
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 535
;535:	trap_AddCommand ("vsay");
ADDRGP4 $192
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 536
;536:	trap_AddCommand ("vsay_team");
ADDRGP4 $193
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 537
;537:	trap_AddCommand ("vtell");
ADDRGP4 $194
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 538
;538:	trap_AddCommand ("vtaunt");
ADDRGP4 $195
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 539
;539:	trap_AddCommand ("vosay");
ADDRGP4 $196
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 540
;540:	trap_AddCommand ("vosay_team");
ADDRGP4 $197
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 541
;541:	trap_AddCommand ("votell");
ADDRGP4 $198
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 542
;542:	trap_AddCommand ("give");
ADDRGP4 $199
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 543
;543:	trap_AddCommand ("god");
ADDRGP4 $200
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 544
;544:	trap_AddCommand ("notarget");
ADDRGP4 $201
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 545
;545:	trap_AddCommand ("noclip");
ADDRGP4 $202
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 546
;546:	trap_AddCommand ("team");
ADDRGP4 $203
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 547
;547:	trap_AddCommand ("follow");
ADDRGP4 $204
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 548
;548:	trap_AddCommand ("levelshot");
ADDRGP4 $205
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 549
;549:	trap_AddCommand ("addbot");
ADDRGP4 $206
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 550
;550:	trap_AddCommand ("setviewpos");
ADDRGP4 $207
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 551
;551:	trap_AddCommand ("callvote");
ADDRGP4 $208
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 552
;552:	trap_AddCommand ("vote");
ADDRGP4 $209
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 553
;553:	trap_AddCommand ("callteamvote");
ADDRGP4 $210
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 554
;554:	trap_AddCommand ("teamvote");
ADDRGP4 $211
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 555
;555:	trap_AddCommand ("stats");
ADDRGP4 $212
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 556
;556:	trap_AddCommand ("teamtask");
ADDRGP4 $213
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 557
;557:	trap_AddCommand ("loaddefered");	// spelled wrong, but not changing for demo
ADDRGP4 $214
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 558
;558:}
LABELV $183
endproc CG_InitConsoleCommands 4 4
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_BuildSpectatorString
import CG_GetSelectedScore
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $214
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $213
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $212
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $211
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $210
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $209
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $208
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $207
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $206
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $205
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $204
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $203
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $202
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $201
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $200
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $199
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $198
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $197
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $196
byte 1 118
byte 1 111
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $195
byte 1 118
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $194
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $193
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $192
byte 1 118
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $191
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $190
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $189
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $188
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $174
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $173
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $172
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $171
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $170
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $169
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $168
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $167
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $166
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $165
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $164
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $163
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $162
byte 1 45
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $161
byte 1 43
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $160
byte 1 45
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $159
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $158
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $157
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $156
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $155
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $154
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $153
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $152
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $150
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $149
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $148
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $147
byte 1 49
byte 1 0
align 1
LABELV $146
byte 1 53
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $144
byte 1 48
byte 1 0
align 1
LABELV $143
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $137
byte 1 100
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $132
byte 1 118
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $125
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $108
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $90
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $85
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $84
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $82
byte 1 103
byte 1 99
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
