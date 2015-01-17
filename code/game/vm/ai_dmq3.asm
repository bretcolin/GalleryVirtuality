export BotSetUserInfo
code
proc BotSetUserInfo 1024 12
file "../ai_dmq3.c"
line 96
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_dmq3.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_dmq3.c $
;10: *
;11: *****************************************************************************/
;12:
;13:
;14:#include "g_local.h"
;15:#include "botlib.h"
;16:#include "be_aas.h"
;17:#include "be_ea.h"
;18:#include "be_ai_char.h"
;19:#include "be_ai_chat.h"
;20:#include "be_ai_gen.h"
;21:#include "be_ai_goal.h"
;22:#include "be_ai_move.h"
;23:#include "be_ai_weap.h"
;24://
;25:#include "ai_main.h"
;26:#include "ai_dmq3.h"
;27:#include "ai_chat.h"
;28:#include "ai_cmd.h"
;29:#include "ai_dmnet.h"
;30:#include "ai_team.h"
;31://
;32:#include "chars.h"				//characteristics
;33:#include "inv.h"				//indexes into the inventory
;34:#include "syn.h"				//synonyms
;35:#include "match.h"				//string matching types and vars
;36:
;37:// for the voice chats
;38:#include "../../ui/menudef.h" // sos001205 - for q3_ui also
;39:
;40:// from aasfile.h
;41:#define AREACONTENTS_MOVER				1024
;42:#define AREACONTENTS_MODELNUMSHIFT		24
;43:#define AREACONTENTS_MAXMODELNUM		0xFF
;44:#define AREACONTENTS_MODELNUM			(AREACONTENTS_MAXMODELNUM << AREACONTENTS_MODELNUMSHIFT)
;45:
;46:#define IDEAL_ATTACKDIST			140
;47:
;48:#define MAX_WAYPOINTS		128
;49://
;50:bot_waypoint_t botai_waypoints[MAX_WAYPOINTS];
;51:bot_waypoint_t *botai_freewaypoints;
;52:
;53://NOTE: not using a cvars which can be updated because the game should be reloaded anyway
;54:int gametype;		//game type
;55:int maxclients;		//maximum number of clients
;56:
;57:vmCvar_t bot_grapple;
;58:vmCvar_t bot_rocketjump;
;59:vmCvar_t bot_fastchat;
;60:vmCvar_t bot_nochat;
;61:vmCvar_t bot_testrchat;
;62:vmCvar_t bot_challenge;
;63:vmCvar_t bot_predictobstacles;
;64:vmCvar_t g_spSkill;
;65:
;66:extern vmCvar_t bot_developer;
;67:
;68:vec3_t lastteleport_origin;		//last teleport event origin
;69:float lastteleport_time;		//last teleport event time
;70:int max_bspmodelindex;			//maximum BSP model index
;71:
;72://CTF flag goals
;73:bot_goal_t ctf_redflag;
;74:bot_goal_t ctf_blueflag;
;75:#ifdef MISSIONPACK
;76:bot_goal_t ctf_neutralflag;
;77:bot_goal_t redobelisk;
;78:bot_goal_t blueobelisk;
;79:bot_goal_t neutralobelisk;
;80:#endif
;81:
;82:#define MAX_ALTROUTEGOALS		32
;83:
;84:int altroutegoals_setup;
;85:aas_altroutegoal_t red_altroutegoals[MAX_ALTROUTEGOALS];
;86:int red_numaltroutegoals;
;87:aas_altroutegoal_t blue_altroutegoals[MAX_ALTROUTEGOALS];
;88:int blue_numaltroutegoals;
;89:
;90:
;91:/*
;92:==================
;93:BotSetUserInfo
;94:==================
;95:*/
;96:void BotSetUserInfo(bot_state_t *bs, char *key, char *value) {
line 99
;97:	char userinfo[MAX_INFO_STRING];
;98:
;99:	trap_GetUserinfo(bs->client, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 100
;100:	Info_SetValueForKey(userinfo, key, value);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 101
;101:	trap_SetUserinfo(bs->client, userinfo);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 102
;102:	ClientUserinfoChanged( bs->client );
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 103
;103:}
LABELV $53
endproc BotSetUserInfo 1024 12
export BotCTFCarryingFlag
proc BotCTFCarryingFlag 0 0
line 110
;104:
;105:/*
;106:==================
;107:BotCTFCarryingFlag
;108:==================
;109:*/
;110:int BotCTFCarryingFlag(bot_state_t *bs) {
line 111
;111:	if (gametype != GT_CTF) return CTF_FLAG_NONE;
ADDRGP4 gametype
INDIRI4
CNSTI4 4
EQI4 $55
CNSTI4 0
RETI4
ADDRGP4 $54
JUMPV
LABELV $55
line 113
;112:
;113:	if (bs->inventory[INVENTORY_REDFLAG] > 0) return CTF_FLAG_RED;
ADDRFP4 0
INDIRP4
CNSTI4 5132
ADDP4
INDIRI4
CNSTI4 0
LEI4 $57
CNSTI4 1
RETI4
ADDRGP4 $54
JUMPV
LABELV $57
line 114
;114:	else if (bs->inventory[INVENTORY_BLUEFLAG] > 0) return CTF_FLAG_BLUE;
ADDRFP4 0
INDIRP4
CNSTI4 5136
ADDP4
INDIRI4
CNSTI4 0
LEI4 $59
CNSTI4 2
RETI4
ADDRGP4 $54
JUMPV
LABELV $59
line 115
;115:	return CTF_FLAG_NONE;
CNSTI4 0
RETI4
LABELV $54
endproc BotCTFCarryingFlag 0 0
export BotTeam
proc BotTeam 1044 12
line 123
;116:}
;117:
;118:/*
;119:==================
;120:BotTeam
;121:==================
;122:*/
;123:int BotTeam(bot_state_t *bs) {
line 126
;124:	char info[1024];
;125:
;126:	if (bs->client < 0 || bs->client >= MAX_CLIENTS) {
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $64
ADDRLP4 1024
INDIRI4
CNSTI4 64
LTI4 $62
LABELV $64
line 128
;127:		//BotAI_Print(PRT_ERROR, "BotCTFTeam: client out of range\n");
;128:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $61
JUMPV
LABELV $62
line 130
;129:	}
;130:	trap_GetConfigstring(CS_PLAYERS+bs->client, info, sizeof(info));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 132
;131:	//
;132:	if (atoi(Info_ValueForKey(info, "t")) == TEAM_RED) return TEAM_RED;
ADDRLP4 0
ARGP4
ADDRGP4 $67
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 1
NEI4 $65
CNSTI4 1
RETI4
ADDRGP4 $61
JUMPV
LABELV $65
line 133
;133:	else if (atoi(Info_ValueForKey(info, "t")) == TEAM_BLUE) return TEAM_BLUE;
ADDRLP4 0
ARGP4
ADDRGP4 $67
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 2
NEI4 $68
CNSTI4 2
RETI4
ADDRGP4 $61
JUMPV
LABELV $68
line 134
;134:	return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $61
endproc BotTeam 1044 12
export BotOppositeTeam
proc BotOppositeTeam 12 4
line 142
;135:}
;136:
;137:/*
;138:==================
;139:BotOppositeTeam
;140:==================
;141:*/
;142:int BotOppositeTeam(bot_state_t *bs) {
line 143
;143:	switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $74
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $75
ADDRGP4 $71
JUMPV
LABELV $74
line 144
;144:		case TEAM_RED: return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $70
JUMPV
LABELV $75
line 145
;145:		case TEAM_BLUE: return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $70
JUMPV
LABELV $71
line 146
;146:		default: return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $70
endproc BotOppositeTeam 12 4
export BotEnemyFlag
proc BotEnemyFlag 4 4
line 155
;147:	}
;148:}
;149:
;150:/*
;151:==================
;152:BotEnemyFlag
;153:==================
;154:*/
;155:bot_goal_t *BotEnemyFlag(bot_state_t *bs) {
line 156
;156:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $77
line 157
;157:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
ADDRGP4 $76
JUMPV
LABELV $77
line 159
;158:	}
;159:	else {
line 160
;160:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
LABELV $76
endproc BotEnemyFlag 4 4
export BotTeamFlag
proc BotTeamFlag 4 4
line 169
;161:	}
;162:}
;163:
;164:/*
;165:==================
;166:BotTeamFlag
;167:==================
;168:*/
;169:bot_goal_t *BotTeamFlag(bot_state_t *bs) {
line 170
;170:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $80
line 171
;171:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
ADDRGP4 $79
JUMPV
LABELV $80
line 173
;172:	}
;173:	else {
line 174
;174:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
LABELV $79
endproc BotTeamFlag 4 4
export EntityIsDead
proc EntityIsDead 472 8
line 184
;175:	}
;176:}
;177:
;178:
;179:/*
;180:==================
;181:EntityIsDead
;182:==================
;183:*/
;184:qboolean EntityIsDead(aas_entityinfo_t *entinfo) {
line 187
;185:	playerState_t ps;
;186:
;187:	if (entinfo->number >= 0 && entinfo->number < MAX_CLIENTS) {
ADDRLP4 468
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 468
INDIRI4
CNSTI4 0
LTI4 $83
ADDRLP4 468
INDIRI4
CNSTI4 64
GEI4 $83
line 189
;188:		//retrieve the current client state
;189:		BotAI_GetClientState( entinfo->number, &ps );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 190
;190:		if (ps.pm_type != PM_NORMAL) return qtrue;
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $85
CNSTI4 1
RETI4
ADDRGP4 $82
JUMPV
LABELV $85
line 191
;191:	}
LABELV $83
line 192
;192:	return qfalse;
CNSTI4 0
RETI4
LABELV $82
endproc EntityIsDead 472 8
export EntityCarriesFlag
proc EntityCarriesFlag 0 0
line 200
;193:}
;194:
;195:/*
;196:==================
;197:EntityCarriesFlag
;198:==================
;199:*/
;200:qboolean EntityCarriesFlag(aas_entityinfo_t *entinfo) {
line 201
;201:	if ( entinfo->powerups & ( 1 << PW_REDFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $89
line 202
;202:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $88
JUMPV
LABELV $89
line 203
;203:	if ( entinfo->powerups & ( 1 << PW_BLUEFLAG ) )
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $91
line 204
;204:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $88
JUMPV
LABELV $91
line 209
;205:#ifdef MISSIONPACK
;206:	if ( entinfo->powerups & ( 1 << PW_NEUTRALFLAG ) )
;207:		return qtrue;
;208:#endif
;209:	return qfalse;
CNSTI4 0
RETI4
LABELV $88
endproc EntityCarriesFlag 0 0
export EntityIsInvisible
proc EntityIsInvisible 4 4
line 217
;210:}
;211:
;212:/*
;213:==================
;214:EntityIsInvisible
;215:==================
;216:*/
;217:qboolean EntityIsInvisible(aas_entityinfo_t *entinfo) {
line 219
;218:	// the flag is always visible
;219:	if (EntityCarriesFlag(entinfo)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $94
line 220
;220:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $93
JUMPV
LABELV $94
line 222
;221:	}
;222:	if (entinfo->powerups & (1 << PW_INVIS)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $96
line 223
;223:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $93
JUMPV
LABELV $96
line 225
;224:	}
;225:	return qfalse;
CNSTI4 0
RETI4
LABELV $93
endproc EntityIsInvisible 4 4
export EntityIsShooting
proc EntityIsShooting 0 0
line 233
;226:}
;227:
;228:/*
;229:==================
;230:EntityIsShooting
;231:==================
;232:*/
;233:qboolean EntityIsShooting(aas_entityinfo_t *entinfo) {
line 234
;234:	if (entinfo->flags & EF_FIRING) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $99
line 235
;235:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $98
JUMPV
LABELV $99
line 237
;236:	}
;237:	return qfalse;
CNSTI4 0
RETI4
LABELV $98
endproc EntityIsShooting 0 0
export EntityIsChatting
proc EntityIsChatting 0 0
line 245
;238:}
;239:
;240:/*
;241:==================
;242:EntityIsChatting
;243:==================
;244:*/
;245:qboolean EntityIsChatting(aas_entityinfo_t *entinfo) {
line 246
;246:	if (entinfo->flags & EF_TALK) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $102
line 247
;247:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $101
JUMPV
LABELV $102
line 249
;248:	}
;249:	return qfalse;
CNSTI4 0
RETI4
LABELV $101
endproc EntityIsChatting 0 0
export EntityHasQuad
proc EntityHasQuad 0 0
line 257
;250:}
;251:
;252:/*
;253:==================
;254:EntityHasQuad
;255:==================
;256:*/
;257:qboolean EntityHasQuad(aas_entityinfo_t *entinfo) {
line 258
;258:	if (entinfo->powerups & (1 << PW_QUAD)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $105
line 259
;259:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $104
JUMPV
LABELV $105
line 261
;260:	}
;261:	return qfalse;
CNSTI4 0
RETI4
LABELV $104
endproc EntityHasQuad 0 0
export BotRememberLastOrderedTask
proc BotRememberLastOrderedTask 16 12
line 325
;262:}
;263:
;264:#ifdef MISSIONPACK
;265:/*
;266:==================
;267:EntityHasKamikze
;268:==================
;269:*/
;270:qboolean EntityHasKamikaze(aas_entityinfo_t *entinfo) {
;271:	if (entinfo->flags & EF_KAMIKAZE) {
;272:		return qtrue;
;273:	}
;274:	return qfalse;
;275:}
;276:
;277:/*
;278:==================
;279:EntityCarriesCubes
;280:==================
;281:*/
;282:qboolean EntityCarriesCubes(aas_entityinfo_t *entinfo) {
;283:	entityState_t state;
;284:
;285:	if (gametype != GT_HARVESTER)
;286:		return qfalse;
;287:	//FIXME: get this info from the aas_entityinfo_t ?
;288:	BotAI_GetEntityState(entinfo->number, &state);
;289:	if (state.generic1 > 0)
;290:		return qtrue;
;291:	return qfalse;
;292:}
;293:
;294:/*
;295:==================
;296:Bot1FCTFCarryingFlag
;297:==================
;298:*/
;299:int Bot1FCTFCarryingFlag(bot_state_t *bs) {
;300:	if (gametype != GT_1FCTF) return qfalse;
;301:
;302:	if (bs->inventory[INVENTORY_NEUTRALFLAG] > 0) return qtrue;
;303:	return qfalse;
;304:}
;305:
;306:/*
;307:==================
;308:BotHarvesterCarryingCubes
;309:==================
;310:*/
;311:int BotHarvesterCarryingCubes(bot_state_t *bs) {
;312:	if (gametype != GT_HARVESTER) return qfalse;
;313:
;314:	if (bs->inventory[INVENTORY_REDCUBE] > 0) return qtrue;
;315:	if (bs->inventory[INVENTORY_BLUECUBE] > 0) return qtrue;
;316:	return qfalse;
;317:}
;318:#endif
;319:
;320:/*
;321:==================
;322:BotRememberLastOrderedTask
;323:==================
;324:*/
;325:void BotRememberLastOrderedTask(bot_state_t *bs) {
line 326
;326:	if (!bs->ordered) {
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $108
line 327
;327:		return;
ADDRGP4 $107
JUMPV
LABELV $108
line 329
;328:	}
;329:	bs->lastgoal_decisionmaker = bs->decisionmaker;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6756
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ASGNI4
line 330
;330:	bs->lastgoal_ltgtype = bs->ltgtype;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6760
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
line 331
;331:	memcpy(&bs->lastgoal_teamgoal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6768
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 332
;332:	bs->lastgoal_teammate = bs->teammate;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6764
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ASGNI4
line 333
;333:}
LABELV $107
endproc BotRememberLastOrderedTask 16 12
export BotSetTeamStatus
proc BotSetTeamStatus 0 0
line 340
;334:
;335:/*
;336:==================
;337:BotSetTeamStatus
;338:==================
;339:*/
;340:void BotSetTeamStatus(bot_state_t *bs) {
line 397
;341:#ifdef MISSIONPACK
;342:	int teamtask;
;343:	aas_entityinfo_t entinfo;
;344:
;345:	teamtask = TEAMTASK_PATROL;
;346:
;347:	switch(bs->ltgtype) {
;348:		case LTG_TEAMHELP:
;349:			break;
;350:		case LTG_TEAMACCOMPANY:
;351:			BotEntityInfo(bs->teammate, &entinfo);
;352:			if ( ( (gametype == GT_CTF || gametype == GT_1FCTF) && EntityCarriesFlag(&entinfo))
;353:				|| ( gametype == GT_HARVESTER && EntityCarriesCubes(&entinfo)) ) {
;354:				teamtask = TEAMTASK_ESCORT;
;355:			}
;356:			else {
;357:				teamtask = TEAMTASK_FOLLOW;
;358:			}
;359:			break;
;360:		case LTG_DEFENDKEYAREA:
;361:			teamtask = TEAMTASK_DEFENSE;
;362:			break;
;363:		case LTG_GETFLAG:
;364:			teamtask = TEAMTASK_OFFENSE;
;365:			break;
;366:		case LTG_RUSHBASE:
;367:			teamtask = TEAMTASK_DEFENSE;
;368:			break;
;369:		case LTG_RETURNFLAG:
;370:			teamtask = TEAMTASK_RETRIEVE;
;371:			break;
;372:		case LTG_CAMP:
;373:		case LTG_CAMPORDER:
;374:			teamtask = TEAMTASK_CAMP;
;375:			break;
;376:		case LTG_PATROL:
;377:			teamtask = TEAMTASK_PATROL;
;378:			break;
;379:		case LTG_GETITEM:
;380:			teamtask = TEAMTASK_PATROL;
;381:			break;
;382:		case LTG_KILL:
;383:			teamtask = TEAMTASK_PATROL;
;384:			break;
;385:		case LTG_HARVEST:
;386:			teamtask = TEAMTASK_OFFENSE;
;387:			break;
;388:		case LTG_ATTACKENEMYBASE:
;389:			teamtask = TEAMTASK_OFFENSE;
;390:			break;
;391:		default:
;392:			teamtask = TEAMTASK_PATROL;
;393:			break;
;394:	}
;395:	BotSetUserInfo(bs, "teamtask", va("%d", teamtask));
;396:#endif
;397:}
LABELV $110
endproc BotSetTeamStatus 0 0
export BotSetLastOrderedTask
proc BotSetLastOrderedTask 60 16
line 404
;398:
;399:/*
;400:==================
;401:BotSetLastOrderedTask
;402:==================
;403:*/
;404:int BotSetLastOrderedTask(bot_state_t *bs) {
line 406
;405:
;406:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $112
line 408
;407:		// don't go back to returning the flag if it's at the base
;408:		if ( bs->lastgoal_ltgtype == LTG_RETURNFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 6
NEI4 $114
line 409
;409:			if ( BotTeam(bs) == TEAM_RED ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $116
line 410
;410:				if ( bs->redflagstatus == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
CNSTI4 0
NEI4 $117
line 411
;411:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 412
;412:				}
line 413
;413:			}
ADDRGP4 $117
JUMPV
LABELV $116
line 414
;414:			else {
line 415
;415:				if ( bs->blueflagstatus == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 0
NEI4 $120
line 416
;416:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 417
;417:				}
LABELV $120
line 418
;418:			}
LABELV $117
line 419
;419:		}
LABELV $114
line 420
;420:	}
LABELV $112
line 422
;421:
;422:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $122
line 423
;423:		bs->decisionmaker = bs->lastgoal_decisionmaker;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 6756
ADDP4
INDIRI4
ASGNI4
line 424
;424:		bs->ordered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 425
;425:		bs->ltgtype = bs->lastgoal_ltgtype;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6600
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
ASGNI4
line 426
;426:		memcpy(&bs->teamgoal, &bs->lastgoal_teamgoal, sizeof(bot_goal_t));
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 6768
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 427
;427:		bs->teammate = bs->lastgoal_teammate;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 6764
ADDP4
INDIRI4
ASGNI4
line 428
;428:		bs->teamgoal_time = FloatTime() + 300;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1133903872
ADDF4
ASGNF4
line 429
;429:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 431
;430:		//
;431:		if ( gametype == GT_CTF ) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $124
line 432
;432:			if ( bs->ltgtype == LTG_GETFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $126
line 436
;433:				bot_goal_t *tb, *eb;
;434:				int tt, et;
;435:
;436:				tb = BotTeamFlag(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 BotTeamFlag
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 437
;437:				eb = BotEnemyFlag(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotEnemyFlag
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 438
;438:				tt = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, tb->areanum, TFL_DEFAULT);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 44
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 439
;439:				et = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, eb->areanum, TFL_DEFAULT);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 52
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 52
INDIRI4
ASGNI4
line 441
;440:				// if the travel time towards the enemy base is larger than towards our base
;441:				if (et > tt) {
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $128
line 443
;442:					//get an alternative route goal towards the enemy base
;443:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 444
;444:				}
LABELV $128
line 445
;445:			}
LABELV $126
line 446
;446:		}
LABELV $124
line 447
;447:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $111
JUMPV
LABELV $122
line 449
;448:	}
;449:	return qfalse;
CNSTI4 0
RETI4
LABELV $111
endproc BotSetLastOrderedTask 60 16
export BotRefuseOrder
proc BotRefuseOrder 8 12
line 457
;450:}
;451:
;452:/*
;453:==================
;454:BotRefuseOrder
;455:==================
;456:*/
;457:void BotRefuseOrder(bot_state_t *bs) {
line 458
;458:	if (!bs->ordered)
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $131
line 459
;459:		return;
ADDRGP4 $130
JUMPV
LABELV $131
line 461
;460:	// if the bot was ordered to do something
;461:	if ( bs->order_time && bs->order_time > FloatTime() - 10 ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $133
ADDRLP4 0
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
LEF4 $133
line 462
;462:		trap_EA_Action(bs->client, ACTION_NEGATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 2097152
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 463
;463:		BotVoiceChat(bs, bs->decisionmaker, VOICECHAT_NO);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ARGI4
ADDRGP4 $135
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 464
;464:		bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
CNSTF4 0
ASGNF4
line 465
;465:	}
LABELV $133
line 466
;466:}
LABELV $130
endproc BotRefuseOrder 8 12
export BotCTFSeekGoals
proc BotCTFSeekGoals 240 12
line 473
;467:
;468:/*
;469:==================
;470:BotCTFSeekGoals
;471:==================
;472:*/
;473:void BotCTFSeekGoals(bot_state_t *bs) {
line 480
;474:	float rnd, l1, l2;
;475:	int flagstatus, c;
;476:	vec3_t dir;
;477:	aas_entityinfo_t entinfo;
;478:
;479:	//when carrying a flag in ctf the bot should rush to the base
;480:	if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $137
line 482
;481:		//if not already rushing to the base
;482:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $139
line 483
;483:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 484
;484:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 485
;485:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 486
;486:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 487
;487:			bs->decisionmaker = bs->client;
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 176
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 488
;488:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 490
;489:			//
;490:			switch(BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 180
ADDRLP4 184
INDIRI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1
EQI4 $144
ADDRLP4 180
INDIRI4
CNSTI4 2
EQI4 $149
ADDRGP4 $141
JUMPV
LABELV $144
line 491
;491:				case TEAM_RED: VectorSubtract(bs->origin, ctf_blueflag.origin, dir); break;
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
ADDRLP4 192
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 192
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag+8
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $142
JUMPV
LABELV $149
line 492
;492:				case TEAM_BLUE: VectorSubtract(bs->origin, ctf_redflag.origin, dir); break;
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
ADDRLP4 196
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRGP4 ctf_redflag
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 196
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRGP4 ctf_redflag+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRGP4 ctf_redflag+8
INDIRF4
SUBF4
ASGNF4
ADDRGP4 $142
JUMPV
LABELV $141
line 493
;493:				default: VectorSet(dir, 999, 999, 999); break;
ADDRLP4 200
CNSTF4 1148829696
ASGNF4
ADDRLP4 160
ADDRLP4 200
INDIRF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 200
INDIRF4
ASGNF4
ADDRLP4 160+8
CNSTF4 1148829696
ASGNF4
LABELV $142
line 496
;494:			}
;495:			// if the bot picked up the flag very close to the enemy base
;496:			if ( VectorLength(dir) < 128 ) {
ADDRLP4 160
ARGP4
ADDRLP4 192
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 192
INDIRF4
CNSTF4 1124073472
GEF4 $156
line 498
;497:				// get an alternative route goal through the enemy base
;498:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 499
;499:			} else {
ADDRGP4 $157
JUMPV
LABELV $156
line 501
;500:				// don't use any alt route goal, just get the hell out of the base
;501:				bs->altroutegoal.areanum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6692
ADDP4
CNSTI4 0
ASGNI4
line 502
;502:			}
LABELV $157
line 503
;503:			BotSetUserInfo(bs, "teamtask", va("%d", TEAMTASK_OFFENSE));
ADDRGP4 $159
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 196
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
line 504
;504:			BotVoiceChat(bs, -1, VOICECHAT_IHAVEFLAG);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 $160
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 505
;505:		}
ADDRGP4 $136
JUMPV
LABELV $139
line 506
;506:		else if (bs->rushbaseaway_time > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $136
line 507
;507:			if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 1
NEI4 $163
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $164
JUMPV
LABELV $163
line 508
;508:			else flagstatus = bs->blueflagstatus;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ASGNI4
LABELV $164
line 510
;509:			//if the flag is back
;510:			if (flagstatus == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $136
line 511
;511:				bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 512
;512:			}
line 513
;513:		}
line 514
;514:		return;
ADDRGP4 $136
JUMPV
LABELV $137
line 517
;515:	}
;516:	// if the bot decided to follow someone
;517:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $167
ADDRLP4 176
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $167
line 519
;518:		// if the team mate being accompanied no longer carries the flag
;519:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 520
;520:		if (!EntityCarriesFlag(&entinfo)) {
ADDRLP4 16
ARGP4
ADDRLP4 180
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $169
line 521
;521:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 522
;522:		}
LABELV $169
line 523
;523:	}
LABELV $167
line 525
;524:	//
;525:	if (BotTeam(bs) == TEAM_RED) flagstatus = bs->redflagstatus * 2 + bs->blueflagstatus;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1
NEI4 $171
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 184
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 184
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $172
JUMPV
LABELV $171
line 526
;526:	else flagstatus = bs->blueflagstatus * 2 + bs->redflagstatus;
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 188
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 188
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $172
line 528
;527:	//if our team has the enemy flag and our flag is at the base
;528:	if (flagstatus == 1) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $173
line 530
;529:		//
;530:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $136
line 532
;531:			//if Not defending the base already
;532:			if (!(bs->ltgtype == LTG_DEFENDKEYAREA &&
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
NEI4 $181
ADDRLP4 196
ADDRLP4 192
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ASGNI4
ADDRLP4 196
INDIRI4
ADDRGP4 ctf_redflag+44
INDIRI4
EQI4 $136
ADDRLP4 196
INDIRI4
ADDRGP4 ctf_blueflag+44
INDIRI4
EQI4 $136
LABELV $181
line 534
;533:					(bs->teamgoal.number == ctf_redflag.number ||
;534:					bs->teamgoal.number == ctf_blueflag.number))) {
line 536
;535:				//if there is a visible team mate flag carrier
;536:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 200
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 200
INDIRI4
ASGNI4
line 537
;537:				if (c >= 0 &&
ADDRLP4 204
ADDRLP4 156
INDIRI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
LTI4 $136
ADDRLP4 208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $184
ADDRLP4 208
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ADDRLP4 204
INDIRI4
EQI4 $136
LABELV $184
line 539
;538:						// and not already following the team mate flag carrier
;539:						(bs->ltgtype != LTG_TEAMACCOMPANY || bs->teammate != c)) {
line 541
;540:					//
;541:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 543
;542:					//follow the flag carrier
;543:					bs->decisionmaker = bs->client;
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 212
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 212
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 544
;544:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 546
;545:					//the team mate
;546:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 548
;547:					//last time the team mate was visible
;548:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 550
;549:					//no message
;550:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 552
;551:					//no arrive message
;552:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 554
;553:					//
;554:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 216
INDIRP4
ARGP4
ADDRLP4 216
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRGP4 $185
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 556
;555:					//get the team goal time
;556:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 557
;557:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 558
;558:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7012
ADDP4
CNSTF4 1121976320
ASGNF4
line 559
;559:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 560
;560:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 561
;561:				}
line 562
;562:			}
line 563
;563:		}
line 564
;564:		return;
ADDRGP4 $136
JUMPV
LABELV $173
line 567
;565:	}
;566:	//if the enemy has our flag
;567:	else if (flagstatus == 2) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $186
line 569
;568:		//
;569:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $136
line 571
;570:			//if enemy flag carrier is visible
;571:			c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 192
INDIRI4
ASGNI4
line 572
;572:			if (c >= 0) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $190
line 574
;573:				//FIXME: fight enemy flag carrier
;574:			}
LABELV $190
line 576
;575:			//if not already doing something important
;576:			if (bs->ltgtype != LTG_GETFLAG &&
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 4
EQI4 $136
ADDRLP4 196
INDIRI4
CNSTI4 6
EQI4 $136
ADDRLP4 196
INDIRI4
CNSTI4 1
EQI4 $136
ADDRLP4 196
INDIRI4
CNSTI4 2
EQI4 $136
ADDRLP4 196
INDIRI4
CNSTI4 8
EQI4 $136
ADDRLP4 196
INDIRI4
CNSTI4 9
EQI4 $136
ADDRLP4 196
INDIRI4
CNSTI4 10
EQI4 $136
line 582
;577:				bs->ltgtype != LTG_RETURNFLAG &&
;578:				bs->ltgtype != LTG_TEAMHELP &&
;579:				bs->ltgtype != LTG_TEAMACCOMPANY &&
;580:				bs->ltgtype != LTG_CAMPORDER &&
;581:				bs->ltgtype != LTG_PATROL &&
;582:				bs->ltgtype != LTG_GETITEM) {
line 584
;583:
;584:				BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 585
;585:				bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 586
;586:				bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 588
;587:				//
;588:				if (random() < 0.5) {
ADDRLP4 204
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
GEF4 $194
line 590
;589:					//go for the enemy flag
;590:					bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 591
;591:				}
ADDRGP4 $195
JUMPV
LABELV $194
line 592
;592:				else {
line 593
;593:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 594
;594:				}
LABELV $195
line 596
;595:				//no team message
;596:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 598
;597:				//set the time the bot will stop getting the flag
;598:				bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 600
;599:				//get an alternative route goal towards the enemy base
;600:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 602
;601:				//
;602:				BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 603
;603:				bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 604
;604:			}
line 605
;605:		}
line 606
;606:		return;
ADDRGP4 $136
JUMPV
LABELV $186
line 609
;607:	}
;608:	//if both flags Not at their bases
;609:	else if (flagstatus == 3) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $196
line 611
;610:		//
;611:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $136
line 613
;612:			// if not trying to return the flag and not following the team flag carrier
;613:			if ( bs->ltgtype != LTG_RETURNFLAG && bs->ltgtype != LTG_TEAMACCOMPANY ) {
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 6
EQI4 $136
ADDRLP4 192
INDIRI4
CNSTI4 2
EQI4 $136
line 615
;614:				//
;615:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 196
INDIRI4
ASGNI4
line 617
;616:				// if there is a visible team mate flag carrier
;617:				if (c >= 0) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $202
line 618
;618:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 620
;619:					//follow the flag carrier
;620:					bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 621
;621:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 623
;622:					//the team mate
;623:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 625
;624:					//last time the team mate was visible
;625:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 627
;626:					//no message
;627:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 629
;628:					//no arrive message
;629:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 631
;630:					//
;631:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 204
INDIRP4
ARGP4
ADDRLP4 204
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRGP4 $185
ARGP4
ADDRGP4 BotVoiceChat
CALLV
pop
line 633
;632:					//get the team goal time
;633:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 634
;634:					bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 635
;635:					bs->formation_dist = 3.5 * 32;		//3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7012
ADDP4
CNSTF4 1121976320
ASGNF4
line 637
;636:					//
;637:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 638
;638:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 639
;639:				}
ADDRGP4 $136
JUMPV
LABELV $202
line 640
;640:				else {
line 641
;641:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 642
;642:					bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 643
;643:					bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 645
;644:					//get the enemy flag
;645:					bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 204
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 204
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 647
;646:					//get the flag
;647:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 649
;648:					//set the time the bot will stop getting the flag
;649:					bs->teamgoal_time = FloatTime() + CTF_RETURNFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 651
;650:					//get an alternative route goal towards the enemy base
;651:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 653
;652:					//
;653:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 654
;654:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 655
;655:				}
line 656
;656:			}
line 657
;657:		}
line 658
;658:		return;
ADDRGP4 $136
JUMPV
LABELV $196
line 661
;659:	}
;660:	// don't just do something wait for the bot team leader to give orders
;661:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $204
line 662
;662:		return;
ADDRGP4 $136
JUMPV
LABELV $204
line 665
;663:	}
;664:	// if the bot is ordered to do something
;665:	if ( bs->lastgoal_ltgtype ) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $206
line 666
;666:		bs->teamgoal_time += 60;
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 667
;667:	}
LABELV $206
line 669
;668:	// if the bot decided to do something on it's own and has a last ordered goal
;669:	if ( !bs->ordered && bs->lastgoal_ltgtype ) {
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 196
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
ADDRLP4 200
INDIRI4
NEI4 $208
ADDRLP4 196
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
ADDRLP4 200
INDIRI4
EQI4 $208
line 670
;670:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 671
;671:	}
LABELV $208
line 673
;672:	//if already a CTF or team goal
;673:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 1
EQI4 $221
ADDRLP4 204
INDIRI4
CNSTI4 2
EQI4 $221
ADDRLP4 204
INDIRI4
CNSTI4 3
EQI4 $221
ADDRLP4 204
INDIRI4
CNSTI4 4
EQI4 $221
ADDRLP4 204
INDIRI4
CNSTI4 5
EQI4 $221
ADDRLP4 204
INDIRI4
CNSTI4 6
EQI4 $221
ADDRLP4 204
INDIRI4
CNSTI4 8
EQI4 $221
ADDRLP4 204
INDIRI4
CNSTI4 9
EQI4 $221
ADDRLP4 204
INDIRI4
CNSTI4 10
EQI4 $221
ADDRLP4 204
INDIRI4
CNSTI4 14
EQI4 $221
ADDRLP4 204
INDIRI4
CNSTI4 15
NEI4 $210
LABELV $221
line 683
;674:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;675:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;676:			bs->ltgtype == LTG_GETFLAG ||
;677:			bs->ltgtype == LTG_RUSHBASE ||
;678:			bs->ltgtype == LTG_RETURNFLAG ||
;679:			bs->ltgtype == LTG_CAMPORDER ||
;680:			bs->ltgtype == LTG_PATROL ||
;681:			bs->ltgtype == LTG_GETITEM ||
;682:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;683:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 684
;684:		return;
ADDRGP4 $136
JUMPV
LABELV $210
line 687
;685:	}
;686:	//
;687:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $222
line 688
;688:		return;
ADDRGP4 $136
JUMPV
LABELV $222
line 690
;689:	//
;690:	if (bs->owndecision_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
LEF4 $224
line 691
;691:		return;;
ADDRGP4 $136
JUMPV
LABELV $224
line 693
;692:	//if the bot is roaming
;693:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $226
line 694
;694:		return;
ADDRGP4 $136
JUMPV
LABELV $226
line 696
;695:	//if the bot has anough aggression to decide what to do
;696:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 212
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 212
INDIRF4
CNSTF4 1112014848
GEF4 $228
line 697
;697:		return;
ADDRGP4 $136
JUMPV
LABELV $228
line 699
;698:	//set the time to send a message to the team mates
;699:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 216
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
ADDRLP4 216
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
line 701
;700:	//
;701:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $230
line 702
;702:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $232
line 703
;703:			l1 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 704
;704:		}
ADDRGP4 $233
JUMPV
LABELV $232
line 705
;705:		else {
line 706
;706:			l1 = 0.2f;
ADDRLP4 8
CNSTF4 1045220557
ASGNF4
line 707
;707:		}
LABELV $233
line 708
;708:		l2 = 0.9f;
ADDRLP4 12
CNSTF4 1063675494
ASGNF4
line 709
;709:	}
ADDRGP4 $231
JUMPV
LABELV $230
line 710
;710:	else {
line 711
;711:		l1 = 0.4f;
ADDRLP4 8
CNSTF4 1053609165
ASGNF4
line 712
;712:		l2 = 0.7f;
ADDRLP4 12
CNSTF4 1060320051
ASGNF4
line 713
;713:	}
LABELV $231
line 715
;714:	//get the flag or defend the base
;715:	rnd = random();
ADDRLP4 220
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 220
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 716
;716:	if (rnd < l1 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $234
ADDRLP4 224
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 224
INDIRI4
EQI4 $234
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 224
INDIRI4
EQI4 $234
line 717
;717:		bs->decisionmaker = bs->client;
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 228
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 718
;718:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 719
;719:		bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 721
;720:		//set the time the bot will stop getting the flag
;721:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 723
;722:		//get an alternative route goal towards the enemy base
;723:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 232
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 232
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 724
;724:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 725
;725:	}
ADDRGP4 $235
JUMPV
LABELV $234
line 726
;726:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $238
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRGP4 ctf_redflag+12
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $238
ADDRGP4 ctf_blueflag+12
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $238
line 727
;727:		bs->decisionmaker = bs->client;
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 232
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 728
;728:		bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 730
;729:		//
;730:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 1
NEI4 $242
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $243
JUMPV
LABELV $242
line 731
;731:		else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $243
line 733
;732:		//set the ltg type
;733:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 735
;734:		//set the time the bot stops defending the base
;735:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 736
;736:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 737
;737:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 738
;738:	}
ADDRGP4 $239
JUMPV
LABELV $238
line 739
;739:	else {
line 740
;740:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 742
;741:		//set the time the bot will stop roaming
;742:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 743
;743:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 744
;744:	}
LABELV $239
LABELV $235
line 745
;745:	bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 749
;746:#ifdef DEBUG
;747:	BotPrintTeamGoal(bs);
;748:#endif //DEBUG
;749:}
LABELV $136
endproc BotCTFSeekGoals 240 12
export BotCTFRetreatGoals
proc BotCTFRetreatGoals 8 4
line 756
;750:
;751:/*
;752:==================
;753:BotCTFRetreatGoals
;754:==================
;755:*/
;756:void BotCTFRetreatGoals(bot_state_t *bs) {
line 758
;757:	//when carrying a flag in ctf the bot should rush to the base
;758:	if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $245
line 760
;759:		//if not already rushing to the base
;760:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $247
line 761
;761:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 762
;762:			bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 763
;763:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 764
;764:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 765
;765:			bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 766
;766:			bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 767
;767:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 768
;768:		}
LABELV $247
line 769
;769:	}
LABELV $245
line 770
;770:}
LABELV $244
endproc BotCTFRetreatGoals 8 4
export BotTeamGoals
proc BotTeamGoals 0 4
line 1306
;771:
;772:#ifdef MISSIONPACK
;773:/*
;774:==================
;775:Bot1FCTFSeekGoals
;776:==================
;777:*/
;778:void Bot1FCTFSeekGoals(bot_state_t *bs) {
;779:	aas_entityinfo_t entinfo;
;780:	float rnd, l1, l2;
;781:	int c;
;782:
;783:	//when carrying a flag in ctf the bot should rush to the base
;784:	if (Bot1FCTFCarryingFlag(bs)) {
;785:		//if not already rushing to the base
;786:		if (bs->ltgtype != LTG_RUSHBASE) {
;787:			BotRefuseOrder(bs);
;788:			bs->ltgtype = LTG_RUSHBASE;
;789:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;790:			bs->rushbaseaway_time = 0;
;791:			bs->decisionmaker = bs->client;
;792:			bs->ordered = qfalse;
;793:			//get an alternative route goal towards the enemy base
;794:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;795:			//
;796:			BotSetTeamStatus(bs);
;797:			BotVoiceChat(bs, -1, VOICECHAT_IHAVEFLAG);
;798:		}
;799:		return;
;800:	}
;801:	// if the bot decided to follow someone
;802:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
;803:		// if the team mate being accompanied no longer carries the flag
;804:		BotEntityInfo(bs->teammate, &entinfo);
;805:		if (!EntityCarriesFlag(&entinfo)) {
;806:			bs->ltgtype = 0;
;807:		}
;808:	}
;809:	//our team has the flag
;810:	if (bs->neutralflagstatus == 1) {
;811:		if (bs->owndecision_time < FloatTime()) {
;812:			// if not already following someone
;813:			if (bs->ltgtype != LTG_TEAMACCOMPANY) {
;814:				//if there is a visible team mate flag carrier
;815:				c = BotTeamFlagCarrierVisible(bs);
;816:				if (c >= 0) {
;817:					BotRefuseOrder(bs);
;818:					//follow the flag carrier
;819:					bs->decisionmaker = bs->client;
;820:					bs->ordered = qfalse;
;821:					//the team mate
;822:					bs->teammate = c;
;823:					//last time the team mate was visible
;824:					bs->teammatevisible_time = FloatTime();
;825:					//no message
;826:					bs->teammessage_time = 0;
;827:					//no arrive message
;828:					bs->arrive_time = 1;
;829:					//
;830:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;831:					//get the team goal time
;832:					bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
;833:					bs->ltgtype = LTG_TEAMACCOMPANY;
;834:					bs->formation_dist = 3.5 * 32;		//3.5 meter
;835:					BotSetTeamStatus(bs);
;836:					bs->owndecision_time = FloatTime() + 5;
;837:					return;
;838:				}
;839:			}
;840:			//if already a CTF or team goal
;841:			if (bs->ltgtype == LTG_TEAMHELP ||
;842:					bs->ltgtype == LTG_TEAMACCOMPANY ||
;843:					bs->ltgtype == LTG_DEFENDKEYAREA ||
;844:					bs->ltgtype == LTG_GETFLAG ||
;845:					bs->ltgtype == LTG_RUSHBASE ||
;846:					bs->ltgtype == LTG_CAMPORDER ||
;847:					bs->ltgtype == LTG_PATROL ||
;848:					bs->ltgtype == LTG_ATTACKENEMYBASE ||
;849:					bs->ltgtype == LTG_GETITEM ||
;850:					bs->ltgtype == LTG_MAKELOVE_UNDER ||
;851:					bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;852:				return;
;853:			}
;854:			//if not already attacking the enemy base
;855:			if (bs->ltgtype != LTG_ATTACKENEMYBASE) {
;856:				BotRefuseOrder(bs);
;857:				bs->decisionmaker = bs->client;
;858:				bs->ordered = qfalse;
;859:				//
;860:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;861:				else memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;862:				//set the ltg type
;863:				bs->ltgtype = LTG_ATTACKENEMYBASE;
;864:				//set the time the bot will stop getting the flag
;865:				bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
;866:				BotSetTeamStatus(bs);
;867:				bs->owndecision_time = FloatTime() + 5;
;868:			}
;869:		}
;870:		return;
;871:	}
;872:	//enemy team has the flag
;873:	else if (bs->neutralflagstatus == 2) {
;874:		if (bs->owndecision_time < FloatTime()) {
;875:			c = BotEnemyFlagCarrierVisible(bs);
;876:			if (c >= 0) {
;877:				//FIXME: attack enemy flag carrier
;878:			}
;879:			//if already a CTF or team goal
;880:			if (bs->ltgtype == LTG_TEAMHELP ||
;881:					bs->ltgtype == LTG_TEAMACCOMPANY ||
;882:					bs->ltgtype == LTG_CAMPORDER ||
;883:					bs->ltgtype == LTG_PATROL ||
;884:					bs->ltgtype == LTG_GETITEM) {
;885:				return;
;886:			}
;887:			// if not already defending the base
;888:			if (bs->ltgtype != LTG_DEFENDKEYAREA) {
;889:				BotRefuseOrder(bs);
;890:				bs->decisionmaker = bs->client;
;891:				bs->ordered = qfalse;
;892:				//
;893:				if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;894:				else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;895:				//set the ltg type
;896:				bs->ltgtype = LTG_DEFENDKEYAREA;
;897:				//set the time the bot stops defending the base
;898:				bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;899:				bs->defendaway_time = 0;
;900:				BotSetTeamStatus(bs);
;901:				bs->owndecision_time = FloatTime() + 5;
;902:			}
;903:		}
;904:		return;
;905:	}
;906:	// don't just do something wait for the bot team leader to give orders
;907:	if (BotTeamLeader(bs)) {
;908:		return;
;909:	}
;910:	// if the bot is ordered to do something
;911:	if ( bs->lastgoal_ltgtype ) {
;912:		bs->teamgoal_time += 60;
;913:	}
;914:	// if the bot decided to do something on it's own and has a last ordered goal
;915:	if ( !bs->ordered && bs->lastgoal_ltgtype ) {
;916:		bs->ltgtype = 0;
;917:	}
;918:	//if already a CTF or team goal
;919:	if (bs->ltgtype == LTG_TEAMHELP ||
;920:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;921:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;922:			bs->ltgtype == LTG_GETFLAG ||
;923:			bs->ltgtype == LTG_RUSHBASE ||
;924:			bs->ltgtype == LTG_RETURNFLAG ||
;925:			bs->ltgtype == LTG_CAMPORDER ||
;926:			bs->ltgtype == LTG_PATROL ||
;927:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;928:			bs->ltgtype == LTG_GETITEM ||
;929:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;930:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;931:		return;
;932:	}
;933:	//
;934:	if (BotSetLastOrderedTask(bs))
;935:		return;
;936:	//
;937:	if (bs->owndecision_time > FloatTime())
;938:		return;;
;939:	//if the bot is roaming
;940:	if (bs->ctfroam_time > FloatTime())
;941:		return;
;942:	//if the bot has anough aggression to decide what to do
;943:	if (BotAggression(bs) < 50)
;944:		return;
;945:	//set the time to send a message to the team mates
;946:	bs->teammessage_time = FloatTime() + 2 * random();
;947:	//
;948:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
;949:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;950:			l1 = 0.7f;
;951:		}
;952:		else {
;953:			l1 = 0.2f;
;954:		}
;955:		l2 = 0.9f;
;956:	}
;957:	else {
;958:		l1 = 0.4f;
;959:		l2 = 0.7f;
;960:	}
;961:	//get the flag or defend the base
;962:	rnd = random();
;963:	if (rnd < l1 && ctf_neutralflag.areanum) {
;964:		bs->decisionmaker = bs->client;
;965:		bs->ordered = qfalse;
;966:		bs->ltgtype = LTG_GETFLAG;
;967:		//set the time the bot will stop getting the flag
;968:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
;969:		BotSetTeamStatus(bs);
;970:	}
;971:	else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
;972:		bs->decisionmaker = bs->client;
;973:		bs->ordered = qfalse;
;974:		//
;975:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;976:		else memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;977:		//set the ltg type
;978:		bs->ltgtype = LTG_DEFENDKEYAREA;
;979:		//set the time the bot stops defending the base
;980:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;981:		bs->defendaway_time = 0;
;982:		BotSetTeamStatus(bs);
;983:	}
;984:	else {
;985:		bs->ltgtype = 0;
;986:		//set the time the bot will stop roaming
;987:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;988:		BotSetTeamStatus(bs);
;989:	}
;990:	bs->owndecision_time = FloatTime() + 5;
;991:#ifdef DEBUG
;992:	BotPrintTeamGoal(bs);
;993:#endif //DEBUG
;994:}
;995:
;996:/*
;997:==================
;998:Bot1FCTFRetreatGoals
;999:==================
;1000:*/
;1001:void Bot1FCTFRetreatGoals(bot_state_t *bs) {
;1002:	//when carrying a flag in ctf the bot should rush to the enemy base
;1003:	if (Bot1FCTFCarryingFlag(bs)) {
;1004:		//if not already rushing to the base
;1005:		if (bs->ltgtype != LTG_RUSHBASE) {
;1006:			BotRefuseOrder(bs);
;1007:			bs->ltgtype = LTG_RUSHBASE;
;1008:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;1009:			bs->rushbaseaway_time = 0;
;1010:			bs->decisionmaker = bs->client;
;1011:			bs->ordered = qfalse;
;1012:			//get an alternative route goal towards the enemy base
;1013:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1014:			BotSetTeamStatus(bs);
;1015:		}
;1016:	}
;1017:}
;1018:
;1019:/*
;1020:==================
;1021:BotObeliskSeekGoals
;1022:==================
;1023:*/
;1024:void BotObeliskSeekGoals(bot_state_t *bs) {
;1025:	float rnd, l1, l2;
;1026:
;1027:	// don't just do something wait for the bot team leader to give orders
;1028:	if (BotTeamLeader(bs)) {
;1029:		return;
;1030:	}
;1031:	// if the bot is ordered to do something
;1032:	if ( bs->lastgoal_ltgtype ) {
;1033:		bs->teamgoal_time += 60;
;1034:	}
;1035:	//if already a team goal
;1036:	if (bs->ltgtype == LTG_TEAMHELP ||
;1037:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;1038:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;1039:			bs->ltgtype == LTG_GETFLAG ||
;1040:			bs->ltgtype == LTG_RUSHBASE ||
;1041:			bs->ltgtype == LTG_RETURNFLAG ||
;1042:			bs->ltgtype == LTG_CAMPORDER ||
;1043:			bs->ltgtype == LTG_PATROL ||
;1044:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;1045:			bs->ltgtype == LTG_GETITEM ||
;1046:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;1047:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;1048:		return;
;1049:	}
;1050:	//
;1051:	if (BotSetLastOrderedTask(bs))
;1052:		return;
;1053:	//if the bot is roaming
;1054:	if (bs->ctfroam_time > FloatTime())
;1055:		return;
;1056:	//if the bot has anough aggression to decide what to do
;1057:	if (BotAggression(bs) < 50)
;1058:		return;
;1059:	//set the time to send a message to the team mates
;1060:	bs->teammessage_time = FloatTime() + 2 * random();
;1061:	//
;1062:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
;1063:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;1064:			l1 = 0.7f;
;1065:		}
;1066:		else {
;1067:			l1 = 0.2f;
;1068:		}
;1069:		l2 = 0.9f;
;1070:	}
;1071:	else {
;1072:		l1 = 0.4f;
;1073:		l2 = 0.7f;
;1074:	}
;1075:	//get the flag or defend the base
;1076:	rnd = random();
;1077:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
;1078:		bs->decisionmaker = bs->client;
;1079:		bs->ordered = qfalse;
;1080:		//
;1081:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1082:		else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1083:		//set the ltg type
;1084:		bs->ltgtype = LTG_ATTACKENEMYBASE;
;1085:		//set the time the bot will stop attacking the enemy base
;1086:		bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
;1087:		//get an alternate route goal towards the enemy base
;1088:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1089:		BotSetTeamStatus(bs);
;1090:	}
;1091:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
;1092:		bs->decisionmaker = bs->client;
;1093:		bs->ordered = qfalse;
;1094:		//
;1095:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1096:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1097:		//set the ltg type
;1098:		bs->ltgtype = LTG_DEFENDKEYAREA;
;1099:		//set the time the bot stops defending the base
;1100:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;1101:		bs->defendaway_time = 0;
;1102:		BotSetTeamStatus(bs);
;1103:	}
;1104:	else {
;1105:		bs->ltgtype = 0;
;1106:		//set the time the bot will stop roaming
;1107:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;1108:		BotSetTeamStatus(bs);
;1109:	}
;1110:}
;1111:
;1112:/*
;1113:==================
;1114:BotGoHarvest
;1115:==================
;1116:*/
;1117:void BotGoHarvest(bot_state_t *bs) {
;1118:	//
;1119:	if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1120:	else memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1121:	//set the ltg type
;1122:	bs->ltgtype = LTG_HARVEST;
;1123:	//set the time the bot will stop harvesting
;1124:	bs->teamgoal_time = FloatTime() + TEAM_HARVEST_TIME;
;1125:	bs->harvestaway_time = 0;
;1126:	BotSetTeamStatus(bs);
;1127:}
;1128:
;1129:/*
;1130:==================
;1131:BotObeliskRetreatGoals
;1132:==================
;1133:*/
;1134:void BotObeliskRetreatGoals(bot_state_t *bs) {
;1135:	//nothing special
;1136:}
;1137:
;1138:/*
;1139:==================
;1140:BotHarvesterSeekGoals
;1141:==================
;1142:*/
;1143:void BotHarvesterSeekGoals(bot_state_t *bs) {
;1144:	aas_entityinfo_t entinfo;
;1145:	float rnd, l1, l2;
;1146:	int c;
;1147:
;1148:	//when carrying cubes in harvester the bot should rush to the base
;1149:	if (BotHarvesterCarryingCubes(bs)) {
;1150:		//if not already rushing to the base
;1151:		if (bs->ltgtype != LTG_RUSHBASE) {
;1152:			BotRefuseOrder(bs);
;1153:			bs->ltgtype = LTG_RUSHBASE;
;1154:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;1155:			bs->rushbaseaway_time = 0;
;1156:			bs->decisionmaker = bs->client;
;1157:			bs->ordered = qfalse;
;1158:			//get an alternative route goal towards the enemy base
;1159:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1160:			//
;1161:			BotSetTeamStatus(bs);
;1162:		}
;1163:		return;
;1164:	}
;1165:	// don't just do something wait for the bot team leader to give orders
;1166:	if (BotTeamLeader(bs)) {
;1167:		return;
;1168:	}
;1169:	// if the bot decided to follow someone
;1170:	if ( bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered ) {
;1171:		// if the team mate being accompanied no longer carries the flag
;1172:		BotEntityInfo(bs->teammate, &entinfo);
;1173:		if (!EntityCarriesCubes(&entinfo)) {
;1174:			bs->ltgtype = 0;
;1175:		}
;1176:	}
;1177:	// if the bot is ordered to do something
;1178:	if ( bs->lastgoal_ltgtype ) {
;1179:		bs->teamgoal_time += 60;
;1180:	}
;1181:	//if not yet doing something
;1182:	if (bs->ltgtype == LTG_TEAMHELP ||
;1183:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;1184:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;1185:			bs->ltgtype == LTG_GETFLAG ||
;1186:			bs->ltgtype == LTG_CAMPORDER ||
;1187:			bs->ltgtype == LTG_PATROL ||
;1188:			bs->ltgtype == LTG_ATTACKENEMYBASE ||
;1189:			bs->ltgtype == LTG_HARVEST ||
;1190:			bs->ltgtype == LTG_GETITEM ||
;1191:			bs->ltgtype == LTG_MAKELOVE_UNDER ||
;1192:			bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;1193:		return;
;1194:	}
;1195:	//
;1196:	if (BotSetLastOrderedTask(bs))
;1197:		return;
;1198:	//if the bot is roaming
;1199:	if (bs->ctfroam_time > FloatTime())
;1200:		return;
;1201:	//if the bot has anough aggression to decide what to do
;1202:	if (BotAggression(bs) < 50)
;1203:		return;
;1204:	//set the time to send a message to the team mates
;1205:	bs->teammessage_time = FloatTime() + 2 * random();
;1206:	//
;1207:	c = BotEnemyCubeCarrierVisible(bs);
;1208:	if (c >= 0) {
;1209:		//FIXME: attack enemy cube carrier
;1210:	}
;1211:	if (bs->ltgtype != LTG_TEAMACCOMPANY) {
;1212:		//if there is a visible team mate carrying cubes
;1213:		c = BotTeamCubeCarrierVisible(bs);
;1214:		if (c >= 0) {
;1215:			//follow the team mate carrying cubes
;1216:			bs->decisionmaker = bs->client;
;1217:			bs->ordered = qfalse;
;1218:			//the team mate
;1219:			bs->teammate = c;
;1220:			//last time the team mate was visible
;1221:			bs->teammatevisible_time = FloatTime();
;1222:			//no message
;1223:			bs->teammessage_time = 0;
;1224:			//no arrive message
;1225:			bs->arrive_time = 1;
;1226:			//
;1227:			BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;1228:			//get the team goal time
;1229:			bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
;1230:			bs->ltgtype = LTG_TEAMACCOMPANY;
;1231:			bs->formation_dist = 3.5 * 32;		//3.5 meter
;1232:			BotSetTeamStatus(bs);
;1233:			return;
;1234:		}
;1235:	}
;1236:	//
;1237:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER|TEAMTP_DEFENDER)) {
;1238:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;1239:			l1 = 0.7f;
;1240:		}
;1241:		else {
;1242:			l1 = 0.2f;
;1243:		}
;1244:		l2 = 0.9f;
;1245:	}
;1246:	else {
;1247:		l1 = 0.4f;
;1248:		l2 = 0.7f;
;1249:	}
;1250:	//
;1251:	rnd = random();
;1252:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
;1253:		bs->decisionmaker = bs->client;
;1254:		bs->ordered = qfalse;
;1255:		BotGoHarvest(bs);
;1256:	}
;1257:	else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
;1258:		bs->decisionmaker = bs->client;
;1259:		bs->ordered = qfalse;
;1260:		//
;1261:		if (BotTeam(bs) == TEAM_RED) memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1262:		else memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1263:		//set the ltg type
;1264:		bs->ltgtype = LTG_DEFENDKEYAREA;
;1265:		//set the time the bot stops defending the base
;1266:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;1267:		bs->defendaway_time = 0;
;1268:		BotSetTeamStatus(bs);
;1269:	}
;1270:	else {
;1271:		bs->ltgtype = 0;
;1272:		//set the time the bot will stop roaming
;1273:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;1274:		BotSetTeamStatus(bs);
;1275:	}
;1276:}
;1277:
;1278:/*
;1279:==================
;1280:BotHarvesterRetreatGoals
;1281:==================
;1282:*/
;1283:void BotHarvesterRetreatGoals(bot_state_t *bs) {
;1284:	//when carrying cubes in harvester the bot should rush to the base
;1285:	if (BotHarvesterCarryingCubes(bs)) {
;1286:		//if not already rushing to the base
;1287:		if (bs->ltgtype != LTG_RUSHBASE) {
;1288:			BotRefuseOrder(bs);
;1289:			bs->ltgtype = LTG_RUSHBASE;
;1290:			bs->teamgoal_time = FloatTime() + CTF_RUSHBASE_TIME;
;1291:			bs->rushbaseaway_time = 0;
;1292:			bs->decisionmaker = bs->client;
;1293:			bs->ordered = qfalse;
;1294:			BotSetTeamStatus(bs);
;1295:		}
;1296:		return;
;1297:	}
;1298:}
;1299:#endif
;1300:
;1301:/*
;1302:==================
;1303:BotTeamGoals
;1304:==================
;1305:*/
;1306:void BotTeamGoals(bot_state_t *bs, int retreat) {
line 1308
;1307:
;1308:	if ( retreat ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $250
line 1309
;1309:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $251
line 1310
;1310:			BotCTFRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFRetreatGoals
CALLV
pop
line 1311
;1311:		}
line 1323
;1312:#ifdef MISSIONPACK
;1313:		else if (gametype == GT_1FCTF) {
;1314:			Bot1FCTFRetreatGoals(bs);
;1315:		}
;1316:		else if (gametype == GT_OBELISK) {
;1317:			BotObeliskRetreatGoals(bs);
;1318:		}
;1319:		else if (gametype == GT_HARVESTER) {
;1320:			BotHarvesterRetreatGoals(bs);
;1321:		}
;1322:#endif
;1323:	}
ADDRGP4 $251
JUMPV
LABELV $250
line 1324
;1324:	else {
line 1325
;1325:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $254
line 1327
;1326:			//decide what to do in CTF mode
;1327:			BotCTFSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFSeekGoals
CALLV
pop
line 1328
;1328:		}
LABELV $254
line 1340
;1329:#ifdef MISSIONPACK
;1330:		else if (gametype == GT_1FCTF) {
;1331:			Bot1FCTFSeekGoals(bs);
;1332:		}
;1333:		else if (gametype == GT_OBELISK) {
;1334:			BotObeliskSeekGoals(bs);
;1335:		}
;1336:		else if (gametype == GT_HARVESTER) {
;1337:			BotHarvesterSeekGoals(bs);
;1338:		}
;1339:#endif
;1340:	}
LABELV $251
line 1343
;1341:	// reset the order time which is used to see if
;1342:	// we decided to refuse an order
;1343:	bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
CNSTF4 0
ASGNF4
line 1344
;1344:}
LABELV $249
endproc BotTeamGoals 0 4
export BotPointAreaNum
proc BotPointAreaNum 68 20
line 1351
;1345:
;1346:/*
;1347:==================
;1348:BotPointAreaNum
;1349:==================
;1350:*/
;1351:int BotPointAreaNum(vec3_t origin) {
line 1355
;1352:	int areanum, numareas, areas[10];
;1353:	vec3_t end;
;1354:
;1355:	areanum = trap_AAS_PointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 trap_AAS_PointAreaNum
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 60
INDIRI4
ASGNI4
line 1356
;1356:	if (areanum) return areanum;
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $257
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $256
JUMPV
LABELV $257
line 1357
;1357:	VectorCopy(origin, end);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1358
;1358:	end[2] += 10;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1359
;1359:	numareas = trap_AAS_TraceAreas(origin, end, areas, NULL, 10);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 64
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 64
INDIRI4
ASGNI4
line 1360
;1360:	if (numareas > 0) return areas[0];
ADDRLP4 16
INDIRI4
CNSTI4 0
LEI4 $260
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $256
JUMPV
LABELV $260
line 1361
;1361:	return 0;
CNSTI4 0
RETI4
LABELV $256
endproc BotPointAreaNum 68 20
export ClientName
proc ClientName 1032 12
line 1369
;1362:}
;1363:
;1364:/*
;1365:==================
;1366:ClientName
;1367:==================
;1368:*/
;1369:char *ClientName(int client, char *name, int size) {
line 1372
;1370:	char buf[MAX_INFO_STRING];
;1371:
;1372:	if (client < 0 || client >= MAX_CLIENTS) {
ADDRLP4 1024
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $265
ADDRLP4 1024
INDIRI4
CNSTI4 64
LTI4 $263
LABELV $265
line 1373
;1373:		BotAI_Print(PRT_ERROR, "ClientName: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $266
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1374
;1374:		return "[client out of range]";
ADDRGP4 $267
RETP4
ADDRGP4 $262
JUMPV
LABELV $263
line 1376
;1375:	}
;1376:	trap_GetConfigstring(CS_PLAYERS+client, buf, sizeof(buf));
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1377
;1377:	strncpy(name, Info_ValueForKey(buf, "n"), size-1);
ADDRLP4 0
ARGP4
ADDRGP4 $268
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1378
;1378:	name[size-1] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1379
;1379:	Q_CleanStr( name );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1380
;1380:	return name;
ADDRFP4 4
INDIRP4
RETP4
LABELV $262
endproc ClientName 1032 12
export ClientSkin
proc ClientSkin 1032 12
line 1388
;1381:}
;1382:
;1383:/*
;1384:==================
;1385:ClientSkin
;1386:==================
;1387:*/
;1388:char *ClientSkin(int client, char *skin, int size) {
line 1391
;1389:	char buf[MAX_INFO_STRING];
;1390:
;1391:	if (client < 0 || client >= MAX_CLIENTS) {
ADDRLP4 1024
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $272
ADDRLP4 1024
INDIRI4
CNSTI4 64
LTI4 $270
LABELV $272
line 1392
;1392:		BotAI_Print(PRT_ERROR, "ClientSkin: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $273
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1393
;1393:		return "[client out of range]";
ADDRGP4 $267
RETP4
ADDRGP4 $269
JUMPV
LABELV $270
line 1395
;1394:	}
;1395:	trap_GetConfigstring(CS_PLAYERS+client, buf, sizeof(buf));
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1396
;1396:	strncpy(skin, Info_ValueForKey(buf, "model"), size-1);
ADDRLP4 0
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1397
;1397:	skin[size-1] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1398
;1398:	return skin;
ADDRFP4 4
INDIRP4
RETP4
LABELV $269
endproc ClientSkin 1032 12
bss
align 4
LABELV $276
skip 4
export ClientFromName
code
proc ClientFromName 1040 12
line 1406
;1399:}
;1400:
;1401:/*
;1402:==================
;1403:ClientFromName
;1404:==================
;1405:*/
;1406:int ClientFromName(char *name) {
line 1411
;1407:	int i;
;1408:	char buf[MAX_INFO_STRING];
;1409:	static int maxclients;
;1410:
;1411:	if (!maxclients)
ADDRGP4 $276
INDIRI4
CNSTI4 0
NEI4 $277
line 1412
;1412:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $279
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $276
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $277
line 1413
;1413:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $283
JUMPV
LABELV $280
line 1414
;1414:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1415
;1415:		Q_CleanStr( buf );
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1416
;1416:		if (!Q_stricmp(Info_ValueForKey(buf, "n"), name)) return i;
ADDRLP4 4
ARGP4
ADDRGP4 $268
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $284
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $275
JUMPV
LABELV $284
line 1417
;1417:	}
LABELV $281
line 1413
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $283
ADDRLP4 0
INDIRI4
ADDRGP4 $276
INDIRI4
GEI4 $286
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $280
LABELV $286
line 1418
;1418:	return -1;
CNSTI4 -1
RETI4
LABELV $275
endproc ClientFromName 1040 12
bss
align 4
LABELV $288
skip 4
export ClientOnSameTeamFromName
code
proc ClientOnSameTeamFromName 1044 12
line 1426
;1419:}
;1420:
;1421:/*
;1422:==================
;1423:ClientOnSameTeamFromName
;1424:==================
;1425:*/
;1426:int ClientOnSameTeamFromName(bot_state_t *bs, char *name) {
line 1431
;1427:	int i;
;1428:	char buf[MAX_INFO_STRING];
;1429:	static int maxclients;
;1430:
;1431:	if (!maxclients)
ADDRGP4 $288
INDIRI4
CNSTI4 0
NEI4 $289
line 1432
;1432:		maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $279
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 $288
ADDRLP4 1028
INDIRI4
ASGNI4
LABELV $289
line 1433
;1433:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $294
JUMPV
LABELV $291
line 1434
;1434:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1032
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $295
line 1435
;1435:			continue;
ADDRGP4 $292
JUMPV
LABELV $295
line 1436
;1436:		trap_GetConfigstring(CS_PLAYERS+i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1437
;1437:		Q_CleanStr( buf );
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1438
;1438:		if (!Q_stricmp(Info_ValueForKey(buf, "n"), name)) return i;
ADDRLP4 4
ARGP4
ADDRGP4 $268
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $297
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $287
JUMPV
LABELV $297
line 1439
;1439:	}
LABELV $292
line 1433
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $294
ADDRLP4 0
INDIRI4
ADDRGP4 $288
INDIRI4
GEI4 $299
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $291
LABELV $299
line 1440
;1440:	return -1;
CNSTI4 -1
RETI4
LABELV $287
endproc ClientOnSameTeamFromName 1044 12
export stristr
proc stristr 12 4
line 1448
;1441:}
;1442:
;1443:/*
;1444:==================
;1445:stristr
;1446:==================
;1447:*/
;1448:char *stristr(char *str, char *charset) {
ADDRGP4 $302
JUMPV
LABELV $301
line 1451
;1449:	int i;
;1450:
;1451:	while(*str) {
line 1452
;1452:		for (i = 0; charset[i] && str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $307
JUMPV
LABELV $304
line 1453
;1453:			if (toupper(charset[i]) != toupper(str[i])) break;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $308
ADDRGP4 $306
JUMPV
LABELV $308
line 1454
;1454:		}
LABELV $305
line 1452
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $307
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
EQI4 $310
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
NEI4 $304
LABELV $310
LABELV $306
line 1455
;1455:		if (!charset[i]) return str;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $311
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $300
JUMPV
LABELV $311
line 1456
;1456:		str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1457
;1457:	}
LABELV $302
line 1451
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $301
line 1458
;1458:	return NULL;
CNSTP4 0
RETP4
LABELV $300
endproc stristr 12 4
export EasyClientName
proc EasyClientName 204 12
line 1466
;1459:}
;1460:
;1461:/*
;1462:==================
;1463:EasyClientName
;1464:==================
;1465:*/
;1466:char *EasyClientName(int client, char *buf, int size) {
line 1471
;1467:	int i;
;1468:	char *str1, *str2, *ptr, c;
;1469:	char name[128];
;1470:
;1471:	strcpy(name, ClientName(client, name, sizeof(name)));
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 5
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 148
ADDRGP4 ClientName
CALLP4
ASGNP4
ADDRLP4 5
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1472
;1472:	for (i = 0; name[i]; i++) name[i] &= 127;
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 $317
JUMPV
LABELV $314
ADDRLP4 152
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVII1 4
ASGNI1
LABELV $315
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $317
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $314
line 1474
;1473:	//remove all spaces
;1474:	for (ptr = strstr(name, " "); ptr; ptr = strstr(name, " ")) {
ADDRLP4 5
ARGP4
ADDRGP4 $322
ARGP4
ADDRLP4 156
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
ADDRGP4 $321
JUMPV
LABELV $318
line 1475
;1475:		memmove(ptr, ptr+1, strlen(ptr+1)+1);
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 160
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 168
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
INDIRI4
ADDRLP4 168
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1476
;1476:	}
LABELV $319
line 1474
ADDRLP4 5
ARGP4
ADDRGP4 $322
ARGP4
ADDRLP4 160
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 160
INDIRP4
ASGNP4
LABELV $321
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $318
line 1478
;1477:	//check for [x] and ]x[ clan names
;1478:	str1 = strstr(name, "[");
ADDRLP4 5
ARGP4
ADDRGP4 $323
ARGP4
ADDRLP4 164
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 164
INDIRP4
ASGNP4
line 1479
;1479:	str2 = strstr(name, "]");
ADDRLP4 5
ARGP4
ADDRGP4 $324
ARGP4
ADDRLP4 168
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 144
ADDRLP4 168
INDIRP4
ASGNP4
line 1480
;1480:	if (str1 && str2) {
ADDRLP4 172
CNSTU4 0
ASGNU4
ADDRLP4 140
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $325
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $325
line 1481
;1481:		if (str2 > str1) memmove(str1, str2+1, strlen(str2+1)+1);
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRP4
CVPU4 4
LEU4 $327
ADDRLP4 144
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 176
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 180
CNSTI4 1
ASGNI4
ADDRLP4 144
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
ARGP4
ADDRLP4 176
INDIRI4
ADDRLP4 180
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
ADDRGP4 $328
JUMPV
LABELV $327
line 1482
;1482:		else memmove(str2, str1+1, strlen(str1+1)+1);
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 184
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 188
CNSTI4 1
ASGNI4
ADDRLP4 140
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
ARGP4
ADDRLP4 184
INDIRI4
ADDRLP4 188
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
LABELV $328
line 1483
;1483:	}
LABELV $325
line 1485
;1484:	//remove Mr prefix
;1485:	if ((name[0] == 'm' || name[0] == 'M') &&
ADDRLP4 176
ADDRLP4 5
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 109
EQI4 $333
ADDRLP4 176
INDIRI4
CNSTI4 77
NEI4 $329
LABELV $333
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 114
EQI4 $334
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 82
NEI4 $329
LABELV $334
line 1486
;1486:			(name[1] == 'r' || name[1] == 'R')) {
line 1487
;1487:		memmove(name, name+2, strlen(name+2)+1);
ADDRLP4 5+2
ARGP4
ADDRLP4 180
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 5
ARGP4
ADDRLP4 5+2
ARGP4
ADDRLP4 180
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1488
;1488:	}
LABELV $329
line 1490
;1489:	//only allow lower case alphabet characters
;1490:	ptr = name;
ADDRLP4 0
ADDRLP4 5
ASGNP4
ADDRGP4 $338
JUMPV
LABELV $337
line 1491
;1491:	while(*ptr) {
line 1492
;1492:		c = *ptr;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 1493
;1493:		if ((c >= 'a' && c <= 'z') ||
ADDRLP4 180
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 97
LTI4 $343
ADDRLP4 180
INDIRI4
CNSTI4 122
LEI4 $344
LABELV $343
ADDRLP4 184
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 48
LTI4 $345
ADDRLP4 184
INDIRI4
CNSTI4 57
LEI4 $344
LABELV $345
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 95
NEI4 $340
LABELV $344
line 1494
;1494:				(c >= '0' && c <= '9') || c == '_') {
line 1495
;1495:			ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1496
;1496:		}
ADDRGP4 $341
JUMPV
LABELV $340
line 1497
;1497:		else if (c >= 'A' && c <= 'Z') {
ADDRLP4 188
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 65
LTI4 $346
ADDRLP4 188
INDIRI4
CNSTI4 90
GTI4 $346
line 1498
;1498:			*ptr += 'a' - 'A';
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
ADDI4
CVII1 4
ASGNI1
line 1499
;1499:			ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1500
;1500:		}
ADDRGP4 $347
JUMPV
LABELV $346
line 1501
;1501:		else {
line 1502
;1502:			memmove(ptr, ptr+1, strlen(ptr + 1)+1);
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 192
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 200
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
ARGP4
ADDRLP4 192
INDIRI4
ADDRLP4 200
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1503
;1503:		}
LABELV $347
LABELV $341
line 1504
;1504:	}
LABELV $338
line 1491
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $337
line 1505
;1505:	strncpy(buf, name, size-1);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 5
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 1506
;1506:	buf[size-1] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1507
;1507:	return buf;
ADDRFP4 4
INDIRP4
RETP4
LABELV $313
endproc EasyClientName 204 12
export BotSynonymContext
proc BotSynonymContext 8 4
line 1515
;1508:}
;1509:
;1510:/*
;1511:==================
;1512:BotSynonymContext
;1513:==================
;1514:*/
;1515:int BotSynonymContext(bot_state_t *bs) {
line 1518
;1516:	int context;
;1517:
;1518:	context = CONTEXT_NORMAL|CONTEXT_NEARBYITEM|CONTEXT_NAMES;
ADDRLP4 0
CNSTI4 1027
ASGNI4
line 1520
;1519:	//
;1520:	if (gametype == GT_CTF
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $349
line 1524
;1521:#ifdef MISSIONPACK
;1522:		|| gametype == GT_1FCTF
;1523:#endif
;1524:		) {
line 1525
;1525:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_CTFREDTEAM;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $351
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4
BORI4
ASGNI4
ADDRGP4 $352
JUMPV
LABELV $351
line 1526
;1526:		else context |= CONTEXT_CTFBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $352
line 1527
;1527:	}
LABELV $349
line 1538
;1528:#ifdef MISSIONPACK
;1529:	else if (gametype == GT_OBELISK) {
;1530:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_OBELISKREDTEAM;
;1531:		else context |= CONTEXT_OBELISKBLUETEAM;
;1532:	}
;1533:	else if (gametype == GT_HARVESTER) {
;1534:		if (BotTeam(bs) == TEAM_RED) context |= CONTEXT_HARVESTERREDTEAM;
;1535:		else context |= CONTEXT_HARVESTERBLUETEAM;
;1536:	}
;1537:#endif
;1538:	return context;
ADDRLP4 0
INDIRI4
RETI4
LABELV $348
endproc BotSynonymContext 8 4
export BotChooseWeapon
proc BotChooseWeapon 20 8
line 1546
;1539:}
;1540:
;1541:/*
;1542:==================
;1543:BotChooseWeapon
;1544:==================
;1545:*/
;1546:void BotChooseWeapon(bot_state_t *bs) {
line 1549
;1547:	int newweaponnum;
;1548:
;1549:	if (bs->cur_ps.weaponstate == WEAPON_RAISING ||
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $356
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $354
LABELV $356
line 1550
;1550:			bs->cur_ps.weaponstate == WEAPON_DROPPING) {
line 1551
;1551:		trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1552
;1552:	}
ADDRGP4 $355
JUMPV
LABELV $354
line 1553
;1553:	else {
line 1554
;1554:		newweaponnum = trap_BotChooseBestFightWeapon(bs->ws, bs->inventory);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_BotChooseBestFightWeapon
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1555
;1555:		if (bs->weaponnum != newweaponnum) bs->weaponchange_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $357
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $357
line 1556
;1556:		bs->weaponnum = newweaponnum;
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1558
;1557:		//BotAI_Print(PRT_MESSAGE, "bs->weaponnum = %d\n", bs->weaponnum);
;1558:		trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1559
;1559:	}
LABELV $355
line 1560
;1560:}
LABELV $353
endproc BotChooseWeapon 20 8
export BotSetupForMovement
proc BotSetupForMovement 88 12
line 1567
;1561:
;1562:/*
;1563:==================
;1564:BotSetupForMovement
;1565:==================
;1566:*/
;1567:void BotSetupForMovement(bot_state_t *bs) {
line 1570
;1568:	bot_initmove_t initmove;
;1569:
;1570:	memset(&initmove, 0, sizeof(bot_initmove_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 68
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1571
;1571:	VectorCopy(bs->cur_ps.origin, initmove.origin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1572
;1572:	VectorCopy(bs->cur_ps.velocity, initmove.velocity);
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRB
ASGNB 12
line 1573
;1573:	VectorClear(initmove.viewoffset);
ADDRLP4 68
CNSTF4 0
ASGNF4
ADDRLP4 0+24+8
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 0+24+4
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 0+24
ADDRLP4 68
INDIRF4
ASGNF4
line 1574
;1574:	initmove.viewoffset[2] += bs->cur_ps.viewheight;
ADDRLP4 0+24+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1575
;1575:	initmove.entitynum = bs->entitynum;
ADDRLP4 0+36
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1576
;1576:	initmove.client = bs->client;
ADDRLP4 0+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1577
;1577:	initmove.thinktime = bs->thinktime;
ADDRLP4 0+44
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ASGNF4
line 1579
;1578:	//set the onground flag
;1579:	if (bs->cur_ps.groundEntityNum != ENTITYNUM_NONE) initmove.or_moveflags |= MFL_ONGROUND;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $371
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $371
line 1581
;1580:	//set the teleported flag
;1581:	if ((bs->cur_ps.pm_flags & PMF_TIME_KNOCKBACK) && (bs->cur_ps.pm_time > 0)) {
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 76
INDIRI4
EQI4 $374
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $374
line 1582
;1582:		initmove.or_moveflags |= MFL_TELEPORTED;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1583
;1583:	}
LABELV $374
line 1585
;1584:	//set the waterjump flag
;1585:	if ((bs->cur_ps.pm_flags & PMF_TIME_WATERJUMP) && (bs->cur_ps.pm_time > 0)) {
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 84
INDIRI4
EQI4 $377
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
LEI4 $377
line 1586
;1586:		initmove.or_moveflags |= MFL_WATERJUMP;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1587
;1587:	}
LABELV $377
line 1589
;1588:	//set presence type
;1589:	if (bs->cur_ps.pm_flags & PMF_DUCKED) initmove.presencetype = PRESENCE_CROUCH;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $380
ADDRLP4 0+48
CNSTI4 4
ASGNI4
ADDRGP4 $381
JUMPV
LABELV $380
line 1590
;1590:	else initmove.presencetype = PRESENCE_NORMAL;
ADDRLP4 0+48
CNSTI4 2
ASGNI4
LABELV $381
line 1592
;1591:	//
;1592:	if (bs->walker > 0.5) initmove.or_moveflags |= MFL_WALK;
ADDRFP4 0
INDIRP4
CNSTI4 6056
ADDP4
INDIRF4
CNSTF4 1056964608
LEF4 $384
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $384
line 1594
;1593:	//
;1594:	VectorCopy(bs->viewangles, initmove.viewangles);
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
INDIRB
ASGNB 12
line 1596
;1595:	//
;1596:	trap_BotInitMoveState(bs->ms, &initmove);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotInitMoveState
CALLV
pop
line 1597
;1597:}
LABELV $359
endproc BotSetupForMovement 88 12
export BotCheckItemPickup
proc BotCheckItemPickup 0 0
line 1604
;1598:
;1599:/*
;1600:==================
;1601:BotCheckItemPickup
;1602:==================
;1603:*/
;1604:void BotCheckItemPickup(bot_state_t *bs, int *oldinventory) {
line 1691
;1605:#ifdef MISSIONPACK
;1606:	int offence, leader;
;1607:
;1608:	if (gametype <= GT_TEAM)
;1609:		return;
;1610:
;1611:	offence = -1;
;1612:	// go into offence if picked up the kamikaze or invulnerability
;1613:	if (!oldinventory[INVENTORY_KAMIKAZE] && bs->inventory[INVENTORY_KAMIKAZE] >= 1) {
;1614:		offence = qtrue;
;1615:	}
;1616:	if (!oldinventory[INVENTORY_INVULNERABILITY] && bs->inventory[INVENTORY_INVULNERABILITY] >= 1) {
;1617:		offence = qtrue;
;1618:	}
;1619:	// if not already wearing the kamikaze or invulnerability
;1620:	if (!bs->inventory[INVENTORY_KAMIKAZE] && !bs->inventory[INVENTORY_INVULNERABILITY]) {
;1621:		if (!oldinventory[INVENTORY_SCOUT] && bs->inventory[INVENTORY_SCOUT] >= 1) {
;1622:			offence = qtrue;
;1623:		}
;1624:		if (!oldinventory[INVENTORY_GUARD] && bs->inventory[INVENTORY_GUARD] >= 1) {
;1625:			offence = qtrue;
;1626:		}
;1627:		if (!oldinventory[INVENTORY_DOUBLER] && bs->inventory[INVENTORY_DOUBLER] >= 1) {
;1628:			offence = qfalse;
;1629:		}
;1630:		if (!oldinventory[INVENTORY_AMMOREGEN] && bs->inventory[INVENTORY_AMMOREGEN] >= 1) {
;1631:			offence = qfalse;
;1632:		}
;1633:	}
;1634:
;1635:	if (offence >= 0) {
;1636:		leader = ClientFromName(bs->teamleader);
;1637:		if (offence) {
;1638:			if (!(bs->teamtaskpreference & TEAMTP_ATTACKER)) {
;1639:				// if we have a bot team leader
;1640:				if (BotTeamLeader(bs)) {
;1641:					// tell the leader we want to be on offence
;1642:					BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
;1643:					//BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1644:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1645:				}
;1646:				else if (g_spSkill.integer <= 3) {
;1647:					if ( bs->ltgtype != LTG_GETFLAG &&
;1648:						 bs->ltgtype != LTG_ATTACKENEMYBASE &&
;1649:						 bs->ltgtype != LTG_HARVEST ) {
;1650:						//
;1651:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
;1652:							(gametype != GT_1FCTF || bs->neutralflagstatus == 0) ) {
;1653:							// tell the leader we want to be on offence
;1654:							BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
;1655:							//BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1656:							//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1657:						}
;1658:					}
;1659:					bs->teamtaskpreference |= TEAMTP_ATTACKER;
;1660:				}
;1661:			}
;1662:			bs->teamtaskpreference &= ~TEAMTP_DEFENDER;
;1663:		}
;1664:		else {
;1665:			if (!(bs->teamtaskpreference & TEAMTP_DEFENDER)) {
;1666:				// if we have a bot team leader
;1667:				if (BotTeamLeader(bs)) {
;1668:					// tell the leader we want to be on defense
;1669:					BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
;1670:					//BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1671:					//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1672:				}
;1673:				else if (g_spSkill.integer <= 3) {
;1674:					if ( bs->ltgtype != LTG_DEFENDKEYAREA ) {
;1675:						//
;1676:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
;1677:							(gametype != GT_1FCTF || bs->neutralflagstatus == 0) ) {
;1678:							// tell the leader we want to be on defense
;1679:							BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
;1680:							//BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1681:							//trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1682:						}
;1683:					}
;1684:				}
;1685:				bs->teamtaskpreference |= TEAMTP_DEFENDER;
;1686:			}
;1687:			bs->teamtaskpreference &= ~TEAMTP_ATTACKER;
;1688:		}
;1689:	}
;1690:#endif
;1691:}
LABELV $388
endproc BotCheckItemPickup 0 0
export BotUpdateInventory
proc BotUpdateInventory 1224 12
line 1698
;1692:
;1693:/*
;1694:==================
;1695:BotUpdateInventory
;1696:==================
;1697:*/
;1698:void BotUpdateInventory(bot_state_t *bs) {
line 1701
;1699:	int oldinventory[MAX_ITEMS];
;1700:
;1701:	memcpy(oldinventory, bs->inventory, sizeof(oldinventory));
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1703
;1702:	//armor
;1703:	bs->inventory[INVENTORY_ARMOR] = bs->cur_ps.stats[STAT_ARMOR];
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1024
INDIRP4
CNSTI4 4956
ADDP4
ADDRLP4 1024
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 1705
;1704:	//weapons
;1705:	bs->inventory[INVENTORY_GAUNTLET] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GAUNTLET)) != 0;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $391
ADDRLP4 1028
CNSTI4 1
ASGNI4
ADDRGP4 $392
JUMPV
LABELV $391
ADDRLP4 1028
CNSTI4 0
ASGNI4
LABELV $392
ADDRLP4 1032
INDIRP4
CNSTI4 4968
ADDP4
ADDRLP4 1028
INDIRI4
ASGNI4
line 1706
;1706:	bs->inventory[INVENTORY_SHOTGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_SHOTGUN)) != 0;
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $394
ADDRLP4 1036
CNSTI4 1
ASGNI4
ADDRGP4 $395
JUMPV
LABELV $394
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $395
ADDRLP4 1040
INDIRP4
CNSTI4 4972
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 1707
;1707:	bs->inventory[INVENTORY_MACHINEGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_MACHINEGUN)) != 0;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $397
ADDRLP4 1044
CNSTI4 1
ASGNI4
ADDRGP4 $398
JUMPV
LABELV $397
ADDRLP4 1044
CNSTI4 0
ASGNI4
LABELV $398
ADDRLP4 1048
INDIRP4
CNSTI4 4976
ADDP4
ADDRLP4 1044
INDIRI4
ASGNI4
line 1708
;1708:	bs->inventory[INVENTORY_GRENADELAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRENADE_LAUNCHER)) != 0;
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $400
ADDRLP4 1052
CNSTI4 1
ASGNI4
ADDRGP4 $401
JUMPV
LABELV $400
ADDRLP4 1052
CNSTI4 0
ASGNI4
LABELV $401
ADDRLP4 1056
INDIRP4
CNSTI4 4980
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 1709
;1709:	bs->inventory[INVENTORY_ROCKETLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_ROCKET_LAUNCHER)) != 0;
ADDRLP4 1064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $403
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRGP4 $404
JUMPV
LABELV $403
ADDRLP4 1060
CNSTI4 0
ASGNI4
LABELV $404
ADDRLP4 1064
INDIRP4
CNSTI4 4984
ADDP4
ADDRLP4 1060
INDIRI4
ASGNI4
line 1710
;1710:	bs->inventory[INVENTORY_LIGHTNING] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_LIGHTNING)) != 0;
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $406
ADDRLP4 1068
CNSTI4 1
ASGNI4
ADDRGP4 $407
JUMPV
LABELV $406
ADDRLP4 1068
CNSTI4 0
ASGNI4
LABELV $407
ADDRLP4 1072
INDIRP4
CNSTI4 4988
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 1711
;1711:	bs->inventory[INVENTORY_RAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_RAILGUN)) != 0;
ADDRLP4 1080
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $409
ADDRLP4 1076
CNSTI4 1
ASGNI4
ADDRGP4 $410
JUMPV
LABELV $409
ADDRLP4 1076
CNSTI4 0
ASGNI4
LABELV $410
ADDRLP4 1080
INDIRP4
CNSTI4 4992
ADDP4
ADDRLP4 1076
INDIRI4
ASGNI4
line 1712
;1712:	bs->inventory[INVENTORY_PLASMAGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PLASMAGUN)) != 0;
ADDRLP4 1088
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $412
ADDRLP4 1084
CNSTI4 1
ASGNI4
ADDRGP4 $413
JUMPV
LABELV $412
ADDRLP4 1084
CNSTI4 0
ASGNI4
LABELV $413
ADDRLP4 1088
INDIRP4
CNSTI4 4996
ADDP4
ADDRLP4 1084
INDIRI4
ASGNI4
line 1713
;1713:	bs->inventory[INVENTORY_BFG10K] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_BFG)) != 0;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $415
ADDRLP4 1092
CNSTI4 1
ASGNI4
ADDRGP4 $416
JUMPV
LABELV $415
ADDRLP4 1092
CNSTI4 0
ASGNI4
LABELV $416
ADDRLP4 1096
INDIRP4
CNSTI4 5004
ADDP4
ADDRLP4 1092
INDIRI4
ASGNI4
line 1714
;1714:	bs->inventory[INVENTORY_GRAPPLINGHOOK] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRAPPLING_HOOK)) != 0;
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $418
ADDRLP4 1100
CNSTI4 1
ASGNI4
ADDRGP4 $419
JUMPV
LABELV $418
ADDRLP4 1100
CNSTI4 0
ASGNI4
LABELV $419
ADDRLP4 1104
INDIRP4
CNSTI4 5008
ADDP4
ADDRLP4 1100
INDIRI4
ASGNI4
line 1721
;1715:#ifdef MISSIONPACK
;1716:	bs->inventory[INVENTORY_NAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_NAILGUN)) != 0;;
;1717:	bs->inventory[INVENTORY_PROXLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PROX_LAUNCHER)) != 0;;
;1718:	bs->inventory[INVENTORY_CHAINGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_CHAINGUN)) != 0;;
;1719:#endif
;1720:	//ammo
;1721:	bs->inventory[INVENTORY_SHELLS] = bs->cur_ps.ammo[WP_SHOTGUN];
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CNSTI4 5024
ADDP4
ADDRLP4 1108
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
ASGNI4
line 1722
;1722:	bs->inventory[INVENTORY_BULLETS] = bs->cur_ps.ammo[WP_MACHINEGUN];
ADDRLP4 1112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CNSTI4 5028
ADDP4
ADDRLP4 1112
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
ASGNI4
line 1723
;1723:	bs->inventory[INVENTORY_GRENADES] = bs->cur_ps.ammo[WP_GRENADE_LAUNCHER];
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 5032
ADDP4
ADDRLP4 1116
INDIRP4
CNSTI4 408
ADDP4
INDIRI4
ASGNI4
line 1724
;1724:	bs->inventory[INVENTORY_CELLS] = bs->cur_ps.ammo[WP_PLASMAGUN];
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 5036
ADDP4
ADDRLP4 1120
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 1725
;1725:	bs->inventory[INVENTORY_LIGHTNINGAMMO] = bs->cur_ps.ammo[WP_LIGHTNING];
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 5040
ADDP4
ADDRLP4 1124
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 1726
;1726:	bs->inventory[INVENTORY_ROCKETS] = bs->cur_ps.ammo[WP_ROCKET_LAUNCHER];
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 5044
ADDP4
ADDRLP4 1128
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ASGNI4
line 1727
;1727:	bs->inventory[INVENTORY_SLUGS] = bs->cur_ps.ammo[WP_RAILGUN];
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 5048
ADDP4
ADDRLP4 1132
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 1728
;1728:	bs->inventory[INVENTORY_BFGAMMO] = bs->cur_ps.ammo[WP_BFG];
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 5052
ADDP4
ADDRLP4 1136
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 1735
;1729:#ifdef MISSIONPACK
;1730:	bs->inventory[INVENTORY_NAILS] = bs->cur_ps.ammo[WP_NAILGUN];
;1731:	bs->inventory[INVENTORY_MINES] = bs->cur_ps.ammo[WP_PROX_LAUNCHER];
;1732:	bs->inventory[INVENTORY_BELT] = bs->cur_ps.ammo[WP_CHAINGUN];
;1733:#endif
;1734:	//powerups
;1735:	bs->inventory[INVENTORY_HEALTH] = bs->cur_ps.stats[STAT_HEALTH];
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 5068
ADDP4
ADDRLP4 1140
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 1736
;1736:	bs->inventory[INVENTORY_TELEPORTER] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_TELEPORTER;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 26
NEI4 $421
ADDRLP4 1144
CNSTI4 1
ASGNI4
ADDRGP4 $422
JUMPV
LABELV $421
ADDRLP4 1144
CNSTI4 0
ASGNI4
LABELV $422
ADDRLP4 1148
INDIRP4
CNSTI4 5072
ADDP4
ADDRLP4 1144
INDIRI4
ASGNI4
line 1737
;1737:	bs->inventory[INVENTORY_MEDKIT] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_MEDKIT;
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 27
NEI4 $424
ADDRLP4 1152
CNSTI4 1
ASGNI4
ADDRGP4 $425
JUMPV
LABELV $424
ADDRLP4 1152
CNSTI4 0
ASGNI4
LABELV $425
ADDRLP4 1156
INDIRP4
CNSTI4 5076
ADDP4
ADDRLP4 1152
INDIRI4
ASGNI4
line 1743
;1738:#ifdef MISSIONPACK
;1739:	bs->inventory[INVENTORY_KAMIKAZE] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_KAMIKAZE;
;1740:	bs->inventory[INVENTORY_PORTAL] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_PORTAL;
;1741:	bs->inventory[INVENTORY_INVULNERABILITY] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_INVULNERABILITY;
;1742:#endif
;1743:	bs->inventory[INVENTORY_QUAD] = bs->cur_ps.powerups[PW_QUAD] != 0;
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $427
ADDRLP4 1160
CNSTI4 1
ASGNI4
ADDRGP4 $428
JUMPV
LABELV $427
ADDRLP4 1160
CNSTI4 0
ASGNI4
LABELV $428
ADDRLP4 1164
INDIRP4
CNSTI4 5092
ADDP4
ADDRLP4 1160
INDIRI4
ASGNI4
line 1744
;1744:	bs->inventory[INVENTORY_ENVIRONMENTSUIT] = bs->cur_ps.powerups[PW_BATTLESUIT] != 0;
ADDRLP4 1172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1172
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $430
ADDRLP4 1168
CNSTI4 1
ASGNI4
ADDRGP4 $431
JUMPV
LABELV $430
ADDRLP4 1168
CNSTI4 0
ASGNI4
LABELV $431
ADDRLP4 1172
INDIRP4
CNSTI4 5096
ADDP4
ADDRLP4 1168
INDIRI4
ASGNI4
line 1745
;1745:	bs->inventory[INVENTORY_HASTE] = bs->cur_ps.powerups[PW_HASTE] != 0;
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $433
ADDRLP4 1176
CNSTI4 1
ASGNI4
ADDRGP4 $434
JUMPV
LABELV $433
ADDRLP4 1176
CNSTI4 0
ASGNI4
LABELV $434
ADDRLP4 1180
INDIRP4
CNSTI4 5100
ADDP4
ADDRLP4 1176
INDIRI4
ASGNI4
line 1746
;1746:	bs->inventory[INVENTORY_INVISIBILITY] = bs->cur_ps.powerups[PW_INVIS] != 0;
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1188
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $436
ADDRLP4 1184
CNSTI4 1
ASGNI4
ADDRGP4 $437
JUMPV
LABELV $436
ADDRLP4 1184
CNSTI4 0
ASGNI4
LABELV $437
ADDRLP4 1188
INDIRP4
CNSTI4 5104
ADDP4
ADDRLP4 1184
INDIRI4
ASGNI4
line 1747
;1747:	bs->inventory[INVENTORY_REGEN] = bs->cur_ps.powerups[PW_REGEN] != 0;
ADDRLP4 1196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $439
ADDRLP4 1192
CNSTI4 1
ASGNI4
ADDRGP4 $440
JUMPV
LABELV $439
ADDRLP4 1192
CNSTI4 0
ASGNI4
LABELV $440
ADDRLP4 1196
INDIRP4
CNSTI4 5108
ADDP4
ADDRLP4 1192
INDIRI4
ASGNI4
line 1748
;1748:	bs->inventory[INVENTORY_FLIGHT] = bs->cur_ps.powerups[PW_FLIGHT] != 0;
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CNSTI4 352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $442
ADDRLP4 1200
CNSTI4 1
ASGNI4
ADDRGP4 $443
JUMPV
LABELV $442
ADDRLP4 1200
CNSTI4 0
ASGNI4
LABELV $443
ADDRLP4 1204
INDIRP4
CNSTI4 5112
ADDP4
ADDRLP4 1200
INDIRI4
ASGNI4
line 1755
;1749:#ifdef MISSIONPACK
;1750:	bs->inventory[INVENTORY_SCOUT] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_SCOUT;
;1751:	bs->inventory[INVENTORY_GUARD] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_GUARD;
;1752:	bs->inventory[INVENTORY_DOUBLER] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_DOUBLER;
;1753:	bs->inventory[INVENTORY_AMMOREGEN] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_AMMOREGEN;
;1754:#endif
;1755:	bs->inventory[INVENTORY_REDFLAG] = bs->cur_ps.powerups[PW_REDFLAG] != 0;
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 356
ADDP4
INDIRI4
CNSTI4 0
EQI4 $445
ADDRLP4 1208
CNSTI4 1
ASGNI4
ADDRGP4 $446
JUMPV
LABELV $445
ADDRLP4 1208
CNSTI4 0
ASGNI4
LABELV $446
ADDRLP4 1212
INDIRP4
CNSTI4 5132
ADDP4
ADDRLP4 1208
INDIRI4
ASGNI4
line 1756
;1756:	bs->inventory[INVENTORY_BLUEFLAG] = bs->cur_ps.powerups[PW_BLUEFLAG] != 0;
ADDRLP4 1220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1220
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $448
ADDRLP4 1216
CNSTI4 1
ASGNI4
ADDRGP4 $449
JUMPV
LABELV $448
ADDRLP4 1216
CNSTI4 0
ASGNI4
LABELV $449
ADDRLP4 1220
INDIRP4
CNSTI4 5136
ADDP4
ADDRLP4 1216
INDIRI4
ASGNI4
line 1768
;1757:#ifdef MISSIONPACK
;1758:	bs->inventory[INVENTORY_NEUTRALFLAG] = bs->cur_ps.powerups[PW_NEUTRALFLAG] != 0;
;1759:	if (BotTeam(bs) == TEAM_RED) {
;1760:		bs->inventory[INVENTORY_REDCUBE] = bs->cur_ps.generic1;
;1761:		bs->inventory[INVENTORY_BLUECUBE] = 0;
;1762:	}
;1763:	else {
;1764:		bs->inventory[INVENTORY_REDCUBE] = 0;
;1765:		bs->inventory[INVENTORY_BLUECUBE] = bs->cur_ps.generic1;
;1766:	}
;1767:#endif
;1768:	BotCheckItemPickup(bs, oldinventory);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckItemPickup
CALLV
pop
line 1769
;1769:}
LABELV $389
endproc BotUpdateInventory 1224 12
export BotUpdateBattleInventory
proc BotUpdateBattleInventory 160 8
line 1776
;1770:
;1771:/*
;1772:==================
;1773:BotUpdateBattleInventory
;1774:==================
;1775:*/
;1776:void BotUpdateBattleInventory(bot_state_t *bs, int enemy) {
line 1780
;1777:	vec3_t dir;
;1778:	aas_entityinfo_t entinfo;
;1779:
;1780:	BotEntityInfo(enemy, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1781
;1781:	VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12+24
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+24+4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1782
;1782:	bs->inventory[ENEMY_HEIGHT] = (int) dir[2];
ADDRFP4 0
INDIRP4
CNSTI4 5756
ADDP4
ADDRLP4 0+8
INDIRF4
CVFI4 4
ASGNI4
line 1783
;1783:	dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1784
;1784:	bs->inventory[ENEMY_HORIZONTAL_DIST] = (int) VectorLength(dir);
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 5752
ADDP4
ADDRLP4 156
INDIRF4
CVFI4 4
ASGNI4
line 1786
;1785:	//FIXME: add num visible enemies and num visible team mates to the inventory
;1786:}
LABELV $450
endproc BotUpdateBattleInventory 160 8
export BotBattleUseItems
proc BotBattleUseItems 4 4
line 2013
;1787:
;1788:#ifdef MISSIONPACK
;1789:/*
;1790:==================
;1791:BotUseKamikaze
;1792:==================
;1793:*/
;1794:#define KAMIKAZE_DIST		1024
;1795:
;1796:void BotUseKamikaze(bot_state_t *bs) {
;1797:	int c, teammates, enemies;
;1798:	aas_entityinfo_t entinfo;
;1799:	vec3_t dir, target;
;1800:	bot_goal_t *goal;
;1801:	bsp_trace_t trace;
;1802:
;1803:	//if the bot has no kamikaze
;1804:	if (bs->inventory[INVENTORY_KAMIKAZE] <= 0)
;1805:		return;
;1806:	if (bs->kamikaze_time > FloatTime())
;1807:		return;
;1808:	bs->kamikaze_time = FloatTime() + 0.2;
;1809:	if (gametype == GT_CTF) {
;1810:		//never use kamikaze if the team flag carrier is visible
;1811:		if (BotCTFCarryingFlag(bs))
;1812:			return;
;1813:		c = BotTeamFlagCarrierVisible(bs);
;1814:		if (c >= 0) {
;1815:			BotEntityInfo(c, &entinfo);
;1816:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1817:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1818:				return;
;1819:		}
;1820:		c = BotEnemyFlagCarrierVisible(bs);
;1821:		if (c >= 0) {
;1822:			BotEntityInfo(c, &entinfo);
;1823:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1824:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1825:				trap_EA_Use(bs->client);
;1826:				return;
;1827:			}
;1828:		}
;1829:	}
;1830:	else if (gametype == GT_1FCTF) {
;1831:		//never use kamikaze if the team flag carrier is visible
;1832:		if (Bot1FCTFCarryingFlag(bs))
;1833:			return;
;1834:		c = BotTeamFlagCarrierVisible(bs);
;1835:		if (c >= 0) {
;1836:			BotEntityInfo(c, &entinfo);
;1837:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1838:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1839:				return;
;1840:		}
;1841:		c = BotEnemyFlagCarrierVisible(bs);
;1842:		if (c >= 0) {
;1843:			BotEntityInfo(c, &entinfo);
;1844:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1845:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1846:				trap_EA_Use(bs->client);
;1847:				return;
;1848:			}
;1849:		}
;1850:	}
;1851:	else if (gametype == GT_OBELISK) {
;1852:		switch(BotTeam(bs)) {
;1853:			case TEAM_RED: goal = &blueobelisk; break;
;1854:			default: goal = &redobelisk; break;
;1855:		}
;1856:		//if the obelisk is visible
;1857:		VectorCopy(goal->origin, target);
;1858:		target[2] += 1;
;1859:		VectorSubtract(bs->origin, target, dir);
;1860:		if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST * 0.9)) {
;1861:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1862:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1863:				trap_EA_Use(bs->client);
;1864:				return;
;1865:			}
;1866:		}
;1867:	}
;1868:	else if (gametype == GT_HARVESTER) {
;1869:		//
;1870:		if (BotHarvesterCarryingCubes(bs))
;1871:			return;
;1872:		//never use kamikaze if a team mate carrying cubes is visible
;1873:		c = BotTeamCubeCarrierVisible(bs);
;1874:		if (c >= 0) {
;1875:			BotEntityInfo(c, &entinfo);
;1876:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1877:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1878:				return;
;1879:		}
;1880:		c = BotEnemyCubeCarrierVisible(bs);
;1881:		if (c >= 0) {
;1882:			BotEntityInfo(c, &entinfo);
;1883:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1884:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1885:				trap_EA_Use(bs->client);
;1886:				return;
;1887:			}
;1888:		}
;1889:	}
;1890:	//
;1891:	BotVisibleTeamMatesAndEnemies(bs, &teammates, &enemies, KAMIKAZE_DIST);
;1892:	//
;1893:	if (enemies > 2 && enemies > teammates+1) {
;1894:		trap_EA_Use(bs->client);
;1895:		return;
;1896:	}
;1897:}
;1898:
;1899:/*
;1900:==================
;1901:BotUseInvulnerability
;1902:==================
;1903:*/
;1904:void BotUseInvulnerability(bot_state_t *bs) {
;1905:	int c;
;1906:	vec3_t dir, target;
;1907:	bot_goal_t *goal;
;1908:	bsp_trace_t trace;
;1909:
;1910:	//if the bot has no invulnerability
;1911:	if (bs->inventory[INVENTORY_INVULNERABILITY] <= 0)
;1912:		return;
;1913:	if (bs->invulnerability_time > FloatTime())
;1914:		return;
;1915:	bs->invulnerability_time = FloatTime() + 0.2;
;1916:	if (gametype == GT_CTF) {
;1917:		//never use kamikaze if the team flag carrier is visible
;1918:		if (BotCTFCarryingFlag(bs))
;1919:			return;
;1920:		c = BotEnemyFlagCarrierVisible(bs);
;1921:		if (c >= 0)
;1922:			return;
;1923:		//if near enemy flag and the flag is visible
;1924:		switch(BotTeam(bs)) {
;1925:			case TEAM_RED: goal = &ctf_blueflag; break;
;1926:			default: goal = &ctf_redflag; break;
;1927:		}
;1928:		//if the obelisk is visible
;1929:		VectorCopy(goal->origin, target);
;1930:		target[2] += 1;
;1931:		VectorSubtract(bs->origin, target, dir);
;1932:		if (VectorLengthSquared(dir) < Square(200)) {
;1933:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1934:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1935:				trap_EA_Use(bs->client);
;1936:				return;
;1937:			}
;1938:		}
;1939:	}
;1940:	else if (gametype == GT_1FCTF) {
;1941:		//never use kamikaze if the team flag carrier is visible
;1942:		if (Bot1FCTFCarryingFlag(bs))
;1943:			return;
;1944:		c = BotEnemyFlagCarrierVisible(bs);
;1945:		if (c >= 0)
;1946:			return;
;1947:		//if near enemy flag and the flag is visible
;1948:		switch(BotTeam(bs)) {
;1949:			case TEAM_RED: goal = &ctf_blueflag; break;
;1950:			default: goal = &ctf_redflag; break;
;1951:		}
;1952:		//if the obelisk is visible
;1953:		VectorCopy(goal->origin, target);
;1954:		target[2] += 1;
;1955:		VectorSubtract(bs->origin, target, dir);
;1956:		if (VectorLengthSquared(dir) < Square(200)) {
;1957:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1958:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1959:				trap_EA_Use(bs->client);
;1960:				return;
;1961:			}
;1962:		}
;1963:	}
;1964:	else if (gametype == GT_OBELISK) {
;1965:		switch(BotTeam(bs)) {
;1966:			case TEAM_RED: goal = &blueobelisk; break;
;1967:			default: goal = &redobelisk; break;
;1968:		}
;1969:		//if the obelisk is visible
;1970:		VectorCopy(goal->origin, target);
;1971:		target[2] += 1;
;1972:		VectorSubtract(bs->origin, target, dir);
;1973:		if (VectorLengthSquared(dir) < Square(300)) {
;1974:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1975:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1976:				trap_EA_Use(bs->client);
;1977:				return;
;1978:			}
;1979:		}
;1980:	}
;1981:	else if (gametype == GT_HARVESTER) {
;1982:		//
;1983:		if (BotHarvesterCarryingCubes(bs))
;1984:			return;
;1985:		c = BotEnemyCubeCarrierVisible(bs);
;1986:		if (c >= 0)
;1987:			return;
;1988:		//if near enemy base and enemy base is visible
;1989:		switch(BotTeam(bs)) {
;1990:			case TEAM_RED: goal = &blueobelisk; break;
;1991:			default: goal = &redobelisk; break;
;1992:		}
;1993:		//if the obelisk is visible
;1994:		VectorCopy(goal->origin, target);
;1995:		target[2] += 1;
;1996:		VectorSubtract(bs->origin, target, dir);
;1997:		if (VectorLengthSquared(dir) < Square(200)) {
;1998:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1999:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;2000:				trap_EA_Use(bs->client);
;2001:				return;
;2002:			}
;2003:		}
;2004:	}
;2005:}
;2006:#endif
;2007:
;2008:/*
;2009:==================
;2010:BotBattleUseItems
;2011:==================
;2012:*/
;2013:void BotBattleUseItems(bot_state_t *bs) {
line 2014
;2014:	if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 40
GEI4 $461
line 2015
;2015:		if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $463
line 2016
;2016:			if (!BotCTFCarryingFlag(bs)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $465
line 2021
;2017:#ifdef MISSIONPACK
;2018:				&& !Bot1FCTFCarryingFlag(bs)
;2019:				&& !BotHarvesterCarryingCubes(bs)
;2020:#endif
;2021:				) {
line 2022
;2022:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2023
;2023:			}
LABELV $465
line 2024
;2024:		}
LABELV $463
line 2025
;2025:	}
LABELV $461
line 2026
;2026:	if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $467
line 2027
;2027:		if (bs->inventory[INVENTORY_MEDKIT] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5076
ADDP4
INDIRI4
CNSTI4 0
LEI4 $469
line 2028
;2028:			trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2029
;2029:		}
LABELV $469
line 2030
;2030:	}
LABELV $467
line 2035
;2031:#ifdef MISSIONPACK
;2032:	BotUseKamikaze(bs);
;2033:	BotUseInvulnerability(bs);
;2034:#endif
;2035:}
LABELV $460
endproc BotBattleUseItems 4 4
export BotSetTeleportTime
proc BotSetTeleportTime 8 0
line 2042
;2036:
;2037:/*
;2038:==================
;2039:BotSetTeleportTime
;2040:==================
;2041:*/
;2042:void BotSetTeleportTime(bot_state_t *bs) {
line 2043
;2043:	if ((bs->cur_ps.eFlags ^ bs->last_eFlags) & EF_TELEPORT_BIT) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $472
line 2044
;2044:		bs->teleport_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2045
;2045:	}
LABELV $472
line 2046
;2046:	bs->last_eFlags = bs->cur_ps.eFlags;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ASGNI4
line 2047
;2047:}
LABELV $471
endproc BotSetTeleportTime 8 0
export BotIsDead
proc BotIsDead 4 0
line 2054
;2048:
;2049:/*
;2050:==================
;2051:BotIsDead
;2052:==================
;2053:*/
;2054:qboolean BotIsDead(bot_state_t *bs) {
line 2055
;2055:	return (bs->cur_ps.pm_type == PM_DEAD);
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 3
NEI4 $476
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $477
JUMPV
LABELV $476
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $477
ADDRLP4 0
INDIRI4
RETI4
LABELV $474
endproc BotIsDead 4 0
export BotIsObserver
proc BotIsObserver 1032 12
line 2063
;2056:}
;2057:
;2058:/*
;2059:==================
;2060:BotIsObserver
;2061:==================
;2062:*/
;2063:qboolean BotIsObserver(bot_state_t *bs) {
line 2065
;2064:	char buf[MAX_INFO_STRING];
;2065:	if (bs->cur_ps.pm_type == PM_SPECTATOR) return qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
NEI4 $479
CNSTI4 1
RETI4
ADDRGP4 $478
JUMPV
LABELV $479
line 2066
;2066:	trap_GetConfigstring(CS_PLAYERS+bs->client, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 2067
;2067:	if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR) return qtrue;
ADDRLP4 0
ARGP4
ADDRGP4 $67
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 3
NEI4 $481
CNSTI4 1
RETI4
ADDRGP4 $478
JUMPV
LABELV $481
line 2068
;2068:	return qfalse;
CNSTI4 0
RETI4
LABELV $478
endproc BotIsObserver 1032 12
export BotIntermission
proc BotIntermission 8 0
line 2076
;2069:}
;2070:
;2071:/*
;2072:==================
;2073:BotIntermission
;2074:==================
;2075:*/
;2076:qboolean BotIntermission(bot_state_t *bs) {
line 2078
;2077:	//NOTE: we shouldn't be looking at the game code...
;2078:	if (level.intermissiontime) return qtrue;
ADDRGP4 level+9128
INDIRI4
CNSTI4 0
EQI4 $484
CNSTI4 1
RETI4
ADDRGP4 $483
JUMPV
LABELV $484
line 2079
;2079:	return (bs->cur_ps.pm_type == PM_FREEZE || bs->cur_ps.pm_type == PM_INTERMISSION);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
EQI4 $490
ADDRLP4 4
INDIRI4
CNSTI4 5
NEI4 $488
LABELV $490
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $489
JUMPV
LABELV $488
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $489
ADDRLP4 0
INDIRI4
RETI4
LABELV $483
endproc BotIntermission 8 0
export BotInLavaOrSlime
proc BotInLavaOrSlime 16 4
line 2087
;2080:}
;2081:
;2082:/*
;2083:==================
;2084:BotInLavaOrSlime
;2085:==================
;2086:*/
;2087:qboolean BotInLavaOrSlime(bot_state_t *bs) {
line 2090
;2088:	vec3_t feet;
;2089:
;2090:	VectorCopy(bs->origin, feet);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 2091
;2091:	feet[2] -= 23;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1102577664
SUBF4
ASGNF4
line 2092
;2092:	return (trap_AAS_PointContents(feet) & (CONTENTS_LAVA|CONTENTS_SLIME));
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 24
BANDI4
RETI4
LABELV $491
endproc BotInLavaOrSlime 16 4
lit
align 4
LABELV $494
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $495
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCreateWayPoint
code
proc BotCreateWayPoint 32 12
line 2100
;2093:}
;2094:
;2095:/*
;2096:==================
;2097:BotCreateWayPoint
;2098:==================
;2099:*/
;2100:bot_waypoint_t *BotCreateWayPoint(char *name, vec3_t origin, int areanum) {
line 2102
;2101:	bot_waypoint_t *wp;
;2102:	vec3_t waypointmins = {-8, -8, -8}, waypointmaxs = {8, 8, 8};
ADDRLP4 4
ADDRGP4 $494
INDIRB
ASGNB 12
ADDRLP4 16
ADDRGP4 $495
INDIRB
ASGNB 12
line 2104
;2103:
;2104:	wp = botai_freewaypoints;
ADDRLP4 0
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2105
;2105:	if ( !wp ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $496
line 2106
;2106:		BotAI_Print( PRT_WARNING, "BotCreateWayPoint: Out of waypoints\n" );
CNSTI4 2
ARGI4
ADDRGP4 $498
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 2107
;2107:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $493
JUMPV
LABELV $496
line 2109
;2108:	}
;2109:	botai_freewaypoints = botai_freewaypoints->next;
ADDRLP4 28
ADDRGP4 botai_freewaypoints
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 2111
;2110:
;2111:	Q_strncpyz( wp->name, name, sizeof(wp->name) );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2112
;2112:	VectorCopy(origin, wp->goal.origin);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2113
;2113:	VectorCopy(waypointmins, wp->goal.mins);
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2114
;2114:	VectorCopy(waypointmaxs, wp->goal.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2115
;2115:	wp->goal.areanum = areanum;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 2116
;2116:	wp->next = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTP4 0
ASGNP4
line 2117
;2117:	wp->prev = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTP4 0
ASGNP4
line 2118
;2118:	return wp;
ADDRLP4 0
INDIRP4
RETP4
LABELV $493
endproc BotCreateWayPoint 32 12
export BotFindWayPoint
proc BotFindWayPoint 8 8
line 2126
;2119:}
;2120:
;2121:/*
;2122:==================
;2123:BotFindWayPoint
;2124:==================
;2125:*/
;2126:bot_waypoint_t *BotFindWayPoint(bot_waypoint_t *waypoints, char *name) {
line 2129
;2127:	bot_waypoint_t *wp;
;2128:
;2129:	for (wp = waypoints; wp; wp = wp->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $503
JUMPV
LABELV $500
line 2130
;2130:		if (!Q_stricmp(wp->name, name)) return wp;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $504
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $499
JUMPV
LABELV $504
line 2131
;2131:	}
LABELV $501
line 2129
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $503
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $500
line 2132
;2132:	return NULL;
CNSTP4 0
RETP4
LABELV $499
endproc BotFindWayPoint 8 8
export BotFreeWaypoints
proc BotFreeWaypoints 4 0
line 2140
;2133:}
;2134:
;2135:/*
;2136:==================
;2137:BotFreeWaypoints
;2138:==================
;2139:*/
;2140:void BotFreeWaypoints(bot_waypoint_t *wp) {
line 2143
;2141:	bot_waypoint_t *nextwp;
;2142:
;2143:	for (; wp; wp = nextwp) {
ADDRGP4 $510
JUMPV
LABELV $507
line 2144
;2144:		nextwp = wp->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 2145
;2145:		wp->next = botai_freewaypoints;
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2146
;2146:		botai_freewaypoints = wp;
ADDRGP4 botai_freewaypoints
ADDRFP4 0
INDIRP4
ASGNP4
line 2147
;2147:	}
LABELV $508
line 2143
ADDRFP4 0
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $510
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $507
line 2148
;2148:}
LABELV $506
endproc BotFreeWaypoints 4 0
export BotInitWaypoints
proc BotInitWaypoints 4 0
line 2155
;2149:
;2150:/*
;2151:==================
;2152:BotInitWaypoints
;2153:==================
;2154:*/
;2155:void BotInitWaypoints(void) {
line 2158
;2156:	int i;
;2157:
;2158:	botai_freewaypoints = NULL;
ADDRGP4 botai_freewaypoints
CNSTP4 0
ASGNP4
line 2159
;2159:	for (i = 0; i < MAX_WAYPOINTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $512
line 2160
;2160:		botai_waypoints[i].next = botai_freewaypoints;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botai_waypoints+92
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2161
;2161:		botai_freewaypoints = &botai_waypoints[i];
ADDRGP4 botai_freewaypoints
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botai_waypoints
ADDP4
ASGNP4
line 2162
;2162:	}
LABELV $513
line 2159
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $512
line 2163
;2163:}
LABELV $511
endproc BotInitWaypoints 4 0
export TeamPlayIsOn
proc TeamPlayIsOn 4 0
line 2170
;2164:
;2165:/*
;2166:==================
;2167:TeamPlayIsOn
;2168:==================
;2169:*/
;2170:int TeamPlayIsOn(void) {
line 2171
;2171:	return ( gametype >= GT_TEAM );
ADDRGP4 gametype
INDIRI4
CNSTI4 3
LTI4 $519
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $520
JUMPV
LABELV $519
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $520
ADDRLP4 0
INDIRI4
RETI4
LABELV $517
endproc TeamPlayIsOn 4 0
export BotAggression
proc BotAggression 28 0
line 2179
;2172:}
;2173:
;2174:/*
;2175:==================
;2176:BotAggression
;2177:==================
;2178:*/
;2179:float BotAggression(bot_state_t *bs) {
line 2181
;2180:	//if the bot has quad
;2181:	if (bs->inventory[INVENTORY_QUAD]) {
ADDRFP4 0
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $522
line 2183
;2182:		//if the bot is not holding the gauntlet or the enemy is really nearby
;2183:		if (bs->weaponnum != WP_GAUNTLET ||
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $526
ADDRLP4 0
INDIRP4
CNSTI4 5752
ADDP4
INDIRI4
CNSTI4 80
GEI4 $524
LABELV $526
line 2184
;2184:			bs->inventory[ENEMY_HORIZONTAL_DIST] < 80) {
line 2185
;2185:			return 70;
CNSTF4 1116471296
RETF4
ADDRGP4 $521
JUMPV
LABELV $524
line 2187
;2186:		}
;2187:	}
LABELV $522
line 2189
;2188:	//if the enemy is located way higher than the bot
;2189:	if (bs->inventory[ENEMY_HEIGHT] > 200) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 5756
ADDP4
INDIRI4
CNSTI4 200
LEI4 $527
CNSTF4 0
RETF4
ADDRGP4 $521
JUMPV
LABELV $527
line 2191
;2190:	//if the bot is very low on health
;2191:	if (bs->inventory[INVENTORY_HEALTH] < 60) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $529
CNSTF4 0
RETF4
ADDRGP4 $521
JUMPV
LABELV $529
line 2193
;2192:	//if the bot is low on health
;2193:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $531
line 2195
;2194:		//if the bot has insufficient armor
;2195:		if (bs->inventory[INVENTORY_ARMOR] < 40) return 0;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $533
CNSTF4 0
RETF4
ADDRGP4 $521
JUMPV
LABELV $533
line 2196
;2196:	}
LABELV $531
line 2198
;2197:	//if the bot can use the bfg
;2198:	if (bs->inventory[INVENTORY_BFG10K] > 0 &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $535
ADDRLP4 0
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $535
line 2199
;2199:			bs->inventory[INVENTORY_BFGAMMO] > 7) return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $521
JUMPV
LABELV $535
line 2201
;2200:	//if the bot can use the railgun
;2201:	if (bs->inventory[INVENTORY_RAILGUN] > 0 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $537
ADDRLP4 4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $537
line 2202
;2202:			bs->inventory[INVENTORY_SLUGS] > 5) return 95;
CNSTF4 1119748096
RETF4
ADDRGP4 $521
JUMPV
LABELV $537
line 2204
;2203:	//if the bot can use the lightning gun
;2204:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4988
ADDP4
INDIRI4
CNSTI4 0
LEI4 $539
ADDRLP4 8
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $539
line 2205
;2205:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $521
JUMPV
LABELV $539
line 2207
;2206:	//if the bot can use the rocketlauncher
;2207:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $541
ADDRLP4 12
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $541
line 2208
;2208:			bs->inventory[INVENTORY_ROCKETS] > 5) return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $521
JUMPV
LABELV $541
line 2210
;2209:	//if the bot can use the plasmagun
;2210:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $543
ADDRLP4 16
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 40
LEI4 $543
line 2211
;2211:			bs->inventory[INVENTORY_CELLS] > 40) return 85;
CNSTF4 1118437376
RETF4
ADDRGP4 $521
JUMPV
LABELV $543
line 2213
;2212:	//if the bot can use the grenade launcher
;2213:	if (bs->inventory[INVENTORY_GRENADELAUNCHER] > 0 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4980
ADDP4
INDIRI4
CNSTI4 0
LEI4 $545
ADDRLP4 20
INDIRP4
CNSTI4 5032
ADDP4
INDIRI4
CNSTI4 10
LEI4 $545
line 2214
;2214:			bs->inventory[INVENTORY_GRENADES] > 10) return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $521
JUMPV
LABELV $545
line 2216
;2215:	//if the bot can use the shotgun
;2216:	if (bs->inventory[INVENTORY_SHOTGUN] > 0 &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 4972
ADDP4
INDIRI4
CNSTI4 0
LEI4 $547
ADDRLP4 24
INDIRP4
CNSTI4 5024
ADDP4
INDIRI4
CNSTI4 10
LEI4 $547
line 2217
;2217:			bs->inventory[INVENTORY_SHELLS] > 10) return 50;
CNSTF4 1112014848
RETF4
ADDRGP4 $521
JUMPV
LABELV $547
line 2219
;2218:	//otherwise the bot is not feeling too good
;2219:	return 0;
CNSTF4 0
RETF4
LABELV $521
endproc BotAggression 28 0
export BotFeelingBad
proc BotFeelingBad 0 0
line 2227
;2220:}
;2221:
;2222:/*
;2223:==================
;2224:BotFeelingBad
;2225:==================
;2226:*/
;2227:float BotFeelingBad(bot_state_t *bs) {
line 2228
;2228:	if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $550
line 2229
;2229:		return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $549
JUMPV
LABELV $550
line 2231
;2230:	}
;2231:	if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 40
GEI4 $552
line 2232
;2232:		return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $549
JUMPV
LABELV $552
line 2234
;2233:	}
;2234:	if (bs->weaponnum == WP_MACHINEGUN) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $554
line 2235
;2235:		return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $549
JUMPV
LABELV $554
line 2237
;2236:	}
;2237:	if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $556
line 2238
;2238:		return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $549
JUMPV
LABELV $556
line 2240
;2239:	}
;2240:	return 0;
CNSTF4 0
RETF4
LABELV $549
endproc BotFeelingBad 0 0
export BotWantsToRetreat
proc BotWantsToRetreat 144 8
line 2248
;2241:}
;2242:
;2243:/*
;2244:==================
;2245:BotWantsToRetreat
;2246:==================
;2247:*/
;2248:int BotWantsToRetreat(bot_state_t *bs) {
line 2251
;2249:	aas_entityinfo_t entinfo;
;2250:
;2251:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $559
line 2253
;2252:		//always retreat when carrying a CTF flag
;2253:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $561
line 2254
;2254:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $558
JUMPV
LABELV $561
line 2255
;2255:	}
LABELV $559
line 2281
;2256:#ifdef MISSIONPACK
;2257:	else if (gametype == GT_1FCTF) {
;2258:		//if carrying the flag then always retreat
;2259:		if (Bot1FCTFCarryingFlag(bs))
;2260:			return qtrue;
;2261:	}
;2262:	else if (gametype == GT_OBELISK) {
;2263:		//the bots should be dedicated to attacking the enemy obelisk
;2264:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
;2265:			if (bs->enemy != redobelisk.entitynum ||
;2266:						bs->enemy != blueobelisk.entitynum) {
;2267:				return qtrue;
;2268:			}
;2269:		}
;2270:		if (BotFeelingBad(bs) > 50) {
;2271:			return qtrue;
;2272:		}
;2273:		return qfalse;
;2274:	}
;2275:	else if (gametype == GT_HARVESTER) {
;2276:		//if carrying cubes then always retreat
;2277:		if (BotHarvesterCarryingCubes(bs)) return qtrue;
;2278:	}
;2279:#endif
;2280:	//
;2281:	if (bs->enemy >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
LTI4 $563
line 2283
;2282:		//if the enemy is carrying a flag
;2283:		BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2284
;2284:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $565
line 2285
;2285:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $558
JUMPV
LABELV $565
line 2286
;2286:	}
LABELV $563
line 2288
;2287:	//if the bot is getting the flag
;2288:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $567
line 2289
;2289:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $558
JUMPV
LABELV $567
line 2291
;2290:	//
;2291:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
GEF4 $569
line 2292
;2292:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $558
JUMPV
LABELV $569
line 2293
;2293:	return qfalse;
CNSTI4 0
RETI4
LABELV $558
endproc BotWantsToRetreat 144 8
export BotWantsToChase
proc BotWantsToChase 148 8
line 2301
;2294:}
;2295:
;2296:/*
;2297:==================
;2298:BotWantsToChase
;2299:==================
;2300:*/
;2301:int BotWantsToChase(bot_state_t *bs) {
line 2304
;2302:	aas_entityinfo_t entinfo;
;2303:
;2304:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $572
line 2306
;2305:		//never chase when carrying a CTF flag
;2306:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $574
line 2307
;2307:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $571
JUMPV
LABELV $574
line 2309
;2308:		//always chase if the enemy is carrying a flag
;2309:		BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2310
;2310:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $576
line 2311
;2311:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $571
JUMPV
LABELV $576
line 2312
;2312:	}
LABELV $572
line 2339
;2313:#ifdef MISSIONPACK
;2314:	else if (gametype == GT_1FCTF) {
;2315:		//never chase if carrying the flag
;2316:		if (Bot1FCTFCarryingFlag(bs))
;2317:			return qfalse;
;2318:		//always chase if the enemy is carrying a flag
;2319:		BotEntityInfo(bs->enemy, &entinfo);
;2320:		if (EntityCarriesFlag(&entinfo))
;2321:			return qtrue;
;2322:	}
;2323:	else if (gametype == GT_OBELISK) {
;2324:		//the bots should be dedicated to attacking the enemy obelisk
;2325:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
;2326:			if (bs->enemy != redobelisk.entitynum ||
;2327:						bs->enemy != blueobelisk.entitynum) {
;2328:				return qfalse;
;2329:			}
;2330:		}
;2331:	}
;2332:	else if (gametype == GT_HARVESTER) {
;2333:		//never chase if carrying cubes
;2334:		if (BotHarvesterCarryingCubes(bs))
;2335:			return qfalse;
;2336:	}
;2337:#endif
;2338:	//if the bot is getting the flag
;2339:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $578
line 2340
;2340:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $571
JUMPV
LABELV $578
line 2342
;2341:	//
;2342:	if (BotAggression(bs) > 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
LEF4 $580
line 2343
;2343:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $571
JUMPV
LABELV $580
line 2344
;2344:	return qfalse;
CNSTI4 0
RETI4
LABELV $571
endproc BotWantsToChase 148 8
export BotWantsToHelp
proc BotWantsToHelp 0 0
line 2352
;2345:}
;2346:
;2347:/*
;2348:==================
;2349:BotWantsToHelp
;2350:==================
;2351:*/
;2352:int BotWantsToHelp(bot_state_t *bs) {
line 2353
;2353:	return qtrue;
CNSTI4 1
RETI4
LABELV $582
endproc BotWantsToHelp 0 0
export BotCanAndWantsToRocketJump
proc BotCanAndWantsToRocketJump 8 16
line 2361
;2354:}
;2355:
;2356:/*
;2357:==================
;2358:BotCanAndWantsToRocketJump
;2359:==================
;2360:*/
;2361:int BotCanAndWantsToRocketJump(bot_state_t *bs) {
line 2365
;2362:	float rocketjumper;
;2363:
;2364:	//if rocket jumping is disabled
;2365:	if (!bot_rocketjump.integer) return qfalse;
ADDRGP4 bot_rocketjump+12
INDIRI4
CNSTI4 0
NEI4 $584
CNSTI4 0
RETI4
ADDRGP4 $583
JUMPV
LABELV $584
line 2367
;2366:	//if no rocket launcher
;2367:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
GTI4 $587
CNSTI4 0
RETI4
ADDRGP4 $583
JUMPV
LABELV $587
line 2369
;2368:	//if low on rockets
;2369:	if (bs->inventory[INVENTORY_ROCKETS] < 3) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 3
GEI4 $589
CNSTI4 0
RETI4
ADDRGP4 $583
JUMPV
LABELV $589
line 2371
;2370:	//never rocket jump with the Quad
;2371:	if (bs->inventory[INVENTORY_QUAD]) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $591
CNSTI4 0
RETI4
ADDRGP4 $583
JUMPV
LABELV $591
line 2373
;2372:	//if low on health
;2373:	if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $593
CNSTI4 0
RETI4
ADDRGP4 $583
JUMPV
LABELV $593
line 2375
;2374:	//if not full health
;2375:	if (bs->inventory[INVENTORY_HEALTH] < 90) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 90
GEI4 $595
line 2377
;2376:		//if the bot has insufficient armor
;2377:		if (bs->inventory[INVENTORY_ARMOR] < 40) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $597
CNSTI4 0
RETI4
ADDRGP4 $583
JUMPV
LABELV $597
line 2378
;2378:	}
LABELV $595
line 2379
;2379:	rocketjumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_WEAPONJUMPING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 38
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 4
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 2380
;2380:	if (rocketjumper < 0.5) return qfalse;
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
GEF4 $599
CNSTI4 0
RETI4
ADDRGP4 $583
JUMPV
LABELV $599
line 2381
;2381:	return qtrue;
CNSTI4 1
RETI4
LABELV $583
endproc BotCanAndWantsToRocketJump 8 16
export BotHasPersistantPowerupAndWeapon
proc BotHasPersistantPowerupAndWeapon 32 0
line 2389
;2382:}
;2383:
;2384:/*
;2385:==================
;2386:BotHasPersistantPowerupAndWeapon
;2387:==================
;2388:*/
;2389:int BotHasPersistantPowerupAndWeapon(bot_state_t *bs) {
line 2400
;2390:#ifdef MISSIONPACK
;2391:	// if the bot does not have a persistant powerup
;2392:	if (!bs->inventory[INVENTORY_SCOUT] &&
;2393:		!bs->inventory[INVENTORY_GUARD] &&
;2394:		!bs->inventory[INVENTORY_DOUBLER] &&
;2395:		!bs->inventory[INVENTORY_AMMOREGEN] ) {
;2396:		return qfalse;
;2397:	}
;2398:#endif
;2399:	//if the bot is very low on health
;2400:	if (bs->inventory[INVENTORY_HEALTH] < 60) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $602
CNSTI4 0
RETI4
ADDRGP4 $601
JUMPV
LABELV $602
line 2402
;2401:	//if the bot is low on health
;2402:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $604
line 2404
;2403:		//if the bot has insufficient armor
;2404:		if (bs->inventory[INVENTORY_ARMOR] < 40) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $606
CNSTI4 0
RETI4
ADDRGP4 $601
JUMPV
LABELV $606
line 2405
;2405:	}
LABELV $604
line 2407
;2406:	//if the bot can use the bfg
;2407:	if (bs->inventory[INVENTORY_BFG10K] > 0 &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $608
ADDRLP4 0
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $608
line 2408
;2408:			bs->inventory[INVENTORY_BFGAMMO] > 7) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $601
JUMPV
LABELV $608
line 2410
;2409:	//if the bot can use the railgun
;2410:	if (bs->inventory[INVENTORY_RAILGUN] > 0 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $610
ADDRLP4 4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $610
line 2411
;2411:			bs->inventory[INVENTORY_SLUGS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $601
JUMPV
LABELV $610
line 2413
;2412:	//if the bot can use the lightning gun
;2413:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 &&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4988
ADDP4
INDIRI4
CNSTI4 0
LEI4 $612
ADDRLP4 8
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $612
line 2414
;2414:			bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $601
JUMPV
LABELV $612
line 2416
;2415:	//if the bot can use the rocketlauncher
;2416:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $614
ADDRLP4 12
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $614
line 2417
;2417:			bs->inventory[INVENTORY_ROCKETS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $601
JUMPV
LABELV $614
line 2419
;2418:	//
;2419:	if (bs->inventory[INVENTORY_NAILGUN] > 0 &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 5012
ADDP4
INDIRI4
CNSTI4 0
LEI4 $616
ADDRLP4 16
INDIRP4
CNSTI4 5056
ADDP4
INDIRI4
CNSTI4 5
LEI4 $616
line 2420
;2420:			bs->inventory[INVENTORY_NAILS] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $601
JUMPV
LABELV $616
line 2422
;2421:	//
;2422:	if (bs->inventory[INVENTORY_PROXLAUNCHER] > 0 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 5016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $618
ADDRLP4 20
INDIRP4
CNSTI4 5060
ADDP4
INDIRI4
CNSTI4 5
LEI4 $618
line 2423
;2423:			bs->inventory[INVENTORY_MINES] > 5) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $601
JUMPV
LABELV $618
line 2425
;2424:	//
;2425:	if (bs->inventory[INVENTORY_CHAINGUN] > 0 &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 5020
ADDP4
INDIRI4
CNSTI4 0
LEI4 $620
ADDRLP4 24
INDIRP4
CNSTI4 5064
ADDP4
INDIRI4
CNSTI4 40
LEI4 $620
line 2426
;2426:			bs->inventory[INVENTORY_BELT] > 40) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $601
JUMPV
LABELV $620
line 2428
;2427:	//if the bot can use the plasmagun
;2428:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 &&
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $622
ADDRLP4 28
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 20
LEI4 $622
line 2429
;2429:			bs->inventory[INVENTORY_CELLS] > 20) return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $601
JUMPV
LABELV $622
line 2430
;2430:	return qfalse;
CNSTI4 0
RETI4
LABELV $601
endproc BotHasPersistantPowerupAndWeapon 32 0
export BotGoCamp
proc BotGoCamp 16 16
line 2438
;2431:}
;2432:
;2433:/*
;2434:==================
;2435:BotGoCamp
;2436:==================
;2437:*/
;2438:void BotGoCamp(bot_state_t *bs, bot_goal_t *goal) {
line 2441
;2439:	float camper;
;2440:
;2441:	bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 2443
;2442:	//set message time to zero so bot will NOT show any message
;2443:	bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 2445
;2444:	//set the ltg type
;2445:	bs->ltgtype = LTG_CAMP;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 7
ASGNI4
line 2447
;2446:	//set the team goal
;2447:	memcpy(&bs->teamgoal, goal, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2449
;2448:	//get the team goal time
;2449:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 44
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 8
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 2450
;2450:	if (camper > 0.99) bs->teamgoal_time = FloatTime() + 99999;
ADDRLP4 0
INDIRF4
CNSTF4 1065185444
LEF4 $625
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1203982208
ADDF4
ASGNF4
ADDRGP4 $626
JUMPV
LABELV $625
line 2451
;2451:	else bs->teamgoal_time = FloatTime() + 120 + 180 * camper + random() * 15;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
CNSTF4 1127481344
ADDRLP4 0
INDIRF4
MULF4
ADDF4
CNSTF4 1097859072
ADDRLP4 12
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
ASGNF4
LABELV $626
line 2453
;2452:	//set the last time the bot started camping
;2453:	bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2455
;2454:	//the teammate that requested the camping
;2455:	bs->teammate = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
CNSTI4 0
ASGNI4
line 2457
;2456:	//do NOT type arrive message
;2457:	bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 2458
;2458:}
LABELV $624
endproc BotGoCamp 16 16
export BotWantsToCamp
proc BotWantsToCamp 176 16
line 2465
;2459:
;2460:/*
;2461:==================
;2462:BotWantsToCamp
;2463:==================
;2464:*/
;2465:int BotWantsToCamp(bot_state_t *bs) {
line 2470
;2466:	float camper;
;2467:	int cs, traveltime, besttraveltime;
;2468:	bot_goal_t goal, bestgoal;
;2469:
;2470:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 44
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 128
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 124
ADDRLP4 128
INDIRF4
ASGNF4
line 2471
;2471:	if (camper < 0.1) return qfalse;
ADDRLP4 124
INDIRF4
CNSTF4 1036831949
GEF4 $628
CNSTI4 0
RETI4
ADDRGP4 $627
JUMPV
LABELV $628
line 2473
;2472:	//if the bot has a team goal
;2473:	if (bs->ltgtype == LTG_TEAMHELP ||
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 1
EQI4 $638
ADDRLP4 132
INDIRI4
CNSTI4 2
EQI4 $638
ADDRLP4 132
INDIRI4
CNSTI4 3
EQI4 $638
ADDRLP4 132
INDIRI4
CNSTI4 4
EQI4 $638
ADDRLP4 132
INDIRI4
CNSTI4 5
EQI4 $638
ADDRLP4 132
INDIRI4
CNSTI4 7
EQI4 $638
ADDRLP4 132
INDIRI4
CNSTI4 8
EQI4 $638
ADDRLP4 132
INDIRI4
CNSTI4 9
NEI4 $630
LABELV $638
line 2480
;2474:			bs->ltgtype == LTG_TEAMACCOMPANY ||
;2475:			bs->ltgtype == LTG_DEFENDKEYAREA ||
;2476:			bs->ltgtype == LTG_GETFLAG ||
;2477:			bs->ltgtype == LTG_RUSHBASE ||
;2478:			bs->ltgtype == LTG_CAMP ||
;2479:			bs->ltgtype == LTG_CAMPORDER ||
;2480:			bs->ltgtype == LTG_PATROL) {
line 2481
;2481:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $627
JUMPV
LABELV $630
line 2484
;2482:	}
;2483:	//if camped recently
;2484:	if (bs->camp_time > FloatTime() - 60 + 300 * (1-camper)) return qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
SUBF4
CNSTF4 1133903872
CNSTF4 1065353216
ADDRLP4 124
INDIRF4
SUBF4
MULF4
ADDF4
LEF4 $639
CNSTI4 0
RETI4
ADDRGP4 $627
JUMPV
LABELV $639
line 2486
;2485:	//
;2486:	if (random() > camper) {
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 124
INDIRF4
LEF4 $641
line 2487
;2487:		bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2488
;2488:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $627
JUMPV
LABELV $641
line 2491
;2489:	}
;2490:	//if the bot isn't healthy anough
;2491:	if (BotAggression(bs) < 50) return qfalse;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
GEF4 $643
CNSTI4 0
RETI4
ADDRGP4 $627
JUMPV
LABELV $643
line 2493
;2492:	//the bot should have at least have the rocket launcher, the railgun or the bfg10k with some ammo
;2493:	if ((bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0 || bs->inventory[INVENTORY_ROCKETS < 10]) &&
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
ADDRLP4 148
INDIRI4
LEI4 $647
ADDRLP4 144
INDIRP4
CNSTI4 4952
ADDP4
INDIRI4
ADDRLP4 148
INDIRI4
EQI4 $645
LABELV $647
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $648
ADDRLP4 152
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 10
GEI4 $645
LABELV $648
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $649
ADDRLP4 156
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 10
GEI4 $645
LABELV $649
line 2495
;2494:		(bs->inventory[INVENTORY_RAILGUN] <= 0 || bs->inventory[INVENTORY_SLUGS] < 10) &&
;2495:		(bs->inventory[INVENTORY_BFG10K] <= 0 || bs->inventory[INVENTORY_BFGAMMO] < 10)) {
line 2496
;2496:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $627
JUMPV
LABELV $645
line 2499
;2497:	}
;2498:	//find the closest camp spot
;2499:	besttraveltime = 99999;
ADDRLP4 64
CNSTI4 99999
ASGNI4
line 2500
;2500:	for (cs = trap_BotGetNextCampSpotGoal(0, &goal); cs; cs = trap_BotGetNextCampSpotGoal(cs, &goal)) {
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 160
ADDRGP4 trap_BotGetNextCampSpotGoal
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 160
INDIRI4
ASGNI4
ADDRGP4 $653
JUMPV
LABELV $650
line 2501
;2501:		traveltime = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, goal.areanum, TFL_DEFAULT);
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 8+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 168
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 168
INDIRI4
ASGNI4
line 2502
;2502:		if (traveltime && traveltime < besttraveltime) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $655
ADDRLP4 0
INDIRI4
ADDRLP4 64
INDIRI4
GEI4 $655
line 2503
;2503:			besttraveltime = traveltime;
ADDRLP4 64
ADDRLP4 0
INDIRI4
ASGNI4
line 2504
;2504:			memcpy(&bestgoal, &goal, sizeof(bot_goal_t));
ADDRLP4 68
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2505
;2505:		}
LABELV $655
line 2506
;2506:	}
LABELV $651
line 2500
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 164
ADDRGP4 trap_BotGetNextCampSpotGoal
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 164
INDIRI4
ASGNI4
LABELV $653
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $650
line 2507
;2507:	if (besttraveltime > 150) return qfalse;
ADDRLP4 64
INDIRI4
CNSTI4 150
LEI4 $657
CNSTI4 0
RETI4
ADDRGP4 $627
JUMPV
LABELV $657
line 2509
;2508:	//ok found a camp spot, go camp there
;2509:	BotGoCamp(bs, &bestgoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 BotGoCamp
CALLV
pop
line 2510
;2510:	bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 2512
;2511:	//
;2512:	return qtrue;
CNSTI4 1
RETI4
LABELV $627
endproc BotWantsToCamp 176 16
export BotDontAvoid
proc BotDontAvoid 68 12
line 2520
;2513:}
;2514:
;2515:/*
;2516:==================
;2517:BotDontAvoid
;2518:==================
;2519:*/
;2520:void BotDontAvoid(bot_state_t *bs, char *itemname) {
line 2524
;2521:	bot_goal_t goal;
;2522:	int num;
;2523:
;2524:	num = trap_BotGetLevelItemGoal(-1, itemname, &goal);
CNSTI4 -1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 60
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
ADDRGP4 $661
JUMPV
LABELV $660
line 2525
;2525:	while(num >= 0) {
line 2526
;2526:		trap_BotRemoveFromAvoidGoals(bs->gs, goal.number);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 4+44
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveFromAvoidGoals
CALLV
pop
line 2527
;2527:		num = trap_BotGetLevelItemGoal(num, itemname, &goal);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 64
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 64
INDIRI4
ASGNI4
line 2528
;2528:	}
LABELV $661
line 2525
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $660
line 2529
;2529:}
LABELV $659
endproc BotDontAvoid 68 12
export BotGoForPowerups
proc BotGoForPowerups 0 8
line 2536
;2530:
;2531:/*
;2532:==================
;2533:BotGoForPowerups
;2534:==================
;2535:*/
;2536:void BotGoForPowerups(bot_state_t *bs) {
line 2539
;2537:
;2538:	//don't avoid any of the powerups anymore
;2539:	BotDontAvoid(bs, "Quad Damage");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $665
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2540
;2540:	BotDontAvoid(bs, "Regeneration");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $666
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2541
;2541:	BotDontAvoid(bs, "Battle Suit");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $667
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2542
;2542:	BotDontAvoid(bs, "Speed");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $668
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2543
;2543:	BotDontAvoid(bs, "Invisibility");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $669
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2547
;2544:	//BotDontAvoid(bs, "Flight");
;2545:	//reset the long term goal time so the bot will go for the powerup
;2546:	//NOTE: the long term goal type doesn't change
;2547:	bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2548
;2548:}
LABELV $664
endproc BotGoForPowerups 0 8
export BotRoamGoal
proc BotRoamGoal 180 28
line 2555
;2549:
;2550:/*
;2551:==================
;2552:BotRoamGoal
;2553:==================
;2554:*/
;2555:void BotRoamGoal(bot_state_t *bs, vec3_t goal) {
line 2561
;2556:	int pc, i;
;2557:	float len, rnd;
;2558:	vec3_t dir, bestorg, belowbestorg;
;2559:	bsp_trace_t trace;
;2560:
;2561:	for (i = 0; i < 10; i++) {
ADDRLP4 116
CNSTI4 0
ASGNI4
LABELV $671
line 2563
;2562:		//start at the bot origin
;2563:		VectorCopy(bs->origin, bestorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 2564
;2564:		rnd = random();
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 112
ADDRLP4 136
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ASGNF4
line 2565
;2565:		if (rnd > 0.25) {
ADDRLP4 112
INDIRF4
CNSTF4 1048576000
LEF4 $675
line 2567
;2566:			//add a random value to the x-coordinate
;2567:			if (random() < 0.5) bestorg[0] -= 800 * random() + 100;
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
GEF4 $677
ADDRLP4 144
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1145569280
ADDRLP4 144
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1120403456
ADDF4
SUBF4
ASGNF4
ADDRGP4 $678
JUMPV
LABELV $677
line 2568
;2568:			else bestorg[0] += 800 * random() + 100;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1145569280
ADDRLP4 148
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1120403456
ADDF4
ADDF4
ASGNF4
LABELV $678
line 2569
;2569:		}
LABELV $675
line 2570
;2570:		if (rnd < 0.75) {
ADDRLP4 112
INDIRF4
CNSTF4 1061158912
GEF4 $679
line 2572
;2571:			//add a random value to the y-coordinate
;2572:			if (random() < 0.5) bestorg[1] -= 800 * random() + 100;
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
GEF4 $681
ADDRLP4 144
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1145569280
ADDRLP4 144
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1120403456
ADDF4
SUBF4
ASGNF4
ADDRGP4 $682
JUMPV
LABELV $681
line 2573
;2573:			else bestorg[1] += 800 * random() + 100;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1145569280
ADDRLP4 148
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1120403456
ADDF4
ADDF4
ASGNF4
LABELV $682
line 2574
;2574:		}
LABELV $679
line 2576
;2575:		//add a random value to the z-coordinate (NOTE: 48 = maxjump?)
;2576:		bestorg[2] += 2 * 48 * crandom();
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1119879168
CNSTF4 1073741824
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 2578
;2577:		//trace a line from the origin to the roam target
;2578:		BotAI_Trace(&trace, bs->origin, NULL, NULL, bestorg, bs->entitynum, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 148
CNSTP4 0
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2580
;2579:		//direction and length towards the roam target
;2580:		VectorSubtract(trace.endpos, bs->origin, dir);
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24+12
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24+12+4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 24+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2581
;2581:		len = VectorNormalize(dir);
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 108
ADDRLP4 156
INDIRF4
ASGNF4
line 2583
;2582:		//if the roam target is far away anough
;2583:		if (len > 200) {
ADDRLP4 108
INDIRF4
CNSTF4 1128792064
LEF4 $693
line 2585
;2584:			//the roam target is in the given direction before walls
;2585:			VectorScale(dir, len * trace.fraction - 40, dir);
ADDRLP4 164
CNSTF4 1109393408
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDRLP4 164
INDIRF4
SUBF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDRLP4 164
INDIRF4
SUBF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
CNSTF4 1109393408
SUBF4
MULF4
ASGNF4
line 2586
;2586:			VectorAdd(bs->origin, dir, bestorg);
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 168
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 168
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 2588
;2587:			//get the coordinates of the floor below the roam target
;2588:			belowbestorg[0] = bestorg[0];
ADDRLP4 120
ADDRLP4 12
INDIRF4
ASGNF4
line 2589
;2589:			belowbestorg[1] = bestorg[1];
ADDRLP4 120+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2590
;2590:			belowbestorg[2] = bestorg[2] - 800;
ADDRLP4 120+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1145569280
SUBF4
ASGNF4
line 2591
;2591:			BotAI_Trace(&trace, bestorg, NULL, NULL, belowbestorg, bs->entitynum, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 172
CNSTP4 0
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 120
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2593
;2592:			//
;2593:			if (!trace.startsolid) {
ADDRLP4 24+4
INDIRI4
CNSTI4 0
NEI4 $710
line 2594
;2594:				trace.endpos[2]++;
ADDRLP4 24+12+8
ADDRLP4 24+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2595
;2595:				pc = trap_PointContents(trace.endpos, bs->entitynum);
ADDRLP4 24+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 176
INDIRI4
ASGNI4
line 2596
;2596:				if (!(pc & (CONTENTS_LAVA | CONTENTS_SLIME))) {
ADDRLP4 132
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
NEI4 $716
line 2597
;2597:					VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2598
;2598:					return;
ADDRGP4 $670
JUMPV
LABELV $716
line 2600
;2599:				}
;2600:			}
LABELV $710
line 2601
;2601:		}
LABELV $693
line 2602
;2602:	}
LABELV $672
line 2561
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 10
LTI4 $671
line 2603
;2603:	VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2604
;2604:}
LABELV $670
endproc BotRoamGoal 180 28
lit
align 4
LABELV $720
byte 4 0
byte 4 0
byte 4 1065353216
export BotAttackMove
code
proc BotAttackMove 392 16
line 2611
;2605:
;2606:/*
;2607:==================
;2608:BotAttackMove
;2609:==================
;2610:*/
;2611:bot_moveresult_t BotAttackMove(bot_state_t *bs, int tfl) {
line 2615
;2612:	int movetype, i, attackentity;
;2613:	float attack_skill, jumper, croucher, dist, strafechange_time;
;2614:	float attack_dist, attack_range;
;2615:	vec3_t forward, backward, sideward, hordir, up = {0, 0, 1};
ADDRLP4 56
ADDRGP4 $720
INDIRB
ASGNB 12
line 2620
;2616:	aas_entityinfo_t entinfo;
;2617:	bot_moveresult_t moveresult;
;2618:	bot_goal_t goal;
;2619:
;2620:	attackentity = bs->enemy;
ADDRLP4 332
ADDRFP4 4
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 2622
;2621:	//
;2622:	if (bs->attackchase_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6124
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $721
line 2624
;2623:		//create the chase goal
;2624:		goal.entitynum = attackentity;
ADDRLP4 136+40
ADDRLP4 332
INDIRI4
ASGNI4
line 2625
;2625:		goal.areanum = bs->lastenemyareanum;
ADDRLP4 136+12
ADDRFP4 4
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ASGNI4
line 2626
;2626:		VectorCopy(bs->lastenemyorigin, goal.origin);
ADDRLP4 136
ADDRFP4 4
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 2627
;2627:		VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 136+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+8
CNSTF4 3238002688
ASGNF4
line 2628
;2628:		VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 136+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+8
CNSTF4 1090519040
ASGNF4
line 2630
;2629:		//initialize the movement state
;2630:		BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2632
;2631:		//move towards the goal
;2632:		trap_BotMoveToGoal(&moveresult, bs->ms, &goal, tfl);
ADDRLP4 80
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2633
;2633:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $718
JUMPV
LABELV $721
line 2636
;2634:	}
;2635:	//
;2636:	memset(&moveresult, 0, sizeof(bot_moveresult_t));
ADDRLP4 80
ARGP4
CNSTI4 0
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2638
;2637:	//
;2638:	attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 348
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 132
ADDRLP4 348
INDIRF4
ASGNF4
line 2639
;2639:	jumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_JUMPER, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 37
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 352
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 340
ADDRLP4 352
INDIRF4
ASGNF4
line 2640
;2640:	croucher = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 36
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 356
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 344
ADDRLP4 356
INDIRF4
ASGNF4
line 2642
;2641:	//if the bot is really stupid
;2642:	if (attack_skill < 0.2) return moveresult;
ADDRLP4 132
INDIRF4
CNSTF4 1045220557
GEF4 $735
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $718
JUMPV
LABELV $735
line 2644
;2643:	//initialize the movement state
;2644:	BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2646
;2645:	//get the enemy entity info
;2646:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 332
INDIRI4
ARGI4
ADDRLP4 192
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2648
;2647:	//direction towards the enemy
;2648:	VectorSubtract(entinfo.origin, bs->origin, forward);
ADDRLP4 360
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 192+24
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 192+24+4
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 192+24+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2650
;2649:	//the distance towards the enemy
;2650:	dist = VectorNormalize(forward);
ADDRLP4 24
ARGP4
ADDRLP4 364
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 364
INDIRF4
ASGNF4
line 2651
;2651:	VectorNegate(forward, backward);
ADDRLP4 36
ADDRLP4 24
INDIRF4
NEGF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 24+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 24+8
INDIRF4
NEGF4
ASGNF4
line 2653
;2652:	//walk, crouch or jump
;2653:	movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2655
;2654:	//
;2655:	if (bs->attackcrouch_time < FloatTime() - 1) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $748
line 2656
;2656:		if (random() < jumper) {
ADDRLP4 368
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 340
INDIRF4
GEF4 $750
line 2657
;2657:			movetype = MOVE_JUMP;
ADDRLP4 52
CNSTI4 4
ASGNI4
line 2658
;2658:		}
ADDRGP4 $751
JUMPV
LABELV $750
line 2660
;2659:		//wait at least one second before crouching again
;2660:		else if (bs->attackcrouch_time < FloatTime() - 1 && random() < croucher) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $752
ADDRLP4 372
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 344
INDIRF4
GEF4 $752
line 2661
;2661:			bs->attackcrouch_time = FloatTime() + croucher * 5;
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDRLP4 344
INDIRF4
MULF4
ADDF4
ASGNF4
line 2662
;2662:		}
LABELV $752
LABELV $751
line 2663
;2663:	}
LABELV $748
line 2664
;2664:	if (bs->attackcrouch_time > FloatTime()) movetype = MOVE_CROUCH;
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $754
ADDRLP4 52
CNSTI4 2
ASGNI4
LABELV $754
line 2666
;2665:	//if the bot should jump
;2666:	if (movetype == MOVE_JUMP) {
ADDRLP4 52
INDIRI4
CNSTI4 4
NEI4 $756
line 2668
;2667:		//if jumped last frame
;2668:		if (bs->attackjump_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $758
line 2669
;2669:			movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2670
;2670:		}
ADDRGP4 $759
JUMPV
LABELV $758
line 2671
;2671:		else {
line 2672
;2672:			bs->attackjump_time = FloatTime() + 1;
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2673
;2673:		}
LABELV $759
line 2674
;2674:	}
LABELV $756
line 2675
;2675:	if (bs->cur_ps.weapon == WP_GAUNTLET) {
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $760
line 2676
;2676:		attack_dist = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 2677
;2677:		attack_range = 0;
ADDRLP4 76
CNSTF4 0
ASGNF4
line 2678
;2678:	}
ADDRGP4 $761
JUMPV
LABELV $760
line 2679
;2679:	else {
line 2680
;2680:		attack_dist = IDEAL_ATTACKDIST;
ADDRLP4 72
CNSTF4 1124859904
ASGNF4
line 2681
;2681:		attack_range = 40;
ADDRLP4 76
CNSTF4 1109393408
ASGNF4
line 2682
;2682:	}
LABELV $761
line 2684
;2683:	//if the bot is stupid
;2684:	if (attack_skill <= 0.4) {
ADDRLP4 132
INDIRF4
CNSTF4 1053609165
GTF4 $762
line 2686
;2685:		//just walk to or away from the enemy
;2686:		if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $764
line 2687
;2687:			if (trap_BotMoveInDirection(bs->ms, forward, 400, movetype)) return moveresult;
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 368
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $766
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $718
JUMPV
LABELV $766
line 2688
;2688:		}
LABELV $764
line 2689
;2689:		if (dist < attack_dist - attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $768
line 2690
;2690:			if (trap_BotMoveInDirection(bs->ms, backward, 400, movetype)) return moveresult;
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 368
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $770
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $718
JUMPV
LABELV $770
line 2691
;2691:		}
LABELV $768
line 2692
;2692:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $718
JUMPV
LABELV $762
line 2695
;2693:	}
;2694:	//increase the strafe time
;2695:	bs->attackstrafe_time += bs->thinktime;
ADDRLP4 368
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 372
ADDRLP4 368
INDIRP4
CNSTI4 6116
ADDP4
ASGNP4
ADDRLP4 372
INDIRP4
ADDRLP4 372
INDIRP4
INDIRF4
ADDRLP4 368
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2697
;2696:	//get the strafe change time
;2697:	strafechange_time = 0.4 + (1 - attack_skill) * 0.2;
ADDRLP4 336
CNSTF4 1045220557
CNSTF4 1065353216
ADDRLP4 132
INDIRF4
SUBF4
MULF4
CNSTF4 1053609165
ADDF4
ASGNF4
line 2698
;2698:	if (attack_skill > 0.7) strafechange_time += crandom() * 0.2;
ADDRLP4 132
INDIRF4
CNSTF4 1060320051
LEF4 $772
ADDRLP4 376
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 336
ADDRLP4 336
INDIRF4
CNSTF4 1045220557
CNSTF4 1073741824
ADDRLP4 376
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
LABELV $772
line 2700
;2699:	//if the strafe direction should be changed
;2700:	if (bs->attackstrafe_time > strafechange_time) {
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
INDIRF4
ADDRLP4 336
INDIRF4
LEF4 $774
line 2702
;2701:		//some magic number :)
;2702:		if (random() > 0.935) {
ADDRLP4 380
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1064262697
LEF4 $776
line 2704
;2703:			//flip the strafe direction
;2704:			bs->flags ^= BFL_STRAFERIGHT;
ADDRLP4 384
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 384
INDIRP4
ADDRLP4 384
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2705
;2705:			bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2706
;2706:		}
LABELV $776
line 2707
;2707:	}
LABELV $774
line 2709
;2708:	//
;2709:	for (i = 0; i < 2; i++) {
ADDRLP4 48
CNSTI4 0
ASGNI4
LABELV $778
line 2710
;2710:		hordir[0] = forward[0];
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 2711
;2711:		hordir[1] = forward[1];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ASGNF4
line 2712
;2712:		hordir[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 2713
;2713:		VectorNormalize(hordir);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2715
;2714:		//get the sideward vector
;2715:		CrossProduct(hordir, up, sideward);
ADDRLP4 12
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2717
;2716:		//reverse the vector depending on the strafe direction
;2717:		if (bs->flags & BFL_STRAFERIGHT) VectorNegate(sideward, sideward);
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $785
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
NEGF4
ASGNF4
LABELV $785
line 2719
;2718:		//randomly go back a little
;2719:		if (random() > 0.9) {
ADDRLP4 380
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1063675494
LEF4 $791
line 2720
;2720:			VectorAdd(sideward, backward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
ASGNF4
line 2721
;2721:		}
ADDRGP4 $792
JUMPV
LABELV $791
line 2722
;2722:		else {
line 2724
;2723:			//walk forward or backward to get at the ideal attack distance
;2724:			if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $799
line 2725
;2725:				VectorAdd(sideward, forward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 2726
;2726:			}
ADDRGP4 $800
JUMPV
LABELV $799
line 2727
;2727:			else if (dist < attack_dist - attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $807
line 2728
;2728:				VectorAdd(sideward, backward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
ASGNF4
line 2729
;2729:			}
LABELV $807
LABELV $800
line 2730
;2730:		}
LABELV $792
line 2732
;2731:		//perform the movement
;2732:		if (trap_BotMoveInDirection(bs->ms, sideward, 400, movetype))
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 384
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
EQI4 $815
line 2733
;2733:			return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $718
JUMPV
LABELV $815
line 2735
;2734:		//movement failed, flip the strafe direction
;2735:		bs->flags ^= BFL_STRAFERIGHT;
ADDRLP4 388
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 388
INDIRP4
ADDRLP4 388
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2736
;2736:		bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2737
;2737:	}
LABELV $779
line 2709
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 2
LTI4 $778
line 2740
;2738:	//bot couldn't do any usefull movement
;2739://	bs->attackchase_time = AAS_Time() + 6;
;2740:	return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
LABELV $718
endproc BotAttackMove 392 16
export BotSameTeam
proc BotSameTeam 2072 12
line 2748
;2741:}
;2742:
;2743:/*
;2744:==================
;2745:BotSameTeam
;2746:==================
;2747:*/
;2748:int BotSameTeam(bot_state_t *bs, int entnum) {
line 2751
;2749:	char info1[1024], info2[1024];
;2750:
;2751:	if (bs->client < 0 || bs->client >= MAX_CLIENTS) {
ADDRLP4 2048
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 0
LTI4 $820
ADDRLP4 2048
INDIRI4
CNSTI4 64
LTI4 $818
LABELV $820
line 2753
;2752:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2753:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $817
JUMPV
LABELV $818
line 2755
;2754:	}
;2755:	if (entnum < 0 || entnum >= MAX_CLIENTS) {
ADDRLP4 2052
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 0
LTI4 $823
ADDRLP4 2052
INDIRI4
CNSTI4 64
LTI4 $821
LABELV $823
line 2757
;2756:		//BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2757:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $817
JUMPV
LABELV $821
line 2759
;2758:	}
;2759:	if ( gametype >= GT_TEAM ) {
ADDRGP4 gametype
INDIRI4
CNSTI4 3
LTI4 $824
line 2760
;2760:		trap_GetConfigstring(CS_PLAYERS+bs->client, info1, sizeof(info1));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 2761
;2761:		trap_GetConfigstring(CS_PLAYERS+entnum, info2, sizeof(info2));
ADDRFP4 4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 2763
;2762:		//
;2763:		if (atoi(Info_ValueForKey(info1, "t")) == atoi(Info_ValueForKey(info2, "t"))) return qtrue;
ADDRLP4 0
ARGP4
ADDRGP4 $67
ARGP4
ADDRLP4 2056
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2056
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ARGP4
ADDRGP4 $67
ARGP4
ADDRLP4 2064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRLP4 2068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
ADDRLP4 2068
INDIRI4
NEI4 $826
CNSTI4 1
RETI4
ADDRGP4 $817
JUMPV
LABELV $826
line 2764
;2764:	}
LABELV $824
line 2765
;2765:	return qfalse;
CNSTI4 0
RETI4
LABELV $817
endproc BotSameTeam 2072 12
export InFieldOfVision
proc InFieldOfVision 24 4
line 2774
;2766:}
;2767:
;2768:/*
;2769:==================
;2770:InFieldOfVision
;2771:==================
;2772:*/
;2773:qboolean InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles)
;2774:{
line 2778
;2775:	int i;
;2776:	float diff, angle;
;2777:
;2778:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $829
line 2779
;2779:		angle = AngleMod(viewangles[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
ASGNF4
line 2780
;2780:		angles[i] = AngleMod(angles[i]);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
line 2781
;2781:		diff = angles[i] - angle;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 2782
;2782:		if (angles[i] > angle) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $833
line 2783
;2783:			if (diff > 180.0) diff -= 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $834
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 2784
;2784:		}
ADDRGP4 $834
JUMPV
LABELV $833
line 2785
;2785:		else {
line 2786
;2786:			if (diff < -180.0) diff += 360.0;
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $837
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $837
line 2787
;2787:		}
LABELV $834
line 2788
;2788:		if (diff > 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $839
line 2789
;2789:			if (diff > fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
LEF4 $840
CNSTI4 0
RETI4
ADDRGP4 $828
JUMPV
line 2790
;2790:		}
LABELV $839
line 2791
;2791:		else {
line 2792
;2792:			if (diff < -fov * 0.5) return qfalse;
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
NEGF4
MULF4
GEF4 $843
CNSTI4 0
RETI4
ADDRGP4 $828
JUMPV
LABELV $843
line 2793
;2793:		}
LABELV $840
line 2794
;2794:	}
LABELV $830
line 2778
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $829
line 2795
;2795:	return qtrue;
CNSTI4 1
RETI4
LABELV $828
endproc InFieldOfVision 24 4
export BotEntityVisible
proc BotEntityVisible 376 28
line 2805
;2796:}
;2797:
;2798:/*
;2799:==================
;2800:BotEntityVisible
;2801:
;2802:returns visibility in the range [0, 1] taking fog and water surfaces into account
;2803:==================
;2804:*/
;2805:float BotEntityVisible(int viewer, vec3_t eye, vec3_t viewangles, float fov, int ent) {
line 2813
;2806:	int i, contents_mask, passent, hitent, infog, inwater, otherinfog, pc;
;2807:	float squaredfogdist, waterfactor, vis, bestvis;
;2808:	bsp_trace_t trace;
;2809:	aas_entityinfo_t entinfo;
;2810:	vec3_t dir, entangles, start, end, middle;
;2811:
;2812:	//calculate middle of bounding box
;2813:	BotEntityInfo(ent, &entinfo);
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 148
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2814
;2814:	VectorAdd(entinfo.mins, entinfo.maxs, middle);
ADDRLP4 84
ADDRLP4 148+72
INDIRF4
ADDRLP4 148+84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 148+72+4
INDIRF4
ADDRLP4 148+84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 148+72+8
INDIRF4
ADDRLP4 148+84+8
INDIRF4
ADDF4
ASGNF4
line 2815
;2815:	VectorScale(middle, 0.5, middle);
ADDRLP4 332
CNSTF4 1056964608
ASGNF4
ADDRLP4 84
ADDRLP4 332
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 332
INDIRF4
ADDRLP4 84+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 84+8
CNSTF4 1056964608
ADDRLP4 84+8
INDIRF4
MULF4
ASGNF4
line 2816
;2816:	VectorAdd(entinfo.origin, middle, middle);
ADDRLP4 84
ADDRLP4 148+24
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 148+24+4
INDIRF4
ADDRLP4 84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 148+24+8
INDIRF4
ADDRLP4 84+8
INDIRF4
ADDF4
ASGNF4
line 2818
;2817:	//check if entity is within field of vision
;2818:	VectorSubtract(middle, eye, dir);
ADDRLP4 336
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 84
INDIRF4
ADDRLP4 336
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 336
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 84+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2819
;2819:	vectoangles(dir, entangles);
ADDRLP4 136
ARGP4
ADDRLP4 320
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2820
;2820:	if (!InFieldOfVision(viewangles, fov, entangles)) return 0;
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 320
ARGP4
ADDRLP4 340
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
NEI4 $875
CNSTF4 0
RETF4
ADDRGP4 $845
JUMPV
LABELV $875
line 2822
;2821:	//
;2822:	pc = trap_AAS_PointContents(eye);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 316
ADDRLP4 344
INDIRI4
ASGNI4
line 2823
;2823:	infog = (pc & CONTENTS_FOG);
ADDRLP4 312
ADDRLP4 316
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 2824
;2824:	inwater = (pc & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER));
ADDRLP4 308
ADDRLP4 316
INDIRI4
CNSTI4 56
BANDI4
ASGNI4
line 2826
;2825:	//
;2826:	bestvis = 0;
ADDRLP4 296
CNSTF4 0
ASGNF4
line 2827
;2827:	for (i = 0; i < 3; i++) {
ADDRLP4 100
CNSTI4 0
ASGNI4
LABELV $877
line 2831
;2828:		//if the point is not in potential visible sight
;2829:		//if (!AAS_inPVS(eye, middle)) continue;
;2830:		//
;2831:		contents_mask = CONTENTS_SOLID|CONTENTS_PLAYERCLIP;
ADDRLP4 96
CNSTI4 65537
ASGNI4
line 2832
;2832:		passent = viewer;
ADDRLP4 116
ADDRFP4 0
INDIRI4
ASGNI4
line 2833
;2833:		hitent = ent;
ADDRLP4 132
ADDRFP4 16
INDIRI4
ASGNI4
line 2834
;2834:		VectorCopy(eye, start);
ADDRLP4 120
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2835
;2835:		VectorCopy(middle, end);
ADDRLP4 104
ADDRLP4 84
INDIRB
ASGNB 12
line 2837
;2836:		//if the entity is in water, lava or slime
;2837:		if (trap_AAS_PointContents(middle) & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
ADDRLP4 84
ARGP4
ADDRLP4 348
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $881
line 2838
;2838:			contents_mask |= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BORI4
ASGNI4
line 2839
;2839:		}
LABELV $881
line 2841
;2840:		//if eye is in water, lava or slime
;2841:		if (inwater) {
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $883
line 2842
;2842:			if (!(contents_mask & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER))) {
ADDRLP4 96
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $885
line 2843
;2843:				passent = ent;
ADDRLP4 116
ADDRFP4 16
INDIRI4
ASGNI4
line 2844
;2844:				hitent = viewer;
ADDRLP4 132
ADDRFP4 0
INDIRI4
ASGNI4
line 2845
;2845:				VectorCopy(middle, start);
ADDRLP4 120
ADDRLP4 84
INDIRB
ASGNB 12
line 2846
;2846:				VectorCopy(eye, end);
ADDRLP4 104
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2847
;2847:			}
LABELV $885
line 2848
;2848:			contents_mask ^= (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BXORI4
ASGNI4
line 2849
;2849:		}
LABELV $883
line 2851
;2850:		//trace from start to end
;2851:		BotAI_Trace(&trace, start, NULL, NULL, end, passent, contents_mask);
ADDRLP4 0
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 352
CNSTP4 0
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2853
;2852:		//if water was hit
;2853:		waterfactor = 1.0;
ADDRLP4 288
CNSTF4 1065353216
ASGNF4
line 2854
;2854:		if (trace.contents & (CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER)) {
ADDRLP4 0+76
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $887
line 2856
;2855:			//if the water surface is translucent
;2856:			if (1) {
line 2858
;2857:				//trace through the water
;2858:				contents_mask &= ~(CONTENTS_LAVA|CONTENTS_SLIME|CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 -57
BANDI4
ASGNI4
line 2859
;2859:				BotAI_Trace(&trace, trace.endpos, NULL, NULL, end, passent, contents_mask);
ADDRLP4 0
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 356
CNSTP4 0
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2860
;2860:				waterfactor = 0.5;
ADDRLP4 288
CNSTF4 1056964608
ASGNF4
line 2861
;2861:			}
LABELV $890
line 2862
;2862:		}
LABELV $887
line 2864
;2863:		//if a full trace or the hitent was hit
;2864:		if (trace.fraction >= 1 || trace.ent == hitent) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $897
ADDRLP4 0+80
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $893
LABELV $897
line 2867
;2865:			//check for fog, assuming there's only one fog brush where
;2866:			//either the viewer or the entity is in or both are in
;2867:			otherinfog = (trap_AAS_PointContents(middle) & CONTENTS_FOG);
ADDRLP4 84
ARGP4
ADDRLP4 356
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 304
ADDRLP4 356
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 2868
;2868:			if (infog && otherinfog) {
ADDRLP4 360
CNSTI4 0
ASGNI4
ADDRLP4 312
INDIRI4
ADDRLP4 360
INDIRI4
EQI4 $898
ADDRLP4 304
INDIRI4
ADDRLP4 360
INDIRI4
EQI4 $898
line 2869
;2869:				VectorSubtract(trace.endpos, eye, dir);
ADDRLP4 364
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 0+12
INDIRF4
ADDRLP4 364
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 0+12+4
INDIRF4
ADDRLP4 364
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 0+12+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2870
;2870:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 368
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 368
INDIRF4
ASGNF4
line 2871
;2871:			}
ADDRGP4 $899
JUMPV
LABELV $898
line 2872
;2872:			else if (infog) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $907
line 2873
;2873:				VectorCopy(trace.endpos, start);
ADDRLP4 120
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2874
;2874:				BotAI_Trace(&trace, start, NULL, NULL, eye, viewer, CONTENTS_FOG);
ADDRLP4 0
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 364
CNSTP4 0
ASGNP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2875
;2875:				VectorSubtract(eye, trace.endpos, dir);
ADDRLP4 368
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 368
INDIRP4
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 368
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 2876
;2876:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 372
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 372
INDIRF4
ASGNF4
line 2877
;2877:			}
ADDRGP4 $908
JUMPV
LABELV $907
line 2878
;2878:			else if (otherinfog) {
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $917
line 2879
;2879:				VectorCopy(trace.endpos, end);
ADDRLP4 104
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2880
;2880:				BotAI_Trace(&trace, eye, NULL, NULL, end, viewer, CONTENTS_FOG);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 364
CNSTP4 0
ASGNP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2881
;2881:				VectorSubtract(end, trace.endpos, dir);
ADDRLP4 136
ADDRLP4 104
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 104+4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 104+8
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 2882
;2882:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 368
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 368
INDIRF4
ASGNF4
line 2883
;2883:			}
ADDRGP4 $918
JUMPV
LABELV $917
line 2884
;2884:			else {
line 2886
;2885:				//if the entity and the viewer are not in fog assume there's no fog in between
;2886:				squaredfogdist = 0;
ADDRLP4 300
CNSTF4 0
ASGNF4
line 2887
;2887:			}
LABELV $918
LABELV $908
LABELV $899
line 2889
;2888:			//decrease visibility with the view distance through fog
;2889:			vis = 1 / ((squaredfogdist * 0.001) < 1 ? 1 : (squaredfogdist * 0.001));
ADDRLP4 368
CNSTF4 1065353216
ASGNF4
CNSTF4 981668463
ADDRLP4 300
INDIRF4
MULF4
ADDRLP4 368
INDIRF4
GEF4 $930
ADDRLP4 364
CNSTF4 1065353216
ASGNF4
ADDRGP4 $931
JUMPV
LABELV $930
ADDRLP4 364
CNSTF4 981668463
ADDRLP4 300
INDIRF4
MULF4
ASGNF4
LABELV $931
ADDRLP4 292
ADDRLP4 368
INDIRF4
ADDRLP4 364
INDIRF4
DIVF4
ASGNF4
line 2891
;2890:			//if entering water visibility is reduced
;2891:			vis *= waterfactor;
ADDRLP4 292
ADDRLP4 292
INDIRF4
ADDRLP4 288
INDIRF4
MULF4
ASGNF4
line 2893
;2892:			//
;2893:			if (vis > bestvis) bestvis = vis;
ADDRLP4 292
INDIRF4
ADDRLP4 296
INDIRF4
LEF4 $932
ADDRLP4 296
ADDRLP4 292
INDIRF4
ASGNF4
LABELV $932
line 2895
;2894:			//if pretty much no fog
;2895:			if (bestvis >= 0.95) return bestvis;
ADDRLP4 296
INDIRF4
CNSTF4 1064514355
LTF4 $934
ADDRLP4 296
INDIRF4
RETF4
ADDRGP4 $845
JUMPV
LABELV $934
line 2896
;2896:		}
LABELV $893
line 2898
;2897:		//check bottom and top of bounding box as well
;2898:		if (i == 0) middle[2] += entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $936
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $937
JUMPV
LABELV $936
line 2899
;2899:		else if (i == 1) middle[2] += entinfo.maxs[2] - entinfo.mins[2];
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $941
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
SUBF4
ADDF4
ASGNF4
LABELV $941
LABELV $937
line 2900
;2900:	}
LABELV $878
line 2827
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 3
LTI4 $877
line 2901
;2901:	return bestvis;
ADDRLP4 296
INDIRF4
RETF4
LABELV $845
endproc BotEntityVisible 376 28
export BotFindEnemy
proc BotFindEnemy 432 20
line 2909
;2902:}
;2903:
;2904:/*
;2905:==================
;2906:BotFindEnemy
;2907:==================
;2908:*/
;2909:int BotFindEnemy(bot_state_t *bs, int curenemy) {
line 2916
;2910:	int i, healthdecrease;
;2911:	float f, alertness, easyfragger, vis;
;2912:	float squaredist, cursquaredist;
;2913:	aas_entityinfo_t entinfo, curenemyinfo;
;2914:	vec3_t dir, angles;
;2915:
;2916:	alertness = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ALERTNESS, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 46
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 336
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 164
ADDRLP4 336
INDIRF4
ASGNF4
line 2917
;2917:	easyfragger = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_EASY_FRAGGER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 45
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 340
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 176
ADDRLP4 340
INDIRF4
ASGNF4
line 2919
;2918:	//check if the health decreased
;2919:	healthdecrease = bs->lasthealth > bs->inventory[INVENTORY_HEALTH];
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 5988
ADDP4
INDIRI4
ADDRLP4 348
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
LEI4 $950
ADDRLP4 344
CNSTI4 1
ASGNI4
ADDRGP4 $951
JUMPV
LABELV $950
ADDRLP4 344
CNSTI4 0
ASGNI4
LABELV $951
ADDRLP4 160
ADDRLP4 344
INDIRI4
ASGNI4
line 2921
;2920:	//remember the current health value
;2921:	bs->lasthealth = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 5988
ADDP4
ADDRLP4 352
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 2923
;2922:	//
;2923:	if (curenemy >= 0) {
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $952
line 2924
;2924:		BotEntityInfo(curenemy, &curenemyinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 196
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2925
;2925:		if (EntityCarriesFlag(&curenemyinfo)) return qfalse;
ADDRLP4 196
ARGP4
ADDRLP4 356
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $954
CNSTI4 0
RETI4
ADDRGP4 $948
JUMPV
LABELV $954
line 2926
;2926:		VectorSubtract(curenemyinfo.origin, bs->origin, dir);
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 196+24
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 196+24+4
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 196+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2927
;2927:		cursquaredist = VectorLengthSquared(dir);
ADDRLP4 144
ARGP4
ADDRLP4 364
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 192
ADDRLP4 364
INDIRF4
ASGNF4
line 2928
;2928:	}
ADDRGP4 $953
JUMPV
LABELV $952
line 2929
;2929:	else {
line 2930
;2930:		cursquaredist = 0;
ADDRLP4 192
CNSTF4 0
ASGNF4
line 2931
;2931:	}
LABELV $953
line 2960
;2932:#ifdef MISSIONPACK
;2933:	if (gametype == GT_OBELISK) {
;2934:		vec3_t target;
;2935:		bot_goal_t *goal;
;2936:		bsp_trace_t trace;
;2937:
;2938:		if (BotTeam(bs) == TEAM_RED)
;2939:			goal = &blueobelisk;
;2940:		else
;2941:			goal = &redobelisk;
;2942:		//if the obelisk is visible
;2943:		VectorCopy(goal->origin, target);
;2944:		target[2] += 1;
;2945:		BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;2946:		if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;2947:			if (goal->entitynum == bs->enemy) {
;2948:				return qfalse;
;2949:			}
;2950:			bs->enemy = goal->entitynum;
;2951:			bs->enemysight_time = FloatTime();
;2952:			bs->enemysuicide = qfalse;
;2953:			bs->enemydeath_time = 0;
;2954:			bs->enemyvisible_time = FloatTime();
;2955:			return qtrue;
;2956:		}
;2957:	}
;2958:#endif
;2959:	//
;2960:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $966
JUMPV
LABELV $963
line 2962
;2961:
;2962:		if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $967
ADDRGP4 $964
JUMPV
LABELV $967
line 2964
;2963:		//if it's the current enemy
;2964:		if (i == curenemy) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $969
ADDRGP4 $964
JUMPV
LABELV $969
line 2966
;2965:		//
;2966:		BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2968
;2967:		//
;2968:		if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $971
ADDRGP4 $964
JUMPV
LABELV $971
line 2970
;2969:		//if the enemy isn't dead and the enemy isn't the bot self
;2970:		if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 356
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
NEI4 $976
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $973
LABELV $976
ADDRGP4 $964
JUMPV
LABELV $973
line 2972
;2971:		//if the enemy is invisible and not shooting
;2972:		if (EntityIsInvisible(&entinfo) && !EntityIsShooting(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 360
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $977
ADDRLP4 0
ARGP4
ADDRLP4 364
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
NEI4 $977
line 2973
;2973:			continue;
ADDRGP4 $964
JUMPV
LABELV $977
line 2976
;2974:		}
;2975:		//if not an easy fragger don't shoot at chatting players
;2976:		if (easyfragger < 0.5 && EntityIsChatting(&entinfo)) continue;
ADDRLP4 176
INDIRF4
CNSTF4 1056964608
GEF4 $979
ADDRLP4 0
ARGP4
ADDRLP4 368
ADDRGP4 EntityIsChatting
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $979
ADDRGP4 $964
JUMPV
LABELV $979
line 2978
;2977:		//
;2978:		if (lastteleport_time > FloatTime() - 3) {
ADDRGP4 lastteleport_time
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
LEF4 $981
line 2979
;2979:			VectorSubtract(entinfo.origin, lastteleport_origin, dir);
ADDRLP4 144
ADDRLP4 0+24
INDIRF4
ADDRGP4 lastteleport_origin
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 0+24+4
INDIRF4
ADDRGP4 lastteleport_origin+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 0+24+8
INDIRF4
ADDRGP4 lastteleport_origin+8
INDIRF4
SUBF4
ASGNF4
line 2980
;2980:			if (VectorLengthSquared(dir) < Square(70)) continue;
ADDRLP4 144
ARGP4
ADDRLP4 372
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 372
INDIRF4
CNSTF4 1167663104
GEF4 $992
ADDRGP4 $964
JUMPV
LABELV $992
line 2981
;2981:		}
LABELV $981
line 2983
;2982:		//calculate the distance towards the enemy
;2983:		VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 372
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 0+24
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2984
;2984:		squaredist = VectorLengthSquared(dir);
ADDRLP4 144
ARGP4
ADDRLP4 376
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 376
INDIRF4
ASGNF4
line 2986
;2985:		//if this entity is not carrying a flag
;2986:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 380
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
NEI4 $1001
line 2987
;2987:		{
line 2989
;2988:			//if this enemy is further away than the current one
;2989:			if (curenemy >= 0 && squaredist > cursquaredist) continue;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1003
ADDRLP4 156
INDIRF4
ADDRLP4 192
INDIRF4
LEF4 $1003
ADDRGP4 $964
JUMPV
LABELV $1003
line 2990
;2990:		} //end if
LABELV $1001
line 2992
;2991:		//if the bot has no
;2992:		if (squaredist > Square(900.0 + alertness * 4000.0)) continue;
ADDRLP4 384
CNSTF4 1165623296
ADDRLP4 164
INDIRF4
MULF4
CNSTF4 1147207680
ADDF4
ASGNF4
ADDRLP4 156
INDIRF4
ADDRLP4 384
INDIRF4
ADDRLP4 384
INDIRF4
MULF4
LEF4 $1005
ADDRGP4 $964
JUMPV
LABELV $1005
line 2994
;2993:		//if on the same team
;2994:		if (BotSameTeam(bs, i)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 388
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
CNSTI4 0
EQI4 $1007
ADDRGP4 $964
JUMPV
LABELV $1007
line 2996
;2995:		//if the bot's health decreased or the enemy is shooting
;2996:		if (curenemy < 0 && (healthdecrease || EntityIsShooting(&entinfo)))
ADDRLP4 392
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 392
INDIRI4
GEI4 $1009
ADDRLP4 160
INDIRI4
ADDRLP4 392
INDIRI4
NEI4 $1011
ADDRLP4 0
ARGP4
ADDRLP4 396
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 396
INDIRI4
CNSTI4 0
EQI4 $1009
LABELV $1011
line 2997
;2997:			f = 360;
ADDRLP4 168
CNSTF4 1135869952
ASGNF4
ADDRGP4 $1010
JUMPV
LABELV $1009
line 2999
;2998:		else
;2999:			f = 90 + 90 - (90 - (squaredist > Square(810) ? Square(810) : squaredist) / (810 * 9));
ADDRLP4 156
INDIRF4
CNSTF4 1226845760
LEF4 $1013
ADDRLP4 400
CNSTF4 1226845760
ASGNF4
ADDRGP4 $1014
JUMPV
LABELV $1013
ADDRLP4 400
ADDRLP4 156
INDIRF4
ASGNF4
LABELV $1014
ADDRLP4 168
CNSTF4 1127481344
CNSTF4 1119092736
ADDRLP4 400
INDIRF4
CNSTF4 1172557824
DIVF4
SUBF4
SUBF4
ASGNF4
LABELV $1010
line 3001
;3000:		//check if the enemy is visible
;3001:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, f, i);
ADDRLP4 404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 404
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 404
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 404
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 168
INDIRF4
ARGF4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 408
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 172
ADDRLP4 408
INDIRF4
ASGNF4
line 3002
;3002:		if (vis <= 0) continue;
ADDRLP4 172
INDIRF4
CNSTF4 0
GTF4 $1015
ADDRGP4 $964
JUMPV
LABELV $1015
line 3004
;3003:		//if the enemy is quite far away, not shooting and the bot is not damaged
;3004:		if (curenemy < 0 && squaredist > Square(100) && !healthdecrease && !EntityIsShooting(&entinfo))
ADDRLP4 412
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 412
INDIRI4
GEI4 $1017
ADDRLP4 156
INDIRF4
CNSTF4 1176256512
LEF4 $1017
ADDRLP4 160
INDIRI4
ADDRLP4 412
INDIRI4
NEI4 $1017
ADDRLP4 0
ARGP4
ADDRLP4 416
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $1017
line 3005
;3005:		{
line 3007
;3006:			//check if we can avoid this enemy
;3007:			VectorSubtract(bs->origin, entinfo.origin, dir);
ADDRLP4 420
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 420
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 420
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+24+8
INDIRF4
SUBF4
ASGNF4
line 3008
;3008:			vectoangles(dir, angles);
ADDRLP4 144
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3010
;3009:			//if the bot isn't in the fov of the enemy
;3010:			if (!InFieldOfVision(entinfo.angles, 90, angles)) {
ADDRLP4 0+36
ARGP4
CNSTF4 1119092736
ARGF4
ADDRLP4 180
ARGP4
ADDRLP4 424
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 424
INDIRI4
CNSTI4 0
NEI4 $1026
line 3012
;3011:				//update some stuff for this enemy
;3012:				BotUpdateBattleInventory(bs, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 3014
;3013:				//if the bot doesn't really want to fight
;3014:				if (BotWantsToRetreat(bs)) continue;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 428
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 428
INDIRI4
CNSTI4 0
EQI4 $1029
ADDRGP4 $964
JUMPV
LABELV $1029
line 3015
;3015:			}
LABELV $1026
line 3016
;3016:		}
LABELV $1017
line 3018
;3017:		//found an enemy
;3018:		bs->enemy = entinfo.number;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
ADDRLP4 0+20
INDIRI4
ASGNI4
line 3019
;3019:		if (curenemy >= 0) bs->enemysight_time = FloatTime() - 2;
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1032
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
ADDRGP4 $1033
JUMPV
LABELV $1032
line 3020
;3020:		else bs->enemysight_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $1033
line 3021
;3021:		bs->enemysuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 0
ASGNI4
line 3022
;3022:		bs->enemydeath_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
CNSTF4 0
ASGNF4
line 3023
;3023:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 3024
;3024:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $948
JUMPV
LABELV $964
line 2960
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $966
ADDRLP4 140
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1034
ADDRLP4 140
INDIRI4
CNSTI4 64
LTI4 $963
LABELV $1034
line 3026
;3025:	}
;3026:	return qfalse;
CNSTI4 0
RETI4
LABELV $948
endproc BotFindEnemy 432 20
export BotTeamFlagCarrierVisible
proc BotTeamFlagCarrierVisible 164 20
line 3034
;3027:}
;3028:
;3029:/*
;3030:==================
;3031:BotTeamFlagCarrierVisible
;3032:==================
;3033:*/
;3034:int BotTeamFlagCarrierVisible(bot_state_t *bs) {
line 3039
;3035:	int i;
;3036:	float vis;
;3037:	aas_entityinfo_t entinfo;
;3038:
;3039:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1039
JUMPV
LABELV $1036
line 3040
;3040:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1040
line 3041
;3041:			continue;
ADDRGP4 $1037
JUMPV
LABELV $1040
line 3043
;3042:		//
;3043:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3045
;3044:		//if this player is active
;3045:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1042
line 3046
;3046:			continue;
ADDRGP4 $1037
JUMPV
LABELV $1042
line 3048
;3047:		//if this player is carrying a flag
;3048:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1044
line 3049
;3049:			continue;
ADDRGP4 $1037
JUMPV
LABELV $1044
line 3051
;3050:		//if the flag carrier is not on the same team
;3051:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $1046
line 3052
;3052:			continue;
ADDRGP4 $1037
JUMPV
LABELV $1046
line 3054
;3053:		//if the flag carrier is not visible
;3054:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3055
;3055:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1048
line 3056
;3056:			continue;
ADDRGP4 $1037
JUMPV
LABELV $1048
line 3058
;3057:		//
;3058:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1035
JUMPV
LABELV $1037
line 3039
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1039
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1050
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1036
LABELV $1050
line 3060
;3059:	}
;3060:	return -1;
CNSTI4 -1
RETI4
LABELV $1035
endproc BotTeamFlagCarrierVisible 164 20
export BotTeamFlagCarrier
proc BotTeamFlagCarrier 152 8
line 3068
;3061:}
;3062:
;3063:/*
;3064:==================
;3065:BotTeamFlagCarrier
;3066:==================
;3067:*/
;3068:int BotTeamFlagCarrier(bot_state_t *bs) {
line 3072
;3069:	int i;
;3070:	aas_entityinfo_t entinfo;
;3071:
;3072:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1055
JUMPV
LABELV $1052
line 3073
;3073:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1056
line 3074
;3074:			continue;
ADDRGP4 $1053
JUMPV
LABELV $1056
line 3076
;3075:		//
;3076:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3078
;3077:		//if this player is active
;3078:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1058
line 3079
;3079:			continue;
ADDRGP4 $1053
JUMPV
LABELV $1058
line 3081
;3080:		//if this player is carrying a flag
;3081:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $1060
line 3082
;3082:			continue;
ADDRGP4 $1053
JUMPV
LABELV $1060
line 3084
;3083:		//if the flag carrier is not on the same team
;3084:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1062
line 3085
;3085:			continue;
ADDRGP4 $1053
JUMPV
LABELV $1062
line 3087
;3086:		//
;3087:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1051
JUMPV
LABELV $1053
line 3072
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1055
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1064
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1052
LABELV $1064
line 3089
;3088:	}
;3089:	return -1;
CNSTI4 -1
RETI4
LABELV $1051
endproc BotTeamFlagCarrier 152 8
export BotEnemyFlagCarrierVisible
proc BotEnemyFlagCarrierVisible 164 20
line 3097
;3090:}
;3091:
;3092:/*
;3093:==================
;3094:BotEnemyFlagCarrierVisible
;3095:==================
;3096:*/
;3097:int BotEnemyFlagCarrierVisible(bot_state_t *bs) {
line 3102
;3098:	int i;
;3099:	float vis;
;3100:	aas_entityinfo_t entinfo;
;3101:
;3102:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1069
JUMPV
LABELV $1066
line 3103
;3103:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1070
line 3104
;3104:			continue;
ADDRGP4 $1067
JUMPV
LABELV $1070
line 3106
;3105:		//
;3106:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3108
;3107:		//if this player is active
;3108:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1072
line 3109
;3109:			continue;
ADDRGP4 $1067
JUMPV
LABELV $1072
line 3111
;3110:		//if this player is carrying a flag
;3111:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1074
line 3112
;3112:			continue;
ADDRGP4 $1067
JUMPV
LABELV $1074
line 3114
;3113:		//if the flag carrier is on the same team
;3114:		if (BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1076
line 3115
;3115:			continue;
ADDRGP4 $1067
JUMPV
LABELV $1076
line 3117
;3116:		//if the flag carrier is not visible
;3117:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3118
;3118:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1078
line 3119
;3119:			continue;
ADDRGP4 $1067
JUMPV
LABELV $1078
line 3121
;3120:		//
;3121:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1065
JUMPV
LABELV $1067
line 3102
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1069
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1080
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1066
LABELV $1080
line 3123
;3122:	}
;3123:	return -1;
CNSTI4 -1
RETI4
LABELV $1065
endproc BotEnemyFlagCarrierVisible 164 20
export BotVisibleTeamMatesAndEnemies
proc BotVisibleTeamMatesAndEnemies 192 20
line 3131
;3124:}
;3125:
;3126:/*
;3127:==================
;3128:BotVisibleTeamMatesAndEnemies
;3129:==================
;3130:*/
;3131:void BotVisibleTeamMatesAndEnemies(bot_state_t *bs, int *teammates, int *enemies, float range) {
line 3137
;3132:	int i;
;3133:	float vis;
;3134:	aas_entityinfo_t entinfo;
;3135:	vec3_t dir;
;3136:
;3137:	if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1082
line 3138
;3138:		*teammates = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1082
line 3139
;3139:	if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1084
line 3140
;3140:		*enemies = 0;
ADDRFP4 8
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1084
line 3141
;3141:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1089
JUMPV
LABELV $1086
line 3142
;3142:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1090
line 3143
;3143:			continue;
ADDRGP4 $1087
JUMPV
LABELV $1090
line 3145
;3144:		//
;3145:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3147
;3146:		//if this player is active
;3147:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1092
line 3148
;3148:			continue;
ADDRGP4 $1087
JUMPV
LABELV $1092
line 3150
;3149:		//if this player is carrying a flag
;3150:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 160
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1094
line 3151
;3151:			continue;
ADDRGP4 $1087
JUMPV
LABELV $1094
line 3153
;3152:		//if not within range
;3153:		VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 4+24
INDIRF4
ADDRLP4 164
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 4+24+4
INDIRF4
ADDRLP4 164
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 4+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3154
;3154:		if (VectorLengthSquared(dir) > Square(range))
ADDRLP4 144
ARGP4
ADDRLP4 168
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 172
ADDRFP4 12
INDIRF4
ASGNF4
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
LEF4 $1103
line 3155
;3155:			continue;
ADDRGP4 $1087
JUMPV
LABELV $1103
line 3157
;3156:		//if the flag carrier is not visible
;3157:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 176
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 180
INDIRF4
ASGNF4
line 3158
;3158:		if (vis <= 0)
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1105
line 3159
;3159:			continue;
ADDRGP4 $1087
JUMPV
LABELV $1105
line 3161
;3160:		//if the flag carrier is on the same team
;3161:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 184
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $1107
line 3162
;3162:			if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1108
line 3163
;3163:				(*teammates)++;
ADDRLP4 188
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3164
;3164:		}
ADDRGP4 $1108
JUMPV
LABELV $1107
line 3165
;3165:		else {
line 3166
;3166:			if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1111
line 3167
;3167:				(*enemies)++;
ADDRLP4 188
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1111
line 3168
;3168:		}
LABELV $1108
line 3169
;3169:	}
LABELV $1087
line 3141
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1089
ADDRLP4 0
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1113
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $1086
LABELV $1113
line 3170
;3170:}
LABELV $1081
endproc BotVisibleTeamMatesAndEnemies 192 20
lit
align 4
LABELV $1115
byte 4 3229614080
byte 4 3229614080
byte 4 3229614080
align 4
LABELV $1116
byte 4 1082130432
byte 4 1082130432
byte 4 1082130432
export BotAimAtEnemy
code
proc BotAimAtEnemy 1144 52
line 3241
;3171:
;3172:#ifdef MISSIONPACK
;3173:/*
;3174:==================
;3175:BotTeamCubeCarrierVisible
;3176:==================
;3177:*/
;3178:int BotTeamCubeCarrierVisible(bot_state_t *bs) {
;3179:	int i;
;3180:	float vis;
;3181:	aas_entityinfo_t entinfo;
;3182:
;3183:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
;3184:		if (i == bs->client) continue;
;3185:		//
;3186:		BotEntityInfo(i, &entinfo);
;3187:		//if this player is active
;3188:		if (!entinfo.valid) continue;
;3189:		//if this player is carrying a flag
;3190:		if (!EntityCarriesCubes(&entinfo)) continue;
;3191:		//if the flag carrier is not on the same team
;3192:		if (!BotSameTeam(bs, i)) continue;
;3193:		//if the flag carrier is not visible
;3194:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
;3195:		if (vis <= 0) continue;
;3196:		//
;3197:		return i;
;3198:	}
;3199:	return -1;
;3200:}
;3201:
;3202:/*
;3203:==================
;3204:BotEnemyCubeCarrierVisible
;3205:==================
;3206:*/
;3207:int BotEnemyCubeCarrierVisible(bot_state_t *bs) {
;3208:	int i;
;3209:	float vis;
;3210:	aas_entityinfo_t entinfo;
;3211:
;3212:	for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
;3213:		if (i == bs->client)
;3214:			continue;
;3215:		//
;3216:		BotEntityInfo(i, &entinfo);
;3217:		//if this player is active
;3218:		if (!entinfo.valid)
;3219:			continue;
;3220:		//if this player is carrying a flag
;3221:		if (!EntityCarriesCubes(&entinfo)) continue;
;3222:		//if the flag carrier is on the same team
;3223:		if (BotSameTeam(bs, i))
;3224:			continue;
;3225:		//if the flag carrier is not visible
;3226:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
;3227:		if (vis <= 0)
;3228:			continue;
;3229:		//
;3230:		return i;
;3231:	}
;3232:	return -1;
;3233:}
;3234:#endif
;3235:
;3236:/*
;3237:==================
;3238:BotAimAtEnemy
;3239:==================
;3240:*/
;3241:void BotAimAtEnemy(bot_state_t *bs) {
line 3245
;3242:	int i, enemyvisible;
;3243:	float dist, f, aim_skill, aim_accuracy, speed, reactiontime;
;3244:	vec3_t dir, bestorigin, end, start, groundtarget, cmdmove, enemyvelocity;
;3245:	vec3_t mins = {-4,-4,-4}, maxs = {4, 4, 4};
ADDRLP4 860
ADDRGP4 $1115
INDIRB
ASGNB 12
ADDRLP4 872
ADDRGP4 $1116
INDIRB
ASGNB 12
line 3253
;3246:	weaponinfo_t wi;
;3247:	aas_entityinfo_t entinfo;
;3248:	bot_goal_t goal;
;3249:	bsp_trace_t trace;
;3250:	vec3_t target;
;3251:
;3252:	//if the bot has no enemy
;3253:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1117
line 3254
;3254:		return;
ADDRGP4 $1114
JUMPV
LABELV $1117
line 3257
;3255:	}
;3256:	//get the enemy entity information
;3257:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3259
;3258:	//if this is not a player (should be an obelisk)
;3259:	if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 64
LTI4 $1119
line 3261
;3260:		//if the obelisk is visible
;3261:		VectorCopy(entinfo.origin, target);
ADDRLP4 828
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3270
;3262:#ifdef MISSIONPACK
;3263:		// if attacking an obelisk
;3264:		if ( bs->enemy == redobelisk.entitynum ||
;3265:			bs->enemy == blueobelisk.entitynum ) {
;3266:			target[2] += 32;
;3267:		}
;3268:#endif
;3269:		//aim at the obelisk
;3270:		VectorSubtract(target, bs->eye, dir);
ADDRLP4 984
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 828
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 828+4
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 828+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3271
;3271:		vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3273
;3272:		//set the aim target before trying to attack
;3273:		VectorCopy(target, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 828
INDIRB
ASGNB 12
line 3274
;3274:		return;
ADDRGP4 $1114
JUMPV
LABELV $1119
line 3279
;3275:	}
;3276:	//
;3277:	//BotAI_Print(PRT_MESSAGE, "client %d: aiming at client %d\n", bs->entitynum, bs->enemy);
;3278:	//
;3279:	aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 16
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 984
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 984
INDIRF4
ASGNF4
line 3280
;3280:	aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 988
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 988
INDIRF4
ASGNF4
line 3282
;3281:	//
;3282:	if (aim_skill > 0.95) {
ADDRLP4 736
INDIRF4
CNSTF4 1064514355
LEF4 $1126
line 3284
;3283:		//don't aim too early
;3284:		reactiontime = 0.5 * trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 992
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 856
CNSTF4 1056964608
ADDRLP4 992
INDIRF4
MULF4
ASGNF4
line 3285
;3285:		if (bs->enemysight_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 856
INDIRF4
SUBF4
LEF4 $1128
ADDRGP4 $1114
JUMPV
LABELV $1128
line 3286
;3286:		if (bs->teleport_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 856
INDIRF4
SUBF4
LEF4 $1130
ADDRGP4 $1114
JUMPV
LABELV $1130
line 3287
;3287:	}
LABELV $1126
line 3290
;3288:
;3289:	//get the weapon information
;3290:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
ADDRLP4 992
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 992
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 992
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
ARGP4
ADDRGP4 trap_BotGetWeaponInfo
CALLV
pop
line 3292
;3291:	//get the weapon specific aim accuracy and or aim skill
;3292:	if (wi.number == WP_MACHINEGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 2
NEI4 $1132
line 3293
;3293:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_MACHINEGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3294
;3294:	}
ADDRGP4 $1133
JUMPV
LABELV $1132
line 3295
;3295:	else if (wi.number == WP_SHOTGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 3
NEI4 $1135
line 3296
;3296:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_SHOTGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 9
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3297
;3297:	}
ADDRGP4 $1136
JUMPV
LABELV $1135
line 3298
;3298:	else if (wi.number == WP_GRENADE_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1138
line 3299
;3299:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_GRENADELAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 11
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3300
;3300:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_GRENADELAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 18
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3301
;3301:	}
ADDRGP4 $1139
JUMPV
LABELV $1138
line 3302
;3302:	else if (wi.number == WP_ROCKET_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 5
NEI4 $1141
line 3303
;3303:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_ROCKETLAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3304
;3304:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_ROCKETLAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 17
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3305
;3305:	}
ADDRGP4 $1142
JUMPV
LABELV $1141
line 3306
;3306:	else if (wi.number == WP_LIGHTNING) {
ADDRLP4 160+4
INDIRI4
CNSTI4 6
NEI4 $1144
line 3307
;3307:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_LIGHTNING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3308
;3308:	}
ADDRGP4 $1145
JUMPV
LABELV $1144
line 3309
;3309:	else if (wi.number == WP_RAILGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $1147
line 3310
;3310:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_RAILGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 14
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3311
;3311:	}
ADDRGP4 $1148
JUMPV
LABELV $1147
line 3312
;3312:	else if (wi.number == WP_PLASMAGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 8
NEI4 $1150
line 3313
;3313:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_PLASMAGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3314
;3314:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_PLASMAGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 19
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3315
;3315:	}
ADDRGP4 $1151
JUMPV
LABELV $1150
line 3316
;3316:	else if (wi.number == WP_BFG) {
ADDRLP4 160+4
INDIRI4
CNSTI4 9
NEI4 $1153
line 3317
;3317:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_BFG10K, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 15
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3318
;3318:		aim_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_BFG10K, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 20
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3319
;3319:	}
LABELV $1153
LABELV $1151
LABELV $1148
LABELV $1145
LABELV $1142
LABELV $1139
LABELV $1136
LABELV $1133
line 3321
;3320:	//
;3321:	if (aim_accuracy <= 0) aim_accuracy = 0.0001f;
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1156
ADDRLP4 156
CNSTF4 953267991
ASGNF4
LABELV $1156
line 3323
;3322:	//get the enemy entity information
;3323:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3325
;3324:	//if the enemy is invisible then shoot crappy most of the time
;3325:	if (EntityIsInvisible(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 996
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
EQI4 $1158
line 3326
;3326:		if (random() > 0.1) aim_accuracy *= 0.4f;
ADDRLP4 1000
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1036831949
LEF4 $1160
ADDRLP4 156
CNSTF4 1053609165
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
LABELV $1160
line 3327
;3327:	}
LABELV $1158
line 3329
;3328:	//
;3329:	VectorSubtract(entinfo.origin, entinfo.lastvisorigin, enemyvelocity);
ADDRLP4 712
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 712+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 712+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3330
;3330:	VectorScale(enemyvelocity, 1 / entinfo.update_time, enemyvelocity);
ADDRLP4 1000
CNSTF4 1065353216
ASGNF4
ADDRLP4 712
ADDRLP4 712
INDIRF4
ADDRLP4 1000
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 712+4
ADDRLP4 712+4
INDIRF4
ADDRLP4 1000
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 712+8
ADDRLP4 712+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
line 3332
;3331:	//enemy origin and velocity is remembered every 0.5 seconds
;3332:	if (bs->enemyposition_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1181
line 3334
;3333:		//
;3334:		bs->enemyposition_time = FloatTime() + 0.5;
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 3335
;3335:		VectorCopy(enemyvelocity, bs->enemyvelocity);
ADDRFP4 0
INDIRP4
CNSTI4 6232
ADDP4
ADDRLP4 712
INDIRB
ASGNB 12
line 3336
;3336:		VectorCopy(entinfo.origin, bs->enemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 6244
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3337
;3337:	}
LABELV $1181
line 3339
;3338:	//if not extremely skilled
;3339:	if (aim_skill < 0.9) {
ADDRLP4 736
INDIRF4
CNSTF4 1063675494
GEF4 $1184
line 3340
;3340:		VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
ADDRLP4 1004
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1004
INDIRP4
CNSTI4 6244
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1004
INDIRP4
CNSTI4 6248
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 6252
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3342
;3341:		//if the enemy moved a bit
;3342:		if (VectorLengthSquared(dir) > Square(48)) {
ADDRLP4 140
ARGP4
ADDRLP4 1008
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1008
INDIRF4
CNSTF4 1158676480
LEF4 $1193
line 3344
;3343:			//if the enemy changed direction
;3344:			if (DotProduct(bs->enemyvelocity, enemyvelocity) < 0) {
ADDRLP4 1012
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1012
INDIRP4
CNSTI4 6232
ADDP4
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ADDRLP4 1012
INDIRP4
CNSTI4 6236
ADDP4
INDIRF4
ADDRLP4 712+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1012
INDIRP4
CNSTI4 6240
ADDP4
INDIRF4
ADDRLP4 712+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $1195
line 3346
;3345:				//aim accuracy should be worse now
;3346:				aim_accuracy *= 0.7f;
ADDRLP4 156
CNSTF4 1060320051
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
line 3347
;3347:			}
LABELV $1195
line 3348
;3348:		}
LABELV $1193
line 3349
;3349:	}
LABELV $1184
line 3351
;3350:	//check visibility of enemy
;3351:	enemyvisible = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy);
ADDRLP4 1004
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1004
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 1004
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 1004
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 1004
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 1008
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 824
ADDRLP4 1008
INDIRF4
CVFI4 4
ASGNI4
line 3353
;3352:	//if the enemy is visible
;3353:	if (enemyvisible) {
ADDRLP4 824
INDIRI4
CNSTI4 0
EQI4 $1199
line 3355
;3354:		//
;3355:		VectorCopy(entinfo.origin, bestorigin);
ADDRLP4 724
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3356
;3356:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3359
;3357:		//get the start point shooting from
;3358:		//NOTE: the x and y projectile start offsets are ignored
;3359:		VectorCopy(bs->origin, start);
ADDRLP4 844
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3360
;3360:		start[2] += bs->cur_ps.viewheight;
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3361
;3361:		start[2] += wi.offset[2];
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRLP4 160+292+8
INDIRF4
ADDF4
ASGNF4
line 3363
;3362:		//
;3363:		BotAI_Trace(&trace, start, mins, maxs, bestorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 844
ARGP4
ADDRLP4 860
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 724
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3365
;3364:		//if the enemy is NOT hit
;3365:		if (trace.fraction <= 1 && trace.ent != entinfo.number) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
GTF4 $1207
ADDRLP4 740+80
INDIRI4
ADDRLP4 0+20
INDIRI4
EQI4 $1207
line 3366
;3366:			bestorigin[2] += 16;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 3367
;3367:		}
LABELV $1207
line 3369
;3368:		//if it is not an instant hit weapon the bot might want to predict the enemy
;3369:		if (wi.speed) {
ADDRLP4 160+272
INDIRF4
CNSTF4 0
EQF4 $1213
line 3371
;3370:			//
;3371:			VectorSubtract(bestorigin, bs->origin, dir);
ADDRLP4 1012
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 724
INDIRF4
ADDRLP4 1012
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1012
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 724+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3372
;3372:			dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1016
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1016
INDIRF4
ASGNF4
line 3373
;3373:			VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
ADDRLP4 1020
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1020
INDIRP4
CNSTI4 6244
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1020
INDIRP4
CNSTI4 6248
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 6252
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3375
;3374:			//if the enemy is NOT pretty far away and strafing just small steps left and right
;3375:			if (!(dist > 100 && VectorLengthSquared(dir) < Square(32))) {
ADDRLP4 840
INDIRF4
CNSTF4 1120403456
LEF4 $1229
ADDRLP4 140
ARGP4
ADDRLP4 1024
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1024
INDIRF4
CNSTF4 1149239296
LTF4 $1227
LABELV $1229
line 3377
;3376:				//if skilled anough do exact prediction
;3377:				if (aim_skill > 0.8 &&
ADDRLP4 736
INDIRF4
CNSTF4 1061997773
LEF4 $1230
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1230
line 3379
;3378:						//if the weapon is ready to fire
;3379:						bs->cur_ps.weaponstate == WEAPON_READY) {
line 3383
;3380:					aas_clientmove_t move;
;3381:					vec3_t origin;
;3382:
;3383:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1124
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1124
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3385
;3384:					//distance towards the enemy
;3385:					dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1128
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1128
INDIRF4
ASGNF4
line 3387
;3386:					//direction the enemy is moving in
;3387:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3389
;3388:					//
;3389:					VectorScale(dir, 1 / entinfo.update_time, dir);
ADDRLP4 1132
CNSTF4 1065353216
ASGNF4
ADDRLP4 140
ADDRLP4 140
INDIRF4
ADDRLP4 1132
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 140+4
INDIRF4
ADDRLP4 1132
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 140+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
line 3391
;3390:					//
;3391:					VectorCopy(entinfo.origin, origin);
ADDRLP4 1028
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3392
;3392:					origin[2] += 1;
ADDRLP4 1028+8
ADDRLP4 1028+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3394
;3393:					//
;3394:					VectorClear(cmdmove);
ADDRLP4 1136
CNSTF4 0
ASGNF4
ADDRLP4 968+8
ADDRLP4 1136
INDIRF4
ASGNF4
ADDRLP4 968+4
ADDRLP4 1136
INDIRF4
ASGNF4
ADDRLP4 968
ADDRLP4 1136
INDIRF4
ASGNF4
line 3396
;3395:					//AAS_ClearShownDebugLines();
;3396:					trap_AAS_PredictClientMovement(&move, bs->enemy, origin,
ADDRLP4 1040
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 1140
CNSTI4 0
ASGNI4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRLP4 140
ARGP4
ADDRLP4 968
ARGP4
ADDRLP4 1140
INDIRI4
ARGI4
CNSTF4 1092616192
ADDRLP4 840
INDIRF4
MULF4
ADDRLP4 160+272
INDIRF4
DIVF4
CVFI4 4
ARGI4
CNSTF4 1036831949
ARGF4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRLP4 1140
INDIRI4
ARGI4
ADDRGP4 trap_AAS_PredictClientMovement
CALLI4
pop
line 3400
;3397:														PRESENCE_CROUCH, qfalse,
;3398:														dir, cmdmove, 0,
;3399:														dist * 10 / wi.speed, 0.1f, 0, 0, qfalse);
;3400:					VectorCopy(move.endpos, bestorigin);
ADDRLP4 724
ADDRLP4 1040
INDIRB
ASGNB 12
line 3402
;3401:					//BotAI_Print(PRT_MESSAGE, "%1.1f predicted speed = %f, frames = %f\n", FloatTime(), VectorLength(dir), dist * 10 / wi.speed);
;3402:				}
ADDRGP4 $1231
JUMPV
LABELV $1230
line 3404
;3403:				//if not that skilled do linear prediction
;3404:				else if (aim_skill > 0.4) {
ADDRLP4 736
INDIRF4
CNSTF4 1053609165
LEF4 $1263
line 3405
;3405:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1028
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1028
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3407
;3406:					//distance towards the enemy
;3407:					dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1032
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1032
INDIRF4
ASGNF4
line 3409
;3408:					//direction the enemy is moving in
;3409:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3410
;3410:					dir[2] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 3412
;3411:					//
;3412:					speed = VectorNormalize(dir) / entinfo.update_time;
ADDRLP4 140
ARGP4
ADDRLP4 1036
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 980
ADDRLP4 1036
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
ASGNF4
line 3415
;3413:					//botimport.Print(PRT_MESSAGE, "speed = %f, wi->speed = %f\n", speed, wi->speed);
;3414:					//best spot to aim at
;3415:					VectorMA(entinfo.origin, (dist / wi.speed) * speed, dir, bestorigin);
ADDRLP4 1040
ADDRLP4 840
INDIRF4
ASGNF4
ADDRLP4 1044
ADDRLP4 980
INDIRF4
ASGNF4
ADDRLP4 724
ADDRLP4 0+24
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 1040
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 1044
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 724+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 140+4
INDIRF4
ADDRLP4 1040
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 1044
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 724+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 140+8
INDIRF4
ADDRLP4 840
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 980
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 3416
;3416:				}
LABELV $1263
LABELV $1231
line 3417
;3417:			}
LABELV $1227
line 3418
;3418:		}
LABELV $1213
line 3420
;3419:		//if the projectile does radial damage
;3420:		if (aim_skill > 0.6 && wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 736
INDIRF4
CNSTF4 1058642330
LEF4 $1298
ADDRLP4 160+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1298
line 3422
;3421:			//if the enemy isn't standing significantly higher than the bot
;3422:			if (entinfo.origin[2] < bs->origin[2] + 16) {
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
GEF4 $1302
line 3424
;3423:				//try to aim at the ground in front of the enemy
;3424:				VectorCopy(entinfo.origin, end);
ADDRLP4 956
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3425
;3425:				end[2] -= 64;
ADDRLP4 956+8
ADDRLP4 956+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 3426
;3426:				BotAI_Trace(&trace, entinfo.origin, NULL, NULL, end, entinfo.number, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 1012
CNSTP4 0
ASGNP4
ADDRLP4 1012
INDIRP4
ARGP4
ADDRLP4 1012
INDIRP4
ARGP4
ADDRLP4 956
ARGP4
ADDRLP4 0+20
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3428
;3427:				//
;3428:				VectorCopy(bestorigin, groundtarget);
ADDRLP4 944
ADDRLP4 724
INDIRB
ASGNB 12
line 3429
;3429:				if (trace.startsolid) groundtarget[2] = entinfo.origin[2] - 16;
ADDRLP4 740+4
INDIRI4
CNSTI4 0
EQI4 $1310
ADDRLP4 944+8
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
ADDRGP4 $1311
JUMPV
LABELV $1310
line 3430
;3430:				else groundtarget[2] = trace.endpos[2] - 8;
ADDRLP4 944+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
LABELV $1311
line 3432
;3431:				//trace a line from projectile start to ground target
;3432:				BotAI_Trace(&trace, start, NULL, NULL, groundtarget, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 844
ARGP4
ADDRLP4 1016
CNSTP4 0
ASGNP4
ADDRLP4 1016
INDIRP4
ARGP4
ADDRLP4 1016
INDIRP4
ARGP4
ADDRLP4 944
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3434
;3433:				//if hitpoint is not vertically too far from the ground target
;3434:				if (fabs(trace.endpos[2] - groundtarget[2]) < 50) {
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 944+8
INDIRF4
SUBF4
ARGF4
ADDRLP4 1020
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 1020
INDIRF4
CNSTF4 1112014848
GEF4 $1319
line 3435
;3435:					VectorSubtract(trace.endpos, groundtarget, dir);
ADDRLP4 140
ADDRLP4 740+12
INDIRF4
ADDRLP4 944
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 740+12+4
INDIRF4
ADDRLP4 944+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 944+8
INDIRF4
SUBF4
ASGNF4
line 3437
;3436:					//if the hitpoint is near anough the ground target
;3437:					if (VectorLengthSquared(dir) < Square(60)) {
ADDRLP4 140
ARGP4
ADDRLP4 1024
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1024
INDIRF4
CNSTF4 1163984896
GEF4 $1333
line 3438
;3438:						VectorSubtract(trace.endpos, start, dir);
ADDRLP4 140
ADDRLP4 740+12
INDIRF4
ADDRLP4 844
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 740+12+4
INDIRF4
ADDRLP4 844+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 844+8
INDIRF4
SUBF4
ASGNF4
line 3440
;3439:						//if the hitpoint is far anough from the bot
;3440:						if (VectorLengthSquared(dir) > Square(100)) {
ADDRLP4 140
ARGP4
ADDRLP4 1028
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1028
INDIRF4
CNSTF4 1176256512
LEF4 $1344
line 3442
;3441:							//check if the bot is visible from the ground target
;3442:							trace.endpos[2] += 1;
ADDRLP4 740+12+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3443
;3443:							BotAI_Trace(&trace, trace.endpos, NULL, NULL, entinfo.origin, entinfo.number, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 740+12
ARGP4
ADDRLP4 1032
CNSTP4 0
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 0+20
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3444
;3444:							if (trace.fraction >= 1) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
LTF4 $1351
line 3446
;3445:								//botimport.Print(PRT_MESSAGE, "%1.1f aiming at ground\n", AAS_Time());
;3446:								VectorCopy(groundtarget, bestorigin);
ADDRLP4 724
ADDRLP4 944
INDIRB
ASGNB 12
line 3447
;3447:							}
LABELV $1351
line 3448
;3448:						}
LABELV $1344
line 3449
;3449:					}
LABELV $1333
line 3450
;3450:				}
LABELV $1319
line 3451
;3451:			}
LABELV $1302
line 3452
;3452:		}
LABELV $1298
line 3453
;3453:		bestorigin[0] += 20 * crandom() * (1 - aim_accuracy);
ADDRLP4 1012
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724
ADDRLP4 724
INDIRF4
CNSTF4 1101004800
CNSTF4 1073741824
ADDRLP4 1012
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3454
;3454:		bestorigin[1] += 20 * crandom() * (1 - aim_accuracy);
ADDRLP4 1016
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724+4
ADDRLP4 724+4
INDIRF4
CNSTF4 1101004800
CNSTF4 1073741824
ADDRLP4 1016
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3455
;3455:		bestorigin[2] += 10 * crandom() * (1 - aim_accuracy);
ADDRLP4 1020
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1092616192
CNSTF4 1073741824
ADDRLP4 1020
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3456
;3456:	}
ADDRGP4 $1200
JUMPV
LABELV $1199
line 3457
;3457:	else {
line 3459
;3458:		//
;3459:		VectorCopy(bs->lastenemyorigin, bestorigin);
ADDRLP4 724
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 3460
;3460:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3462
;3461:		//if the bot is skilled anough
;3462:		if (aim_skill > 0.5) {
ADDRLP4 736
INDIRF4
CNSTF4 1056964608
LEF4 $1357
line 3464
;3463:			//do prediction shots around corners
;3464:			if (wi.number == WP_BFG ||
ADDRLP4 160+4
INDIRI4
CNSTI4 9
EQI4 $1365
ADDRLP4 160+4
INDIRI4
CNSTI4 5
EQI4 $1365
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1359
LABELV $1365
line 3466
;3465:				wi.number == WP_ROCKET_LAUNCHER ||
;3466:				wi.number == WP_GRENADE_LAUNCHER) {
line 3468
;3467:				//create the chase goal
;3468:				goal.entitynum = bs->client;
ADDRLP4 884+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 3469
;3469:				goal.areanum = bs->areanum;
ADDRLP4 884+12
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3470
;3470:				VectorCopy(bs->eye, goal.origin);
ADDRLP4 884
ADDRFP4 0
INDIRP4
CNSTI4 4936
ADDP4
INDIRB
ASGNB 12
line 3471
;3471:				VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 884+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+8
CNSTF4 3238002688
ASGNF4
line 3472
;3472:				VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 884+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+8
CNSTF4 1090519040
ASGNF4
line 3474
;3473:				//
;3474:				if (trap_BotPredictVisiblePosition(bs->lastenemyorigin, bs->lastenemyareanum, &goal, TFL_DEFAULT, target)) {
ADDRLP4 1012
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1012
INDIRP4
CNSTI4 6548
ADDP4
ARGP4
ADDRLP4 1012
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ARGI4
ADDRLP4 884
ARGP4
CNSTI4 18616254
ARGI4
ADDRLP4 828
ARGP4
ADDRLP4 1016
ADDRGP4 trap_BotPredictVisiblePosition
CALLI4
ASGNI4
ADDRLP4 1016
INDIRI4
CNSTI4 0
EQI4 $1378
line 3475
;3475:					VectorSubtract(target, bs->eye, dir);
ADDRLP4 1020
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 828
INDIRF4
ADDRLP4 1020
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 828+4
INDIRF4
ADDRLP4 1020
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 828+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3476
;3476:					if (VectorLengthSquared(dir) > Square(80)) {
ADDRLP4 140
ARGP4
ADDRLP4 1024
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1024
INDIRF4
CNSTF4 1170735104
LEF4 $1384
line 3477
;3477:						VectorCopy(target, bestorigin);
ADDRLP4 724
ADDRLP4 828
INDIRB
ASGNB 12
line 3478
;3478:						bestorigin[2] -= 20;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 3479
;3479:					}
LABELV $1384
line 3480
;3480:				}
LABELV $1378
line 3481
;3481:				aim_accuracy = 1;
ADDRLP4 156
CNSTF4 1065353216
ASGNF4
line 3482
;3482:			}
LABELV $1359
line 3483
;3483:		}
LABELV $1357
line 3484
;3484:	}
LABELV $1200
line 3486
;3485:	//
;3486:	if (enemyvisible) {
ADDRLP4 824
INDIRI4
CNSTI4 0
EQI4 $1387
line 3487
;3487:		BotAI_Trace(&trace, bs->eye, NULL, NULL, bestorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 1012
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1012
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 1016
CNSTP4 0
ASGNP4
ADDRLP4 1016
INDIRP4
ARGP4
ADDRLP4 1016
INDIRP4
ARGP4
ADDRLP4 724
ARGP4
ADDRLP4 1012
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3488
;3488:		VectorCopy(trace.endpos, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 740+12
INDIRB
ASGNB 12
line 3489
;3489:	}
ADDRGP4 $1388
JUMPV
LABELV $1387
line 3490
;3490:	else {
line 3491
;3491:		VectorCopy(bestorigin, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 724
INDIRB
ASGNB 12
line 3492
;3492:	}
LABELV $1388
line 3494
;3493:	//get aim direction
;3494:	VectorSubtract(bestorigin, bs->eye, dir);
ADDRLP4 1012
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 724
INDIRF4
ADDRLP4 1012
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1012
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 724+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3496
;3495:	//
;3496:	if (wi.number == WP_MACHINEGUN ||
ADDRLP4 160+4
INDIRI4
CNSTI4 2
EQI4 $1402
ADDRLP4 160+4
INDIRI4
CNSTI4 3
EQI4 $1402
ADDRLP4 160+4
INDIRI4
CNSTI4 6
EQI4 $1402
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $1394
LABELV $1402
line 3499
;3497:		wi.number == WP_SHOTGUN ||
;3498:		wi.number == WP_LIGHTNING ||
;3499:		wi.number == WP_RAILGUN) {
line 3501
;3500:		//distance towards the enemy
;3501:		dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1016
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1016
INDIRF4
ASGNF4
line 3502
;3502:		if (dist > 150) dist = 150;
ADDRLP4 840
INDIRF4
CNSTF4 1125515264
LEF4 $1403
ADDRLP4 840
CNSTF4 1125515264
ASGNF4
LABELV $1403
line 3503
;3503:		f = 0.6 + dist / 150 * 0.4;
ADDRLP4 940
CNSTF4 1053609165
ADDRLP4 840
INDIRF4
CNSTF4 1125515264
DIVF4
MULF4
CNSTF4 1058642330
ADDF4
ASGNF4
line 3504
;3504:		aim_accuracy *= f;
ADDRLP4 156
ADDRLP4 156
INDIRF4
ADDRLP4 940
INDIRF4
MULF4
ASGNF4
line 3505
;3505:	}
LABELV $1394
line 3507
;3506:	//add some random stuff to the aim direction depending on the aim accuracy
;3507:	if (aim_accuracy < 0.8) {
ADDRLP4 156
INDIRF4
CNSTF4 1061997773
GEF4 $1405
line 3508
;3508:		VectorNormalize(dir);
ADDRLP4 140
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3509
;3509:		for (i = 0; i < 3; i++) dir[i] += 0.3 * crandom() * (1 - aim_accuracy);
ADDRLP4 152
CNSTI4 0
ASGNI4
LABELV $1407
ADDRLP4 1016
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1020
ADDRLP4 152
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
ADDP4
ASGNP4
ADDRLP4 1020
INDIRP4
ADDRLP4 1020
INDIRP4
INDIRF4
CNSTF4 1050253722
CNSTF4 1073741824
ADDRLP4 1016
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
LABELV $1408
ADDRLP4 152
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 3
LTI4 $1407
line 3510
;3510:	}
LABELV $1405
line 3512
;3511:	//set the ideal view angles
;3512:	vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3514
;3513:	//take the weapon spread into account for lower skilled bots
;3514:	bs->ideal_viewangles[PITCH] += 6 * wi.vspread * crandom() * (1 - aim_accuracy);
ADDRLP4 1016
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1020
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1020
INDIRP4
ADDRLP4 1020
INDIRP4
INDIRF4
CNSTF4 1086324736
ADDRLP4 160+268
INDIRF4
MULF4
CNSTF4 1073741824
ADDRLP4 1016
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3515
;3515:	bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1024
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1028
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1024
INDIRP4
ADDRLP4 1028
INDIRF4
ASGNF4
line 3516
;3516:	bs->ideal_viewangles[YAW] += 6 * wi.hspread * crandom() * (1 - aim_accuracy);
ADDRLP4 1032
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRF4
CNSTF4 1086324736
ADDRLP4 160+264
INDIRF4
MULF4
CNSTF4 1073741824
ADDRLP4 1032
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3517
;3517:	bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
ADDRLP4 1040
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1044
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1040
INDIRP4
ADDRLP4 1044
INDIRF4
ASGNF4
line 3519
;3518:	//if the bots should be really challenging
;3519:	if (bot_challenge.integer) {
ADDRGP4 bot_challenge+12
INDIRI4
CNSTI4 0
EQI4 $1413
line 3521
;3520:		//if the bot is really accurate and has the enemy in view for some time
;3521:		if (aim_accuracy > 0.9 && bs->enemysight_time < FloatTime() - 1) {
ADDRLP4 156
INDIRF4
CNSTF4 1063675494
LEF4 $1416
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $1416
line 3523
;3522:			//set the view angles directly
;3523:			if (bs->ideal_viewangles[PITCH] > 180) bs->ideal_viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $1418
ADDRLP4 1048
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $1418
line 3524
;3524:			VectorCopy(bs->ideal_viewangles, bs->viewangles);
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CNSTI4 6564
ADDP4
ADDRLP4 1052
INDIRP4
CNSTI4 6576
ADDP4
INDIRB
ASGNB 12
line 3525
;3525:			trap_EA_View(bs->client, bs->viewangles);
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1056
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRGP4 trap_EA_View
CALLV
pop
line 3526
;3526:		}
LABELV $1416
line 3527
;3527:	}
LABELV $1413
line 3528
;3528:}
LABELV $1114
endproc BotAimAtEnemy 1144 52
lit
align 4
LABELV $1421
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $1422
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCheckAttack
code
proc BotCheckAttack 1028 28
line 3535
;3529:
;3530:/*
;3531:==================
;3532:BotCheckAttack
;3533:==================
;3534:*/
;3535:void BotCheckAttack(bot_state_t *bs) {
line 3544
;3536:	float points, reactiontime, fov, firethrottle;
;3537:	int attackentity;
;3538:	bsp_trace_t bsptrace;
;3539:	//float selfpreservation;
;3540:	vec3_t forward, right, start, end, dir, angles;
;3541:	weaponinfo_t wi;
;3542:	bsp_trace_t trace;
;3543:	aas_entityinfo_t entinfo;
;3544:	vec3_t mins = {-8, -8, -8}, maxs = {8, 8, 8};
ADDRLP4 808
ADDRGP4 $1421
INDIRB
ASGNB 12
ADDRLP4 820
ADDRGP4 $1422
INDIRB
ASGNB 12
line 3546
;3545:
;3546:	attackentity = bs->enemy;
ADDRLP4 576
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 3548
;3547:	//
;3548:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 576
INDIRI4
ARGI4
ADDRLP4 832
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3550
;3549:	// if not attacking a player
;3550:	if (attackentity >= MAX_CLIENTS) {
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $1423
line 3562
;3551:#ifdef MISSIONPACK
;3552:		// if attacking an obelisk
;3553:		if ( entinfo.number == redobelisk.entitynum ||
;3554:			entinfo.number == blueobelisk.entitynum ) {
;3555:			// if obelisk is respawning return
;3556:			if ( g_entities[entinfo.number].activator &&
;3557:				g_entities[entinfo.number].activator->s.frame == 2 ) {
;3558:				return;
;3559:			}
;3560:		}
;3561:#endif
;3562:	}
LABELV $1423
line 3564
;3563:	//
;3564:	reactiontime = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 976
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 700
ADDRLP4 976
INDIRF4
ASGNF4
line 3565
;3565:	if (bs->enemysight_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 700
INDIRF4
SUBF4
LEF4 $1425
ADDRGP4 $1420
JUMPV
LABELV $1425
line 3566
;3566:	if (bs->teleport_time > FloatTime() - reactiontime) return;
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 700
INDIRF4
SUBF4
LEF4 $1427
ADDRGP4 $1420
JUMPV
LABELV $1427
line 3568
;3567:	//if changing weapons
;3568:	if (bs->weaponchange_time > FloatTime() - 0.1) return;
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1036831949
SUBF4
LEF4 $1429
ADDRGP4 $1420
JUMPV
LABELV $1429
line 3570
;3569:	//check fire throttle characteristic
;3570:	if (bs->firethrottlewait_time > FloatTime()) return;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1431
ADDRGP4 $1420
JUMPV
LABELV $1431
line 3571
;3571:	firethrottle = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_FIRETHROTTLE, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 47
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 980
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 792
ADDRLP4 980
INDIRF4
ASGNF4
line 3572
;3572:	if (bs->firethrottleshoot_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1433
line 3573
;3573:		if (random() > firethrottle) {
ADDRLP4 984
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 984
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 792
INDIRF4
LEF4 $1435
line 3574
;3574:			bs->firethrottlewait_time = FloatTime() + firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 792
INDIRF4
ADDF4
ASGNF4
line 3575
;3575:			bs->firethrottleshoot_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
CNSTF4 0
ASGNF4
line 3576
;3576:		}
ADDRGP4 $1436
JUMPV
LABELV $1435
line 3577
;3577:		else {
line 3578
;3578:			bs->firethrottleshoot_time = FloatTime() + 1 - firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 792
INDIRF4
SUBF4
ASGNF4
line 3579
;3579:			bs->firethrottlewait_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
CNSTF4 0
ASGNF4
line 3580
;3580:		}
LABELV $1436
line 3581
;3581:	}
LABELV $1433
line 3584
;3582:	//
;3583:	//
;3584:	VectorSubtract(bs->aimtarget, bs->eye, dir);
ADDRLP4 984
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 580
ADDRLP4 984
INDIRP4
CNSTI4 6220
ADDP4
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 580+4
ADDRLP4 984
INDIRP4
CNSTI4 6224
ADDP4
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 988
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 580+8
ADDRLP4 988
INDIRP4
CNSTI4 6228
ADDP4
INDIRF4
ADDRLP4 988
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3586
;3585:	//
;3586:	if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1439
line 3587
;3587:		if (VectorLengthSquared(dir) > Square(60)) {
ADDRLP4 580
ARGP4
ADDRLP4 992
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 992
INDIRF4
CNSTF4 1163984896
LEF4 $1441
line 3588
;3588:			return;
ADDRGP4 $1420
JUMPV
LABELV $1441
line 3590
;3589:		}
;3590:	}
LABELV $1439
line 3591
;3591:	if (VectorLengthSquared(dir) < Square(100))
ADDRLP4 580
ARGP4
ADDRLP4 992
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 992
INDIRF4
CNSTF4 1176256512
GEF4 $1443
line 3592
;3592:		fov = 120;
ADDRLP4 788
CNSTF4 1123024896
ASGNF4
ADDRGP4 $1444
JUMPV
LABELV $1443
line 3594
;3593:	else
;3594:		fov = 50;
ADDRLP4 788
CNSTF4 1112014848
ASGNF4
LABELV $1444
line 3596
;3595:	//
;3596:	vectoangles(dir, angles);
ADDRLP4 580
ARGP4
ADDRLP4 796
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3597
;3597:	if (!InFieldOfVision(bs->viewangles, fov, angles))
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 788
INDIRF4
ARGF4
ADDRLP4 796
ARGP4
ADDRLP4 996
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
NEI4 $1445
line 3598
;3598:		return;
ADDRGP4 $1420
JUMPV
LABELV $1445
line 3599
;3599:	BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, bs->aimtarget, bs->client, CONTENTS_SOLID|CONTENTS_PLAYERCLIP);
ADDRLP4 704
ARGP4
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1000
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 1004
CNSTP4 0
ASGNP4
ADDRLP4 1004
INDIRP4
ARGP4
ADDRLP4 1004
INDIRP4
ARGP4
ADDRLP4 1000
INDIRP4
CNSTI4 6220
ADDP4
ARGP4
ADDRLP4 1000
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 65537
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3600
;3600:	if (bsptrace.fraction < 1 && bsptrace.ent != attackentity)
ADDRLP4 704+8
INDIRF4
CNSTF4 1065353216
GEF4 $1447
ADDRLP4 704+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $1447
line 3601
;3601:		return;
ADDRGP4 $1420
JUMPV
LABELV $1447
line 3604
;3602:
;3603:	//get the weapon info
;3604:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 1008
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 trap_BotGetWeaponInfo
CALLV
pop
line 3606
;3605:	//get the start point shooting from
;3606:	VectorCopy(bs->origin, start);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3607
;3607:	start[2] += bs->cur_ps.viewheight;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3608
;3608:	AngleVectors(bs->viewangles, forward, right, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 676
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3609
;3609:	start[0] += forward[0] * wi.offset[0] + right[0] * wi.offset[1];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 3610
;3610:	start[1] += forward[1] * wi.offset[0] + right[1] * wi.offset[1];
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676+4
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 3611
;3611:	start[2] += forward[2] * wi.offset[0] + right[2] * wi.offset[1] + wi.offset[2];
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676+8
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+292+8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 3613
;3612:	//end point aiming at
;3613:	VectorMA(start, 1000, forward, end);
ADDRLP4 1012
CNSTF4 1148846080
ASGNF4
ADDRLP4 688
ADDRLP4 0
INDIRF4
ADDRLP4 1012
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 688+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1012
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 688+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1148846080
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3615
;3614:	//a little back to make sure not inside a very close enemy
;3615:	VectorMA(start, -12, forward, start);
ADDRLP4 1016
CNSTF4 3242196992
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 1016
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1016
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 3242196992
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3616
;3616:	BotAI_Trace(&trace, start, mins, maxs, end, bs->entitynum, MASK_SHOT);
ADDRLP4 592
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 808
ARGP4
ADDRLP4 820
ARGP4
ADDRLP4 688
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3618
;3617:	//if the entity is a client
;3618:	if (trace.ent > 0 && trace.ent <= MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
CNSTI4 0
LEI4 $1481
ADDRLP4 592+80
INDIRI4
CNSTI4 64
GTI4 $1481
line 3619
;3619:		if (trace.ent != attackentity) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $1485
line 3621
;3620:			//if a teammate is hit
;3621:			if (BotSameTeam(bs, trace.ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 592+80
INDIRI4
ARGI4
ADDRLP4 1020
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1020
INDIRI4
CNSTI4 0
EQI4 $1488
line 3622
;3622:				return;
ADDRGP4 $1420
JUMPV
LABELV $1488
line 3623
;3623:		}
LABELV $1485
line 3624
;3624:	}
LABELV $1481
line 3626
;3625:	//if won't hit the enemy or not attacking a player (obelisk)
;3626:	if (trace.ent != attackentity || attackentity >= MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
NEI4 $1494
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $1491
LABELV $1494
line 3628
;3627:		//if the projectile does radial damage
;3628:		if (wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 24+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1495
line 3629
;3629:			if (trace.fraction * 1000 < wi.proj.radius) {
CNSTF4 1148846080
ADDRLP4 592+8
INDIRF4
MULF4
ADDRLP4 24+344+172
INDIRF4
GEF4 $1499
line 3630
;3630:				points = (wi.proj.damage - 0.5 * trace.fraction * 1000) * 0.5;
ADDRLP4 1024
CNSTF4 1056964608
ASGNF4
ADDRLP4 972
ADDRLP4 1024
INDIRF4
ADDRLP4 24+344+168
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 1024
INDIRF4
ADDRLP4 592+8
INDIRF4
MULF4
MULF4
SUBF4
MULF4
ASGNF4
line 3631
;3631:				if (points > 0) {
ADDRLP4 972
INDIRF4
CNSTF4 0
LEF4 $1507
line 3632
;3632:					return;
ADDRGP4 $1420
JUMPV
LABELV $1507
line 3634
;3633:				}
;3634:			}
LABELV $1499
line 3636
;3635:			//FIXME: check if a teammate gets radial damage
;3636:		}
LABELV $1495
line 3637
;3637:	}
LABELV $1491
line 3639
;3638:	//if fire has to be release to activate weapon
;3639:	if (wi.flags & WFL_FIRERELEASED) {
ADDRLP4 24+176
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1509
line 3640
;3640:		if (bs->flags & BFL_ATTACKED) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1510
line 3641
;3641:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3642
;3642:		}
line 3643
;3643:	}
ADDRGP4 $1510
JUMPV
LABELV $1509
line 3644
;3644:	else {
line 3645
;3645:		trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3646
;3646:	}
LABELV $1510
line 3647
;3647:	bs->flags ^= BFL_ATTACKED;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 1024
INDIRP4
ADDRLP4 1024
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 3648
;3648:}
LABELV $1420
endproc BotCheckAttack 1028 28
lit
align 4
LABELV $1520
byte 4 1143930880
byte 4 1129054208
byte 4 1143472128
align 4
LABELV $1521
byte 4 1148256256
byte 4 1139408896
byte 4 1143603200
align 4
LABELV $1522
byte 4 1134034944
byte 4 1135607808
byte 4 1147535360
export BotMapScripts
code
proc BotMapScripts 1424 16
line 3655
;3649:
;3650:/*
;3651:==================
;3652:BotMapScripts
;3653:==================
;3654:*/
;3655:void BotMapScripts(bot_state_t *bs) {
line 3663
;3656:	char info[1024];
;3657:	char mapname[128];
;3658:	int i, shootbutton;
;3659:	float aim_accuracy;
;3660:	aas_entityinfo_t entinfo;
;3661:	vec3_t dir;
;3662:
;3663:	trap_GetServerinfo(info, sizeof(info));
ADDRLP4 272
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 3665
;3664:
;3665:	strncpy(mapname, Info_ValueForKey( info, "mapname" ), sizeof(mapname)-1);
ADDRLP4 272
ARGP4
ADDRGP4 $1515
ARGP4
ADDRLP4 1316
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 144
ARGP4
ADDRLP4 1316
INDIRP4
ARGP4
CNSTI4 127
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 3666
;3666:	mapname[sizeof(mapname)-1] = '\0';
ADDRLP4 144+127
CNSTI1 0
ASGNI1
line 3668
;3667:
;3668:	if (!Q_stricmp(mapname, "q3tourney6")) {
ADDRLP4 144
ARGP4
ADDRGP4 $1519
ARGP4
ADDRLP4 1320
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1320
INDIRI4
CNSTI4 0
NEI4 $1517
line 3669
;3669:		vec3_t mins = {700, 204, 672}, maxs = {964, 468, 680};
ADDRLP4 1324
ADDRGP4 $1520
INDIRB
ASGNB 12
ADDRLP4 1336
ADDRGP4 $1521
INDIRB
ASGNB 12
line 3670
;3670:		vec3_t buttonorg = {304, 352, 920};
ADDRLP4 1348
ADDRGP4 $1522
INDIRB
ASGNB 12
line 3672
;3671:		//NOTE: NEVER use the func_bobbing in q3tourney6
;3672:		bs->tfl &= ~TFL_FUNCBOB;
ADDRLP4 1360
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 1360
INDIRP4
ADDRLP4 1360
INDIRP4
INDIRI4
CNSTI4 -16777217
BANDI4
ASGNI4
line 3674
;3673:		//if the bot is below the bounding box
;3674:		if (bs->origin[0] > mins[0] && bs->origin[0] < maxs[0]) {
ADDRLP4 1364
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1364
INDIRF4
ADDRLP4 1324
INDIRF4
LEF4 $1523
ADDRLP4 1364
INDIRF4
ADDRLP4 1336
INDIRF4
GEF4 $1523
line 3675
;3675:			if (bs->origin[1] > mins[1] && bs->origin[1] < maxs[1]) {
ADDRLP4 1368
ADDRFP4 0
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1368
INDIRF4
ADDRLP4 1324+4
INDIRF4
LEF4 $1525
ADDRLP4 1368
INDIRF4
ADDRLP4 1336+4
INDIRF4
GEF4 $1525
line 3676
;3676:				if (bs->origin[2] < mins[2]) {
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 1324+8
INDIRF4
GEF4 $1529
line 3677
;3677:					return;
ADDRGP4 $1514
JUMPV
LABELV $1529
line 3679
;3678:				}
;3679:			}
LABELV $1525
line 3680
;3680:		}
LABELV $1523
line 3681
;3681:		shootbutton = qfalse;
ADDRLP4 1296
CNSTI4 0
ASGNI4
line 3683
;3682:		//if an enemy is below this bounding box then shoot the button
;3683:		for (i = 0; i < maxclients && i < MAX_CLIENTS; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $1535
JUMPV
LABELV $1532
line 3685
;3684:
;3685:			if (i == bs->client) continue;
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1536
ADDRGP4 $1533
JUMPV
LABELV $1536
line 3687
;3686:			//
;3687:			BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3689
;3688:			//
;3689:			if (!entinfo.valid) continue;
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1538
ADDRGP4 $1533
JUMPV
LABELV $1538
line 3691
;3690:			//if the enemy isn't dead and the enemy isn't the bot self
;3691:			if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum) continue;
ADDRLP4 0
ARGP4
ADDRLP4 1368
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 1368
INDIRI4
CNSTI4 0
NEI4 $1543
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $1540
LABELV $1543
ADDRGP4 $1533
JUMPV
LABELV $1540
line 3693
;3692:			//
;3693:			if (entinfo.origin[0] > mins[0] && entinfo.origin[0] < maxs[0]) {
ADDRLP4 0+24
INDIRF4
ADDRLP4 1324
INDIRF4
LEF4 $1544
ADDRLP4 0+24
INDIRF4
ADDRLP4 1336
INDIRF4
GEF4 $1544
line 3694
;3694:				if (entinfo.origin[1] > mins[1] && entinfo.origin[1] < maxs[1]) {
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1324+4
INDIRF4
LEF4 $1548
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1336+4
INDIRF4
GEF4 $1548
line 3695
;3695:					if (entinfo.origin[2] < mins[2]) {
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 1324+8
INDIRF4
GEF4 $1556
line 3697
;3696:						//if there's a team mate below the crusher
;3697:						if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 1372
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1372
INDIRI4
CNSTI4 0
EQI4 $1561
line 3698
;3698:							shootbutton = qfalse;
ADDRLP4 1296
CNSTI4 0
ASGNI4
line 3699
;3699:							break;
ADDRGP4 $1534
JUMPV
LABELV $1561
line 3701
;3700:						}
;3701:						else {
line 3702
;3702:							shootbutton = qtrue;
ADDRLP4 1296
CNSTI4 1
ASGNI4
line 3703
;3703:						}
line 3704
;3704:					}
LABELV $1556
line 3705
;3705:				}
LABELV $1548
line 3706
;3706:			}
LABELV $1544
line 3707
;3707:		}
LABELV $1533
line 3683
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1535
ADDRLP4 140
INDIRI4
ADDRGP4 maxclients
INDIRI4
GEI4 $1563
ADDRLP4 140
INDIRI4
CNSTI4 64
LTI4 $1532
LABELV $1563
LABELV $1534
line 3708
;3708:		if (shootbutton) {
ADDRLP4 1296
INDIRI4
CNSTI4 0
EQI4 $1518
line 3709
;3709:			bs->flags |= BFL_IDEALVIEWSET;
ADDRLP4 1372
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 1372
INDIRP4
ADDRLP4 1372
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 3710
;3710:			VectorSubtract(buttonorg, bs->eye, dir);
ADDRLP4 1376
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1300
ADDRLP4 1348
INDIRF4
ADDRLP4 1376
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1300+4
ADDRLP4 1348+4
INDIRF4
ADDRLP4 1376
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1300+8
ADDRLP4 1348+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3711
;3711:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 1300
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3712
;3712:			aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1380
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 1312
ADDRLP4 1380
INDIRF4
ASGNF4
line 3713
;3713:			bs->ideal_viewangles[PITCH] += 8 * crandom() * (1 - aim_accuracy);
ADDRLP4 1384
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1388
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1388
INDIRP4
ADDRLP4 1388
INDIRP4
INDIRF4
CNSTF4 1090519040
CNSTF4 1073741824
ADDRLP4 1384
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 1312
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3714
;3714:			bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
ADDRLP4 1392
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1392
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1396
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1392
INDIRP4
ADDRLP4 1396
INDIRF4
ASGNF4
line 3715
;3715:			bs->ideal_viewangles[YAW] += 8 * crandom() * (1 - aim_accuracy);
ADDRLP4 1400
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1404
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 1404
INDIRP4
ADDRLP4 1404
INDIRP4
INDIRF4
CNSTF4 1090519040
CNSTF4 1073741824
ADDRLP4 1400
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDRLP4 1312
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3716
;3716:			bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
ADDRLP4 1408
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 1408
INDIRP4
INDIRF4
ARGF4
ADDRLP4 1412
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1408
INDIRP4
ADDRLP4 1412
INDIRF4
ASGNF4
line 3718
;3717:			//
;3718:			if (InFieldOfVision(bs->viewangles, 20, bs->ideal_viewangles)) {
ADDRLP4 1416
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1416
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRLP4 1416
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRLP4 1420
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 1420
INDIRI4
CNSTI4 0
EQI4 $1518
line 3719
;3719:				trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3720
;3720:			}
line 3721
;3721:		}
line 3722
;3722:	}
ADDRGP4 $1518
JUMPV
LABELV $1517
line 3723
;3723:	else if (!Q_stricmp(mapname, "mpq3tourney6")) {
ADDRLP4 144
ARGP4
ADDRGP4 $1574
ARGP4
ADDRLP4 1324
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 0
NEI4 $1572
line 3725
;3724:		//NOTE: NEVER use the func_bobbing in mpq3tourney6
;3725:		bs->tfl &= ~TFL_FUNCBOB;
ADDRLP4 1328
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 1328
INDIRP4
ADDRLP4 1328
INDIRP4
INDIRI4
CNSTI4 -16777217
BANDI4
ASGNI4
line 3726
;3726:	}
LABELV $1572
LABELV $1518
line 3727
;3727:}
LABELV $1514
endproc BotMapScripts 1424 16
data
align 4
LABELV VEC_UP
byte 4 0
byte 4 3212836864
byte 4 0
align 4
LABELV MOVEDIR_UP
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV VEC_DOWN
byte 4 0
byte 4 3221225472
byte 4 0
align 4
LABELV MOVEDIR_DOWN
byte 4 0
byte 4 0
byte 4 3212836864
export BotSetMovedir
code
proc BotSetMovedir 12 16
line 3740
;3728:
;3729:/*
;3730:==================
;3731:BotSetMovedir
;3732:==================
;3733:*/
;3734:// bk001205 - made these static
;3735:static vec3_t VEC_UP		= {0, -1,  0};
;3736:static vec3_t MOVEDIR_UP	= {0,  0,  1};
;3737:static vec3_t VEC_DOWN		= {0, -2,  0};
;3738:static vec3_t MOVEDIR_DOWN	= {0,  0, -1};
;3739:
;3740:void BotSetMovedir(vec3_t angles, vec3_t movedir) {
line 3741
;3741:	if (VectorCompare(angles, VEC_UP)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VEC_UP
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1576
line 3742
;3742:		VectorCopy(MOVEDIR_UP, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_UP
INDIRB
ASGNB 12
line 3743
;3743:	}
ADDRGP4 $1577
JUMPV
LABELV $1576
line 3744
;3744:	else if (VectorCompare(angles, VEC_DOWN)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VEC_DOWN
ARGP4
ADDRLP4 4
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1578
line 3745
;3745:		VectorCopy(MOVEDIR_DOWN, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_DOWN
INDIRB
ASGNB 12
line 3746
;3746:	}
ADDRGP4 $1579
JUMPV
LABELV $1578
line 3747
;3747:	else {
line 3748
;3748:		AngleVectors(angles, movedir, NULL, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3749
;3749:	}
LABELV $1579
LABELV $1577
line 3750
;3750:}
LABELV $1575
endproc BotSetMovedir 12 16
export BotModelMinsMaxs
proc BotModelMinsMaxs 40 0
line 3759
;3751:
;3752:/*
;3753:==================
;3754:BotModelMinsMaxs
;3755:
;3756:this is ugly
;3757:==================
;3758:*/
;3759:int BotModelMinsMaxs(int modelindex, int eType, int contents, vec3_t mins, vec3_t maxs) {
line 3763
;3760:	gentity_t *ent;
;3761:	int i;
;3762:
;3763:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 3764
;3764:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1584
JUMPV
LABELV $1581
line 3765
;3765:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1586
line 3766
;3766:			continue;
ADDRGP4 $1582
JUMPV
LABELV $1586
line 3768
;3767:		}
;3768:		if ( eType && ent->s.eType != eType) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1588
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1588
line 3769
;3769:			continue;
ADDRGP4 $1582
JUMPV
LABELV $1588
line 3771
;3770:		}
;3771:		if ( contents && ent->r.contents != contents) {
ADDRLP4 12
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1590
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1590
line 3772
;3772:			continue;
ADDRGP4 $1582
JUMPV
LABELV $1590
line 3774
;3773:		}
;3774:		if (ent->s.modelindex == modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1592
line 3775
;3775:			if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1594
line 3776
;3776:				VectorAdd(ent->r.currentOrigin, ent->r.mins, mins);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $1594
line 3777
;3777:			if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1596
line 3778
;3778:				VectorAdd(ent->r.currentOrigin, ent->r.maxs, maxs);
ADDRFP4 16
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $1596
line 3779
;3779:			return i;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $1580
JUMPV
LABELV $1592
line 3781
;3780:		}
;3781:	}
LABELV $1582
line 3764
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
LABELV $1584
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1581
line 3782
;3782:	if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1598
line 3783
;3783:		VectorClear(mins);
ADDRLP4 8
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
LABELV $1598
line 3784
;3784:	if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1600
line 3785
;3785:		VectorClear(maxs);
ADDRLP4 16
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
LABELV $1600
line 3786
;3786:	return 0;
CNSTI4 0
RETI4
LABELV $1580
endproc BotModelMinsMaxs 40 0
lit
align 4
LABELV $1603
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $1604
byte 4 3212836864
byte 4 3212836864
byte 4 3212836864
export BotFuncButtonActivateGoal
code
proc BotFuncButtonActivateGoal 648 28
line 3794
;3787:}
;3788:
;3789:/*
;3790:==================
;3791:BotFuncButtonGoal
;3792:==================
;3793:*/
;3794:int BotFuncButtonActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 3800
;3795:	int i, areas[10], numareas, modelindex, entitynum;
;3796:	char model[128];
;3797:	float lip, dist, health, angle;
;3798:	vec3_t size, start, end, mins, maxs, angles, points[10];
;3799:	vec3_t movedir, origin, goalorigin, bboxmins, bboxmaxs;
;3800:	vec3_t extramins = {1, 1, 1}, extramaxs = {-1, -1, -1};
ADDRLP4 304
ADDRGP4 $1603
INDIRB
ASGNB 12
ADDRLP4 316
ADDRGP4 $1604
INDIRB
ASGNB 12
line 3803
;3801:	bsp_trace_t bsptrace;
;3802:
;3803:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 3804
;3804:	VectorClear(activategoal->target);
ADDRLP4 560
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 564
CNSTF4 0
ASGNF4
ADDRLP4 560
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 564
INDIRF4
ASGNF4
ADDRLP4 560
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 564
INDIRF4
ASGNF4
ADDRLP4 560
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 564
INDIRF4
ASGNF4
line 3806
;3805:	//create a bot goal towards the button
;3806:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $274
ARGP4
ADDRLP4 160
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3807
;3807:	if (!*model)
ADDRLP4 160
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1605
line 3808
;3808:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1602
JUMPV
LABELV $1605
line 3809
;3809:	modelindex = atoi(model+1);
ADDRLP4 160+1
ARGP4
ADDRLP4 568
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 288
ADDRLP4 568
INDIRI4
ASGNI4
line 3810
;3810:	if (!modelindex)
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $1608
line 3811
;3811:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1602
JUMPV
LABELV $1608
line 3812
;3812:	VectorClear(angles);
ADDRLP4 572
CNSTF4 0
ASGNF4
ADDRLP4 96+8
ADDRLP4 572
INDIRF4
ASGNF4
ADDRLP4 96+4
ADDRLP4 572
INDIRF4
ASGNF4
ADDRLP4 96
ADDRLP4 572
INDIRF4
ASGNF4
line 3813
;3813:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
ADDRLP4 288
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 576
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 344
ADDRLP4 576
INDIRI4
ASGNI4
line 3815
;3814:	//get the lip of the button
;3815:	trap_AAS_FloatForBSPEpairKey(bspent, "lip", &lip);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1612
ARGP4
ADDRLP4 328
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3816
;3816:	if (!lip) lip = 4;
ADDRLP4 328
INDIRF4
CNSTF4 0
NEF4 $1613
ADDRLP4 328
CNSTF4 1082130432
ASGNF4
LABELV $1613
line 3818
;3817:	//get the move direction from the angle
;3818:	trap_AAS_FloatForBSPEpairKey(bspent, "angle", &angle);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1615
ARGP4
ADDRLP4 352
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3819
;3819:	VectorSet(angles, 0, angle, 0);
ADDRLP4 96
CNSTF4 0
ASGNF4
ADDRLP4 96+4
ADDRLP4 352
INDIRF4
ASGNF4
ADDRLP4 96+8
CNSTF4 0
ASGNF4
line 3820
;3820:	BotSetMovedir(angles, movedir);
ADDRLP4 96
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BotSetMovedir
CALLV
pop
line 3822
;3821:	//button size
;3822:	VectorSubtract(maxs, mins, size);
ADDRLP4 112
ADDRLP4 84
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 72+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 72+8
INDIRF4
SUBF4
ASGNF4
line 3824
;3823:	//button origin
;3824:	VectorAdd(mins, maxs, origin);
ADDRLP4 16
ADDRLP4 72
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 72+4
INDIRF4
ADDRLP4 84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 72+8
INDIRF4
ADDRLP4 84+8
INDIRF4
ADDF4
ASGNF4
line 3825
;3825:	VectorScale(origin, 0.5, origin);
ADDRLP4 580
CNSTF4 1056964608
ASGNF4
ADDRLP4 16
ADDRLP4 580
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 580
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+8
CNSTF4 1056964608
ADDRLP4 16+8
INDIRF4
MULF4
ASGNF4
line 3827
;3826:	//touch distance of the button
;3827:	dist = fabs(movedir[0]) * size[0] + fabs(movedir[1]) * size[1] + fabs(movedir[2]) * size[2];
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 584
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4+4
INDIRF4
ARGF4
ADDRLP4 588
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4+8
INDIRF4
ARGF4
ADDRLP4 592
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 584
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDRLP4 588
INDIRF4
ADDRLP4 112+4
INDIRF4
MULF4
ADDF4
ADDRLP4 592
INDIRF4
ADDRLP4 112+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3828
;3828:	dist *= 0.5;
ADDRLP4 28
CNSTF4 1056964608
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 3830
;3829:	//
;3830:	trap_AAS_FloatForBSPEpairKey(bspent, "health", &health);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1638
ARGP4
ADDRLP4 348
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3832
;3831:	//if the button is shootable
;3832:	if (health) {
ADDRLP4 348
INDIRF4
CNSTF4 0
EQF4 $1639
line 3834
;3833:		//calculate the shoot target
;3834:		VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 596
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3836
;3835:		//
;3836:		VectorCopy(goalorigin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 3837
;3837:		activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 3839
;3838:		//
;3839:		BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, goalorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 356
ARGP4
ADDRLP4 600
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 600
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 604
CNSTP4 0
ASGNP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRLP4 124
ARGP4
ADDRLP4 600
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3841
;3840:		// if the button is visible from the current position
;3841:		if (bsptrace.fraction >= 1.0 || bsptrace.ent == entitynum) {
ADDRLP4 356+8
INDIRF4
CNSTF4 1065353216
GEF4 $1651
ADDRLP4 356+80
INDIRI4
ADDRLP4 344
INDIRI4
NEI4 $1647
LABELV $1651
line 3843
;3842:			//
;3843:			activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable button
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3844
;3844:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3845
;3845:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3846
;3846:			VectorCopy(bs->origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3847
;3847:			activategoal->goal.areanum = bs->areanum;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3848
;3848:			VectorSet(activategoal->goal.mins, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 3238002688
ASGNF4
line 3849
;3849:			VectorSet(activategoal->goal.maxs, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ASGNF4
line 3851
;3850:			//
;3851:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1602
JUMPV
LABELV $1647
line 3853
;3852:		}
;3853:		else {
line 3856
;3854:			//create a goal from where the button is visible and shoot at the button from there
;3855:			//add bounding box size to the dist
;3856:			trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 3857
;3857:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1652
line 3858
;3858:				if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1656
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 612
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 608
INDIRF4
ADDRLP4 612
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1657
JUMPV
LABELV $1656
line 3859
;3859:				else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 616
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 620
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 616
INDIRF4
ADDRLP4 620
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1657
line 3860
;3860:			}
LABELV $1653
line 3857
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1652
line 3862
;3861:			//calculate the goal origin
;3862:			VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 608
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 608
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 608
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3864
;3863:			//
;3864:			VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 3865
;3865:			start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3866
;3866:			VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 3867
;3867:			end[2] -= 512;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1140850688
SUBF4
ASGNF4
line 3868
;3868:			numareas = trap_AAS_TraceAreas(start, end, areas, points, 10);
ADDRLP4 292
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 440
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 612
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 612
INDIRI4
ASGNI4
line 3870
;3869:			//
;3870:			for (i = numareas-1; i >= 0; i--) {
ADDRLP4 0
ADDRLP4 108
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1669
JUMPV
LABELV $1666
line 3871
;3871:				if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 616
INDIRI4
CNSTI4 0
EQI4 $1670
line 3872
;3872:					break;
ADDRGP4 $1668
JUMPV
LABELV $1670
line 3874
;3873:				}
;3874:			}
LABELV $1667
line 3870
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1669
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1666
LABELV $1668
line 3875
;3875:			if (i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1672
line 3877
;3876:				// FIXME: trace forward and maybe in other directions to find a valid area
;3877:			}
LABELV $1672
line 3878
;3878:			if (i >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1674
line 3880
;3879:				//
;3880:				VectorCopy(points[i], activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 440
ADDP4
INDIRB
ASGNB 12
line 3881
;3881:				activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ASGNI4
line 3882
;3882:				VectorSet(activategoal->goal.mins, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1090519040
ASGNF4
line 3883
;3883:				VectorSet(activategoal->goal.maxs, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 3238002688
ASGNF4
line 3885
;3884:				//
;3885:				for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1676
line 3886
;3886:				{
line 3887
;3887:					if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1680
ADDRLP4 616
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 616
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 620
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 316
ADDP4
INDIRF4
ARGF4
ADDRLP4 624
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 628
ADDRLP4 616
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 628
INDIRP4
ADDRLP4 628
INDIRP4
INDIRF4
ADDRLP4 620
INDIRF4
ADDRLP4 624
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1681
JUMPV
LABELV $1680
line 3888
;3888:					else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
ADDRLP4 632
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 632
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 636
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 304
ADDP4
INDIRF4
ARGF4
ADDRLP4 640
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 644
ADDRLP4 632
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ASGNP4
ADDRLP4 644
INDIRP4
ADDRLP4 644
INDIRP4
INDIRF4
ADDRLP4 636
INDIRF4
ADDRLP4 640
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1681
line 3889
;3889:				} //end for
LABELV $1677
line 3885
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1676
line 3891
;3890:				//
;3891:				activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3892
;3892:				activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3893
;3893:				activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3894
;3894:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1602
JUMPV
LABELV $1674
line 3896
;3895:			}
;3896:		}
line 3897
;3897:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1602
JUMPV
LABELV $1639
line 3899
;3898:	}
;3899:	else {
line 3901
;3900:		//add bounding box size to the dist
;3901:		trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 3902
;3902:		for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1682
line 3903
;3903:			if (movedir[i] < 0) dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1686
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 596
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 600
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 596
INDIRF4
ADDRLP4 600
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1687
JUMPV
LABELV $1686
line 3904
;3904:			else dist += fabs(movedir[i]) * fabs(bboxmins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 604
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 604
INDIRF4
ADDRLP4 608
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1687
line 3905
;3905:		}
LABELV $1683
line 3902
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1682
line 3907
;3906:		//calculate the goal origin
;3907:		VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 596
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3909
;3908:		//
;3909:		VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 3910
;3910:		start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3911
;3911:		VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 3912
;3912:		end[2] -= 100;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 3913
;3913:		numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 292
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 32
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 600
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 600
INDIRI4
ASGNI4
line 3915
;3914:		//
;3915:		for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1699
JUMPV
LABELV $1696
line 3916
;3916:			if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 604
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 604
INDIRI4
CNSTI4 0
EQI4 $1700
line 3917
;3917:				break;
ADDRGP4 $1698
JUMPV
LABELV $1700
line 3919
;3918:			}
;3919:		}
LABELV $1697
line 3915
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1699
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $1696
LABELV $1698
line 3920
;3920:		if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
GEI4 $1702
line 3922
;3921:			//
;3922:			VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 3923
;3923:			activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ASGNI4
line 3924
;3924:			VectorSubtract(mins, origin, activategoal->goal.mins);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 72+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 72+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 3925
;3925:			VectorSubtract(maxs, origin, activategoal->goal.maxs);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 84
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 84+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 84+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 3927
;3926:			//
;3927:			for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1712
line 3928
;3928:			{
line 3929
;3929:				if (movedir[i] < 0) activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1716
ADDRLP4 604
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 604
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 316
ADDP4
INDIRF4
ARGF4
ADDRLP4 612
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 616
ADDRLP4 604
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 616
INDIRP4
ADDRLP4 616
INDIRP4
INDIRF4
ADDRLP4 608
INDIRF4
ADDRLP4 612
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1717
JUMPV
LABELV $1716
line 3930
;3930:				else activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
ADDRLP4 620
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 620
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 624
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 304
ADDP4
INDIRF4
ARGF4
ADDRLP4 628
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 632
ADDRLP4 620
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ASGNP4
ADDRLP4 632
INDIRP4
ADDRLP4 632
INDIRP4
INDIRF4
ADDRLP4 624
INDIRF4
ADDRLP4 628
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1717
line 3931
;3931:			} //end for
LABELV $1713
line 3927
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1712
line 3933
;3932:			//
;3933:			activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3934
;3934:			activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3935
;3935:			activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3936
;3936:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1602
JUMPV
LABELV $1702
line 3938
;3937:		}
;3938:	}
line 3939
;3939:	return qfalse;
CNSTI4 0
RETI4
LABELV $1602
endproc BotFuncButtonActivateGoal 648 28
export BotFuncDoorActivateGoal
proc BotFuncDoorActivateGoal 1096 20
line 3947
;3940:}
;3941:
;3942:/*
;3943:==================
;3944:BotFuncDoorGoal
;3945:==================
;3946:*/
;3947:int BotFuncDoorActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 3953
;3948:	int modelindex, entitynum;
;3949:	char model[MAX_INFO_STRING];
;3950:	vec3_t mins, maxs, origin, angles;
;3951:
;3952:	//shoot at the shootable door
;3953:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $274
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3954
;3954:	if (!*model)
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1719
line 3955
;3955:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1718
JUMPV
LABELV $1719
line 3956
;3956:	modelindex = atoi(model+1);
ADDRLP4 12+1
ARGP4
ADDRLP4 1080
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1080
INDIRI4
ASGNI4
line 3957
;3957:	if (!modelindex)
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1722
line 3958
;3958:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1718
JUMPV
LABELV $1722
line 3959
;3959:	VectorClear(angles);
ADDRLP4 1084
CNSTF4 0
ASGNF4
ADDRLP4 1064+8
ADDRLP4 1084
INDIRF4
ASGNF4
ADDRLP4 1064+4
ADDRLP4 1084
INDIRF4
ASGNF4
ADDRLP4 1064
ADDRLP4 1084
INDIRF4
ASGNF4
line 3960
;3960:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
ADDRLP4 1060
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1088
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 1076
ADDRLP4 1088
INDIRI4
ASGNI4
line 3962
;3961:	//door origin
;3962:	VectorAdd(mins, maxs, origin);
ADDRLP4 0
ADDRLP4 1036
INDIRF4
ADDRLP4 1048
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1036+4
INDIRF4
ADDRLP4 1048+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 1036+8
INDIRF4
ADDRLP4 1048+8
INDIRF4
ADDF4
ASGNF4
line 3963
;3963:	VectorScale(origin, 0.5, origin);
ADDRLP4 1092
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 1092
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1092
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1056964608
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 3964
;3964:	VectorCopy(origin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3965
;3965:	activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 3967
;3966:	//
;3967:	activategoal->goal.entitynum = entitynum; //NOTE: this is the entity number of the shootable door
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 1076
INDIRI4
ASGNI4
line 3968
;3968:	activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3969
;3969:	activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3970
;3970:	VectorCopy(bs->origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3971
;3971:	activategoal->goal.areanum = bs->areanum;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3972
;3972:	VectorSet(activategoal->goal.mins, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 3238002688
ASGNF4
line 3973
;3973:	VectorSet(activategoal->goal.maxs, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ASGNF4
line 3974
;3974:	return qtrue;
CNSTI4 1
RETI4
LABELV $1718
endproc BotFuncDoorActivateGoal 1096 20
export BotTriggerMultipleActivateGoal
proc BotTriggerMultipleActivateGoal 300 20
line 3982
;3975:}
;3976:
;3977:/*
;3978:==================
;3979:BotTriggerMultipleGoal
;3980:==================
;3981:*/
;3982:int BotTriggerMultipleActivateGoal(bot_state_t *bs, int bspent, bot_activategoal_t *activategoal) {
line 3988
;3983:	int i, areas[10], numareas, modelindex, entitynum;
;3984:	char model[128];
;3985:	vec3_t start, end, mins, maxs, angles;
;3986:	vec3_t origin, goalorigin;
;3987:
;3988:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 3989
;3989:	VectorClear(activategoal->target);
ADDRLP4 268
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 272
CNSTF4 0
ASGNF4
ADDRLP4 268
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 268
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 268
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 272
INDIRF4
ASGNF4
line 3991
;3990:	//create a bot goal towards the trigger
;3991:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $274
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3992
;3992:	if (!*model)
ADDRLP4 84
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1737
line 3993
;3993:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1736
JUMPV
LABELV $1737
line 3994
;3994:	modelindex = atoi(model+1);
ADDRLP4 84+1
ARGP4
ADDRLP4 276
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 224
ADDRLP4 276
INDIRI4
ASGNI4
line 3995
;3995:	if (!modelindex)
ADDRLP4 224
INDIRI4
CNSTI4 0
NEI4 $1740
line 3996
;3996:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1736
JUMPV
LABELV $1740
line 3997
;3997:	VectorClear(angles);
ADDRLP4 280
CNSTF4 0
ASGNF4
ADDRLP4 240+8
ADDRLP4 280
INDIRF4
ASGNF4
ADDRLP4 240+4
ADDRLP4 280
INDIRF4
ASGNF4
ADDRLP4 240
ADDRLP4 280
INDIRF4
ASGNF4
line 3998
;3998:	entitynum = BotModelMinsMaxs(modelindex, 0, CONTENTS_TRIGGER, mins, maxs);
ADDRLP4 224
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1073741824
ARGI4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 284
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 264
ADDRLP4 284
INDIRI4
ASGNI4
line 4000
;3999:	//trigger origin
;4000:	VectorAdd(mins, maxs, origin);
ADDRLP4 4
ADDRLP4 60
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 60+4
INDIRF4
ADDRLP4 72+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 60+8
INDIRF4
ADDRLP4 72+8
INDIRF4
ADDF4
ASGNF4
line 4001
;4001:	VectorScale(origin, 0.5, origin);
ADDRLP4 288
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
ADDRLP4 288
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 288
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1056964608
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 4002
;4002:	VectorCopy(origin, goalorigin);
ADDRLP4 252
ADDRLP4 4
INDIRB
ASGNB 12
line 4004
;4003:	//
;4004:	VectorCopy(goalorigin, start);
ADDRLP4 212
ADDRLP4 252
INDIRB
ASGNB 12
line 4005
;4005:	start[2] += 24;
ADDRLP4 212+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 4006
;4006:	VectorCopy(start, end);
ADDRLP4 228
ADDRLP4 212
INDIRB
ASGNB 12
line 4007
;4007:	end[2] -= 100;
ADDRLP4 228+8
ADDRLP4 228+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 4008
;4008:	numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 212
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 292
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 292
INDIRI4
ASGNI4
line 4010
;4009:	//
;4010:	for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1759
JUMPV
LABELV $1756
line 4011
;4011:		if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $1760
line 4012
;4012:			break;
ADDRGP4 $1758
JUMPV
LABELV $1760
line 4014
;4013:		}
;4014:	}
LABELV $1757
line 4010
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1759
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $1756
LABELV $1758
line 4015
;4015:	if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $1762
line 4016
;4016:		VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 4017
;4017:		activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
ASGNI4
line 4018
;4018:		VectorSubtract(mins, origin, activategoal->goal.mins);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 60
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 60+4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 60+8
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 4019
;4019:		VectorSubtract(maxs, origin, activategoal->goal.maxs);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 72+4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 72+8
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 4021
;4020:		//
;4021:		activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 264
INDIRI4
ASGNI4
line 4022
;4022:		activategoal->goal.number = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4023
;4023:		activategoal->goal.flags = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4024
;4024:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1736
JUMPV
LABELV $1762
line 4026
;4025:	}
;4026:	return qfalse;
CNSTI4 0
RETI4
LABELV $1736
endproc BotTriggerMultipleActivateGoal 300 20
export BotPopFromActivateGoalStack
proc BotPopFromActivateGoalStack 4 8
line 4034
;4027:}
;4028:
;4029:/*
;4030:==================
;4031:BotPopFromActivateGoalStack
;4032:==================
;4033:*/
;4034:int BotPopFromActivateGoalStack(bot_state_t *bs) {
line 4035
;4035:	if (!bs->activatestack)
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1773
line 4036
;4036:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1772
JUMPV
LABELV $1773
line 4037
;4037:	BotEnableActivateGoalAreas(bs->activatestack, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4038
;4038:	bs->activatestack->inuse = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 0
ASGNI4
line 4039
;4039:	bs->activatestack->justused_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4040
;4040:	bs->activatestack = bs->activatestack->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
line 4041
;4041:	return qtrue;
CNSTI4 1
RETI4
LABELV $1772
endproc BotPopFromActivateGoalStack 4 8
export BotPushOntoActivateGoalStack
proc BotPushOntoActivateGoalStack 24 12
line 4049
;4042:}
;4043:
;4044:/*
;4045:==================
;4046:BotPushOntoActivateGoalStack
;4047:==================
;4048:*/
;4049:int BotPushOntoActivateGoalStack(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4053
;4050:	int i, best;
;4051:	float besttime;
;4052:
;4053:	best = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 4054
;4054:	besttime = FloatTime() + 9999;
ADDRLP4 4
ADDRGP4 floattime
INDIRF4
CNSTF4 1176255488
ADDF4
ASGNF4
line 4056
;4055:	//
;4056:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1776
line 4057
;4057:		if (!bs->activategoalheap[i].inuse) {
CNSTI4 244
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1780
line 4058
;4058:			if (bs->activategoalheap[i].justused_time < besttime) {
CNSTI4 244
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $1782
line 4059
;4059:				besttime = bs->activategoalheap[i].justused_time;
ADDRLP4 4
CNSTI4 244
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ASGNF4
line 4060
;4060:				best = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4061
;4061:			}
LABELV $1782
line 4062
;4062:		}
LABELV $1780
line 4063
;4063:	}
LABELV $1777
line 4056
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1776
line 4064
;4064:	if (best != -1) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $1784
line 4065
;4065:		memcpy(&bs->activategoalheap[best], activategoal, sizeof(bot_activategoal_t));
ADDRLP4 12
CNSTI4 244
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 4066
;4066:		bs->activategoalheap[best].inuse = qtrue;
CNSTI4 244
ADDRLP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4067
;4067:		bs->activategoalheap[best].next = bs->activatestack;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 244
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
CNSTI4 240
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
line 4068
;4068:		bs->activatestack = &bs->activategoalheap[best];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 7116
ADDP4
CNSTI4 244
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 20
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
ASGNP4
line 4069
;4069:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1775
JUMPV
LABELV $1784
line 4071
;4070:	}
;4071:	return qfalse;
CNSTI4 0
RETI4
LABELV $1775
endproc BotPushOntoActivateGoalStack 24 12
export BotClearActivateGoalStack
proc BotClearActivateGoalStack 0 4
line 4079
;4072:}
;4073:
;4074:/*
;4075:==================
;4076:BotClearActivateGoalStack
;4077:==================
;4078:*/
;4079:void BotClearActivateGoalStack(bot_state_t *bs) {
ADDRGP4 $1788
JUMPV
LABELV $1787
line 4081
;4080:	while(bs->activatestack)
;4081:		BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
LABELV $1788
line 4080
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1787
line 4082
;4082:}
LABELV $1786
endproc BotClearActivateGoalStack 0 4
export BotEnableActivateGoalAreas
proc BotEnableActivateGoalAreas 12 8
line 4089
;4083:
;4084:/*
;4085:==================
;4086:BotEnableActivateGoalAreas
;4087:==================
;4088:*/
;4089:void BotEnableActivateGoalAreas(bot_activategoal_t *activategoal, int enable) {
line 4092
;4090:	int i;
;4091:
;4092:	if (activategoal->areasdisabled == !enable)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1794
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $1795
JUMPV
LABELV $1794
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1795
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1791
line 4093
;4093:		return;
ADDRGP4 $1790
JUMPV
LABELV $1791
line 4094
;4094:	for (i = 0; i < activategoal->numareas; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1799
JUMPV
LABELV $1796
line 4095
;4095:		trap_AAS_EnableRoutingArea( activategoal->areas[i], enable );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 trap_AAS_EnableRoutingArea
CALLI4
pop
LABELV $1797
line 4094
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1799
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
LTI4 $1796
line 4096
;4096:	activategoal->areasdisabled = !enable;
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1801
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $1802
JUMPV
LABELV $1801
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $1802
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 4097
;4097:}
LABELV $1790
endproc BotEnableActivateGoalAreas 12 8
export BotIsGoingToActivateEntity
proc BotIsGoingToActivateEntity 8 0
line 4104
;4098:
;4099:/*
;4100:==================
;4101:BotIsGoingToActivateEntity
;4102:==================
;4103:*/
;4104:int BotIsGoingToActivateEntity(bot_state_t *bs, int entitynum) {
line 4108
;4105:	bot_activategoal_t *a;
;4106:	int i;
;4107:
;4108:	for (a = bs->activatestack; a; a = a->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1807
JUMPV
LABELV $1804
line 4109
;4109:		if (a->time < FloatTime())
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1808
line 4110
;4110:			continue;
ADDRGP4 $1805
JUMPV
LABELV $1808
line 4111
;4111:		if (a->goal.entitynum == entitynum)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1810
line 4112
;4112:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1803
JUMPV
LABELV $1810
line 4113
;4113:	}
LABELV $1805
line 4108
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
LABELV $1807
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1804
line 4114
;4114:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1812
line 4115
;4115:		if (bs->activategoalheap[i].inuse)
CNSTI4 244
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1816
line 4116
;4116:			continue;
ADDRGP4 $1813
JUMPV
LABELV $1816
line 4118
;4117:		//
;4118:		if (bs->activategoalheap[i].goal.entitynum == entitynum) {
CNSTI4 244
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1818
line 4120
;4119:			// if the bot went for this goal less than 2 seconds ago
;4120:			if (bs->activategoalheap[i].justused_time > FloatTime() - 2)
CNSTI4 244
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $1820
line 4121
;4121:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1803
JUMPV
LABELV $1820
line 4122
;4122:		}
LABELV $1818
line 4123
;4123:	}
LABELV $1813
line 4114
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $1812
line 4124
;4124:	return qfalse;
CNSTI4 0
RETI4
LABELV $1803
endproc BotIsGoingToActivateEntity 8 0
export BotGetActivateGoal
proc BotGetActivateGoal 3320 20
line 4137
;4125:}
;4126:
;4127:/*
;4128:==================
;4129:BotGetActivateGoal
;4130:
;4131:  returns the number of the bsp entity to activate
;4132:  goal->entitynum will be set to the game entity to activate
;4133:==================
;4134:*/
;4135://#define OBSTACLEDEBUG
;4136:
;4137:int BotGetActivateGoal(bot_state_t *bs, int entitynum, bot_activategoal_t *activategoal) {
line 4147
;4138:	int i, ent, cur_entities[10], spawnflags, modelindex, areas[MAX_ACTIVATEAREAS*2], numareas, t;
;4139:	char model[MAX_INFO_STRING], tmpmodel[128];
;4140:	char target[128], classname[128];
;4141:	float health;
;4142:	char targetname[10][128];
;4143:	aas_entityinfo_t entinfo;
;4144:	aas_areainfo_t areainfo;
;4145:	vec3_t origin, angles, absmins, absmaxs;
;4146:
;4147:	memset(activategoal, 0, sizeof(bot_activategoal_t));
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 244
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4148
;4148:	BotEntityInfo(entitynum, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 3052
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4149
;4149:	Com_sprintf(model, sizeof( model ), "*%d", entinfo.modelindex);
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1823
ARGP4
ADDRLP4 3052+104
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4150
;4150:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 3252
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3252
INDIRI4
ASGNI4
ADDRGP4 $1828
JUMPV
LABELV $1825
line 4151
;4151:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", tmpmodel, sizeof(tmpmodel))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $274
ARGP4
ADDRLP4 1584
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3256
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3256
INDIRI4
CNSTI4 0
NEI4 $1829
ADDRGP4 $1826
JUMPV
LABELV $1829
line 4152
;4152:		if (!strcmp(model, tmpmodel)) break;
ADDRLP4 1712
ARGP4
ADDRLP4 1584
ARGP4
ADDRLP4 3260
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3260
INDIRI4
CNSTI4 0
NEI4 $1831
ADDRGP4 $1827
JUMPV
LABELV $1831
line 4153
;4153:	}
LABELV $1826
line 4150
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3256
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3256
INDIRI4
ASGNI4
LABELV $1828
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1825
LABELV $1827
line 4154
;4154:	if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1833
line 4155
;4155:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity found with model %s\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1835
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4156
;4156:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1822
JUMPV
LABELV $1833
line 4158
;4157:	}
;4158:	trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1836
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4159
;4159:	if (!classname) {
ADDRLP4 1456
CVPU4 4
CNSTU4 0
NEU4 $1837
line 4160
;4160:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model %s has no classname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1839
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4161
;4161:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1822
JUMPV
LABELV $1837
line 4164
;4162:	}
;4163:	//if it is a door
;4164:	if (!strcmp(classname, "func_door")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1842
ARGP4
ADDRLP4 3260
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3260
INDIRI4
CNSTI4 0
NEI4 $1840
line 4165
;4165:		if (trap_AAS_FloatForBSPEpairKey(ent, "health", &health)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1638
ARGP4
ADDRLP4 3208
ARGP4
ADDRLP4 3264
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3264
INDIRI4
CNSTI4 0
EQI4 $1843
line 4167
;4166:			//if the door has health then the door must be shot to open
;4167:			if (health) {
ADDRLP4 3208
INDIRF4
CNSTF4 0
EQF4 $1845
line 4168
;4168:				BotFuncDoorActivateGoal(bs, ent, activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotFuncDoorActivateGoal
CALLI4
pop
line 4169
;4169:				return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1822
JUMPV
LABELV $1845
line 4171
;4170:			}
;4171:		}
LABELV $1843
line 4173
;4172:		//
;4173:		trap_AAS_IntForBSPEpairKey(ent, "spawnflags", &spawnflags);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1847
ARGP4
ADDRLP4 3204
ARGP4
ADDRGP4 trap_AAS_IntForBSPEpairKey
CALLI4
pop
line 4175
;4174:		// if the door starts open then just wait for the door to return
;4175:		if ( spawnflags & 1 )
ADDRLP4 3204
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1848
line 4176
;4176:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1822
JUMPV
LABELV $1848
line 4178
;4177:		//get the door origin
;4178:		if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1852
ARGP4
ADDRLP4 3192
ARGP4
ADDRLP4 3268
ADDRGP4 trap_AAS_VectorForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $1850
line 4179
;4179:			VectorClear(origin);
ADDRLP4 3272
CNSTF4 0
ASGNF4
ADDRLP4 3192+8
ADDRLP4 3272
INDIRF4
ASGNF4
ADDRLP4 3192+4
ADDRLP4 3272
INDIRF4
ASGNF4
ADDRLP4 3192
ADDRLP4 3272
INDIRF4
ASGNF4
line 4180
;4180:		}
LABELV $1850
line 4182
;4181:		//if the door is open or opening already
;4182:		if (!VectorCompare(origin, entinfo.origin))
ADDRLP4 3192
ARGP4
ADDRLP4 3052+24
ARGP4
ADDRLP4 3272
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
NEI4 $1855
line 4183
;4183:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1822
JUMPV
LABELV $1855
line 4185
;4184:		// store all the areas the door is in
;4185:		trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $274
ARGP4
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4186
;4186:		if (*model) {
ADDRLP4 1712
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1858
line 4187
;4187:			modelindex = atoi(model+1);
ADDRLP4 1712+1
ARGP4
ADDRLP4 3276
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3212
ADDRLP4 3276
INDIRI4
ASGNI4
line 4188
;4188:			if (modelindex) {
ADDRLP4 3212
INDIRI4
CNSTI4 0
EQI4 $1861
line 4189
;4189:				VectorClear(angles);
ADDRLP4 3280
CNSTF4 0
ASGNF4
ADDRLP4 3216+8
ADDRLP4 3280
INDIRF4
ASGNF4
ADDRLP4 3216+4
ADDRLP4 3280
INDIRF4
ASGNF4
ADDRLP4 3216
ADDRLP4 3280
INDIRF4
ASGNF4
line 4190
;4190:				BotModelMinsMaxs(modelindex, ET_MOVER, 0, absmins, absmaxs);
ADDRLP4 3212
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 3228
ARGP4
ADDRLP4 3240
ARGP4
ADDRGP4 BotModelMinsMaxs
CALLI4
pop
line 4192
;4191:				//
;4192:				numareas = trap_AAS_BBoxAreas(absmins, absmaxs, areas, MAX_ACTIVATEAREAS*2);
ADDRLP4 3228
ARGP4
ADDRLP4 3240
ARGP4
ADDRLP4 2740
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 3284
ADDRGP4 trap_AAS_BBoxAreas
CALLI4
ASGNI4
ADDRLP4 3048
ADDRLP4 3284
INDIRI4
ASGNI4
line 4194
;4193:				// store the areas with reachabilities first
;4194:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1868
JUMPV
LABELV $1865
line 4195
;4195:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $1869
line 4196
;4196:						break;
ADDRGP4 $1867
JUMPV
LABELV $1869
line 4197
;4197:					if ( !trap_AAS_AreaReachability(areas[i]) ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3288
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $1871
line 4198
;4198:						continue;
ADDRGP4 $1866
JUMPV
LABELV $1871
line 4200
;4199:					}
;4200:					trap_AAS_AreaInfo(areas[i], &areainfo);
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 2996
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 4201
;4201:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1873
line 4202
;4202:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3296
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3292
ADDRLP4 3296
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3296
INDIRP4
ADDRLP4 3292
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3300
CNSTI4 2
ASGNI4
ADDRLP4 3292
INDIRI4
ADDRLP4 3300
INDIRI4
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
ADDRLP4 3300
INDIRI4
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4203
;4203:					}
LABELV $1873
line 4204
;4204:				}
LABELV $1866
line 4194
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1868
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $1865
LABELV $1867
line 4206
;4205:				// store any remaining areas
;4206:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1878
JUMPV
LABELV $1875
line 4207
;4207:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $1879
line 4208
;4208:						break;
ADDRGP4 $1877
JUMPV
LABELV $1879
line 4209
;4209:					if ( trap_AAS_AreaReachability(areas[i]) ) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3288
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
EQI4 $1881
line 4210
;4210:						continue;
ADDRGP4 $1876
JUMPV
LABELV $1881
line 4212
;4211:					}
;4212:					trap_AAS_AreaInfo(areas[i], &areainfo);
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 2996
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 4213
;4213:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1883
line 4214
;4214:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3296
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3292
ADDRLP4 3296
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3296
INDIRP4
ADDRLP4 3292
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3300
CNSTI4 2
ASGNI4
ADDRLP4 3292
INDIRI4
ADDRLP4 3300
INDIRI4
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
ADDRLP4 3300
INDIRI4
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4215
;4215:					}
LABELV $1883
line 4216
;4216:				}
LABELV $1876
line 4206
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1878
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $1875
LABELV $1877
line 4217
;4217:			}
LABELV $1861
line 4218
;4218:		}
LABELV $1858
line 4219
;4219:	}
LABELV $1840
line 4221
;4220:	// if the bot is blocked by or standing on top of a button
;4221:	if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1887
ARGP4
ADDRLP4 3264
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3264
INDIRI4
CNSTI4 0
NEI4 $1885
line 4222
;4222:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1822
JUMPV
LABELV $1885
line 4225
;4223:	}
;4224:	// get the targetname so we can find an entity with a matching target
;4225:	if (!trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[0], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1890
ARGP4
ADDRLP4 136
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3268
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $1888
line 4226
;4226:		if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1891
line 4227
;4227:			BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model \"%s\" has no targetname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1894
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4228
;4228:		}
LABELV $1891
line 4229
;4229:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1822
JUMPV
LABELV $1888
line 4232
;4230:	}
;4231:	// allow tree-like activation
;4232:	cur_entities[0] = trap_AAS_NextBSPEntity(0);
CNSTI4 0
ARGI4
ADDRLP4 3272
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 1416
ADDRLP4 3272
INDIRI4
ASGNI4
line 4233
;4233:	for (i = 0; i >= 0 && i < 10;) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1898
JUMPV
LABELV $1895
line 4234
;4234:		for (ent = cur_entities[i]; ent; ent = trap_AAS_NextBSPEntity(ent)) {
ADDRLP4 0
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1902
JUMPV
LABELV $1899
line 4235
;4235:			if (!trap_AAS_ValueForBSPEpairKey(ent, "target", target, sizeof(target))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1905
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3276
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 0
NEI4 $1903
ADDRGP4 $1900
JUMPV
LABELV $1903
line 4236
;4236:			if (!strcmp(targetname[i], target)) {
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 3280
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 0
NEI4 $1906
line 4237
;4237:				cur_entities[i] = trap_AAS_NextBSPEntity(ent);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3284
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
ADDRLP4 3284
INDIRI4
ASGNI4
line 4238
;4238:				break;
ADDRGP4 $1901
JUMPV
LABELV $1906
line 4240
;4239:			}
;4240:		}
LABELV $1900
line 4234
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3276
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3276
INDIRI4
ASGNI4
LABELV $1902
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1899
LABELV $1901
line 4241
;4241:		if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1908
line 4242
;4242:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1910
line 4243
;4243:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity with target \"%s\"\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $1913
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4244
;4244:			}
LABELV $1910
line 4245
;4245:			i--;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4246
;4246:			continue;
ADDRGP4 $1896
JUMPV
LABELV $1908
line 4248
;4247:		}
;4248:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1836
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3280
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 0
NEI4 $1914
line 4249
;4249:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1896
line 4250
;4250:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with target \"%s\" has no classname\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $1919
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4251
;4251:			}
line 4252
;4252:			continue;
ADDRGP4 $1896
JUMPV
LABELV $1914
line 4255
;4253:		}
;4254:		// BSP button model
;4255:		if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1887
ARGP4
ADDRLP4 3284
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3284
INDIRI4
CNSTI4 0
NEI4 $1920
line 4257
;4256:			//
;4257:			if (!BotFuncButtonActivateGoal(bs, ent, activategoal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 3288
ADDRGP4 BotFuncButtonActivateGoal
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $1922
line 4258
;4258:				continue;
ADDRGP4 $1896
JUMPV
LABELV $1922
line 4260
;4259:			// if the bot tries to activate this button already
;4260:			if ( bs->activatestack && bs->activatestack->inuse &&
ADDRLP4 3292
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
ADDRLP4 3292
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1924
ADDRLP4 3292
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1924
ADDRLP4 3296
CNSTI4 44
ASGNI4
ADDRLP4 3292
INDIRP4
ADDRLP4 3296
INDIRI4
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
ADDRLP4 3296
INDIRI4
ADDP4
INDIRI4
NEI4 $1924
ADDRLP4 3300
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 3292
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRLP4 3300
INDIRF4
LEF4 $1924
ADDRLP4 3292
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3300
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $1924
line 4264
;4261:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4262:				 bs->activatestack->time > FloatTime() &&
;4263:				 bs->activatestack->start_time < FloatTime() - 2)
;4264:				continue;
ADDRGP4 $1896
JUMPV
LABELV $1924
line 4266
;4265:			// if the bot is in a reachability area
;4266:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3304
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3304
INDIRI4
CNSTI4 0
EQI4 $1926
line 4268
;4267:				// disable all areas the blocking entity is in
;4268:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4270
;4269:				//
;4270:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
ADDRLP4 3308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3308
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3308
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 3308
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 3312
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 2736
ADDRLP4 3312
INDIRI4
ASGNI4
line 4272
;4271:				// if the button is not reachable
;4272:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $1928
line 4273
;4273:					continue;
ADDRGP4 $1896
JUMPV
LABELV $1928
line 4275
;4274:				}
;4275:				activategoal->time = FloatTime() + t * 0.01 + 5;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1008981770
ADDRLP4 2736
INDIRI4
CVIF4 4
MULF4
ADDF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 4276
;4276:			}
LABELV $1926
line 4277
;4277:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1822
JUMPV
LABELV $1920
line 4280
;4278:		}
;4279:		// invisible trigger multiple box
;4280:		else if (!strcmp(classname, "trigger_multiple")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1932
ARGP4
ADDRLP4 3288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $1930
line 4282
;4281:			//
;4282:			if (!BotTriggerMultipleActivateGoal(bs, ent, activategoal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 3292
ADDRGP4 BotTriggerMultipleActivateGoal
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
NEI4 $1933
line 4283
;4283:				continue;
ADDRGP4 $1896
JUMPV
LABELV $1933
line 4285
;4284:			// if the bot tries to activate this trigger already
;4285:			if ( bs->activatestack && bs->activatestack->inuse &&
ADDRLP4 3296
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
ADDRLP4 3296
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1935
ADDRLP4 3296
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1935
ADDRLP4 3300
CNSTI4 44
ASGNI4
ADDRLP4 3296
INDIRP4
ADDRLP4 3300
INDIRI4
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
ADDRLP4 3300
INDIRI4
ADDP4
INDIRI4
NEI4 $1935
ADDRLP4 3304
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 3296
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRLP4 3304
INDIRF4
LEF4 $1935
ADDRLP4 3296
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3304
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $1935
line 4289
;4286:				 bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
;4287:				 bs->activatestack->time > FloatTime() &&
;4288:				 bs->activatestack->start_time < FloatTime() - 2)
;4289:				continue;
ADDRGP4 $1896
JUMPV
LABELV $1935
line 4291
;4290:			// if the bot is in a reachability area
;4291:			if ( trap_AAS_AreaReachability(bs->areanum) ) {
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3308
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3308
INDIRI4
CNSTI4 0
EQI4 $1937
line 4293
;4292:				// disable all areas the blocking entity is in
;4293:				BotEnableActivateGoalAreas( activategoal, qfalse );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4295
;4294:				//
;4295:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
ADDRLP4 3312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3312
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3312
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 3312
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 3316
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 2736
ADDRLP4 3316
INDIRI4
ASGNI4
line 4297
;4296:				// if the trigger is not reachable
;4297:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $1939
line 4298
;4298:					continue;
ADDRGP4 $1896
JUMPV
LABELV $1939
line 4300
;4299:				}
;4300:				activategoal->time = FloatTime() + t * 0.01 + 5;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1008981770
ADDRLP4 2736
INDIRI4
CVIF4 4
MULF4
ADDF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 4301
;4301:			}
LABELV $1937
line 4302
;4302:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1822
JUMPV
LABELV $1930
line 4304
;4303:		}
;4304:		else if (!strcmp(classname, "func_timer")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1943
ARGP4
ADDRLP4 3292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
NEI4 $1941
line 4306
;4305:			// just skip the func_timer
;4306:			continue;
ADDRGP4 $1896
JUMPV
LABELV $1941
line 4309
;4307:		}
;4308:		// the actual button or trigger might be linked through a target_relay or target_delay
;4309:		else if (!strcmp(classname, "target_relay") || !strcmp(classname, "target_delay")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1946
ARGP4
ADDRLP4 3296
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3296
INDIRI4
CNSTI4 0
EQI4 $1948
ADDRLP4 1456
ARGP4
ADDRGP4 $1947
ARGP4
ADDRLP4 3300
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3300
INDIRI4
CNSTI4 0
NEI4 $1944
LABELV $1948
line 4310
;4310:			if (trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[i+1], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1890
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136+128
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3304
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3304
INDIRI4
CNSTI4 0
EQI4 $1949
line 4311
;4311:				i++;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4312
;4312:				cur_entities[i] = trap_AAS_NextBSPEntity(0);
CNSTI4 0
ARGI4
ADDRLP4 3308
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
ADDRLP4 3308
INDIRI4
ASGNI4
line 4313
;4313:			}
LABELV $1949
line 4314
;4314:		}
LABELV $1944
line 4315
;4315:	}
LABELV $1896
line 4233
LABELV $1898
ADDRLP4 132
INDIRI4
CNSTI4 0
LTI4 $1952
ADDRLP4 132
INDIRI4
CNSTI4 10
LTI4 $1895
LABELV $1952
line 4319
;4316:#ifdef OBSTACLEDEBUG
;4317:	BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no valid activator for entity with target \"%s\"\n", targetname[0]);
;4318:#endif
;4319:	return 0;
CNSTI4 0
RETI4
LABELV $1822
endproc BotGetActivateGoal 3320 20
export BotGoForActivateGoal
proc BotGoForActivateGoal 144 8
line 4327
;4320:}
;4321:
;4322:/*
;4323:==================
;4324:BotGoForActivateGoal
;4325:==================
;4326:*/
;4327:int BotGoForActivateGoal(bot_state_t *bs, bot_activategoal_t *activategoal) {
line 4330
;4328:	aas_entityinfo_t activateinfo;
;4329:
;4330:	activategoal->inuse = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 4331
;4331:	if (!activategoal->time)
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1954
line 4332
;4332:		activategoal->time = FloatTime() + 10;
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
LABELV $1954
line 4333
;4333:	activategoal->start_time = FloatTime();
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4334
;4334:	BotEntityInfo(activategoal->goal.entitynum, &activateinfo);
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4335
;4335:	VectorCopy(activateinfo.origin, activategoal->origin);
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4337
;4336:	//
;4337:	if (BotPushOntoActivateGoalStack(bs, activategoal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotPushOntoActivateGoalStack
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1957
line 4339
;4338:		// enter the activate entity AI node
;4339:		AIEnter_Seek_ActivateEntity(bs, "BotGoForActivateGoal");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1959
ARGP4
ADDRGP4 AIEnter_Seek_ActivateEntity
CALLV
pop
line 4340
;4340:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1953
JUMPV
LABELV $1957
line 4342
;4341:	}
;4342:	else {
line 4344
;4343:		// enable any routing areas that were disabled
;4344:		BotEnableActivateGoalAreas(activategoal, qtrue);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4345
;4345:		return qfalse;
CNSTI4 0
RETI4
LABELV $1953
endproc BotGoForActivateGoal 144 8
export BotPrintActivateGoalInfo
proc BotPrintActivateGoalInfo 296 36
line 4354
;4346:	}
;4347:}
;4348:
;4349:/*
;4350:==================
;4351:BotPrintActivateGoalInfo
;4352:==================
;4353:*/
;4354:void BotPrintActivateGoalInfo(bot_state_t *bs, bot_activategoal_t *activategoal, int bspent) {
line 4359
;4355:	char netname[MAX_NETNAME];
;4356:	char classname[128];
;4357:	char buf[128];
;4358:
;4359:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 4360
;4360:	trap_AAS_ValueForBSPEpairKey(bspent, "classname", classname, sizeof(classname));
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1836
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4361
;4361:	if (activategoal->shoot) {
ADDRFP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1961
line 4362
;4362:		Com_sprintf(buf, sizeof(buf), "%s: I have to shoot at a %s from %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $1963
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4368
;4363:						netname, classname,
;4364:						activategoal->goal.origin[0],
;4365:						activategoal->goal.origin[1],
;4366:						activategoal->goal.origin[2],
;4367:						activategoal->goal.areanum);
;4368:	}
ADDRGP4 $1962
JUMPV
LABELV $1961
line 4369
;4369:	else {
line 4370
;4370:		Com_sprintf(buf, sizeof(buf), "%s: I have to activate a %s at %1.1f %1.1f %1.1f in area %d\n",
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $1964
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4376
;4371:						netname, classname,
;4372:						activategoal->goal.origin[0],
;4373:						activategoal->goal.origin[1],
;4374:						activategoal->goal.origin[2],
;4375:						activategoal->goal.areanum);
;4376:	}
LABELV $1962
line 4377
;4377:	trap_EA_Say(bs->client, buf);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ARGP4
ADDRGP4 trap_EA_Say
CALLV
pop
line 4378
;4378:}
LABELV $1960
endproc BotPrintActivateGoalInfo 296 36
export BotRandomMove
proc BotRandomMove 32 16
line 4385
;4379:
;4380:/*
;4381:==================
;4382:BotRandomMove
;4383:==================
;4384:*/
;4385:void BotRandomMove(bot_state_t *bs, bot_moveresult_t *moveresult) {
line 4388
;4386:	vec3_t dir, angles;
;4387:
;4388:	angles[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4389
;4389:	angles[1] = random() * 360;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
CNSTF4 1135869952
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
line 4390
;4390:	angles[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4391
;4391:	AngleVectors(angles, dir, NULL, NULL);
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 28
CNSTP4 0
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4393
;4392:
;4393:	trap_BotMoveInDirection(bs->ms, dir, 400, MOVE_WALK);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 4395
;4394:
;4395:	moveresult->failure = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4396
;4396:	VectorCopy(dir, moveresult->movedir);
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 4397
;4397:}
LABELV $1965
endproc BotRandomMove 32 16
lit
align 4
LABELV $1969
byte 4 0
byte 4 0
byte 4 1065353216
export BotAIBlocked
code
proc BotAIBlocked 528 16
line 4410
;4398:
;4399:/*
;4400:==================
;4401:BotAIBlocked
;4402:
;4403:Very basic handling of bots being blocked by other entities.
;4404:Check what kind of entity is blocking the bot and try to activate
;4405:it. If that's not an option then try to walk around or over the entity.
;4406:Before the bot ends in this part of the AI it should predict which doors to
;4407:open, which buttons to activate etc.
;4408:==================
;4409:*/
;4410:void BotAIBlocked(bot_state_t *bs, bot_moveresult_t *moveresult, int activate) {
line 4412
;4411:	int movetype, bspent;
;4412:	vec3_t hordir, start, end, mins, maxs, sideward, angles, up = {0, 0, 1};
ADDRLP4 228
ADDRGP4 $1969
INDIRB
ASGNB 12
line 4417
;4413:	aas_entityinfo_t entinfo;
;4414:	bot_activategoal_t activategoal;
;4415:
;4416:	// if the bot is not blocked by anything
;4417:	if (!moveresult->blocked) {
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1970
line 4418
;4418:		bs->notblocked_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4419
;4419:		return;
ADDRGP4 $1968
JUMPV
LABELV $1970
line 4422
;4420:	}
;4421:	// if stuck in a solid area
;4422:	if ( moveresult->type == RESULTTYPE_INSOLIDAREA ) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1972
line 4424
;4423:		// move in a random direction in the hope to get out
;4424:		BotRandomMove(bs, moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRandomMove
CALLV
pop
line 4426
;4425:		//
;4426:		return;
ADDRGP4 $1968
JUMPV
LABELV $1972
line 4429
;4427:	}
;4428:	// get info for the entity that is blocking the bot
;4429:	BotEntityInfo(moveresult->blockentity, &entinfo);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4435
;4430:#ifdef OBSTACLEDEBUG
;4431:	ClientName(bs->client, netname, sizeof(netname));
;4432:	BotAI_Print(PRT_MESSAGE, "%s: I'm blocked by model %d\n", netname, entinfo.modelindex);
;4433:#endif OBSTACLEDEBUG
;4434:	// if blocked by a bsp model and the bot wants to activate it
;4435:	if (activate && entinfo.modelindex > 0 && entinfo.modelindex <= max_bspmodelindex) {
ADDRLP4 488
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 488
INDIRI4
EQI4 $1974
ADDRLP4 40+104
INDIRI4
ADDRLP4 488
INDIRI4
LEI4 $1974
ADDRLP4 40+104
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
GTI4 $1974
line 4437
;4436:		// find the bsp entity which should be activated in order to get the blocking entity out of the way
;4437:		bspent = BotGetActivateGoal(bs, entinfo.number, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40+20
INDIRI4
ARGI4
ADDRLP4 240
ARGP4
ADDRLP4 492
ADDRGP4 BotGetActivateGoal
CALLI4
ASGNI4
ADDRLP4 484
ADDRLP4 492
INDIRI4
ASGNI4
line 4438
;4438:		if (bspent) {
ADDRLP4 484
INDIRI4
CNSTI4 0
EQI4 $1979
line 4440
;4439:			//
;4440:			if (bs->activatestack && !bs->activatestack->inuse)
ADDRLP4 496
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
ADDRLP4 496
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1981
ADDRLP4 496
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1981
line 4441
;4441:				bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
CNSTP4 0
ASGNP4
LABELV $1981
line 4443
;4442:			// if not already trying to activate this entity
;4443:			if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240+4+40
INDIRI4
ARGI4
ADDRLP4 500
ADDRGP4 BotIsGoingToActivateEntity
CALLI4
ASGNI4
ADDRLP4 500
INDIRI4
CNSTI4 0
NEI4 $1983
line 4445
;4444:				//
;4445:				BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4446
;4446:			}
LABELV $1983
line 4450
;4447:			// if ontop of an obstacle or
;4448:			// if the bot is not in a reachability area it'll still
;4449:			// need some dynamic obstacle avoidance, otherwise return
;4450:			if (!(moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) &&
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1980
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 504
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 504
INDIRI4
CNSTI4 0
EQI4 $1980
line 4452
;4451:				trap_AAS_AreaReachability(bs->areanum))
;4452:				return;
ADDRGP4 $1968
JUMPV
line 4453
;4453:		}
LABELV $1979
line 4454
;4454:		else {
line 4456
;4455:			// enable any routing areas that were disabled
;4456:			BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 240
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4457
;4457:		}
LABELV $1980
line 4458
;4458:	}
LABELV $1974
line 4460
;4459:	// just some basic dynamic obstacle avoidance code
;4460:	hordir[0] = moveresult->movedir[0];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 4461
;4461:	hordir[1] = moveresult->movedir[1];
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 4462
;4462:	hordir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4464
;4463:	// if no direction just take a random direction
;4464:	if (VectorNormalize(hordir) < 0.1) {
ADDRLP4 0
ARGP4
ADDRLP4 492
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 492
INDIRF4
CNSTF4 1036831949
GEF4 $1991
line 4465
;4465:		VectorSet(angles, 0, 360 * random(), 0);
ADDRLP4 216
CNSTF4 0
ASGNF4
ADDRLP4 496
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 216+4
CNSTF4 1135869952
ADDRLP4 496
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ASGNF4
ADDRLP4 216+8
CNSTF4 0
ASGNF4
line 4466
;4466:		AngleVectors(angles, hordir, NULL, NULL);
ADDRLP4 216
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 500
CNSTP4 0
ASGNP4
ADDRLP4 500
INDIRP4
ARGP4
ADDRLP4 500
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4467
;4467:	}
LABELV $1991
line 4471
;4468:	//
;4469:	//if (moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) movetype = MOVE_JUMP;
;4470:	//else
;4471:	movetype = MOVE_WALK;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 4474
;4472:	// if there's an obstacle at the bot's feet and head then
;4473:	// the bot might be able to crouch through
;4474:	VectorCopy(bs->origin, start);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 4475
;4475:	start[2] += 18;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 4476
;4476:	VectorMA(start, 5, hordir, end);
ADDRLP4 496
CNSTF4 1084227584
ASGNF4
ADDRLP4 180
ADDRLP4 24
INDIRF4
ADDRLP4 496
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 180+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 496
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 180+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1084227584
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4477
;4477:	VectorSet(mins, -16, -16, -24);
ADDRLP4 500
CNSTF4 3246391296
ASGNF4
ADDRLP4 192
ADDRLP4 500
INDIRF4
ASGNF4
ADDRLP4 192+4
ADDRLP4 500
INDIRF4
ASGNF4
ADDRLP4 192+8
CNSTF4 3250585600
ASGNF4
line 4478
;4478:	VectorSet(maxs, 16, 16, 4);
ADDRLP4 504
CNSTF4 1098907648
ASGNF4
ADDRLP4 204
ADDRLP4 504
INDIRF4
ASGNF4
ADDRLP4 204+4
ADDRLP4 504
INDIRF4
ASGNF4
ADDRLP4 204+8
CNSTF4 1082130432
ASGNF4
line 4483
;4479:	//
;4480:	//bsptrace = AAS_Trace(start, mins, maxs, end, bs->entitynum, MASK_PLAYERSOLID);
;4481:	//if (bsptrace.fraction >= 1) movetype = MOVE_CROUCH;
;4482:	// get the sideward vector
;4483:	CrossProduct(hordir, up, sideward);
ADDRLP4 0
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 4485
;4484:	//
;4485:	if (bs->flags & BFL_AVOIDRIGHT) VectorNegate(sideward, sideward);
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2006
ADDRLP4 12
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
NEGF4
ASGNF4
LABELV $2006
line 4487
;4486:	// try to crouch straight forward?
;4487:	if (movetype != MOVE_CROUCH || !trap_BotMoveInDirection(bs->ms, hordir, 400, movetype)) {
ADDRLP4 36
INDIRI4
CNSTI4 2
NEI4 $2014
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 512
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 512
INDIRI4
CNSTI4 0
NEI4 $2012
LABELV $2014
line 4489
;4488:		// perform the movement
;4489:		if (!trap_BotMoveInDirection(bs->ms, sideward, 400, movetype)) {
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 516
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $2015
line 4491
;4490:			// flip the avoid direction flag
;4491:			bs->flags ^= BFL_AVOIDRIGHT;
ADDRLP4 520
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 520
INDIRP4
ADDRLP4 520
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 4494
;4492:			// flip the direction
;4493:			// VectorNegate(sideward, sideward);
;4494:			VectorMA(sideward, -1, hordir, sideward);
ADDRLP4 524
CNSTF4 3212836864
ASGNF4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 524
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 524
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 3212836864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4496
;4495:			// move in the other direction
;4496:			trap_BotMoveInDirection(bs->ms, sideward, 400, movetype);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 4497
;4497:		}
LABELV $2015
line 4498
;4498:	}
LABELV $2012
line 4500
;4499:	//
;4500:	if (bs->notblocked_time < FloatTime() - 0.4) {
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1053609165
SUBF4
GEF4 $2023
line 4503
;4501:		// just reset goals and hope the bot will go into another direction?
;4502:		// is this still needed??
;4503:		if (bs->ainode == AINode_Seek_NBG) bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_NBG
CVPU4 4
NEU4 $2025
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $2026
JUMPV
LABELV $2025
line 4504
;4504:		else if (bs->ainode == AINode_Seek_LTG) bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_LTG
CVPU4 4
NEU4 $2027
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
LABELV $2027
LABELV $2026
line 4505
;4505:	}
LABELV $2023
line 4506
;4506:}
LABELV $1968
endproc BotAIBlocked 528 16
export BotAIPredictObstacles
proc BotAIPredictObstacles 324 44
line 4518
;4507:
;4508:/*
;4509:==================
;4510:BotAIPredictObstacles
;4511:
;4512:Predict the route towards the goal and check if the bot
;4513:will be blocked by certain obstacles. When the bot has obstacles
;4514:on it's path the bot should figure out if they can be removed
;4515:by activating certain entities.
;4516:==================
;4517:*/
;4518:int BotAIPredictObstacles(bot_state_t *bs, bot_goal_t *goal) {
line 4523
;4519:	int modelnum, entitynum, bspent;
;4520:	bot_activategoal_t activategoal;
;4521:	aas_predictroute_t route;
;4522:
;4523:	if (!bot_predictobstacles.integer)
ADDRGP4 bot_predictobstacles+12
INDIRI4
CNSTI4 0
NEI4 $2030
line 4524
;4524:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2029
JUMPV
LABELV $2030
line 4527
;4525:
;4526:	// always predict when the goal change or at regular intervals
;4527:	if (bs->predictobstacles_goalareanum == goal->areanum &&
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 6216
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $2033
ADDRLP4 292
INDIRP4
CNSTI4 6212
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1086324736
SUBF4
LEF4 $2033
line 4528
;4528:		bs->predictobstacles_time > FloatTime() - 6) {
line 4529
;4529:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2029
JUMPV
LABELV $2033
line 4531
;4530:	}
;4531:	bs->predictobstacles_goalareanum = goal->areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6216
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 4532
;4532:	bs->predictobstacles_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6212
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4535
;4533:
;4534:	// predict at most 100 areas or 10 seconds ahead
;4535:	trap_AAS_PredictRoute(&route, bs->areanum, bs->origin,
ADDRLP4 0
ARGP4
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTI4 100
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1024
ARGI4
CNSTI4 67108864
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_AAS_PredictRoute
CALLI4
pop
line 4540
;4536:							goal->areanum, bs->tfl, 100, 1000,
;4537:							RSE_USETRAVELTYPE|RSE_ENTERCONTENTS,
;4538:							AREACONTENTS_MOVER, TFL_BRIDGE, 0);
;4539:	// if bot has to travel through an area with a mover
;4540:	if (route.stopevent & RSE_ENTERCONTENTS) {
ADDRLP4 0+16
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2035
line 4542
;4541:		// if the bot will run into a mover
;4542:		if (route.endcontents & AREACONTENTS_MOVER) {
ADDRLP4 0+20
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2036
line 4544
;4543:			//NOTE: this only works with bspc 2.1 or higher
;4544:			modelnum = (route.endcontents & AREACONTENTS_MODELNUM) >> AREACONTENTS_MODELNUMSHIFT;
ADDRLP4 300
CNSTI4 24
ASGNI4
ADDRLP4 36
ADDRLP4 0+20
INDIRI4
CNSTI4 255
ADDRLP4 300
INDIRI4
LSHI4
BANDI4
ADDRLP4 300
INDIRI4
RSHI4
ASGNI4
line 4545
;4545:			if (modelnum) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2036
line 4547
;4546:				//
;4547:				entitynum = BotModelMinsMaxs(modelnum, ET_MOVER, 0, NULL, NULL);
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 304
CNSTP4 0
ASGNP4
ADDRLP4 304
INDIRP4
ARGP4
ADDRLP4 304
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 308
INDIRI4
ASGNI4
line 4548
;4548:				if (entitynum) {
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2036
line 4550
;4549:					//NOTE: BotGetActivateGoal already checks if the door is open or not
;4550:					bspent = BotGetActivateGoal(bs, entitynum, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 48
ARGP4
ADDRLP4 312
ADDRGP4 BotGetActivateGoal
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 312
INDIRI4
ASGNI4
line 4551
;4551:					if (bspent) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2036
line 4553
;4552:						//
;4553:						if (bs->activatestack && !bs->activatestack->inuse)
ADDRLP4 316
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
INDIRP4
ASGNP4
ADDRLP4 316
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2048
ADDRLP4 316
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2048
line 4554
;4554:							bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7116
ADDP4
CNSTP4 0
ASGNP4
LABELV $2048
line 4556
;4555:						// if not already trying to activate this entity
;4556:						if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48+4+40
INDIRI4
ARGI4
ADDRLP4 320
ADDRGP4 BotIsGoingToActivateEntity
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
NEI4 $2050
line 4560
;4557:							//
;4558:							//BotAI_Print(PRT_MESSAGE, "blocked by mover model %d, entity %d ?\n", modelnum, entitynum);
;4559:							//
;4560:							BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4561
;4561:							return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2029
JUMPV
LABELV $2050
line 4563
;4562:						}
;4563:						else {
line 4565
;4564:							// enable any routing areas that were disabled
;4565:							BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 48
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4566
;4566:						}
line 4567
;4567:					}
line 4568
;4568:				}
line 4569
;4569:			}
line 4570
;4570:		}
line 4571
;4571:	}
ADDRGP4 $2036
JUMPV
LABELV $2035
line 4572
;4572:	else if (route.stopevent & RSE_USETRAVELTYPE) {
ADDRLP4 0+16
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2054
line 4573
;4573:		if (route.endtravelflags & TFL_BRIDGE) {
ADDRLP4 0+24
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $2057
line 4575
;4574:			//FIXME: check if the bridge is available to travel over
;4575:		}
LABELV $2057
line 4576
;4576:	}
LABELV $2054
LABELV $2036
line 4577
;4577:	return qfalse;
CNSTI4 0
RETI4
LABELV $2029
endproc BotAIPredictObstacles 324 44
export BotCheckConsoleMessages
proc BotCheckConsoleMessages 1012 48
line 4585
;4578:}
;4579:
;4580:/*
;4581:==================
;4582:BotCheckConsoleMessages
;4583:==================
;4584:*/
;4585:void BotCheckConsoleMessages(bot_state_t *bs) {
line 4593
;4586:	char botname[MAX_NETNAME], message[MAX_MESSAGE_SIZE], netname[MAX_NETNAME], *ptr;
;4587:	float chat_reply;
;4588:	int context, handle;
;4589:	bot_consolemessage_t m;
;4590:	bot_match_t match;
;4591:
;4592:	//the name of this bot
;4593:	ClientName(bs->client, botname, sizeof(botname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 908
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
ADDRGP4 $2062
JUMPV
LABELV $2061
line 4595
;4594:	//
;4595:	while((handle = trap_BotNextConsoleMessage(bs->cs, &m)) != 0) {
line 4597
;4596:		//if the chat state is flooded with messages the bot will read them quickly
;4597:		if (trap_BotNumConsoleMessages(bs->cs) < 10) {
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 948
ADDRGP4 trap_BotNumConsoleMessages
CALLI4
ASGNI4
ADDRLP4 948
INDIRI4
CNSTI4 10
GEI4 $2064
line 4599
;4598:			//if it is a chat message the bot needs some time to read it
;4599:			if (m.type == CMS_CHAT && m.time > FloatTime() - (1 + random())) break;
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2066
ADDRLP4 952
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 952
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1065353216
ADDF4
SUBF4
LEF4 $2066
ADDRGP4 $2063
JUMPV
LABELV $2066
line 4600
;4600:		}
LABELV $2064
line 4602
;4601:		//
;4602:		ptr = m.message;
ADDRLP4 276
ADDRLP4 0+12
ASGNP4
line 4605
;4603:		//if it is a chat message then don't unify white spaces and don't
;4604:		//replace synonyms in the netname
;4605:		if (m.type == CMS_CHAT) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2071
line 4607
;4606:			//
;4607:			if (trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
ADDRLP4 0+12
ARGP4
ADDRLP4 288
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 952
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 952
INDIRI4
CNSTI4 0
EQI4 $2074
line 4608
;4608:				ptr = m.message + match.variables[MESSAGE].offset;
ADDRLP4 276
ADDRLP4 288+264+16
INDIRI1
CVII4 1
ADDRLP4 0+12
ADDP4
ASGNP4
line 4609
;4609:			}
LABELV $2074
line 4610
;4610:		}
LABELV $2071
line 4612
;4611:		//unify the white spaces in the message
;4612:		trap_UnifyWhiteSpaces(ptr);
ADDRLP4 276
INDIRP4
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4614
;4613:		//replace synonyms in the right context
;4614:		context = BotSynonymContext(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 952
ADDRGP4 BotSynonymContext
CALLI4
ASGNI4
ADDRLP4 284
ADDRLP4 952
INDIRI4
ASGNI4
line 4615
;4615:		trap_BotReplaceSynonyms(ptr, context);
ADDRLP4 276
INDIRP4
ARGP4
ADDRLP4 284
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 trap_BotReplaceSynonyms
CALLV
pop
line 4617
;4616:		//if there's no match
;4617:		if (!BotMatchMessage(bs, m.message)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 956
ADDRGP4 BotMatchMessage
CALLI4
ASGNI4
ADDRLP4 956
INDIRI4
CNSTI4 0
NEI4 $2080
line 4619
;4618:			//if it is a chat message
;4619:			if (m.type == CMS_CHAT && !bot_nochat.integer) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2083
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
NEI4 $2083
line 4621
;4620:				//
;4621:				if (!trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
ADDRLP4 0+12
ARGP4
ADDRLP4 288
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 960
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 960
INDIRI4
CNSTI4 0
NEI4 $2087
line 4622
;4622:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4623
;4623:					continue;
ADDRGP4 $2062
JUMPV
LABELV $2087
line 4626
;4624:				}
;4625:				//don't use eliza chats with team messages
;4626:				if (match.subtype & ST_TEAM) {
ADDRLP4 288+260
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $2090
line 4627
;4627:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4628
;4628:					continue;
ADDRGP4 $2062
JUMPV
LABELV $2090
line 4631
;4629:				}
;4630:				//
;4631:				trap_BotMatchVariable(&match, NETNAME, netname, sizeof(netname));
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 872
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 4632
;4632:				trap_BotMatchVariable(&match, MESSAGE, message, sizeof(message));
ADDRLP4 288
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 616
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 4634
;4633:				//if this is a message from the bot self
;4634:				if (bs->client == ClientFromName(netname)) {
ADDRLP4 872
ARGP4
ADDRLP4 964
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 964
INDIRI4
NEI4 $2093
line 4635
;4635:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4636
;4636:					continue;
ADDRGP4 $2062
JUMPV
LABELV $2093
line 4639
;4637:				}
;4638:				//unify the message
;4639:				trap_UnifyWhiteSpaces(message);
ADDRLP4 616
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4641
;4640:				//
;4641:				trap_Cvar_Update(&bot_testrchat);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 4642
;4642:				if (bot_testrchat.integer) {
ADDRGP4 bot_testrchat+12
INDIRI4
CNSTI4 0
EQI4 $2095
line 4644
;4643:					//
;4644:					trap_BotLibVarSet("bot_testrchat", "1");
ADDRGP4 $2098
ARGP4
ADDRGP4 $2099
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 4646
;4645:					//if bot replies with a chat message
;4646:					if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 968
CNSTP4 0
ASGNP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 908
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 972
ADDRGP4 trap_BotReplyChat
CALLI4
ASGNI4
ADDRLP4 972
INDIRI4
CNSTI4 0
EQI4 $2100
line 4650
;4647:															NULL, NULL,
;4648:															NULL, NULL,
;4649:															NULL, NULL,
;4650:															botname, netname)) {
line 4651
;4651:						BotAI_Print(PRT_MESSAGE, "------------------------\n");
CNSTI4 1
ARGI4
ADDRGP4 $2102
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4652
;4652:					}
ADDRGP4 $2096
JUMPV
LABELV $2100
line 4653
;4653:					else {
line 4654
;4654:						BotAI_Print(PRT_MESSAGE, "**** no valid reply ****\n");
CNSTI4 1
ARGI4
ADDRGP4 $2103
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4655
;4655:					}
line 4656
;4656:				}
ADDRGP4 $2096
JUMPV
LABELV $2095
line 4658
;4657:				//if at a valid chat position and not chatting already and not in teamplay
;4658:				else if (bs->ainode != AINode_Stand && BotValidChatPosition(bs) && !TeamPlayIsOn()) {
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 968
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Stand
CVPU4 4
EQU4 $2104
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 972
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 972
INDIRI4
CNSTI4 0
EQI4 $2104
ADDRLP4 976
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 976
INDIRI4
CNSTI4 0
NEI4 $2104
line 4659
;4659:					chat_reply = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_REPLY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 35
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 980
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 944
ADDRLP4 980
INDIRF4
ASGNF4
line 4660
;4660:					if (random() < 1.5 / (NumBots()+1) && random() < chat_reply) {
ADDRLP4 984
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 988
ADDRGP4 NumBots
CALLI4
ASGNI4
ADDRLP4 984
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1069547520
ADDRLP4 988
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
DIVF4
GEF4 $2106
ADDRLP4 992
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 992
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 944
INDIRF4
GEF4 $2106
line 4662
;4661:						//if bot replies with a chat message
;4662:						if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY,
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
CNSTI4 16
ARGI4
ADDRLP4 996
CNSTP4 0
ASGNP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 996
INDIRP4
ARGP4
ADDRLP4 908
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 1000
ADDRGP4 trap_BotReplyChat
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 0
EQI4 $2108
line 4666
;4663:																NULL, NULL,
;4664:																NULL, NULL,
;4665:																NULL, NULL,
;4666:																botname, netname)) {
line 4668
;4667:							//remove the console message
;4668:							trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4669
;4669:							bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 1004
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1004
INDIRP4
ARGP4
ADDRLP4 1008
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 1004
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1008
INDIRF4
ADDF4
ASGNF4
line 4670
;4670:							AIEnter_Stand(bs, "BotCheckConsoleMessages: reply chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2110
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 4672
;4671:							//EA_Say(bs->client, bs->cs.chatmessage);
;4672:							break;
ADDRGP4 $2063
JUMPV
LABELV $2108
line 4674
;4673:						}
;4674:					}
LABELV $2106
line 4675
;4675:				}
LABELV $2104
LABELV $2096
line 4676
;4676:			}
LABELV $2083
line 4677
;4677:		}
LABELV $2080
line 4679
;4678:		//remove the console message
;4679:		trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4680
;4680:	}
LABELV $2062
line 4595
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 948
ADDRGP4 trap_BotNextConsoleMessage
CALLI4
ASGNI4
ADDRLP4 280
ADDRLP4 948
INDIRI4
ASGNI4
ADDRLP4 948
INDIRI4
CNSTI4 0
NEI4 $2061
LABELV $2063
line 4681
;4681:}
LABELV $2060
endproc BotCheckConsoleMessages 1012 48
export BotCheckForGrenades
proc BotCheckForGrenades 8 16
line 4688
;4682:
;4683:/*
;4684:==================
;4685:BotCheckEvents
;4686:==================
;4687:*/
;4688:void BotCheckForGrenades(bot_state_t *bs, entityState_t *state) {
line 4690
;4689:	// if this is not a grenade
;4690:	if (state->eType != ET_MISSILE || state->weapon != WP_GRENADE_LAUNCHER)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2114
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2112
LABELV $2114
line 4691
;4691:		return;
ADDRGP4 $2111
JUMPV
LABELV $2112
line 4693
;4692:	// try to avoid the grenade
;4693:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1126170624
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 4694
;4694:}
LABELV $2111
endproc BotCheckForGrenades 8 16
export BotCheckEvents
proc BotCheckEvents 164 12
line 4746
;4695:
;4696:#ifdef MISSIONPACK
;4697:/*
;4698:==================
;4699:BotCheckForProxMines
;4700:==================
;4701:*/
;4702:void BotCheckForProxMines(bot_state_t *bs, entityState_t *state) {
;4703:	// if this is not a prox mine
;4704:	if (state->eType != ET_MISSILE || state->weapon != WP_PROX_LAUNCHER)
;4705:		return;
;4706:	// if this prox mine is from someone on our own team
;4707:	if (state->generic1 == BotTeam(bs))
;4708:		return;
;4709:	// if the bot doesn't have a weapon to deactivate the mine
;4710:	if (!(bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0) &&
;4711:		!(bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0) &&
;4712:		!(bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0) ) {
;4713:		return;
;4714:	}
;4715:	// try to avoid the prox mine
;4716:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
;4717:	//
;4718:	if (bs->numproxmines >= MAX_PROXMINES)
;4719:		return;
;4720:	bs->proxmines[bs->numproxmines] = state->number;
;4721:	bs->numproxmines++;
;4722:}
;4723:
;4724:/*
;4725:==================
;4726:BotCheckForKamikazeBody
;4727:==================
;4728:*/
;4729:void BotCheckForKamikazeBody(bot_state_t *bs, entityState_t *state) {
;4730:	// if this entity is not wearing the kamikaze
;4731:	if (!(state->eFlags & EF_KAMIKAZE))
;4732:		return;
;4733:	// if this entity isn't dead
;4734:	if (!(state->eFlags & EF_DEAD))
;4735:		return;
;4736:	//remember this kamikaze body
;4737:	bs->kamikazebody = state->number;
;4738:}
;4739:#endif
;4740:
;4741:/*
;4742:==================
;4743:BotCheckEvents
;4744:==================
;4745:*/
;4746:void BotCheckEvents(bot_state_t *bs, entityState_t *state) {
line 4755
;4747:	int event;
;4748:	char buf[128];
;4749:#ifdef MISSIONPACK
;4750:	aas_entityinfo_t entinfo;
;4751:#endif
;4752:
;4753:	//NOTE: this sucks, we're accessing the gentity_t directly
;4754:	//but there's no other fast way to do it right now
;4755:	if (bs->entityeventTime[state->number] == g_entities[state->number].eventTime) {
ADDRLP4 132
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDP4
INDIRI4
CNSTI4 808
ADDRLP4 132
INDIRI4
MULI4
ADDRGP4 g_entities+552
ADDP4
INDIRI4
NEI4 $2116
line 4756
;4756:		return;
ADDRGP4 $2115
JUMPV
LABELV $2116
line 4758
;4757:	}
;4758:	bs->entityeventTime[state->number] = g_entities[state->number].eventTime;
ADDRLP4 136
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDP4
CNSTI4 808
ADDRLP4 136
INDIRI4
MULI4
ADDRGP4 g_entities+552
ADDP4
INDIRI4
ASGNI4
line 4760
;4759:	//if it's an event only entity
;4760:	if (state->eType > ET_EVENTS) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
LEI4 $2120
line 4761
;4761:		event = (state->eType - ET_EVENTS) & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
SUBI4
CNSTI4 -769
BANDI4
ASGNI4
line 4762
;4762:	}
ADDRGP4 $2121
JUMPV
LABELV $2120
line 4763
;4763:	else {
line 4764
;4764:		event = state->event & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 4765
;4765:	}
LABELV $2121
line 4767
;4766:	//
;4767:	switch(event) {
ADDRLP4 140
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 1
LTI4 $2122
ADDRLP4 140
INDIRI4
CNSTI4 76
GTI4 $2122
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2171-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2171
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2123
address $2122
address $2122
address $2122
address $2156
address $2122
address $2122
address $2157
address $2135
address $2143
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2124
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2122
address $2123
code
LABELV $2124
line 4770
;4768:		//client obituary event
;4769:		case EV_OBITUARY:
;4770:		{
line 4773
;4771:			int target, attacker, mod;
;4772:
;4773:			target = state->otherEntityNum;
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 4774
;4774:			attacker = state->otherEntityNum2;
ADDRLP4 148
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 4775
;4775:			mod = state->eventParm;
ADDRLP4 152
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 4777
;4776:			//
;4777:			if (target == bs->client) {
ADDRLP4 144
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2125
line 4778
;4778:				bs->botdeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 4779
;4779:				bs->lastkilledby = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 5996
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 4781
;4780:				//
;4781:				if (target == attacker ||
ADDRLP4 156
ADDRLP4 144
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRLP4 148
INDIRI4
EQI4 $2130
ADDRLP4 156
INDIRI4
CNSTI4 1023
EQI4 $2130
ADDRLP4 156
INDIRI4
CNSTI4 1022
NEI4 $2127
LABELV $2130
line 4783
;4782:					target == ENTITYNUM_NONE ||
;4783:					target == ENTITYNUM_WORLD) bs->botsuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $2128
JUMPV
LABELV $2127
line 4784
;4784:				else bs->botsuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 0
ASGNI4
LABELV $2128
line 4786
;4785:				//
;4786:				bs->num_deaths++;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 6028
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4787
;4787:			}
ADDRGP4 $2123
JUMPV
LABELV $2125
line 4789
;4788:			//else if this client was killed by the bot
;4789:			else if (attacker == bs->client) {
ADDRLP4 148
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2131
line 4790
;4790:				bs->enemydeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 4791
;4791:				bs->lastkilledplayer = target;
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 4792
;4792:				bs->killedenemy_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6168
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4794
;4793:				//
;4794:				bs->num_kills++;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 6032
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4795
;4795:			}
ADDRGP4 $2123
JUMPV
LABELV $2131
line 4796
;4796:			else if (attacker == bs->enemy && target == attacker) {
ADDRLP4 156
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
NEI4 $2123
ADDRLP4 144
INDIRI4
ADDRLP4 156
INDIRI4
NEI4 $2123
line 4797
;4797:				bs->enemysuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 1
ASGNI4
line 4798
;4798:			}
line 4812
;4799:			//
;4800:#ifdef MISSIONPACK			
;4801:			if (gametype == GT_1FCTF) {
;4802:				//
;4803:				BotEntityInfo(target, &entinfo);
;4804:				if ( entinfo.powerups & ( 1 << PW_NEUTRALFLAG ) ) {
;4805:					if (!BotSameTeam(bs, target)) {
;4806:						bs->neutralflagstatus = 3;	//enemy dropped the flag
;4807:						bs->flagstatuschanged = qtrue;
;4808:					}
;4809:				}
;4810:			}
;4811:#endif
;4812:			break;
ADDRGP4 $2123
JUMPV
LABELV $2135
line 4815
;4813:		}
;4814:		case EV_GLOBAL_SOUND:
;4815:		{
line 4816
;4816:			if (state->eventParm < 0 || state->eventParm > MAX_SOUNDS) {
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
LTI4 $2138
ADDRLP4 144
INDIRI4
CNSTI4 256
LEI4 $2136
LABELV $2138
line 4817
;4817:				BotAI_Print(PRT_ERROR, "EV_GLOBAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2139
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 4818
;4818:				break;
ADDRGP4 $2123
JUMPV
LABELV $2136
line 4820
;4819:			}
;4820:			trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 4840
;4821:			/*
;4822:			if (!strcmp(buf, "sound/teamplay/flagret_red.wav")) {
;4823:				//red flag is returned
;4824:				bs->redflagstatus = 0;
;4825:				bs->flagstatuschanged = qtrue;
;4826:			}
;4827:			else if (!strcmp(buf, "sound/teamplay/flagret_blu.wav")) {
;4828:				//blue flag is returned
;4829:				bs->blueflagstatus = 0;
;4830:				bs->flagstatuschanged = qtrue;
;4831:			}
;4832:			else*/
;4833:#ifdef MISSIONPACK
;4834:			if (!strcmp(buf, "sound/items/kamikazerespawn.wav" )) {
;4835:				//the kamikaze respawned so dont avoid it
;4836:				BotDontAvoid(bs, "Kamikaze");
;4837:			}
;4838:			else
;4839:#endif
;4840:				if (!strcmp(buf, "sound/items/poweruprespawn.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2142
ARGP4
ADDRLP4 148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $2123
line 4842
;4841:				//powerup respawned... go get it
;4842:				BotGoForPowerups(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoForPowerups
CALLV
pop
line 4843
;4843:			}
line 4844
;4844:			break;
ADDRGP4 $2123
JUMPV
LABELV $2143
line 4847
;4845:		}
;4846:		case EV_GLOBAL_TEAM_SOUND:
;4847:		{
line 4848
;4848:			if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2123
line 4849
;4849:				switch(state->eventParm) {
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
LTI4 $2123
ADDRLP4 144
INDIRI4
CNSTI4 5
GTI4 $2123
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2155
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2155
address $2149
address $2150
address $2151
address $2152
address $2153
address $2154
code
LABELV $2149
line 4851
;4850:					case GTS_RED_CAPTURE:
;4851:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4852
;4852:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 0
ASGNI4
line 4853
;4853:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4854
;4854:						break; //see BotMatch_CTF
ADDRGP4 $2123
JUMPV
LABELV $2150
line 4856
;4855:					case GTS_BLUE_CAPTURE:
;4856:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4857
;4857:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 0
ASGNI4
line 4858
;4858:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4859
;4859:						break; //see BotMatch_CTF
ADDRGP4 $2123
JUMPV
LABELV $2151
line 4862
;4860:					case GTS_RED_RETURN:
;4861:						//blue flag is returned
;4862:						bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4863
;4863:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4864
;4864:						break;
ADDRGP4 $2123
JUMPV
LABELV $2152
line 4867
;4865:					case GTS_BLUE_RETURN:
;4866:						//red flag is returned
;4867:						bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 0
ASGNI4
line 4868
;4868:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4869
;4869:						break;
ADDRGP4 $2123
JUMPV
LABELV $2153
line 4872
;4870:					case GTS_RED_TAKEN:
;4871:						//blue flag is taken
;4872:						bs->blueflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 1
ASGNI4
line 4873
;4873:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4874
;4874:						break; //see BotMatch_CTF
ADDRGP4 $2123
JUMPV
LABELV $2154
line 4877
;4875:					case GTS_BLUE_TAKEN:
;4876:						//red flag is taken
;4877:						bs->redflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
CNSTI4 1
ASGNI4
line 4878
;4878:						bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6964
ADDP4
CNSTI4 1
ASGNI4
line 4879
;4879:						break; //see BotMatch_CTF
line 4881
;4880:				}
;4881:			}
line 4914
;4882:#ifdef MISSIONPACK
;4883:			else if (gametype == GT_1FCTF) {
;4884:				switch(state->eventParm) {
;4885:					case GTS_RED_CAPTURE:
;4886:						bs->neutralflagstatus = 0;
;4887:						bs->flagstatuschanged = qtrue;
;4888:						break;
;4889:					case GTS_BLUE_CAPTURE:
;4890:						bs->neutralflagstatus = 0;
;4891:						bs->flagstatuschanged = qtrue;
;4892:						break;
;4893:					case GTS_RED_RETURN:
;4894:						//flag has returned
;4895:						bs->neutralflagstatus = 0;
;4896:						bs->flagstatuschanged = qtrue;
;4897:						break;
;4898:					case GTS_BLUE_RETURN:
;4899:						//flag has returned
;4900:						bs->neutralflagstatus = 0;
;4901:						bs->flagstatuschanged = qtrue;
;4902:						break;
;4903:					case GTS_RED_TAKEN:
;4904:						bs->neutralflagstatus = BotTeam(bs) == TEAM_RED ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
;4905:						bs->flagstatuschanged = qtrue;
;4906:						break;
;4907:					case GTS_BLUE_TAKEN:
;4908:						bs->neutralflagstatus = BotTeam(bs) == TEAM_BLUE ? 2 : 1; //FIXME: check Team_TakeFlagSound in g_team.c
;4909:						bs->flagstatuschanged = qtrue;
;4910:						break;
;4911:				}
;4912:			}
;4913:#endif
;4914:			break;
ADDRGP4 $2123
JUMPV
LABELV $2156
line 4917
;4915:		}
;4916:		case EV_PLAYER_TELEPORT_IN:
;4917:		{
line 4918
;4918:			VectorCopy(state->origin, lastteleport_origin);
ADDRGP4 lastteleport_origin
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4919
;4919:			lastteleport_time = FloatTime();
ADDRGP4 lastteleport_time
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4920
;4920:			break;
ADDRGP4 $2123
JUMPV
LABELV $2157
line 4923
;4921:		}
;4922:		case EV_GENERAL_SOUND:
;4923:		{
line 4925
;4924:			//if this sound is played on the bot
;4925:			if (state->number == bs->client) {
ADDRFP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2123
line 4926
;4926:				if (state->eventParm < 0 || state->eventParm > MAX_SOUNDS) {
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
LTI4 $2162
ADDRLP4 144
INDIRI4
CNSTI4 256
LEI4 $2160
LABELV $2162
line 4927
;4927:					BotAI_Print(PRT_ERROR, "EV_GENERAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2163
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 4928
;4928:					break;
ADDRGP4 $2123
JUMPV
LABELV $2160
line 4931
;4929:				}
;4930:				//check out the sound
;4931:				trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 4933
;4932:				//if falling into a death pit
;4933:				if (!strcmp(buf, "*falling1.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2166
ARGP4
ADDRLP4 148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $2123
line 4935
;4934:					//if the bot has a personal teleporter
;4935:					if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2123
line 4937
;4936:						//use the holdable item
;4937:						trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 4938
;4938:					}
line 4939
;4939:				}
line 4940
;4940:			}
line 4941
;4941:			break;
line 4968
;4942:		}
;4943:		case EV_FOOTSTEP:
;4944:		case EV_FOOTSTEP_METAL:
;4945:		case EV_FOOTSPLASH:
;4946:		case EV_FOOTWADE:
;4947:		case EV_SWIM:
;4948:		case EV_FALL_SHORT:
;4949:		case EV_FALL_MEDIUM:
;4950:		case EV_FALL_FAR:
;4951:		case EV_STEP_4:
;4952:		case EV_STEP_8:
;4953:		case EV_STEP_12:
;4954:		case EV_STEP_16:
;4955:		case EV_JUMP_PAD:
;4956:		case EV_JUMP:
;4957:		case EV_TAUNT:
;4958:		case EV_WATER_TOUCH:
;4959:		case EV_WATER_LEAVE:
;4960:		case EV_WATER_UNDER:
;4961:		case EV_WATER_CLEAR:
;4962:		case EV_ITEM_PICKUP:
;4963:		case EV_GLOBAL_ITEM_PICKUP:
;4964:		case EV_NOAMMO:
;4965:		case EV_CHANGE_WEAPON:
;4966:		case EV_FIRE_WEAPON:
;4967:			//FIXME: either add to sound queue or mark player as someone making noise
;4968:			break;
line 4984
;4969:		case EV_USE_ITEM0:
;4970:		case EV_USE_ITEM1:
;4971:		case EV_USE_ITEM2:
;4972:		case EV_USE_ITEM3:
;4973:		case EV_USE_ITEM4:
;4974:		case EV_USE_ITEM5:
;4975:		case EV_USE_ITEM6:
;4976:		case EV_USE_ITEM7:
;4977:		case EV_USE_ITEM8:
;4978:		case EV_USE_ITEM9:
;4979:		case EV_USE_ITEM10:
;4980:		case EV_USE_ITEM11:
;4981:		case EV_USE_ITEM12:
;4982:		case EV_USE_ITEM13:
;4983:		case EV_USE_ITEM14:
;4984:			break;
LABELV $2122
LABELV $2123
line 4986
;4985:	}
;4986:}
LABELV $2115
endproc BotCheckEvents 164 12
export BotCheckSnapshot
proc BotCheckSnapshot 216 16
line 4993
;4987:
;4988:/*
;4989:==================
;4990:BotCheckSnapshot
;4991:==================
;4992:*/
;4993:void BotCheckSnapshot(bot_state_t *bs) {
line 4998
;4994:	int ent;
;4995:	entityState_t state;
;4996:
;4997:	//remove all avoid spots
;4998:	trap_BotAddAvoidSpot(bs->ms, vec3_origin, 0, AVOID_CLEAR);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 5000
;4999:	//reset kamikaze body
;5000:	bs->kamikazebody = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6256
ADDP4
CNSTI4 0
ASGNI4
line 5002
;5001:	//reset number of proxmines
;5002:	bs->numproxmines = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6516
ADDP4
CNSTI4 0
ASGNI4
line 5004
;5003:	//
;5004:	ent = 0;
ADDRLP4 208
CNSTI4 0
ASGNI4
ADDRGP4 $2175
JUMPV
LABELV $2174
line 5005
;5005:	while( ( ent = BotAI_GetSnapshotEntity( bs->client, ent, &state ) ) != -1 ) {
line 5007
;5006:		//check the entity state for events
;5007:		BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5009
;5008:		//check for grenades the bot should avoid
;5009:		BotCheckForGrenades(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForGrenades
CALLV
pop
line 5017
;5010:		//
;5011:#ifdef MISSIONPACK
;5012:		//check for proximity mines which the bot should deactivate
;5013:		BotCheckForProxMines(bs, &state);
;5014:		//check for dead bodies with the kamikaze effect which should be gibbed
;5015:		BotCheckForKamikazeBody(bs, &state);
;5016:#endif
;5017:	}
LABELV $2175
line 5005
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 208
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 212
ADDRGP4 BotAI_GetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 208
ADDRLP4 212
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 -1
NEI4 $2174
line 5019
;5018:	//check the player state for events
;5019:	BotAI_GetEntityState(bs->client, &state);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 5021
;5020:	//copy the player state events to the entity state
;5021:	state.event = bs->cur_ps.externalEvent;
ADDRLP4 0+180
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 5022
;5022:	state.eventParm = bs->cur_ps.externalEventParm;
ADDRLP4 0+184
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 5024
;5023:	//
;5024:	BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5025
;5025:}
LABELV $2173
endproc BotCheckSnapshot 216 16
export BotCheckAir
proc BotCheckAir 4 4
line 5032
;5026:
;5027:/*
;5028:==================
;5029:BotCheckAir
;5030:==================
;5031:*/
;5032:void BotCheckAir(bot_state_t *bs) {
line 5033
;5033:	if (bs->inventory[INVENTORY_ENVIRONMENTSUIT] <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5096
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2180
line 5034
;5034:		if (trap_AAS_PointContents(bs->eye) & (CONTENTS_WATER|CONTENTS_SLIME|CONTENTS_LAVA)) {
ADDRFP4 0
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $2182
line 5035
;5035:			return;
ADDRGP4 $2179
JUMPV
LABELV $2182
line 5037
;5036:		}
;5037:	}
LABELV $2180
line 5038
;5038:	bs->lastair_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5039
;5039:}
LABELV $2179
endproc BotCheckAir 4 4
export BotAlternateRoute
proc BotAlternateRoute 16 16
line 5046
;5040:
;5041:/*
;5042:==================
;5043:BotAlternateRoute
;5044:==================
;5045:*/
;5046:bot_goal_t *BotAlternateRoute(bot_state_t *bs, bot_goal_t *goal) {
line 5050
;5047:	int t;
;5048:
;5049:	// if the bot has an alternative route goal
;5050:	if (bs->altroutegoal.areanum) {
ADDRFP4 0
INDIRP4
CNSTI4 6692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2185
line 5052
;5051:		//
;5052:		if (bs->reachedaltroutegoal_time)
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2187
line 5053
;5053:			return goal;
ADDRFP4 4
INDIRP4
RETP4
ADDRGP4 $2184
JUMPV
LABELV $2187
line 5055
;5054:		// travel time towards alternative route goal
;5055:		t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, bs->altroutegoal.areanum, bs->tfl);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 6692
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 5056
;5056:		if (t && t < 20) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2189
ADDRLP4 12
INDIRI4
CNSTI4 20
GEI4 $2189
line 5058
;5057:			//BotAI_Print(PRT_MESSAGE, "reached alternate route goal\n");
;5058:			bs->reachedaltroutegoal_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5059
;5059:		}
LABELV $2189
line 5060
;5060:		memcpy(goal, &bs->altroutegoal, sizeof(bot_goal_t));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 5061
;5061:		return &bs->altroutegoal;
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
RETP4
ADDRGP4 $2184
JUMPV
LABELV $2185
line 5063
;5062:	}
;5063:	return goal;
ADDRFP4 4
INDIRP4
RETP4
LABELV $2184
endproc BotAlternateRoute 16 16
export BotGetAlternateRouteGoal
proc BotGetAlternateRouteGoal 24 0
line 5071
;5064:}
;5065:
;5066:/*
;5067:==================
;5068:BotGetAlternateRouteGoal
;5069:==================
;5070:*/
;5071:int BotGetAlternateRouteGoal(bot_state_t *bs, int base) {
line 5076
;5072:	aas_altroutegoal_t *altroutegoals;
;5073:	bot_goal_t *goal;
;5074:	int numaltroutegoals, rnd;
;5075:
;5076:	if (base == TEAM_RED) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $2192
line 5077
;5077:		altroutegoals = red_altroutegoals;
ADDRLP4 12
ADDRGP4 red_altroutegoals
ASGNP4
line 5078
;5078:		numaltroutegoals = red_numaltroutegoals;
ADDRLP4 4
ADDRGP4 red_numaltroutegoals
INDIRI4
ASGNI4
line 5079
;5079:	}
ADDRGP4 $2193
JUMPV
LABELV $2192
line 5080
;5080:	else {
line 5081
;5081:		altroutegoals = blue_altroutegoals;
ADDRLP4 12
ADDRGP4 blue_altroutegoals
ASGNP4
line 5082
;5082:		numaltroutegoals = blue_numaltroutegoals;
ADDRLP4 4
ADDRGP4 blue_numaltroutegoals
INDIRI4
ASGNI4
line 5083
;5083:	}
LABELV $2193
line 5084
;5084:	if (!numaltroutegoals)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2194
line 5085
;5085:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2191
JUMPV
LABELV $2194
line 5086
;5086:	rnd = (float) random() * numaltroutegoals;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5087
;5087:	if (rnd >= numaltroutegoals)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $2196
line 5088
;5088:		rnd = numaltroutegoals-1;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2196
line 5089
;5089:	goal = &bs->altroutegoal;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
ASGNP4
line 5090
;5090:	goal->areanum = altroutegoals[rnd].areanum;
ADDRLP4 20
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
CNSTI4 24
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 5091
;5091:	VectorCopy(altroutegoals[rnd].origin, goal->origin);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 5092
;5092:	VectorSet(goal->mins, -8, -8, -8);
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
line 5093
;5093:	VectorSet(goal->maxs, 8, 8, 8);
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
line 5094
;5094:	goal->entitynum = 0;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 5095
;5095:	goal->iteminfo = 0;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 5096
;5096:	goal->number = 0;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 5097
;5097:	goal->flags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 5099
;5098:	//
;5099:	bs->reachedaltroutegoal_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
CNSTF4 0
ASGNF4
line 5100
;5100:	return qtrue;
CNSTI4 1
RETI4
LABELV $2191
endproc BotGetAlternateRouteGoal 24 0
export BotSetupAlternativeRouteGoals
proc BotSetupAlternativeRouteGoals 0 0
line 5108
;5101:}
;5102:
;5103:/*
;5104:==================
;5105:BotSetupAlternateRouteGoals
;5106:==================
;5107:*/
;5108:void BotSetupAlternativeRouteGoals(void) {
line 5110
;5109:
;5110:	if (altroutegoals_setup)
ADDRGP4 altroutegoals_setup
INDIRI4
CNSTI4 0
EQI4 $2199
line 5111
;5111:		return;
ADDRGP4 $2198
JUMPV
LABELV $2199
line 5180
;5112:#ifdef MISSIONPACK
;5113:	if (gametype == GT_CTF) {
;5114:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
;5115:			BotAI_Print(PRT_WARNING, "no alt routes without Neutral Flag\n");
;5116:		if (ctf_neutralflag.areanum) {
;5117:			//
;5118:			red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5119:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5120:										ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5121:										red_altroutegoals, MAX_ALTROUTEGOALS,
;5122:										ALTROUTEGOAL_CLUSTERPORTALS|
;5123:										ALTROUTEGOAL_VIEWPORTALS);
;5124:			blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5125:										ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5126:										ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5127:										blue_altroutegoals, MAX_ALTROUTEGOALS,
;5128:										ALTROUTEGOAL_CLUSTERPORTALS|
;5129:										ALTROUTEGOAL_VIEWPORTALS);
;5130:		}
;5131:	}
;5132:	else if (gametype == GT_1FCTF) {
;5133:		//
;5134:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5135:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5136:									ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT,
;5137:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5138:									ALTROUTEGOAL_CLUSTERPORTALS|
;5139:									ALTROUTEGOAL_VIEWPORTALS);
;5140:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5141:									ctf_neutralflag.origin, ctf_neutralflag.areanum,
;5142:									ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT,
;5143:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5144:									ALTROUTEGOAL_CLUSTERPORTALS|
;5145:									ALTROUTEGOAL_VIEWPORTALS);
;5146:	}
;5147:	else if (gametype == GT_OBELISK) {
;5148:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
;5149:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
;5150:		//
;5151:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5152:									neutralobelisk.origin, neutralobelisk.areanum,
;5153:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5154:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5155:									ALTROUTEGOAL_CLUSTERPORTALS|
;5156:									ALTROUTEGOAL_VIEWPORTALS);
;5157:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5158:									neutralobelisk.origin, neutralobelisk.areanum,
;5159:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5160:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5161:									ALTROUTEGOAL_CLUSTERPORTALS|
;5162:									ALTROUTEGOAL_VIEWPORTALS);
;5163:	}
;5164:	else if (gametype == GT_HARVESTER) {
;5165:		//
;5166:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5167:									neutralobelisk.origin, neutralobelisk.areanum,
;5168:									redobelisk.origin, redobelisk.areanum, TFL_DEFAULT,
;5169:									red_altroutegoals, MAX_ALTROUTEGOALS,
;5170:									ALTROUTEGOAL_CLUSTERPORTALS|
;5171:									ALTROUTEGOAL_VIEWPORTALS);
;5172:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5173:									neutralobelisk.origin, neutralobelisk.areanum,
;5174:									blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT,
;5175:									blue_altroutegoals, MAX_ALTROUTEGOALS,
;5176:									ALTROUTEGOAL_CLUSTERPORTALS|
;5177:									ALTROUTEGOAL_VIEWPORTALS);
;5178:	}
;5179:#endif
;5180:	altroutegoals_setup = qtrue;
ADDRGP4 altroutegoals_setup
CNSTI4 1
ASGNI4
line 5181
;5181:}
LABELV $2198
endproc BotSetupAlternativeRouteGoals 0 0
export BotDeathmatchAI
proc BotDeathmatchAI 1492 20
line 5188
;5182:
;5183:/*
;5184:==================
;5185:BotDeathmatchAI
;5186:==================
;5187:*/
;5188:void BotDeathmatchAI(bot_state_t *bs, float thinktime) {
line 5194
;5189:	char gender[144], name[144], buf[144];
;5190:	char userinfo[MAX_INFO_STRING];
;5191:	int i;
;5192:
;5193:	//if the bot has just been setup
;5194:	if (bs->setupcount > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2202
line 5195
;5195:		bs->setupcount--;
ADDRLP4 1460
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
ADDRLP4 1460
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5196
;5196:		if (bs->setupcount > 0) return;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2204
ADDRGP4 $2201
JUMPV
LABELV $2204
line 5198
;5197:		//get the gender characteristic
;5198:		trap_Characteristic_String(bs->character, CHARACTERISTIC_GENDER, gender, sizeof(gender));
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 148
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 5200
;5199:		//set the bot gender
;5200:		trap_GetUserinfo(bs->client, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 5201
;5201:		Info_SetValueForKey(userinfo, "sex", gender);
ADDRLP4 292
ARGP4
ADDRGP4 $2206
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 5202
;5202:		trap_SetUserinfo(bs->client, userinfo);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 5204
;5203:		//set the team
;5204:		if ( !bs->map_restart && g_gametype.integer != GT_TOURNAMENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 6020
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2207
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $2207
line 5205
;5205:			Com_sprintf(buf, sizeof(buf), "team %s", bs->settings.team);
ADDRLP4 1316
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 $2210
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4756
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5206
;5206:			trap_EA_Command(bs->client, buf);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1316
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
line 5207
;5207:		}
LABELV $2207
line 5209
;5208:		//set the chat gender
;5209:		if (gender[0] == 'm') trap_BotSetChatGender(bs->cs, CHAT_GENDERMALE);
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 109
NEI4 $2211
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $2212
JUMPV
LABELV $2211
line 5210
;5210:		else if (gender[0] == 'f')  trap_BotSetChatGender(bs->cs, CHAT_GENDERFEMALE);
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 102
NEI4 $2213
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $2214
JUMPV
LABELV $2213
line 5211
;5211:		else  trap_BotSetChatGender(bs->cs, CHAT_GENDERLESS);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
LABELV $2214
LABELV $2212
line 5213
;5212:		//set the chat name
;5213:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 5214
;5214:		trap_BotSetChatName(bs->cs, name, bs->client);
ADDRLP4 1464
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1464
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 1464
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotSetChatName
CALLV
pop
line 5216
;5215:		//
;5216:		bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 1468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1468
INDIRP4
CNSTI4 6044
ADDP4
ADDRLP4 1468
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 5217
;5217:		bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
ADDRLP4 1472
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1472
INDIRP4
CNSTI4 6048
ADDP4
ADDRLP4 1472
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
line 5219
;5218:		//
;5219:		bs->setupcount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
CNSTI4 0
ASGNI4
line 5221
;5220:		//
;5221:		BotSetupAlternativeRouteGoals();
ADDRGP4 BotSetupAlternativeRouteGoals
CALLV
pop
line 5222
;5222:	}
LABELV $2202
line 5224
;5223:	//no ideal view set
;5224:	bs->flags &= ~BFL_IDEALVIEWSET;
ADDRLP4 1460
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
ADDRLP4 1460
INDIRP4
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 5226
;5225:	//
;5226:	if (!BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1464
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 1464
INDIRI4
CNSTI4 0
NEI4 $2215
line 5228
;5227:		//set the teleport time
;5228:		BotSetTeleportTime(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeleportTime
CALLV
pop
line 5230
;5229:		//update some inventory values
;5230:		BotUpdateInventory(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUpdateInventory
CALLV
pop
line 5232
;5231:		//check out the snapshot
;5232:		BotCheckSnapshot(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckSnapshot
CALLV
pop
line 5234
;5233:		//check for air
;5234:		BotCheckAir(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAir
CALLV
pop
line 5235
;5235:	}
LABELV $2215
line 5237
;5236:	//check the console messages
;5237:	BotCheckConsoleMessages(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckConsoleMessages
CALLV
pop
line 5239
;5238:	//if not in the intermission and not in observer mode
;5239:	if (!BotIntermission(bs) && !BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1468
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 1468
INDIRI4
CNSTI4 0
NEI4 $2217
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1472
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 1472
INDIRI4
CNSTI4 0
NEI4 $2217
line 5241
;5240:		//do team AI
;5241:		BotTeamAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamAI
CALLV
pop
line 5242
;5242:	}
LABELV $2217
line 5244
;5243:	//if the bot has no ai node
;5244:	if (!bs->ainode) {
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2219
line 5245
;5245:		AIEnter_Seek_LTG(bs, "BotDeathmatchAI: no ai node");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2221
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 5246
;5246:	}
LABELV $2219
line 5248
;5247:	//if the bot entered the game less than 8 seconds ago
;5248:	if (!bs->entergamechat && bs->entergame_time > FloatTime() - 8) {
ADDRLP4 1476
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1476
INDIRP4
CNSTI4 6024
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2222
ADDRLP4 1476
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
SUBF4
LEF4 $2222
line 5249
;5249:		if (BotChat_EnterGame(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1480
ADDRGP4 BotChat_EnterGame
CALLI4
ASGNI4
ADDRLP4 1480
INDIRI4
CNSTI4 0
EQI4 $2224
line 5250
;5250:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 1484
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1484
INDIRP4
ARGP4
ADDRLP4 1488
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 1484
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1488
INDIRF4
ADDF4
ASGNF4
line 5251
;5251:			AIEnter_Stand(bs, "BotDeathmatchAI: chat enter game");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2226
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 5252
;5252:		}
LABELV $2224
line 5253
;5253:		bs->entergamechat = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6024
ADDP4
CNSTI4 1
ASGNI4
line 5254
;5254:	}
LABELV $2222
line 5256
;5255:	//reset the node switches from the previous frame
;5256:	BotResetNodeSwitches();
ADDRGP4 BotResetNodeSwitches
CALLV
pop
line 5258
;5257:	//execute AI nodes
;5258:	for (i = 0; i < MAX_NODESWITCHES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2227
line 5259
;5259:		if (bs->ainode(bs)) break;
ADDRLP4 1480
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1480
INDIRP4
ARGP4
ADDRLP4 1484
ADDRLP4 1480
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1484
INDIRI4
CNSTI4 0
EQI4 $2231
ADDRGP4 $2229
JUMPV
LABELV $2231
line 5260
;5260:	}
LABELV $2228
line 5258
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2227
LABELV $2229
line 5262
;5261:	//if the bot removed itself :)
;5262:	if (!bs->inuse) return;
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2233
ADDRGP4 $2201
JUMPV
LABELV $2233
line 5264
;5263:	//if the bot executed too many AI nodes
;5264:	if (i >= MAX_NODESWITCHES) {
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2235
line 5265
;5265:		trap_BotDumpGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpGoalStack
CALLV
pop
line 5266
;5266:		trap_BotDumpAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpAvoidGoals
CALLV
pop
line 5267
;5267:		BotDumpNodeSwitches(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDumpNodeSwitches
CALLV
pop
line 5268
;5268:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 5269
;5269:		BotAI_Print(PRT_ERROR, "%s at %1.1f switched more than %d AI nodes\n", name, FloatTime(), MAX_NODESWITCHES);
CNSTI4 3
ARGI4
ADDRGP4 $2237
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 floattime
INDIRF4
ARGF4
CNSTI4 50
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 5270
;5270:	}
LABELV $2235
line 5272
;5271:	//
;5272:	bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 1480
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1480
INDIRP4
CNSTI4 6044
ADDP4
ADDRLP4 1480
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 5273
;5273:	bs->lasthitcount = bs->cur_ps.persistant[PERS_HITS];
ADDRLP4 1484
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1484
INDIRP4
CNSTI4 6048
ADDP4
ADDRLP4 1484
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
line 5274
;5274:}
LABELV $2201
endproc BotDeathmatchAI 1492 20
export BotSetEntityNumForGoalWithModel
proc BotSetEntityNumForGoalWithModel 44 4
line 5281
;5275:
;5276:/*
;5277:==================
;5278:BotSetEntityNumForGoalWithModel
;5279:==================
;5280:*/
;5281:void BotSetEntityNumForGoalWithModel(bot_goal_t *goal, int eType, char *modelname) {
line 5286
;5282:	gentity_t *ent;
;5283:	int i, modelindex;
;5284:	vec3_t dir;
;5285:
;5286:	modelindex = G_ModelIndex( modelname );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 5287
;5287:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5288
;5288:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2242
JUMPV
LABELV $2239
line 5289
;5289:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2244
line 5290
;5290:			continue;
ADDRGP4 $2240
JUMPV
LABELV $2244
line 5292
;5291:		}
;5292:		if ( eType && ent->s.eType != eType) {
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2246
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2246
line 5293
;5293:			continue;
ADDRGP4 $2240
JUMPV
LABELV $2246
line 5295
;5294:		}
;5295:		if (ent->s.modelindex != modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $2248
line 5296
;5296:			continue;
ADDRGP4 $2240
JUMPV
LABELV $2248
line 5298
;5297:		}
;5298:		VectorSubtract(goal->origin, ent->s.origin, dir);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5299
;5299:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 40
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1120403456
GEF4 $2252
line 5300
;5300:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5301
;5301:			return;
ADDRGP4 $2238
JUMPV
LABELV $2252
line 5303
;5302:		}
;5303:	}
LABELV $2240
line 5288
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
LABELV $2242
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2239
line 5304
;5304:}
LABELV $2238
endproc BotSetEntityNumForGoalWithModel 44 4
export BotSetEntityNumForGoal
proc BotSetEntityNumForGoal 36 8
line 5311
;5305:
;5306:/*
;5307:==================
;5308:BotSetEntityNumForGoal
;5309:==================
;5310:*/
;5311:void BotSetEntityNumForGoal(bot_goal_t *goal, char *classname) {
line 5316
;5312:	gentity_t *ent;
;5313:	int i;
;5314:	vec3_t dir;
;5315:
;5316:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5317
;5317:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2258
JUMPV
LABELV $2255
line 5318
;5318:		if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2260
line 5319
;5319:			continue;
ADDRGP4 $2256
JUMPV
LABELV $2260
line 5321
;5320:		}
;5321:		if ( !Q_stricmp(ent->classname, classname) ) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2262
line 5322
;5322:			continue;
ADDRGP4 $2256
JUMPV
LABELV $2262
line 5324
;5323:		}
;5324:		VectorSubtract(goal->origin, ent->s.origin, dir);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5325
;5325:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
GEF4 $2266
line 5326
;5326:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5327
;5327:			return;
ADDRGP4 $2254
JUMPV
LABELV $2266
line 5329
;5328:		}
;5329:	}
LABELV $2256
line 5317
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
ASGNP4
LABELV $2258
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2255
line 5330
;5330:}
LABELV $2254
endproc BotSetEntityNumForGoal 36 8
export BotGoalForBSPEntity
proc BotGoalForBSPEntity 1128 20
line 5337
;5331:
;5332:/*
;5333:==================
;5334:BotGoalForBSPEntity
;5335:==================
;5336:*/
;5337:int BotGoalForBSPEntity( char *classname, bot_goal_t *goal ) {
line 5342
;5338:	char value[MAX_INFO_STRING];
;5339:	vec3_t origin, start, end;
;5340:	int ent, numareas, areas[10];
;5341:
;5342:	memset(goal, 0, sizeof(bot_goal_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5343
;5343:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 1108
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1108
INDIRI4
ASGNI4
ADDRGP4 $2272
JUMPV
LABELV $2269
line 5344
;5344:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", value, sizeof(value)))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1836
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1112
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $2273
line 5345
;5345:			continue;
ADDRGP4 $2270
JUMPV
LABELV $2273
line 5346
;5346:		if (!strcmp(value, classname)) {
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1116
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $2275
line 5347
;5347:			if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1852
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1120
ADDRGP4 trap_AAS_VectorForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $2277
line 5348
;5348:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2268
JUMPV
LABELV $2277
line 5349
;5349:			VectorCopy(origin, goal->origin);
ADDRFP4 4
INDIRP4
ADDRLP4 1028
INDIRB
ASGNB 12
line 5350
;5350:			VectorCopy(origin, start);
ADDRLP4 1040
ADDRLP4 1028
INDIRB
ASGNB 12
line 5351
;5351:			start[2] -= 32;
ADDRLP4 1040+8
ADDRLP4 1040+8
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 5352
;5352:			VectorCopy(origin, end);
ADDRLP4 1052
ADDRLP4 1028
INDIRB
ASGNB 12
line 5353
;5353:			end[2] += 32;
ADDRLP4 1052+8
ADDRLP4 1052+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 5354
;5354:			numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 1040
ARGP4
ADDRLP4 1052
ARGP4
ADDRLP4 1068
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 1124
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1124
INDIRI4
ASGNI4
line 5355
;5355:			if (!numareas)
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2281
line 5356
;5356:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2268
JUMPV
LABELV $2281
line 5357
;5357:			goal->areanum = areas[0];
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 5358
;5358:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2268
JUMPV
LABELV $2275
line 5360
;5359:		}
;5360:	}
LABELV $2270
line 5343
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1112
INDIRI4
ASGNI4
LABELV $2272
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2269
line 5361
;5361:	return qfalse;
CNSTI4 0
RETI4
LABELV $2268
endproc BotGoalForBSPEntity 1128 20
export BotSetupDeathmatchAI
proc BotSetupDeathmatchAI 156 16
line 5369
;5362:}
;5363:
;5364:/*
;5365:==================
;5366:BotSetupDeathmatchAI
;5367:==================
;5368:*/
;5369:void BotSetupDeathmatchAI(void) {
line 5373
;5370:	int ent, modelnum;
;5371:	char model[128];
;5372:
;5373:	gametype = trap_Cvar_VariableIntegerValue("g_gametype");
ADDRGP4 $2284
ARGP4
ADDRLP4 136
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 gametype
ADDRLP4 136
INDIRI4
ASGNI4
line 5374
;5374:	maxclients = trap_Cvar_VariableIntegerValue("sv_maxclients");
ADDRGP4 $279
ARGP4
ADDRLP4 140
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 maxclients
ADDRLP4 140
INDIRI4
ASGNI4
line 5376
;5375:
;5376:	trap_Cvar_Register(&bot_rocketjump, "bot_rocketjump", "1", 0);
ADDRGP4 bot_rocketjump
ARGP4
ADDRGP4 $2285
ARGP4
ADDRGP4 $2099
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5377
;5377:	trap_Cvar_Register(&bot_grapple, "bot_grapple", "0", 0);
ADDRGP4 bot_grapple
ARGP4
ADDRGP4 $2286
ARGP4
ADDRGP4 $2287
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5378
;5378:	trap_Cvar_Register(&bot_fastchat, "bot_fastchat", "0", 0);
ADDRGP4 bot_fastchat
ARGP4
ADDRGP4 $2288
ARGP4
ADDRGP4 $2287
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5379
;5379:	trap_Cvar_Register(&bot_nochat, "bot_nochat", "0", 0);
ADDRGP4 bot_nochat
ARGP4
ADDRGP4 $2289
ARGP4
ADDRGP4 $2287
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5380
;5380:	trap_Cvar_Register(&bot_testrchat, "bot_testrchat", "0", 0);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 $2098
ARGP4
ADDRGP4 $2287
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5381
;5381:	trap_Cvar_Register(&bot_challenge, "bot_challenge", "0", 0);
ADDRGP4 bot_challenge
ARGP4
ADDRGP4 $2290
ARGP4
ADDRGP4 $2287
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5382
;5382:	trap_Cvar_Register(&bot_predictobstacles, "bot_predictobstacles", "1", 0);
ADDRGP4 bot_predictobstacles
ARGP4
ADDRGP4 $2291
ARGP4
ADDRGP4 $2099
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5383
;5383:	trap_Cvar_Register(&g_spSkill, "g_spSkill", "2", 0);
ADDRGP4 g_spSkill
ARGP4
ADDRGP4 $2292
ARGP4
ADDRGP4 $2293
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5385
;5384:	//
;5385:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2294
line 5386
;5386:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2298
ARGP4
ADDRGP4 ctf_redflag
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $2296
line 5387
;5387:			BotAI_Print(PRT_WARNING, "CTF without Red Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2299
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2296
line 5388
;5388:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2302
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
ADDRLP4 148
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
GEI4 $2300
line 5389
;5389:			BotAI_Print(PRT_WARNING, "CTF without Blue Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2303
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2300
line 5390
;5390:	}
LABELV $2294
line 5421
;5391:#ifdef MISSIONPACK
;5392:	else if (gametype == GT_1FCTF) {
;5393:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
;5394:			BotAI_Print(PRT_WARNING, "One Flag CTF without Neutral Flag\n");
;5395:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
;5396:			BotAI_Print(PRT_WARNING, "CTF without Red Flag\n");
;5397:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
;5398:			BotAI_Print(PRT_WARNING, "CTF without Blue Flag\n");
;5399:	}
;5400:	else if (gametype == GT_OBELISK) {
;5401:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
;5402:			BotAI_Print(PRT_WARNING, "Obelisk without red obelisk\n");
;5403:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
;5404:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
;5405:			BotAI_Print(PRT_WARNING, "Obelisk without blue obelisk\n");
;5406:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
;5407:	}
;5408:	else if (gametype == GT_HARVESTER) {
;5409:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
;5410:			BotAI_Print(PRT_WARNING, "Harvester without red obelisk\n");
;5411:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
;5412:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
;5413:			BotAI_Print(PRT_WARNING, "Harvester without blue obelisk\n");
;5414:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
;5415:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
;5416:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
;5417:		BotSetEntityNumForGoal(&neutralobelisk, "team_neutralobelisk");
;5418:	}
;5419:#endif
;5420:
;5421:	max_bspmodelindex = 0;
ADDRGP4 max_bspmodelindex
CNSTI4 0
ASGNI4
line 5422
;5422:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 144
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 144
INDIRI4
ASGNI4
ADDRGP4 $2307
JUMPV
LABELV $2304
line 5423
;5423:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model))) continue;
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $274
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 148
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $2308
ADDRGP4 $2305
JUMPV
LABELV $2308
line 5424
;5424:		if (model[0] == '*') {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $2310
line 5425
;5425:			modelnum = atoi(model+1);
ADDRLP4 4+1
ARGP4
ADDRLP4 152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 152
INDIRI4
ASGNI4
line 5426
;5426:			if (modelnum > max_bspmodelindex)
ADDRLP4 132
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
LEI4 $2313
line 5427
;5427:				max_bspmodelindex = modelnum;
ADDRGP4 max_bspmodelindex
ADDRLP4 132
INDIRI4
ASGNI4
LABELV $2313
line 5428
;5428:		}
LABELV $2310
line 5429
;5429:	}
LABELV $2305
line 5422
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 148
INDIRI4
ASGNI4
LABELV $2307
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2304
line 5431
;5430:	//initialize the waypoint heap
;5431:	BotInitWaypoints();
ADDRGP4 BotInitWaypoints
CALLV
pop
line 5432
;5432:}
LABELV $2283
endproc BotSetupDeathmatchAI 156 16
export BotShutdownDeathmatchAI
proc BotShutdownDeathmatchAI 0 0
line 5439
;5433:
;5434:/*
;5435:==================
;5436:BotShutdownDeathmatchAI
;5437:==================
;5438:*/
;5439:void BotShutdownDeathmatchAI(void) {
line 5440
;5440:	altroutegoals_setup = qfalse;
ADDRGP4 altroutegoals_setup
CNSTI4 0
ASGNI4
line 5441
;5441:}
LABELV $2315
endproc BotShutdownDeathmatchAI 0 0
bss
export blue_numaltroutegoals
align 4
LABELV blue_numaltroutegoals
skip 4
export blue_altroutegoals
align 4
LABELV blue_altroutegoals
skip 768
export red_numaltroutegoals
align 4
LABELV red_numaltroutegoals
skip 4
export red_altroutegoals
align 4
LABELV red_altroutegoals
skip 768
export altroutegoals_setup
align 4
LABELV altroutegoals_setup
skip 4
export max_bspmodelindex
align 4
LABELV max_bspmodelindex
skip 4
export lastteleport_time
align 4
LABELV lastteleport_time
skip 4
export lastteleport_origin
align 4
LABELV lastteleport_origin
skip 12
import bot_developer
export g_spSkill
align 4
LABELV g_spSkill
skip 272
export bot_predictobstacles
align 4
LABELV bot_predictobstacles
skip 272
export botai_freewaypoints
align 4
LABELV botai_freewaypoints
skip 4
export botai_waypoints
align 4
LABELV botai_waypoints
skip 12800
import BotVoiceChatOnly
import BotVoiceChat
import BotSetTeamMateTaskPreference
import BotGetTeamMateTaskPreference
import BotTeamAI
import BotDumpNodeSwitches
import BotResetNodeSwitches
import AINode_Battle_NBG
import AINode_Battle_Retreat
import AINode_Battle_Chase
import AINode_Battle_Fight
import AINode_Seek_LTG
import AINode_Seek_NBG
import AINode_Seek_ActivateEntity
import AINode_Stand
import AINode_Respawn
import AINode_Observer
import AINode_Intermission
import AIEnter_Battle_NBG
import AIEnter_Battle_Retreat
import AIEnter_Battle_Chase
import AIEnter_Battle_Fight
import AIEnter_Seek_Camp
import AIEnter_Seek_LTG
import AIEnter_Seek_NBG
import AIEnter_Seek_ActivateEntity
import AIEnter_Stand
import AIEnter_Respawn
import AIEnter_Observer
import AIEnter_Intermission
import BotPrintTeamGoal
import BotMatchMessage
import notleader
import BotChatTest
import BotValidChatPosition
import BotChatTime
import BotChat_Random
import BotChat_EnemySuicide
import BotChat_Kill
import BotChat_Death
import BotChat_HitNoKill
import BotChat_HitNoDeath
import BotChat_HitTalking
import BotChat_EndLevel
import BotChat_StartLevel
import BotChat_ExitGame
import BotChat_EnterGame
export ctf_blueflag
align 4
LABELV ctf_blueflag
skip 56
export ctf_redflag
align 4
LABELV ctf_redflag
skip 56
export bot_challenge
align 4
LABELV bot_challenge
skip 272
export bot_testrchat
align 4
LABELV bot_testrchat
skip 272
export bot_nochat
align 4
LABELV bot_nochat
skip 272
export bot_fastchat
align 4
LABELV bot_fastchat
skip 272
export bot_rocketjump
align 4
LABELV bot_rocketjump
skip 272
export bot_grapple
align 4
LABELV bot_grapple
skip 272
export maxclients
align 4
LABELV maxclients
skip 4
export gametype
align 4
LABELV gametype
skip 4
import BotTeamLeader
import BotAI_GetSnapshotEntity
import BotAI_GetEntityState
import BotAI_GetClientState
import BotAI_Trace
import BotAI_BotInitialChat
import BotAI_Print
import floattime
import BotEntityInfo
import NumBots
import BotResetState
import BotResetWeaponState
import BotFreeWeaponState
import BotAllocWeaponState
import BotLoadWeaponWeights
import BotGetWeaponInfo
import BotChooseBestFightWeapon
import BotShutdownWeaponAI
import BotSetupWeaponAI
import BotShutdownMoveAI
import BotSetupMoveAI
import BotSetBrushModelTypes
import BotAddAvoidSpot
import BotInitMoveState
import BotFreeMoveState
import BotAllocMoveState
import BotPredictVisiblePosition
import BotMovementViewTarget
import BotReachabilityArea
import BotResetLastAvoidReach
import BotResetAvoidReach
import BotMoveInDirection
import BotMoveToGoal
import BotResetMoveState
import BotShutdownGoalAI
import BotSetupGoalAI
import BotFreeGoalState
import BotAllocGoalState
import BotFreeItemWeights
import BotLoadItemWeights
import BotMutateGoalFuzzyLogic
import BotSaveGoalFuzzyLogic
import BotInterbreedGoalFuzzyLogic
import BotUpdateEntityItems
import BotInitLevelItems
import BotSetAvoidGoalTime
import BotAvoidGoalTime
import BotGetMapLocationGoal
import BotGetNextCampSpotGoal
import BotGetLevelItemGoal
import BotItemGoalInVisButNotVisible
import BotTouchingGoal
import BotChooseNBGItem
import BotChooseLTGItem
import BotGetSecondGoal
import BotGetTopGoal
import BotGoalName
import BotDumpGoalStack
import BotDumpAvoidGoals
import BotEmptyGoalStack
import BotPopGoal
import BotPushGoal
import BotRemoveFromAvoidGoals
import BotResetAvoidGoals
import BotResetGoalState
import GeneticParentsAndChildSelection
import BotSetChatName
import BotSetChatGender
import BotLoadChatFile
import BotReplaceSynonyms
import UnifyWhiteSpaces
import BotMatchVariable
import BotFindMatch
import StringContains
import BotGetChatMessage
import BotEnterChat
import BotChatLength
import BotReplyChat
import BotNumInitialChats
import BotInitialChat
import BotNumConsoleMessages
import BotNextConsoleMessage
import BotRemoveConsoleMessage
import BotQueueConsoleMessage
import BotFreeChatState
import BotAllocChatState
import BotShutdownChatAI
import BotSetupChatAI
import BotShutdownCharacters
import Characteristic_String
import Characteristic_BInteger
import Characteristic_Integer
import Characteristic_BFloat
import Characteristic_Float
import BotFreeCharacter
import BotLoadCharacter
import EA_Shutdown
import EA_Setup
import EA_ResetInput
import EA_GetInput
import EA_EndRegular
import EA_View
import EA_Move
import EA_DelayedJump
import EA_Jump
import EA_SelectWeapon
import EA_Use
import EA_Gesture
import EA_Talk
import EA_Respawn
import EA_Attack
import EA_MoveRight
import EA_MoveLeft
import EA_MoveBack
import EA_MoveForward
import EA_MoveDown
import EA_MoveUp
import EA_Walk
import EA_Crouch
import EA_Action
import EA_Command
import EA_SayTeam
import EA_Say
import GetBotLibAPI
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import Laser_Think
import Laser_Gen
import Info_Think
import Info_Gen
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
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
LABELV $2303
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2302
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $2299
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2298
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $2293
byte 1 50
byte 1 0
align 1
LABELV $2292
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $2291
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 111
byte 1 98
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2290
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $2289
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 110
byte 1 111
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2288
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2287
byte 1 48
byte 1 0
align 1
LABELV $2286
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2285
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $2284
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $2237
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 65
byte 1 73
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2226
byte 1 66
byte 1 111
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2221
byte 1 66
byte 1 111
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $2210
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2206
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $2166
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2163
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 58
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2142
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2139
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 58
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2110
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2103
byte 1 42
byte 1 42
byte 1 42
byte 1 42
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 121
byte 1 32
byte 1 42
byte 1 42
byte 1 42
byte 1 42
byte 1 10
byte 1 0
align 1
LABELV $2102
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $2099
byte 1 49
byte 1 0
align 1
LABELV $2098
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1964
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 73
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1963
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 73
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1959
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 111
byte 1 70
byte 1 111
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1947
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1946
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1943
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1932
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1919
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1913
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1905
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1894
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1890
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1887
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1852
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1847
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $1842
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1839
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1836
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1835
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1823
byte 1 42
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1638
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $1615
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1612
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $1574
byte 1 109
byte 1 112
byte 1 113
byte 1 51
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 54
byte 1 0
align 1
LABELV $1519
byte 1 113
byte 1 51
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 54
byte 1 0
align 1
LABELV $1515
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $669
byte 1 73
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $668
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $667
byte 1 66
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $666
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $665
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 32
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $498
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 87
byte 1 97
byte 1 121
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 79
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $324
byte 1 93
byte 1 0
align 1
LABELV $323
byte 1 91
byte 1 0
align 1
LABELV $322
byte 1 32
byte 1 0
align 1
LABELV $279
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $274
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $273
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 107
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $268
byte 1 110
byte 1 0
align 1
LABELV $267
byte 1 91
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 93
byte 1 0
align 1
LABELV $266
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $185
byte 1 111
byte 1 110
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $160
byte 1 105
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $159
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $158
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
LABELV $135
byte 1 110
byte 1 111
byte 1 0
align 1
LABELV $67
byte 1 116
byte 1 0
