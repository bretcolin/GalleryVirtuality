code
proc PlayerIcon 80 20
file "../ui_splevel.c"
line 108
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:SINGLE PLAYER LEVEL SELECT MENU
;7:
;8:=============================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:
;14:#define ART_LEVELFRAME_FOCUS		"menu/art/maps_select"
;15:#define ART_LEVELFRAME_SELECTED		"menu/art/maps_selected"
;16:#define ART_ARROW					"menu/art/narrow_0"
;17:#define ART_ARROW_FOCUS				"menu/art/narrow_1"
;18:#define ART_MAP_UNKNOWN				"menu/art/unknownmap"
;19:#define ART_MAP_COMPLETE1			"menu/art/level_complete1"
;20:#define ART_MAP_COMPLETE2			"menu/art/level_complete2"
;21:#define ART_MAP_COMPLETE3			"menu/art/level_complete3"
;22:#define ART_MAP_COMPLETE4			"menu/art/level_complete4"
;23:#define ART_MAP_COMPLETE5			"menu/art/level_complete5"
;24:#define ART_BACK0					"menu/art/back_0"
;25:#define ART_BACK1					"menu/art/back_1"	
;26:#define ART_FIGHT0					"menu/art/fight_0"
;27:#define ART_FIGHT1					"menu/art/fight_1"
;28:#define ART_RESET0					"menu/art/reset_0"
;29:#define ART_RESET1					"menu/art/reset_1"	
;30:#define ART_CUSTOM0					"menu/art/skirmish_0"
;31:#define ART_CUSTOM1					"menu/art/skirmish_1"
;32:
;33:#define ID_LEFTARROW		10
;34:#define ID_PICTURE0			11
;35:#define ID_PICTURE1			12
;36:#define ID_PICTURE2			13
;37:#define ID_PICTURE3			14
;38:#define ID_RIGHTARROW		15
;39:#define ID_PLAYERPIC		16
;40:#define ID_AWARD1			17
;41:#define ID_AWARD2			18
;42:#define ID_AWARD3			19
;43:#define ID_AWARD4			20
;44:#define ID_AWARD5			21
;45:#define ID_AWARD6			22
;46:#define ID_BACK				23
;47:#define ID_RESET			24
;48:#define ID_CUSTOM			25
;49:#define ID_NEXT				26
;50:
;51:#define PLAYER_Y			314
;52:#define AWARDS_Y			(PLAYER_Y + 26)
;53:
;54:
;55:typedef struct {
;56:	menuframework_s	menu;
;57:	menutext_s		item_banner;
;58:	menubitmap_s	item_leftarrow;
;59:	menubitmap_s	item_maps[4];
;60:	menubitmap_s	item_rightarrow;
;61:	menubitmap_s	item_player;
;62:	menubitmap_s	item_awards[6];
;63:	menubitmap_s	item_back;
;64:	menubitmap_s	item_reset;
;65:	menubitmap_s	item_custom;
;66:	menubitmap_s	item_next;
;67:	menubitmap_s	item_null;
;68:
;69:	qboolean		reinit;
;70:
;71:	const char *	selectedArenaInfo;
;72:	int				numMaps;
;73:	char			levelPicNames[4][MAX_QPATH];
;74:	char			levelNames[4][16];
;75:	int				levelScores[4];
;76:	int				levelScoresSkill[4];
;77:	qhandle_t		levelSelectedPic;
;78:	qhandle_t		levelFocusPic;
;79:	qhandle_t		levelCompletePic[5];
;80:
;81:	char			playerModel[MAX_QPATH];
;82:	char			playerPicName[MAX_QPATH];
;83:	int				awardLevels[6];
;84:	sfxHandle_t		awardSounds[6];
;85:
;86:	int				numBots;
;87:	qhandle_t		botPics[7];
;88:	char			botNames[7][10];
;89:} levelMenuInfo_t;
;90:
;91:static levelMenuInfo_t	levelMenuInfo;
;92:
;93:static int	selectedArenaSet;
;94:static int	selectedArena;
;95:static int	currentSet;
;96:static int	currentGame;
;97:static int	trainingTier;
;98:static int	finalTier;
;99:static int	minTier;
;100:static int	maxTier;
;101:
;102:
;103:/*
;104:=================
;105:PlayerIcon
;106:=================
;107:*/
;108:static void PlayerIcon( const char *modelAndSkin, char *iconName, int iconNameMaxSize ) {
line 112
;109:	char	*skin;
;110:	char	model[MAX_QPATH];
;111:
;112:	Q_strncpyz( model, modelAndSkin, sizeof(model));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 113
;113:	skin = Q_strrchr( model, '/' );
ADDRLP4 4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 68
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 114
;114:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $69
line 115
;115:		*skin++ = '\0';
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI1 0
ASGNI1
line 116
;116:	}
ADDRGP4 $70
JUMPV
LABELV $69
line 117
;117:	else {
line 118
;118:		skin = "default";
ADDRLP4 0
ADDRGP4 $71
ASGNP4
line 119
;119:	}
LABELV $70
line 121
;120:
;121:	Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_%s.tga", model, skin );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $72
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 123
;122:
;123:	if( !trap_R_RegisterShaderNoMip( iconName ) && Q_stricmp( skin, "default" ) != 0 ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $73
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $71
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $73
line 124
;124:		Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_default.tga", model );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $75
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 125
;125:	}
LABELV $73
line 126
;126:}
LABELV $68
endproc PlayerIcon 80 20
proc PlayerIconHandle 68 12
line 134
;127:
;128:
;129:/*
;130:=================
;131:PlayerIconhandle
;132:=================
;133:*/
;134:static qhandle_t PlayerIconHandle( const char *modelAndSkin ) {
line 137
;135:	char	iconName[MAX_QPATH];
;136:
;137:	PlayerIcon( modelAndSkin, iconName, sizeof(iconName) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 138
;138:	return trap_R_RegisterShaderNoMip( iconName );
ADDRLP4 0
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
LABELV $76
endproc PlayerIconHandle 68 12
proc UI_SPLevelMenu_SetBots 1068 12
line 147
;139:}
;140:
;141:
;142:/*
;143:=================
;144:UI_SPLevelMenu_SetBots
;145:=================
;146:*/
;147:static void UI_SPLevelMenu_SetBots( void ) {
line 153
;148:	char	*p;
;149:	char	*bot;
;150:	char	*botInfo;
;151:	char	bots[MAX_INFO_STRING];
;152:
;153:	levelMenuInfo.numBots = 0;
ADDRGP4 levelMenuInfo+2512
CNSTI4 0
ASGNI4
line 154
;154:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $79
line 155
;155:		return;
ADDRGP4 $77
JUMPV
LABELV $79
line 158
;156:	}
;157:
;158:	Q_strncpyz( bots, Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "bots" ), sizeof(bots) );
ADDRGP4 levelMenuInfo+1948
INDIRP4
ARGP4
ADDRGP4 $82
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 160
;159:
;160:	p = &bots[0];
ADDRLP4 0
ADDRLP4 12
ASGNP4
ADDRGP4 $84
JUMPV
line 161
;161:	while( *p && levelMenuInfo.numBots < 7 ) {
LABELV $87
line 163
;162:		//skip spaces
;163:		while( *p && *p == ' ' ) {
line 164
;164:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 165
;165:		}
LABELV $88
line 163
ADDRLP4 1040
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $90
ADDRLP4 1040
INDIRI4
CNSTI4 32
EQI4 $87
LABELV $90
line 166
;166:		if( !p ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $91
line 167
;167:			break;
ADDRGP4 $85
JUMPV
LABELV $91
line 171
;168:		}
;169:
;170:		// mark start of bot name
;171:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $94
JUMPV
LABELV $93
line 174
;172:
;173:		// skip until space of null
;174:		while( *p && *p != ' ' ) {
line 175
;175:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 176
;176:		}
LABELV $94
line 174
ADDRLP4 1044
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $96
ADDRLP4 1044
INDIRI4
CNSTI4 32
NEI4 $93
LABELV $96
line 177
;177:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $97
line 178
;178:			*p++ = 0;
ADDRLP4 1048
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1048
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI1 0
ASGNI1
line 179
;179:		}
LABELV $97
line 181
;180:
;181:		botInfo = UI_GetBotInfoByName( bot );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 UI_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1048
INDIRP4
ASGNP4
line 182
;182:		if( botInfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $99
line 183
;183:			levelMenuInfo.botPics[levelMenuInfo.numBots] = PlayerIconHandle( Info_ValueForKey( botInfo, "model" ) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $103
ARGP4
ADDRLP4 1052
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 PlayerIconHandle
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2512
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2516
ADDP4
ADDRLP4 1056
INDIRI4
ASGNI4
line 184
;184:			Q_strncpyz( levelMenuInfo.botNames[levelMenuInfo.numBots], Info_ValueForKey( botInfo, "name" ), 10 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $106
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
CNSTI4 10
ASGNI4
ADDRLP4 1064
INDIRI4
ADDRGP4 levelMenuInfo+2512
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+2544
ADDP4
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 185
;185:		}
ADDRGP4 $100
JUMPV
LABELV $99
line 186
;186:		else {
line 187
;187:			levelMenuInfo.botPics[levelMenuInfo.numBots] = 0;
ADDRGP4 levelMenuInfo+2512
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2516
ADDP4
CNSTI4 0
ASGNI4
line 188
;188:			Q_strncpyz( levelMenuInfo.botNames[levelMenuInfo.numBots], bot, 10 );
ADDRLP4 1052
CNSTI4 10
ASGNI4
ADDRLP4 1052
INDIRI4
ADDRGP4 levelMenuInfo+2512
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+2544
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 189
;189:		}
LABELV $100
line 190
;190:		Q_CleanStr( levelMenuInfo.botNames[levelMenuInfo.numBots] );
CNSTI4 10
ADDRGP4 levelMenuInfo+2512
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+2544
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 191
;191:		levelMenuInfo.numBots++;
ADDRLP4 1052
ADDRGP4 levelMenuInfo+2512
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 192
;192:	}
LABELV $84
line 161
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $114
ADDRGP4 levelMenuInfo+2512
INDIRI4
CNSTI4 7
LTI4 $88
LABELV $114
LABELV $85
line 193
;193:}
LABELV $77
endproc UI_SPLevelMenu_SetBots 1068 12
proc UI_SPLevelMenu_SetMenuArena 84 12
line 201
;194:
;195:
;196:/*
;197:=================
;198:UI_SPLevelMenu_SetMenuItems
;199:=================
;200:*/
;201:static void UI_SPLevelMenu_SetMenuArena( int n, int level, const char *arenaInfo ) {
line 204
;202:	char		map[MAX_QPATH];
;203:
;204:	Q_strncpyz( map, Info_ValueForKey( arenaInfo, "map" ), sizeof(map) );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 64
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 206
;205:
;206:	Q_strncpyz( levelMenuInfo.levelNames[n], map, sizeof(levelMenuInfo.levelNames[n]) );
ADDRFP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2212
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 207
;207:	Q_strupr( levelMenuInfo.levelNames[n] );
ADDRFP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2212
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 209
;208:
;209:	UI_GetBestScore( level, &levelMenuInfo.levelScores[n], &levelMenuInfo.levelScoresSkill[n] );
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 68
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 68
INDIRI4
ADDRGP4 levelMenuInfo+2276
ADDP4
ARGP4
ADDRLP4 68
INDIRI4
ADDRGP4 levelMenuInfo+2292
ADDP4
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 210
;210:	if( levelMenuInfo.levelScores[n] > 8 ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2276
ADDP4
INDIRI4
CNSTI4 8
LEI4 $122
line 211
;211:		levelMenuInfo.levelScores[n] = 8;
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2276
ADDP4
CNSTI4 8
ASGNI4
line 212
;212:	}
LABELV $122
line 214
;213:
;214:	strcpy( levelMenuInfo.levelPicNames[n], va( "levelshots/%s.tga", map ) );
ADDRGP4 $127
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+1956
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 215
;215:	if( !trap_R_RegisterShaderNoMip( levelMenuInfo.levelPicNames[n] ) ) {
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+1956
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $128
line 216
;216:		strcpy( levelMenuInfo.levelPicNames[n], ART_MAP_UNKNOWN );
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+1956
ADDP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 217
;217:	}
LABELV $128
line 218
;218:	levelMenuInfo.item_maps[n].shader = 0;
CNSTI4 88
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+448+68
ADDP4
CNSTI4 0
ASGNI4
line 219
;219:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $135
line 220
;220:		levelMenuInfo.item_maps[n].generic.flags |= QMF_GRAYED;
ADDRLP4 80
CNSTI4 88
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+448+44
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 221
;221:	}
ADDRGP4 $136
JUMPV
LABELV $135
line 222
;222:	else {
line 223
;223:		levelMenuInfo.item_maps[n].generic.flags &= ~QMF_GRAYED;
ADDRLP4 80
CNSTI4 88
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+448+44
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 224
;224:	}
LABELV $136
line 226
;225:
;226:	levelMenuInfo.item_maps[n].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 80
CNSTI4 88
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+448+44
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 227
;227:}
LABELV $115
endproc UI_SPLevelMenu_SetMenuArena 84 12
proc UI_SPLevelMenu_SetMenuItems 44 12
line 229
;228:
;229:static void UI_SPLevelMenu_SetMenuItems( void ) {
line 234
;230:	int			n;
;231:	int			level;
;232:	const char	*arenaInfo;
;233:
;234:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $144
line 235
;235:		selectedArena = -1;
ADDRGP4 selectedArena
CNSTI4 -1
ASGNI4
line 236
;236:	}
ADDRGP4 $145
JUMPV
LABELV $144
line 237
;237:	else if ( selectedArena == -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $146
line 238
;238:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 239
;239:	}
LABELV $146
LABELV $145
line 241
;240:
;241:	if( selectedArenaSet == minTier || selectedArenaSet == finalTier ) {
ADDRLP4 12
ADDRGP4 selectedArenaSet
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 minTier
INDIRI4
EQI4 $150
ADDRLP4 12
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $148
LABELV $150
line 242
;242:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 243
;243:	}
LABELV $148
line 245
;244:
;245:	if( selectedArena != -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
EQI4 $151
line 246
;246:		trap_Cvar_SetValue( "ui_spSelection", selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 $153
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 247
;247:	}
LABELV $151
line 249
;248:
;249:	if( selectedArenaSet == trainingTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 trainingTier
INDIRI4
NEI4 $154
line 250
;250:		arenaInfo = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $156
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 251
;251:		level = atoi( Info_ValueForKey( arenaInfo, "num" ) );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $157
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 252
;252:		UI_SPLevelMenu_SetMenuArena( 0, level, arenaInfo );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 253
;253:		levelMenuInfo.selectedArenaInfo = arenaInfo;
ADDRGP4 levelMenuInfo+1948
ADDRLP4 8
INDIRP4
ASGNP4
line 255
;254:
;255:		levelMenuInfo.item_maps[0].generic.x = 256;
ADDRGP4 levelMenuInfo+448+12
CNSTI4 256
ASGNI4
line 256
;256:		Bitmap_Init( &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo+448
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 257
;257:		levelMenuInfo.item_maps[0].generic.bottom += 32;
ADDRLP4 28
ADDRGP4 levelMenuInfo+448+32
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 258
;258:		levelMenuInfo.numMaps = 1;
ADDRGP4 levelMenuInfo+1952
CNSTI4 1
ASGNI4
line 260
;259:
;260:		levelMenuInfo.item_maps[1].generic.flags |= QMF_INACTIVE;
ADDRLP4 32
ADDRGP4 levelMenuInfo+448+88+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 261
;261:		levelMenuInfo.item_maps[2].generic.flags |= QMF_INACTIVE;
ADDRLP4 36
ADDRGP4 levelMenuInfo+448+176+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 262
;262:		levelMenuInfo.item_maps[3].generic.flags |= QMF_INACTIVE;
ADDRLP4 40
ADDRGP4 levelMenuInfo+448+264+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 263
;263:		levelMenuInfo.levelPicNames[1][0] = 0;
ADDRGP4 levelMenuInfo+1956+64
CNSTI1 0
ASGNI1
line 264
;264:		levelMenuInfo.levelPicNames[2][0] = 0;
ADDRGP4 levelMenuInfo+1956+128
CNSTI1 0
ASGNI1
line 265
;265:		levelMenuInfo.levelPicNames[3][0] = 0;
ADDRGP4 levelMenuInfo+1956+192
CNSTI1 0
ASGNI1
line 266
;266:		levelMenuInfo.item_maps[1].shader = 0;
ADDRGP4 levelMenuInfo+448+88+68
CNSTI4 0
ASGNI4
line 267
;267:		levelMenuInfo.item_maps[2].shader = 0;
ADDRGP4 levelMenuInfo+448+176+68
CNSTI4 0
ASGNI4
line 268
;268:		levelMenuInfo.item_maps[3].shader = 0;
ADDRGP4 levelMenuInfo+448+264+68
CNSTI4 0
ASGNI4
line 269
;269:	}
ADDRGP4 $155
JUMPV
LABELV $154
line 270
;270:	else if( selectedArenaSet == finalTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $189
line 271
;271:		arenaInfo = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $191
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 272
;272:		level = atoi( Info_ValueForKey( arenaInfo, "num" ) );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $157
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 273
;273:		UI_SPLevelMenu_SetMenuArena( 0, level, arenaInfo );
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 274
;274:		levelMenuInfo.selectedArenaInfo = arenaInfo;
ADDRGP4 levelMenuInfo+1948
ADDRLP4 8
INDIRP4
ASGNP4
line 276
;275:
;276:		levelMenuInfo.item_maps[0].generic.x = 256;
ADDRGP4 levelMenuInfo+448+12
CNSTI4 256
ASGNI4
line 277
;277:		Bitmap_Init( &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo+448
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 278
;278:		levelMenuInfo.item_maps[0].generic.bottom += 32;
ADDRLP4 28
ADDRGP4 levelMenuInfo+448+32
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 279
;279:		levelMenuInfo.numMaps = 1;
ADDRGP4 levelMenuInfo+1952
CNSTI4 1
ASGNI4
line 281
;280:
;281:		levelMenuInfo.item_maps[1].generic.flags |= QMF_INACTIVE;
ADDRLP4 32
ADDRGP4 levelMenuInfo+448+88+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 282
;282:		levelMenuInfo.item_maps[2].generic.flags |= QMF_INACTIVE;
ADDRLP4 36
ADDRGP4 levelMenuInfo+448+176+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 283
;283:		levelMenuInfo.item_maps[3].generic.flags |= QMF_INACTIVE;
ADDRLP4 40
ADDRGP4 levelMenuInfo+448+264+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 284
;284:		levelMenuInfo.levelPicNames[1][0] = 0;
ADDRGP4 levelMenuInfo+1956+64
CNSTI1 0
ASGNI1
line 285
;285:		levelMenuInfo.levelPicNames[2][0] = 0;
ADDRGP4 levelMenuInfo+1956+128
CNSTI1 0
ASGNI1
line 286
;286:		levelMenuInfo.levelPicNames[3][0] = 0;
ADDRGP4 levelMenuInfo+1956+192
CNSTI1 0
ASGNI1
line 287
;287:		levelMenuInfo.item_maps[1].shader = 0;
ADDRGP4 levelMenuInfo+448+88+68
CNSTI4 0
ASGNI4
line 288
;288:		levelMenuInfo.item_maps[2].shader = 0;
ADDRGP4 levelMenuInfo+448+176+68
CNSTI4 0
ASGNI4
line 289
;289:		levelMenuInfo.item_maps[3].shader = 0;
ADDRGP4 levelMenuInfo+448+264+68
CNSTI4 0
ASGNI4
line 290
;290:	}
ADDRGP4 $190
JUMPV
LABELV $189
line 291
;291:	else {
line 292
;292:		levelMenuInfo.item_maps[0].generic.x = 46;
ADDRGP4 levelMenuInfo+448+12
CNSTI4 46
ASGNI4
line 293
;293:		Bitmap_Init( &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo+448
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 294
;294:		levelMenuInfo.item_maps[0].generic.bottom += 18;
ADDRLP4 16
ADDRGP4 levelMenuInfo+448+32
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 295
;295:		levelMenuInfo.numMaps = 4;
ADDRGP4 levelMenuInfo+1952
CNSTI4 4
ASGNI4
line 297
;296:
;297:		for ( n = 0; n < 4; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $229
line 298
;298:			level = selectedArenaSet * ARENAS_PER_TIER + n;
ADDRLP4 4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 299
;299:			arenaInfo = UI_GetArenaInfoByNumber( level );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 300
;300:			UI_SPLevelMenu_SetMenuArena( n, level, arenaInfo );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 301
;301:		}
LABELV $230
line 297
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $229
line 303
;302:
;303:		if( selectedArena != -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
EQI4 $233
line 304
;304:			levelMenuInfo.selectedArenaInfo = UI_GetArenaInfoByNumber( selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRGP4 levelMenuInfo+1948
ADDRLP4 20
INDIRP4
ASGNP4
line 305
;305:		}
LABELV $233
line 306
;306:	}
LABELV $190
LABELV $155
line 309
;307:
;308:	// enable/disable arrows when they are valid/invalid
;309:	if ( selectedArenaSet == minTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 minTier
INDIRI4
NEI4 $236
line 310
;310:		levelMenuInfo.item_leftarrow.generic.flags |= ( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+360+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 311
;311:	}
ADDRGP4 $237
JUMPV
LABELV $236
line 312
;312:	else {
line 313
;313:		levelMenuInfo.item_leftarrow.generic.flags &= ~( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+360+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 314
;314:	}
LABELV $237
line 316
;315:
;316:	if ( selectedArenaSet == maxTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 maxTier
INDIRI4
NEI4 $242
line 317
;317:		levelMenuInfo.item_rightarrow.generic.flags |= ( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+800+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 318
;318:	}
ADDRGP4 $243
JUMPV
LABELV $242
line 319
;319:	else {
line 320
;320:		levelMenuInfo.item_rightarrow.generic.flags &= ~( QMF_INACTIVE | QMF_HIDDEN );
ADDRLP4 16
ADDRGP4 levelMenuInfo+800+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 321
;321:	}
LABELV $243
line 323
;322:
;323:	UI_SPLevelMenu_SetBots();
ADDRGP4 UI_SPLevelMenu_SetBots
CALLV
pop
line 324
;324:}
LABELV $143
endproc UI_SPLevelMenu_SetMenuItems 44 12
proc UI_SPLevelMenu_ResetDraw 0 20
line 332
;325:
;326:
;327:/*
;328:=================
;329:UI_SPLevelMenu_ResetEvent
;330:=================
;331:*/
;332:static void UI_SPLevelMenu_ResetDraw( void ) {
line 333
;333:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 0, "WARNING: This resets all of the", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 356
ARGI4
ADDRGP4 $249
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 334
;334:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 1, "single player game variables.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 383
ARGI4
ADDRGP4 $250
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 335
;335:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 2, "Do this only if you want to", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 410
ARGI4
ADDRGP4 $251
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 336
;336:	UI_DrawProportionalString( SCREEN_WIDTH/2, 356 + PROP_HEIGHT * 3, "start over from the beginning.", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 437
ARGI4
ADDRGP4 $252
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 337
;337:}
LABELV $248
endproc UI_SPLevelMenu_ResetDraw 0 20
proc UI_SPLevelMenu_ResetAction 0 8
line 339
;338:
;339:static void UI_SPLevelMenu_ResetAction( qboolean result ) {
line 340
;340:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $254
line 341
;341:		return;
ADDRGP4 $253
JUMPV
LABELV $254
line 345
;342:	}
;343:
;344:	// clear game variables
;345:	UI_NewGame();
ADDRGP4 UI_NewGame
CALLV
pop
line 346
;346:	trap_Cvar_SetValue( "ui_spSelection", -4 );
ADDRGP4 $153
ARGP4
CNSTF4 3229614080
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 349
;347:
;348:	// make the level select menu re-initialize
;349:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 350
;350:	UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 351
;351:}
LABELV $253
endproc UI_SPLevelMenu_ResetAction 0 8
proc UI_SPLevelMenu_ResetEvent 0 12
line 354
;352:
;353:static void UI_SPLevelMenu_ResetEvent( void* ptr, int event )
;354:{
line 355
;355:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $257
line 356
;356:		return;
ADDRGP4 $256
JUMPV
LABELV $257
line 359
;357:	}
;358:
;359:	UI_ConfirmMenu( "RESET GAME?", UI_SPLevelMenu_ResetDraw, UI_SPLevelMenu_ResetAction );
ADDRGP4 $259
ARGP4
ADDRGP4 UI_SPLevelMenu_ResetDraw
ARGP4
ADDRGP4 UI_SPLevelMenu_ResetAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 360
;360:}
LABELV $256
endproc UI_SPLevelMenu_ResetEvent 0 12
proc UI_SPLevelMenu_LevelEvent 12 8
line 368
;361:
;362:
;363:/*
;364:=================
;365:UI_SPLevelMenu_LevelEvent
;366:=================
;367:*/
;368:static void UI_SPLevelMenu_LevelEvent( void* ptr, int notification ) {
line 369
;369:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $261
line 370
;370:		return;
ADDRGP4 $260
JUMPV
LABELV $261
line 373
;371:	}
;372:
;373:	if ( selectedArenaSet == selectedArenaSet == finalTier ) {
ADDRLP4 4
ADDRGP4 selectedArenaSet
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $266
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $267
JUMPV
LABELV $266
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $267
ADDRLP4 0
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $263
line 374
;374:		return;
ADDRGP4 $260
JUMPV
LABELV $263
line 377
;375:	}
;376:
;377:	selectedArena = ((menucommon_s*)ptr)->id - ID_PICTURE0;
ADDRGP4 selectedArena
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 11
SUBI4
ASGNI4
line 378
;378:	levelMenuInfo.selectedArenaInfo = UI_GetArenaInfoByNumber( selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRGP4 levelMenuInfo+1948
ADDRLP4 8
INDIRP4
ASGNP4
line 379
;379:	UI_SPLevelMenu_SetBots();
ADDRGP4 UI_SPLevelMenu_SetBots
CALLV
pop
line 381
;380:
;381:	trap_Cvar_SetValue( "ui_spSelection", selectedArenaSet * ARENAS_PER_TIER + selectedArena );
ADDRGP4 $153
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 382
;382:}
LABELV $260
endproc UI_SPLevelMenu_LevelEvent 12 8
proc UI_SPLevelMenu_LeftArrowEvent 4 0
line 390
;383:
;384:
;385:/*
;386:=================
;387:UI_SPLevelMenu_LeftArrowEvent
;388:=================
;389:*/
;390:static void UI_SPLevelMenu_LeftArrowEvent( void* ptr, int notification ) {
line 391
;391:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $270
line 392
;392:		return;
ADDRGP4 $269
JUMPV
LABELV $270
line 395
;393:	}
;394:
;395:	if ( selectedArenaSet == minTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 minTier
INDIRI4
NEI4 $272
line 396
;396:		return;
ADDRGP4 $269
JUMPV
LABELV $272
line 399
;397:	}
;398:
;399:	selectedArenaSet--;
ADDRLP4 0
ADDRGP4 selectedArenaSet
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 400
;400:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 401
;401:}
LABELV $269
endproc UI_SPLevelMenu_LeftArrowEvent 4 0
proc UI_SPLevelMenu_RightArrowEvent 4 0
line 409
;402:
;403:
;404:/*
;405:=================
;406:UI_SPLevelMenu_RightArrowEvent
;407:=================
;408:*/
;409:static void UI_SPLevelMenu_RightArrowEvent( void* ptr, int notification ) {
line 410
;410:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $275
line 411
;411:		return;
ADDRGP4 $274
JUMPV
LABELV $275
line 414
;412:	}
;413:
;414:	if ( selectedArenaSet == maxTier ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 maxTier
INDIRI4
NEI4 $277
line 415
;415:		return;
ADDRGP4 $274
JUMPV
LABELV $277
line 418
;416:	}
;417:
;418:	selectedArenaSet++;
ADDRLP4 0
ADDRGP4 selectedArenaSet
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 419
;419:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 420
;420:}
LABELV $274
endproc UI_SPLevelMenu_RightArrowEvent 4 0
proc UI_SPLevelMenu_PlayerEvent 0 0
line 428
;421:
;422:
;423:/*
;424:=================
;425:UI_SPLevelMenu_PlayerEvent
;426:=================
;427:*/
;428:static void UI_SPLevelMenu_PlayerEvent( void* ptr, int notification ) {
line 429
;429:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $280
line 430
;430:		return;
ADDRGP4 $279
JUMPV
LABELV $280
line 433
;431:	}
;432:
;433:	UI_PlayerSettingsMenu();
ADDRGP4 UI_PlayerSettingsMenu
CALLV
pop
line 434
;434:}
LABELV $279
endproc UI_SPLevelMenu_PlayerEvent 0 0
proc UI_SPLevelMenu_AwardEvent 4 8
line 442
;435:
;436:
;437:/*
;438:=================
;439:UI_SPLevelMenu_AwardEvent
;440:=================
;441:*/
;442:static void UI_SPLevelMenu_AwardEvent( void* ptr, int notification ) {
line 445
;443:	int		n;
;444:
;445:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $283
line 446
;446:		return;
ADDRGP4 $282
JUMPV
LABELV $283
line 449
;447:	}
;448:
;449:	n = ((menucommon_s*)ptr)->id - ID_AWARD1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 17
SUBI4
ASGNI4
line 450
;450:	trap_S_StartLocalSound( levelMenuInfo.awardSounds[n], CHAN_ANNOUNCER );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2488
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 451
;451:}
LABELV $282
endproc UI_SPLevelMenu_AwardEvent 4 8
proc UI_SPLevelMenu_NextEvent 0 4
line 459
;452:
;453:
;454:/*
;455:=================
;456:UI_SPLevelMenu_NextEvent
;457:=================
;458:*/
;459:static void UI_SPLevelMenu_NextEvent( void* ptr, int notification ) {
line 460
;460:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $287
line 461
;461:		return;
ADDRGP4 $286
JUMPV
LABELV $287
line 464
;462:	}
;463:
;464:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $289
line 465
;465:		return;
ADDRGP4 $286
JUMPV
LABELV $289
line 468
;466:	}
;467:
;468:	if ( selectedArena == -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $291
line 469
;469:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 470
;470:	}
LABELV $291
line 472
;471:
;472:	UI_SPSkillMenu( levelMenuInfo.selectedArenaInfo );
ADDRGP4 levelMenuInfo+1948
INDIRP4
ARGP4
ADDRGP4 UI_SPSkillMenu
CALLV
pop
line 473
;473:}
LABELV $286
endproc UI_SPLevelMenu_NextEvent 0 4
proc UI_SPLevelMenu_BackEvent 0 0
line 481
;474:
;475:
;476:/*
;477:=================
;478:UI_SPLevelMenu_BackEvent
;479:=================
;480:*/
;481:static void UI_SPLevelMenu_BackEvent( void* ptr, int notification ) {
line 482
;482:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $295
line 483
;483:		return;
ADDRGP4 $294
JUMPV
LABELV $295
line 486
;484:	}
;485:
;486:	if ( selectedArena == -1 ) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $297
line 487
;487:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 488
;488:	}
LABELV $297
line 490
;489:
;490:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 491
;491:}
LABELV $294
endproc UI_SPLevelMenu_BackEvent 0 0
proc UI_SPLevelMenu_CustomEvent 0 4
line 499
;492:
;493:
;494:/*
;495:=================
;496:UI_SPLevelMenu_CustomEvent
;497:=================
;498:*/
;499:static void UI_SPLevelMenu_CustomEvent( void* ptr, int notification ) {
line 500
;500:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $300
line 501
;501:		return;
ADDRGP4 $299
JUMPV
LABELV $300
line 504
;502:	}
;503:
;504:	UI_StartServerMenu( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 505
;505:}
LABELV $299
endproc UI_SPLevelMenu_CustomEvent 0 4
proc UI_SPLevelMenu_MenuDraw 1148 20
line 515
;506:
;507:
;508:/*
;509:=================
;510:UI_SPLevelMenu_MenuDraw
;511:=================
;512:*/
;513:#define LEVEL_DESC_LEFT_MARGIN		332
;514:
;515:static void UI_SPLevelMenu_MenuDraw( void ) {
line 525
;516:	int				n, i;
;517:	int				x, y;
;518:	vec4_t			color;
;519:	int				level;
;520://	int				fraglimit;
;521:	int				pad;
;522:	char			buf[MAX_INFO_VALUE];
;523:	char			string[64];
;524:
;525:	if(	levelMenuInfo.reinit ) {
ADDRGP4 levelMenuInfo+1944
INDIRI4
CNSTI4 0
EQI4 $303
line 526
;526:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 527
;527:		UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 528
;528:		return;
ADDRGP4 $302
JUMPV
LABELV $303
line 532
;529:	}
;530:
;531:	// draw player name
;532:	trap_Cvar_VariableStringBuffer( "name", string, 32 );
ADDRGP4 $106
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 533
;533:	Q_CleanStr( string );
ADDRLP4 16
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 534
;534:	UI_DrawProportionalString( 320, PLAYER_Y, string, UI_CENTER|UI_SMALLFONT, color_orange );
CNSTI4 320
ARGI4
CNSTI4 314
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 537
;535:
;536:	// check for model changes
;537:	trap_Cvar_VariableStringBuffer( "model", buf, sizeof(buf) );
ADDRGP4 $103
ARGP4
ADDRLP4 100
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 538
;538:	if( Q_stricmp( buf, levelMenuInfo.playerModel ) != 0 ) {
ADDRLP4 100
ARGP4
ADDRGP4 levelMenuInfo+2336
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
EQI4 $306
line 539
;539:		Q_strncpyz( levelMenuInfo.playerModel, buf, sizeof(levelMenuInfo.playerModel) );
ADDRGP4 levelMenuInfo+2336
ARGP4
ADDRLP4 100
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 540
;540:		PlayerIcon( levelMenuInfo.playerModel, levelMenuInfo.playerPicName, sizeof(levelMenuInfo.playerPicName) );
ADDRGP4 levelMenuInfo+2336
ARGP4
ADDRGP4 levelMenuInfo+2400
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 541
;541:		levelMenuInfo.item_player.shader = 0;
ADDRGP4 levelMenuInfo+888+68
CNSTI4 0
ASGNI4
line 542
;542:	}
LABELV $306
line 545
;543:
;544:	// standard menu drawing
;545:	Menu_Draw( &levelMenuInfo.menu );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 548
;546:
;547:	// draw player award levels
;548:	y = AWARDS_Y;
ADDRLP4 8
CNSTI4 340
ASGNI4
line 549
;549:	i = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 550
;550:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $316
line 551
;551:		level = levelMenuInfo.awardLevels[n];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2464
ADDP4
INDIRI4
ASGNI4
line 552
;552:		if( level > 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $321
line 553
;553:			if( i & 1 ) {
ADDRLP4 80
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $323
line 554
;554:				x = 224 - (i - 1 ) / 2 * (48 + 16);
ADDRLP4 4
CNSTI4 224
ADDRLP4 80
INDIRI4
CNSTI4 1
SUBI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
SUBI4
ASGNI4
line 555
;555:			}
ADDRGP4 $324
JUMPV
LABELV $323
line 556
;556:			else {
line 557
;557:				x = 368 + i / 2 * (48 + 16);
ADDRLP4 4
ADDRLP4 80
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
CNSTI4 368
ADDI4
ASGNI4
line 558
;558:			}
LABELV $324
line 559
;559:			i++;
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 561
;560:
;561:			if( level == 1 ) {
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $325
line 562
;562:				continue;
ADDRGP4 $317
JUMPV
LABELV $325
line 565
;563:			}
;564:
;565:			if( level >= 1000000 ) {
ADDRLP4 12
INDIRI4
CNSTI4 1000000
LTI4 $327
line 566
;566:				Com_sprintf( string, sizeof(string), "%im", level / 1000000 );
ADDRLP4 16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $329
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 1000000
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 567
;567:			}
ADDRGP4 $328
JUMPV
LABELV $327
line 568
;568:			else if( level >= 1000 ) {
ADDRLP4 12
INDIRI4
CNSTI4 1000
LTI4 $330
line 569
;569:				Com_sprintf( string, sizeof(string), "%ik", level / 1000 );
ADDRLP4 16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $332
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 1000
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 570
;570:			}
ADDRGP4 $331
JUMPV
LABELV $330
line 571
;571:			else {
line 572
;572:				Com_sprintf( string, sizeof(string), "%i", level );
ADDRLP4 16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $333
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 573
;573:			}
LABELV $331
LABELV $328
line 575
;574:
;575:			UI_DrawString( x + 24, y + 48, string, UI_CENTER, color_yellow );
ADDRLP4 4
INDIRI4
CNSTI4 24
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 48
ADDI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 576
;576:		}
LABELV $321
line 577
;577:	}
LABELV $317
line 550
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $316
line 579
;578:
;579:	UI_DrawProportionalString( 18, 38, va( "Tier %i", selectedArenaSet + 1 ), UI_LEFT|UI_SMALLFONT, color_orange );
ADDRGP4 $334
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1132
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 18
ARGI4
CNSTI4 38
ARGI4
ADDRLP4 1132
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 581
;580:
;581:	for ( n = 0; n < levelMenuInfo.numMaps; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $338
JUMPV
LABELV $335
line 582
;582:		x = levelMenuInfo.item_maps[n].generic.x;
ADDRLP4 4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+448+12
ADDP4
INDIRI4
ASGNI4
line 583
;583:		y = levelMenuInfo.item_maps[n].generic.y;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+448+16
ADDP4
INDIRI4
ASGNI4
line 584
;584:		UI_FillRect( x, y + 96, 128, 18, color_black );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 96
ADDI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1099956224
ARGF4
ADDRGP4 color_black
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 585
;585:	}
LABELV $336
line 581
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $338
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+1952
INDIRI4
LTI4 $335
line 587
;586:
;587:	if ( selectedArenaSet > currentSet ) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $344
line 588
;588:		UI_DrawProportionalString( 320, 216, "ACCESS DENIED", UI_CENTER|UI_BIGFONT, color_red );
CNSTI4 320
ARGI4
CNSTI4 216
ARGI4
ADDRGP4 $346
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 589
;589:		return;
ADDRGP4 $302
JUMPV
LABELV $344
line 593
;590:	}
;591:
;592:	// show levelshots for levels of current tier
;593:	Vector4Copy( color_white, color );
ADDRLP4 84
ADDRGP4 color_white
INDIRF4
ASGNF4
ADDRLP4 84+4
ADDRGP4 color_white+4
INDIRF4
ASGNF4
ADDRLP4 84+8
ADDRGP4 color_white+8
INDIRF4
ASGNF4
ADDRLP4 84+12
ADDRGP4 color_white+12
INDIRF4
ASGNF4
line 594
;594:	color[3] = 0.5+0.5*sin(uis.realtime/PULSE_DIVISOR);
ADDRGP4 uis+4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 1136
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 84+12
CNSTF4 1056964608
ADDRLP4 1136
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 595
;595:	for ( n = 0; n < levelMenuInfo.numMaps; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $358
JUMPV
LABELV $355
line 596
;596:		x = levelMenuInfo.item_maps[n].generic.x;
ADDRLP4 4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+448+12
ADDP4
INDIRI4
ASGNI4
line 597
;597:		y = levelMenuInfo.item_maps[n].generic.y;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+448+16
ADDP4
INDIRI4
ASGNI4
line 599
;598:
;599:		UI_DrawString( x + 64, y + 96, levelMenuInfo.levelNames[n], UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 96
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2212
ADDP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 601
;600:
;601:		if( levelMenuInfo.levelScores[n] == 1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2276
ADDP4
INDIRI4
CNSTI4 1
NEI4 $365
line 602
;602:			UI_DrawHandlePic( x, y, 128, 96, levelMenuInfo.levelCompletePic[levelMenuInfo.levelScoresSkill[n] - 1] ); 
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1119879168
ARGF4
ADDRLP4 1140
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1140
INDIRI4
LSHI4
ADDRGP4 levelMenuInfo+2292
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
LSHI4
ADDRGP4 levelMenuInfo+2316-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 603
;603:		}
LABELV $365
line 605
;604:
;605:		if ( n == selectedArena ) {
ADDRLP4 0
INDIRI4
ADDRGP4 selectedArena
INDIRI4
NEI4 $371
line 606
;606:			if( Menu_ItemAtCursor( &levelMenuInfo.menu ) == &levelMenuInfo.item_maps[n] ) {
ADDRGP4 levelMenuInfo
ARGP4
ADDRLP4 1140
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+448
ADDP4
CVPU4 4
ADDRLP4 1140
INDIRP4
CVPU4 4
NEU4 $373
line 607
;607:				trap_R_SetColor( color );
ADDRLP4 84
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 608
;608:			}
LABELV $373
line 609
;609:			UI_DrawHandlePic( x-1, y-1, 130, 130 - 14, levelMenuInfo.levelSelectedPic ); 
ADDRLP4 1144
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 1144
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
ADDRLP4 1144
INDIRI4
SUBI4
CVIF4 4
ARGF4
CNSTF4 1124204544
ARGF4
CNSTF4 1122500608
ARGF4
ADDRGP4 levelMenuInfo+2308
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 610
;610:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 611
;611:		}
ADDRGP4 $372
JUMPV
LABELV $371
line 612
;612:		else if( Menu_ItemAtCursor( &levelMenuInfo.menu ) == &levelMenuInfo.item_maps[n] ) {
ADDRGP4 levelMenuInfo
ARGP4
ADDRLP4 1140
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+448
ADDP4
CVPU4 4
ADDRLP4 1140
INDIRP4
CVPU4 4
NEU4 $377
line 613
;613:			trap_R_SetColor( color );
ADDRLP4 84
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 614
;614:			UI_DrawHandlePic( x-31, y-30, 256, 256-27, levelMenuInfo.levelFocusPic); 
ADDRLP4 4
INDIRI4
CNSTI4 31
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 30
SUBI4
CVIF4 4
ARGF4
CNSTF4 1132462080
ARGF4
CNSTF4 1130692608
ARGF4
ADDRGP4 levelMenuInfo+2312
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 615
;615:			trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 616
;616:		}
LABELV $377
LABELV $372
line 617
;617:	}
LABELV $356
line 595
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $358
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+1952
INDIRI4
LTI4 $355
line 620
;618:
;619:	// show map name and long name of selected level
;620:	y = 192;
ADDRLP4 8
CNSTI4 192
ASGNI4
line 621
;621:	Q_strncpyz( buf, Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "map" ), 20 );
ADDRGP4 levelMenuInfo+1948
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 1140
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 100
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 622
;622:	Q_strupr( buf );
ADDRLP4 100
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 623
;623:	Com_sprintf( string, sizeof(string), "%s: %s", buf, Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "longname" ) );
ADDRGP4 levelMenuInfo+1948
INDIRP4
ARGP4
ADDRGP4 $384
ARGP4
ADDRLP4 1144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $382
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 624
;624:	UI_DrawProportionalString( 320, y, string, UI_CENTER|UI_SMALLFONT, color_orange );
CNSTI4 320
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 625
;625:}
LABELV $302
endproc UI_SPLevelMenu_MenuDraw 1148 20
export UI_SPLevelMenu_Cache
proc UI_SPLevelMenu_Cache 32 8
line 632
;626:
;627:/*
;628:=================
;629:UI_SPLevelMenu_Cache
;630:=================
;631:*/
;632:void UI_SPLevelMenu_Cache( void ) {
line 635
;633:	int				n;
;634:
;635:	trap_R_RegisterShaderNoMip( ART_LEVELFRAME_FOCUS );
ADDRGP4 $386
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 636
;636:	trap_R_RegisterShaderNoMip( ART_LEVELFRAME_SELECTED );
ADDRGP4 $387
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 637
;637:	trap_R_RegisterShaderNoMip( ART_ARROW );
ADDRGP4 $388
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 638
;638:	trap_R_RegisterShaderNoMip( ART_ARROW_FOCUS );
ADDRGP4 $389
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 639
;639:	trap_R_RegisterShaderNoMip( ART_MAP_UNKNOWN );
ADDRGP4 $132
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 640
;640:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE1 );
ADDRGP4 $390
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 641
;641:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE2 );
ADDRGP4 $391
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 642
;642:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE3 );
ADDRGP4 $392
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 643
;643:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE4 );
ADDRGP4 $393
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 644
;644:	trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE5 );
ADDRGP4 $394
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 645
;645:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $395
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 646
;646:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $396
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 647
;647:	trap_R_RegisterShaderNoMip( ART_FIGHT0 );
ADDRGP4 $397
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 648
;648:	trap_R_RegisterShaderNoMip( ART_FIGHT1 );
ADDRGP4 $398
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 649
;649:	trap_R_RegisterShaderNoMip( ART_RESET0 );
ADDRGP4 $399
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 650
;650:	trap_R_RegisterShaderNoMip( ART_RESET1 );
ADDRGP4 $400
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 651
;651:	trap_R_RegisterShaderNoMip( ART_CUSTOM0 );
ADDRGP4 $401
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 652
;652:	trap_R_RegisterShaderNoMip( ART_CUSTOM1 );
ADDRGP4 $402
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 654
;653:
;654:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $403
line 655
;655:		trap_R_RegisterShaderNoMip( ui_medalPicNames[n] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 656
;656:		levelMenuInfo.awardSounds[n] = trap_S_RegisterSound( ui_medalSounds[n], qfalse );
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 levelMenuInfo+2488
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 657
;657:	}
LABELV $404
line 654
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $403
line 659
;658:
;659:	levelMenuInfo.levelSelectedPic = trap_R_RegisterShaderNoMip( ART_LEVELFRAME_SELECTED );
ADDRGP4 $387
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2308
ADDRLP4 4
INDIRI4
ASGNI4
line 660
;660:	levelMenuInfo.levelFocusPic = trap_R_RegisterShaderNoMip( ART_LEVELFRAME_FOCUS );
ADDRGP4 $386
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2312
ADDRLP4 8
INDIRI4
ASGNI4
line 661
;661:	levelMenuInfo.levelCompletePic[0] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE1 );
ADDRGP4 $390
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2316
ADDRLP4 12
INDIRI4
ASGNI4
line 662
;662:	levelMenuInfo.levelCompletePic[1] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE2 );
ADDRGP4 $391
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2316+4
ADDRLP4 16
INDIRI4
ASGNI4
line 663
;663:	levelMenuInfo.levelCompletePic[2] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE3 );
ADDRGP4 $392
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2316+8
ADDRLP4 20
INDIRI4
ASGNI4
line 664
;664:	levelMenuInfo.levelCompletePic[3] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE4 );
ADDRGP4 $393
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2316+12
ADDRLP4 24
INDIRI4
ASGNI4
line 665
;665:	levelMenuInfo.levelCompletePic[4] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE5 );
ADDRGP4 $394
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2316+16
ADDRLP4 28
INDIRI4
ASGNI4
line 666
;666:}
LABELV $385
endproc UI_SPLevelMenu_Cache 32 8
proc UI_SPLevelMenu_Init 116 12
line 674
;667:
;668:
;669:/*
;670:=================
;671:UI_SPLevelMenu_Init
;672:=================
;673:*/
;674:static void UI_SPLevelMenu_Init( void ) {
line 681
;675:	int		skill;
;676:	int		n;
;677:	int		x, y;
;678:	int		count;
;679:	char	buf[MAX_QPATH];
;680:
;681:	skill = (int)trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $420
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 84
INDIRF4
CVFI4 4
ASGNI4
line 682
;682:	if( skill < 1 || skill > 5 ) {
ADDRLP4 16
INDIRI4
CNSTI4 1
LTI4 $423
ADDRLP4 16
INDIRI4
CNSTI4 5
LEI4 $421
LABELV $423
line 683
;683:		trap_Cvar_Set( "g_spSkill", "2" );
ADDRGP4 $420
ARGP4
ADDRGP4 $424
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 684
;684:		skill = 2;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 685
;685:	}
LABELV $421
line 687
;686:
;687:	memset( &levelMenuInfo, 0, sizeof(levelMenuInfo) );
ADDRGP4 levelMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2616
ARGI4
ADDRGP4 memset
CALLP4
pop
line 688
;688:	levelMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 levelMenuInfo+280
CNSTI4 1
ASGNI4
line 689
;689:	levelMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 levelMenuInfo+276
CNSTI4 1
ASGNI4
line 690
;690:	levelMenuInfo.menu.draw = UI_SPLevelMenu_MenuDraw;
ADDRGP4 levelMenuInfo+268
ADDRGP4 UI_SPLevelMenu_MenuDraw
ASGNP4
line 692
;691:
;692:	UI_SPLevelMenu_Cache();
ADDRGP4 UI_SPLevelMenu_Cache
CALLV
pop
line 694
;693:
;694:	levelMenuInfo.item_banner.generic.type			= MTYPE_BTEXT;
ADDRGP4 levelMenuInfo+288
CNSTI4 10
ASGNI4
line 695
;695:	levelMenuInfo.item_banner.generic.x				= 320;
ADDRGP4 levelMenuInfo+288+12
CNSTI4 320
ASGNI4
line 696
;696:	levelMenuInfo.item_banner.generic.y				= 16;
ADDRGP4 levelMenuInfo+288+16
CNSTI4 16
ASGNI4
line 697
;697:	levelMenuInfo.item_banner.string				= "CHOOSE LEVEL";
ADDRGP4 levelMenuInfo+288+60
ADDRGP4 $435
ASGNP4
line 698
;698:	levelMenuInfo.item_banner.color					= color_red;
ADDRGP4 levelMenuInfo+288+68
ADDRGP4 color_red
ASGNP4
line 699
;699:	levelMenuInfo.item_banner.style					= UI_CENTER;
ADDRGP4 levelMenuInfo+288+64
CNSTI4 1
ASGNI4
line 701
;700:
;701:	levelMenuInfo.item_leftarrow.generic.type		= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+360
CNSTI4 6
ASGNI4
line 702
;702:	levelMenuInfo.item_leftarrow.generic.name		= ART_ARROW;
ADDRGP4 levelMenuInfo+360+4
ADDRGP4 $388
ASGNP4
line 703
;703:	levelMenuInfo.item_leftarrow.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+360+44
CNSTU4 260
ASGNU4
line 704
;704:	levelMenuInfo.item_leftarrow.generic.x			= 18;
ADDRGP4 levelMenuInfo+360+12
CNSTI4 18
ASGNI4
line 705
;705:	levelMenuInfo.item_leftarrow.generic.y			= 64;
ADDRGP4 levelMenuInfo+360+16
CNSTI4 64
ASGNI4
line 706
;706:	levelMenuInfo.item_leftarrow.generic.callback	= UI_SPLevelMenu_LeftArrowEvent;
ADDRGP4 levelMenuInfo+360+48
ADDRGP4 UI_SPLevelMenu_LeftArrowEvent
ASGNP4
line 707
;707:	levelMenuInfo.item_leftarrow.generic.id			= ID_LEFTARROW;
ADDRGP4 levelMenuInfo+360+8
CNSTI4 10
ASGNI4
line 708
;708:	levelMenuInfo.item_leftarrow.width				= 16;
ADDRGP4 levelMenuInfo+360+76
CNSTI4 16
ASGNI4
line 709
;709:	levelMenuInfo.item_leftarrow.height				= 114;
ADDRGP4 levelMenuInfo+360+80
CNSTI4 114
ASGNI4
line 710
;710:	levelMenuInfo.item_leftarrow.focuspic			= ART_ARROW_FOCUS;
ADDRGP4 levelMenuInfo+360+60
ADDRGP4 $389
ASGNP4
line 712
;711:
;712:	levelMenuInfo.item_maps[0].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+448
CNSTI4 6
ASGNI4
line 713
;713:	levelMenuInfo.item_maps[0].generic.name			= levelMenuInfo.levelPicNames[0];
ADDRGP4 levelMenuInfo+448+4
ADDRGP4 levelMenuInfo+1956
ASGNP4
line 714
;714:	levelMenuInfo.item_maps[0].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+448+44
CNSTU4 4
ASGNU4
line 715
;715:	levelMenuInfo.item_maps[0].generic.x			= 46;
ADDRGP4 levelMenuInfo+448+12
CNSTI4 46
ASGNI4
line 716
;716:	levelMenuInfo.item_maps[0].generic.y			= 64;
ADDRGP4 levelMenuInfo+448+16
CNSTI4 64
ASGNI4
line 717
;717:	levelMenuInfo.item_maps[0].generic.id			= ID_PICTURE0;
ADDRGP4 levelMenuInfo+448+8
CNSTI4 11
ASGNI4
line 718
;718:	levelMenuInfo.item_maps[0].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+448+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 719
;719:	levelMenuInfo.item_maps[0].width				= 128;
ADDRGP4 levelMenuInfo+448+76
CNSTI4 128
ASGNI4
line 720
;720:	levelMenuInfo.item_maps[0].height				= 96;
ADDRGP4 levelMenuInfo+448+80
CNSTI4 96
ASGNI4
line 722
;721:
;722:	levelMenuInfo.item_maps[1].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+448+88
CNSTI4 6
ASGNI4
line 723
;723:	levelMenuInfo.item_maps[1].generic.name			= levelMenuInfo.levelPicNames[1];
ADDRGP4 levelMenuInfo+448+88+4
ADDRGP4 levelMenuInfo+1956+64
ASGNP4
line 724
;724:	levelMenuInfo.item_maps[1].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+448+88+44
CNSTU4 4
ASGNU4
line 725
;725:	levelMenuInfo.item_maps[1].generic.x			= 186;
ADDRGP4 levelMenuInfo+448+88+12
CNSTI4 186
ASGNI4
line 726
;726:	levelMenuInfo.item_maps[1].generic.y			= 64;
ADDRGP4 levelMenuInfo+448+88+16
CNSTI4 64
ASGNI4
line 727
;727:	levelMenuInfo.item_maps[1].generic.id			= ID_PICTURE1;
ADDRGP4 levelMenuInfo+448+88+8
CNSTI4 12
ASGNI4
line 728
;728:	levelMenuInfo.item_maps[1].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+448+88+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 729
;729:	levelMenuInfo.item_maps[1].width				= 128;
ADDRGP4 levelMenuInfo+448+88+76
CNSTI4 128
ASGNI4
line 730
;730:	levelMenuInfo.item_maps[1].height				= 96;
ADDRGP4 levelMenuInfo+448+88+80
CNSTI4 96
ASGNI4
line 732
;731:
;732:	levelMenuInfo.item_maps[2].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+448+176
CNSTI4 6
ASGNI4
line 733
;733:	levelMenuInfo.item_maps[2].generic.name			= levelMenuInfo.levelPicNames[2];
ADDRGP4 levelMenuInfo+448+176+4
ADDRGP4 levelMenuInfo+1956+128
ASGNP4
line 734
;734:	levelMenuInfo.item_maps[2].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+448+176+44
CNSTU4 4
ASGNU4
line 735
;735:	levelMenuInfo.item_maps[2].generic.x			= 326;
ADDRGP4 levelMenuInfo+448+176+12
CNSTI4 326
ASGNI4
line 736
;736:	levelMenuInfo.item_maps[2].generic.y			= 64;
ADDRGP4 levelMenuInfo+448+176+16
CNSTI4 64
ASGNI4
line 737
;737:	levelMenuInfo.item_maps[2].generic.id			= ID_PICTURE2;
ADDRGP4 levelMenuInfo+448+176+8
CNSTI4 13
ASGNI4
line 738
;738:	levelMenuInfo.item_maps[2].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+448+176+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 739
;739:	levelMenuInfo.item_maps[2].width				= 128;
ADDRGP4 levelMenuInfo+448+176+76
CNSTI4 128
ASGNI4
line 740
;740:	levelMenuInfo.item_maps[2].height				= 96;
ADDRGP4 levelMenuInfo+448+176+80
CNSTI4 96
ASGNI4
line 742
;741:
;742:	levelMenuInfo.item_maps[3].generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+448+264
CNSTI4 6
ASGNI4
line 743
;743:	levelMenuInfo.item_maps[3].generic.name			= levelMenuInfo.levelPicNames[3];
ADDRGP4 levelMenuInfo+448+264+4
ADDRGP4 levelMenuInfo+1956+192
ASGNP4
line 744
;744:	levelMenuInfo.item_maps[3].generic.flags		= QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+448+264+44
CNSTU4 4
ASGNU4
line 745
;745:	levelMenuInfo.item_maps[3].generic.x			= 466;
ADDRGP4 levelMenuInfo+448+264+12
CNSTI4 466
ASGNI4
line 746
;746:	levelMenuInfo.item_maps[3].generic.y			= 64;
ADDRGP4 levelMenuInfo+448+264+16
CNSTI4 64
ASGNI4
line 747
;747:	levelMenuInfo.item_maps[3].generic.id			= ID_PICTURE3;
ADDRGP4 levelMenuInfo+448+264+8
CNSTI4 14
ASGNI4
line 748
;748:	levelMenuInfo.item_maps[3].generic.callback		= UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+448+264+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 749
;749:	levelMenuInfo.item_maps[3].width				= 128;
ADDRGP4 levelMenuInfo+448+264+76
CNSTI4 128
ASGNI4
line 750
;750:	levelMenuInfo.item_maps[3].height				= 96;
ADDRGP4 levelMenuInfo+448+264+80
CNSTI4 96
ASGNI4
line 752
;751:
;752:	levelMenuInfo.item_rightarrow.generic.type		= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+800
CNSTI4 6
ASGNI4
line 753
;753:	levelMenuInfo.item_rightarrow.generic.name		= ART_ARROW;
ADDRGP4 levelMenuInfo+800+4
ADDRGP4 $388
ASGNP4
line 754
;754:	levelMenuInfo.item_rightarrow.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+800+44
CNSTU4 260
ASGNU4
line 755
;755:	levelMenuInfo.item_rightarrow.generic.x			= 606;
ADDRGP4 levelMenuInfo+800+12
CNSTI4 606
ASGNI4
line 756
;756:	levelMenuInfo.item_rightarrow.generic.y			= 64;
ADDRGP4 levelMenuInfo+800+16
CNSTI4 64
ASGNI4
line 757
;757:	levelMenuInfo.item_rightarrow.generic.callback	= UI_SPLevelMenu_RightArrowEvent;
ADDRGP4 levelMenuInfo+800+48
ADDRGP4 UI_SPLevelMenu_RightArrowEvent
ASGNP4
line 758
;758:	levelMenuInfo.item_rightarrow.generic.id		= ID_RIGHTARROW;
ADDRGP4 levelMenuInfo+800+8
CNSTI4 15
ASGNI4
line 759
;759:	levelMenuInfo.item_rightarrow.width				= -16;
ADDRGP4 levelMenuInfo+800+76
CNSTI4 -16
ASGNI4
line 760
;760:	levelMenuInfo.item_rightarrow.height			= 114;
ADDRGP4 levelMenuInfo+800+80
CNSTI4 114
ASGNI4
line 761
;761:	levelMenuInfo.item_rightarrow.focuspic			= ART_ARROW_FOCUS;
ADDRGP4 levelMenuInfo+800+60
ADDRGP4 $389
ASGNP4
line 763
;762:
;763:	trap_Cvar_VariableStringBuffer( "model", levelMenuInfo.playerModel, sizeof(levelMenuInfo.playerModel) );
ADDRGP4 $103
ARGP4
ADDRGP4 levelMenuInfo+2336
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 764
;764:	PlayerIcon( levelMenuInfo.playerModel, levelMenuInfo.playerPicName, sizeof(levelMenuInfo.playerPicName) );
ADDRGP4 levelMenuInfo+2336
ARGP4
ADDRGP4 levelMenuInfo+2400
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 765
;765:	levelMenuInfo.item_player.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+888
CNSTI4 6
ASGNI4
line 766
;766:	levelMenuInfo.item_player.generic.name			= levelMenuInfo.playerPicName;
ADDRGP4 levelMenuInfo+888+4
ADDRGP4 levelMenuInfo+2400
ASGNP4
line 767
;767:	levelMenuInfo.item_player.generic.flags			= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY;
ADDRGP4 levelMenuInfo+888+44
CNSTU4 2052
ASGNU4
line 768
;768:	levelMenuInfo.item_player.generic.x				= 288;
ADDRGP4 levelMenuInfo+888+12
CNSTI4 288
ASGNI4
line 769
;769:	levelMenuInfo.item_player.generic.y				= AWARDS_Y;
ADDRGP4 levelMenuInfo+888+16
CNSTI4 340
ASGNI4
line 770
;770:	levelMenuInfo.item_player.generic.id			= ID_PLAYERPIC;
ADDRGP4 levelMenuInfo+888+8
CNSTI4 16
ASGNI4
line 771
;771:	levelMenuInfo.item_player.generic.callback		= UI_SPLevelMenu_PlayerEvent;
ADDRGP4 levelMenuInfo+888+48
ADDRGP4 UI_SPLevelMenu_PlayerEvent
ASGNP4
line 772
;772:	levelMenuInfo.item_player.width					= 64;
ADDRGP4 levelMenuInfo+888+76
CNSTI4 64
ASGNI4
line 773
;773:	levelMenuInfo.item_player.height				= 64;
ADDRGP4 levelMenuInfo+888+80
CNSTI4 64
ASGNI4
line 775
;774:
;775:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $603
line 776
;776:		levelMenuInfo.awardLevels[n] = UI_GetAwardLevel( n );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2464
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 777
;777:	}
LABELV $604
line 775
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $603
line 778
;778:	levelMenuInfo.awardLevels[AWARD_FRAGS] = 100 * (levelMenuInfo.awardLevels[AWARD_FRAGS] / 100);
ADDRLP4 92
CNSTI4 100
ASGNI4
ADDRGP4 levelMenuInfo+2464+16
ADDRLP4 92
INDIRI4
ADDRGP4 levelMenuInfo+2464+16
INDIRI4
ADDRLP4 92
INDIRI4
DIVI4
MULI4
ASGNI4
line 780
;779:
;780:	y = AWARDS_Y;
ADDRLP4 12
CNSTI4 340
ASGNI4
line 781
;781:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 782
;782:	for( n = 0; n < 6; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $612
line 783
;783:		if( levelMenuInfo.awardLevels[n] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2464
ADDP4
INDIRI4
CNSTI4 0
EQI4 $616
line 784
;784:			if( count & 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $619
line 785
;785:				x = 224 - (count - 1 ) / 2 * (48 + 16);
ADDRLP4 8
CNSTI4 224
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
SUBI4
ASGNI4
line 786
;786:			}
ADDRGP4 $620
JUMPV
LABELV $619
line 787
;787:			else {
line 788
;788:				x = 368 + count / 2 * (48 + 16);
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
CNSTI4 368
ADDI4
ASGNI4
line 789
;789:			}
LABELV $620
line 791
;790:
;791:			levelMenuInfo.item_awards[count].generic.type		= MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+976
ADDP4
CNSTI4 6
ASGNI4
line 792
;792:			levelMenuInfo.item_awards[count].generic.name		= ui_medalPicNames[n];
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+976+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ASGNP4
line 793
;793:			levelMenuInfo.item_awards[count].generic.flags		= QMF_LEFT_JUSTIFY|QMF_SILENT|QMF_MOUSEONLY;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+976+44
ADDP4
CNSTU4 1050628
ASGNU4
line 794
;794:			levelMenuInfo.item_awards[count].generic.x			= x;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+976+12
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 795
;795:			levelMenuInfo.item_awards[count].generic.y			= y;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+976+16
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 796
;796:			levelMenuInfo.item_awards[count].generic.id			= ID_AWARD1 + n;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+976+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 17
ADDI4
ASGNI4
line 797
;797:			levelMenuInfo.item_awards[count].generic.callback	= UI_SPLevelMenu_AwardEvent;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+976+48
ADDP4
ADDRGP4 UI_SPLevelMenu_AwardEvent
ASGNP4
line 798
;798:			levelMenuInfo.item_awards[count].width				= 48;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+976+76
ADDP4
CNSTI4 48
ASGNI4
line 799
;799:			levelMenuInfo.item_awards[count].height				= 48;
CNSTI4 88
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+976+80
ADDP4
CNSTI4 48
ASGNI4
line 800
;800:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 801
;801:		}
LABELV $616
line 802
;802:	}
LABELV $613
line 782
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $612
line 804
;803:
;804:	levelMenuInfo.item_back.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1504
CNSTI4 6
ASGNI4
line 805
;805:	levelMenuInfo.item_back.generic.name			= ART_BACK0;
ADDRGP4 levelMenuInfo+1504+4
ADDRGP4 $395
ASGNP4
line 806
;806:	levelMenuInfo.item_back.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1504+44
CNSTU4 260
ASGNU4
line 807
;807:	levelMenuInfo.item_back.generic.x				= 0;
ADDRGP4 levelMenuInfo+1504+12
CNSTI4 0
ASGNI4
line 808
;808:	levelMenuInfo.item_back.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+1504+16
CNSTI4 416
ASGNI4
line 809
;809:	levelMenuInfo.item_back.generic.callback		= UI_SPLevelMenu_BackEvent;
ADDRGP4 levelMenuInfo+1504+48
ADDRGP4 UI_SPLevelMenu_BackEvent
ASGNP4
line 810
;810:	levelMenuInfo.item_back.generic.id				= ID_BACK;
ADDRGP4 levelMenuInfo+1504+8
CNSTI4 23
ASGNI4
line 811
;811:	levelMenuInfo.item_back.width					= 128;
ADDRGP4 levelMenuInfo+1504+76
CNSTI4 128
ASGNI4
line 812
;812:	levelMenuInfo.item_back.height					= 64;
ADDRGP4 levelMenuInfo+1504+80
CNSTI4 64
ASGNI4
line 813
;813:	levelMenuInfo.item_back.focuspic				= ART_BACK1;
ADDRGP4 levelMenuInfo+1504+60
ADDRGP4 $396
ASGNP4
line 815
;814:
;815:	levelMenuInfo.item_reset.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1592
CNSTI4 6
ASGNI4
line 816
;816:	levelMenuInfo.item_reset.generic.name			= ART_RESET0;
ADDRGP4 levelMenuInfo+1592+4
ADDRGP4 $399
ASGNP4
line 817
;817:	levelMenuInfo.item_reset.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1592+44
CNSTU4 260
ASGNU4
line 818
;818:	levelMenuInfo.item_reset.generic.x				= 170;
ADDRGP4 levelMenuInfo+1592+12
CNSTI4 170
ASGNI4
line 819
;819:	levelMenuInfo.item_reset.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+1592+16
CNSTI4 416
ASGNI4
line 820
;820:	levelMenuInfo.item_reset.generic.callback		= UI_SPLevelMenu_ResetEvent;
ADDRGP4 levelMenuInfo+1592+48
ADDRGP4 UI_SPLevelMenu_ResetEvent
ASGNP4
line 821
;821:	levelMenuInfo.item_reset.generic.id				= ID_RESET;
ADDRGP4 levelMenuInfo+1592+8
CNSTI4 24
ASGNI4
line 822
;822:	levelMenuInfo.item_reset.width					= 128;
ADDRGP4 levelMenuInfo+1592+76
CNSTI4 128
ASGNI4
line 823
;823:	levelMenuInfo.item_reset.height					= 64;
ADDRGP4 levelMenuInfo+1592+80
CNSTI4 64
ASGNI4
line 824
;824:	levelMenuInfo.item_reset.focuspic				= ART_RESET1;
ADDRGP4 levelMenuInfo+1592+60
ADDRGP4 $400
ASGNP4
line 826
;825:
;826:	levelMenuInfo.item_custom.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1680
CNSTI4 6
ASGNI4
line 827
;827:	levelMenuInfo.item_custom.generic.name			= ART_CUSTOM0;
ADDRGP4 levelMenuInfo+1680+4
ADDRGP4 $401
ASGNP4
line 828
;828:	levelMenuInfo.item_custom.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1680+44
CNSTU4 260
ASGNU4
line 829
;829:	levelMenuInfo.item_custom.generic.x				= 342;
ADDRGP4 levelMenuInfo+1680+12
CNSTI4 342
ASGNI4
line 830
;830:	levelMenuInfo.item_custom.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+1680+16
CNSTI4 416
ASGNI4
line 831
;831:	levelMenuInfo.item_custom.generic.callback		= UI_SPLevelMenu_CustomEvent;
ADDRGP4 levelMenuInfo+1680+48
ADDRGP4 UI_SPLevelMenu_CustomEvent
ASGNP4
line 832
;832:	levelMenuInfo.item_custom.generic.id			= ID_CUSTOM;
ADDRGP4 levelMenuInfo+1680+8
CNSTI4 25
ASGNI4
line 833
;833:	levelMenuInfo.item_custom.width					= 128;
ADDRGP4 levelMenuInfo+1680+76
CNSTI4 128
ASGNI4
line 834
;834:	levelMenuInfo.item_custom.height				= 64;
ADDRGP4 levelMenuInfo+1680+80
CNSTI4 64
ASGNI4
line 835
;835:	levelMenuInfo.item_custom.focuspic				= ART_CUSTOM1;
ADDRGP4 levelMenuInfo+1680+60
ADDRGP4 $402
ASGNP4
line 837
;836:
;837:	levelMenuInfo.item_next.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1768
CNSTI4 6
ASGNI4
line 838
;838:	levelMenuInfo.item_next.generic.name			= ART_FIGHT0;
ADDRGP4 levelMenuInfo+1768+4
ADDRGP4 $397
ASGNP4
line 839
;839:	levelMenuInfo.item_next.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1768+44
CNSTU4 272
ASGNU4
line 840
;840:	levelMenuInfo.item_next.generic.x				= 640;
ADDRGP4 levelMenuInfo+1768+12
CNSTI4 640
ASGNI4
line 841
;841:	levelMenuInfo.item_next.generic.y				= 480-64;
ADDRGP4 levelMenuInfo+1768+16
CNSTI4 416
ASGNI4
line 842
;842:	levelMenuInfo.item_next.generic.callback		= UI_SPLevelMenu_NextEvent;
ADDRGP4 levelMenuInfo+1768+48
ADDRGP4 UI_SPLevelMenu_NextEvent
ASGNP4
line 843
;843:	levelMenuInfo.item_next.generic.id				= ID_NEXT;
ADDRGP4 levelMenuInfo+1768+8
CNSTI4 26
ASGNI4
line 844
;844:	levelMenuInfo.item_next.width					= 128;
ADDRGP4 levelMenuInfo+1768+76
CNSTI4 128
ASGNI4
line 845
;845:	levelMenuInfo.item_next.height					= 64;
ADDRGP4 levelMenuInfo+1768+80
CNSTI4 64
ASGNI4
line 846
;846:	levelMenuInfo.item_next.focuspic				= ART_FIGHT1;
ADDRGP4 levelMenuInfo+1768+60
ADDRGP4 $398
ASGNP4
line 848
;847:
;848:	levelMenuInfo.item_null.generic.type			= MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1856
CNSTI4 6
ASGNI4
line 849
;849:	levelMenuInfo.item_null.generic.flags			= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 levelMenuInfo+1856+44
CNSTU4 1050628
ASGNU4
line 850
;850:	levelMenuInfo.item_null.generic.x				= 0;
ADDRGP4 levelMenuInfo+1856+12
CNSTI4 0
ASGNI4
line 851
;851:	levelMenuInfo.item_null.generic.y				= 0;
ADDRGP4 levelMenuInfo+1856+16
CNSTI4 0
ASGNI4
line 852
;852:	levelMenuInfo.item_null.width					= 640;
ADDRGP4 levelMenuInfo+1856+76
CNSTI4 640
ASGNI4
line 853
;853:	levelMenuInfo.item_null.height					= 480;
ADDRGP4 levelMenuInfo+1856+80
CNSTI4 480
ASGNI4
line 855
;854:
;855:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_banner );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 857
;856:
;857:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_leftarrow );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 858
;858:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[0] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 859
;859:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[1] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+448+88
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 860
;860:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[2] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+448+176
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 861
;861:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_maps[3] );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+448+264
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 862
;862:	levelMenuInfo.item_maps[0].generic.bottom += 18;
ADDRLP4 96
ADDRGP4 levelMenuInfo+448+32
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 863
;863:	levelMenuInfo.item_maps[1].generic.bottom += 18;
ADDRLP4 100
ADDRGP4 levelMenuInfo+448+88+32
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 864
;864:	levelMenuInfo.item_maps[2].generic.bottom += 18;
ADDRLP4 104
ADDRGP4 levelMenuInfo+448+176+32
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 865
;865:	levelMenuInfo.item_maps[3].generic.bottom += 18;
ADDRLP4 108
ADDRGP4 levelMenuInfo+448+264+32
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 866
;866:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_rightarrow );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+800
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 868
;867:
;868:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_player );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+888
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 870
;869:
;870:	for( n = 0; n < count; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $750
JUMPV
LABELV $747
line 871
;871:		Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_awards[n] );
ADDRGP4 levelMenuInfo
ARGP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 levelMenuInfo+976
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 872
;872:	}
LABELV $748
line 870
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $750
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $747
line 873
;873:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_back );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 874
;874:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_reset );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 875
;875:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_custom );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 876
;876:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_next );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1768
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 877
;877:	Menu_AddItem( &levelMenuInfo.menu, &levelMenuInfo.item_null );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1856
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 879
;878:
;879:	trap_Cvar_VariableStringBuffer( "ui_spSelection", buf, sizeof(buf) );
ADDRGP4 $153
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 880
;880:	if( *buf ) {
ADDRLP4 20
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $757
line 881
;881:		n = atoi( buf );
ADDRLP4 20
ARGP4
ADDRLP4 112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 112
INDIRI4
ASGNI4
line 882
;882:		selectedArenaSet = n / ARENAS_PER_TIER;
ADDRGP4 selectedArenaSet
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 883
;883:		selectedArena = n % ARENAS_PER_TIER;
ADDRGP4 selectedArena
ADDRLP4 0
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 884
;884:	}
ADDRGP4 $758
JUMPV
LABELV $757
line 885
;885:	else {
line 886
;886:		selectedArenaSet = currentSet;
ADDRGP4 selectedArenaSet
ADDRGP4 currentSet
INDIRI4
ASGNI4
line 887
;887:		selectedArena = currentGame;
ADDRGP4 selectedArena
ADDRGP4 currentGame
INDIRI4
ASGNI4
line 888
;888:	}
LABELV $758
line 890
;889:
;890:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 891
;891:}
LABELV $419
endproc UI_SPLevelMenu_Init 116 12
export UI_SPLevelMenu
proc UI_SPLevelMenu 32 8
line 899
;892:
;893:
;894:/*
;895:=================
;896:UI_SPLevelMenu
;897:=================
;898:*/
;899:void UI_SPLevelMenu( void ) {
line 904
;900:	int			level;
;901:	int			trainingLevel;
;902:	const char	*arenaInfo;
;903:
;904:	trainingTier = -1;
ADDRGP4 trainingTier
CNSTI4 -1
ASGNI4
line 905
;905:	arenaInfo = UI_GetSpecialArenaInfo( "training" );
ADDRGP4 $156
ARGP4
ADDRLP4 12
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 906
;906:	if( arenaInfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $760
line 907
;907:		minTier = trainingTier;
ADDRGP4 minTier
ADDRGP4 trainingTier
INDIRI4
ASGNI4
line 908
;908:		trainingLevel = atoi( Info_ValueForKey( arenaInfo, "num" ) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $157
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 909
;909:	}
ADDRGP4 $761
JUMPV
LABELV $760
line 910
;910:	else {
line 911
;911:		minTier = 0;
ADDRGP4 minTier
CNSTI4 0
ASGNI4
line 912
;912:		trainingLevel = -2;
ADDRLP4 8
CNSTI4 -2
ASGNI4
line 913
;913:	}
LABELV $761
line 915
;914:
;915:	finalTier = UI_GetNumSPTiers();
ADDRLP4 16
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRGP4 finalTier
ADDRLP4 16
INDIRI4
ASGNI4
line 916
;916:	arenaInfo = UI_GetSpecialArenaInfo( "final" );
ADDRGP4 $191
ARGP4
ADDRLP4 20
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 917
;917:	if( arenaInfo ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $762
line 918
;918:		maxTier = finalTier;
ADDRGP4 maxTier
ADDRGP4 finalTier
INDIRI4
ASGNI4
line 919
;919:	}
ADDRGP4 $763
JUMPV
LABELV $762
line 920
;920:	else {
line 921
;921:		maxTier = finalTier - 1;
ADDRGP4 maxTier
ADDRGP4 finalTier
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 922
;922:		if( maxTier < minTier ) {
ADDRGP4 maxTier
INDIRI4
ADDRGP4 minTier
INDIRI4
GEI4 $764
line 923
;923:			maxTier = minTier;
ADDRGP4 maxTier
ADDRGP4 minTier
INDIRI4
ASGNI4
line 924
;924:		}
LABELV $764
line 925
;925:	}
LABELV $763
line 927
;926:
;927:	level = UI_GetCurrentGame();
ADDRLP4 24
ADDRGP4 UI_GetCurrentGame
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 928
;928:	if ( level == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $766
line 929
;929:		level = UI_GetNumSPArenas() - 1;
ADDRLP4 28
ADDRGP4 UI_GetNumSPArenas
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 930
;930:		if( maxTier == finalTier ) {
ADDRGP4 maxTier
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $768
line 931
;931:			level++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 932
;932:		}
LABELV $768
line 933
;933:	}
LABELV $766
line 935
;934:
;935:	if( level == trainingLevel ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $770
line 936
;936:		currentSet = -1;
ADDRGP4 currentSet
CNSTI4 -1
ASGNI4
line 937
;937:		currentGame = 0;
ADDRGP4 currentGame
CNSTI4 0
ASGNI4
line 938
;938:	}
ADDRGP4 $771
JUMPV
LABELV $770
line 939
;939:	else {
line 940
;940:		currentSet = level / ARENAS_PER_TIER;
ADDRGP4 currentSet
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 941
;941:		currentGame = level % ARENAS_PER_TIER;
ADDRGP4 currentGame
ADDRLP4 0
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 942
;942:	}
LABELV $771
line 944
;943:
;944:	UI_SPLevelMenu_Init();
ADDRGP4 UI_SPLevelMenu_Init
CALLV
pop
line 945
;945:	UI_PushMenu( &levelMenuInfo.menu );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 946
;946:	Menu_SetCursorToItem( &levelMenuInfo.menu, &levelMenuInfo.item_next );
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1768
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 947
;947:}
LABELV $759
endproc UI_SPLevelMenu 32 8
export UI_SPLevelMenu_f
proc UI_SPLevelMenu_f 0 4
line 955
;948:
;949:
;950:/*
;951:=================
;952:UI_SPLevelMenu_f
;953:=================
;954:*/
;955:void UI_SPLevelMenu_f( void ) {
line 956
;956:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 957
;957:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 958
;958:	UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 959
;959:}
LABELV $773
endproc UI_SPLevelMenu_f 0 4
export UI_SPLevelMenu_ReInit
proc UI_SPLevelMenu_ReInit 0 0
line 967
;960:
;961:
;962:/*
;963:=================
;964:UI_SPLevelMenu_ReInit
;965:=================
;966:*/
;967:void UI_SPLevelMenu_ReInit( void ) {
line 968
;968:	levelMenuInfo.reinit = qtrue;
ADDRGP4 levelMenuInfo+1944
CNSTI4 1
ASGNI4
line 969
;969:}
LABELV $775
endproc UI_SPLevelMenu_ReInit 0 0
bss
align 4
LABELV maxTier
skip 4
align 4
LABELV minTier
skip 4
align 4
LABELV finalTier
skip 4
align 4
LABELV trainingTier
skip 4
align 4
LABELV currentGame
skip 4
align 4
LABELV currentSet
skip 4
align 4
LABELV selectedArena
skip 4
align 4
LABELV selectedArenaSet
skip 4
align 4
LABELV levelMenuInfo
skip 2616
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PoemsMenu
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_BotCommandMenu_f
import UI_DynamicMenu
import UI_DynamicMenuCache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
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
LABELV $435
byte 1 67
byte 1 72
byte 1 79
byte 1 79
byte 1 83
byte 1 69
byte 1 32
byte 1 76
byte 1 69
byte 1 86
byte 1 69
byte 1 76
byte 1 0
align 1
LABELV $424
byte 1 50
byte 1 0
align 1
LABELV $420
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
LABELV $402
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $401
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $400
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $399
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $398
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $397
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $396
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $395
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $394
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 53
byte 1 0
align 1
LABELV $393
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 52
byte 1 0
align 1
LABELV $392
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $391
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $390
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $389
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $388
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $387
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $386
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $384
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $382
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $346
byte 1 65
byte 1 67
byte 1 67
byte 1 69
byte 1 83
byte 1 83
byte 1 32
byte 1 68
byte 1 69
byte 1 78
byte 1 73
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $334
byte 1 84
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $333
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $332
byte 1 37
byte 1 105
byte 1 107
byte 1 0
align 1
LABELV $329
byte 1 37
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $259
byte 1 82
byte 1 69
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 63
byte 1 0
align 1
LABELV $252
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 0
align 1
LABELV $251
byte 1 68
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $250
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $249
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $191
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $157
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $156
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $153
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $132
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $127
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $106
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $103
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $82
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $75
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $72
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $71
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
