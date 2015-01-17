bss
align 1
LABELV $71
skip 64
export CG_PlaceString
code
proc CG_PlaceString 12 20
file "../cg_event.c"
line 20
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_event.c -- handle entity events at snapshot or playerstate transitions
;4:
;5:#include "cg_local.h"
;6:
;7:// for the voice chats
;8:#ifdef MISSIONPACK // bk001205
;9:#include "../../ui/menudef.h"
;10:#endif
;11://==========================================================================
;12:
;13:/*
;14:===================
;15:CG_PlaceString
;16:
;17:Also called by scoreboard drawing
;18:===================
;19:*/
;20:const char	*CG_PlaceString( int rank ) {
line 24
;21:	static char	str[64];
;22:	char	*s, *t;
;23:
;24:	if ( rank & RANK_TIED_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $72
line 25
;25:		rank &= ~RANK_TIED_FLAG;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 26
;26:		t = "Tied for ";
ADDRLP4 4
ADDRGP4 $74
ASGNP4
line 27
;27:	} else {
ADDRGP4 $73
JUMPV
LABELV $72
line 28
;28:		t = "";
ADDRLP4 4
ADDRGP4 $75
ASGNP4
line 29
;29:	}
LABELV $73
line 31
;30:
;31:	if ( rank == 1 ) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $76
line 32
;32:		s = S_COLOR_BLUE "1st" S_COLOR_WHITE;		// draw in blue
ADDRLP4 0
ADDRGP4 $78
ASGNP4
line 33
;33:	} else if ( rank == 2 ) {
ADDRGP4 $77
JUMPV
LABELV $76
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $79
line 34
;34:		s = S_COLOR_RED "2nd" S_COLOR_WHITE;		// draw in red
ADDRLP4 0
ADDRGP4 $81
ASGNP4
line 35
;35:	} else if ( rank == 3 ) {
ADDRGP4 $80
JUMPV
LABELV $79
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $82
line 36
;36:		s = S_COLOR_YELLOW "3rd" S_COLOR_WHITE;		// draw in yellow
ADDRLP4 0
ADDRGP4 $84
ASGNP4
line 37
;37:	} else if ( rank == 11 ) {
ADDRGP4 $83
JUMPV
LABELV $82
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $85
line 38
;38:		s = "11th";
ADDRLP4 0
ADDRGP4 $87
ASGNP4
line 39
;39:	} else if ( rank == 12 ) {
ADDRGP4 $86
JUMPV
LABELV $85
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $88
line 40
;40:		s = "12th";
ADDRLP4 0
ADDRGP4 $90
ASGNP4
line 41
;41:	} else if ( rank == 13 ) {
ADDRGP4 $89
JUMPV
LABELV $88
ADDRFP4 0
INDIRI4
CNSTI4 13
NEI4 $91
line 42
;42:		s = "13th";
ADDRLP4 0
ADDRGP4 $93
ASGNP4
line 43
;43:	} else if ( rank % 10 == 1 ) {
ADDRGP4 $92
JUMPV
LABELV $91
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $94
line 44
;44:		s = va("%ist", rank);
ADDRGP4 $96
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 45
;45:	} else if ( rank % 10 == 2 ) {
ADDRGP4 $95
JUMPV
LABELV $94
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
NEI4 $97
line 46
;46:		s = va("%ind", rank);
ADDRGP4 $99
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 47
;47:	} else if ( rank % 10 == 3 ) {
ADDRGP4 $98
JUMPV
LABELV $97
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 3
NEI4 $100
line 48
;48:		s = va("%ird", rank);
ADDRGP4 $102
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 49
;49:	} else {
ADDRGP4 $101
JUMPV
LABELV $100
line 50
;50:		s = va("%ith", rank);
ADDRGP4 $103
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 51
;51:	}
LABELV $101
LABELV $98
LABELV $95
LABELV $92
LABELV $89
LABELV $86
LABELV $83
LABELV $80
LABELV $77
line 53
;52:
;53:	Com_sprintf( str, sizeof( str ), "%s%s", t, s );
ADDRGP4 $71
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $104
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 54
;54:	return str;
ADDRGP4 $71
RETP4
LABELV $70
endproc CG_PlaceString 12 20
proc CG_Obituary 132 20
line 62
;55:}
;56:
;57:/*
;58:=============
;59:CG_Obituary
;60:=============
;61:*/
;62:static void CG_Obituary( entityState_t *ent ) {
line 74
;63:	int			mod;
;64:	int			target, attacker;
;65:	char		*message;
;66:	char		*message2;
;67:	const char	*targetInfo;
;68:	const char	*attackerInfo;
;69:	char		targetName[32];
;70:	char		attackerName[32];
;71:	gender_t	gender;
;72:	clientInfo_t	*ci;
;73:
;74:	target = ent->otherEntityNum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 75
;75:	attacker = ent->otherEntityNum2;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 76
;76:	mod = ent->eventParm;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 78
;77:
;78:	if ( target < 0 || target >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $108
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $106
LABELV $108
line 79
;79:		CG_Error( "CG_Obituary: target out of range" );
ADDRGP4 $109
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 80
;80:	}
LABELV $106
line 81
;81:	ci = &cgs.clientinfo[target];
ADDRLP4 92
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 83
;82:
;83:	if ( attacker < 0 || attacker >= MAX_CLIENTS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $113
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $111
LABELV $113
line 84
;84:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 85
;85:		attackerInfo = NULL;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 86
;86:	} else {
ADDRGP4 $112
JUMPV
LABELV $111
line 87
;87:		attackerInfo = CG_ConfigString( CS_PLAYERS + attacker );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 108
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 108
INDIRP4
ASGNP4
line 88
;88:	}
LABELV $112
line 90
;89:
;90:	targetInfo = CG_ConfigString( CS_PLAYERS + target );
ADDRLP4 4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 108
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 108
INDIRP4
ASGNP4
line 91
;91:	if ( !targetInfo ) {
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $114
line 92
;92:		return;
ADDRGP4 $105
JUMPV
LABELV $114
line 94
;93:	}
;94:	Q_strncpyz( targetName, Info_ValueForKey( targetInfo, "n" ), sizeof(targetName) - 2);
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 95
;95:	strcat( targetName, S_COLOR_WHITE );
ADDRLP4 8
ARGP4
ADDRGP4 $117
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 97
;96:
;97:	message2 = "";
ADDRLP4 88
ADDRGP4 $75
ASGNP4
line 101
;98:
;99:	// check for single client messages
;100:
;101:	switch( mod ) {
ADDRLP4 44
INDIRI4
CNSTI4 14
LTI4 $118
ADDRLP4 44
INDIRI4
CNSTI4 22
GTI4 $118
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $136-56
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $136
address $126
address $128
address $130
address $124
address $118
address $122
address $120
address $132
address $134
code
LABELV $120
line 103
;102:	case MOD_SUICIDE:
;103:		message = "suicides";
ADDRLP4 40
ADDRGP4 $121
ASGNP4
line 104
;104:		break;
ADDRGP4 $119
JUMPV
LABELV $122
line 106
;105:	case MOD_FALLING:
;106:		message = "cratered";
ADDRLP4 40
ADDRGP4 $123
ASGNP4
line 107
;107:		break;
ADDRGP4 $119
JUMPV
LABELV $124
line 109
;108:	case MOD_CRUSH:
;109:		message = "was squished";
ADDRLP4 40
ADDRGP4 $125
ASGNP4
line 110
;110:		break;
ADDRGP4 $119
JUMPV
LABELV $126
line 112
;111:	case MOD_WATER:
;112:		message = "sank like a rock";
ADDRLP4 40
ADDRGP4 $127
ASGNP4
line 113
;113:		break;
ADDRGP4 $119
JUMPV
LABELV $128
line 115
;114:	case MOD_SLIME:
;115:		message = "melted";
ADDRLP4 40
ADDRGP4 $129
ASGNP4
line 116
;116:		break;
ADDRGP4 $119
JUMPV
LABELV $130
line 118
;117:	case MOD_LAVA:
;118:		message = "does a back flip into the lava";
ADDRLP4 40
ADDRGP4 $131
ASGNP4
line 119
;119:		break;
ADDRGP4 $119
JUMPV
LABELV $132
line 121
;120:	case MOD_TARGET_LASER:
;121:		message = "saw the light";
ADDRLP4 40
ADDRGP4 $133
ASGNP4
line 122
;122:		break;
ADDRGP4 $119
JUMPV
LABELV $134
line 124
;123:	case MOD_TRIGGER_HURT:
;124:		message = "was in the wrong place";
ADDRLP4 40
ADDRGP4 $135
ASGNP4
line 125
;125:		break;
ADDRGP4 $119
JUMPV
LABELV $118
line 127
;126:	default:
;127:		message = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 128
;128:		break;
LABELV $119
line 131
;129:	}
;130:
;131:	if (attacker == target) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $138
line 132
;132:		gender = ci->gender;
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 133
;133:		switch (mod) {
ADDRLP4 124
CNSTI4 5
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $142
ADDRLP4 44
INDIRI4
CNSTI4 7
EQI4 $150
ADDRLP4 44
INDIRI4
CNSTI4 9
EQI4 $158
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
LTI4 $140
LABELV $175
ADDRLP4 44
INDIRI4
CNSTI4 13
EQI4 $166
ADDRGP4 $140
JUMPV
LABELV $142
line 140
;134:#ifdef MISSIONPACK
;135:		case MOD_KAMIKAZE:
;136:			message = "goes out with a bang";
;137:			break;
;138:#endif
;139:		case MOD_GRENADE_SPLASH:
;140:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $143
line 141
;141:				message = "tripped on her own grenade";
ADDRLP4 40
ADDRGP4 $145
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $143
line 142
;142:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $146
line 143
;143:				message = "tripped on its own grenade";
ADDRLP4 40
ADDRGP4 $148
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $146
line 145
;144:			else
;145:				message = "tripped on his own grenade";
ADDRLP4 40
ADDRGP4 $149
ASGNP4
line 146
;146:			break;
ADDRGP4 $141
JUMPV
LABELV $150
line 148
;147:		case MOD_ROCKET_SPLASH:
;148:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $151
line 149
;149:				message = "blew herself up";
ADDRLP4 40
ADDRGP4 $153
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $151
line 150
;150:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $154
line 151
;151:				message = "blew itself up";
ADDRLP4 40
ADDRGP4 $156
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $154
line 153
;152:			else
;153:				message = "blew himself up";
ADDRLP4 40
ADDRGP4 $157
ASGNP4
line 154
;154:			break;
ADDRGP4 $141
JUMPV
LABELV $158
line 156
;155:		case MOD_PLASMA_SPLASH:
;156:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $159
line 157
;157:				message = "melted herself";
ADDRLP4 40
ADDRGP4 $161
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $159
line 158
;158:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $162
line 159
;159:				message = "melted itself";
ADDRLP4 40
ADDRGP4 $164
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $162
line 161
;160:			else
;161:				message = "melted himself";
ADDRLP4 40
ADDRGP4 $165
ASGNP4
line 162
;162:			break;
ADDRGP4 $141
JUMPV
LABELV $166
line 164
;163:		case MOD_BFG_SPLASH:
;164:			message = "should have used a smaller gun";
ADDRLP4 40
ADDRGP4 $167
ASGNP4
line 165
;165:			break;
ADDRGP4 $141
JUMPV
LABELV $140
line 178
;166:#ifdef MISSIONPACK
;167:		case MOD_PROXIMITY_MINE:
;168:			if( gender == GENDER_FEMALE ) {
;169:				message = "found her prox mine";
;170:			} else if ( gender == GENDER_NEUTER ) {
;171:				message = "found it's prox mine";
;172:			} else {
;173:				message = "found his prox mine";
;174:			}
;175:			break;
;176:#endif
;177:		default:
;178:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $168
line 179
;179:				message = "killed herself";
ADDRLP4 40
ADDRGP4 $170
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $168
line 180
;180:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $171
line 181
;181:				message = "killed itself";
ADDRLP4 40
ADDRGP4 $173
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $171
line 183
;182:			else
;183:				message = "killed himself";
ADDRLP4 40
ADDRGP4 $174
ASGNP4
line 184
;184:			break;
LABELV $141
line 186
;185:		}
;186:	}
LABELV $138
line 188
;187:
;188:	if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $176
line 189
;189:		CG_Printf( "%s %s.\n", targetName, message);
ADDRGP4 $178
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 190
;190:		return;
ADDRGP4 $105
JUMPV
LABELV $176
line 194
;191:	}
;192:
;193:	// check for kill messages from the current clientNum
;194:	if ( attacker == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $179
line 197
;195:		char	*s;
;196:
;197:		if ( cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $182
line 198
;198:			s = va("You fragged %s\n%s place with %i", targetName, 
ADDRGP4 cg+36
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 124
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $185
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 120
ADDRLP4 128
INDIRP4
ASGNP4
line 201
;199:				CG_PlaceString( cg.snap->ps.persistant[PERS_RANK] + 1 ),
;200:				cg.snap->ps.persistant[PERS_SCORE] );
;201:		} else {
ADDRGP4 $183
JUMPV
LABELV $182
line 202
;202:			s = va("You fragged %s", targetName );
ADDRGP4 $188
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 120
ADDRLP4 124
INDIRP4
ASGNP4
line 203
;203:		}
LABELV $183
line 209
;204:#ifdef MISSIONPACK
;205:		if (!(cg_singlePlayerActive.integer && cg_cameraOrbit.integer)) {
;206:			CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
;207:		} 
;208:#else
;209:		CG_CenterPrint( s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRLP4 120
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 213
;210:#endif
;211:
;212:		// print the text message as well
;213:	}
LABELV $179
line 216
;214:
;215:	// check for double client messages
;216:	if ( !attackerInfo ) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $189
line 217
;217:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 218
;218:		strcpy( attackerName, "noname" );
ADDRLP4 56
ARGP4
ADDRGP4 $191
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 219
;219:	} else {
ADDRGP4 $190
JUMPV
LABELV $189
line 220
;220:		Q_strncpyz( attackerName, Info_ValueForKey( attackerInfo, "n" ), sizeof(attackerName) - 2);
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 120
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 221
;221:		strcat( attackerName, S_COLOR_WHITE );
ADDRLP4 56
ARGP4
ADDRGP4 $117
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 223
;222:		// check for kill messages about the current clientNum
;223:		if ( target == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $192
line 224
;224:			Q_strncpyz( cg.killerName, attackerName, sizeof( cg.killerName ) );
ADDRGP4 cg+114332
ARGP4
ADDRLP4 56
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 225
;225:		}
LABELV $192
line 226
;226:	}
LABELV $190
line 228
;227:
;228:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $197
line 229
;229:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 1
LTI4 $199
ADDRLP4 44
INDIRI4
CNSTI4 23
GTI4 $199
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $234-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $234
address $207
address $203
address $205
address $209
address $212
address $215
address $217
address $219
address $222
address $223
address $225
address $227
address $227
address $199
address $199
address $199
address $199
address $230
address $199
address $199
address $199
address $199
address $201
code
LABELV $201
line 231
;230:		case MOD_GRAPPLE:
;231:			message = "was caught by";
ADDRLP4 40
ADDRGP4 $202
ASGNP4
line 232
;232:			break;
ADDRGP4 $200
JUMPV
LABELV $203
line 234
;233:		case MOD_GAUNTLET:
;234:			message = "was pummeled by";
ADDRLP4 40
ADDRGP4 $204
ASGNP4
line 235
;235:			break;
ADDRGP4 $200
JUMPV
LABELV $205
line 237
;236:		case MOD_MACHINEGUN:
;237:			message = "was machinegunned by";
ADDRLP4 40
ADDRGP4 $206
ASGNP4
line 238
;238:			break;
ADDRGP4 $200
JUMPV
LABELV $207
line 240
;239:		case MOD_SHOTGUN:
;240:			message = "was gunned down by";
ADDRLP4 40
ADDRGP4 $208
ASGNP4
line 241
;241:			break;
ADDRGP4 $200
JUMPV
LABELV $209
line 243
;242:		case MOD_GRENADE:
;243:			message = "ate";
ADDRLP4 40
ADDRGP4 $210
ASGNP4
line 244
;244:			message2 = "'s grenade";
ADDRLP4 88
ADDRGP4 $211
ASGNP4
line 245
;245:			break;
ADDRGP4 $200
JUMPV
LABELV $212
line 247
;246:		case MOD_GRENADE_SPLASH:
;247:			message = "was shredded by";
ADDRLP4 40
ADDRGP4 $213
ASGNP4
line 248
;248:			message2 = "'s shrapnel";
ADDRLP4 88
ADDRGP4 $214
ASGNP4
line 249
;249:			break;
ADDRGP4 $200
JUMPV
LABELV $215
line 251
;250:		case MOD_ROCKET:
;251:			message = "ate";
ADDRLP4 40
ADDRGP4 $210
ASGNP4
line 252
;252:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $216
ASGNP4
line 253
;253:			break;
ADDRGP4 $200
JUMPV
LABELV $217
line 255
;254:		case MOD_ROCKET_SPLASH:
;255:			message = "almost dodged";
ADDRLP4 40
ADDRGP4 $218
ASGNP4
line 256
;256:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $216
ASGNP4
line 257
;257:			break;
ADDRGP4 $200
JUMPV
LABELV $219
line 259
;258:		case MOD_PLASMA:
;259:			message = "was melted by";
ADDRLP4 40
ADDRGP4 $220
ASGNP4
line 260
;260:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $221
ASGNP4
line 261
;261:			break;
ADDRGP4 $200
JUMPV
LABELV $222
line 263
;262:		case MOD_PLASMA_SPLASH:
;263:			message = "was melted by";
ADDRLP4 40
ADDRGP4 $220
ASGNP4
line 264
;264:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $221
ASGNP4
line 265
;265:			break;
ADDRGP4 $200
JUMPV
LABELV $223
line 267
;266:		case MOD_RAILGUN:
;267:			message = "was railed by";
ADDRLP4 40
ADDRGP4 $224
ASGNP4
line 268
;268:			break;
ADDRGP4 $200
JUMPV
LABELV $225
line 270
;269:		case MOD_LIGHTNING:
;270:			message = "was electrocuted by";
ADDRLP4 40
ADDRGP4 $226
ASGNP4
line 271
;271:			break;
ADDRGP4 $200
JUMPV
LABELV $227
line 274
;272:		case MOD_BFG:
;273:		case MOD_BFG_SPLASH:
;274:			message = "was blasted by";
ADDRLP4 40
ADDRGP4 $228
ASGNP4
line 275
;275:			message2 = "'s BFG";
ADDRLP4 88
ADDRGP4 $229
ASGNP4
line 276
;276:			break;
ADDRGP4 $200
JUMPV
LABELV $230
line 298
;277:#ifdef MISSIONPACK
;278:		case MOD_NAIL:
;279:			message = "was nailed by";
;280:			break;
;281:		case MOD_CHAINGUN:
;282:			message = "got lead poisoning from";
;283:			message2 = "'s Chaingun";
;284:			break;
;285:		case MOD_PROXIMITY_MINE:
;286:			message = "was too close to";
;287:			message2 = "'s Prox Mine";
;288:			break;
;289:		case MOD_KAMIKAZE:
;290:			message = "falls to";
;291:			message2 = "'s Kamikaze blast";
;292:			break;
;293:		case MOD_JUICED:
;294:			message = "was juiced by";
;295:			break;
;296:#endif
;297:		case MOD_TELEFRAG:
;298:			message = "tried to invade";
ADDRLP4 40
ADDRGP4 $231
ASGNP4
line 299
;299:			message2 = "'s personal space";
ADDRLP4 88
ADDRGP4 $232
ASGNP4
line 300
;300:			break;
ADDRGP4 $200
JUMPV
LABELV $199
line 302
;301:		default:
;302:			message = "was killed by";
ADDRLP4 40
ADDRGP4 $233
ASGNP4
line 303
;303:			break;
LABELV $200
line 306
;304:		}
;305:
;306:		if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $236
line 307
;307:			CG_Printf( "%s %s %s%s\n", 
ADDRGP4 $238
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 309
;308:				targetName, message, attackerName, message2);
;309:			return;
ADDRGP4 $105
JUMPV
LABELV $236
line 311
;310:		}
;311:	}
LABELV $197
line 314
;312:
;313:	// we don't know what it was
;314:	CG_Printf( "%s died.\n", targetName );
ADDRGP4 $239
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 315
;315:}
LABELV $105
endproc CG_Obituary 132 20
proc CG_UseItem 32 16
line 324
;316:
;317://==========================================================================
;318:
;319:/*
;320:===============
;321:CG_UseItem
;322:===============
;323:*/
;324:static void CG_UseItem( centity_t *cent ) {
line 330
;325:	clientInfo_t *ci;
;326:	int			itemNum, clientNum;
;327:	gitem_t		*item;
;328:	entityState_t *es;
;329:
;330:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 332
;331:	
;332:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 24
SUBI4
ASGNI4
line 333
;333:	if ( itemNum < 0 || itemNum > HI_NUM_HOLDABLE ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $243
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $241
LABELV $243
line 334
;334:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 335
;335:	}
LABELV $241
line 338
;336:
;337:	// print a message if the local player
;338:	if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $244
line 339
;339:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $247
line 340
;340:			CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $249
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 341
;341:		} else {
ADDRGP4 $248
JUMPV
LABELV $247
line 342
;342:			item = BG_FindItemForHoldable( itemNum );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForHoldable
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 343
;343:			CG_CenterPrint( va("Use %s", item->pickup_name), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $250
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 344
;344:		}
LABELV $248
line 345
;345:	}
LABELV $244
line 347
;346:
;347:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $253
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $252
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $257
ADDRGP4 $251
JUMPV
LABELV $251
LABELV $253
line 350
;348:	default:
;349:	case HI_NONE:
;350:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useNothingSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152340+548
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 351
;351:		break;
ADDRGP4 $252
JUMPV
line 354
;352:
;353:	case HI_TELEPORTER:
;354:		break;
LABELV $257
line 357
;355:
;356:	case HI_MEDKIT:
;357:		clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 358
;358:		if ( clientNum >= 0 && clientNum < MAX_CLIENTS ) {
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $258
ADDRLP4 28
INDIRI4
CNSTI4 64
GEI4 $258
line 359
;359:			ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 16
CNSTI4 1708
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 360
;360:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 361
;361:		}
LABELV $258
line 362
;362:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.medkitSound );
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152340+868
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 363
;363:		break;
LABELV $252
line 377
;364:
;365:#ifdef MISSIONPACK
;366:	case HI_KAMIKAZE:
;367:		break;
;368:
;369:	case HI_PORTAL:
;370:		break;
;371:	case HI_INVULNERABILITY:
;372:		trap_S_StartSound (NULL, es->number, CHAN_BODY, cgs.media.useInvulnerabilitySound );
;373:		break;
;374:#endif
;375:	}
;376:
;377:}
LABELV $240
endproc CG_UseItem 32 16
proc CG_ItemPickup 0 0
line 386
;378:
;379:/*
;380:================
;381:CG_ItemPickup
;382:
;383:A new item was picked up this frame
;384:================
;385:*/
;386:static void CG_ItemPickup( int itemNum ) {
line 387
;387:	cg.itemPickup = itemNum;
ADDRGP4 cg+124664
ADDRFP4 0
INDIRI4
ASGNI4
line 388
;388:	cg.itemPickupTime = cg.time;
ADDRGP4 cg+124668
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 389
;389:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+124672
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 391
;390:	// see if it should be the grabbed weapon
;391:	if ( bg_itemlist[itemNum].giType == IT_WEAPON ) {
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $270
line 393
;392:		// select it immediately
;393:		if ( cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_MACHINEGUN ) {
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
EQI4 $273
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $273
line 394
;394:			cg.weaponSelectTime = cg.time;
ADDRGP4 cg+124676
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 395
;395:			cg.weaponSelect = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+108944
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 396
;396:		}
LABELV $273
line 397
;397:	}
LABELV $270
line 399
;398:
;399:}
LABELV $264
endproc CG_ItemPickup 0 0
export CG_PainEvent
proc CG_PainEvent 12 16
line 409
;400:
;401:
;402:/*
;403:================
;404:CG_PainEvent
;405:
;406:Also called by playerstate transition
;407:================
;408:*/
;409:void CG_PainEvent( centity_t *cent, int health ) {
line 413
;410:	char	*snd;
;411:
;412:	// don't do more than two pain sounds a second
;413:	if ( cg.time - cent->pe.painTime < 500 ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $282
line 414
;414:		return;
ADDRGP4 $281
JUMPV
LABELV $282
line 417
;415:	}
;416:
;417:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $285
line 418
;418:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $287
ASGNP4
line 419
;419:	} else if ( health < 50 ) {
ADDRGP4 $286
JUMPV
LABELV $285
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $288
line 420
;420:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $290
ASGNP4
line 421
;421:	} else if ( health < 75 ) {
ADDRGP4 $289
JUMPV
LABELV $288
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $291
line 422
;422:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $293
ASGNP4
line 423
;423:	} else {
ADDRGP4 $292
JUMPV
LABELV $291
line 424
;424:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $294
ASGNP4
line 425
;425:	}
LABELV $292
LABELV $289
LABELV $286
line 426
;426:	trap_S_StartSound( NULL, cent->currentState.number, CHAN_VOICE, 
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 430
;427:		CG_CustomSound( cent->currentState.number, snd ) );
;428:
;429:	// save pain time for programitic twitch animation
;430:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 431
;431:	cent->pe.painDirection ^= 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 432
;432:}
LABELV $281
endproc CG_PainEvent 12 16
lit
align 4
LABELV $442
byte 4 0
byte 4 0
byte 4 1065353216
export CG_EntityEvent
code
proc CG_EntityEvent 108 48
line 445
;433:
;434:
;435:
;436:/*
;437:==============
;438:CG_EntityEvent
;439:
;440:An entity has an event value
;441:also called by CG_CheckPlayerstateEvents
;442:==============
;443:*/
;444:#define	DEBUGNAME(x) if(cg_debugEvents.integer){CG_Printf(x"\n");}
;445:void CG_EntityEvent( centity_t *cent, vec3_t position ) {
line 453
;446:	entityState_t	*es;
;447:	int				event;
;448:	vec3_t			dir;
;449:	const char		*s;
;450:	int				clientNum;
;451:	clientInfo_t	*ci;
;452:
;453:	es = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 454
;454:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 456
;455:
;456:	if ( cg_debugEvents.integer ) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $297
line 457
;457:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
ADDRGP4 $300
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 458
;458:	}
LABELV $297
line 460
;459:
;460:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $301
line 461
;461:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $296
ADDRGP4 $306
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 462
;462:		return;
ADDRGP4 $296
JUMPV
LABELV $301
line 465
;463:	}
;464:
;465:	clientNum = es->clientNum;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 466
;466:	if ( clientNum < 0 || clientNum >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $309
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $307
LABELV $309
line 467
;467:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 468
;468:	}
LABELV $307
line 469
;469:	ci = &cgs.clientinfo[ clientNum ];
ADDRLP4 12
CNSTI4 1708
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cgs+40972
ADDP4
ASGNP4
line 471
;470:
;471:	switch ( event ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $311
ADDRLP4 8
INDIRI4
CNSTI4 76
GTI4 $311
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $922-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $922
address $313
address $323
address $334
address $345
address $356
address $407
address $407
address $407
address $407
address $367
address $381
address $393
address $437
address $449
address $460
address $467
address $474
address $481
address $487
address $505
address $519
address $527
address $534
address $539
address $544
address $549
address $554
address $559
address $564
address $569
address $574
address $579
address $584
address $589
address $594
address $599
address $604
address $609
address $311
address $635
address $628
address $614
address $621
address $643
address $696
address $705
address $716
address $686
address $681
address $659
address $664
address $669
address $674
address $691
address $311
address $840
address $848
address $848
address $848
address $854
address $859
address $872
address $885
address $898
address $654
address $311
address $311
address $311
address $311
address $311
address $311
address $311
address $311
address $912
address $907
address $454
code
LABELV $313
line 476
;472:	//
;473:	// movement generated events
;474:	//
;475:	case EV_FOOTSTEP:
;476:		DEBUGNAME("EV_FOOTSTEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $314
ADDRGP4 $317
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $314
line 477
;477:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $312
line 478
;478:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cgs+152340+556
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 480
;479:				cgs.media.footsteps[ ci->footsteps ][rand()&3] );
;480:		}
line 481
;481:		break;
ADDRGP4 $312
JUMPV
LABELV $323
line 483
;482:	case EV_FOOTSTEP_METAL:
;483:		DEBUGNAME("EV_FOOTSTEP_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $324
ADDRGP4 $327
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $324
line 484
;484:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $312
line 485
;485:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+556+80
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 487
;486:				cgs.media.footsteps[ FOOTSTEP_METAL ][rand()&3] );
;487:		}
line 488
;488:		break;
ADDRGP4 $312
JUMPV
LABELV $334
line 490
;489:	case EV_FOOTSPLASH:
;490:		DEBUGNAME("EV_FOOTSPLASH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $335
ADDRGP4 $338
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $335
line 491
;491:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $312
line 492
;492:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+556+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 494
;493:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;494:		}
line 495
;495:		break;
ADDRGP4 $312
JUMPV
LABELV $345
line 497
;496:	case EV_FOOTWADE:
;497:		DEBUGNAME("EV_FOOTWADE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $346
ADDRGP4 $349
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $346
line 498
;498:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $312
line 499
;499:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+556+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 501
;500:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;501:		}
line 502
;502:		break;
ADDRGP4 $312
JUMPV
LABELV $356
line 504
;503:	case EV_SWIM:
;504:		DEBUGNAME("EV_SWIM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $357
ADDRGP4 $360
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $357
line 505
;505:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $312
line 506
;506:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+556+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 508
;507:				cgs.media.footsteps[ FOOTSTEP_SPLASH ][rand()&3] );
;508:		}
line 509
;509:		break;
ADDRGP4 $312
JUMPV
LABELV $367
line 513
;510:
;511:
;512:	case EV_FALL_SHORT:
;513:		DEBUGNAME("EV_FALL_SHORT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $368
ADDRGP4 $371
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $368
line 514
;514:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.landSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+740
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 515
;515:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $312
line 517
;516:			// smooth landing z changes
;517:			cg.landChange = -8;
ADDRGP4 cg+108936
CNSTF4 3238002688
ASGNF4
line 518
;518:			cg.landTime = cg.time;
ADDRGP4 cg+108940
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 519
;519:		}
line 520
;520:		break;
ADDRGP4 $312
JUMPV
LABELV $381
line 522
;521:	case EV_FALL_MEDIUM:
;522:		DEBUGNAME("EV_FALL_MEDIUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $382
ADDRGP4 $385
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $382
line 524
;523:		// use normal pain sound
;524:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $294
ARGP4
ADDRLP4 40
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 525
;525:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $312
line 527
;526:			// smooth landing z changes
;527:			cg.landChange = -16;
ADDRGP4 cg+108936
CNSTF4 3246391296
ASGNF4
line 528
;528:			cg.landTime = cg.time;
ADDRGP4 cg+108940
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 529
;529:		}
line 530
;530:		break;
ADDRGP4 $312
JUMPV
LABELV $393
line 532
;531:	case EV_FALL_FAR:
;532:		DEBUGNAME("EV_FALL_FAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $394
ADDRGP4 $397
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $394
line 533
;533:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $398
ARGP4
ADDRLP4 44
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 534
;534:		cent->pe.painTime = cg.time;	// don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 535
;535:		if ( clientNum == cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $312
line 537
;536:			// smooth landing z changes
;537:			cg.landChange = -24;
ADDRGP4 cg+108936
CNSTF4 3250585600
ASGNF4
line 538
;538:			cg.landTime = cg.time;
ADDRGP4 cg+108940
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 539
;539:		}
line 540
;540:		break;
ADDRGP4 $312
JUMPV
LABELV $407
line 546
;541:
;542:	case EV_STEP_4:
;543:	case EV_STEP_8:
;544:	case EV_STEP_12:
;545:	case EV_STEP_16:		// smooth out step up transitions
;546:		DEBUGNAME("EV_STEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $408
ADDRGP4 $411
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $408
line 547
;547:	{
line 552
;548:		float	oldStep;
;549:		int		delta;
;550:		int		step;
;551:
;552:		if ( clientNum != cg.predictedPlayerState.clientNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
EQI4 $412
line 553
;553:			break;
ADDRGP4 $312
JUMPV
LABELV $412
line 556
;554:		}
;555:		// if we are interpolating, we don't need to smooth steps
;556:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $424
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 60
INDIRI4
NEI4 $424
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $424
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $416
LABELV $424
line 557
;557:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 558
;558:			break;
ADDRGP4 $312
JUMPV
LABELV $416
line 561
;559:		}
;560:		// check for stepping up before a previous step is completed
;561:		delta = cg.time - cg.stepTime;
ADDRLP4 48
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108924
INDIRI4
SUBI4
ASGNI4
line 562
;562:		if (delta < STEP_TIME) {
ADDRLP4 48
INDIRI4
CNSTI4 200
GEI4 $427
line 563
;563:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
ADDRLP4 52
ADDRGP4 cg+108920
INDIRF4
CNSTI4 200
ADDRLP4 48
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 564
;564:		} else {
ADDRGP4 $428
JUMPV
LABELV $427
line 565
;565:			oldStep = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 566
;566:		}
LABELV $428
line 569
;567:
;568:		// add this amount
;569:		step = 4 * (event - EV_STEP_4 + 1 );
ADDRLP4 56
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 24
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 570
;570:		cg.stepChange = oldStep + step;
ADDRGP4 cg+108920
ADDRLP4 52
INDIRF4
ADDRLP4 56
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 571
;571:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+108920
INDIRF4
CNSTF4 1107296256
LEF4 $431
line 572
;572:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+108920
CNSTF4 1107296256
ASGNF4
line 573
;573:		}
LABELV $431
line 574
;574:		cg.stepTime = cg.time;
ADDRGP4 cg+108924
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 575
;575:		break;
ADDRGP4 $312
JUMPV
LABELV $437
line 579
;576:	}
;577:
;578:	case EV_JUMP_PAD:
;579:		DEBUGNAME("EV_JUMP_PAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $438
ADDRGP4 $441
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $438
line 581
;580://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;581:		{
line 583
;582:			localEntity_t	*smoke;
;583:			vec3_t			up = {0, 0, 1};
ADDRLP4 48
ADDRGP4 $442
INDIRB
ASGNB 12
line 586
;584:
;585:
;586:			smoke = CG_SmokePuff( cent->lerpOrigin, up, 
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRLP4 48
ARGP4
CNSTF4 1107296256
ARGF4
ADDRLP4 64
CNSTF4 1065353216
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
CNSTF4 1051260355
ARGF4
CNSTF4 1148846080
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cgs+152340+284
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 68
INDIRP4
ASGNP4
line 593
;587:						  32, 
;588:						  1, 1, 1, 0.33f,
;589:						  1000, 
;590:						  cg.time, 0,
;591:						  LEF_PUFF_DONT_SCALE, 
;592:						  cgs.media.smokePuffShader );
;593:		}
line 596
;594:
;595:		// boing sound at origin, jump sound on player
;596:		trap_S_StartSound ( cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound );
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 cgs+152340+748
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 597
;597:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $448
ARGP4
ADDRLP4 48
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 598
;598:		break;
ADDRGP4 $312
JUMPV
LABELV $449
line 601
;599:
;600:	case EV_JUMP:
;601:		DEBUGNAME("EV_JUMP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $450
ADDRGP4 $453
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $450
line 602
;602:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $448
ARGP4
ADDRLP4 52
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 603
;603:		break;
ADDRGP4 $312
JUMPV
LABELV $454
line 605
;604:	case EV_TAUNT:
;605:		DEBUGNAME("EV_TAUNT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $455
ADDRGP4 $458
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $455
line 606
;606:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $459
ARGP4
ADDRLP4 56
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 607
;607:		break;
ADDRGP4 $312
JUMPV
LABELV $460
line 635
;608:#ifdef MISSIONPACK
;609:	case EV_TAUNT_YES:
;610:		DEBUGNAME("EV_TAUNT_YES");
;611:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
;612:		break;
;613:	case EV_TAUNT_NO:
;614:		DEBUGNAME("EV_TAUNT_NO");
;615:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
;616:		break;
;617:	case EV_TAUNT_FOLLOWME:
;618:		DEBUGNAME("EV_TAUNT_FOLLOWME");
;619:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
;620:		break;
;621:	case EV_TAUNT_GETFLAG:
;622:		DEBUGNAME("EV_TAUNT_GETFLAG");
;623:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
;624:		break;
;625:	case EV_TAUNT_GUARDBASE:
;626:		DEBUGNAME("EV_TAUNT_GUARDBASE");
;627:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
;628:		break;
;629:	case EV_TAUNT_PATROL:
;630:		DEBUGNAME("EV_TAUNT_PATROL");
;631:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
;632:		break;
;633:#endif
;634:	case EV_WATER_TOUCH:
;635:		DEBUGNAME("EV_WATER_TOUCH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $461
ADDRGP4 $464
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $461
line 636
;636:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+852
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 637
;637:		break;
ADDRGP4 $312
JUMPV
LABELV $467
line 639
;638:	case EV_WATER_LEAVE:
;639:		DEBUGNAME("EV_WATER_LEAVE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $468
ADDRGP4 $471
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $468
line 640
;640:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+856
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 641
;641:		break;
ADDRGP4 $312
JUMPV
LABELV $474
line 643
;642:	case EV_WATER_UNDER:
;643:		DEBUGNAME("EV_WATER_UNDER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $475
ADDRGP4 $478
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $475
line 644
;644:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+860
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 645
;645:		break;
ADDRGP4 $312
JUMPV
LABELV $481
line 647
;646:	case EV_WATER_CLEAR:
;647:		DEBUGNAME("EV_WATER_CLEAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $482
ADDRGP4 $485
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $482
line 648
;648:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $486
ARGP4
ADDRLP4 60
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 649
;649:		break;
ADDRGP4 $312
JUMPV
LABELV $487
line 652
;650:
;651:	case EV_ITEM_PICKUP:
;652:		DEBUGNAME("EV_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $488
ADDRGP4 $491
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $488
line 653
;653:		{
line 657
;654:			gitem_t	*item;
;655:			int		index;
;656:
;657:			index = es->eventParm;		// player predicted
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 659
;658:
;659:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 72
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 1
LTI4 $494
ADDRLP4 72
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $492
LABELV $494
line 660
;660:				break;
ADDRGP4 $312
JUMPV
LABELV $492
line 662
;661:			}
;662:			item = &bg_itemlist[ index ];
ADDRLP4 68
CNSTI4 52
ADDRLP4 64
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 666
;663:
;664:			// powerups and team items will have a separate global sound, this one
;665:			// will be played at prediction time
;666:			if ( item->giType == IT_POWERUP || item->giType == IT_TEAM) {
ADDRLP4 76
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 5
EQI4 $497
ADDRLP4 76
INDIRI4
CNSTI4 8
NEI4 $495
LABELV $497
line 667
;667:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.n_healthSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+1004
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 668
;668:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
ADDRGP4 $496
JUMPV
LABELV $495
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $500
line 685
;669:#ifdef MISSIONPACK
;670:				switch (item->giTag ) {
;671:					case PW_SCOUT:
;672:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.scoutSound );
;673:					break;
;674:					case PW_GUARD:
;675:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.guardSound );
;676:					break;
;677:					case PW_DOUBLER:
;678:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.doublerSound );
;679:					break;
;680:					case PW_AMMOREGEN:
;681:						trap_S_StartSound (NULL, es->number, CHAN_AUTO,	cgs.media.ammoregenSound );
;682:					break;
;683:				}
;684:#endif
;685:			} else {
ADDRGP4 $501
JUMPV
LABELV $500
line 686
;686:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 80
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 687
;687:			}
LABELV $501
LABELV $496
line 690
;688:
;689:			// show icon and name on status bar
;690:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $312
line 691
;691:				CG_ItemPickup( index );
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 692
;692:			}
line 693
;693:		}
line 694
;694:		break;
ADDRGP4 $312
JUMPV
LABELV $505
line 697
;695:
;696:	case EV_GLOBAL_ITEM_PICKUP:
;697:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $506
ADDRGP4 $509
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $506
line 698
;698:		{
line 702
;699:			gitem_t	*item;
;700:			int		index;
;701:
;702:			index = es->eventParm;		// player predicted
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 704
;703:
;704:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 72
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 1
LTI4 $512
ADDRLP4 72
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $510
LABELV $512
line 705
;705:				break;
ADDRGP4 $312
JUMPV
LABELV $510
line 707
;706:			}
;707:			item = &bg_itemlist[ index ];
ADDRLP4 68
CNSTI4 52
ADDRLP4 64
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 709
;708:			// powerup pickups are global
;709:			if( item->pickup_sound ) {
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $513
line 710
;710:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 76
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 711
;711:			}
LABELV $513
line 714
;712:
;713:			// show icon and name on status bar
;714:			if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $312
line 715
;715:				CG_ItemPickup( index );
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 716
;716:			}
line 717
;717:		}
line 718
;718:		break;
ADDRGP4 $312
JUMPV
LABELV $519
line 724
;719:
;720:	//
;721:	// weapon events
;722:	//
;723:	case EV_NOAMMO:
;724:		DEBUGNAME("EV_NOAMMO");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $520
ADDRGP4 $523
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $520
line 726
;725://		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;726:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $312
line 727
;727:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 728
;728:		}
line 729
;729:		break;
ADDRGP4 $312
JUMPV
LABELV $527
line 731
;730:	case EV_CHANGE_WEAPON:
;731:		DEBUGNAME("EV_CHANGE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $528
ADDRGP4 $531
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $528
line 732
;732:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.selectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+544
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 733
;733:		break;
ADDRGP4 $312
JUMPV
LABELV $534
line 735
;734:	case EV_FIRE_WEAPON:
;735:		DEBUGNAME("EV_FIRE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $535
ADDRGP4 $538
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $535
line 736
;736:		CG_FireWeapon( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 737
;737:		break;
ADDRGP4 $312
JUMPV
LABELV $539
line 740
;738:
;739:	case EV_USE_ITEM0:
;740:		DEBUGNAME("EV_USE_ITEM0");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $540
ADDRGP4 $543
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $540
line 741
;741:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 742
;742:		break;
ADDRGP4 $312
JUMPV
LABELV $544
line 744
;743:	case EV_USE_ITEM1:
;744:		DEBUGNAME("EV_USE_ITEM1");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $545
ADDRGP4 $548
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $545
line 745
;745:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 746
;746:		break;
ADDRGP4 $312
JUMPV
LABELV $549
line 748
;747:	case EV_USE_ITEM2:
;748:		DEBUGNAME("EV_USE_ITEM2");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $550
ADDRGP4 $553
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $550
line 749
;749:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 750
;750:		break;
ADDRGP4 $312
JUMPV
LABELV $554
line 752
;751:	case EV_USE_ITEM3:
;752:		DEBUGNAME("EV_USE_ITEM3");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $555
ADDRGP4 $558
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $555
line 753
;753:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 754
;754:		break;
ADDRGP4 $312
JUMPV
LABELV $559
line 756
;755:	case EV_USE_ITEM4:
;756:		DEBUGNAME("EV_USE_ITEM4");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $560
ADDRGP4 $563
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $560
line 757
;757:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 758
;758:		break;
ADDRGP4 $312
JUMPV
LABELV $564
line 760
;759:	case EV_USE_ITEM5:
;760:		DEBUGNAME("EV_USE_ITEM5");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $565
ADDRGP4 $568
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $565
line 761
;761:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 762
;762:		break;
ADDRGP4 $312
JUMPV
LABELV $569
line 764
;763:	case EV_USE_ITEM6:
;764:		DEBUGNAME("EV_USE_ITEM6");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $570
ADDRGP4 $573
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $570
line 765
;765:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 766
;766:		break;
ADDRGP4 $312
JUMPV
LABELV $574
line 768
;767:	case EV_USE_ITEM7:
;768:		DEBUGNAME("EV_USE_ITEM7");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $575
ADDRGP4 $578
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $575
line 769
;769:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 770
;770:		break;
ADDRGP4 $312
JUMPV
LABELV $579
line 772
;771:	case EV_USE_ITEM8:
;772:		DEBUGNAME("EV_USE_ITEM8");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $580
ADDRGP4 $583
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $580
line 773
;773:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 774
;774:		break;
ADDRGP4 $312
JUMPV
LABELV $584
line 776
;775:	case EV_USE_ITEM9:
;776:		DEBUGNAME("EV_USE_ITEM9");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $585
ADDRGP4 $588
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $585
line 777
;777:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 778
;778:		break;
ADDRGP4 $312
JUMPV
LABELV $589
line 780
;779:	case EV_USE_ITEM10:
;780:		DEBUGNAME("EV_USE_ITEM10");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $590
ADDRGP4 $593
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $590
line 781
;781:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 782
;782:		break;
ADDRGP4 $312
JUMPV
LABELV $594
line 784
;783:	case EV_USE_ITEM11:
;784:		DEBUGNAME("EV_USE_ITEM11");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $595
ADDRGP4 $598
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $595
line 785
;785:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 786
;786:		break;
ADDRGP4 $312
JUMPV
LABELV $599
line 788
;787:	case EV_USE_ITEM12:
;788:		DEBUGNAME("EV_USE_ITEM12");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $600
ADDRGP4 $603
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $600
line 789
;789:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 790
;790:		break;
ADDRGP4 $312
JUMPV
LABELV $604
line 792
;791:	case EV_USE_ITEM13:
;792:		DEBUGNAME("EV_USE_ITEM13");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $605
ADDRGP4 $608
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $605
line 793
;793:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 794
;794:		break;
ADDRGP4 $312
JUMPV
LABELV $609
line 796
;795:	case EV_USE_ITEM14:
;796:		DEBUGNAME("EV_USE_ITEM14");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $610
ADDRGP4 $613
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $610
line 797
;797:		CG_UseItem( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 798
;798:		break;
ADDRGP4 $312
JUMPV
LABELV $614
line 806
;799:
;800:	//=================================================================
;801:
;802:	//
;803:	// other events
;804:	//
;805:	case EV_PLAYER_TELEPORT_IN:
;806:		DEBUGNAME("EV_PLAYER_TELEPORT_IN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $615
ADDRGP4 $618
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $615
line 807
;807:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleInSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+720
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 808
;808:		CG_SpawnEffect( position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 809
;809:		break;
ADDRGP4 $312
JUMPV
LABELV $621
line 812
;810:
;811:	case EV_PLAYER_TELEPORT_OUT:
;812:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $622
ADDRGP4 $625
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $622
line 813
;813:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+724
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 814
;814:		CG_SpawnEffect(  position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 815
;815:		break;
ADDRGP4 $312
JUMPV
LABELV $628
line 818
;816:
;817:	case EV_ITEM_POP:
;818:		DEBUGNAME("EV_ITEM_POP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $629
ADDRGP4 $632
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $629
line 819
;819:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+732
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 820
;820:		break;
ADDRGP4 $312
JUMPV
LABELV $635
line 822
;821:	case EV_ITEM_RESPAWN:
;822:		DEBUGNAME("EV_ITEM_RESPAWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $636
ADDRGP4 $639
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $636
line 823
;823:		cent->miscTime = cg.time;	// scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 824
;824:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.respawnSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+732
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 825
;825:		break;
ADDRGP4 $312
JUMPV
LABELV $643
line 828
;826:
;827:	case EV_GRENADE_BOUNCE:
;828:		DEBUGNAME("EV_GRENADE_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $644
ADDRGP4 $647
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $644
line 829
;829:		if ( rand() & 1 ) {
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $648
line 830
;830:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+1008
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 831
;831:		} else {
ADDRGP4 $312
JUMPV
LABELV $648
line 832
;832:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+152340+1012
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 833
;833:		}
line 834
;834:		break;
ADDRGP4 $312
JUMPV
LABELV $654
line 878
;835:
;836:#ifdef MISSIONPACK
;837:	case EV_PROXIMITY_MINE_STICK:
;838:		DEBUGNAME("EV_PROXIMITY_MINE_STICK");
;839:		if( es->eventParm & SURF_FLESH ) {
;840:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound );
;841:		} else 	if( es->eventParm & SURF_METALSTEPS ) {
;842:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound );
;843:		} else {
;844:			trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound );
;845:		}
;846:		break;
;847:
;848:	case EV_PROXIMITY_MINE_TRIGGER:
;849:		DEBUGNAME("EV_PROXIMITY_MINE_TRIGGER");
;850:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound );
;851:		break;
;852:	case EV_KAMIKAZE:
;853:		DEBUGNAME("EV_KAMIKAZE");
;854:		CG_KamikazeEffect( cent->lerpOrigin );
;855:		break;
;856:	case EV_OBELISKEXPLODE:
;857:		DEBUGNAME("EV_OBELISKEXPLODE");
;858:		CG_ObeliskExplode( cent->lerpOrigin, es->eventParm );
;859:		break;
;860:	case EV_OBELISKPAIN:
;861:		DEBUGNAME("EV_OBELISKPAIN");
;862:		CG_ObeliskPain( cent->lerpOrigin );
;863:		break;
;864:	case EV_INVUL_IMPACT:
;865:		DEBUGNAME("EV_INVUL_IMPACT");
;866:		CG_InvulnerabilityImpact( cent->lerpOrigin, cent->currentState.angles );
;867:		break;
;868:	case EV_JUICED:
;869:		DEBUGNAME("EV_JUICED");
;870:		CG_InvulnerabilityJuiced( cent->lerpOrigin );
;871:		break;
;872:	case EV_LIGHTNINGBOLT:
;873:		DEBUGNAME("EV_LIGHTNINGBOLT");
;874:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
;875:		break;
;876:#endif
;877:	case EV_SCOREPLUM:
;878:		DEBUGNAME("EV_SCOREPLUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $655
ADDRGP4 $658
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $655
line 879
;879:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ScorePlum
CALLV
pop
line 880
;880:		break;
ADDRGP4 $312
JUMPV
LABELV $659
line 886
;881:
;882:	//
;883:	// missile impacts
;884:	//
;885:	case EV_MISSILE_HIT:
;886:		DEBUGNAME("EV_MISSILE_HIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $660
ADDRGP4 $663
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $660
line 887
;887:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 888
;888:		CG_MissileHitPlayer( es->weapon, position, dir, es->otherEntityNum );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 889
;889:		break;
ADDRGP4 $312
JUMPV
LABELV $664
line 892
;890:
;891:	case EV_MISSILE_MISS:
;892:		DEBUGNAME("EV_MISSILE_MISS");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $665
ADDRGP4 $668
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $665
line 893
;893:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 894
;894:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 895
;895:		break;
ADDRGP4 $312
JUMPV
LABELV $669
line 898
;896:
;897:	case EV_MISSILE_MISS_METAL:
;898:		DEBUGNAME("EV_MISSILE_MISS_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $670
ADDRGP4 $673
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $670
line 899
;899:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 900
;900:		CG_MissileHitWall( es->weapon, 0, position, dir, IMPACTSOUND_METAL );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 901
;901:		break;
ADDRGP4 $312
JUMPV
LABELV $674
line 904
;902:
;903:	case EV_RAILTRAIL:
;904:		DEBUGNAME("EV_RAILTRAIL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $675
ADDRGP4 $678
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $675
line 905
;905:		cent->currentState.weapon = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 907
;906:		// if the end was on a nomark surface, don't make an explosion
;907:		CG_RailTrail( ci, es->origin2, es->pos.trBase );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CG_RailTrail
CALLV
pop
line 908
;908:		if ( es->eventParm != 255 ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 255
EQI4 $312
line 909
;909:			ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 910
;910:			CG_MissileHitWall( es->weapon, es->clientNum, position, dir, IMPACTSOUND_DEFAULT );
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 911
;911:		}
line 912
;912:		break;
ADDRGP4 $312
JUMPV
LABELV $681
line 915
;913:
;914:	case EV_BULLET_HIT_WALL:
;915:		DEBUGNAME("EV_BULLET_HIT_WALL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $682
ADDRGP4 $685
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $682
line 916
;916:		ByteToDir( es->eventParm, dir );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 917
;917:		CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1022
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 918
;918:		break;
ADDRGP4 $312
JUMPV
LABELV $686
line 921
;919:
;920:	case EV_BULLET_HIT_FLESH:
;921:		DEBUGNAME("EV_BULLET_HIT_FLESH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $687
ADDRGP4 $690
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $687
line 922
;922:		CG_Bullet( es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 923
;923:		break;
ADDRGP4 $312
JUMPV
LABELV $691
line 926
;924:
;925:	case EV_SHOTGUN:
;926:		DEBUGNAME("EV_SHOTGUN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $692
ADDRGP4 $695
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $692
line 927
;927:		CG_ShotgunFire( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 928
;928:		break;
ADDRGP4 $312
JUMPV
LABELV $696
line 931
;929:
;930:	case EV_GENERAL_SOUND:
;931:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $697
ADDRGP4 $700
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $697
line 932
;932:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
CNSTI4 0
EQI4 $701
line 933
;933:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 934
;934:		} else {
ADDRGP4 $312
JUMPV
LABELV $701
line 935
;935:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 92
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 92
INDIRP4
ASGNP4
line 936
;936:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 937
;937:		}
line 938
;938:		break;
ADDRGP4 $312
JUMPV
LABELV $705
line 941
;939:
;940:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;941:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $706
ADDRGP4 $709
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $706
line 942
;942:		if ( cgs.gameSounds[ es->eventParm ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
CNSTI4 0
EQI4 $710
line 943
;943:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 92
CNSTI4 184
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 944
;944:		} else {
ADDRGP4 $312
JUMPV
LABELV $710
line 945
;945:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 92
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 92
INDIRP4
ASGNP4
line 946
;946:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 947
;947:		}
line 948
;948:		break;
ADDRGP4 $312
JUMPV
LABELV $716
line 951
;949:
;950:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;951:		{
line 952
;952:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $717
ADDRGP4 $720
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $717
line 953
;953:			switch( es->eventParm ) {
ADDRLP4 92
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
LTI4 $312
ADDRLP4 92
INDIRI4
CNSTI4 12
GTI4 $312
ADDRLP4 92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $839
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $839
address $724
address $734
address $744
address $756
address $768
address $788
address $808
address $816
address $824
address $827
address $830
address $833
address $836
code
LABELV $724
line 955
;954:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;955:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $725
line 956
;956:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+152340+900
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $312
JUMPV
LABELV $725
line 958
;957:					else
;958:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+152340+904
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 959
;959:					break;
ADDRGP4 $312
JUMPV
LABELV $734
line 961
;960:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;961:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $735
line 962
;962:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+152340+900
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $312
JUMPV
LABELV $735
line 964
;963:					else
;964:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+152340+904
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 965
;965:					break;
ADDRGP4 $312
JUMPV
LABELV $744
line 967
;966:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;967:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $745
line 968
;968:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+152340+908
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $746
JUMPV
LABELV $745
line 970
;969:					else
;970:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+152340+912
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $746
line 972
;971:					//
;972:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+152340+928
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 973
;973:					break;
ADDRGP4 $312
JUMPV
LABELV $756
line 975
;974:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;975:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $757
line 976
;976:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+152340+908
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $758
JUMPV
LABELV $757
line 978
;977:					else
;978:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+152340+912
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $758
line 980
;979:					//
;980:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+152340+924
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 981
;981:					break;
ADDRGP4 $312
JUMPV
LABELV $768
line 985
;982:
;983:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;984:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;985:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $773
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $769
LABELV $773
line 986
;986:					}
ADDRGP4 $312
JUMPV
LABELV $769
line 987
;987:					else {
line 988
;988:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $774
line 994
;989:#ifdef MISSIONPACK
;990:							if (cgs.gametype == GT_1FCTF) 
;991:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;992:							else
;993:#endif
;994:						 	CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+152340+936
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 995
;995:						}
ADDRGP4 $312
JUMPV
LABELV $774
line 996
;996:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $312
line 1002
;997:#ifdef MISSIONPACK
;998:							if (cgs.gametype == GT_1FCTF)
;999:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1000:							else
;1001:#endif
;1002: 							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+152340+944
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1003
;1003:						}
line 1004
;1004:					}
line 1005
;1005:					break;
ADDRGP4 $312
JUMPV
LABELV $788
line 1008
;1006:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1007:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1008:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $793
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $789
LABELV $793
line 1009
;1009:					}
ADDRGP4 $312
JUMPV
LABELV $789
line 1010
;1010:					else {
line 1011
;1011:						if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $794
line 1017
;1012:#ifdef MISSIONPACK
;1013:							if (cgs.gametype == GT_1FCTF)
;1014:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;1015:							else
;1016:#endif
;1017:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+152340+936
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1018
;1018:						}
ADDRGP4 $312
JUMPV
LABELV $794
line 1019
;1019:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $312
line 1025
;1020:#ifdef MISSIONPACK
;1021:							if (cgs.gametype == GT_1FCTF)
;1022:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;1023:							else
;1024:#endif
;1025:							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+152340+944
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1026
;1026:						}
line 1027
;1027:					}
line 1028
;1028:					break;
ADDRGP4 $312
JUMPV
LABELV $808
line 1030
;1029:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;1030:					if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $312
line 1031
;1031:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+152340+956
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1032
;1032:					}
line 1033
;1033:					break;
ADDRGP4 $312
JUMPV
LABELV $816
line 1035
;1034:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;1035:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $312
line 1036
;1036:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+152340+956
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1037
;1037:					}
line 1038
;1038:					break;
ADDRGP4 $312
JUMPV
LABELV $824
line 1041
;1039:
;1040:				case GTS_REDTEAM_SCORED:
;1041:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+152340+880
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1042
;1042:					break;
ADDRGP4 $312
JUMPV
LABELV $827
line 1044
;1043:				case GTS_BLUETEAM_SCORED:
;1044:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+152340+884
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1045
;1045:					break;
ADDRGP4 $312
JUMPV
LABELV $830
line 1047
;1046:				case GTS_REDTEAM_TOOK_LEAD:
;1047:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+152340+888
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1048
;1048:					break;
ADDRGP4 $312
JUMPV
LABELV $833
line 1050
;1049:				case GTS_BLUETEAM_TOOK_LEAD:
;1050:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+152340+892
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1051
;1051:					break;
ADDRGP4 $312
JUMPV
LABELV $836
line 1053
;1052:				case GTS_TEAMS_ARE_TIED:
;1053:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+152340+896
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1054
;1054:					break;
line 1061
;1055:#ifdef MISSIONPACK
;1056:				case GTS_KAMIKAZE:
;1057:					trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
;1058:					break;
;1059:#endif
;1060:				default:
;1061:					break;
line 1063
;1062:			}
;1063:			break;
ADDRGP4 $312
JUMPV
LABELV $840
line 1069
;1064:		}
;1065:
;1066:	case EV_PAIN:
;1067:		// local player sounds are triggered in CG_CheckLocalSounds,
;1068:		// so ignore events on the player
;1069:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $841
ADDRGP4 $844
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $841
line 1070
;1070:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $312
line 1071
;1071:			CG_PainEvent( cent, es->eventParm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 1072
;1072:		}
line 1073
;1073:		break;
ADDRGP4 $312
JUMPV
LABELV $848
line 1078
;1074:
;1075:	case EV_DEATH1:
;1076:	case EV_DEATH2:
;1077:	case EV_DEATH3:
;1078:		DEBUGNAME("EV_DEATHx");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $849
ADDRGP4 $852
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $849
line 1079
;1079:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, 
ADDRGP4 $853
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 57
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1081
;1080:				CG_CustomSound( es->number, va("*death%i.wav", event - EV_DEATH1 + 1) ) );
;1081:		break;
ADDRGP4 $312
JUMPV
LABELV $854
line 1085
;1082:
;1083:
;1084:	case EV_OBITUARY:
;1085:		DEBUGNAME("EV_OBITUARY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $855
ADDRGP4 $858
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $855
line 1086
;1086:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1087
;1087:		break;
ADDRGP4 $312
JUMPV
LABELV $859
line 1093
;1088:
;1089:	//
;1090:	// powerup events
;1091:	//
;1092:	case EV_POWERUP_QUAD:
;1093:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $860
ADDRGP4 $863
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $860
line 1094
;1094:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $864
line 1095
;1095:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+124408
CNSTI4 1
ASGNI4
line 1096
;1096:			cg.powerupTime = cg.time;
ADDRGP4 cg+124412
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1097
;1097:		}
LABELV $864
line 1098
;1098:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152340+536
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1099
;1099:		break;
ADDRGP4 $312
JUMPV
LABELV $872
line 1101
;1100:	case EV_POWERUP_BATTLESUIT:
;1101:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $873
ADDRGP4 $876
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $873
line 1102
;1102:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $877
line 1103
;1103:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+124408
CNSTI4 2
ASGNI4
line 1104
;1104:			cg.powerupTime = cg.time;
ADDRGP4 cg+124412
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1105
;1105:		}
LABELV $877
line 1106
;1106:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152340+1000
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1107
;1107:		break;
ADDRGP4 $312
JUMPV
LABELV $885
line 1109
;1108:	case EV_POWERUP_REGEN:
;1109:		DEBUGNAME("EV_POWERUP_REGEN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $886
ADDRGP4 $889
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $886
line 1110
;1110:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $890
line 1111
;1111:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+124408
CNSTI4 5
ASGNI4
line 1112
;1112:			cg.powerupTime = cg.time;
ADDRGP4 cg+124412
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1113
;1113:		}
LABELV $890
line 1114
;1114:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152340+996
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1115
;1115:		break;
ADDRGP4 $312
JUMPV
LABELV $898
line 1118
;1116:
;1117:	case EV_GIB_PLAYER:
;1118:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $899
ADDRGP4 $902
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $899
line 1122
;1119:		// don't play gib sound when using the kamikaze because it interferes
;1120:		// with the kamikaze sound, downside is that the gib sound will also
;1121:		// not be played when someone is gibbed while just carrying the kamikaze
;1122:		if ( !(es->eFlags & EF_KAMIKAZE) ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $903
line 1123
;1123:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152340+704
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1124
;1124:		}
LABELV $903
line 1125
;1125:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1126
;1126:		break;
ADDRGP4 $312
JUMPV
LABELV $907
line 1129
;1127:
;1128:	case EV_STOPLOOPINGSOUND:
;1129:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $908
ADDRGP4 $911
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $908
line 1130
;1130:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1131
;1131:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1132
;1132:		break;
ADDRGP4 $312
JUMPV
LABELV $912
line 1135
;1133:
;1134:	case EV_DEBUG_LINE:
;1135:		DEBUGNAME("EV_DEBUG_LINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $913
ADDRGP4 $916
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $913
line 1136
;1136:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1137
;1137:		break;
ADDRGP4 $312
JUMPV
LABELV $311
line 1140
;1138:
;1139:	default:
;1140:		DEBUGNAME("UNKNOWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $917
ADDRGP4 $920
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $917
line 1141
;1141:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $921
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1142
;1142:		break;
LABELV $312
line 1145
;1143:	}
;1144:
;1145:}
LABELV $296
endproc CG_EntityEvent 108 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1154
;1146:
;1147:
;1148:/*
;1149:==============
;1150:CG_CheckEvents
;1151:
;1152:==============
;1153:*/
;1154:void CG_CheckEvents( centity_t *cent ) {
line 1156
;1155:	// check for event-only entities
;1156:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
LEI4 $925
line 1157
;1157:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
EQI4 $927
line 1158
;1158:			return;	// already fired
ADDRGP4 $924
JUMPV
LABELV $927
line 1161
;1159:		}
;1160:		// if this is a player event set the entity number of the client entity number
;1161:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $929
line 1162
;1162:			cent->currentState.number = cent->currentState.otherEntityNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1163
;1163:		}
LABELV $929
line 1165
;1164:
;1165:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 1
ASGNI4
line 1167
;1166:
;1167:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
SUBI4
ASGNI4
line 1168
;1168:	} else {
ADDRGP4 $926
JUMPV
LABELV $925
line 1170
;1169:		// check for events riding with another entity
;1170:		if ( cent->currentState.event == cent->previousEvent ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
NEI4 $931
line 1171
;1171:			return;
ADDRGP4 $924
JUMPV
LABELV $931
line 1173
;1172:		}
;1173:		cent->previousEvent = cent->currentState.event;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 428
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1174
;1174:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $933
line 1175
;1175:			return;
ADDRGP4 $924
JUMPV
LABELV $933
line 1177
;1176:		}
;1177:	}
LABELV $926
line 1180
;1178:
;1179:	// calculate the position at exactly the frame time
;1180:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1181
;1181:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1183
;1182:
;1183:	CG_EntityEvent( cent, cent->lerpOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 1184
;1184:}
LABELV $924
endproc CG_CheckEvents 8 12
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
import CG_InitConsoleCommands
import CG_ConsoleCommand
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
LABELV $921
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $920
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $916
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 85
byte 1 71
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $911
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 79
byte 1 80
byte 1 76
byte 1 79
byte 1 79
byte 1 80
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $902
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 73
byte 1 66
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $889
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 82
byte 1 69
byte 1 71
byte 1 69
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $876
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 66
byte 1 65
byte 1 84
byte 1 84
byte 1 76
byte 1 69
byte 1 83
byte 1 85
byte 1 73
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $863
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 81
byte 1 85
byte 1 65
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $858
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 66
byte 1 73
byte 1 84
byte 1 85
byte 1 65
byte 1 82
byte 1 89
byte 1 10
byte 1 0
align 1
LABELV $853
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $852
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 120
byte 1 10
byte 1 0
align 1
LABELV $844
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 65
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $720
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
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $709
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
byte 1 10
byte 1 0
align 1
LABELV $700
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
byte 1 10
byte 1 0
align 1
LABELV $695
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 71
byte 1 85
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $690
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 70
byte 1 76
byte 1 69
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $685
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 87
byte 1 65
byte 1 76
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $678
byte 1 69
byte 1 86
byte 1 95
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 84
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $673
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $668
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $663
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $658
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 67
byte 1 79
byte 1 82
byte 1 69
byte 1 80
byte 1 76
byte 1 85
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $647
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 95
byte 1 66
byte 1 79
byte 1 85
byte 1 78
byte 1 67
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $639
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 82
byte 1 69
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $632
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 79
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $625
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 79
byte 1 85
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $618
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $613
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 52
byte 1 10
byte 1 0
align 1
LABELV $608
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $603
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $598
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $593
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $588
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 57
byte 1 10
byte 1 0
align 1
LABELV $583
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 56
byte 1 10
byte 1 0
align 1
LABELV $578
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $573
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 54
byte 1 10
byte 1 0
align 1
LABELV $568
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 53
byte 1 10
byte 1 0
align 1
LABELV $563
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 52
byte 1 10
byte 1 0
align 1
LABELV $558
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $553
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $548
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $543
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $538
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $531
byte 1 69
byte 1 86
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 78
byte 1 71
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $523
byte 1 69
byte 1 86
byte 1 95
byte 1 78
byte 1 79
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 10
byte 1 0
align 1
LABELV $509
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
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $491
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $486
byte 1 42
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $485
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 67
byte 1 76
byte 1 69
byte 1 65
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $478
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 85
byte 1 78
byte 1 68
byte 1 69
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $471
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 76
byte 1 69
byte 1 65
byte 1 86
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $464
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 79
byte 1 85
byte 1 67
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $459
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $458
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $453
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $448
byte 1 42
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $441
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 95
byte 1 80
byte 1 65
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $411
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $398
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $397
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 70
byte 1 65
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $385
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 77
byte 1 69
byte 1 68
byte 1 73
byte 1 85
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $371
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 82
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $360
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 87
byte 1 73
byte 1 77
byte 1 10
byte 1 0
align 1
LABELV $349
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 87
byte 1 65
byte 1 68
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $338
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 10
byte 1 0
align 1
LABELV $327
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 10
byte 1 0
align 1
LABELV $317
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $306
byte 1 90
byte 1 69
byte 1 82
byte 1 79
byte 1 69
byte 1 86
byte 1 69
byte 1 78
byte 1 84
byte 1 10
byte 1 0
align 1
LABELV $300
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $294
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $293
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $290
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $287
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $250
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $249
byte 1 78
byte 1 111
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $239
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $238
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $233
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $232
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $231
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $229
byte 1 39
byte 1 115
byte 1 32
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $228
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $226
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $224
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $221
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $220
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $218
byte 1 97
byte 1 108
byte 1 109
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 100
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $216
byte 1 39
byte 1 115
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $214
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $213
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 101
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $211
byte 1 39
byte 1 115
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $210
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $208
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $206
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $204
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 117
byte 1 109
byte 1 109
byte 1 101
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $202
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $191
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $188
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $185
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $178
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $174
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $173
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $170
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $167
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $165
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $164
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $161
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $157
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $156
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $153
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $149
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $148
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $145
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $135
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $133
byte 1 115
byte 1 97
byte 1 119
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $131
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 102
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 0
align 1
LABELV $129
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $127
byte 1 115
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 108
byte 1 105
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $125
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 113
byte 1 117
byte 1 105
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $121
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $117
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $116
byte 1 110
byte 1 0
align 1
LABELV $109
byte 1 67
byte 1 71
byte 1 95
byte 1 79
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
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
byte 1 0
align 1
LABELV $104
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $103
byte 1 37
byte 1 105
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $102
byte 1 37
byte 1 105
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $99
byte 1 37
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $96
byte 1 37
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $93
byte 1 49
byte 1 51
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $90
byte 1 49
byte 1 50
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $87
byte 1 49
byte 1 49
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $84
byte 1 94
byte 1 51
byte 1 51
byte 1 114
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $81
byte 1 94
byte 1 49
byte 1 50
byte 1 110
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $78
byte 1 94
byte 1 52
byte 1 49
byte 1 115
byte 1 116
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $75
byte 1 0
align 1
LABELV $74
byte 1 84
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 0
