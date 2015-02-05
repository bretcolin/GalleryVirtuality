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
;8:
;9:#include "../../ui/menudef.h"
;10:
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
CNSTI4 13
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $168
ADDRLP4 44
INDIRI4
ADDRLP4 124
INDIRI4
GTI4 $178
LABELV $177
ADDRLP4 44
INDIRI4
CNSTI4 5
EQI4 $144
ADDRLP4 44
INDIRI4
CNSTI4 7
EQI4 $152
ADDRLP4 44
INDIRI4
CNSTI4 9
EQI4 $160
ADDRGP4 $140
JUMPV
LABELV $178
ADDRLP4 44
INDIRI4
CNSTI4 26
EQI4 $142
ADDRGP4 $140
JUMPV
LABELV $142
line 136
;134:
;135:		case MOD_KAMIKAZE:
;136:			message = "goes out with a bang";
ADDRLP4 40
ADDRGP4 $143
ASGNP4
line 137
;137:			break;
ADDRGP4 $141
JUMPV
LABELV $144
line 140
;138:
;139:		case MOD_GRENADE_SPLASH:
;140:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $145
line 141
;141:				message = "tripped on her own grenade";
ADDRLP4 40
ADDRGP4 $147
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $145
line 142
;142:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $148
line 143
;143:				message = "tripped on its own grenade";
ADDRLP4 40
ADDRGP4 $150
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $148
line 145
;144:			else
;145:				message = "tripped on his own grenade";
ADDRLP4 40
ADDRGP4 $151
ASGNP4
line 146
;146:			break;
ADDRGP4 $141
JUMPV
LABELV $152
line 148
;147:		case MOD_ROCKET_SPLASH:
;148:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $153
line 149
;149:				message = "blew herself up";
ADDRLP4 40
ADDRGP4 $155
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $153
line 150
;150:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $156
line 151
;151:				message = "blew itself up";
ADDRLP4 40
ADDRGP4 $158
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $156
line 153
;152:			else
;153:				message = "blew himself up";
ADDRLP4 40
ADDRGP4 $159
ASGNP4
line 154
;154:			break;
ADDRGP4 $141
JUMPV
LABELV $160
line 156
;155:		case MOD_PLASMA_SPLASH:
;156:			if ( gender == GENDER_FEMALE )
ADDRLP4 96
INDIRI4
CNSTI4 1
NEI4 $161
line 157
;157:				message = "melted herself";
ADDRLP4 40
ADDRGP4 $163
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $161
line 158
;158:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $164
line 159
;159:				message = "melted itself";
ADDRLP4 40
ADDRGP4 $166
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $164
line 161
;160:			else
;161:				message = "melted himself";
ADDRLP4 40
ADDRGP4 $167
ASGNP4
line 162
;162:			break;
ADDRGP4 $141
JUMPV
LABELV $168
line 164
;163:		case MOD_BFG_SPLASH:
;164:			message = "should have used a smaller gun";
ADDRLP4 40
ADDRGP4 $169
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
NEI4 $170
line 179
;179:				message = "killed herself";
ADDRLP4 40
ADDRGP4 $172
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $170
line 180
;180:			else if ( gender == GENDER_NEUTER )
ADDRLP4 96
INDIRI4
CNSTI4 2
NEI4 $173
line 181
;181:				message = "killed itself";
ADDRLP4 40
ADDRGP4 $175
ASGNP4
ADDRGP4 $141
JUMPV
LABELV $173
line 183
;182:			else
;183:				message = "killed himself";
ADDRLP4 40
ADDRGP4 $176
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
EQU4 $179
line 189
;189:		CG_Printf( "%s %s.\n", targetName, message);
ADDRGP4 $181
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
LABELV $179
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
NEI4 $182
line 197
;195:		char	*s;
;196:
;197:		if ( cgs.gametype < GT_TEAM ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 3
GEI4 $185
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
ADDRGP4 $188
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
ADDRGP4 $186
JUMPV
LABELV $185
line 202
;202:			s = va("You fragged %s", targetName );
ADDRGP4 $191
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
LABELV $186
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
LABELV $182
line 216
;214:
;215:	// check for double client messages
;216:	if ( !attackerInfo ) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $192
line 217
;217:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 218
;218:		strcpy( attackerName, "noname" );
ADDRLP4 56
ARGP4
ADDRGP4 $194
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 219
;219:	} else {
ADDRGP4 $193
JUMPV
LABELV $192
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
NEI4 $195
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
LABELV $195
line 226
;226:	}
LABELV $193
line 228
;227:
;228:	if ( attacker != ENTITYNUM_WORLD ) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $200
line 229
;229:		switch (mod) {
ADDRLP4 44
INDIRI4
CNSTI4 1
LTI4 $202
ADDRLP4 44
INDIRI4
CNSTI4 28
GTI4 $202
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $237-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $237
address $210
address $206
address $208
address $212
address $215
address $218
address $220
address $222
address $225
address $226
address $228
address $230
address $230
address $202
address $202
address $202
address $202
address $233
address $202
address $202
address $202
address $202
address $202
address $202
address $202
address $202
address $202
address $204
code
LABELV $204
line 231
;230:		case MOD_HAND:
;231:			message = "was caught by";
ADDRLP4 40
ADDRGP4 $205
ASGNP4
line 232
;232:			break;
ADDRGP4 $203
JUMPV
LABELV $206
line 234
;233:		case MOD_GAUNTLET:
;234:			message = "was pummeled by";
ADDRLP4 40
ADDRGP4 $207
ASGNP4
line 235
;235:			break;
ADDRGP4 $203
JUMPV
LABELV $208
line 237
;236:		case MOD_MACHINEGUN:
;237:			message = "was machinegunned by";
ADDRLP4 40
ADDRGP4 $209
ASGNP4
line 238
;238:			break;
ADDRGP4 $203
JUMPV
LABELV $210
line 240
;239:		case MOD_SHOTGUN:
;240:			message = "was gunned down by";
ADDRLP4 40
ADDRGP4 $211
ASGNP4
line 241
;241:			break;
ADDRGP4 $203
JUMPV
LABELV $212
line 243
;242:		case MOD_GRENADE:
;243:			message = "ate";
ADDRLP4 40
ADDRGP4 $213
ASGNP4
line 244
;244:			message2 = "'s grenade";
ADDRLP4 88
ADDRGP4 $214
ASGNP4
line 245
;245:			break;
ADDRGP4 $203
JUMPV
LABELV $215
line 247
;246:		case MOD_GRENADE_SPLASH:
;247:			message = "was shredded by";
ADDRLP4 40
ADDRGP4 $216
ASGNP4
line 248
;248:			message2 = "'s shrapnel";
ADDRLP4 88
ADDRGP4 $217
ASGNP4
line 249
;249:			break;
ADDRGP4 $203
JUMPV
LABELV $218
line 251
;250:		case MOD_ROCKET:
;251:			message = "ate";
ADDRLP4 40
ADDRGP4 $213
ASGNP4
line 252
;252:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $219
ASGNP4
line 253
;253:			break;
ADDRGP4 $203
JUMPV
LABELV $220
line 255
;254:		case MOD_ROCKET_SPLASH:
;255:			message = "almost dodged";
ADDRLP4 40
ADDRGP4 $221
ASGNP4
line 256
;256:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $219
ASGNP4
line 257
;257:			break;
ADDRGP4 $203
JUMPV
LABELV $222
line 259
;258:		case MOD_PLASMA:
;259:			message = "was melted by";
ADDRLP4 40
ADDRGP4 $223
ASGNP4
line 260
;260:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $224
ASGNP4
line 261
;261:			break;
ADDRGP4 $203
JUMPV
LABELV $225
line 263
;262:		case MOD_PLASMA_SPLASH:
;263:			message = "was melted by";
ADDRLP4 40
ADDRGP4 $223
ASGNP4
line 264
;264:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $224
ASGNP4
line 265
;265:			break;
ADDRGP4 $203
JUMPV
LABELV $226
line 267
;266:		case MOD_RAILGUN:
;267:			message = "was railed by";
ADDRLP4 40
ADDRGP4 $227
ASGNP4
line 268
;268:			break;
ADDRGP4 $203
JUMPV
LABELV $228
line 270
;269:		case MOD_LIGHTNING:
;270:			message = "was electrocuted by";
ADDRLP4 40
ADDRGP4 $229
ASGNP4
line 271
;271:			break;
ADDRGP4 $203
JUMPV
LABELV $230
line 274
;272:		case MOD_BFG:
;273:		case MOD_BFG_SPLASH:
;274:			message = "was blasted by";
ADDRLP4 40
ADDRGP4 $231
ASGNP4
line 275
;275:			message2 = "'s BFG";
ADDRLP4 88
ADDRGP4 $232
ASGNP4
line 276
;276:			break;
ADDRGP4 $203
JUMPV
LABELV $233
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
ADDRGP4 $234
ASGNP4
line 299
;299:			message2 = "'s personal space";
ADDRLP4 88
ADDRGP4 $235
ASGNP4
line 300
;300:			break;
ADDRGP4 $203
JUMPV
LABELV $202
line 302
;301:		default:
;302:			message = "was killed by";
ADDRLP4 40
ADDRGP4 $236
ASGNP4
line 303
;303:			break;
LABELV $203
line 306
;304:		}
;305:
;306:		if (message) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $239
line 307
;307:			CG_Printf( "%s %s %s%s\n", 
ADDRGP4 $241
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
LABELV $239
line 311
;310:		}
;311:	}
LABELV $200
line 314
;312:
;313:	// we don't know what it was
;314:	CG_Printf( "%s died.\n", targetName );
ADDRGP4 $242
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
LTI4 $246
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $244
LABELV $246
line 334
;334:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 335
;335:	}
LABELV $244
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
NEI4 $247
line 339
;339:		if ( !itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $250
line 340
;340:			CG_CenterPrint( "No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH );
ADDRGP4 $252
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
ADDRGP4 $251
JUMPV
LABELV $250
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
ADDRGP4 $253
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
LABELV $251
line 345
;345:	}
LABELV $247
line 347
;346:
;347:	switch ( itemNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $256
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $255
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $260
ADDRGP4 $254
JUMPV
LABELV $254
LABELV $256
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
ADDRGP4 cgs+152340+580
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 351
;351:		break;
ADDRGP4 $255
JUMPV
line 354
;352:
;353:	case HI_TELEPORTER:
;354:		break;
LABELV $260
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
LTI4 $261
ADDRLP4 28
INDIRI4
CNSTI4 64
GEI4 $261
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
LABELV $261
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
ADDRGP4 cgs+152340+912
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 363
;363:		break;
LABELV $255
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
LABELV $243
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
NEI4 $273
line 393
;392:		// select it immediately
;393:		if ( cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_HAND ) {
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
EQI4 $276
CNSTI4 52
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 1
EQI4 $276
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
LABELV $276
line 397
;397:	}
LABELV $273
line 399
;398:
;399:}
LABELV $267
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
GEI4 $285
line 414
;414:		return;
ADDRGP4 $284
JUMPV
LABELV $285
line 417
;415:	}
;416:
;417:	if ( health < 25 ) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $288
line 418
;418:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $290
ASGNP4
line 419
;419:	} else if ( health < 50 ) {
ADDRGP4 $289
JUMPV
LABELV $288
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $291
line 420
;420:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $293
ASGNP4
line 421
;421:	} else if ( health < 75 ) {
ADDRGP4 $292
JUMPV
LABELV $291
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $294
line 422
;422:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $296
ASGNP4
line 423
;423:	} else {
ADDRGP4 $295
JUMPV
LABELV $294
line 424
;424:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $297
ASGNP4
line 425
;425:	}
LABELV $295
LABELV $292
LABELV $289
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
LABELV $284
endproc CG_PainEvent 12 16
lit
align 4
LABELV $445
byte 4 0
byte 4 0
byte 4 1065353216
export CG_EntityEvent
code
proc CG_EntityEvent 76 48
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
;448://	vec3_t			dir;
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
EQI4 $300
line 457
;457:		CG_Printf( "ent:%3i  event:%3i ", es->number, event );
ADDRGP4 $303
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
LABELV $300
line 460
;459:
;460:	if ( !event ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $304
line 461
;461:		DEBUGNAME("ZEROEVENT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $299
ADDRGP4 $309
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 462
;462:		return;
ADDRGP4 $299
JUMPV
LABELV $304
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
LTI4 $312
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $310
LABELV $312
line 467
;467:		clientNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 468
;468:	}
LABELV $310
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
LTI4 $314
ADDRLP4 8
INDIRI4
CNSTI4 69
GTI4 $314
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $891-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $891
address $316
address $326
address $337
address $348
address $359
address $410
address $410
address $410
address $410
address $370
address $384
address $396
address $440
address $452
address $463
address $470
address $477
address $484
address $490
address $508
address $522
address $530
address $537
address $542
address $547
address $552
address $557
address $562
address $567
address $572
address $577
address $582
address $587
address $592
address $597
address $602
address $607
address $612
address $314
address $638
address $631
address $617
address $624
address $646
address $662
address $671
address $682
address $314
address $314
address $314
address $314
address $314
address $314
address $314
address $314
address $809
address $817
address $817
address $817
address $823
address $828
address $841
address $854
address $867
address $657
address $314
address $881
address $876
address $457
code
LABELV $316
line 476
;472:	//
;473:	// movement generated events
;474:	//
;475:	case EV_FOOTSTEP:
;476:		DEBUGNAME("EV_FOOTSTEP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $317
ADDRGP4 $320
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $317
line 477
;477:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $315
line 478
;478:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 28
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
ADDRLP4 28
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
ADDRGP4 cgs+152340+588
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
ADDRGP4 $315
JUMPV
LABELV $326
line 483
;482:	case EV_FOOTSTEP_METAL:
;483:		DEBUGNAME("EV_FOOTSTEP_METAL");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $327
ADDRGP4 $330
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $327
line 484
;484:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $315
line 485
;485:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 28
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
ADDRLP4 28
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+588+80
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
ADDRGP4 $315
JUMPV
LABELV $337
line 490
;489:	case EV_FOOTSPLASH:
;490:		DEBUGNAME("EV_FOOTSPLASH");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $338
ADDRGP4 $341
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $338
line 491
;491:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $315
line 492
;492:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 28
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
ADDRLP4 28
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+588+96
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
ADDRGP4 $315
JUMPV
LABELV $348
line 497
;496:	case EV_FOOTWADE:
;497:		DEBUGNAME("EV_FOOTWADE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $349
ADDRGP4 $352
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $349
line 498
;498:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $315
line 499
;499:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 28
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
ADDRLP4 28
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+588+96
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
ADDRGP4 $315
JUMPV
LABELV $359
line 504
;503:	case EV_SWIM:
;504:		DEBUGNAME("EV_SWIM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $360
ADDRGP4 $363
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $360
line 505
;505:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $315
line 506
;506:			trap_S_StartSound (NULL, es->number, CHAN_BODY, 
ADDRLP4 28
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
ADDRLP4 28
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+152340+588+96
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
ADDRGP4 $315
JUMPV
LABELV $370
line 513
;510:
;511:
;512:	case EV_FALL_SHORT:
;513:		DEBUGNAME("EV_FALL_SHORT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $371
ADDRGP4 $374
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $371
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
ADDRGP4 cgs+152340+784
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
NEI4 $315
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
ADDRGP4 $315
JUMPV
LABELV $384
line 522
;521:	case EV_FALL_MEDIUM:
;522:		DEBUGNAME("EV_FALL_MEDIUM");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $385
ADDRGP4 $388
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $385
line 524
;523:		// use normal pain sound
;524:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*pain100_1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $297
ARGP4
ADDRLP4 28
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
ADDRLP4 28
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
NEI4 $315
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
ADDRGP4 $315
JUMPV
LABELV $396
line 532
;531:	case EV_FALL_FAR:
;532:		DEBUGNAME("EV_FALL_FAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $397
ADDRGP4 $400
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $397
line 533
;533:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*fall1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $401
ARGP4
ADDRLP4 32
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
ADDRLP4 32
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
NEI4 $315
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
ADDRGP4 $315
JUMPV
LABELV $410
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
EQI4 $411
ADDRGP4 $414
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $411
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
EQI4 $415
line 553
;553:			break;
ADDRGP4 $315
JUMPV
LABELV $415
line 556
;554:		}
;555:		// if we are interpolating, we don't need to smooth steps
;556:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ||
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 48
INDIRI4
NEI4 $427
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 48
INDIRI4
NEI4 $427
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 48
INDIRI4
NEI4 $427
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $419
LABELV $427
line 557
;557:			cg_nopredict.integer || cg_synchronousClients.integer ) {
line 558
;558:			break;
ADDRGP4 $315
JUMPV
LABELV $419
line 561
;559:		}
;560:		// check for stepping up before a previous step is completed
;561:		delta = cg.time - cg.stepTime;
ADDRLP4 36
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108924
INDIRI4
SUBI4
ASGNI4
line 562
;562:		if (delta < STEP_TIME) {
ADDRLP4 36
INDIRI4
CNSTI4 200
GEI4 $430
line 563
;563:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
ADDRLP4 40
ADDRGP4 cg+108920
INDIRF4
CNSTI4 200
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1128792064
DIVF4
ASGNF4
line 564
;564:		} else {
ADDRGP4 $431
JUMPV
LABELV $430
line 565
;565:			oldStep = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 566
;566:		}
LABELV $431
line 569
;567:
;568:		// add this amount
;569:		step = 4 * (event - EV_STEP_4 + 1 );
ADDRLP4 44
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
ADDRLP4 40
INDIRF4
ADDRLP4 44
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 571
;571:		if ( cg.stepChange > MAX_STEP_CHANGE ) {
ADDRGP4 cg+108920
INDIRF4
CNSTF4 1107296256
LEF4 $434
line 572
;572:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+108920
CNSTF4 1107296256
ASGNF4
line 573
;573:		}
LABELV $434
line 574
;574:		cg.stepTime = cg.time;
ADDRGP4 cg+108924
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 575
;575:		break;
ADDRGP4 $315
JUMPV
LABELV $440
line 579
;576:	}
;577:
;578:	case EV_JUMP_PAD:
;579:		DEBUGNAME("EV_JUMP_PAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $441
ADDRGP4 $444
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $441
line 581
;580://		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;581:		{
line 583
;582:			localEntity_t	*smoke;
;583:			vec3_t			up = {0, 0, 1};
ADDRLP4 36
ADDRGP4 $445
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
ADDRLP4 36
ARGP4
CNSTF4 1107296256
ARGF4
ADDRLP4 52
CNSTF4 1065353216
ASGNF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 52
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
ADDRGP4 cgs+152340+300
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 56
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
ADDRGP4 cgs+152340+792
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
ADDRGP4 $451
ARGP4
ADDRLP4 36
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
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 598
;598:		break;
ADDRGP4 $315
JUMPV
LABELV $452
line 601
;599:
;600:	case EV_JUMP:
;601:		DEBUGNAME("EV_JUMP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $453
ADDRGP4 $456
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $453
line 602
;602:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*jump1.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $451
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
line 603
;603:		break;
ADDRGP4 $315
JUMPV
LABELV $457
line 605
;604:	case EV_TAUNT:
;605:		DEBUGNAME("EV_TAUNT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $458
ADDRGP4 $461
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $458
line 606
;606:		trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, "*taunt.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $462
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
CNSTI4 3
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 607
;607:		break;
ADDRGP4 $315
JUMPV
LABELV $463
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
EQI4 $464
ADDRGP4 $467
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $464
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
ADDRGP4 cgs+152340+896
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 637
;637:		break;
ADDRGP4 $315
JUMPV
LABELV $470
line 639
;638:	case EV_WATER_LEAVE:
;639:		DEBUGNAME("EV_WATER_LEAVE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $471
ADDRGP4 $474
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $471
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
ADDRGP4 cgs+152340+900
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 641
;641:		break;
ADDRGP4 $315
JUMPV
LABELV $477
line 643
;642:	case EV_WATER_UNDER:
;643:		DEBUGNAME("EV_WATER_UNDER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $478
ADDRGP4 $481
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $478
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
ADDRGP4 cgs+152340+904
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 645
;645:		break;
ADDRGP4 $315
JUMPV
LABELV $484
line 647
;646:	case EV_WATER_CLEAR:
;647:		DEBUGNAME("EV_WATER_CLEAR");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $485
ADDRGP4 $488
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $485
line 648
;648:		trap_S_StartSound (NULL, es->number, CHAN_AUTO, CG_CustomSound( es->number, "*gasp.wav" ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $489
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
CNSTI4 0
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 649
;649:		break;
ADDRGP4 $315
JUMPV
LABELV $490
line 652
;650:
;651:	case EV_ITEM_PICKUP:
;652:		DEBUGNAME("EV_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $491
ADDRGP4 $494
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $491
line 653
;653:		{
line 657
;654:			gitem_t	*item;
;655:			int		index;
;656:
;657:			index = es->eventParm;		// player predicted
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 659
;658:
;659:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 60
ADDRLP4 52
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 1
LTI4 $497
ADDRLP4 60
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $495
LABELV $497
line 660
;660:				break;
ADDRGP4 $315
JUMPV
LABELV $495
line 662
;661:			}
;662:			item = &bg_itemlist[ index ];
ADDRLP4 56
CNSTI4 52
ADDRLP4 52
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
ADDRLP4 64
ADDRLP4 56
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 5
EQI4 $500
ADDRLP4 64
INDIRI4
CNSTI4 8
NEI4 $498
LABELV $500
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
ADDRGP4 cgs+152340+1048
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 668
;668:			} else if (item->giType == IT_PERSISTANT_POWERUP) {
ADDRGP4 $499
JUMPV
LABELV $498
ADDRLP4 56
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $503
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
ADDRGP4 $504
JUMPV
LABELV $503
line 686
;686:				trap_S_StartSound (NULL, es->number, CHAN_AUTO,	trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 68
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
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 687
;687:			}
LABELV $504
LABELV $499
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
NEI4 $315
line 691
;691:				CG_ItemPickup( index );
ADDRLP4 52
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
ADDRGP4 $315
JUMPV
LABELV $508
line 697
;695:
;696:	case EV_GLOBAL_ITEM_PICKUP:
;697:		DEBUGNAME("EV_GLOBAL_ITEM_PICKUP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $509
ADDRGP4 $512
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $509
line 698
;698:		{
line 702
;699:			gitem_t	*item;
;700:			int		index;
;701:
;702:			index = es->eventParm;		// player predicted
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 704
;703:
;704:			if ( index < 1 || index >= bg_numItems ) {
ADDRLP4 60
ADDRLP4 52
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 1
LTI4 $515
ADDRLP4 60
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $513
LABELV $515
line 705
;705:				break;
ADDRGP4 $315
JUMPV
LABELV $513
line 707
;706:			}
;707:			item = &bg_itemlist[ index ];
ADDRLP4 56
CNSTI4 52
ADDRLP4 52
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 709
;708:			// powerup pickups are global
;709:			if( item->pickup_sound ) {
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $516
line 710
;710:				trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound( item->pickup_sound, qfalse ) );
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 64
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
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 711
;711:			}
LABELV $516
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
NEI4 $315
line 715
;715:				CG_ItemPickup( index );
ADDRLP4 52
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
ADDRGP4 $315
JUMPV
LABELV $522
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
EQI4 $523
ADDRGP4 $526
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $523
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
NEI4 $315
line 727
;727:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 728
;728:		}
line 729
;729:		break;
ADDRGP4 $315
JUMPV
LABELV $530
line 731
;730:	case EV_CHANGE_WEAPON:
;731:		DEBUGNAME("EV_CHANGE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $531
ADDRGP4 $534
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $531
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
ADDRGP4 cgs+152340+576
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 733
;733:		break;
ADDRGP4 $315
JUMPV
LABELV $537
line 735
;734:	case EV_FIRE_WEAPON:
;735:		DEBUGNAME("EV_FIRE_WEAPON");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $538
ADDRGP4 $541
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $538
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
ADDRGP4 $315
JUMPV
LABELV $542
line 740
;738:
;739:	case EV_USE_ITEM0:
;740:		DEBUGNAME("EV_USE_ITEM0");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $543
ADDRGP4 $546
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $543
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
ADDRGP4 $315
JUMPV
LABELV $547
line 744
;743:	case EV_USE_ITEM1:
;744:		DEBUGNAME("EV_USE_ITEM1");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $548
ADDRGP4 $551
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $548
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
ADDRGP4 $315
JUMPV
LABELV $552
line 748
;747:	case EV_USE_ITEM2:
;748:		DEBUGNAME("EV_USE_ITEM2");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $553
ADDRGP4 $556
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $553
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
ADDRGP4 $315
JUMPV
LABELV $557
line 752
;751:	case EV_USE_ITEM3:
;752:		DEBUGNAME("EV_USE_ITEM3");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $558
ADDRGP4 $561
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $558
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
ADDRGP4 $315
JUMPV
LABELV $562
line 756
;755:	case EV_USE_ITEM4:
;756:		DEBUGNAME("EV_USE_ITEM4");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $563
ADDRGP4 $566
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $563
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
ADDRGP4 $315
JUMPV
LABELV $567
line 760
;759:	case EV_USE_ITEM5:
;760:		DEBUGNAME("EV_USE_ITEM5");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $568
ADDRGP4 $571
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $568
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
ADDRGP4 $315
JUMPV
LABELV $572
line 764
;763:	case EV_USE_ITEM6:
;764:		DEBUGNAME("EV_USE_ITEM6");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $573
ADDRGP4 $576
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $573
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
ADDRGP4 $315
JUMPV
LABELV $577
line 768
;767:	case EV_USE_ITEM7:
;768:		DEBUGNAME("EV_USE_ITEM7");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $578
ADDRGP4 $581
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $578
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
ADDRGP4 $315
JUMPV
LABELV $582
line 772
;771:	case EV_USE_ITEM8:
;772:		DEBUGNAME("EV_USE_ITEM8");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $583
ADDRGP4 $586
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $583
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
ADDRGP4 $315
JUMPV
LABELV $587
line 776
;775:	case EV_USE_ITEM9:
;776:		DEBUGNAME("EV_USE_ITEM9");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $588
ADDRGP4 $591
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $588
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
ADDRGP4 $315
JUMPV
LABELV $592
line 780
;779:	case EV_USE_ITEM10:
;780:		DEBUGNAME("EV_USE_ITEM10");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $593
ADDRGP4 $596
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $593
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
ADDRGP4 $315
JUMPV
LABELV $597
line 784
;783:	case EV_USE_ITEM11:
;784:		DEBUGNAME("EV_USE_ITEM11");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $598
ADDRGP4 $601
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $598
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
ADDRGP4 $315
JUMPV
LABELV $602
line 788
;787:	case EV_USE_ITEM12:
;788:		DEBUGNAME("EV_USE_ITEM12");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $603
ADDRGP4 $606
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $603
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
ADDRGP4 $315
JUMPV
LABELV $607
line 792
;791:	case EV_USE_ITEM13:
;792:		DEBUGNAME("EV_USE_ITEM13");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $608
ADDRGP4 $611
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $608
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
ADDRGP4 $315
JUMPV
LABELV $612
line 796
;795:	case EV_USE_ITEM14:
;796:		DEBUGNAME("EV_USE_ITEM14");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $613
ADDRGP4 $616
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $613
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
ADDRGP4 $315
JUMPV
LABELV $617
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
EQI4 $618
ADDRGP4 $621
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $618
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
ADDRGP4 cgs+152340+764
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
ADDRGP4 $315
JUMPV
LABELV $624
line 812
;810:
;811:	case EV_PLAYER_TELEPORT_OUT:
;812:		DEBUGNAME("EV_PLAYER_TELEPORT_OUT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $625
ADDRGP4 $628
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $625
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
ADDRGP4 cgs+152340+768
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
ADDRGP4 $315
JUMPV
LABELV $631
line 818
;816:
;817:	case EV_ITEM_POP:
;818:		DEBUGNAME("EV_ITEM_POP");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $632
ADDRGP4 $635
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $632
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
ADDRGP4 cgs+152340+776
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 820
;820:		break;
ADDRGP4 $315
JUMPV
LABELV $638
line 822
;821:	case EV_ITEM_RESPAWN:
;822:		DEBUGNAME("EV_ITEM_RESPAWN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $639
ADDRGP4 $642
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $639
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
ADDRGP4 cgs+152340+776
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 825
;825:		break;
ADDRGP4 $315
JUMPV
LABELV $646
line 828
;826:
;827:	case EV_GRENADE_BOUNCE:
;828:		DEBUGNAME("EV_GRENADE_BOUNCE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $647
ADDRGP4 $650
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $647
line 829
;829:		if ( rand() & 1 ) {
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $651
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
ADDRGP4 cgs+152340+1052
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 831
;831:		} else {
ADDRGP4 $315
JUMPV
LABELV $651
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
ADDRGP4 cgs+152340+1056
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 833
;833:		}
line 834
;834:		break;
ADDRGP4 $315
JUMPV
LABELV $657
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
EQI4 $658
ADDRGP4 $661
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $658
line 879
;879:		CG_ScorePlum( cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRLP4 56
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
ADDRGP4 $315
JUMPV
LABELV $662
line 886
;881:
;882:	//
;883:	// missile impacts
;884:	//
;885:	case EV_GENERAL_SOUND:
;886:		DEBUGNAME("EV_GENERAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $663
ADDRGP4 $666
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $663
line 887
;887:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $667
line 888
;888:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, cgs.gameSounds[ es->eventParm ] );
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
line 889
;889:		} else {
ADDRGP4 $315
JUMPV
LABELV $667
line 890
;890:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 60
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 60
INDIRP4
ASGNP4
line 891
;891:			trap_S_StartSound (NULL, es->number, CHAN_VOICE, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 64
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
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 892
;892:		}
line 893
;893:		break;
ADDRGP4 $315
JUMPV
LABELV $671
line 896
;894:
;895:	case EV_GLOBAL_SOUND:	// play from the player's head so it never diminishes
;896:		DEBUGNAME("EV_GLOBAL_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $672
ADDRGP4 $675
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $672
line 897
;897:		if ( cgs.gameSounds[ es->eventParm ] ) {
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
EQI4 $676
line 898
;898:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[ es->eventParm ] );
CNSTP4 0
ARGP4
ADDRLP4 60
CNSTI4 184
ASGNI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
ADDRLP4 60
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
line 899
;899:		} else {
ADDRGP4 $315
JUMPV
LABELV $676
line 900
;900:			s = CG_ConfigString( CS_SOUNDS + es->eventParm );
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 60
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 60
INDIRP4
ASGNP4
line 901
;901:			trap_S_StartSound (NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound( es->number, s ) );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 64
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
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 902
;902:		}
line 903
;903:		break;
ADDRGP4 $315
JUMPV
LABELV $682
line 906
;904:
;905:	case EV_GLOBAL_TEAM_SOUND:	// play from the player's head so it never diminishes
;906:		{
line 907
;907:			DEBUGNAME("EV_GLOBAL_TEAM_SOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $683
ADDRGP4 $686
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $683
line 908
;908:			switch( es->eventParm ) {
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
LTI4 $315
ADDRLP4 60
INDIRI4
CNSTI4 13
GTI4 $315
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $808
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $808
address $690
address $700
address $710
address $722
address $734
address $754
address $774
address $782
address $790
address $793
address $796
address $799
address $802
address $805
code
LABELV $690
line 910
;909:				case GTS_RED_CAPTURE: // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;910:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $691
line 911
;911:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+152340+944
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $315
JUMPV
LABELV $691
line 913
;912:					else
;913:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+152340+948
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 914
;914:					break;
ADDRGP4 $315
JUMPV
LABELV $700
line 916
;915:				case GTS_BLUE_CAPTURE: // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;916:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $701
line 917
;917:						CG_AddBufferedSound( cgs.media.captureYourTeamSound );
ADDRGP4 cgs+152340+944
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $315
JUMPV
LABELV $701
line 919
;918:					else
;919:						CG_AddBufferedSound( cgs.media.captureOpponentSound );
ADDRGP4 cgs+152340+948
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 920
;920:					break;
ADDRGP4 $315
JUMPV
LABELV $710
line 922
;921:				case GTS_RED_RETURN: // CTF: blue flag returned, 1FCTF: never used
;922:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_RED )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $711
line 923
;923:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+152340+952
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $712
JUMPV
LABELV $711
line 925
;924:					else
;925:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+152340+956
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $712
line 927
;926:					//
;927:					CG_AddBufferedSound( cgs.media.blueFlagReturnedSound );
ADDRGP4 cgs+152340+972
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 928
;928:					break;
ADDRGP4 $315
JUMPV
LABELV $722
line 930
;929:				case GTS_BLUE_RETURN: // CTF red flag returned, 1FCTF: neutral flag returned
;930:					if ( cgs.clientinfo[cg.clientNum].team == TEAM_BLUE )
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $723
line 931
;931:						CG_AddBufferedSound( cgs.media.returnYourTeamSound );
ADDRGP4 cgs+152340+952
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $724
JUMPV
LABELV $723
line 933
;932:					else
;933:						CG_AddBufferedSound( cgs.media.returnOpponentSound );
ADDRGP4 cgs+152340+956
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $724
line 935
;934:					//
;935:					CG_AddBufferedSound( cgs.media.redFlagReturnedSound );
ADDRGP4 cgs+152340+968
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 936
;936:					break;
ADDRGP4 $315
JUMPV
LABELV $734
line 940
;937:
;938:				case GTS_RED_TAKEN: // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;939:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;940:					if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $739
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $735
LABELV $739
line 941
;941:					}
ADDRGP4 $315
JUMPV
LABELV $735
line 942
;942:					else {
line 943
;943:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $740
line 949
;944:#ifdef MISSIONPACK
;945:							if (cgs.gametype == GT_1FCTF) 
;946:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;947:							else
;948:#endif
;949:						 	CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+152340+980
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 950
;950:						}
ADDRGP4 $315
JUMPV
LABELV $740
line 951
;951:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $315
line 957
;952:#ifdef MISSIONPACK
;953:							if (cgs.gametype == GT_1FCTF)
;954:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;955:							else
;956:#endif
;957: 							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+152340+988
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 958
;958:						}
line 959
;959:					}
line 960
;960:					break;
ADDRGP4 $315
JUMPV
LABELV $754
line 963
;961:				case GTS_BLUE_TAKEN: // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;962:					// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;963:					if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $759
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $755
LABELV $759
line 964
;964:					}
ADDRGP4 $315
JUMPV
LABELV $755
line 965
;965:					else {
line 966
;966:						if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $760
line 972
;967:#ifdef MISSIONPACK
;968:							if (cgs.gametype == GT_1FCTF)
;969:								CG_AddBufferedSound( cgs.media.yourTeamTookTheFlagSound );
;970:							else
;971:#endif
;972:							CG_AddBufferedSound( cgs.media.enemyTookYourFlagSound );
ADDRGP4 cgs+152340+980
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 973
;973:						}
ADDRGP4 $315
JUMPV
LABELV $760
line 974
;974:						else if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $315
line 980
;975:#ifdef MISSIONPACK
;976:							if (cgs.gametype == GT_1FCTF)
;977:								CG_AddBufferedSound( cgs.media.enemyTookTheFlagSound );
;978:							else
;979:#endif
;980:							CG_AddBufferedSound( cgs.media.yourTeamTookEnemyFlagSound );
ADDRGP4 cgs+152340+988
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 981
;981:						}
line 982
;982:					}
line 983
;983:					break;
ADDRGP4 $315
JUMPV
LABELV $774
line 985
;984:				case GTS_REDOBELISK_ATTACKED: // Overload: red obelisk is being attacked
;985:					if (cgs.clientinfo[cg.clientNum].team == TEAM_RED) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 1
NEI4 $315
line 986
;986:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+152340+1000
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 987
;987:					}
line 988
;988:					break;
ADDRGP4 $315
JUMPV
LABELV $782
line 990
;989:				case GTS_BLUEOBELISK_ATTACKED: // Overload: blue obelisk is being attacked
;990:					if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE) {
CNSTI4 1708
ADDRGP4 cg+4
INDIRI4
MULI4
ADDRGP4 cgs+40972+68
ADDP4
INDIRI4
CNSTI4 2
NEI4 $315
line 991
;991:						CG_AddBufferedSound( cgs.media.yourBaseIsUnderAttackSound );
ADDRGP4 cgs+152340+1000
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 992
;992:					}
line 993
;993:					break;
ADDRGP4 $315
JUMPV
LABELV $790
line 996
;994:
;995:				case GTS_REDTEAM_SCORED:
;996:					CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+152340+924
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 997
;997:					break;
ADDRGP4 $315
JUMPV
LABELV $793
line 999
;998:				case GTS_BLUETEAM_SCORED:
;999:					CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+152340+928
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1000
;1000:					break;
ADDRGP4 $315
JUMPV
LABELV $796
line 1002
;1001:				case GTS_REDTEAM_TOOK_LEAD:
;1002:					CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+152340+932
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1003
;1003:					break;
ADDRGP4 $315
JUMPV
LABELV $799
line 1005
;1004:				case GTS_BLUETEAM_TOOK_LEAD:
;1005:					CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+152340+936
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1006
;1006:					break;
ADDRGP4 $315
JUMPV
LABELV $802
line 1008
;1007:				case GTS_TEAMS_ARE_TIED:
;1008:					CG_AddBufferedSound( cgs.media.teamsTiedSound );
ADDRGP4 cgs+152340+940
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1009
;1009:					break;
ADDRGP4 $315
JUMPV
LABELV $805
line 1012
;1010:
;1011:				case GTS_KAMIKAZE:
;1012:					trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
ADDRGP4 cgs+152340+744
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1013
;1013:					break;
line 1016
;1014:
;1015:				default:
;1016:					break;
line 1018
;1017:			}
;1018:			break;
ADDRGP4 $315
JUMPV
LABELV $809
line 1024
;1019:		}
;1020:
;1021:	case EV_PAIN:
;1022:		// local player sounds are triggered in CG_CheckLocalSounds,
;1023:		// so ignore events on the player
;1024:		DEBUGNAME("EV_PAIN");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $810
ADDRGP4 $813
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $810
line 1025
;1025:		if ( cent->currentState.number != cg.snap->ps.clientNum ) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $315
line 1026
;1026:			CG_PainEvent( cent, es->eventParm );
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
line 1027
;1027:		}
line 1028
;1028:		break;
ADDRGP4 $315
JUMPV
LABELV $817
line 1033
;1029:
;1030:	case EV_DEATH1:
;1031:	case EV_DEATH2:
;1032:	case EV_DEATH3:
;1033:		DEBUGNAME("EV_DEATHx");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $818
ADDRGP4 $821
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $818
line 1034
;1034:		trap_S_StartSound( NULL, es->number, CHAN_VOICE, 
ADDRGP4 $822
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 57
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
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
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1036
;1035:				CG_CustomSound( es->number, va("*death%i.wav", event - EV_DEATH1 + 1) ) );
;1036:		break;
ADDRGP4 $315
JUMPV
LABELV $823
line 1040
;1037:
;1038:
;1039:	case EV_OBITUARY:
;1040:		DEBUGNAME("EV_OBITUARY");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $824
ADDRGP4 $827
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $824
line 1041
;1041:		CG_Obituary( es );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1042
;1042:		break;
ADDRGP4 $315
JUMPV
LABELV $828
line 1048
;1043:
;1044:	//
;1045:	// powerup events
;1046:	//
;1047:	case EV_POWERUP_QUAD:
;1048:		DEBUGNAME("EV_POWERUP_QUAD");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $829
ADDRGP4 $832
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $829
line 1049
;1049:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $833
line 1050
;1050:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+124408
CNSTI4 1
ASGNI4
line 1051
;1051:			cg.powerupTime = cg.time;
ADDRGP4 cg+124412
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1052
;1052:		}
LABELV $833
line 1053
;1053:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.quadSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152340+568
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1054
;1054:		break;
ADDRGP4 $315
JUMPV
LABELV $841
line 1056
;1055:	case EV_POWERUP_BATTLESUIT:
;1056:		DEBUGNAME("EV_POWERUP_BATTLESUIT");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $842
ADDRGP4 $845
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $842
line 1057
;1057:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $846
line 1058
;1058:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+124408
CNSTI4 2
ASGNI4
line 1059
;1059:			cg.powerupTime = cg.time;
ADDRGP4 cg+124412
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1060
;1060:		}
LABELV $846
line 1061
;1061:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.protectSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152340+1044
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1062
;1062:		break;
ADDRGP4 $315
JUMPV
LABELV $854
line 1064
;1063:	case EV_POWERUP_REGEN:
;1064:		DEBUGNAME("EV_POWERUP_REGEN");
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
line 1065
;1065:		if ( es->number == cg.snap->ps.clientNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $859
line 1066
;1066:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+124408
CNSTI4 5
ASGNI4
line 1067
;1067:			cg.powerupTime = cg.time;
ADDRGP4 cg+124412
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1068
;1068:		}
LABELV $859
line 1069
;1069:		trap_S_StartSound (NULL, es->number, CHAN_ITEM, cgs.media.regenSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+152340+1040
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1070
;1070:		break;
ADDRGP4 $315
JUMPV
LABELV $867
line 1073
;1071:
;1072:	case EV_GIB_PLAYER:
;1073:		DEBUGNAME("EV_GIB_PLAYER");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $868
ADDRGP4 $871
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $868
line 1077
;1074:		// don't play gib sound when using the kamikaze because it interferes
;1075:		// with the kamikaze sound, downside is that the gib sound will also
;1076:		// not be played when someone is gibbed while just carrying the kamikaze
;1077:		if ( !(es->eFlags & EF_KAMIKAZE) ) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $872
line 1078
;1078:			trap_S_StartSound( NULL, es->number, CHAN_BODY, cgs.media.gibSound );
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+152340+748
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1079
;1079:		}
LABELV $872
line 1080
;1080:		CG_GibPlayer( cent->lerpOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1081
;1081:		break;
ADDRGP4 $315
JUMPV
LABELV $876
line 1084
;1082:
;1083:	case EV_STOPLOOPINGSOUND:
;1084:		DEBUGNAME("EV_STOPLOOPINGSOUND");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $877
ADDRGP4 $880
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $877
line 1085
;1085:		trap_S_StopLoopingSound( es->number );
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1086
;1086:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1087
;1087:		break;
ADDRGP4 $315
JUMPV
LABELV $881
line 1090
;1088:
;1089:	case EV_DEBUG_LINE:
;1090:		DEBUGNAME("EV_DEBUG_LINE");
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $882
ADDRGP4 $885
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $882
line 1091
;1091:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1092
;1092:		break;
ADDRGP4 $315
JUMPV
LABELV $314
line 1095
;1093:
;1094:	default:
;1095:		DEBUGNAME("UNKNOWN");
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
line 1096
;1096:		CG_Error( "Unknown event: %i", event );
ADDRGP4 $890
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1097
;1097:		break;
LABELV $315
line 1100
;1098:	}
;1099:
;1100:}
LABELV $299
endproc CG_EntityEvent 76 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1109
;1101:
;1102:
;1103:/*
;1104:==============
;1105:CG_CheckEvents
;1106:
;1107:==============
;1108:*/
;1109:void CG_CheckEvents( centity_t *cent ) {
line 1111
;1110:	// check for event-only entities
;1111:	if ( cent->currentState.eType > ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
LEI4 $894
line 1112
;1112:		if ( cent->previousEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
EQI4 $896
line 1113
;1113:			return;	// already fired
ADDRGP4 $893
JUMPV
LABELV $896
line 1116
;1114:		}
;1115:		// if this is a player event set the entity number of the client entity number
;1116:		if ( cent->currentState.eFlags & EF_PLAYER_EVENT ) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $898
line 1117
;1117:			cent->currentState.number = cent->currentState.otherEntityNum;
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
line 1118
;1118:		}
LABELV $898
line 1120
;1119:
;1120:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 1
ASGNI4
line 1122
;1121:
;1122:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
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
line 1123
;1123:	} else {
ADDRGP4 $895
JUMPV
LABELV $894
line 1125
;1124:		// check for events riding with another entity
;1125:		if ( cent->currentState.event == cent->previousEvent ) {
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
NEI4 $900
line 1126
;1126:			return;
ADDRGP4 $893
JUMPV
LABELV $900
line 1128
;1127:		}
;1128:		cent->previousEvent = cent->currentState.event;
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
line 1129
;1129:		if ( ( cent->currentState.event & ~EV_EVENT_BITS ) == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $902
line 1130
;1130:			return;
ADDRGP4 $893
JUMPV
LABELV $902
line 1132
;1131:		}
;1132:	}
LABELV $895
line 1135
;1133:
;1134:	// calculate the position at exactly the frame time
;1135:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin );
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
line 1136
;1136:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1138
;1137:
;1138:	CG_EntityEvent( cent, cent->lerpOrigin );
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
line 1139
;1139:}
LABELV $893
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
LABELV $890
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
LABELV $889
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
LABELV $885
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
LABELV $880
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
LABELV $871
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
LABELV $858
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
LABELV $845
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
LABELV $832
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
LABELV $827
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
LABELV $822
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
LABELV $821
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
LABELV $813
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
LABELV $686
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
LABELV $675
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
LABELV $666
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
LABELV $661
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
LABELV $650
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
LABELV $642
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
LABELV $635
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
LABELV $628
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
LABELV $621
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
LABELV $616
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
LABELV $611
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
LABELV $606
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
LABELV $601
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
LABELV $596
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
LABELV $591
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
LABELV $586
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
LABELV $581
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
LABELV $576
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
LABELV $571
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
LABELV $566
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
LABELV $561
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
LABELV $556
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
LABELV $551
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
LABELV $546
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
LABELV $541
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
LABELV $534
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
LABELV $526
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
LABELV $512
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
LABELV $494
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
LABELV $489
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
LABELV $488
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
LABELV $481
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
LABELV $474
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
LABELV $467
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
LABELV $462
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
LABELV $461
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
LABELV $456
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
LABELV $451
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
LABELV $444
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
LABELV $414
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
LABELV $401
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
LABELV $400
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
LABELV $388
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
LABELV $374
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
LABELV $363
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
LABELV $352
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
LABELV $341
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
LABELV $330
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
LABELV $320
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
LABELV $309
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
LABELV $303
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
LABELV $297
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
LABELV $296
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
LABELV $293
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
LABELV $290
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
LABELV $253
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $252
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
LABELV $242
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
LABELV $241
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
LABELV $236
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
LABELV $235
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
LABELV $234
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
LABELV $232
byte 1 39
byte 1 115
byte 1 32
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $231
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
LABELV $229
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
LABELV $227
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
LABELV $224
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
LABELV $223
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
LABELV $221
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
LABELV $219
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
LABELV $217
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
LABELV $216
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
LABELV $214
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
LABELV $213
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $211
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
LABELV $209
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
LABELV $207
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
LABELV $205
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
LABELV $194
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $191
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
LABELV $181
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $176
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
LABELV $175
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
LABELV $172
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
LABELV $169
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
LABELV $167
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
LABELV $166
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
LABELV $163
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
LABELV $159
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
LABELV $158
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
LABELV $155
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
LABELV $151
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
LABELV $150
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
LABELV $147
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
LABELV $143
byte 1 103
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 103
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
