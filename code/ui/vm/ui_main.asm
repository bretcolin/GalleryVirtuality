data
align 4
LABELV MonthAbbrev
address $87
address $88
address $89
address $90
address $91
address $92
address $93
address $94
address $95
address $96
address $97
address $98
align 4
LABELV skillLevels
address $99
address $100
address $101
address $102
address $103
lit
align 4
LABELV numSkillLevels
byte 4 5
data
align 4
LABELV netSources
address $104
address $105
address $106
address $107
lit
align 4
LABELV numNetSources
byte 4 4
align 4
LABELV serverFilters
address $108
address $109
address $110
address $109
address $111
address $112
address $113
address $114
address $115
address $116
address $117
address $118
address $119
address $120
data
align 4
LABELV teamArenaGameTypes
address $121
address $122
address $123
address $124
address $125
address $126
address $127
address $128
address $129
lit
align 4
LABELV numTeamArenaGameTypes
byte 4 9
data
align 4
LABELV teamArenaGameNames
address $130
address $131
address $132
address $133
address $134
address $135
address $136
address $137
address $138
lit
align 4
LABELV numTeamArenaGameNames
byte 4 9
align 4
LABELV numServerFilters
byte 4 7
data
align 4
LABELV sortKeys
address $139
address $140
address $141
address $142
address $143
lit
align 4
LABELV numSortKeys
byte 4 5
data
align 4
LABELV netnames
address $144
address $145
address $146
byte 4 0
align 4
LABELV gamecodetoui
byte 4 4
byte 4 2
byte 4 3
byte 4 0
byte 4 5
byte 4 1
byte 4 6
align 4
LABELV uitogamecode
byte 4 4
byte 4 6
byte 4 2
byte 4 3
byte 4 1
byte 4 5
byte 4 7
export vmMain
code
proc vmMain 12 8
file "../ui_main.c"
line 148
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:USER INTERFACE MAIN
;7:
;8:=======================================================================
;9:*/
;10:
;11:// use this to get a demo build without an explicit demo build, i.e. to get the demo ui files to build
;12://#define PRE_RELEASE_TADEMO
;13:
;14:#include "ui_local.h"
;15:
;16:uiInfo_t uiInfo;
;17:
;18:static const char *MonthAbbrev[] = {
;19:	"Jan","Feb","Mar",
;20:	"Apr","May","Jun",
;21:	"Jul","Aug","Sep",
;22:	"Oct","Nov","Dec"
;23:};
;24:
;25:
;26:static const char *skillLevels[] = {
;27:  "I Can Win",
;28:  "Bring It On",
;29:  "Hurt Me Plenty",
;30:  "Hardcore",
;31:  "Nightmare"
;32:};
;33:
;34:static const int numSkillLevels = sizeof(skillLevels) / sizeof(const char*);
;35:
;36:
;37:static const char *netSources[] = {
;38:	"Local",
;39:	"Mplayer",
;40:	"Internet",
;41:	"Favorites"
;42:};
;43:static const int numNetSources = sizeof(netSources) / sizeof(const char*);
;44:
;45:static const serverFilter_t serverFilters[] = {
;46:	{"All", "" },
;47:	{"Quake 3 Arena", "" },
;48:	{"Team Arena", "missionpack" },
;49:	{"Rocket Arena", "arena" },
;50:	{"Alliance", "alliance20" },
;51:	{"Weapons Factory Arena", "wfa" },
;52:	{"OSP", "osp" },
;53:};
;54:
;55:static const char *teamArenaGameTypes[] = {
;56:	"FFA",
;57:	"TOURNAMENT",
;58:	"SP",
;59:	"TEAM DM",
;60:	"CTF",
;61:	"1FCTF",
;62:	"OVERLOAD",
;63:	"HARVESTER",
;64:	"TEAMTOURNAMENT"
;65:};
;66:
;67:static int const numTeamArenaGameTypes = sizeof(teamArenaGameTypes) / sizeof(const char*);
;68:
;69:
;70:static const char *teamArenaGameNames[] = {
;71:	"Free For All",
;72:	"Tournament",
;73:	"Single Player",
;74:	"Team Deathmatch",
;75:	"Capture the Flag",
;76:	"One Flag CTF",
;77:	"Overload",
;78:	"Harvester",
;79:	"Team Tournament",
;80:};
;81:
;82:static int const numTeamArenaGameNames = sizeof(teamArenaGameNames) / sizeof(const char*);
;83:
;84:
;85:static const int numServerFilters = sizeof(serverFilters) / sizeof(serverFilter_t);
;86:
;87:static const char *sortKeys[] = {
;88:	"Server Name",
;89:	"Map Name",
;90:	"Open Player Spots",
;91:	"Game Type",
;92:	"Ping Time"
;93:};
;94:static const int numSortKeys = sizeof(sortKeys) / sizeof(const char*);
;95:
;96:static char* netnames[] = {
;97:	"???",
;98:	"UDP",
;99:	"IPX",
;100:	NULL
;101:};
;102:/*
;103:#ifndef MISSIONPACK // bk001206
;104:static char quake3worldMessage[] = "Visit www.quake3world.com - News, Community, Events, Files";
;105:#endif
;106:*/
;107:static int gamecodetoui[] = {4,2,3,0,5,1,6};
;108:static int uitogamecode[] = {4,6,2,3,1,5,7};
;109:
;110:
;111:static void UI_StartServerRefresh(qboolean full);
;112:static void UI_StopServerRefresh( void );
;113:static void UI_DoServerRefresh( void );
;114:static void UI_FeederSelection(float feederID, int index);
;115:static void UI_BuildServerDisplayList(qboolean force);
;116:static void UI_BuildServerStatus(qboolean force);
;117:static void UI_BuildFindPlayerList(qboolean force);
;118:static int QDECL UI_ServersQsortCompare( const void *arg1, const void *arg2 );
;119:static int UI_MapCountByGameType(qboolean singlePlayer);
;120:static int UI_HeadCountByTeam( void );
;121:static void UI_ParseGameInfo(const char *teamFile);
;122:static void UI_ParseTeamInfo(const char *teamFile);
;123:static const char *UI_SelectedMap(int index, int *actual);
;124:static const char *UI_SelectedHead(int index, int *actual);
;125:static int UI_GetIndexFromSelection(int actual);
;126:
;127:int ProcessNewUI( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6 );
;128:
;129:/*
;130:================
;131:vmMain
;132:
;133:This is the only way control passes into the module.
;134:This must be the very first function compiled into the .qvm file
;135:================
;136:*/
;137:vmCvar_t  ui_new;
;138:vmCvar_t  ui_debug;
;139:vmCvar_t  ui_initialized;
;140:vmCvar_t  ui_teamArenaFirstRun;
;141:
;142:void _UI_Init( qboolean );
;143:void _UI_Shutdown( void );
;144:void _UI_KeyEvent( int key, qboolean down );
;145:void _UI_MouseEvent( int dx, int dy );
;146:void _UI_Refresh( int realtime );
;147:qboolean _UI_IsFullscreen( void );
;148:int vmMain( int command, int arg0, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7, int arg8, int arg9, int arg10, int arg11  ) {
line 149
;149:  switch ( command ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $148
ADDRLP4 0
INDIRI4
CNSTI4 10
GTI4 $148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $161
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $161
address $150
address $151
address $152
address $153
address $154
address $155
address $156
address $157
address $158
address $159
address $160
code
LABELV $150
line 151
;150:	  case UI_GETAPIVERSION:
;151:		  return UI_API_VERSION;
CNSTI4 6
RETI4
ADDRGP4 $147
JUMPV
LABELV $151
line 154
;152:
;153:	  case UI_INIT:
;154:		  _UI_Init(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_Init
CALLV
pop
line 155
;155:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $152
line 158
;156:
;157:	  case UI_SHUTDOWN:
;158:		  _UI_Shutdown();
ADDRGP4 _UI_Shutdown
CALLV
pop
line 159
;159:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $153
line 162
;160:
;161:	  case UI_KEY_EVENT:
;162:		  _UI_KeyEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 _UI_KeyEvent
CALLV
pop
line 163
;163:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $154
line 166
;164:
;165:	  case UI_MOUSE_EVENT:
;166:		  _UI_MouseEvent( arg0, arg1 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 _UI_MouseEvent
CALLV
pop
line 167
;167:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $155
line 170
;168:
;169:	  case UI_REFRESH:
;170:		  _UI_Refresh( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_Refresh
CALLV
pop
line 171
;171:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $156
line 174
;172:
;173:	  case UI_IS_FULLSCREEN:
;174:		  return _UI_IsFullscreen();
ADDRLP4 4
ADDRGP4 _UI_IsFullscreen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $147
JUMPV
LABELV $157
line 177
;175:
;176:	  case UI_SET_ACTIVE_MENU:
;177:		  _UI_SetActiveMenu( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 _UI_SetActiveMenu
CALLV
pop
line 178
;178:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $158
line 181
;179:
;180:	  case UI_CONSOLE_COMMAND:
;181:		  return UI_ConsoleCommand(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $147
JUMPV
LABELV $159
line 184
;182:
;183:	  case UI_DRAW_CONNECT_SCREEN:
;184:		  UI_DrawConnectScreen( arg0 );
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawConnectScreen
CALLV
pop
line 185
;185:		  return 0;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $160
line 187
;186:	  case UI_HASUNIQUECDKEY: // mod authors need to observe this
;187:	    return qtrue; // bk010117 - change this to qfalse for mods!
CNSTI4 1
RETI4
ADDRGP4 $147
JUMPV
LABELV $148
line 191
;188:
;189:	}
;190:
;191:	return -1;
CNSTI4 -1
RETI4
LABELV $147
endproc vmMain 12 8
export AssetCache
proc AssetCache 84 8
line 196
;192:}
;193:
;194:
;195:
;196:void AssetCache() {
line 202
;197:	int n;
;198:	//if (Assets.textFont == NULL) {
;199:	//}
;200:	//Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;201:	//Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;202:	uiInfo.uiDC.Assets.gradientBar = trap_R_RegisterShaderNoMip( ASSET_GRADIENTBAR );
ADDRGP4 $165
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61660
ADDRLP4 4
INDIRI4
ASGNI4
line 203
;203:	uiInfo.uiDC.Assets.fxBasePic = trap_R_RegisterShaderNoMip( ART_FX_BASE );
ADDRGP4 $168
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61768
ADDRLP4 8
INDIRI4
ASGNI4
line 204
;204:	uiInfo.uiDC.Assets.fxPic[0] = trap_R_RegisterShaderNoMip( ART_FX_RED );
ADDRGP4 $171
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772
ADDRLP4 12
INDIRI4
ASGNI4
line 205
;205:	uiInfo.uiDC.Assets.fxPic[1] = trap_R_RegisterShaderNoMip( ART_FX_YELLOW );
ADDRGP4 $175
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772+4
ADDRLP4 16
INDIRI4
ASGNI4
line 206
;206:	uiInfo.uiDC.Assets.fxPic[2] = trap_R_RegisterShaderNoMip( ART_FX_GREEN );
ADDRGP4 $179
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772+8
ADDRLP4 20
INDIRI4
ASGNI4
line 207
;207:	uiInfo.uiDC.Assets.fxPic[3] = trap_R_RegisterShaderNoMip( ART_FX_TEAL );
ADDRGP4 $183
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772+12
ADDRLP4 24
INDIRI4
ASGNI4
line 208
;208:	uiInfo.uiDC.Assets.fxPic[4] = trap_R_RegisterShaderNoMip( ART_FX_BLUE );
ADDRGP4 $187
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772+16
ADDRLP4 28
INDIRI4
ASGNI4
line 209
;209:	uiInfo.uiDC.Assets.fxPic[5] = trap_R_RegisterShaderNoMip( ART_FX_CYAN );
ADDRGP4 $191
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772+20
ADDRLP4 32
INDIRI4
ASGNI4
line 210
;210:	uiInfo.uiDC.Assets.fxPic[6] = trap_R_RegisterShaderNoMip( ART_FX_WHITE );
ADDRGP4 $195
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61772+24
ADDRLP4 36
INDIRI4
ASGNI4
line 211
;211:	uiInfo.uiDC.Assets.scrollBar = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR );
ADDRGP4 $198
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61680
ADDRLP4 40
INDIRI4
ASGNI4
line 212
;212:	uiInfo.uiDC.Assets.scrollBarArrowDown = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWDOWN );
ADDRGP4 $201
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61668
ADDRLP4 44
INDIRI4
ASGNI4
line 213
;213:	uiInfo.uiDC.Assets.scrollBarArrowUp = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWUP );
ADDRGP4 $204
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61664
ADDRLP4 48
INDIRI4
ASGNI4
line 214
;214:	uiInfo.uiDC.Assets.scrollBarArrowLeft = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWLEFT );
ADDRGP4 $207
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61672
ADDRLP4 52
INDIRI4
ASGNI4
line 215
;215:	uiInfo.uiDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip( ASSET_SCROLLBAR_ARROWRIGHT );
ADDRGP4 $210
ARGP4
ADDRLP4 56
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61676
ADDRLP4 56
INDIRI4
ASGNI4
line 216
;216:	uiInfo.uiDC.Assets.scrollBarThumb = trap_R_RegisterShaderNoMip( ASSET_SCROLL_THUMB );
ADDRGP4 $213
ARGP4
ADDRLP4 60
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61684
ADDRLP4 60
INDIRI4
ASGNI4
line 217
;217:	uiInfo.uiDC.Assets.sliderBar = trap_R_RegisterShaderNoMip( ASSET_SLIDER_BAR );
ADDRGP4 $216
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61700
ADDRLP4 64
INDIRI4
ASGNI4
line 218
;218:	uiInfo.uiDC.Assets.sliderThumb = trap_R_RegisterShaderNoMip( ASSET_SLIDER_THUMB );
ADDRGP4 $219
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61704
ADDRLP4 68
INDIRI4
ASGNI4
line 220
;219:
;220:	for( n = 0; n < NUM_CROSSHAIRS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $220
line 221
;221:		uiInfo.uiDC.Assets.crosshairShader[n] = trap_R_RegisterShaderNoMip( va("gfx/2d/crosshair%c", 'a' + n ) );
ADDRGP4 $226
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+228+61800
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 222
;222:	}
LABELV $221
line 220
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $220
line 224
;223:
;224:	uiInfo.newHighScoreSound = trap_S_RegisterSound("sound/feedback/voc_newhighscore.wav", qfalse);
ADDRGP4 $228
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+119484
ADDRLP4 72
INDIRI4
ASGNI4
line 225
;225:}
LABELV $162
endproc AssetCache 84 8
export _UI_DrawSides
proc _UI_DrawSides 12 36
line 227
;226:
;227:void _UI_DrawSides(float x, float y, float w, float h, float size) {
line 228
;228:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 229
;229:	size *= uiInfo.uiDC.xscale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 uiInfo+200
INDIRF4
MULF4
ASGNF4
line 230
;230:	trap_R_DrawStretchPic( x, y, size, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+73400
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 231
;231:	trap_R_DrawStretchPic( x + w - size, y, size, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uiInfo+73400
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 232
;232:}
LABELV $229
endproc _UI_DrawSides 12 36
export _UI_DrawTopBottom
proc _UI_DrawTopBottom 12 36
line 234
;233:
;234:void _UI_DrawTopBottom(float x, float y, float w, float h, float size) {
line 235
;235:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 236
;236:	size *= uiInfo.uiDC.yscale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 uiInfo+196
INDIRF4
MULF4
ASGNF4
line 237
;237:	trap_R_DrawStretchPic( x, y, w, size, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+73400
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 238
;238:	trap_R_DrawStretchPic( x, y + h - size, w, size, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uiInfo+73400
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 239
;239:}
LABELV $233
endproc _UI_DrawTopBottom 12 36
export _UI_DrawRect
proc _UI_DrawRect 0 20
line 247
;240:/*
;241:================
;242:UI_DrawRect
;243:
;244:Coordinates are 640*480 virtual values
;245:=================
;246:*/
;247:void _UI_DrawRect( float x, float y, float width, float height, float size, const float *color ) {
line 248
;248:	trap_R_SetColor( color );
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 250
;249:
;250:  _UI_DrawTopBottom(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 _UI_DrawTopBottom
CALLV
pop
line 251
;251:  _UI_DrawSides(x, y, width, height, size);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 _UI_DrawSides
CALLV
pop
line 253
;252:
;253:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 254
;254:}
LABELV $237
endproc _UI_DrawRect 0 20
export Text_Width
proc Text_Width 48 4
line 256
;255:
;256:int Text_Width(const char *text, float scale, int limit) {
line 261
;257:  int count,len;
;258:	float out;
;259:	glyphInfo_t *glyph;
;260:	float useScale;
;261:	const char *s = text;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 262
;262:	fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 12
ADDRGP4 uiInfo+228+12
ASGNP4
line 263
;263:	if (scale <= ui_smallFont.value) {
ADDRFP4 4
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $241
line 264
;264:		font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 12
ADDRGP4 uiInfo+228+20560
ASGNP4
line 265
;265:	} else if (scale >= ui_bigFont.value) {
ADDRGP4 $242
JUMPV
LABELV $241
ADDRFP4 4
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $246
line 266
;266:		font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 12
ADDRGP4 uiInfo+228+41108
ASGNP4
line 267
;267:	}
LABELV $246
LABELV $242
line 268
;268:	useScale = scale * font->glyphScale;
ADDRLP4 24
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 269
;269:  out = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 270
;270:  if (text) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $251
line 271
;271:    len = strlen(text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 272
;272:		if (limit > 0 && len > limit) {
ADDRLP4 32
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $253
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $253
line 273
;273:			len = limit;
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
line 274
;274:		}
LABELV $253
line 275
;275:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $256
JUMPV
LABELV $255
line 276
;276:		while (s && *s && count < len) {
line 277
;277:			if ( Q_IsColorString(s) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $258
ADDRLP4 40
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
NEI4 $258
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $258
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $258
line 278
;278:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 279
;279:				continue;
ADDRGP4 $256
JUMPV
LABELV $258
line 280
;280:			} else {
line 281
;281:				glyph = &font->glyphs[(int)*s];
ADDRLP4 16
CNSTI4 80
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 12
INDIRP4
ADDP4
ASGNP4
line 282
;282:				out += glyph->xSkip;
ADDRLP4 20
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 283
;283:				s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 284
;284:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 285
;285:			}
line 286
;286:    }
LABELV $256
line 276
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $261
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $261
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $255
LABELV $261
line 287
;287:  }
LABELV $251
line 288
;288:  return out * useScale;
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CVFI4 4
RETI4
LABELV $238
endproc Text_Width 48 4
export Text_Height
proc Text_Height 48 4
line 291
;289:}
;290:
;291:int Text_Height(const char *text, float scale, int limit) {
line 296
;292:  int len, count;
;293:	float max;
;294:	glyphInfo_t *glyph;
;295:	float useScale;
;296:	const char *s = text; // bk001206 - unsigned
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 297
;297:	fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 20
ADDRGP4 uiInfo+228+12
ASGNP4
line 298
;298:	if (scale <= ui_smallFont.value) {
ADDRFP4 4
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $265
line 299
;299:		font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 20
ADDRGP4 uiInfo+228+20560
ASGNP4
line 300
;300:	} else if (scale >= ui_bigFont.value) {
ADDRGP4 $266
JUMPV
LABELV $265
ADDRFP4 4
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $270
line 301
;301:		font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 20
ADDRGP4 uiInfo+228+41108
ASGNP4
line 302
;302:	}
LABELV $270
LABELV $266
line 303
;303:	useScale = scale * font->glyphScale;
ADDRLP4 24
ADDRFP4 4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 304
;304:  max = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 305
;305:  if (text) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $275
line 306
;306:    len = strlen(text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 307
;307:		if (limit > 0 && len > limit) {
ADDRLP4 32
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $277
ADDRLP4 8
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $277
line 308
;308:			len = limit;
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
line 309
;309:		}
LABELV $277
line 310
;310:		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $280
JUMPV
LABELV $279
line 311
;311:		while (s && *s && count < len) {
line 312
;312:			if ( Q_IsColorString(s) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $282
ADDRLP4 40
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
NEI4 $282
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $282
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $282
line 313
;313:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 314
;314:				continue;
ADDRGP4 $280
JUMPV
LABELV $282
line 315
;315:			} else {
line 316
;316:				glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
ADDRLP4 12
CNSTI4 80
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 20
INDIRP4
ADDP4
ASGNP4
line 317
;317:	      if (max < glyph->height) {
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
GEF4 $284
line 318
;318:		      max = glyph->height;
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ASGNF4
line 319
;319:			  }
LABELV $284
line 320
;320:				s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 321
;321:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 322
;322:			}
line 323
;323:    }
LABELV $280
line 311
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $287
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $287
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $279
LABELV $287
line 324
;324:  }
LABELV $275
line 325
;325:  return max * useScale;
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CVFI4 4
RETI4
LABELV $262
endproc Text_Height 48 4
export Text_PaintChar
proc Text_PaintChar 8 36
line 328
;326:}
;327:
;328:void Text_PaintChar(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
line 330
;329:  float w, h;
;330:  w = width * scale;
ADDRLP4 0
ADDRFP4 8
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 331
;331:  h = height * scale;
ADDRLP4 4
ADDRFP4 12
INDIRF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 332
;332:  UI_AdjustFrom640( &x, &y, &w, &h );
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 333
;333:  trap_R_DrawStretchPic( x, y, w, h, s, t, s2, t2, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 20
INDIRF4
ARGF4
ADDRFP4 24
INDIRF4
ARGF4
ADDRFP4 28
INDIRF4
ARGF4
ADDRFP4 32
INDIRF4
ARGF4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 334
;334:}
LABELV $288
endproc Text_PaintChar 8 36
export Text_Paint
proc Text_Paint 84 40
line 336
;335:
;336:void Text_Paint(float x, float y, float scale, vec4_t color, const char *text, float adjust, int limit, int style) {
line 341
;337:  int len, count;
;338:	vec4_t newColor;
;339:	glyphInfo_t *glyph;
;340:	float useScale;
;341:	fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 28
ADDRGP4 uiInfo+228+12
ASGNP4
line 342
;342:	if (scale <= ui_smallFont.value) {
ADDRFP4 8
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $292
line 343
;343:		font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 28
ADDRGP4 uiInfo+228+20560
ASGNP4
line 344
;344:	} else if (scale >= ui_bigFont.value) {
ADDRGP4 $293
JUMPV
LABELV $292
ADDRFP4 8
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $297
line 345
;345:		font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 28
ADDRGP4 uiInfo+228+41108
ASGNP4
line 346
;346:	}
LABELV $297
LABELV $293
line 347
;347:	useScale = scale * font->glyphScale;
ADDRLP4 20
ADDRFP4 8
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 348
;348:  if (text) {
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $302
line 349
;349:    const char *s = text; // bk001206 - unsigned
ADDRLP4 36
ADDRFP4 16
INDIRP4
ASGNP4
line 350
;350:		trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 351
;351:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
ADDRLP4 4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 352
;352:    len = strlen(text);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
ASGNI4
line 353
;353:		if (limit > 0 && len > limit) {
ADDRLP4 44
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LEI4 $304
ADDRLP4 32
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $304
line 354
;354:			len = limit;
ADDRLP4 32
ADDRFP4 24
INDIRI4
ASGNI4
line 355
;355:		}
LABELV $304
line 356
;356:		count = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $307
JUMPV
LABELV $306
line 357
;357:		while (s && *s && count < len) {
line 358
;358:			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
ADDRLP4 0
CNSTI4 80
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ASGNP4
line 361
;359:      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;360:      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;361:			if ( Q_IsColorString( s ) ) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $309
ADDRLP4 52
CNSTI4 94
ASGNI4
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
NEI4 $309
ADDRLP4 56
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $309
ADDRLP4 56
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $309
line 362
;362:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
ADDRLP4 4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 363
;363:				newColor[3] = color[3];
ADDRLP4 4+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 364
;364:				trap_R_SetColor( newColor );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 365
;365:				s += 2;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 366
;366:				continue;
ADDRGP4 $307
JUMPV
LABELV $309
line 367
;367:			} else {
line 368
;368:				float yadj = useScale * glyph->top;
ADDRLP4 60
ADDRLP4 20
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 369
;369:				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE) {
ADDRLP4 64
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 3
EQI4 $314
ADDRLP4 64
INDIRI4
CNSTI4 6
NEI4 $312
LABELV $314
line 370
;370:					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $316
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $317
JUMPV
LABELV $316
ADDRLP4 72
CNSTI4 2
ASGNI4
LABELV $317
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
line 371
;371:					colorBlack[3] = newColor[3];
ADDRGP4 colorBlack+12
ADDRLP4 4+12
INDIRF4
ASGNF4
line 372
;372:					trap_R_SetColor( colorBlack );
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 373
;373:					Text_PaintChar(x + ofs, y - yadj + ofs, 
ADDRLP4 76
ADDRLP4 68
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ADDRLP4 76
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 382
;374:														glyph->imageWidth,
;375:														glyph->imageHeight,
;376:														useScale, 
;377:														glyph->s,
;378:														glyph->t,
;379:														glyph->s2,
;380:														glyph->t2,
;381:														glyph->glyph);
;382:					trap_R_SetColor( newColor );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 383
;383:					colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 384
;384:				}
LABELV $312
line 385
;385:				Text_PaintChar(x, y - yadj, 
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 395
;386:													glyph->imageWidth,
;387:													glyph->imageHeight,
;388:													useScale, 
;389:													glyph->s,
;390:													glyph->t,
;391:													glyph->s2,
;392:													glyph->t2,
;393:													glyph->glyph);
;394:
;395:				x += (glyph->xSkip * useScale) + adjust;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRF4
MULF4
ADDRFP4 20
INDIRF4
ADDF4
ADDF4
ASGNF4
line 396
;396:				s++;
ADDRLP4 36
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 397
;397:				count++;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 398
;398:			}
line 399
;399:    }
LABELV $307
line 357
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $322
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $322
ADDRLP4 24
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $306
LABELV $322
line 400
;400:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 401
;401:  }
LABELV $302
line 402
;402:}
LABELV $289
endproc Text_Paint 84 40
export Text_PaintWithCursor
proc Text_PaintWithCursor 88 40
ADDRFP4 24
ADDRFP4 24
INDIRI4
CVII1 4
ASGNI1
line 404
;403:
;404:void Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char *text, int cursorPos, char cursor, int limit, int style) {
line 410
;405:  int len, count;
;406:	vec4_t newColor;
;407:	glyphInfo_t *glyph, *glyph2;
;408:	float yadj;
;409:	float useScale;
;410:	fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+12
ASGNP4
line 411
;411:	if (scale <= ui_smallFont.value) {
ADDRFP4 8
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $326
line 412
;412:		font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+20560
ASGNP4
line 413
;413:	} else if (scale >= ui_bigFont.value) {
ADDRGP4 $327
JUMPV
LABELV $326
ADDRFP4 8
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LTF4 $331
line 414
;414:		font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+41108
ASGNP4
line 415
;415:	}
LABELV $331
LABELV $327
line 416
;416:	useScale = scale * font->glyphScale;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 417
;417:  if (text) {
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $336
line 418
;418:    const char *s = text; // bk001206 - unsigned
ADDRLP4 44
ADDRFP4 16
INDIRP4
ASGNP4
line 419
;419:		trap_R_SetColor( color );
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 420
;420:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
ADDRLP4 12
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 421
;421:    len = strlen(text);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 48
INDIRI4
ASGNI4
line 422
;422:		if (limit > 0 && len > limit) {
ADDRLP4 52
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
LEI4 $338
ADDRLP4 40
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $338
line 423
;423:			len = limit;
ADDRLP4 40
ADDRFP4 28
INDIRI4
ASGNI4
line 424
;424:		}
LABELV $338
line 425
;425:		count = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 426
;426:		glyph2 = &font->glyphs[ (int) cursor]; // bk001206 - possible signed char
ADDRLP4 8
CNSTI4 80
ADDRFP4 24
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
ADDRGP4 $341
JUMPV
LABELV $340
line 427
;427:		while (s && *s && count < len) {
line 428
;428:			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
ADDRLP4 0
CNSTI4 80
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
line 431
;429:      //int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;430:      //float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;431:			if ( Q_IsColorString( s ) ) {
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $343
ADDRLP4 60
CNSTI4 94
ASGNI4
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
NEI4 $343
ADDRLP4 64
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $343
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $343
line 432
;432:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
ADDRLP4 12
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 433
;433:				newColor[3] = color[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 434
;434:				trap_R_SetColor( newColor );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 435
;435:				s += 2;
ADDRLP4 44
ADDRLP4 44
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 436
;436:				continue;
ADDRGP4 $341
JUMPV
LABELV $343
line 437
;437:			} else {
line 438
;438:				yadj = useScale * glyph->top;
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 439
;439:				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE) {
ADDRLP4 68
ADDRFP4 32
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 3
EQI4 $348
ADDRLP4 68
INDIRI4
CNSTI4 6
NEI4 $346
LABELV $348
line 440
;440:					int ofs = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
ADDRFP4 32
INDIRI4
CNSTI4 3
NEI4 $350
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRGP4 $351
JUMPV
LABELV $350
ADDRLP4 76
CNSTI4 2
ASGNI4
LABELV $351
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 441
;441:					colorBlack[3] = newColor[3];
ADDRGP4 colorBlack+12
ADDRLP4 12+12
INDIRF4
ASGNF4
line 442
;442:					trap_R_SetColor( colorBlack );
ADDRGP4 colorBlack
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 443
;443:					Text_PaintChar(x + ofs, y - yadj + ofs, 
ADDRLP4 80
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRLP4 80
INDIRF4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ADDRLP4 80
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 452
;444:														glyph->imageWidth,
;445:														glyph->imageHeight,
;446:														useScale, 
;447:														glyph->s,
;448:														glyph->t,
;449:														glyph->s2,
;450:														glyph->t2,
;451:														glyph->glyph);
;452:					colorBlack[3] = 1.0;
ADDRGP4 colorBlack+12
CNSTF4 1065353216
ASGNF4
line 453
;453:					trap_R_SetColor( newColor );
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 454
;454:				}
LABELV $346
line 455
;455:				Text_PaintChar(x, y - yadj, 
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 465
;456:													glyph->imageWidth,
;457:													glyph->imageHeight,
;458:													useScale, 
;459:													glyph->s,
;460:													glyph->t,
;461:													glyph->s2,
;462:													glyph->t2,
;463:													glyph->glyph);
;464:
;465:	      yadj = useScale * glyph2->top;
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 466
;466:		    if (count == cursorPos && !((uiInfo.uiDC.realTime/BLINK_DIVISOR) & 1)) {
ADDRLP4 28
INDIRI4
ADDRFP4 20
INDIRI4
NEI4 $355
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $355
line 467
;467:					Text_PaintChar(x, y - yadj, 
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 476
;468:														glyph2->imageWidth,
;469:														glyph2->imageHeight,
;470:														useScale, 
;471:														glyph2->s,
;472:														glyph2->t,
;473:														glyph2->s2,
;474:														glyph2->t2,
;475:														glyph2->glyph);
;476:				}
LABELV $355
line 478
;477:
;478:				x += (glyph->xSkip * useScale);
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 479
;479:				s++;
ADDRLP4 44
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 480
;480:				count++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 481
;481:			}
line 482
;482:    }
LABELV $341
line 427
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $359
ADDRLP4 44
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $359
ADDRLP4 28
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $340
LABELV $359
line 484
;483:    // need to paint cursor at end of text
;484:    if (cursorPos == len && !((uiInfo.uiDC.realTime/BLINK_DIVISOR) & 1)) {
ADDRFP4 20
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $360
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $360
line 485
;485:        yadj = useScale * glyph2->top;
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 486
;486:        Text_PaintChar(x, y - yadj, 
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 496
;487:                          glyph2->imageWidth,
;488:                          glyph2->imageHeight,
;489:                          useScale, 
;490:                          glyph2->s,
;491:                          glyph2->t,
;492:                          glyph2->s2,
;493:                          glyph2->t2,
;494:                          glyph2->glyph);
;495:
;496:    }
LABELV $360
line 498
;497:
;498:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 499
;499:  }
LABELV $336
line 500
;500:}
LABELV $323
endproc Text_PaintWithCursor 88 40
proc Text_Paint_Limit 76 40
line 503
;501:
;502:
;503:static void Text_Paint_Limit(float *maxX, float x, float y, float scale, vec4_t color, const char* text, float adjust, int limit) {
line 507
;504:  int len, count;
;505:	vec4_t newColor;
;506:	glyphInfo_t *glyph;
;507:  if (text) {
ADDRFP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $364
line 508
;508:    const char *s = text; // bk001206 - unsigned
ADDRLP4 28
ADDRFP4 20
INDIRP4
ASGNP4
line 509
;509:		float max = *maxX;
ADDRLP4 40
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
line 511
;510:		float useScale;
;511:		fontInfo_t *font = &uiInfo.uiDC.Assets.textFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+12
ASGNP4
line 512
;512:		if (scale <= ui_smallFont.value) {
ADDRFP4 12
INDIRF4
ADDRGP4 ui_smallFont+8
INDIRF4
GTF4 $368
line 513
;513:			font = &uiInfo.uiDC.Assets.smallFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+20560
ASGNP4
line 514
;514:		} else if (scale > ui_bigFont.value) {
ADDRGP4 $369
JUMPV
LABELV $368
ADDRFP4 12
INDIRF4
ADDRGP4 ui_bigFont+8
INDIRF4
LEF4 $373
line 515
;515:			font = &uiInfo.uiDC.Assets.bigFont;
ADDRLP4 36
ADDRGP4 uiInfo+228+41108
ASGNP4
line 516
;516:		}
LABELV $373
LABELV $369
line 517
;517:		useScale = scale * font->glyphScale;
ADDRLP4 32
ADDRFP4 12
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 20480
ADDP4
INDIRF4
MULF4
ASGNF4
line 518
;518:		trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 519
;519:    len = strlen(text);					 
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 520
;520:		if (limit > 0 && len > limit) {
ADDRLP4 48
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
LEI4 $378
ADDRLP4 24
INDIRI4
ADDRLP4 48
INDIRI4
LEI4 $378
line 521
;521:			len = limit;
ADDRLP4 24
ADDRFP4 28
INDIRI4
ASGNI4
line 522
;522:		}
LABELV $378
line 523
;523:		count = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $381
JUMPV
LABELV $380
line 524
;524:		while (s && *s && count < len) {
line 525
;525:			glyph = &font->glyphs[(int)*s]; // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
ADDRLP4 0
CNSTI4 80
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 36
INDIRP4
ADDP4
ASGNP4
line 526
;526:			if ( Q_IsColorString( s ) ) {
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $383
ADDRLP4 56
CNSTI4 94
ASGNI4
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 56
INDIRI4
NEI4 $383
ADDRLP4 60
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $383
ADDRLP4 60
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $383
line 527
;527:				memcpy( newColor, g_color_table[ColorIndex(*(s+1))], sizeof( newColor ) );
ADDRLP4 4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 528
;528:				newColor[3] = color[3];
ADDRLP4 4+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 529
;529:				trap_R_SetColor( newColor );
ADDRLP4 4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 530
;530:				s += 2;
ADDRLP4 28
ADDRLP4 28
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 531
;531:				continue;
ADDRGP4 $381
JUMPV
LABELV $383
line 532
;532:			} else {
line 533
;533:	      float yadj = useScale * glyph->top;
ADDRLP4 64
ADDRLP4 32
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 534
;534:				if (Text_Width(s, useScale, 1) + x > max) {
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRF4
ADDF4
ADDRLP4 40
INDIRF4
LEF4 $386
line 535
;535:					*maxX = 0;
ADDRFP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 536
;536:					break;
ADDRGP4 $382
JUMPV
LABELV $386
line 538
;537:				}
;538:		    Text_PaintChar(x, y - yadj, 
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ADDRLP4 64
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Text_PaintChar
CALLV
pop
line 547
;539:			                 glyph->imageWidth,
;540:				               glyph->imageHeight,
;541:				               useScale, 
;542:						           glyph->s,
;543:								       glyph->t,
;544:								       glyph->s2,
;545:									     glyph->t2,
;546:										   glyph->glyph);
;547:	      x += (glyph->xSkip * useScale) + adjust;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
MULF4
ADDRFP4 24
INDIRF4
ADDF4
ADDF4
ASGNF4
line 548
;548:				*maxX = x;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRF4
ASGNF4
line 549
;549:				count++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 550
;550:				s++;
ADDRLP4 28
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 551
;551:	    }
line 552
;552:		}
LABELV $381
line 524
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $389
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $389
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $380
LABELV $389
LABELV $382
line 553
;553:	  trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 554
;554:  }
LABELV $364
line 556
;555:
;556:}
LABELV $363
endproc Text_Paint_Limit 76 40
export UI_ShowPostGame
proc UI_ShowPostGame 0 8
line 559
;557:
;558:
;559:void UI_ShowPostGame(qboolean newHigh) {
line 560
;560:	trap_Cvar_Set ("cg_cameraOrbit", "0");
ADDRGP4 $391
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 561
;561:	trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $393
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 562
;562:	trap_Cvar_Set( "sv_killserver", "1" );
ADDRGP4 $394
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 563
;563:	uiInfo.soundHighScore = newHigh;
ADDRGP4 uiInfo+73436
ADDRFP4 0
INDIRI4
ASGNI4
line 564
;564:  _UI_SetActiveMenu(UIMENU_POSTGAME);
CNSTI4 6
ARGI4
ADDRGP4 _UI_SetActiveMenu
CALLV
pop
line 565
;565:}
LABELV $390
endproc UI_ShowPostGame 0 8
export UI_DrawCenteredPic
proc UI_DrawCenteredPic 8 20
line 572
;566:/*
;567:=================
;568:_UI_Refresh
;569:=================
;570:*/
;571:
;572:void UI_DrawCenteredPic(qhandle_t image, int w, int h) {
line 574
;573:  int x, y;
;574:  x = (SCREEN_WIDTH - w) / 2;
ADDRLP4 0
CNSTI4 640
ADDRFP4 4
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 575
;575:  y = (SCREEN_HEIGHT - h) / 2;
ADDRLP4 4
CNSTI4 480
ADDRFP4 8
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 576
;576:  UI_DrawHandlePic(x, y, w, h, image);
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 577
;577:}
LABELV $397
endproc UI_DrawCenteredPic 8 20
data
export frameCount
align 4
LABELV frameCount
byte 4 0
bss
align 4
LABELV $399
skip 4
align 4
LABELV $400
skip 16
export _UI_Refresh
code
proc _UI_Refresh 20 20
line 584
;578:
;579:int frameCount = 0;
;580:int startTime;
;581:
;582:#define	UI_FPS_FRAMES	4
;583:void _UI_Refresh( int realtime )
;584:{
line 592
;585:	static int index;
;586:	static int	previousTimes[UI_FPS_FRAMES];
;587:
;588:	//if ( !( trap_Key_GetCatcher() & KEYCATCH_UI ) ) {
;589:	//	return;
;590:	//}
;591:
;592:	uiInfo.uiDC.frameTime = realtime - uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+212
ADDRFP4 0
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
SUBI4
ASGNI4
line 593
;593:	uiInfo.uiDC.realTime = realtime;
ADDRGP4 uiInfo+208
ADDRFP4 0
INDIRI4
ASGNI4
line 595
;594:
;595:	previousTimes[index % UI_FPS_FRAMES] = uiInfo.uiDC.frameTime;
ADDRGP4 $399
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $400
ADDP4
ADDRGP4 uiInfo+212
INDIRI4
ASGNI4
line 596
;596:	index++;
ADDRLP4 0
ADDRGP4 $399
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 597
;597:	if ( index > UI_FPS_FRAMES ) {
ADDRGP4 $399
INDIRI4
CNSTI4 4
LEI4 $405
line 600
;598:		int i, total;
;599:		// average multiple frames together to smooth changes out a bit
;600:		total = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 601
;601:		for ( i = 0 ; i < UI_FPS_FRAMES ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $407
line 602
;602:			total += previousTimes[i];
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $400
ADDP4
INDIRI4
ADDI4
ASGNI4
line 603
;603:		}
LABELV $408
line 601
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $407
line 604
;604:		if ( !total ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $411
line 605
;605:			total = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 606
;606:		}
LABELV $411
line 607
;607:		uiInfo.uiDC.FPS = 1000 * UI_FPS_FRAMES / total;
ADDRGP4 uiInfo+73412
CNSTI4 4000
ADDRLP4 8
INDIRI4
DIVI4
CVIF4 4
ASGNF4
line 608
;608:	}
LABELV $405
line 612
;609:
;610:
;611:
;612:	UI_UpdateCvars();
ADDRGP4 UI_UpdateCvars
CALLV
pop
line 614
;613:
;614:	if (Menu_Count() > 0) {
ADDRLP4 4
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $414
line 616
;615:		// paint all the menus
;616:		Menu_PaintAll();
ADDRGP4 Menu_PaintAll
CALLV
pop
line 618
;617:		// refresh server browser list
;618:		UI_DoServerRefresh();
ADDRGP4 UI_DoServerRefresh
CALLV
pop
line 620
;619:		// refresh server status
;620:		UI_BuildServerStatus(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 622
;621:		// refresh find player list
;622:		UI_BuildFindPlayerList(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildFindPlayerList
CALLV
pop
line 623
;623:	} 
LABELV $414
line 626
;624:	
;625:	// draw cursor
;626:	UI_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 627
;627:	if (Menu_Count() > 0) {
ADDRLP4 8
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $416
line 628
;628:		UI_DrawHandlePic( uiInfo.uiDC.cursorx-16, uiInfo.uiDC.cursory-16, 32, 32, uiInfo.uiDC.Assets.cursor);
ADDRLP4 12
CNSTI4 16
ASGNI4
ADDRGP4 uiInfo+216
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 uiInfo+220
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 16
CNSTF4 1107296256
ASGNF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uiInfo+228+61656
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 629
;629:	}
LABELV $416
line 632
;630:
;631:#ifndef NDEBUG
;632:	if (uiInfo.uiDC.debug)
ADDRGP4 uiInfo+224
INDIRI4
CNSTI4 0
EQI4 $422
line 633
;633:	{
line 637
;634:		// cursor coordinates
;635:		//FIXME
;636:		//UI_DrawString( 0, 0, va("(%d,%d)",uis.cursorx,uis.cursory), UI_LEFT|UI_SMALLFONT, colorRed );
;637:	}
LABELV $422
line 640
;638:#endif
;639:
;640:}
LABELV $398
endproc _UI_Refresh 20 20
export _UI_Shutdown
proc _UI_Shutdown 0 0
line 647
;641:
;642:/*
;643:=================
;644:_UI_Shutdown
;645:=================
;646:*/
;647:void _UI_Shutdown( void ) {
line 648
;648:	trap_LAN_SaveCachedServers();
ADDRGP4 trap_LAN_SaveCachedServers
CALLV
pop
line 649
;649:}
LABELV $425
endproc _UI_Shutdown 0 0
data
export defaultMenu
align 4
LABELV defaultMenu
byte 4 0
bss
align 1
LABELV $427
skip 32768
export GetMenuBuffer
code
proc GetMenuBuffer 16 16
line 653
;650:
;651:char *defaultMenu = NULL;
;652:
;653:char *GetMenuBuffer(const char *filename) {
line 658
;654:	int	len;
;655:	fileHandle_t	f;
;656:	static char buf[MAX_MENUFILE];
;657:
;658:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 659
;659:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $428
line 660
;660:		trap_Print( va( S_COLOR_RED "menu file not found: %s, using default\n", filename ) );
ADDRGP4 $430
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 661
;661:		return defaultMenu;
ADDRGP4 defaultMenu
INDIRP4
RETP4
ADDRGP4 $426
JUMPV
LABELV $428
line 663
;662:	}
;663:	if ( len >= MAX_MENUFILE ) {
ADDRLP4 0
INDIRI4
CNSTI4 32768
LTI4 $431
line 664
;664:		trap_Print( va( S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", filename, len, MAX_MENUFILE ) );
ADDRGP4 $433
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 32768
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 665
;665:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 666
;666:		return defaultMenu;
ADDRGP4 defaultMenu
INDIRP4
RETP4
ADDRGP4 $426
JUMPV
LABELV $431
line 669
;667:	}
;668:
;669:	trap_FS_Read( buf, len, f );
ADDRGP4 $427
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 670
;670:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $427
ADDP4
CNSTI1 0
ASGNI1
line 671
;671:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 673
;672:	//COM_Compress(buf);
;673:  return buf;
ADDRGP4 $427
RETP4
LABELV $426
endproc GetMenuBuffer 16 16
export Asset_Parse
proc Asset_Parse 1124 12
line 677
;674:
;675:}
;676:
;677:qboolean Asset_Parse(int handle) {
line 681
;678:	pc_token_t token;
;679:	const char *tempStr;
;680:
;681:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $435
line 682
;682:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $435
line 683
;683:	if (Q_stricmp(token.string, "{") != 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $440
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $442
line 684
;684:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $441
line 687
;685:	}
;686:    
;687:	while ( 1 ) {
line 689
;688:
;689:		memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 691
;690:
;691:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $444
line 692
;692:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $444
line 694
;693:
;694:		if (Q_stricmp(token.string, "}") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $446
line 695
;695:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $434
JUMPV
LABELV $446
line 699
;696:		}
;697:
;698:		// font
;699:		if (Q_stricmp(token.string, "font") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $453
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $450
line 701
;700:			int pointSize;
;701:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1068
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
EQI4 $456
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1064
ARGP4
ADDRLP4 1072
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $454
LABELV $456
line 702
;702:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $454
line 704
;703:			}
;704:			trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.textFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+12
ARGP4
ADDRGP4 trap_R_RegisterFont
CALLV
pop
line 705
;705:			uiInfo.uiDC.Assets.fontRegistered = qtrue;
ADDRGP4 uiInfo+228+61764
CNSTI4 1
ASGNI4
line 706
;706:			continue;
ADDRGP4 $442
JUMPV
LABELV $450
line 709
;707:		}
;708:
;709:		if (Q_stricmp(token.string, "smallFont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $464
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $461
line 711
;710:			int pointSize;
;711:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1072
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
EQI4 $467
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1068
ARGP4
ADDRLP4 1076
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $465
LABELV $467
line 712
;712:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $465
line 714
;713:			}
;714:			trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.smallFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+20560
ARGP4
ADDRGP4 trap_R_RegisterFont
CALLV
pop
line 715
;715:			continue;
ADDRGP4 $442
JUMPV
LABELV $461
line 718
;716:		}
;717:
;718:		if (Q_stricmp(token.string, "bigFont") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $473
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $470
line 720
;719:			int pointSize;
;720:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle,&pointSize)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1076
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
EQI4 $476
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ARGP4
ADDRLP4 1080
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $474
LABELV $476
line 721
;721:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $474
line 723
;722:			}
;723:			trap_R_RegisterFont(tempStr, pointSize, &uiInfo.uiDC.Assets.bigFont);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+41108
ARGP4
ADDRGP4 trap_R_RegisterFont
CALLV
pop
line 724
;724:			continue;
ADDRGP4 $442
JUMPV
LABELV $470
line 729
;725:		}
;726:
;727:
;728:		// gradientbar
;729:		if (Q_stricmp(token.string, "gradientbar") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $482
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $479
line 730
;730:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1076
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $483
line 731
;731:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $483
line 733
;732:			}
;733:			uiInfo.uiDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61660
ADDRLP4 1080
INDIRI4
ASGNI4
line 734
;734:			continue;
ADDRGP4 $442
JUMPV
LABELV $479
line 738
;735:		}
;736:
;737:		// enterMenuSound
;738:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $490
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $487
line 739
;739:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1080
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $491
line 740
;740:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $491
line 742
;741:			}
;742:			uiInfo.uiDC.Assets.menuEnterSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1084
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61708
ADDRLP4 1084
INDIRI4
ASGNI4
line 743
;743:			continue;
ADDRGP4 $442
JUMPV
LABELV $487
line 747
;744:		}
;745:
;746:		// exitMenuSound
;747:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $498
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $495
line 748
;748:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1084
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $499
line 749
;749:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $499
line 751
;750:			}
;751:			uiInfo.uiDC.Assets.menuExitSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1088
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61712
ADDRLP4 1088
INDIRI4
ASGNI4
line 752
;752:			continue;
ADDRGP4 $442
JUMPV
LABELV $495
line 756
;753:		}
;754:
;755:		// itemFocusSound
;756:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $506
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $503
line 757
;757:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1088
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $507
line 758
;758:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $507
line 760
;759:			}
;760:			uiInfo.uiDC.Assets.itemFocusSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1092
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61720
ADDRLP4 1092
INDIRI4
ASGNI4
line 761
;761:			continue;
ADDRGP4 $442
JUMPV
LABELV $503
line 765
;762:		}
;763:
;764:		// menuBuzzSound
;765:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $514
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $511
line 766
;766:			if (!PC_String_Parse(handle, &tempStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1040
ARGP4
ADDRLP4 1092
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $515
line 767
;767:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $515
line 769
;768:			}
;769:			uiInfo.uiDC.Assets.menuBuzzSound = trap_S_RegisterSound( tempStr, qfalse );
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1096
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61716
ADDRLP4 1096
INDIRI4
ASGNI4
line 770
;770:			continue;
ADDRGP4 $442
JUMPV
LABELV $511
line 773
;771:		}
;772:
;773:		if (Q_stricmp(token.string, "cursor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $522
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $519
line 774
;774:			if (!PC_String_Parse(handle, &uiInfo.uiDC.Assets.cursorStr)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+4
ARGP4
ADDRLP4 1096
ADDRGP4 PC_String_Parse
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $523
line 775
;775:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $523
line 777
;776:			}
;777:			uiInfo.uiDC.Assets.cursor = trap_R_RegisterShaderNoMip( uiInfo.uiDC.Assets.cursorStr);
ADDRGP4 uiInfo+228+4
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+228+61656
ADDRLP4 1100
INDIRI4
ASGNI4
line 778
;778:			continue;
ADDRGP4 $442
JUMPV
LABELV $519
line 781
;779:		}
;780:
;781:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $534
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $531
line 782
;782:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.fadeClamp)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61724
ARGP4
ADDRLP4 1100
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $442
line 783
;783:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
line 785
;784:			}
;785:			continue;
LABELV $531
line 788
;786:		}
;787:
;788:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $542
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $539
line 789
;789:			if (!PC_Int_Parse(handle, &uiInfo.uiDC.Assets.fadeCycle)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61728
ARGP4
ADDRLP4 1104
ADDRGP4 PC_Int_Parse
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $442
line 790
;790:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
line 792
;791:			}
;792:			continue;
LABELV $539
line 795
;793:		}
;794:
;795:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $550
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $547
line 796
;796:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.fadeAmount)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61732
ARGP4
ADDRLP4 1108
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $442
line 797
;797:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
line 799
;798:			}
;799:			continue;
LABELV $547
line 802
;800:		}
;801:
;802:		if (Q_stricmp(token.string, "shadowX") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $558
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $555
line 803
;803:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.shadowX)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61736
ARGP4
ADDRLP4 1112
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $442
line 804
;804:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
line 806
;805:			}
;806:			continue;
LABELV $555
line 809
;807:		}
;808:
;809:		if (Q_stricmp(token.string, "shadowY") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $566
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $563
line 810
;810:			if (!PC_Float_Parse(handle, &uiInfo.uiDC.Assets.shadowY)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61740
ARGP4
ADDRLP4 1116
ADDRGP4 PC_Float_Parse
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $442
line 811
;811:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
line 813
;812:			}
;813:			continue;
LABELV $563
line 816
;814:		}
;815:
;816:		if (Q_stricmp(token.string, "shadowColor") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $574
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $571
line 817
;817:			if (!PC_Color_Parse(handle, &uiInfo.uiDC.Assets.shadowColor)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 uiInfo+228+61744
ARGP4
ADDRLP4 1120
ADDRGP4 PC_Color_Parse
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $575
line 818
;818:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $434
JUMPV
LABELV $575
line 820
;819:			}
;820:			uiInfo.uiDC.Assets.shadowFadeClamp = uiInfo.uiDC.Assets.shadowColor[3];
ADDRGP4 uiInfo+228+61760
ADDRGP4 uiInfo+228+61744+12
INDIRF4
ASGNF4
line 821
;821:			continue;
LABELV $571
line 824
;822:		}
;823:
;824:	}
LABELV $442
line 687
ADDRGP4 $441
JUMPV
line 825
;825:	return qfalse;
CNSTI4 0
RETI4
LABELV $434
endproc Asset_Parse 1124 12
export Font_Report
proc Font_Report 8 12
line 828
;826:}
;827:
;828:void Font_Report() {
line 830
;829:  int i;
;830:  Com_Printf("Font Info\n");
ADDRGP4 $585
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 831
;831:  Com_Printf("=========\n");
ADDRGP4 $586
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 832
;832:  for ( i = 32; i < 96; i++) {
ADDRLP4 0
CNSTI4 32
ASGNI4
LABELV $587
line 833
;833:    Com_Printf("Glyph handle %i: %i\n", i, uiInfo.uiDC.Assets.textFont.glyphs[i].glyph);
ADDRGP4 $591
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 80
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+228+12+44
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 834
;834:  }
LABELV $588
line 832
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 96
LTI4 $587
line 835
;835:}
LABELV $584
endproc Font_Report 8 12
export UI_Report
proc UI_Report 0 0
line 837
;836:
;837:void UI_Report() {
line 838
;838:  String_Report();
ADDRGP4 String_Report
CALLV
pop
line 841
;839:  //Font_Report();
;840:
;841:}
LABELV $595
endproc UI_Report 0 0
export UI_ParseMenu
proc UI_ParseMenu 1060 12
line 843
;842:
;843:void UI_ParseMenu(const char *menuFile) {
line 847
;844:	int handle;
;845:	pc_token_t token;
;846:
;847:	Com_Printf("Parsing menu file:%s\n", menuFile);
ADDRGP4 $597
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 849
;848:
;849:	handle = trap_PC_LoadSource(menuFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1044
INDIRI4
ASGNI4
line 850
;850:	if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $601
line 851
;851:		return;
ADDRGP4 $596
JUMPV
LABELV $600
line 854
;852:	}
;853:
;854:	while ( 1 ) {
line 855
;855:		memset(&token, 0, sizeof(pc_token_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1040
ARGI4
ADDRGP4 memset
CALLP4
pop
line 856
;856:		if (!trap_PC_ReadToken( handle, &token )) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1048
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $603
line 857
;857:			break;
ADDRGP4 $602
JUMPV
LABELV $603
line 870
;858:		}
;859:
;860:		//if ( Q_stricmp( token, "{" ) ) {
;861:		//	Com_Printf( "Missing { in menu file\n" );
;862:		//	break;
;863:		//}
;864:
;865:		//if ( menuCount == MAX_MENUS ) {
;866:		//	Com_Printf( "Too many menus!\n" );
;867:		//	break;
;868:		//}
;869:
;870:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $605
line 871
;871:			break;
ADDRGP4 $602
JUMPV
LABELV $605
line 874
;872:		}
;873:
;874:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $611
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $608
line 875
;875:			if (Asset_Parse(handle)) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 Asset_Parse
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $602
line 876
;876:				continue;
ADDRGP4 $601
JUMPV
line 877
;877:			} else {
line 878
;878:				break;
LABELV $608
line 882
;879:			}
;880:		}
;881:
;882:		if (Q_stricmp(token.string, "menudef") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $617
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $614
line 884
;883:			// start a new menu
;884:			Menu_New(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Menu_New
CALLV
pop
line 885
;885:		}
LABELV $614
line 886
;886:	}
LABELV $601
line 854
ADDRGP4 $600
JUMPV
LABELV $602
line 887
;887:	trap_PC_FreeSource(handle);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 888
;888:}
LABELV $596
endproc UI_ParseMenu 1060 12
export Load_Menu
proc Load_Menu 1048 8
line 890
;889:
;890:qboolean Load_Menu(int handle) {
line 893
;891:	pc_token_t token;
;892:
;893:	if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $619
line 894
;894:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $618
JUMPV
LABELV $619
line 895
;895:	if (token.string[0] != '{') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $625
line 896
;896:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $618
JUMPV
LABELV $624
line 899
;897:	}
;898:
;899:	while ( 1 ) {
line 901
;900:
;901:		if (!trap_PC_ReadToken(handle, &token))
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1044
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $627
line 902
;902:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $618
JUMPV
LABELV $627
line 904
;903:    
;904:		if ( token.string[0] == 0 ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $629
line 905
;905:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $618
JUMPV
LABELV $629
line 908
;906:		}
;907:
;908:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $632
line 909
;909:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $618
JUMPV
LABELV $632
line 912
;910:		}
;911:
;912:		UI_ParseMenu(token.string); 
ADDRLP4 0+16
ARGP4
ADDRGP4 UI_ParseMenu
CALLV
pop
line 913
;913:	}
LABELV $625
line 899
ADDRGP4 $624
JUMPV
line 914
;914:	return qfalse;
CNSTI4 0
RETI4
LABELV $618
endproc Load_Menu 1048 8
export UI_LoadMenus
proc UI_LoadMenus 1068 8
line 917
;915:}
;916:
;917:void UI_LoadMenus(const char *menuFile, qboolean reset) {
line 922
;918:	pc_token_t token;
;919:	int handle;
;920:	int start;
;921:
;922:	start = trap_Milliseconds();
ADDRLP4 1048
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1048
INDIRI4
ASGNI4
line 924
;923:
;924:	handle = trap_PC_LoadSource( menuFile );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1052
INDIRI4
ASGNI4
line 925
;925:	if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $637
line 926
;926:		trap_Error( va( S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile ) );
ADDRGP4 $639
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 927
;927:		handle = trap_PC_LoadSource( "ui/menus.txt" );
ADDRGP4 $640
ARGP4
ADDRLP4 1060
ADDRGP4 trap_PC_LoadSource
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1060
INDIRI4
ASGNI4
line 928
;928:		if (!handle) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $641
line 929
;929:			trap_Error( va( S_COLOR_RED "default menu file not found: ui/menus.txt, unable to continue!\n", menuFile ) );
ADDRGP4 $643
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 930
;930:		}
LABELV $641
line 931
;931:	}
LABELV $637
line 933
;932:
;933:	ui_new.integer = 1;
ADDRGP4 ui_new+12
CNSTI4 1
ASGNI4
line 935
;934:
;935:	if (reset) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $648
line 936
;936:		Menu_Reset();
ADDRGP4 Menu_Reset
CALLV
pop
line 937
;937:	}
ADDRGP4 $648
JUMPV
LABELV $647
line 939
;938:
;939:	while ( 1 ) {
line 940
;940:		if (!trap_PC_ReadToken(handle, &token))
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1056
ADDRGP4 trap_PC_ReadToken
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $650
line 941
;941:			break;
ADDRGP4 $649
JUMPV
LABELV $650
line 942
;942:		if( token.string[0] == 0 || token.string[0] == '}') {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $656
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $652
LABELV $656
line 943
;943:			break;
ADDRGP4 $649
JUMPV
LABELV $652
line 946
;944:		}
;945:
;946:		if ( token.string[0] == '}' ) {
ADDRLP4 0+16
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $657
line 947
;947:			break;
ADDRGP4 $649
JUMPV
LABELV $657
line 950
;948:		}
;949:
;950:		if (Q_stricmp(token.string, "loadmenu") == 0) {
ADDRLP4 0+16
ARGP4
ADDRGP4 $663
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $660
line 951
;951:			if (Load_Menu(handle)) {
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 Load_Menu
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $649
line 952
;952:				continue;
line 953
;953:			} else {
line 954
;954:				break;
LABELV $660
line 957
;955:			}
;956:		}
;957:	}
LABELV $648
line 939
ADDRGP4 $647
JUMPV
LABELV $649
line 959
;958:
;959:	Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
ADDRLP4 1056
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRGP4 $666
ARGP4
ADDRLP4 1056
INDIRI4
ADDRLP4 1044
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 961
;960:
;961:	trap_PC_FreeSource( handle );
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_PC_FreeSource
CALLI4
pop
line 962
;962:}
LABELV $636
endproc UI_LoadMenus 1068 8
export UI_Load
proc UI_Load 1052 8
line 964
;963:
;964:void UI_Load() {
line 966
;965:	char lastName[1024];
;966:  menuDef_t *menu = Menu_GetFocused();
ADDRLP4 1032
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1032
INDIRP4
ASGNP4
line 967
;967:	char *menuSet = UI_Cvar_VariableString("ui_menuFiles");
ADDRGP4 $668
ARGP4
ADDRLP4 1036
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
line 968
;968:	if (menu && menu->window.name) {
ADDRLP4 1044
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 1044
INDIRU4
EQU4 $669
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1044
INDIRU4
EQU4 $669
line 969
;969:		strcpy(lastName, menu->window.name);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 970
;970:	}
LABELV $669
line 971
;971:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $673
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $671
LABELV $673
line 972
;972:		menuSet = "ui/menus.txt";
ADDRLP4 0
ADDRGP4 $640
ASGNP4
line 973
;973:	}
LABELV $671
line 975
;974:
;975:	String_Init();
ADDRGP4 String_Init
CALLV
pop
line 980
;976:
;977:#ifdef PRE_RELEASE_TADEMO
;978:	UI_ParseGameInfo("demogameinfo.txt");
;979:#else
;980:	UI_ParseGameInfo("gameinfo.txt");
ADDRGP4 $674
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 981
;981:	UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 984
;982:#endif
;983:
;984:	UI_LoadMenus(menuSet, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 985
;985:	Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 986
;986:	Menus_ActivateByName(lastName);
ADDRLP4 8
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 988
;987:
;988:}
LABELV $667
endproc UI_Load 1052 8
data
align 4
LABELV handicapValues
address $675
address $676
address $677
address $678
address $679
address $680
address $681
address $682
address $683
address $684
address $685
address $686
address $687
address $688
address $689
address $690
address $691
address $692
address $693
address $694
byte 4 0
code
proc UI_DrawHandicap 20 32
line 995
;989:
;990:static const char *handicapValues[] = {"None","95","90","85","80","75","70","65","60","55","50","45","40","35","30","25","20","15","10","5",NULL};
;991:#ifndef MISSIONPACK // bk001206
;992:static int numHandicaps = sizeof(handicapValues) / sizeof(const char*);
;993:#endif
;994:
;995:static void UI_DrawHandicap(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 998
;996:  int i, h;
;997:
;998:  h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $696
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 999
;999:  i = 20 - h / 5;
ADDRLP4 0
CNSTI4 20
ADDRLP4 4
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 1001
;1000:
;1001:  Text_Paint(rect->x, rect->y, scale, color, handicapValues[i], 0, 0, textStyle);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicapValues
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1002
;1002:}
LABELV $695
endproc UI_DrawHandicap 20 32
proc UI_DrawClanName 8 32
line 1004
;1003:
;1004:static void UI_DrawClanName(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1005
;1005:  Text_Paint(rect->x, rect->y, scale, color, UI_Cvar_VariableString("ui_teamName"), 0, 0, textStyle);
ADDRGP4 $698
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1006
;1006:}
LABELV $697
endproc UI_DrawClanName 8 32
proc UI_SetCapFragLimits 16 8
line 1009
;1007:
;1008:
;1009:static void UI_SetCapFragLimits(qboolean uiVars) {
line 1010
;1010:	int cap = 5;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1011
;1011:	int frag = 10;
ADDRLP4 4
CNSTI4 10
ASGNI4
line 1012
;1012:	if (uiInfo.gameTypes[ui_gameType.integer].gtEnum == GT_OBELISK) {
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $700
line 1013
;1013:		cap = 4;
ADDRLP4 0
CNSTI4 4
ASGNI4
line 1014
;1014:	} else if (uiInfo.gameTypes[ui_gameType.integer].gtEnum == GT_HARVESTER) {
ADDRGP4 $701
JUMPV
LABELV $700
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
CNSTI4 7
NEI4 $705
line 1015
;1015:		cap = 15;
ADDRLP4 0
CNSTI4 15
ASGNI4
line 1016
;1016:	}
LABELV $705
LABELV $701
line 1017
;1017:	if (uiVars) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $710
line 1018
;1018:		trap_Cvar_Set("ui_captureLimit", va("%d", cap));
ADDRGP4 $713
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $712
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1019
;1019:		trap_Cvar_Set("ui_fragLimit", va("%d", frag));
ADDRGP4 $713
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $714
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1020
;1020:	} else {
ADDRGP4 $711
JUMPV
LABELV $710
line 1021
;1021:		trap_Cvar_Set("capturelimit", va("%d", cap));
ADDRGP4 $713
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $715
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1022
;1022:		trap_Cvar_Set("fraglimit", va("%d", frag));
ADDRGP4 $713
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $716
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1023
;1023:	}
LABELV $711
line 1024
;1024:}
LABELV $699
endproc UI_SetCapFragLimits 16 8
proc UI_DrawGameType 4 32
line 1026
;1025:// ui_gameType assumes gametype 0 is -1 ALL and will not show
;1026:static void UI_DrawGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1027
;1027:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[ui_gameType.integer].gameType, 0, 0, textStyle);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1028
;1028:}
LABELV $717
endproc UI_DrawGameType 4 32
proc UI_DrawNetGameType 4 32
line 1030
;1029:
;1030:static void UI_DrawNetGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1031
;1031:	if (ui_netGameType.integer < 0 || ui_netGameType.integer > uiInfo.numGameTypes) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
LTI4 $726
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+78576
INDIRI4
LEI4 $721
LABELV $726
line 1032
;1032:		trap_Cvar_Set("ui_netGameType", "0");
ADDRGP4 $727
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1033
;1033:		trap_Cvar_Set("ui_actualNetGameType", "0");
ADDRGP4 $728
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1034
;1034:	}
LABELV $721
line 1035
;1035:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[ui_netGameType.integer].gameType , 0, 0, textStyle);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1036
;1036:}
LABELV $720
endproc UI_DrawNetGameType 4 32
proc UI_DrawJoinGameType 4 32
line 1038
;1037:
;1038:static void UI_DrawJoinGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1039
;1039:	if (ui_joinGameType.integer < 0 || ui_joinGameType.integer > uiInfo.numJoinGameTypes) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 0
LTI4 $737
ADDRGP4 ui_joinGameType+12
INDIRI4
ADDRGP4 uiInfo+78708
INDIRI4
LEI4 $732
LABELV $737
line 1040
;1040:		trap_Cvar_Set("ui_joinGameType", "0");
ADDRGP4 $738
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1041
;1041:	}
LABELV $732
line 1042
;1042:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.joinGameTypes[ui_joinGameType.integer].gameType , 0, 0, textStyle);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78712
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1043
;1043:}
LABELV $731
endproc UI_DrawJoinGameType 4 32
proc UI_TeamIndexFromName 12 8
line 1047
;1044:
;1045:
;1046:
;1047:static int UI_TeamIndexFromName(const char *name) {
line 1050
;1048:  int i;
;1049:
;1050:  if (name && *name) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $742
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $742
line 1051
;1051:    for (i = 0; i < uiInfo.teamCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $747
JUMPV
LABELV $744
line 1052
;1052:      if (Q_stricmp(name, uiInfo.teamList[i].teamName) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $749
line 1053
;1053:        return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $741
JUMPV
LABELV $749
line 1055
;1054:      }
;1055:    }
LABELV $745
line 1051
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $747
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
LTI4 $744
line 1056
;1056:  } 
LABELV $742
line 1058
;1057:
;1058:  return 0;
CNSTI4 0
RETI4
LABELV $741
endproc UI_TeamIndexFromName 12 8
proc UI_DrawClanLogo 48 20
line 1062
;1059:
;1060:}
;1061:
;1062:static void UI_DrawClanLogo(rectDef_t *rect, float scale, vec4_t color) {
line 1064
;1063:  int i;
;1064:  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1065
;1065:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $753
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
GEI4 $753
line 1066
;1066:  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1068
;1067:
;1068:		if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $756
line 1069
;1069:      uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 16
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1070
;1070:      uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $766
ARGP4
ADDRLP4 24
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 uiInfo+75760+4
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
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1071
;1071:      uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $771
ARGP4
ADDRLP4 36
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 1072
;1072:		}
LABELV $756
line 1074
;1073:
;1074:  	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1075
;1075:    trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1076
;1076:  }
LABELV $753
line 1077
;1077:}
LABELV $752
endproc UI_DrawClanLogo 48 20
proc UI_DrawClanCinematic 32 24
line 1079
;1078:
;1079:static void UI_DrawClanCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1081
;1080:  int i;
;1081:  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1082
;1082:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $777
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
GEI4 $777
line 1084
;1083:
;1084:		if (uiInfo.teamList[i].cinematic >= -2) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
CNSTI4 -2
LTI4 $780
line 1085
;1085:			if (uiInfo.teamList[i].cinematic == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $784
line 1086
;1086:				uiInfo.teamList[i].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.teamList[i].imageName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $790
ARGP4
ADDRLP4 16
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 28
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75760+40
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1087
;1087:			}
LABELV $784
line 1088
;1088:			if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
CNSTI4 0
LTI4 $793
line 1089
;1089:			  trap_CIN_RunCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1090
;1090:				trap_CIN_SetExtents(uiInfo.teamList[i].cinematic, rect->x, rect->y, rect->w, rect->h);
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1091
;1091:	 			trap_CIN_DrawCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1092
;1092:			} else {
ADDRGP4 $781
JUMPV
LABELV $793
line 1093
;1093:			  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1094
;1094:				UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1095
;1095:				trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1096
;1096:				uiInfo.teamList[i].cinematic = -2;
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
CNSTI4 -2
ASGNI4
line 1097
;1097:			}
line 1098
;1098:		} else {
ADDRGP4 $781
JUMPV
LABELV $780
line 1099
;1099:	  	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1100
;1100:			UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1101
;1101:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1102
;1102:		}
LABELV $781
line 1103
;1103:	}
LABELV $777
line 1105
;1104:
;1105:}
LABELV $776
endproc UI_DrawClanCinematic 32 24
proc UI_DrawPreviewCinematic 16 24
line 1107
;1106:
;1107:static void UI_DrawPreviewCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1108
;1108:	if (uiInfo.previewMovie > -2) {
ADDRGP4 uiInfo+99260
INDIRI4
CNSTI4 -2
LEI4 $810
line 1109
;1109:		uiInfo.previewMovie = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.movieList[uiInfo.movieIndex]), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $790
ARGP4
ADDRGP4 uiInfo+99256
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98228
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 8
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRGP4 uiInfo+99260
ADDRLP4 8
INDIRI4
ASGNI4
line 1110
;1110:		if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+99260
INDIRI4
CNSTI4 0
LTI4 $816
line 1111
;1111:		  trap_CIN_RunCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99260
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1112
;1112:			trap_CIN_SetExtents(uiInfo.previewMovie, rect->x, rect->y, rect->w, rect->h);
ADDRGP4 uiInfo+99260
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1113
;1113: 			trap_CIN_DrawCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99260
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1114
;1114:		} else {
ADDRGP4 $817
JUMPV
LABELV $816
line 1115
;1115:			uiInfo.previewMovie = -2;
ADDRGP4 uiInfo+99260
CNSTI4 -2
ASGNI4
line 1116
;1116:		}
LABELV $817
line 1117
;1117:	} 
LABELV $810
line 1119
;1118:
;1119:}
LABELV $809
endproc UI_DrawPreviewCinematic 16 24
proc UI_DrawSkill 16 32
line 1123
;1120:
;1121:
;1122:
;1123:static void UI_DrawSkill(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1125
;1124:  int i;
;1125:	i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $824
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1126
;1126:  if (i < 1 || i > numSkillLevels) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $827
ADDRLP4 0
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $825
LABELV $827
line 1127
;1127:    i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1128
;1128:  }
LABELV $825
line 1129
;1129:  Text_Paint(rect->x, rect->y, scale, color, skillLevels[i-1],0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels-4
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1130
;1130:}
LABELV $823
endproc UI_DrawSkill 16 32
proc UI_DrawTeamName 32 32
line 1133
;1131:
;1132:
;1133:static void UI_DrawTeamName(rectDef_t *rect, float scale, vec4_t color, qboolean blue, int textStyle) {
line 1135
;1134:  int i;
;1135:  i = UI_TeamIndexFromName(UI_Cvar_VariableString((blue) ? "ui_blueTeam" : "ui_redTeam"));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $833
ADDRLP4 4
ADDRGP4 $830
ASGNP4
ADDRGP4 $834
JUMPV
LABELV $833
ADDRLP4 4
ADDRGP4 $831
ASGNP4
LABELV $834
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1136
;1136:  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $835
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
GEI4 $835
line 1137
;1137:    Text_Paint(rect->x, rect->y, scale, color, va("%s: %s", (blue) ? "Blue" : "Red", uiInfo.teamList[i].teamName),0, 0, textStyle);
ADDRGP4 $838
ARGP4
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $843
ADDRLP4 20
ADDRGP4 $839
ASGNP4
ADDRGP4 $844
JUMPV
LABELV $843
ADDRLP4 20
ADDRGP4 $840
ASGNP4
LABELV $844
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1138
;1138:  }
LABELV $835
line 1139
;1139:}
LABELV $829
endproc UI_DrawTeamName 32 32
proc UI_DrawTeamMember 28 32
line 1141
;1140:
;1141:static void UI_DrawTeamMember(rectDef_t *rect, float scale, vec4_t color, qboolean blue, int num, int textStyle) {
line 1145
;1142:	// 0 - None
;1143:	// 1 - Human
;1144:	// 2..NumCharacters - Bot
;1145:	int value = trap_Cvar_VariableValue(va(blue ? "ui_blueteam%i" : "ui_redteam%i", num));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $849
ADDRLP4 8
ADDRGP4 $846
ASGNP4
ADDRGP4 $850
JUMPV
LABELV $849
ADDRLP4 8
ADDRGP4 $847
ASGNP4
LABELV $850
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1147
;1146:	const char *text;
;1147:	if (value <= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $851
line 1148
;1148:		text = "Closed";
ADDRLP4 4
ADDRGP4 $853
ASGNP4
line 1149
;1149:	} else if (value == 1) {
ADDRGP4 $852
JUMPV
LABELV $851
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $854
line 1150
;1150:		text = "Human";
ADDRLP4 4
ADDRGP4 $856
ASGNP4
line 1151
;1151:	} else {
ADDRGP4 $855
JUMPV
LABELV $854
line 1152
;1152:		value -= 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1154
;1153:
;1154:		if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 3
LTI4 $857
line 1155
;1155:			if (value >= uiInfo.characterCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
LTI4 $860
line 1156
;1156:				value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1157
;1157:			}
LABELV $860
line 1158
;1158:			text = uiInfo.characterList[value].name;
ADDRLP4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ASGNP4
line 1159
;1159:		} else {
ADDRGP4 $858
JUMPV
LABELV $857
line 1160
;1160:			if (value >= UI_GetNumBots()) {
ADDRLP4 20
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $864
line 1161
;1161:				value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1162
;1162:			}
LABELV $864
line 1163
;1163:			text = UI_GetBotNameByNumber(value);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 1164
;1164:		}
LABELV $858
line 1165
;1165:	}
LABELV $855
LABELV $852
line 1166
;1166:  Text_Paint(rect->x, rect->y, scale, color, text, 0, 0, textStyle);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1167
;1167:}
LABELV $845
endproc UI_DrawTeamMember 28 32
proc UI_DrawEffects 16 20
line 1169
;1168:
;1169:static void UI_DrawEffects(rectDef_t *rect, float scale, vec4_t color) {
line 1170
;1170:	UI_DrawHandlePic( rect->x, rect->y - 14, 128, 8, uiInfo.uiDC.Assets.fxBasePic );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1096810496
SUBF4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 uiInfo+228+61768
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1171
;1171:	UI_DrawHandlePic( rect->x + uiInfo.effectsColor * 16 + 8, rect->y - 16, 16, 12, uiInfo.uiDC.Assets.fxPic[uiInfo.effectsColor] );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 uiInfo+136904
INDIRI4
ADDRLP4 8
INDIRI4
LSHI4
CVIF4 4
ADDF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRLP4 12
CNSTF4 1098907648
ASGNF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
CNSTF4 1094713344
ARGF4
ADDRGP4 uiInfo+136904
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+228+61772
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1172
;1172:}
LABELV $866
endproc UI_DrawEffects 16 20
proc UI_DrawMapPreview 20 20
line 1174
;1173:
;1174:static void UI_DrawMapPreview(rectDef_t *rect, float scale, vec4_t color, qboolean net) {
line 1175
;1175:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $877
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $878
JUMPV
LABELV $877
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $878
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1176
;1176:	if (map < 0 || map > uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $882
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LEI4 $879
LABELV $882
line 1177
;1177:		if (net) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $883
line 1178
;1178:			ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1179
;1179:			trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $886
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1180
;1180:		} else {
ADDRGP4 $884
JUMPV
LABELV $883
line 1181
;1181:			ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1182
;1182:			trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $888
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1183
;1183:		}
LABELV $884
line 1184
;1184:		map = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1185
;1185:	}
LABELV $879
line 1187
;1186:
;1187:	if (uiInfo.mapList[map].levelShot == -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+92
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $889
line 1188
;1188:		uiInfo.mapList[map].levelShot = trap_R_RegisterShaderNoMip(uiInfo.mapList[map].imageName);
ADDRLP4 12
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83228+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83228+92
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1189
;1189:	}
LABELV $889
line 1191
;1190:
;1191:	if (uiInfo.mapList[map].levelShot > 0) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+92
ADDP4
INDIRI4
CNSTI4 0
LEI4 $897
line 1192
;1192:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.mapList[map].levelShot);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+92
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1193
;1193:	} else {
ADDRGP4 $898
JUMPV
LABELV $897
line 1194
;1194:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, trap_R_RegisterShaderNoMip("menu/art/unknownmap"));
ADDRGP4 $903
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1195
;1195:	}
LABELV $898
line 1196
;1196:}						 
LABELV $873
endproc UI_DrawMapPreview 20 20
proc UI_DrawMapTimeToBeat 20 32
line 1199
;1197:
;1198:
;1199:static void UI_DrawMapTimeToBeat(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1201
;1200:	int minutes, seconds, time;
;1201:	if (ui_currentMap.integer < 0 || ui_currentMap.integer > uiInfo.mapCount) {
ADDRGP4 ui_currentMap+12
INDIRI4
CNSTI4 0
LTI4 $910
ADDRGP4 ui_currentMap+12
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LEI4 $905
LABELV $910
line 1202
;1202:		ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1203
;1203:		trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $888
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1204
;1204:	}
LABELV $905
line 1206
;1205:
;1206:	time = uiInfo.mapList[ui_currentMap.integer].timeToBeat[uiInfo.gameTypes[ui_gameType.integer].gtEnum];
ADDRLP4 0
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+28
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1208
;1207:
;1208:	minutes = time / 60;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 1209
;1209:	seconds = time % 60;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 60
MODI4
ASGNI4
line 1211
;1210:
;1211:  Text_Paint(rect->x, rect->y, scale, color, va("%02i:%02i", minutes, seconds), 0, 0, textStyle);
ADDRGP4 $918
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1212
;1212:}
LABELV $904
endproc UI_DrawMapTimeToBeat 20 32
proc UI_DrawMapCinematic 28 24
line 1216
;1213:
;1214:
;1215:
;1216:static void UI_DrawMapCinematic(rectDef_t *rect, float scale, vec4_t color, qboolean net) {
line 1218
;1217:
;1218:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer; 
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $923
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $924
JUMPV
LABELV $923
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $924
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1219
;1219:	if (map < 0 || map > uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $928
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LEI4 $925
LABELV $928
line 1220
;1220:		if (net) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $929
line 1221
;1221:			ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1222
;1222:			trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $886
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1223
;1223:		} else {
ADDRGP4 $930
JUMPV
LABELV $929
line 1224
;1224:			ui_currentMap.integer = 0;
ADDRGP4 ui_currentMap+12
CNSTI4 0
ASGNI4
line 1225
;1225:			trap_Cvar_Set("ui_currentMap", "0");
ADDRGP4 $888
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1226
;1226:		}
LABELV $930
line 1227
;1227:		map = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1228
;1228:	}
LABELV $925
line 1230
;1229:
;1230:	if (uiInfo.mapList[map].cinematic >= -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
CNSTI4 -1
LTI4 $933
line 1231
;1231:		if (uiInfo.mapList[map].cinematic == -1) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $937
line 1232
;1232:			uiInfo.mapList[map].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[map].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $790
ARGP4
ADDRLP4 12
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 24
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83228+24
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1233
;1233:		}
LABELV $937
line 1234
;1234:		if (uiInfo.mapList[map].cinematic >= 0) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $945
line 1235
;1235:		  trap_CIN_RunCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1236
;1236:		  trap_CIN_SetExtents(uiInfo.mapList[map].cinematic, rect->x, rect->y, rect->w, rect->h);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1237
;1237: 			trap_CIN_DrawCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1238
;1238:		} else {
ADDRGP4 $934
JUMPV
LABELV $945
line 1239
;1239:			uiInfo.mapList[map].cinematic = -2;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
CNSTI4 -2
ASGNI4
line 1240
;1240:		}
line 1241
;1241:	} else {
ADDRGP4 $934
JUMPV
LABELV $933
line 1242
;1242:		UI_DrawMapPreview(rect, scale, color, net);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_DrawMapPreview
CALLV
pop
line 1243
;1243:	}
LABELV $934
line 1244
;1244:}
LABELV $919
endproc UI_DrawMapCinematic 28 24
data
align 4
LABELV updateModel
byte 4 1
align 4
LABELV q3Model
byte 4 0
bss
align 4
LABELV $958
skip 1276
code
proc UI_DrawPlayerModel 616 28
line 1251
;1245:
;1246:
;1247:
;1248:static qboolean updateModel = qtrue;
;1249:static qboolean q3Model = qfalse;
;1250:
;1251:static void UI_DrawPlayerModel(rectDef_t *rect) {
line 1259
;1252:  static playerInfo_t info;
;1253:  char model[MAX_QPATH];
;1254:  char team[256];
;1255:	char head[256];
;1256:	vec3_t	viewangles;
;1257:	vec3_t	moveangles;
;1258:
;1259:	  if (trap_Cvar_VariableValue("ui_Q3Model")) {
ADDRGP4 $961
ARGP4
ADDRLP4 600
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 600
INDIRF4
CNSTF4 0
EQF4 $959
line 1260
;1260:	  strcpy(model, UI_Cvar_VariableString("model"));
ADDRGP4 $962
ARGP4
ADDRLP4 604
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1261
;1261:		strcpy(head, UI_Cvar_VariableString("headmodel"));
ADDRGP4 $963
ARGP4
ADDRLP4 608
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 332
ARGP4
ADDRLP4 608
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1262
;1262:		if (!q3Model) {
ADDRGP4 q3Model
INDIRI4
CNSTI4 0
NEI4 $964
line 1263
;1263:			q3Model = qtrue;
ADDRGP4 q3Model
CNSTI4 1
ASGNI4
line 1264
;1264:			updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 1265
;1265:		}
LABELV $964
line 1266
;1266:		team[0] = '\0';
ADDRLP4 76
CNSTI1 0
ASGNI1
line 1267
;1267:	} else {
ADDRGP4 $960
JUMPV
LABELV $959
line 1269
;1268:
;1269:		strcpy(team, UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 604
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 76
ARGP4
ADDRLP4 604
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1270
;1270:		strcpy(model, UI_Cvar_VariableString("team_model"));
ADDRGP4 $966
ARGP4
ADDRLP4 608
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 608
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1271
;1271:		strcpy(head, UI_Cvar_VariableString("team_headmodel"));
ADDRGP4 $967
ARGP4
ADDRLP4 612
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 332
ARGP4
ADDRLP4 612
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1272
;1272:		if (q3Model) {
ADDRGP4 q3Model
INDIRI4
CNSTI4 0
EQI4 $968
line 1273
;1273:			q3Model = qfalse;
ADDRGP4 q3Model
CNSTI4 0
ASGNI4
line 1274
;1274:			updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 1275
;1275:		}
LABELV $968
line 1276
;1276:	}
LABELV $960
line 1277
;1277:  if (updateModel) {
ADDRGP4 updateModel
INDIRI4
CNSTI4 0
EQI4 $970
line 1278
;1278:  	memset( &info, 0, sizeof(playerInfo_t) );
ADDRGP4 $958
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1276
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1279
;1279:  	viewangles[YAW]   = 180 - 10;
ADDRLP4 0+4
CNSTF4 1126825984
ASGNF4
line 1280
;1280:  	viewangles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1281
;1281:  	viewangles[ROLL]  = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1282
;1282:  	VectorClear( moveangles );
ADDRLP4 604
CNSTF4 0
ASGNF4
ADDRLP4 588+8
ADDRLP4 604
INDIRF4
ASGNF4
ADDRLP4 588+4
ADDRLP4 604
INDIRF4
ASGNF4
ADDRLP4 588
ADDRLP4 604
INDIRF4
ASGNF4
line 1283
;1283:    UI_PlayerInfo_SetModel( &info, model, head, team);
ADDRGP4 $958
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 1284
;1284:    UI_PlayerInfo_SetInfo( &info, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse );
ADDRGP4 $958
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 1286
;1285://		UI_RegisterClientModelname( &info, model, head, team);
;1286:    updateModel = qfalse;
ADDRGP4 updateModel
CNSTI4 0
ASGNI4
line 1287
;1287:  }
LABELV $970
line 1289
;1288:
;1289:  UI_DrawPlayer( rect->x, rect->y, rect->w, rect->h, &info, uiInfo.uiDC.realTime / 2);
ADDRLP4 604
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 604
INDIRP4
INDIRF4
ARGF4
ADDRLP4 604
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 604
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 604
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 $958
ARGP4
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 1291
;1290:
;1291:}
LABELV $957
endproc UI_DrawPlayerModel 616 28
proc UI_DrawNetSource 8 32
line 1293
;1292:
;1293:static void UI_DrawNetSource(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1294
;1294:	if (ui_netSource.integer < 0 || ui_netSource.integer > numNetSources) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
LTI4 $982
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 numNetSources
INDIRI4
LEI4 $978
LABELV $982
line 1295
;1295:		ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 1296
;1296:	}
LABELV $978
line 1297
;1297:  Text_Paint(rect->x, rect->y, scale, color, va("Source: %s", netSources[ui_netSource.integer]), 0, 0, textStyle);
ADDRGP4 $984
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netSources
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1298
;1298:}
LABELV $977
endproc UI_DrawNetSource 8 32
proc UI_DrawNetMapPreview 8 20
line 1300
;1299:
;1300:static void UI_DrawNetMapPreview(rectDef_t *rect, float scale, vec4_t color) {
line 1302
;1301:
;1302:	if (uiInfo.serverStatus.currentServerPreview > 0) {
ADDRGP4 uiInfo+99264+10428
INDIRI4
CNSTI4 0
LEI4 $987
line 1303
;1303:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.serverStatus.currentServerPreview);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 uiInfo+99264+10428
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1304
;1304:	} else {
ADDRGP4 $988
JUMPV
LABELV $987
line 1305
;1305:		UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, trap_R_RegisterShaderNoMip("menu/art/unknownmap"));
ADDRGP4 $903
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1306
;1306:	}
LABELV $988
line 1307
;1307:}
LABELV $986
endproc UI_DrawNetMapPreview 8 20
proc UI_DrawNetMapCinematic 4 20
line 1309
;1308:
;1309:static void UI_DrawNetMapCinematic(rectDef_t *rect, float scale, vec4_t color) {
line 1310
;1310:	if (ui_currentNetMap.integer < 0 || ui_currentNetMap.integer > uiInfo.mapCount) {
ADDRGP4 ui_currentNetMap+12
INDIRI4
CNSTI4 0
LTI4 $999
ADDRGP4 ui_currentNetMap+12
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LEI4 $994
LABELV $999
line 1311
;1311:		ui_currentNetMap.integer = 0;
ADDRGP4 ui_currentNetMap+12
CNSTI4 0
ASGNI4
line 1312
;1312:		trap_Cvar_Set("ui_currentNetMap", "0");
ADDRGP4 $886
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1313
;1313:	}
LABELV $994
line 1315
;1314:
;1315:	if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+99264+10432
INDIRI4
CNSTI4 0
LTI4 $1001
line 1316
;1316:	  trap_CIN_RunCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+99264+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 1317
;1317:	  trap_CIN_SetExtents(uiInfo.serverStatus.currentServerCinematic, rect->x, rect->y, rect->w, rect->h);
ADDRGP4 uiInfo+99264+10432
INDIRI4
ARGI4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 1318
;1318: 	  trap_CIN_DrawCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+99264+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 1319
;1319:	} else {
ADDRGP4 $1002
JUMPV
LABELV $1001
line 1320
;1320:		UI_DrawNetMapPreview(rect, scale, color);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapPreview
CALLV
pop
line 1321
;1321:	}
LABELV $1002
line 1322
;1322:}
LABELV $993
endproc UI_DrawNetMapCinematic 4 20
proc UI_DrawNetFilter 8 32
line 1326
;1323:
;1324:
;1325:
;1326:static void UI_DrawNetFilter(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1327
;1327:	if (ui_serverFilterType.integer < 0 || ui_serverFilterType.integer > numServerFilters) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LTI4 $1016
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LEI4 $1012
LABELV $1016
line 1328
;1328:		ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 1329
;1329:	}
LABELV $1012
line 1330
;1330:  Text_Paint(rect->x, rect->y, scale, color, va("Filter: %s", serverFilters[ui_serverFilterType.integer].description), 0, 0, textStyle);
ADDRGP4 $1018
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1331
;1331:}
LABELV $1011
endproc UI_DrawNetFilter 8 32
proc UI_DrawTier 20 32
line 1334
;1332:
;1333:
;1334:static void UI_DrawTier(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1336
;1335:  int i;
;1336:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1021
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1337
;1337:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1025
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+96028
INDIRI4
LTI4 $1022
LABELV $1025
line 1338
;1338:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1339
;1339:  }
LABELV $1022
line 1340
;1340:  Text_Paint(rect->x, rect->y, scale, color, va("Tier: %s", uiInfo.tierList[i].tierName),0, 0, textStyle);
ADDRGP4 $1026
ARGP4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+96032
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1341
;1341:}
LABELV $1020
endproc UI_DrawTier 20 32
proc UI_DrawTierMap 28 20
line 1343
;1342:
;1343:static void UI_DrawTierMap(rectDef_t *rect, int index) {
line 1345
;1344:  int i;
;1345:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1021
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 1346
;1346:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1032
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+96028
INDIRI4
LTI4 $1029
LABELV $1032
line 1347
;1347:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1348
;1348:  }
LABELV $1029
line 1350
;1349:
;1350:	if (uiInfo.tierList[i].mapHandles[index] == -1) {
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+96032+28
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1033
line 1351
;1351:		uiInfo.tierList[i].mapHandles[index] = trap_R_RegisterShaderNoMip(va("levelshots/%s", uiInfo.tierList[i].maps[index]));
ADDRGP4 $1039
ARGP4
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 16
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+96032+4
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+96032+28
ADDP4
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1352
;1352:	}
LABELV $1033
line 1354
;1353:												 
;1354:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.tierList[i].mapHandles[index]);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+96032+28
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1355
;1355:}
LABELV $1028
endproc UI_DrawTierMap 28 20
proc UI_EnglishMapName 8 8
line 1357
;1356:
;1357:static const char *UI_EnglishMapName(const char *map) {
line 1359
;1358:	int i;
;1359:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1048
JUMPV
LABELV $1045
line 1360
;1360:		if (Q_stricmp(map, uiInfo.mapList[i].mapLoadName) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1050
line 1361
;1361:			return uiInfo.mapList[i].mapName;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228
ADDP4
INDIRP4
RETP4
ADDRGP4 $1044
JUMPV
LABELV $1050
line 1363
;1362:		}
;1363:	}
LABELV $1046
line 1359
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1048
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LTI4 $1045
line 1364
;1364:	return "";
ADDRGP4 $109
RETP4
LABELV $1044
endproc UI_EnglishMapName 8 8
proc UI_DrawTierMapName 32 32
line 1367
;1365:}
;1366:
;1367:static void UI_DrawTierMapName(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1369
;1368:  int i, j;
;1369:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1021
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 1370
;1370:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1059
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+96028
INDIRI4
LTI4 $1056
LABELV $1059
line 1371
;1371:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1372
;1372:  }
LABELV $1056
line 1373
;1373:	j = trap_Cvar_VariableValue("ui_currentMap");
ADDRGP4 $888
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1374
;1374:	if (j < 0 || j > MAPS_PER_TIER) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1062
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1060
LABELV $1062
line 1375
;1375:		j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1376
;1376:	}
LABELV $1060
line 1378
;1377:
;1378:  Text_Paint(rect->x, rect->y, scale, color, UI_EnglishMapName(uiInfo.tierList[i].maps[j]), 0, 0, textStyle);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+96032+4
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 UI_EnglishMapName
CALLP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRF4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1379
;1379:}
LABELV $1055
endproc UI_DrawTierMapName 32 32
proc UI_DrawTierGameType 28 32
line 1381
;1380:
;1381:static void UI_DrawTierGameType(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1383
;1382:  int i, j;
;1383:	i = trap_Cvar_VariableValue( "ui_currentTier" );
ADDRGP4 $1021
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 1384
;1384:  if (i < 0 || i >= uiInfo.tierCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1069
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+96028
INDIRI4
LTI4 $1066
LABELV $1069
line 1385
;1385:    i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1386
;1386:  }
LABELV $1066
line 1387
;1387:	j = trap_Cvar_VariableValue("ui_currentMap");
ADDRGP4 $888
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1388
;1388:	if (j < 0 || j > MAPS_PER_TIER) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1072
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $1070
LABELV $1072
line 1389
;1389:		j = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1390
;1390:	}
LABELV $1070
line 1392
;1391:
;1392:  Text_Paint(rect->x, rect->y, scale, color, uiInfo.gameTypes[uiInfo.tierList[i].gameTypes[j]].gameType , 0, 0, textStyle);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRF4
ARGF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+96032+16
ADDP4
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1393
;1393:}
LABELV $1065
endproc UI_DrawTierGameType 28 32
proc UI_AIFromName 8 8
line 1403
;1394:
;1395:
;1396:#ifndef MISSIONPACK // bk001206
;1397:static const char *UI_OpponentLeaderName() {
;1398:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
;1399:	return uiInfo.teamList[i].teamMembers[0];
;1400:}
;1401:#endif
;1402:
;1403:static const char *UI_AIFromName(const char *name) {
line 1405
;1404:	int j;
;1405:	for (j = 0; j < uiInfo.aliasCount; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1080
JUMPV
LABELV $1077
line 1406
;1406:		if (Q_stricmp(uiInfo.aliasList[j].name, name) == 0) {
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1082
line 1407
;1407:			return uiInfo.aliasList[j].ai;
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+74988+4
ADDP4
INDIRP4
RETP4
ADDRGP4 $1076
JUMPV
LABELV $1082
line 1409
;1408:		}
;1409:	}
LABELV $1078
line 1405
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1080
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+74984
INDIRI4
LTI4 $1077
line 1410
;1410:	return "James";
ADDRGP4 $1087
RETP4
LABELV $1076
endproc UI_AIFromName 8 8
data
align 4
LABELV updateOpponentModel
byte 4 1
bss
align 4
LABELV $1089
skip 1276
code
proc UI_DrawOpponent 420 28
line 1460
;1411:}
;1412:
;1413:#ifndef MISSIONPACK // bk001206
;1414:static const int UI_AIIndex(const char *name) {
;1415:	int j;
;1416:	for (j = 0; j < uiInfo.characterCount; j++) {
;1417:		if (Q_stricmp(name, uiInfo.characterList[j].name) == 0) {
;1418:			return j;
;1419:		}
;1420:	}
;1421:	return 0;
;1422:}
;1423:#endif
;1424:
;1425:#ifndef MISSIONPACK // bk001206
;1426:static const int UI_AIIndexFromName(const char *name) {
;1427:	int j;
;1428:	for (j = 0; j < uiInfo.aliasCount; j++) {
;1429:		if (Q_stricmp(uiInfo.aliasList[j].name, name) == 0) {
;1430:			return UI_AIIndex(uiInfo.aliasList[j].ai);
;1431:		}
;1432:	}
;1433:	return 0;
;1434:}
;1435:#endif
;1436:
;1437:
;1438:#ifndef MISSIONPACK // bk001206
;1439:static const char *UI_OpponentLeaderHead() {
;1440:	const char *leader = UI_OpponentLeaderName();
;1441:	return UI_AIFromName(leader);
;1442:}
;1443:#endif
;1444:
;1445:#ifndef MISSIONPACK // bk001206
;1446:static const char *UI_OpponentLeaderModel() {
;1447:	int i;
;1448:	const char *head = UI_OpponentLeaderHead();
;1449:	for (i = 0; i < uiInfo.characterCount; i++) {
;1450:		if (Q_stricmp(head, uiInfo.characterList[i].name) == 0) {
;1451:			return uiInfo.characterList[i].base;
;1452:		}
;1453:	}
;1454:	return "James";
;1455:}
;1456:#endif
;1457:
;1458:
;1459:static qboolean updateOpponentModel = qtrue;
;1460:static void UI_DrawOpponent(rectDef_t *rect) {
line 1468
;1461:  static playerInfo_t info2;
;1462:  char model[MAX_QPATH];
;1463:  char headmodel[MAX_QPATH];
;1464:  char team[256];
;1465:	vec3_t	viewangles;
;1466:	vec3_t	moveangles;
;1467:  
;1468:	if (updateOpponentModel) {
ADDRGP4 updateOpponentModel
INDIRI4
CNSTI4 0
EQI4 $1090
line 1470
;1469:		
;1470:		strcpy(model, UI_Cvar_VariableString("ui_opponentModel"));
ADDRGP4 $1092
ARGP4
ADDRLP4 408
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1471
;1471:	  strcpy(headmodel, UI_Cvar_VariableString("ui_opponentModel"));
ADDRGP4 $1092
ARGP4
ADDRLP4 412
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 76
ARGP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1472
;1472:		team[0] = '\0';
ADDRLP4 152
CNSTI1 0
ASGNI1
line 1474
;1473:
;1474:  	memset( &info2, 0, sizeof(playerInfo_t) );
ADDRGP4 $1089
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1276
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1475
;1475:  	viewangles[YAW]   = 180 - 10;
ADDRLP4 0+4
CNSTF4 1126825984
ASGNF4
line 1476
;1476:  	viewangles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1477
;1477:  	viewangles[ROLL]  = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1478
;1478:  	VectorClear( moveangles );
ADDRLP4 416
CNSTF4 0
ASGNF4
ADDRLP4 140+8
ADDRLP4 416
INDIRF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 416
INDIRF4
ASGNF4
ADDRLP4 140
ADDRLP4 416
INDIRF4
ASGNF4
line 1479
;1479:    UI_PlayerInfo_SetModel( &info2, model, headmodel, "");
ADDRGP4 $1089
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 $109
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 1480
;1480:    UI_PlayerInfo_SetInfo( &info2, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse );
ADDRGP4 $1089
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 1481
;1481:		UI_RegisterClientModelname( &info2, model, headmodel, team);
ADDRGP4 $1089
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 UI_RegisterClientModelname
CALLI4
pop
line 1482
;1482:    updateOpponentModel = qfalse;
ADDRGP4 updateOpponentModel
CNSTI4 0
ASGNI4
line 1483
;1483:  }
LABELV $1090
line 1485
;1484:
;1485:  UI_DrawPlayer( rect->x, rect->y, rect->w, rect->h, &info2, uiInfo.uiDC.realTime / 2);
ADDRLP4 408
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 408
INDIRP4
INDIRF4
ARGF4
ADDRLP4 408
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 408
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 408
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRGP4 $1089
ARGP4
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 1487
;1486:
;1487:}
LABELV $1088
endproc UI_DrawOpponent 420 28
proc UI_NextOpponent 24 8
line 1489
;1488:
;1489:static void UI_NextOpponent() {
line 1490
;1490:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1099
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1491
;1491:  int j = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 1492
;1492:	i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1493
;1493:	if (i >= uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
LTI4 $1100
line 1494
;1494:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1495
;1495:	}
LABELV $1100
line 1496
;1496:	if (i == j) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1103
line 1497
;1497:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1498
;1498:		if ( i >= uiInfo.teamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
LTI4 $1105
line 1499
;1499:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1500
;1500:		}
LABELV $1105
line 1501
;1501:	}
LABELV $1103
line 1502
;1502: 	trap_Cvar_Set( "ui_opponentName", uiInfo.teamList[i].teamName );
ADDRGP4 $1099
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1503
;1503:}
LABELV $1098
endproc UI_NextOpponent 24 8
proc UI_PriorOpponent 24 8
line 1505
;1504:
;1505:static void UI_PriorOpponent() {
line 1506
;1506:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1099
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1507
;1507:  int j = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 16
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 1508
;1508:	i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1509
;1509:	if (i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1110
line 1510
;1510:		i = uiInfo.teamCount - 1;
ADDRLP4 0
ADDRGP4 uiInfo+75756
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1511
;1511:	}
LABELV $1110
line 1512
;1512:	if (i == j) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1113
line 1513
;1513:		i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1514
;1514:		if ( i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1115
line 1515
;1515:			i = uiInfo.teamCount - 1;
ADDRLP4 0
ADDRGP4 uiInfo+75756
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1516
;1516:		}
LABELV $1115
line 1517
;1517:	}
LABELV $1113
line 1518
;1518: 	trap_Cvar_Set( "ui_opponentName", uiInfo.teamList[i].teamName );
ADDRGP4 $1099
ARGP4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1519
;1519:}
LABELV $1109
endproc UI_PriorOpponent 24 8
proc UI_DrawPlayerLogo 44 20
line 1521
;1520:
;1521:static void	UI_DrawPlayerLogo(rectDef_t *rect, vec3_t color) {
line 1522
;1522:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1524
;1523:
;1524:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1120
line 1525
;1525:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1526
;1526:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $766
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1527
;1527:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $771
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1528
;1528:	}
LABELV $1120
line 1530
;1529:
;1530: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1531
;1531:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1532
;1532: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1533
;1533:}
LABELV $1119
endproc UI_DrawPlayerLogo 44 20
proc UI_DrawPlayerLogoMetal 44 20
line 1535
;1534:
;1535:static void	UI_DrawPlayerLogoMetal(rectDef_t *rect, vec3_t color) {
line 1536
;1536:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1537
;1537:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1139
line 1538
;1538:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1539
;1539:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $766
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1540
;1540:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $771
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1541
;1541:	}
LABELV $1139
line 1543
;1542:
;1543: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1544
;1544:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1545
;1545: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1546
;1546:}
LABELV $1138
endproc UI_DrawPlayerLogoMetal 44 20
proc UI_DrawPlayerLogoName 44 20
line 1548
;1547:
;1548:static void	UI_DrawPlayerLogoName(rectDef_t *rect, vec3_t color) {
line 1549
;1549:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1550
;1550:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1158
line 1551
;1551:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1552
;1552:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $766
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1553
;1553:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $771
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1554
;1554:	}
LABELV $1158
line 1556
;1555:
;1556: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1557
;1557:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Name );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+36
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1558
;1558: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1559
;1559:}
LABELV $1157
endproc UI_DrawPlayerLogoName 44 20
proc UI_DrawOpponentLogo 44 20
line 1561
;1560:
;1561:static void	UI_DrawOpponentLogo(rectDef_t *rect, vec3_t color) {
line 1562
;1562:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1099
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1563
;1563:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1177
line 1564
;1564:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1565
;1565:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $766
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1566
;1566:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $771
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1567
;1567:	}
LABELV $1177
line 1569
;1568:
;1569: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1570
;1570:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1571
;1571: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1572
;1572:}
LABELV $1176
endproc UI_DrawOpponentLogo 44 20
proc UI_DrawOpponentLogoMetal 44 20
line 1574
;1573:
;1574:static void	UI_DrawOpponentLogoMetal(rectDef_t *rect, vec3_t color) {
line 1575
;1575:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1099
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1576
;1576:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1196
line 1577
;1577:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1578
;1578:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $766
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1579
;1579:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $771
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1580
;1580:	}
LABELV $1196
line 1582
;1581:
;1582: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1583
;1583:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Metal );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+32
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1584
;1584: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1585
;1585:}
LABELV $1195
endproc UI_DrawOpponentLogoMetal 44 20
proc UI_DrawOpponentLogoName 44 20
line 1587
;1586:
;1587:static void	UI_DrawOpponentLogoName(rectDef_t *rect, vec3_t color) {
line 1588
;1588:  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1099
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1589
;1589:	if (uiInfo.teamList[i].teamIcon == -1) {
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1215
line 1590
;1590:    uiInfo.teamList[i].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[i].imageName);
ADDRLP4 12
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1591
;1591:    uiInfo.teamList[i].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[i].imageName));
ADDRGP4 $766
ARGP4
ADDRLP4 20
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1592
;1592:    uiInfo.teamList[i].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[i].imageName));
ADDRGP4 $771
ARGP4
ADDRLP4 32
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1593
;1593:	}
LABELV $1215
line 1595
;1594:
;1595: 	trap_R_SetColor( color );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1596
;1596:	UI_DrawHandlePic( rect->x, rect->y, rect->w, rect->h, uiInfo.teamList[i].teamIcon_Name );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
CNSTI4 44
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+36
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1597
;1597: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1598
;1598:}
LABELV $1214
endproc UI_DrawOpponentLogoName 44 20
proc UI_DrawAllMapsSelection 16 32
line 1600
;1599:
;1600:static void UI_DrawAllMapsSelection(rectDef_t *rect, float scale, vec4_t color, int textStyle, qboolean net) {
line 1601
;1601:	int map = (net) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $1237
ADDRLP4 4
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $1238
JUMPV
LABELV $1237
ADDRLP4 4
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $1238
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1602
;1602:	if (map >= 0 && map < uiInfo.mapCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1239
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
GEI4 $1239
line 1603
;1603:	  Text_Paint(rect->x, rect->y, scale, color, uiInfo.mapList[map].mapName, 0, 0, textStyle);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1604
;1604:	}
LABELV $1239
line 1605
;1605:}
LABELV $1233
endproc UI_DrawAllMapsSelection 16 32
proc UI_DrawOpponentName 8 32
line 1607
;1606:
;1607:static void UI_DrawOpponentName(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1608
;1608:  Text_Paint(rect->x, rect->y, scale, color, UI_Cvar_VariableString("ui_opponentName"), 0, 0, textStyle);
ADDRGP4 $1099
ARGP4
ADDRLP4 0
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1609
;1609:}
LABELV $1243
endproc UI_DrawOpponentName 8 32
proc UI_OwnerDrawWidth 112 12
line 1612
;1610:
;1611:
;1612:static int UI_OwnerDrawWidth(int ownerDraw, float scale) {
line 1615
;1613:	int i, h, value;
;1614:	const char *text;
;1615:	const char *s = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1617
;1616:
;1617:  switch (ownerDraw) {
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 200
LTI4 $1246
ADDRLP4 20
INDIRI4
CNSTI4 247
GTI4 $1316
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1317-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1317
address $1247
address $1246
address $1246
address $1248
address $1246
address $1249
address $1246
address $1252
address $1257
address $1262
address $1267
address $1267
address $1267
address $1267
address $1267
address $1277
address $1277
address $1277
address $1277
address $1277
address $1286
address $1246
address $1295
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1246
address $1313
code
LABELV $1316
ADDRFP4 0
INDIRI4
CNSTI4 250
EQI4 $1308
ADDRGP4 $1246
JUMPV
LABELV $1247
line 1619
;1618:    case UI_HANDICAP:
;1619:			  h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $696
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 1620
;1620:				i = 20 - h / 5;
ADDRLP4 4
CNSTI4 20
ADDRLP4 16
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 1621
;1621:				s = handicapValues[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicapValues
ADDP4
INDIRP4
ASGNP4
line 1622
;1622:      break;
ADDRGP4 $1246
JUMPV
LABELV $1248
line 1624
;1623:    case UI_CLANNAME:
;1624:				s = UI_Cvar_VariableString("ui_teamName");
ADDRGP4 $698
ARGP4
ADDRLP4 32
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 1625
;1625:      break;
ADDRGP4 $1246
JUMPV
LABELV $1249
line 1627
;1626:    case UI_GAMETYPE:
;1627:				s = uiInfo.gameTypes[ui_gameType.integer].gameType;
ADDRLP4 0
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580
ADDP4
INDIRP4
ASGNP4
line 1628
;1628:      break;
ADDRGP4 $1246
JUMPV
LABELV $1252
line 1630
;1629:    case UI_SKILL:
;1630:				i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $824
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 1631
;1631:				if (i < 1 || i > numSkillLevels) {
ADDRLP4 40
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
LTI4 $1255
ADDRLP4 40
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $1253
LABELV $1255
line 1632
;1632:					i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1633
;1633:				}
LABELV $1253
line 1634
;1634:			  s = skillLevels[i-1];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels-4
ADDP4
INDIRP4
ASGNP4
line 1635
;1635:      break;
ADDRGP4 $1246
JUMPV
LABELV $1257
line 1637
;1636:    case UI_BLUETEAMNAME:
;1637:			  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_blueTeam"));
ADDRGP4 $830
ARGP4
ADDRLP4 44
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 48
INDIRI4
ASGNI4
line 1638
;1638:			  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 52
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $1246
ADDRLP4 52
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
GEI4 $1246
line 1639
;1639:			    s = va("%s: %s", "Blue", uiInfo.teamList[i].teamName);
ADDRGP4 $838
ARGP4
ADDRGP4 $839
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 1640
;1640:			  }
line 1641
;1641:      break;
ADDRGP4 $1246
JUMPV
LABELV $1262
line 1643
;1642:    case UI_REDTEAMNAME:
;1643:			  i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_redTeam"));
ADDRGP4 $831
ARGP4
ADDRLP4 56
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
ASGNI4
line 1644
;1644:			  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 64
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
LTI4 $1246
ADDRLP4 64
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
GEI4 $1246
line 1645
;1645:			    s = va("%s: %s", "Red", uiInfo.teamList[i].teamName);
ADDRGP4 $838
ARGP4
ADDRGP4 $840
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 1646
;1646:			  }
line 1647
;1647:      break;
ADDRGP4 $1246
JUMPV
LABELV $1267
line 1653
;1648:    case UI_BLUETEAM1:
;1649:		case UI_BLUETEAM2:
;1650:		case UI_BLUETEAM3:
;1651:		case UI_BLUETEAM4:
;1652:		case UI_BLUETEAM5:
;1653:			value = trap_Cvar_VariableValue(va("ui_blueteam%i", ownerDraw-UI_BLUETEAM1 + 1));
ADDRGP4 $846
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 210
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 72
INDIRF4
CVFI4 4
ASGNI4
line 1654
;1654:			if (value <= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $1268
line 1655
;1655:				text = "Closed";
ADDRLP4 12
ADDRGP4 $853
ASGNP4
line 1656
;1656:			} else if (value == 1) {
ADDRGP4 $1269
JUMPV
LABELV $1268
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $1270
line 1657
;1657:				text = "Human";
ADDRLP4 12
ADDRGP4 $856
ASGNP4
line 1658
;1658:			} else {
ADDRGP4 $1271
JUMPV
LABELV $1270
line 1659
;1659:				value -= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1660
;1660:				if (value >= uiInfo.aliasCount) {
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+74984
INDIRI4
LTI4 $1272
line 1661
;1661:					value = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1662
;1662:				}
LABELV $1272
line 1663
;1663:				text = uiInfo.aliasList[value].name;
ADDRLP4 12
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
INDIRP4
ASGNP4
line 1664
;1664:			}
LABELV $1271
LABELV $1269
line 1665
;1665:			s = va("%i. %s", ownerDraw-UI_BLUETEAM1 + 1, text);
ADDRGP4 $1276
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 210
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 76
INDIRP4
ASGNP4
line 1666
;1666:      break;
ADDRGP4 $1246
JUMPV
LABELV $1277
line 1672
;1667:    case UI_REDTEAM1:
;1668:		case UI_REDTEAM2:
;1669:		case UI_REDTEAM3:
;1670:		case UI_REDTEAM4:
;1671:		case UI_REDTEAM5:
;1672:			value = trap_Cvar_VariableValue(va("ui_redteam%i", ownerDraw-UI_REDTEAM1 + 1));
ADDRGP4 $847
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 84
INDIRF4
CVFI4 4
ASGNI4
line 1673
;1673:			if (value <= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $1278
line 1674
;1674:				text = "Closed";
ADDRLP4 12
ADDRGP4 $853
ASGNP4
line 1675
;1675:			} else if (value == 1) {
ADDRGP4 $1279
JUMPV
LABELV $1278
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $1280
line 1676
;1676:				text = "Human";
ADDRLP4 12
ADDRGP4 $856
ASGNP4
line 1677
;1677:			} else {
ADDRGP4 $1281
JUMPV
LABELV $1280
line 1678
;1678:				value -= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1679
;1679:				if (value >= uiInfo.aliasCount) {
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+74984
INDIRI4
LTI4 $1282
line 1680
;1680:					value = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1681
;1681:				}
LABELV $1282
line 1682
;1682:				text = uiInfo.aliasList[value].name;
ADDRLP4 12
CNSTI4 12
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
INDIRP4
ASGNP4
line 1683
;1683:			}
LABELV $1281
LABELV $1279
line 1684
;1684:			s = va("%i. %s", ownerDraw-UI_REDTEAM1 + 1, text);
ADDRGP4 $1276
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
ASGNP4
line 1685
;1685:      break;
ADDRGP4 $1246
JUMPV
LABELV $1286
line 1687
;1686:		case UI_NETSOURCE:
;1687:			if (ui_netSource.integer < 0 || ui_netSource.integer > uiInfo.numJoinGameTypes) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
LTI4 $1292
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 uiInfo+78708
INDIRI4
LEI4 $1287
LABELV $1292
line 1688
;1688:				ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 1689
;1689:			}
LABELV $1287
line 1690
;1690:			s = va("Source: %s", netSources[ui_netSource.integer]);
ADDRGP4 $984
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netSources
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 92
INDIRP4
ASGNP4
line 1691
;1691:			break;
ADDRGP4 $1246
JUMPV
LABELV $1295
line 1693
;1692:		case UI_NETFILTER:
;1693:			if (ui_serverFilterType.integer < 0 || ui_serverFilterType.integer > numServerFilters) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LTI4 $1300
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LEI4 $1296
LABELV $1300
line 1694
;1694:				ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 1695
;1695:			}
LABELV $1296
line 1696
;1696:			s = va("Filter: %s", serverFilters[ui_serverFilterType.integer].description );
ADDRGP4 $1018
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters
ADDP4
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 96
INDIRP4
ASGNP4
line 1697
;1697:			break;
ADDRGP4 $1246
JUMPV
line 1699
;1698:		case UI_TIER:
;1699:			break;
line 1701
;1700:		case UI_TIER_MAPNAME:
;1701:			break;
line 1703
;1702:		case UI_TIER_GAMETYPE:
;1703:			break;
line 1705
;1704:		case UI_ALLMAPS_SELECTION:
;1705:			break;
line 1707
;1706:		case UI_OPPONENT_NAME:
;1707:			break;
LABELV $1308
line 1709
;1708:		case UI_KEYBINDSTATUS:
;1709:			if (Display_KeyBindPending()) {
ADDRLP4 100
ADDRGP4 Display_KeyBindPending
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $1309
line 1710
;1710:				s = "Waiting for new key... Press ESCAPE to cancel";
ADDRLP4 0
ADDRGP4 $1311
ASGNP4
line 1711
;1711:			} else {
ADDRGP4 $1246
JUMPV
LABELV $1309
line 1712
;1712:				s = "Press ENTER or CLICK to change, Press BACKSPACE to clear";
ADDRLP4 0
ADDRGP4 $1312
ASGNP4
line 1713
;1713:			}
line 1714
;1714:			break;
ADDRGP4 $1246
JUMPV
LABELV $1313
line 1716
;1715:		case UI_SERVERREFRESHDATE:
;1716:			s = UI_Cvar_VariableString(va("ui_lastServerRefresh_%i", ui_netSource.integer));
ADDRGP4 $1314
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRP4
ASGNP4
line 1717
;1717:			break;
line 1719
;1718:    default:
;1719:      break;
LABELV $1246
line 1722
;1720:  }
;1721:
;1722:	if (s) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1319
line 1723
;1723:		return Text_Width(s, scale, 0);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $1244
JUMPV
LABELV $1319
line 1725
;1724:	}
;1725:	return 0;
CNSTI4 0
RETI4
LABELV $1244
endproc UI_OwnerDrawWidth 112 12
proc UI_DrawBotName 24 32
line 1728
;1726:}
;1727:
;1728:static void UI_DrawBotName(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1729
;1729:	int value = uiInfo.botIndex;
ADDRLP4 0
ADDRGP4 uiInfo+73444
INDIRI4
ASGNI4
line 1730
;1730:	int game = trap_Cvar_VariableValue("g_gametype");
ADDRGP4 $1323
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1731
;1731:	const char *text = "";
ADDRLP4 4
ADDRGP4 $109
ASGNP4
line 1732
;1732:	if (game >= GT_TEAM) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LTI4 $1324
line 1733
;1733:		if (value >= uiInfo.characterCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
LTI4 $1326
line 1734
;1734:			value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1735
;1735:		}
LABELV $1326
line 1736
;1736:		text = uiInfo.characterList[value].name;
ADDRLP4 4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ASGNP4
line 1737
;1737:	} else {
ADDRGP4 $1325
JUMPV
LABELV $1324
line 1738
;1738:		if (value >= UI_GetNumBots()) {
ADDRLP4 16
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $1330
line 1739
;1739:			value = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1740
;1740:		}
LABELV $1330
line 1741
;1741:		text = UI_GetBotNameByNumber(value);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 1742
;1742:	}
LABELV $1325
line 1743
;1743:  Text_Paint(rect->x, rect->y, scale, color, text, 0, 0, textStyle);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1744
;1744:}
LABELV $1321
endproc UI_DrawBotName 24 32
proc UI_DrawBotSkill 4 32
line 1746
;1745:
;1746:static void UI_DrawBotSkill(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1747
;1747:	if (uiInfo.skillIndex >= 0 && uiInfo.skillIndex < numSkillLevels) {
ADDRGP4 uiInfo+96672
INDIRI4
CNSTI4 0
LTI4 $1333
ADDRGP4 uiInfo+96672
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
GEI4 $1333
line 1748
;1748:	  Text_Paint(rect->x, rect->y, scale, color, skillLevels[uiInfo.skillIndex], 0, 0, textStyle);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+96672
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillLevels
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1749
;1749:	}
LABELV $1333
line 1750
;1750:}
LABELV $1332
endproc UI_DrawBotSkill 4 32
proc UI_DrawRedBlue 8 32
line 1752
;1751:
;1752:static void UI_DrawRedBlue(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1753
;1753:  Text_Paint(rect->x, rect->y, scale, color, (uiInfo.redBlue == 0) ? "Red" : "Blue", 0, 0, textStyle);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+78840
INDIRI4
CNSTI4 0
NEI4 $1341
ADDRLP4 0
ADDRGP4 $840
ASGNP4
ADDRGP4 $1342
JUMPV
LABELV $1341
ADDRLP4 0
ADDRGP4 $839
ASGNP4
LABELV $1342
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1754
;1754:}
LABELV $1338
endproc UI_DrawRedBlue 8 32
proc UI_DrawCrosshair 8 20
line 1756
;1755:
;1756:static void UI_DrawCrosshair(rectDef_t *rect, float scale, vec4_t color) {
line 1757
;1757: 	trap_R_SetColor( color );
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1758
;1758:	if (uiInfo.currentCrosshair < 0 || uiInfo.currentCrosshair >= NUM_CROSSHAIRS) {
ADDRGP4 uiInfo+119476
INDIRI4
CNSTI4 0
LTI4 $1348
ADDRGP4 uiInfo+119476
INDIRI4
CNSTI4 10
LTI4 $1344
LABELV $1348
line 1759
;1759:		uiInfo.currentCrosshair = 0;
ADDRGP4 uiInfo+119476
CNSTI4 0
ASGNI4
line 1760
;1760:	}
LABELV $1344
line 1761
;1761:	UI_DrawHandlePic( rect->x, rect->y - rect->h, rect->w, rect->h, uiInfo.uiDC.Assets.crosshairShader[uiInfo.currentCrosshair]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 uiInfo+119476
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+228+61800
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 1762
;1762: 	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1763
;1763:}
LABELV $1343
endproc UI_DrawCrosshair 8 20
proc UI_BuildPlayerList 4176 12
line 1770
;1764:
;1765:/*
;1766:===============
;1767:UI_BuildPlayerList
;1768:===============
;1769:*/
;1770:static void UI_BuildPlayerList() {
line 1775
;1771:	uiClientState_t	cs;
;1772:	int		n, count, team, team2, playerTeamNumber;
;1773:	char	info[MAX_INFO_STRING];
;1774:
;1775:	trap_GetClientState( &cs );
ADDRLP4 1040
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 1776
;1776:	trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
ADDRLP4 1040+8
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1777
;1777:	uiInfo.playerNumber = cs.clientNum;
ADDRGP4 uiInfo+78864
ADDRLP4 1040+8
INDIRI4
ASGNI4
line 1778
;1778:	uiInfo.teamLeader = atoi(Info_ValueForKey(info, "tl"));
ADDRLP4 4
ARGP4
ADDRGP4 $1358
ARGP4
ADDRLP4 4128
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4128
INDIRP4
ARGP4
ADDRLP4 4132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 uiInfo+78868
ADDRLP4 4132
INDIRI4
ASGNI4
line 1779
;1779:	team = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 4
ARGP4
ADDRGP4 $1359
ARGP4
ADDRLP4 4136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4136
INDIRP4
ARGP4
ADDRLP4 4140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 4140
INDIRI4
ASGNI4
line 1780
;1780:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1781
;1781:	count = atoi( Info_ValueForKey( info, "sv_maxclients" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $1360
ARGP4
ADDRLP4 4144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4144
INDIRP4
ARGP4
ADDRLP4 4148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 4148
INDIRI4
ASGNI4
line 1782
;1782:	uiInfo.playerCount = 0;
ADDRGP4 uiInfo+78844
CNSTI4 0
ASGNI4
line 1783
;1783:	uiInfo.myTeamCount = 0;
ADDRGP4 uiInfo+78848
CNSTI4 0
ASGNI4
line 1784
;1784:	playerTeamNumber = 0;
ADDRLP4 4124
CNSTI4 0
ASGNI4
line 1785
;1785:	for( n = 0; n < count; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1366
JUMPV
LABELV $1363
line 1786
;1786:		trap_GetConfigString( CS_PLAYERS + n, info, MAX_INFO_STRING );
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 1788
;1787:
;1788:		if (info[0]) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1367
line 1789
;1789:			Q_strncpyz( uiInfo.playerNames[uiInfo.playerCount], Info_ValueForKey( info, "n" ), MAX_NAME_LENGTH );
ADDRLP4 4
ARGP4
ADDRGP4 $1371
ARGP4
ADDRLP4 4152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 uiInfo+78844
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78872
ADDP4
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1790
;1790:			Q_CleanStr( uiInfo.playerNames[uiInfo.playerCount] );
ADDRGP4 uiInfo+78844
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78872
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1791
;1791:			uiInfo.playerCount++;
ADDRLP4 4156
ADDRGP4 uiInfo+78844
ASGNP4
ADDRLP4 4156
INDIRP4
ADDRLP4 4156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1792
;1792:			team2 = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 4
ARGP4
ADDRGP4 $1359
ARGP4
ADDRLP4 4160
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 4164
INDIRI4
ASGNI4
line 1793
;1793:			if (team2 == team) {
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
NEI4 $1375
line 1794
;1794:				Q_strncpyz( uiInfo.teamNames[uiInfo.myTeamCount], Info_ValueForKey( info, "n" ), MAX_NAME_LENGTH );
ADDRLP4 4
ARGP4
ADDRGP4 $1371
ARGP4
ADDRLP4 4168
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 uiInfo+78848
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRLP4 4168
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1795
;1795:				Q_CleanStr( uiInfo.teamNames[uiInfo.myTeamCount] );
ADDRGP4 uiInfo+78848
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1796
;1796:				uiInfo.teamClientNums[uiInfo.myTeamCount] = n;
ADDRGP4 uiInfo+78848
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82968
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1797
;1797:				if (uiInfo.playerNumber == n) {
ADDRGP4 uiInfo+78864
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1383
line 1798
;1798:					playerTeamNumber = uiInfo.myTeamCount;
ADDRLP4 4124
ADDRGP4 uiInfo+78848
INDIRI4
ASGNI4
line 1799
;1799:				}
LABELV $1383
line 1800
;1800:				uiInfo.myTeamCount++;
ADDRLP4 4172
ADDRGP4 uiInfo+78848
ASGNP4
ADDRLP4 4172
INDIRP4
ADDRLP4 4172
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1801
;1801:			}
LABELV $1375
line 1802
;1802:		}
LABELV $1367
line 1803
;1803:	}
LABELV $1364
line 1785
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1366
ADDRLP4 0
INDIRI4
ADDRLP4 1028
INDIRI4
LTI4 $1363
line 1805
;1804:
;1805:	if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+78868
INDIRI4
CNSTI4 0
NEI4 $1388
line 1806
;1806:		trap_Cvar_Set("cg_selectedPlayer", va("%d", playerTeamNumber));
ADDRGP4 $713
ARGP4
ADDRLP4 4124
INDIRI4
ARGI4
ADDRLP4 4152
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1391
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1807
;1807:	}
LABELV $1388
line 1809
;1808:
;1809:	n = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1391
ARGP4
ADDRLP4 4152
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4152
INDIRF4
CVFI4 4
ASGNI4
line 1810
;1810:	if (n < 0 || n > uiInfo.myTeamCount) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1395
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
LEI4 $1392
LABELV $1395
line 1811
;1811:		n = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1812
;1812:	}
LABELV $1392
line 1813
;1813:	if (n < uiInfo.myTeamCount) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $1396
line 1814
;1814:		trap_Cvar_Set("cg_selectedPlayerName", uiInfo.teamNames[n]);
ADDRGP4 $1399
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1815
;1815:	}
LABELV $1396
line 1816
;1816:}
LABELV $1353
endproc UI_BuildPlayerList 4176 12
proc UI_DrawSelectedPlayer 16 32
line 1819
;1817:
;1818:
;1819:static void UI_DrawSelectedPlayer(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1820
;1820:	if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) {
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+78856
INDIRI4
LEI4 $1402
line 1821
;1821:		uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+78856
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1822
;1822:		UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 1823
;1823:	}
LABELV $1402
line 1824
;1824:  Text_Paint(rect->x, rect->y, scale, color, (uiInfo.teamLeader) ? UI_Cvar_VariableString("cg_selectedPlayerName") : UI_Cvar_VariableString("name") , 0, 0, textStyle);
ADDRGP4 uiInfo+78868
INDIRI4
CNSTI4 0
EQI4 $1411
ADDRGP4 $1399
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRGP4 $1412
JUMPV
LABELV $1411
ADDRGP4 $1409
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
LABELV $1412
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1825
;1825:}
LABELV $1401
endproc UI_DrawSelectedPlayer 16 32
proc UI_DrawServerRefreshDate 80 32
line 1827
;1826:
;1827:static void UI_DrawServerRefreshDate(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1828
;1828:	if (uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+99264+2212
INDIRI4
CNSTI4 0
EQI4 $1414
line 1830
;1829:		vec4_t lowLight, newColor;
;1830:		lowLight[0] = 0.8 * color[0]; 
ADDRLP4 0
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1831
;1831:		lowLight[1] = 0.8 * color[1]; 
ADDRLP4 0+4
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
line 1832
;1832:		lowLight[2] = 0.8 * color[2]; 
ADDRLP4 0+8
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 1833
;1833:		lowLight[3] = 0.8 * color[3]; 
ADDRLP4 0+12
CNSTF4 1061997773
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 1834
;1834:		LerpColor(color,lowLight,newColor,0.5+0.5*sin(uiInfo.uiDC.realTime / PULSE_DIVISOR));
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 1056964608
ADDRLP4 32
INDIRF4
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 LerpColor
CALLV
pop
line 1835
;1835:	  Text_Paint(rect->x, rect->y, scale, newColor, va("Getting info for %d servers (ESC to cancel)", trap_LAN_GetServerCount(ui_netSource.integer)), 0, 0, textStyle);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRGP4 $1422
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 16
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1836
;1836:	} else {
ADDRGP4 $1415
JUMPV
LABELV $1414
line 1838
;1837:		char buff[64];
;1838:		Q_strncpyz(buff, UI_Cvar_VariableString(va("ui_lastServerRefresh_%i", ui_netSource.integer)), 64);
ADDRGP4 $1314
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1839
;1839:	  Text_Paint(rect->x, rect->y, scale, color, va("Refresh Time: %s", buff), 0, 0, textStyle);
ADDRGP4 $1425
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
INDIRF4
ARGF4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1840
;1840:	}
LABELV $1415
line 1841
;1841:}
LABELV $1413
endproc UI_DrawServerRefreshDate 80 32
proc UI_DrawServerMOTD 24 32
line 1843
;1842:
;1843:static void UI_DrawServerMOTD(rectDef_t *rect, float scale, vec4_t color) {
line 1844
;1844:	if (uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+99264+10436
INDIRI4
CNSTI4 0
EQI4 $1427
line 1847
;1845:		float maxX;
;1846:	 
;1847:		if (uiInfo.serverStatus.motdWidth == -1) {
ADDRGP4 uiInfo+99264+10440
INDIRI4
CNSTI4 -1
NEI4 $1431
line 1848
;1848:			uiInfo.serverStatus.motdWidth = 0;
ADDRGP4 uiInfo+99264+10440
CNSTI4 0
ASGNI4
line 1849
;1849:			uiInfo.serverStatus.motdPaintX = rect->x + 1;
ADDRGP4 uiInfo+99264+10444
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1850
;1850:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+99264+10448
CNSTI4 -1
ASGNI4
line 1851
;1851:		}
LABELV $1431
line 1853
;1852:
;1853:		if (uiInfo.serverStatus.motdOffset > uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+99264+10452
INDIRI4
ADDRGP4 uiInfo+99264+10436
INDIRI4
LEI4 $1441
line 1854
;1854:			uiInfo.serverStatus.motdOffset = 0;
ADDRGP4 uiInfo+99264+10452
CNSTI4 0
ASGNI4
line 1855
;1855:			uiInfo.serverStatus.motdPaintX = rect->x + 1;
ADDRGP4 uiInfo+99264+10444
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1856
;1856:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+99264+10448
CNSTI4 -1
ASGNI4
line 1857
;1857:		}
LABELV $1441
line 1859
;1858:
;1859:		if (uiInfo.uiDC.realTime > uiInfo.serverStatus.motdTime) {
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+99264+10456
INDIRI4
LEI4 $1453
line 1860
;1860:			uiInfo.serverStatus.motdTime = uiInfo.uiDC.realTime + 10;
ADDRGP4 uiInfo+99264+10456
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1861
;1861:			if (uiInfo.serverStatus.motdPaintX <= rect->x + 2) {
ADDRGP4 uiInfo+99264+10444
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
GTF4 $1461
line 1862
;1862:				if (uiInfo.serverStatus.motdOffset < uiInfo.serverStatus.motdLen) {
ADDRGP4 uiInfo+99264+10452
INDIRI4
ADDRGP4 uiInfo+99264+10436
INDIRI4
GEI4 $1465
line 1863
;1863:					uiInfo.serverStatus.motdPaintX += Text_Width(&uiInfo.serverStatus.motd[uiInfo.serverStatus.motdOffset], scale, 1) - 1;
ADDRGP4 uiInfo+99264+10452
INDIRI4
ADDRGP4 uiInfo+99264+10460
ADDP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 8
ADDRGP4 uiInfo+99264+10444
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ADDI4
ASGNI4
line 1864
;1864:					uiInfo.serverStatus.motdOffset++;
ADDRLP4 12
ADDRGP4 uiInfo+99264+10452
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1865
;1865:				} else {
ADDRGP4 $1462
JUMPV
LABELV $1465
line 1866
;1866:					uiInfo.serverStatus.motdOffset = 0;
ADDRGP4 uiInfo+99264+10452
CNSTI4 0
ASGNI4
line 1867
;1867:					if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+99264+10448
INDIRI4
CNSTI4 0
LTI4 $1481
line 1868
;1868:						uiInfo.serverStatus.motdPaintX = uiInfo.serverStatus.motdPaintX2;
ADDRGP4 uiInfo+99264+10444
ADDRGP4 uiInfo+99264+10448
INDIRI4
ASGNI4
line 1869
;1869:					} else {
ADDRGP4 $1482
JUMPV
LABELV $1481
line 1870
;1870:						uiInfo.serverStatus.motdPaintX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 uiInfo+99264+10444
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 1871
;1871:					}
LABELV $1482
line 1872
;1872:					uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+99264+10448
CNSTI4 -1
ASGNI4
line 1873
;1873:				}
line 1874
;1874:			} else {
ADDRGP4 $1462
JUMPV
LABELV $1461
line 1876
;1875:				//serverStatus.motdPaintX--;
;1876:				uiInfo.serverStatus.motdPaintX -= 2;
ADDRLP4 4
ADDRGP4 uiInfo+99264+10444
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1877
;1877:				if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+99264+10448
INDIRI4
CNSTI4 0
LTI4 $1495
line 1879
;1878:					//serverStatus.motdPaintX2--;
;1879:					uiInfo.serverStatus.motdPaintX2 -= 2;
ADDRLP4 8
ADDRGP4 uiInfo+99264+10448
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1880
;1880:				}
LABELV $1495
line 1881
;1881:			}
LABELV $1462
line 1882
;1882:		}
LABELV $1453
line 1884
;1883:
;1884:		maxX = rect->x + rect->w - 2;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1885
;1885:		Text_Paint_Limit(&maxX, uiInfo.serverStatus.motdPaintX, rect->y + rect->h - 3, scale, color, &uiInfo.serverStatus.motd[uiInfo.serverStatus.motdOffset], 0, 0); 
ADDRLP4 0
ARGP4
ADDRGP4 uiInfo+99264+10444
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+99264+10452
INDIRI4
ADDRGP4 uiInfo+99264+10460
ADDP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 Text_Paint_Limit
CALLV
pop
line 1886
;1886:		if (uiInfo.serverStatus.motdPaintX2 >= 0) {
ADDRGP4 uiInfo+99264+10448
INDIRI4
CNSTI4 0
LTI4 $1507
line 1887
;1887:			float maxX2 = rect->x + rect->w - 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 1888
;1888:			Text_Paint_Limit(&maxX2, uiInfo.serverStatus.motdPaintX2, rect->y + rect->h - 3, scale, color, uiInfo.serverStatus.motd, 0, uiInfo.serverStatus.motdOffset); 
ADDRLP4 12
ARGP4
ADDRGP4 uiInfo+99264+10448
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1077936128
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 uiInfo+99264+10460
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 uiInfo+99264+10452
INDIRI4
ARGI4
ADDRGP4 Text_Paint_Limit
CALLV
pop
line 1889
;1889:		}
LABELV $1507
line 1890
;1890:		if (uiInfo.serverStatus.motdOffset && maxX > 0) {
ADDRGP4 uiInfo+99264+10452
INDIRI4
CNSTI4 0
EQI4 $1517
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1517
line 1892
;1891:			// if we have an offset ( we are skipping the first part of the string ) and we fit the string
;1892:			if (uiInfo.serverStatus.motdPaintX2 == -1) {
ADDRGP4 uiInfo+99264+10448
INDIRI4
CNSTI4 -1
NEI4 $1518
line 1893
;1893:						uiInfo.serverStatus.motdPaintX2 = rect->x + rect->w - 2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 uiInfo+99264+10448
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
SUBF4
CVFI4 4
ASGNI4
line 1894
;1894:			}
line 1895
;1895:		} else {
ADDRGP4 $1518
JUMPV
LABELV $1517
line 1896
;1896:			uiInfo.serverStatus.motdPaintX2 = -1;
ADDRGP4 uiInfo+99264+10448
CNSTI4 -1
ASGNI4
line 1897
;1897:		}
LABELV $1518
line 1899
;1898:
;1899:	}
LABELV $1427
line 1900
;1900:}
LABELV $1426
endproc UI_DrawServerMOTD 24 32
proc UI_DrawKeyBindStatus 8 32
line 1902
;1901:
;1902:static void UI_DrawKeyBindStatus(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1904
;1903://	int ofs = 0; TTimo: unused
;1904:	if (Display_KeyBindPending()) {
ADDRLP4 0
ADDRGP4 Display_KeyBindPending
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1530
line 1905
;1905:		Text_Paint(rect->x, rect->y, scale, color, "Waiting for new key... Press ESCAPE to cancel", 0, 0, textStyle);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $1311
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1906
;1906:	} else {
ADDRGP4 $1531
JUMPV
LABELV $1530
line 1907
;1907:		Text_Paint(rect->x, rect->y, scale, color, "Press ENTER or CLICK to change, Press BACKSPACE to clear", 0, 0, textStyle);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $1312
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1908
;1908:	}
LABELV $1531
line 1909
;1909:}
LABELV $1529
endproc UI_DrawKeyBindStatus 8 32
proc UI_DrawGLInfo 1336 32
line 1911
;1910:
;1911:static void UI_DrawGLInfo(rectDef_t *rect, float scale, vec4_t color, int textStyle) {
line 1917
;1912:	char * eptr;
;1913:	char buff[1024];
;1914:	const char *lines[64];
;1915:	int y, numLines, i;
;1916:
;1917:	Text_Paint(rect->x + 2, rect->y, scale, color, va("VENDOR: %s", uiInfo.uiDC.glconfig.vendor_string), 0, 30, textStyle);
ADDRGP4 $1533
ARGP4
ADDRGP4 uiInfo+62068+1024
ARGP4
ADDRLP4 1296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1300
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 1300
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1918
;1918:	Text_Paint(rect->x + 2, rect->y + 15, scale, color, va("VERSION: %s: %s", uiInfo.uiDC.glconfig.version_string,uiInfo.uiDC.glconfig.renderer_string), 0, 30, textStyle);
ADDRGP4 $1536
ARGP4
ADDRGP4 uiInfo+62068+2048
ARGP4
ADDRGP4 uiInfo+62068
ARGP4
ADDRLP4 1304
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1308
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 1308
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1097859072
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1304
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1919
;1919:	Text_Paint(rect->x + 2, rect->y + 30, scale, color, va ("PIXELFORMAT: color(%d-bits) Z(%d-bits) stencil(%d-bits)", uiInfo.uiDC.glconfig.colorBits, uiInfo.uiDC.glconfig.depthBits, uiInfo.uiDC.glconfig.stencilBits), 0, 30, textStyle);
ADDRGP4 $1540
ARGP4
ADDRGP4 uiInfo+62068+11272
INDIRI4
ARGI4
ADDRGP4 uiInfo+62068+11276
INDIRI4
ARGI4
ADDRGP4 uiInfo+62068+11280
INDIRI4
ARGI4
ADDRLP4 1312
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1316
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 1316
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1106247680
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1312
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 30
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1925
;1920:
;1921:	// build null terminated extension strings
;1922:  // TTimo: https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=399
;1923:  // in TA this was not directly crashing, but displaying a nasty broken shader right in the middle
;1924:  // brought down the string size to 1024, there's not much that can be shown on the screen anyway
;1925:	Q_strncpyz(buff, uiInfo.uiDC.glconfig.extensions_string, 1024);
ADDRLP4 272
ARGP4
ADDRGP4 uiInfo+62068+3072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1926
;1926:	eptr = buff;
ADDRLP4 0
ADDRLP4 272
ASGNP4
line 1927
;1927:	y = rect->y + 45;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1110704128
ADDF4
CVFI4 4
ASGNI4
line 1928
;1928:	numLines = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $1550
JUMPV
line 1930
;1929:	while ( y < rect->y + rect->h && *eptr )
;1930:	{
LABELV $1552
line 1932
;1931:		while ( *eptr && *eptr == ' ' )
;1932:			*eptr++ = '\0';
ADDRLP4 1320
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1320
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1320
INDIRP4
CNSTI1 0
ASGNI1
LABELV $1553
line 1931
ADDRLP4 1324
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 0
EQI4 $1555
ADDRLP4 1324
INDIRI4
CNSTI4 32
EQI4 $1552
LABELV $1555
line 1935
;1933:
;1934:		// track start of valid string
;1935:		if (*eptr && *eptr != ' ') {
ADDRLP4 1328
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1328
INDIRI4
CNSTI4 0
EQI4 $1559
ADDRLP4 1328
INDIRI4
CNSTI4 32
EQI4 $1559
line 1936
;1936:			lines[numLines++] = eptr;
ADDRLP4 1332
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 1332
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1937
;1937:		}
ADDRGP4 $1559
JUMPV
LABELV $1558
line 1940
;1938:
;1939:		while ( *eptr && *eptr != ' ' )
;1940:			eptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1559
line 1939
ADDRLP4 1332
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 0
EQI4 $1561
ADDRLP4 1332
INDIRI4
CNSTI4 32
NEI4 $1558
LABELV $1561
line 1941
;1941:	}
LABELV $1550
line 1929
ADDRLP4 1320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 1320
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1320
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
GEF4 $1562
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1553
LABELV $1562
line 1943
;1942:
;1943:	i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1564
JUMPV
LABELV $1563
line 1944
;1944:	while (i < numLines) {
line 1945
;1945:		Text_Paint(rect->x + 2, y, scale, color, lines[i++], 0, 20, textStyle);
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1324
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 1324
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 20
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1946
;1946:		if (i < numLines) {
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
GEI4 $1566
line 1947
;1947:			Text_Paint(rect->x + rect->w / 2, y, scale, color, lines[i++], 0, 20, textStyle);
ADDRLP4 1332
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1332
INDIRP4
INDIRF4
ADDRLP4 1332
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1328
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 1328
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1328
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 20
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 1948
;1948:		}
LABELV $1566
line 1949
;1949:		y += 10;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1950
;1950:		if (y > rect->y + rect->h - 11) {
ADDRLP4 1328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 1328
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1328
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDF4
CNSTF4 1093664768
SUBF4
LEF4 $1568
line 1951
;1951:			break;
ADDRGP4 $1565
JUMPV
LABELV $1568
line 1953
;1952:		}
;1953:	}
LABELV $1564
line 1944
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $1563
LABELV $1565
line 1956
;1954:
;1955:
;1956:}
LABELV $1532
endproc UI_DrawGLInfo 1336 32
proc UI_OwnerDraw 24 24
line 1960
;1957:
;1958:// FIXME: table drive
;1959://
;1960:static void UI_OwnerDraw(float x, float y, float w, float h, float text_x, float text_y, int ownerDraw, int ownerDrawFlags, int align, float special, float scale, vec4_t color, qhandle_t shader, int textStyle) {
line 1963
;1961:	rectDef_t rect;
;1962:
;1963:  rect.x = x + text_x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 16
INDIRF4
ADDF4
ASGNF4
line 1964
;1964:  rect.y = y + text_y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
ADDRFP4 20
INDIRF4
ADDF4
ASGNF4
line 1965
;1965:  rect.w = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
ASGNF4
line 1966
;1966:  rect.h = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
ASGNF4
line 1968
;1967:
;1968:  switch (ownerDraw) {
ADDRLP4 16
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 200
LTI4 $1575
ADDRLP4 16
INDIRI4
CNSTI4 256
GTI4 $1575
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1624-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1624
address $1576
address $1577
address $1578
address $1579
address $1580
address $1583
address $1586
address $1590
address $1591
address $1592
address $1593
address $1593
address $1593
address $1593
address $1593
address $1594
address $1594
address $1594
address $1594
address $1594
address $1595
address $1596
address $1598
address $1599
address $1600
address $1601
address $1602
address $1603
address $1604
address $1607
address $1605
address $1608
address $1606
address $1609
address $1610
address $1611
address $1612
address $1614
address $1575
address $1615
address $1616
address $1617
address $1618
address $1619
address $1588
address $1584
address $1597
address $1620
address $1621
address $1622
address $1623
address $1581
address $1587
address $1585
address $1582
address $1589
address $1613
code
LABELV $1576
line 1970
;1969:    case UI_HANDICAP:
;1970:      UI_DrawHandicap(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandicap
CALLV
pop
line 1971
;1971:      break;
ADDRGP4 $1575
JUMPV
LABELV $1577
line 1973
;1972:    case UI_EFFECTS:
;1973:      UI_DrawEffects(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawEffects
CALLV
pop
line 1974
;1974:      break;
ADDRGP4 $1575
JUMPV
LABELV $1578
line 1976
;1975:    case UI_PLAYERMODEL:
;1976:      UI_DrawPlayerModel(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawPlayerModel
CALLV
pop
line 1977
;1977:      break;
ADDRGP4 $1575
JUMPV
LABELV $1579
line 1979
;1978:    case UI_CLANNAME:
;1979:      UI_DrawClanName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawClanName
CALLV
pop
line 1980
;1980:      break;
ADDRGP4 $1575
JUMPV
LABELV $1580
line 1982
;1981:    case UI_CLANLOGO:
;1982:      UI_DrawClanLogo(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawClanLogo
CALLV
pop
line 1983
;1983:      break;
ADDRGP4 $1575
JUMPV
LABELV $1581
line 1985
;1984:    case UI_CLANCINEMATIC:
;1985:      UI_DrawClanCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawClanCinematic
CALLV
pop
line 1986
;1986:      break;
ADDRGP4 $1575
JUMPV
LABELV $1582
line 1988
;1987:    case UI_PREVIEWCINEMATIC:
;1988:      UI_DrawPreviewCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPreviewCinematic
CALLV
pop
line 1989
;1989:      break;
ADDRGP4 $1575
JUMPV
LABELV $1583
line 1991
;1990:    case UI_GAMETYPE:
;1991:      UI_DrawGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawGameType
CALLV
pop
line 1992
;1992:      break;
ADDRGP4 $1575
JUMPV
LABELV $1584
line 1994
;1993:    case UI_NETGAMETYPE:
;1994:      UI_DrawNetGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetGameType
CALLV
pop
line 1995
;1995:      break;
ADDRGP4 $1575
JUMPV
LABELV $1585
line 1997
;1996:    case UI_JOINGAMETYPE:
;1997:	  UI_DrawJoinGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawJoinGameType
CALLV
pop
line 1998
;1998:	  break;
ADDRGP4 $1575
JUMPV
LABELV $1586
line 2000
;1999:    case UI_MAPPREVIEW:
;2000:      UI_DrawMapPreview(&rect, scale, color, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawMapPreview
CALLV
pop
line 2001
;2001:      break;
ADDRGP4 $1575
JUMPV
LABELV $1587
line 2003
;2002:    case UI_MAP_TIMETOBEAT:
;2003:      UI_DrawMapTimeToBeat(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawMapTimeToBeat
CALLV
pop
line 2004
;2004:      break;
ADDRGP4 $1575
JUMPV
LABELV $1588
line 2006
;2005:    case UI_MAPCINEMATIC:
;2006:      UI_DrawMapCinematic(&rect, scale, color, qfalse);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawMapCinematic
CALLV
pop
line 2007
;2007:      break;
ADDRGP4 $1575
JUMPV
LABELV $1589
line 2009
;2008:    case UI_STARTMAPCINEMATIC:
;2009:      UI_DrawMapCinematic(&rect, scale, color, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawMapCinematic
CALLV
pop
line 2010
;2010:      break;
ADDRGP4 $1575
JUMPV
LABELV $1590
line 2012
;2011:    case UI_SKILL:
;2012:      UI_DrawSkill(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawSkill
CALLV
pop
line 2013
;2013:      break;
ADDRGP4 $1575
JUMPV
LABELV $1591
line 2015
;2014:    case UI_BLUETEAMNAME:
;2015:      UI_DrawTeamName(&rect, scale, color, qtrue, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamName
CALLV
pop
line 2016
;2016:      break;
ADDRGP4 $1575
JUMPV
LABELV $1592
line 2018
;2017:    case UI_REDTEAMNAME:
;2018:      UI_DrawTeamName(&rect, scale, color, qfalse, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamName
CALLV
pop
line 2019
;2019:      break;
ADDRGP4 $1575
JUMPV
LABELV $1593
line 2025
;2020:    case UI_BLUETEAM1:
;2021:		case UI_BLUETEAM2:
;2022:		case UI_BLUETEAM3:
;2023:		case UI_BLUETEAM4:
;2024:		case UI_BLUETEAM5:
;2025:      UI_DrawTeamMember(&rect, scale, color, qtrue, ownerDraw - UI_BLUETEAM1 + 1, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
CNSTI4 210
SUBI4
ADDRLP4 20
INDIRI4
ADDI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamMember
CALLV
pop
line 2026
;2026:      break;
ADDRGP4 $1575
JUMPV
LABELV $1594
line 2032
;2027:    case UI_REDTEAM1:
;2028:		case UI_REDTEAM2:
;2029:		case UI_REDTEAM3:
;2030:		case UI_REDTEAM4:
;2031:		case UI_REDTEAM5:
;2032:      UI_DrawTeamMember(&rect, scale, color, qfalse, ownerDraw - UI_REDTEAM1 + 1, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTeamMember
CALLV
pop
line 2033
;2033:      break;
ADDRGP4 $1575
JUMPV
LABELV $1595
line 2035
;2034:		case UI_NETSOURCE:
;2035:      UI_DrawNetSource(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetSource
CALLV
pop
line 2036
;2036:			break;
ADDRGP4 $1575
JUMPV
LABELV $1596
line 2038
;2037:    case UI_NETMAPPREVIEW:
;2038:      UI_DrawNetMapPreview(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapPreview
CALLV
pop
line 2039
;2039:      break;
ADDRGP4 $1575
JUMPV
LABELV $1597
line 2041
;2040:    case UI_NETMAPCINEMATIC:
;2041:      UI_DrawNetMapCinematic(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawNetMapCinematic
CALLV
pop
line 2042
;2042:      break;
ADDRGP4 $1575
JUMPV
LABELV $1598
line 2044
;2043:		case UI_NETFILTER:
;2044:      UI_DrawNetFilter(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawNetFilter
CALLV
pop
line 2045
;2045:			break;
ADDRGP4 $1575
JUMPV
LABELV $1599
line 2047
;2046:		case UI_TIER:
;2047:			UI_DrawTier(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTier
CALLV
pop
line 2048
;2048:			break;
ADDRGP4 $1575
JUMPV
LABELV $1600
line 2050
;2049:		case UI_OPPONENTMODEL:
;2050:			UI_DrawOpponent(&rect);
ADDRLP4 0
ARGP4
ADDRGP4 UI_DrawOpponent
CALLV
pop
line 2051
;2051:			break;
ADDRGP4 $1575
JUMPV
LABELV $1601
line 2053
;2052:		case UI_TIERMAP1:
;2053:			UI_DrawTierMap(&rect, 0);
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2054
;2054:			break;
ADDRGP4 $1575
JUMPV
LABELV $1602
line 2056
;2055:		case UI_TIERMAP2:
;2056:			UI_DrawTierMap(&rect, 1);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2057
;2057:			break;
ADDRGP4 $1575
JUMPV
LABELV $1603
line 2059
;2058:		case UI_TIERMAP3:
;2059:			UI_DrawTierMap(&rect, 2);
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 UI_DrawTierMap
CALLV
pop
line 2060
;2060:			break;
ADDRGP4 $1575
JUMPV
LABELV $1604
line 2062
;2061:		case UI_PLAYERLOGO:
;2062:			UI_DrawPlayerLogo(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogo
CALLV
pop
line 2063
;2063:			break;
ADDRGP4 $1575
JUMPV
LABELV $1605
line 2065
;2064:		case UI_PLAYERLOGO_METAL:
;2065:			UI_DrawPlayerLogoMetal(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogoMetal
CALLV
pop
line 2066
;2066:			break;
ADDRGP4 $1575
JUMPV
LABELV $1606
line 2068
;2067:		case UI_PLAYERLOGO_NAME:
;2068:			UI_DrawPlayerLogoName(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawPlayerLogoName
CALLV
pop
line 2069
;2069:			break;
ADDRGP4 $1575
JUMPV
LABELV $1607
line 2071
;2070:		case UI_OPPONENTLOGO:
;2071:			UI_DrawOpponentLogo(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogo
CALLV
pop
line 2072
;2072:			break;
ADDRGP4 $1575
JUMPV
LABELV $1608
line 2074
;2073:		case UI_OPPONENTLOGO_METAL:
;2074:			UI_DrawOpponentLogoMetal(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogoMetal
CALLV
pop
line 2075
;2075:			break;
ADDRGP4 $1575
JUMPV
LABELV $1609
line 2077
;2076:		case UI_OPPONENTLOGO_NAME:
;2077:			UI_DrawOpponentLogoName(&rect, color);
ADDRLP4 0
ARGP4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawOpponentLogoName
CALLV
pop
line 2078
;2078:			break;
ADDRGP4 $1575
JUMPV
LABELV $1610
line 2080
;2079:		case UI_TIER_MAPNAME:
;2080:			UI_DrawTierMapName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTierMapName
CALLV
pop
line 2081
;2081:			break;
ADDRGP4 $1575
JUMPV
LABELV $1611
line 2083
;2082:		case UI_TIER_GAMETYPE:
;2083:			UI_DrawTierGameType(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawTierGameType
CALLV
pop
line 2084
;2084:			break;
ADDRGP4 $1575
JUMPV
LABELV $1612
line 2086
;2085:		case UI_ALLMAPS_SELECTION:
;2086:			UI_DrawAllMapsSelection(&rect, scale, color, textStyle, qtrue);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_DrawAllMapsSelection
CALLV
pop
line 2087
;2087:			break;
ADDRGP4 $1575
JUMPV
LABELV $1613
line 2089
;2088:		case UI_MAPS_SELECTION:
;2089:			UI_DrawAllMapsSelection(&rect, scale, color, textStyle, qfalse);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_DrawAllMapsSelection
CALLV
pop
line 2090
;2090:			break;
ADDRGP4 $1575
JUMPV
LABELV $1614
line 2092
;2091:		case UI_OPPONENT_NAME:
;2092:			UI_DrawOpponentName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawOpponentName
CALLV
pop
line 2093
;2093:			break;
ADDRGP4 $1575
JUMPV
LABELV $1615
line 2095
;2094:		case UI_BOTNAME:
;2095:			UI_DrawBotName(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawBotName
CALLV
pop
line 2096
;2096:			break;
ADDRGP4 $1575
JUMPV
LABELV $1616
line 2098
;2097:		case UI_BOTSKILL:
;2098:			UI_DrawBotSkill(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawBotSkill
CALLV
pop
line 2099
;2099:			break;
ADDRGP4 $1575
JUMPV
LABELV $1617
line 2101
;2100:		case UI_REDBLUE:
;2101:			UI_DrawRedBlue(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawRedBlue
CALLV
pop
line 2102
;2102:			break;
ADDRGP4 $1575
JUMPV
LABELV $1618
line 2104
;2103:		case UI_CROSSHAIR:
;2104:			UI_DrawCrosshair(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawCrosshair
CALLV
pop
line 2105
;2105:			break;
ADDRGP4 $1575
JUMPV
LABELV $1619
line 2107
;2106:		case UI_SELECTEDPLAYER:
;2107:			UI_DrawSelectedPlayer(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawSelectedPlayer
CALLV
pop
line 2108
;2108:			break;
ADDRGP4 $1575
JUMPV
LABELV $1620
line 2110
;2109:		case UI_SERVERREFRESHDATE:
;2110:			UI_DrawServerRefreshDate(&rect, scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawServerRefreshDate
CALLV
pop
line 2111
;2111:			break;
ADDRGP4 $1575
JUMPV
LABELV $1621
line 2113
;2112:		case UI_SERVERMOTD:
;2113:			UI_DrawServerMOTD(&rect, scale, color);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRGP4 UI_DrawServerMOTD
CALLV
pop
line 2114
;2114:			break;
ADDRGP4 $1575
JUMPV
LABELV $1622
line 2116
;2115:		case UI_GLINFO:
;2116:			UI_DrawGLInfo(&rect,scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawGLInfo
CALLV
pop
line 2117
;2117:			break;
ADDRGP4 $1575
JUMPV
LABELV $1623
line 2119
;2118:		case UI_KEYBINDSTATUS:
;2119:			UI_DrawKeyBindStatus(&rect,scale, color, textStyle);
ADDRLP4 0
ARGP4
ADDRFP4 40
INDIRF4
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 52
INDIRI4
ARGI4
ADDRGP4 UI_DrawKeyBindStatus
CALLV
pop
line 2120
;2120:			break;
line 2122
;2121:    default:
;2122:      break;
LABELV $1575
line 2125
;2123:  }
;2124:
;2125:}
LABELV $1570
endproc UI_OwnerDraw 24 24
proc UI_OwnerDrawVisible 8 8
line 2127
;2126:
;2127:static qboolean UI_OwnerDrawVisible(int flags) {
line 2128
;2128:	qboolean vis = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1628
JUMPV
LABELV $1627
line 2130
;2129:
;2130:	while (flags) {
line 2132
;2131:
;2132:		if (flags & UI_SHOW_FFA) {
ADDRFP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1630
line 2133
;2133:			if (trap_Cvar_VariableValue("g_gametype") != GT_FFA) {
ADDRGP4 $1323
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
EQF4 $1632
line 2134
;2134:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2135
;2135:			}
LABELV $1632
line 2136
;2136:			flags &= ~UI_SHOW_FFA;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 2137
;2137:		}
LABELV $1630
line 2139
;2138:
;2139:		if (flags & UI_SHOW_NOTFFA) {
ADDRFP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1634
line 2140
;2140:			if (trap_Cvar_VariableValue("g_gametype") == GT_FFA) {
ADDRGP4 $1323
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $1636
line 2141
;2141:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2142
;2142:			}
LABELV $1636
line 2143
;2143:			flags &= ~UI_SHOW_NOTFFA;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2144
;2144:		}
LABELV $1634
line 2146
;2145:
;2146:		if (flags & UI_SHOW_LEADER) {
ADDRFP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1638
line 2148
;2147:			// these need to show when this client can give orders to a player or a group
;2148:			if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+78868
INDIRI4
CNSTI4 0
NEI4 $1640
line 2149
;2149:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2150
;2150:			} else {
ADDRGP4 $1641
JUMPV
LABELV $1640
line 2152
;2151:				// if showing yourself
;2152:				if (ui_selectedPlayer.integer < uiInfo.myTeamCount && uiInfo.teamClientNums[ui_selectedPlayer.integer] == uiInfo.playerNumber) { 
ADDRGP4 ui_selectedPlayer+12
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $1643
ADDRGP4 ui_selectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82968
ADDP4
INDIRI4
ADDRGP4 uiInfo+78864
INDIRI4
NEI4 $1643
line 2153
;2153:					vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2154
;2154:				}
LABELV $1643
line 2155
;2155:			}
LABELV $1641
line 2156
;2156:			flags &= ~UI_SHOW_LEADER;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2157
;2157:		} 
LABELV $1638
line 2158
;2158:		if (flags & UI_SHOW_NOTLEADER) {
ADDRFP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1650
line 2160
;2159:			// these need to show when this client is assigning their own status or they are NOT the leader
;2160:			if (uiInfo.teamLeader) {
ADDRGP4 uiInfo+78868
INDIRI4
CNSTI4 0
EQI4 $1652
line 2162
;2161:				// if not showing yourself
;2162:				if (!(ui_selectedPlayer.integer < uiInfo.myTeamCount && uiInfo.teamClientNums[ui_selectedPlayer.integer] == uiInfo.playerNumber)) { 
ADDRGP4 ui_selectedPlayer+12
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $1662
ADDRGP4 ui_selectedPlayer+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82968
ADDP4
INDIRI4
ADDRGP4 uiInfo+78864
INDIRI4
EQI4 $1655
LABELV $1662
line 2163
;2163:					vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2164
;2164:				}
LABELV $1655
line 2166
;2165:				// these need to show when this client can give orders to a player or a group
;2166:			}
LABELV $1652
line 2167
;2167:			flags &= ~UI_SHOW_NOTLEADER;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2168
;2168:		} 
LABELV $1650
line 2169
;2169:		if (flags & UI_SHOW_FAVORITESERVERS) {
ADDRFP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1663
line 2171
;2170:			// this assumes you only put this type of display flag on something showing in the proper context
;2171:			if (ui_netSource.integer != AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
EQI4 $1665
line 2172
;2172:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2173
;2173:			}
LABELV $1665
line 2174
;2174:			flags &= ~UI_SHOW_FAVORITESERVERS;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2175
;2175:		} 
LABELV $1663
line 2176
;2176:		if (flags & UI_SHOW_NOTFAVORITESERVERS) {
ADDRFP4 0
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1668
line 2178
;2177:			// this assumes you only put this type of display flag on something showing in the proper context
;2178:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $1670
line 2179
;2179:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2180
;2180:			}
LABELV $1670
line 2181
;2181:			flags &= ~UI_SHOW_NOTFAVORITESERVERS;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 2182
;2182:		} 
LABELV $1668
line 2183
;2183:		if (flags & UI_SHOW_ANYTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1673
line 2184
;2184:			if (uiInfo.gameTypes[ui_gameType.integer].gtEnum <= GT_TEAM ) {
ADDRLP4 4
CNSTI4 3
ASGNI4
ADDRGP4 ui_gameType+12
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $1675
line 2185
;2185:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2186
;2186:			}
LABELV $1675
line 2187
;2187:			flags &= ~UI_SHOW_ANYTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 2188
;2188:		} 
LABELV $1673
line 2189
;2189:		if (flags & UI_SHOW_ANYNONTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1680
line 2190
;2190:			if (uiInfo.gameTypes[ui_gameType.integer].gtEnum > GT_TEAM ) {
ADDRLP4 4
CNSTI4 3
ASGNI4
ADDRGP4 ui_gameType+12
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $1682
line 2191
;2191:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2192
;2192:			}
LABELV $1682
line 2193
;2193:			flags &= ~UI_SHOW_ANYNONTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 2194
;2194:		} 
LABELV $1680
line 2195
;2195:		if (flags & UI_SHOW_NETANYTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1687
line 2196
;2196:			if (uiInfo.gameTypes[ui_netGameType.integer].gtEnum <= GT_TEAM ) {
ADDRLP4 4
CNSTI4 3
ASGNI4
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $1689
line 2197
;2197:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2198
;2198:			}
LABELV $1689
line 2199
;2199:			flags &= ~UI_SHOW_NETANYTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 2200
;2200:		} 
LABELV $1687
line 2201
;2201:		if (flags & UI_SHOW_NETANYNONTEAMGAME) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1694
line 2202
;2202:			if (uiInfo.gameTypes[ui_netGameType.integer].gtEnum > GT_TEAM ) {
ADDRLP4 4
CNSTI4 3
ASGNI4
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $1696
line 2203
;2203:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2204
;2204:			}
LABELV $1696
line 2205
;2205:			flags &= ~UI_SHOW_NETANYNONTEAMGAME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 2206
;2206:		} 
LABELV $1694
line 2207
;2207:		if (flags & UI_SHOW_NEWHIGHSCORE) {
ADDRFP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1701
line 2208
;2208:			if (uiInfo.newHighScoreTime < uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+73416
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
GEI4 $1703
line 2209
;2209:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2210
;2210:			} else {
ADDRGP4 $1704
JUMPV
LABELV $1703
line 2211
;2211:				if (uiInfo.soundHighScore) {
ADDRGP4 uiInfo+73436
INDIRI4
CNSTI4 0
EQI4 $1707
line 2212
;2212:					if (trap_Cvar_VariableValue("sv_killserver") == 0) {
ADDRGP4 $394
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $1710
line 2214
;2213:						// wait on server to go down before playing sound
;2214:						trap_S_StartLocalSound(uiInfo.newHighScoreSound, CHAN_ANNOUNCER);
ADDRGP4 uiInfo+119484
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2215
;2215:						uiInfo.soundHighScore = qfalse;
ADDRGP4 uiInfo+73436
CNSTI4 0
ASGNI4
line 2216
;2216:					}
LABELV $1710
line 2217
;2217:				}
LABELV $1707
line 2218
;2218:			}
LABELV $1704
line 2219
;2219:			flags &= ~UI_SHOW_NEWHIGHSCORE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 2220
;2220:		} 
LABELV $1701
line 2221
;2221:		if (flags & UI_SHOW_NEWBESTTIME) {
ADDRFP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1714
line 2222
;2222:			if (uiInfo.newBestTime < uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+73420
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
GEI4 $1716
line 2223
;2223:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2224
;2224:			}
LABELV $1716
line 2225
;2225:			flags &= ~UI_SHOW_NEWBESTTIME;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 2226
;2226:		} 
LABELV $1714
line 2227
;2227:		if (flags & UI_SHOW_DEMOAVAILABLE) {
ADDRFP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1720
line 2228
;2228:			if (!uiInfo.demoAvailable) {
ADDRGP4 uiInfo+73432
INDIRI4
CNSTI4 0
NEI4 $1722
line 2229
;2229:				vis = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2230
;2230:			}
LABELV $1722
line 2231
;2231:			flags &= ~UI_SHOW_DEMOAVAILABLE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 2232
;2232:		} else {
ADDRGP4 $1721
JUMPV
LABELV $1720
line 2233
;2233:			flags = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 2234
;2234:		}
LABELV $1721
line 2235
;2235:	}
LABELV $1628
line 2130
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $1627
line 2236
;2236:  return vis;
ADDRLP4 0
INDIRI4
RETI4
LABELV $1626
endproc UI_OwnerDrawVisible 8 8
proc UI_Handicap_HandleKey 20 12
line 2239
;2237:}
;2238:
;2239:static qboolean UI_Handicap_HandleKey(int flags, float *special, int key) {
line 2240
;2240:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1730
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1730
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1730
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1726
LABELV $1730
line 2242
;2241:    int h;
;2242:    h = Com_Clamp( 5, 100, trap_Cvar_VariableValue("handicap") );
ADDRGP4 $696
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 2243
;2243:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1731
line 2244
;2244:	    h -= 5;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
SUBI4
ASGNI4
line 2245
;2245:		} else {
ADDRGP4 $1732
JUMPV
LABELV $1731
line 2246
;2246:	    h += 5;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 2247
;2247:		}
LABELV $1732
line 2248
;2248:    if (h > 100) {
ADDRLP4 4
INDIRI4
CNSTI4 100
LEI4 $1733
line 2249
;2249:      h = 5;
ADDRLP4 4
CNSTI4 5
ASGNI4
line 2250
;2250:    } else if (h < 0) {
ADDRGP4 $1734
JUMPV
LABELV $1733
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1735
line 2251
;2251:			h = 100;
ADDRLP4 4
CNSTI4 100
ASGNI4
line 2252
;2252:		}
LABELV $1735
LABELV $1734
line 2253
;2253:  	trap_Cvar_Set( "handicap", va( "%i", h) );
ADDRGP4 $1737
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $696
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2254
;2254:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1725
JUMPV
LABELV $1726
line 2256
;2255:  }
;2256:  return qfalse;
CNSTI4 0
RETI4
LABELV $1725
endproc UI_Handicap_HandleKey 20 12
proc UI_Effects_HandleKey 8 8
line 2259
;2257:}
;2258:
;2259:static qboolean UI_Effects_HandleKey(int flags, float *special, int key) {
line 2260
;2260:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1743
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1743
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1743
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1739
LABELV $1743
line 2262
;2261:
;2262:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1744
line 2263
;2263:	    uiInfo.effectsColor--;
ADDRLP4 4
ADDRGP4 uiInfo+136904
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2264
;2264:		} else {
ADDRGP4 $1745
JUMPV
LABELV $1744
line 2265
;2265:	    uiInfo.effectsColor++;
ADDRLP4 4
ADDRGP4 uiInfo+136904
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2266
;2266:		}
LABELV $1745
line 2268
;2267:
;2268:    if( uiInfo.effectsColor > 6 ) {
ADDRGP4 uiInfo+136904
INDIRI4
CNSTI4 6
LEI4 $1748
line 2269
;2269:	  	uiInfo.effectsColor = 0;
ADDRGP4 uiInfo+136904
CNSTI4 0
ASGNI4
line 2270
;2270:		} else if (uiInfo.effectsColor < 0) {
ADDRGP4 $1749
JUMPV
LABELV $1748
ADDRGP4 uiInfo+136904
INDIRI4
CNSTI4 0
GEI4 $1752
line 2271
;2271:	  	uiInfo.effectsColor = 6;
ADDRGP4 uiInfo+136904
CNSTI4 6
ASGNI4
line 2272
;2272:		}
LABELV $1752
LABELV $1749
line 2274
;2273:
;2274:	  trap_Cvar_SetValue( "color1", uitogamecode[uiInfo.effectsColor] );
ADDRGP4 $1756
ARGP4
ADDRGP4 uiInfo+136904
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uitogamecode
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 2275
;2275:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1738
JUMPV
LABELV $1739
line 2277
;2276:  }
;2277:  return qfalse;
CNSTI4 0
RETI4
LABELV $1738
endproc UI_Effects_HandleKey 8 8
proc UI_ClanName_HandleKey 16 8
line 2280
;2278:}
;2279:
;2280:static qboolean UI_ClanName_HandleKey(int flags, float *special, int key) {
line 2281
;2281:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1763
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1763
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1763
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1759
LABELV $1763
line 2283
;2282:    int i;
;2283:    i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 2284
;2284:		if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1764
line 2285
;2285:		  trap_CIN_StopCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 2286
;2286:			uiInfo.teamList[i].cinematic = -1;
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
CNSTI4 -1
ASGNI4
line 2287
;2287:		}
LABELV $1764
line 2288
;2288:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1772
line 2289
;2289:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2290
;2290:		} else {
ADDRGP4 $1773
JUMPV
LABELV $1772
line 2291
;2291:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2292
;2292:		}
LABELV $1773
line 2293
;2293:    if (i >= uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
LTI4 $1774
line 2294
;2294:      i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2295
;2295:    } else if (i < 0) {
ADDRGP4 $1775
JUMPV
LABELV $1774
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1777
line 2296
;2296:			i = uiInfo.teamCount - 1;
ADDRLP4 4
ADDRGP4 uiInfo+75756
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2297
;2297:		}
LABELV $1777
LABELV $1775
line 2298
;2298:  	trap_Cvar_Set( "ui_teamName", uiInfo.teamList[i].teamName);
ADDRGP4 $698
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2299
;2299:	UI_HeadCountByTeam();
ADDRGP4 UI_HeadCountByTeam
CALLI4
pop
line 2300
;2300:	UI_FeederSelection(FEEDER_HEADS, 0);
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 UI_FeederSelection
CALLV
pop
line 2301
;2301:	updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 2302
;2302:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1758
JUMPV
LABELV $1759
line 2304
;2303:  }
;2304:  return qfalse;
CNSTI4 0
RETI4
LABELV $1758
endproc UI_ClanName_HandleKey 16 8
proc UI_GameType_HandleKey 20 16
line 2307
;2305:}
;2306:
;2307:static qboolean UI_GameType_HandleKey(int flags, float *special, int key, qboolean resetMap) {
line 2308
;2308:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1786
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1786
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1786
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1782
LABELV $1786
line 2309
;2309:		int oldCount = UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 2337
;2310:
;2311:		// allow showing all gametypes in skirmish menu
;2312:/*
;2313:		// hard coded mess here
;2314:		if (key == K_MOUSE2) {
;2315:			ui_gameType.integer--;
;2316:			if (ui_gameType.integer == 2) {
;2317:				ui_gameType.integer = 1;
;2318:			} else if (ui_gameType.integer < 2) {
;2319:				ui_gameType.integer = uiInfo.numGameTypes - 1;
;2320:			}
;2321:		} else {
;2322:			ui_gameType.integer++;
;2323:			if (ui_gameType.integer >= uiInfo.numGameTypes) {
;2324:				ui_gameType.integer = 1;
;2325:			} else if (ui_gameType.integer == 2) {
;2326:				ui_gameType.integer = 3;
;2327:			}
;2328:		}
;2329:    
;2330:		if (uiInfo.gameTypes[ui_gameType.integer].gtEnum == GT_TOURNAMENT) {
;2331:			trap_Cvar_Set("ui_Q3Model", "1");
;2332:		} else {
;2333:			trap_Cvar_Set("ui_Q3Model", "0");
;2334:		}
;2335:*/
;2336:
;2337:		trap_Cvar_Set("ui_gameType", va("%d", ui_gameType.integer));
ADDRGP4 $713
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1787
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2338
;2338:		UI_SetCapFragLimits(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 2339
;2339:		UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 2340
;2340:		if (resetMap && oldCount != UI_MapCountByGameType(qtrue)) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1795
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1795
line 2341
;2341:	  	trap_Cvar_Set( "ui_currentMap", "0");
ADDRGP4 $888
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2342
;2342:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 2343
;2343:		}
LABELV $1795
line 2344
;2344:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1781
JUMPV
LABELV $1782
line 2346
;2345:  }
;2346:  return qfalse;
CNSTI4 0
RETI4
LABELV $1781
endproc UI_GameType_HandleKey 20 16
proc UI_NetGameType_HandleKey 12 16
line 2349
;2347:}
;2348:
;2349:static qboolean UI_NetGameType_HandleKey(int flags, float *special, int key) {
line 2350
;2350:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1802
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1802
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1802
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1798
LABELV $1802
line 2352
;2351:
;2352:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1803
line 2353
;2353:			ui_netGameType.integer--;
ADDRLP4 4
ADDRGP4 ui_netGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2354
;2354:		} else {
ADDRGP4 $1804
JUMPV
LABELV $1803
line 2355
;2355:			ui_netGameType.integer++;
ADDRLP4 4
ADDRGP4 ui_netGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2356
;2356:		}
LABELV $1804
line 2358
;2357:
;2358:    if (ui_netGameType.integer < 0) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
GEI4 $1807
line 2359
;2359:      ui_netGameType.integer = uiInfo.numGameTypes - 1;
ADDRGP4 ui_netGameType+12
ADDRGP4 uiInfo+78576
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2360
;2360:		} else if (ui_netGameType.integer >= uiInfo.numGameTypes) {
ADDRGP4 $1808
JUMPV
LABELV $1807
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+78576
INDIRI4
LTI4 $1812
line 2361
;2361:      ui_netGameType.integer = 0;
ADDRGP4 ui_netGameType+12
CNSTI4 0
ASGNI4
line 2362
;2362:    } 
LABELV $1812
LABELV $1808
line 2364
;2363:
;2364:  	trap_Cvar_Set( "ui_netGameType", va("%d", ui_netGameType.integer));
ADDRGP4 $713
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $727
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2365
;2365:  	trap_Cvar_Set( "ui_actualnetGameType", va("%d", uiInfo.gameTypes[ui_netGameType.integer].gtEnum));
ADDRGP4 $713
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1818
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2366
;2366:  	trap_Cvar_Set( "ui_currentNetMap", "0");
ADDRGP4 $886
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2367
;2367:		UI_MapCountByGameType(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 2368
;2368:		Menu_SetFeederSelection(NULL, FEEDER_ALLMAPS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 2369
;2369:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1797
JUMPV
LABELV $1798
line 2371
;2370:  }
;2371:  return qfalse;
CNSTI4 0
RETI4
LABELV $1797
endproc UI_NetGameType_HandleKey 12 16
proc UI_JoinGameType_HandleKey 8 8
line 2374
;2372:}
;2373:
;2374:static qboolean UI_JoinGameType_HandleKey(int flags, float *special, int key) {
line 2375
;2375:	if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1827
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1827
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1827
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1823
LABELV $1827
line 2377
;2376:
;2377:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1828
line 2378
;2378:			ui_joinGameType.integer--;
ADDRLP4 4
ADDRGP4 ui_joinGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2379
;2379:		} else {
ADDRGP4 $1829
JUMPV
LABELV $1828
line 2380
;2380:			ui_joinGameType.integer++;
ADDRLP4 4
ADDRGP4 ui_joinGameType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2381
;2381:		}
LABELV $1829
line 2383
;2382:
;2383:		if (ui_joinGameType.integer < 0) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 0
GEI4 $1832
line 2384
;2384:			ui_joinGameType.integer = uiInfo.numJoinGameTypes - 1;
ADDRGP4 ui_joinGameType+12
ADDRGP4 uiInfo+78708
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2385
;2385:		} else if (ui_joinGameType.integer >= uiInfo.numJoinGameTypes) {
ADDRGP4 $1833
JUMPV
LABELV $1832
ADDRGP4 ui_joinGameType+12
INDIRI4
ADDRGP4 uiInfo+78708
INDIRI4
LTI4 $1837
line 2386
;2386:			ui_joinGameType.integer = 0;
ADDRGP4 ui_joinGameType+12
CNSTI4 0
ASGNI4
line 2387
;2387:		}
LABELV $1837
LABELV $1833
line 2389
;2388:
;2389:		trap_Cvar_Set( "ui_joinGameType", va("%d", ui_joinGameType.integer));
ADDRGP4 $713
ARGP4
ADDRGP4 ui_joinGameType+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $738
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2390
;2390:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 2391
;2391:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1822
JUMPV
LABELV $1823
line 2393
;2392:	}
;2393:	return qfalse;
CNSTI4 0
RETI4
LABELV $1822
endproc UI_JoinGameType_HandleKey 8 8
proc UI_Skill_HandleKey 16 8
line 2398
;2394:}
;2395:
;2396:
;2397:
;2398:static qboolean UI_Skill_HandleKey(int flags, float *special, int key) {
line 2399
;2399:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1848
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1848
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1848
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1844
LABELV $1848
line 2400
;2400:  	int i = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $824
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 2402
;2401:
;2402:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1849
line 2403
;2403:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2404
;2404:		} else {
ADDRGP4 $1850
JUMPV
LABELV $1849
line 2405
;2405:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2406
;2406:		}
LABELV $1850
line 2408
;2407:
;2408:    if (i < 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $1851
line 2409
;2409:			i = numSkillLevels;
ADDRLP4 4
ADDRGP4 numSkillLevels
INDIRI4
ASGNI4
line 2410
;2410:		} else if (i > numSkillLevels) {
ADDRGP4 $1852
JUMPV
LABELV $1851
ADDRLP4 4
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LEI4 $1853
line 2411
;2411:      i = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2412
;2412:    }
LABELV $1853
LABELV $1852
line 2414
;2413:
;2414:    trap_Cvar_Set("g_spSkill", va("%i", i));
ADDRGP4 $1737
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $824
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2415
;2415:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1843
JUMPV
LABELV $1844
line 2417
;2416:  }
;2417:  return qfalse;
CNSTI4 0
RETI4
LABELV $1843
endproc UI_Skill_HandleKey 16 8
proc UI_TeamName_HandleKey 24 8
line 2420
;2418:}
;2419:
;2420:static qboolean UI_TeamName_HandleKey(int flags, float *special, int key, qboolean blue) {
line 2421
;2421:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1860
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1860
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1860
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1856
LABELV $1860
line 2423
;2422:    int i;
;2423:    i = UI_TeamIndexFromName(UI_Cvar_VariableString((blue) ? "ui_blueTeam" : "ui_redTeam"));
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1862
ADDRLP4 8
ADDRGP4 $830
ASGNP4
ADDRGP4 $1863
JUMPV
LABELV $1862
ADDRLP4 8
ADDRGP4 $831
ASGNP4
LABELV $1863
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 2425
;2424:
;2425:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1864
line 2426
;2426:	    i--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2427
;2427:		} else {
ADDRGP4 $1865
JUMPV
LABELV $1864
line 2428
;2428:	    i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2429
;2429:		}
LABELV $1865
line 2431
;2430:
;2431:    if (i >= uiInfo.teamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
LTI4 $1866
line 2432
;2432:      i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2433
;2433:    } else if (i < 0) {
ADDRGP4 $1867
JUMPV
LABELV $1866
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1869
line 2434
;2434:			i = uiInfo.teamCount - 1;
ADDRLP4 4
ADDRGP4 uiInfo+75756
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2435
;2435:		}
LABELV $1869
LABELV $1867
line 2437
;2436:
;2437:    trap_Cvar_Set( (blue) ? "ui_blueTeam" : "ui_redTeam", uiInfo.teamList[i].teamName);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1874
ADDRLP4 20
ADDRGP4 $830
ASGNP4
ADDRGP4 $1875
JUMPV
LABELV $1874
ADDRLP4 20
ADDRGP4 $831
ASGNP4
LABELV $1875
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2439
;2438:
;2439:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1855
JUMPV
LABELV $1856
line 2441
;2440:  }
;2441:  return qfalse;
CNSTI4 0
RETI4
LABELV $1855
endproc UI_TeamName_HandleKey 24 8
proc UI_TeamMember_HandleKey 32 8
line 2444
;2442:}
;2443:
;2444:static qboolean UI_TeamMember_HandleKey(int flags, float *special, int key, qboolean blue, int num) {
line 2445
;2445:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1881
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1881
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1881
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1877
LABELV $1881
line 2449
;2446:		// 0 - None
;2447:		// 1 - Human
;2448:		// 2..NumCharacters - Bot
;2449:		char *cvar = va(blue ? "ui_blueteam%i" : "ui_redteam%i", num);
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1883
ADDRLP4 12
ADDRGP4 $846
ASGNP4
ADDRGP4 $1884
JUMPV
LABELV $1883
ADDRLP4 12
ADDRGP4 $847
ASGNP4
LABELV $1884
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 2450
;2450:		int value = trap_Cvar_VariableValue(cvar);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 2452
;2451:
;2452:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1885
line 2453
;2453:			value--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2454
;2454:		} else {
ADDRGP4 $1886
JUMPV
LABELV $1885
line 2455
;2455:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2456
;2456:		}
LABELV $1886
line 2458
;2457:
;2458:		if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 3
LTI4 $1887
line 2459
;2459:			if (value >= uiInfo.characterCount + 2) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
CNSTI4 2
ADDI4
LTI4 $1890
line 2460
;2460:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2461
;2461:			} else if (value < 0) {
ADDRGP4 $1888
JUMPV
LABELV $1890
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1888
line 2462
;2462:				value = uiInfo.characterCount + 2 - 1;
ADDRLP4 4
ADDRGP4 uiInfo+73440
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 2463
;2463:			}
line 2464
;2464:		} else {
ADDRGP4 $1888
JUMPV
LABELV $1887
line 2465
;2465:			if (value >= UI_GetNumBots() + 2) {
ADDRLP4 24
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 2
ADDI4
LTI4 $1896
line 2466
;2466:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2467
;2467:			} else if (value < 0) {
ADDRGP4 $1897
JUMPV
LABELV $1896
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1898
line 2468
;2468:				value = UI_GetNumBots() + 2 - 1;
ADDRLP4 28
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 2469
;2469:			}
LABELV $1898
LABELV $1897
line 2470
;2470:		}
LABELV $1888
line 2472
;2471:
;2472:		trap_Cvar_Set(cvar, va("%i", value));
ADDRGP4 $1737
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2473
;2473:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1876
JUMPV
LABELV $1877
line 2475
;2474:  }
;2475:  return qfalse;
CNSTI4 0
RETI4
LABELV $1876
endproc UI_TeamMember_HandleKey 32 8
proc UI_NetSource_HandleKey 12 8
line 2478
;2476:}
;2477:
;2478:static qboolean UI_NetSource_HandleKey(int flags, float *special, int key) {
line 2479
;2479:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1905
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1905
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1905
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1901
LABELV $1905
line 2481
;2480:		
;2481:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1906
line 2482
;2482:			ui_netSource.integer--;
ADDRLP4 4
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2483
;2483:			if (ui_netSource.integer == AS_MPLAYER)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
NEI4 $1907
line 2484
;2484:				ui_netSource.integer--;
ADDRLP4 8
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2485
;2485:		} else {
ADDRGP4 $1907
JUMPV
LABELV $1906
line 2486
;2486:			ui_netSource.integer++;
ADDRLP4 4
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2487
;2487:			if (ui_netSource.integer == AS_MPLAYER)
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
NEI4 $1914
line 2488
;2488:				ui_netSource.integer++;
ADDRLP4 8
ADDRGP4 ui_netSource+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1914
line 2489
;2489:		}
LABELV $1907
line 2491
;2490:    
;2491:		if (ui_netSource.integer >= numNetSources) {
ADDRGP4 ui_netSource+12
INDIRI4
ADDRGP4 numNetSources
INDIRI4
LTI4 $1918
line 2492
;2492:      ui_netSource.integer = 0;
ADDRGP4 ui_netSource+12
CNSTI4 0
ASGNI4
line 2493
;2493:    } else if (ui_netSource.integer < 0) {
ADDRGP4 $1919
JUMPV
LABELV $1918
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
GEI4 $1922
line 2494
;2494:      ui_netSource.integer = numNetSources - 1;
ADDRGP4 ui_netSource+12
ADDRGP4 numNetSources
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2495
;2495:		}
LABELV $1922
LABELV $1919
line 2497
;2496:
;2497:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 2498
;2498:		if (ui_netSource.integer != AS_GLOBAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
EQI4 $1926
line 2499
;2499:			UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 2500
;2500:		}
LABELV $1926
line 2501
;2501:  	trap_Cvar_Set( "ui_netSource", va("%d", ui_netSource.integer));
ADDRGP4 $713
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1929
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2502
;2502:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1900
JUMPV
LABELV $1901
line 2504
;2503:  }
;2504:  return qfalse;
CNSTI4 0
RETI4
LABELV $1900
endproc UI_NetSource_HandleKey 12 8
proc UI_NetFilter_HandleKey 8 4
line 2507
;2505:}
;2506:
;2507:static qboolean UI_NetFilter_HandleKey(int flags, float *special, int key) {
line 2508
;2508:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1936
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1936
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1936
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1932
LABELV $1936
line 2510
;2509:
;2510:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1937
line 2511
;2511:			ui_serverFilterType.integer--;
ADDRLP4 4
ADDRGP4 ui_serverFilterType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2512
;2512:		} else {
ADDRGP4 $1938
JUMPV
LABELV $1937
line 2513
;2513:			ui_serverFilterType.integer++;
ADDRLP4 4
ADDRGP4 ui_serverFilterType+12
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2514
;2514:		}
LABELV $1938
line 2516
;2515:
;2516:    if (ui_serverFilterType.integer >= numServerFilters) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
ADDRGP4 numServerFilters
INDIRI4
LTI4 $1941
line 2517
;2517:      ui_serverFilterType.integer = 0;
ADDRGP4 ui_serverFilterType+12
CNSTI4 0
ASGNI4
line 2518
;2518:    } else if (ui_serverFilterType.integer < 0) {
ADDRGP4 $1942
JUMPV
LABELV $1941
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
GEI4 $1945
line 2519
;2519:      ui_serverFilterType.integer = numServerFilters - 1;
ADDRGP4 ui_serverFilterType+12
ADDRGP4 numServerFilters
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2520
;2520:		}
LABELV $1945
LABELV $1942
line 2521
;2521:		UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 2522
;2522:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1931
JUMPV
LABELV $1932
line 2524
;2523:  }
;2524:  return qfalse;
CNSTI4 0
RETI4
LABELV $1931
endproc UI_NetFilter_HandleKey 8 4
proc UI_OpponentName_HandleKey 4 0
line 2527
;2525:}
;2526:
;2527:static qboolean UI_OpponentName_HandleKey(int flags, float *special, int key) {
line 2528
;2528:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1954
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1954
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1954
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1950
LABELV $1954
line 2529
;2529:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1955
line 2530
;2530:			UI_PriorOpponent();
ADDRGP4 UI_PriorOpponent
CALLV
pop
line 2531
;2531:		} else {
ADDRGP4 $1956
JUMPV
LABELV $1955
line 2532
;2532:			UI_NextOpponent();
ADDRGP4 UI_NextOpponent
CALLV
pop
line 2533
;2533:		}
LABELV $1956
line 2534
;2534:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1949
JUMPV
LABELV $1950
line 2536
;2535:  }
;2536:  return qfalse;
CNSTI4 0
RETI4
LABELV $1949
endproc UI_OpponentName_HandleKey 4 0
proc UI_BotName_HandleKey 24 4
line 2539
;2537:}
;2538:
;2539:static qboolean UI_BotName_HandleKey(int flags, float *special, int key) {
line 2540
;2540:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1962
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1962
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1962
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1958
LABELV $1962
line 2541
;2541:		int game = trap_Cvar_VariableValue("g_gametype");
ADDRGP4 $1323
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 2542
;2542:		int value = uiInfo.botIndex;
ADDRLP4 4
ADDRGP4 uiInfo+73444
INDIRI4
ASGNI4
line 2544
;2543:
;2544:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1964
line 2545
;2545:			value--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2546
;2546:		} else {
ADDRGP4 $1965
JUMPV
LABELV $1964
line 2547
;2547:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2548
;2548:		}
LABELV $1965
line 2550
;2549:
;2550:		if (game >= GT_TEAM) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LTI4 $1966
line 2551
;2551:			if (value >= uiInfo.characterCount + 2) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
CNSTI4 2
ADDI4
LTI4 $1968
line 2552
;2552:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2553
;2553:			} else if (value < 0) {
ADDRGP4 $1967
JUMPV
LABELV $1968
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1967
line 2554
;2554:				value = uiInfo.characterCount + 2 - 1;
ADDRLP4 4
ADDRGP4 uiInfo+73440
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 2555
;2555:			}
line 2556
;2556:		} else {
ADDRGP4 $1967
JUMPV
LABELV $1966
line 2557
;2557:			if (value >= UI_GetNumBots() + 2) {
ADDRLP4 16
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 2
ADDI4
LTI4 $1974
line 2558
;2558:				value = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2559
;2559:			} else if (value < 0) {
ADDRGP4 $1975
JUMPV
LABELV $1974
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1976
line 2560
;2560:				value = UI_GetNumBots() + 2 - 1;
ADDRLP4 20
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 2
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 2561
;2561:			}
LABELV $1976
LABELV $1975
line 2562
;2562:		}
LABELV $1967
line 2563
;2563:		uiInfo.botIndex = value;
ADDRGP4 uiInfo+73444
ADDRLP4 4
INDIRI4
ASGNI4
line 2564
;2564:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1957
JUMPV
LABELV $1958
line 2566
;2565:  }
;2566:  return qfalse;
CNSTI4 0
RETI4
LABELV $1957
endproc UI_BotName_HandleKey 24 4
proc UI_BotSkill_HandleKey 8 0
line 2569
;2567:}
;2568:
;2569:static qboolean UI_BotSkill_HandleKey(int flags, float *special, int key) {
line 2570
;2570:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $1984
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $1984
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $1984
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1980
LABELV $1984
line 2571
;2571:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $1985
line 2572
;2572:			uiInfo.skillIndex--;
ADDRLP4 4
ADDRGP4 uiInfo+96672
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2573
;2573:		} else {
ADDRGP4 $1986
JUMPV
LABELV $1985
line 2574
;2574:			uiInfo.skillIndex++;
ADDRLP4 4
ADDRGP4 uiInfo+96672
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2575
;2575:		}
LABELV $1986
line 2576
;2576:		if (uiInfo.skillIndex >= numSkillLevels) {
ADDRGP4 uiInfo+96672
INDIRI4
ADDRGP4 numSkillLevels
INDIRI4
LTI4 $1989
line 2577
;2577:			uiInfo.skillIndex = 0;
ADDRGP4 uiInfo+96672
CNSTI4 0
ASGNI4
line 2578
;2578:		} else if (uiInfo.skillIndex < 0) {
ADDRGP4 $1990
JUMPV
LABELV $1989
ADDRGP4 uiInfo+96672
INDIRI4
CNSTI4 0
GEI4 $1993
line 2579
;2579:			uiInfo.skillIndex = numSkillLevels-1;
ADDRGP4 uiInfo+96672
ADDRGP4 numSkillLevels
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2580
;2580:		}
LABELV $1993
LABELV $1990
line 2581
;2581:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1979
JUMPV
LABELV $1980
line 2583
;2582:  }
;2583:	return qfalse;
CNSTI4 0
RETI4
LABELV $1979
endproc UI_BotSkill_HandleKey 8 0
proc UI_RedBlue_HandleKey 8 0
line 2586
;2584:}
;2585:
;2586:static qboolean UI_RedBlue_HandleKey(int flags, float *special, int key) {
line 2587
;2587:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2002
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2002
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2002
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $1998
LABELV $2002
line 2588
;2588:		uiInfo.redBlue ^= 1;
ADDRLP4 4
ADDRGP4 uiInfo+78840
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2589
;2589:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1997
JUMPV
LABELV $1998
line 2591
;2590:	}
;2591:	return qfalse;
CNSTI4 0
RETI4
LABELV $1997
endproc UI_RedBlue_HandleKey 8 0
proc UI_Crosshair_HandleKey 8 8
line 2594
;2592:}
;2593:
;2594:static qboolean UI_Crosshair_HandleKey(int flags, float *special, int key) {
line 2595
;2595:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2009
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2009
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2009
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2005
LABELV $2009
line 2596
;2596:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2010
line 2597
;2597:			uiInfo.currentCrosshair--;
ADDRLP4 4
ADDRGP4 uiInfo+119476
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2598
;2598:		} else {
ADDRGP4 $2011
JUMPV
LABELV $2010
line 2599
;2599:			uiInfo.currentCrosshair++;
ADDRLP4 4
ADDRGP4 uiInfo+119476
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2600
;2600:		}
LABELV $2011
line 2602
;2601:
;2602:		if (uiInfo.currentCrosshair >= NUM_CROSSHAIRS) {
ADDRGP4 uiInfo+119476
INDIRI4
CNSTI4 10
LTI4 $2014
line 2603
;2603:			uiInfo.currentCrosshair = 0;
ADDRGP4 uiInfo+119476
CNSTI4 0
ASGNI4
line 2604
;2604:		} else if (uiInfo.currentCrosshair < 0) {
ADDRGP4 $2015
JUMPV
LABELV $2014
ADDRGP4 uiInfo+119476
INDIRI4
CNSTI4 0
GEI4 $2018
line 2605
;2605:			uiInfo.currentCrosshair = NUM_CROSSHAIRS - 1;
ADDRGP4 uiInfo+119476
CNSTI4 9
ASGNI4
line 2606
;2606:		}
LABELV $2018
LABELV $2015
line 2607
;2607:		trap_Cvar_Set("cg_drawCrosshair", va("%d", uiInfo.currentCrosshair)); 
ADDRGP4 $713
ARGP4
ADDRGP4 uiInfo+119476
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2022
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2608
;2608:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2004
JUMPV
LABELV $2005
line 2610
;2609:	}
;2610:	return qfalse;
CNSTI4 0
RETI4
LABELV $2004
endproc UI_Crosshair_HandleKey 8 8
proc UI_SelectedPlayer_HandleKey 16 8
line 2615
;2611:}
;2612:
;2613:
;2614:
;2615:static qboolean UI_SelectedPlayer_HandleKey(int flags, float *special, int key) {
line 2616
;2616:  if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 178
EQI4 $2029
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $2029
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2029
ADDRLP4 0
INDIRI4
CNSTI4 169
NEI4 $2025
LABELV $2029
line 2619
;2617:		int selected;
;2618:
;2619:		UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 2620
;2620:		if (!uiInfo.teamLeader) {
ADDRGP4 uiInfo+78868
INDIRI4
CNSTI4 0
NEI4 $2030
line 2621
;2621:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2024
JUMPV
LABELV $2030
line 2623
;2622:		}
;2623:		selected = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1391
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 2625
;2624:		
;2625:		if (key == K_MOUSE2) {
ADDRFP4 8
INDIRI4
CNSTI4 179
NEI4 $2033
line 2626
;2626:			selected--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2627
;2627:		} else {
ADDRGP4 $2034
JUMPV
LABELV $2033
line 2628
;2628:			selected++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2629
;2629:		}
LABELV $2034
line 2631
;2630:
;2631:		if (selected > uiInfo.myTeamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
LEI4 $2035
line 2632
;2632:			selected = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2633
;2633:		} else if (selected < 0) {
ADDRGP4 $2036
JUMPV
LABELV $2035
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2038
line 2634
;2634:			selected = uiInfo.myTeamCount;
ADDRLP4 4
ADDRGP4 uiInfo+78848
INDIRI4
ASGNI4
line 2635
;2635:		}
LABELV $2038
LABELV $2036
line 2637
;2636:
;2637:		if (selected == uiInfo.myTeamCount) {
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
NEI4 $2041
line 2638
;2638:		 	trap_Cvar_Set( "cg_selectedPlayerName", "Everyone");
ADDRGP4 $1399
ARGP4
ADDRGP4 $2044
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2639
;2639:		} else {
ADDRGP4 $2042
JUMPV
LABELV $2041
line 2640
;2640:		 	trap_Cvar_Set( "cg_selectedPlayerName", uiInfo.teamNames[selected]);
ADDRGP4 $1399
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2641
;2641:		}
LABELV $2042
line 2642
;2642:	 	trap_Cvar_Set( "cg_selectedPlayer", va("%d", selected));
ADDRGP4 $713
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1391
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2643
;2643:	}
LABELV $2025
line 2644
;2644:	return qfalse;
CNSTI4 0
RETI4
LABELV $2024
endproc UI_SelectedPlayer_HandleKey 16 8
proc UI_OwnerDrawHandleKey 52 20
line 2648
;2645:}
;2646:
;2647:
;2648:static qboolean UI_OwnerDrawHandleKey(int ownerDraw, int flags, float *special, int key) {
line 2649
;2649:  switch (ownerDraw) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $2048
ADDRLP4 0
INDIRI4
CNSTI4 253
GTI4 $2048
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2068-800
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2068
address $2049
address $2050
address $2048
address $2051
address $2048
address $2052
address $2048
address $2055
address $2056
address $2057
address $2058
address $2058
address $2058
address $2058
address $2058
address $2059
address $2059
address $2059
address $2059
address $2059
address $2060
address $2048
address $2061
address $2048
address $2048
address $2048
address $2048
address $2048
address $2048
address $2048
address $2048
address $2048
address $2048
address $2048
address $2048
address $2048
address $2048
address $2062
address $2048
address $2063
address $2064
address $2065
address $2066
address $2067
address $2048
address $2053
address $2048
address $2048
address $2048
address $2048
address $2048
address $2048
address $2048
address $2054
code
LABELV $2049
line 2651
;2650:    case UI_HANDICAP:
;2651:      return UI_Handicap_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 UI_Handicap_HandleKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $2046
JUMPV
line 2652
;2652:      break;
LABELV $2050
line 2654
;2653:    case UI_EFFECTS:
;2654:      return UI_Effects_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_Effects_HandleKey
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $2046
JUMPV
line 2655
;2655:      break;
LABELV $2051
line 2657
;2656:    case UI_CLANNAME:
;2657:      return UI_ClanName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_ClanName_HandleKey
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $2046
JUMPV
line 2658
;2658:      break;
LABELV $2052
line 2660
;2659:    case UI_GAMETYPE:
;2660:      return UI_GameType_HandleKey(flags, special, key, qtrue);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 UI_GameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $2046
JUMPV
line 2661
;2661:      break;
LABELV $2053
line 2663
;2662:    case UI_NETGAMETYPE:
;2663:      return UI_NetGameType_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_NetGameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $2046
JUMPV
line 2664
;2664:      break;
LABELV $2054
line 2666
;2665:    case UI_JOINGAMETYPE:
;2666:      return UI_JoinGameType_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_JoinGameType_HandleKey
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $2046
JUMPV
line 2667
;2667:      break;
LABELV $2055
line 2669
;2668:    case UI_SKILL:
;2669:      return UI_Skill_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_Skill_HandleKey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $2046
JUMPV
line 2670
;2670:      break;
LABELV $2056
line 2672
;2671:    case UI_BLUETEAMNAME:
;2672:      return UI_TeamName_HandleKey(flags, special, key, qtrue);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 32
ADDRGP4 UI_TeamName_HandleKey
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
ADDRGP4 $2046
JUMPV
line 2673
;2673:      break;
LABELV $2057
line 2675
;2674:    case UI_REDTEAMNAME:
;2675:      return UI_TeamName_HandleKey(flags, special, key, qfalse);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 UI_TeamName_HandleKey
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
RETI4
ADDRGP4 $2046
JUMPV
line 2676
;2676:      break;
LABELV $2058
line 2682
;2677:    case UI_BLUETEAM1:
;2678:		case UI_BLUETEAM2:
;2679:		case UI_BLUETEAM3:
;2680:		case UI_BLUETEAM4:
;2681:		case UI_BLUETEAM5:
;2682:      UI_TeamMember_HandleKey(flags, special, key, qtrue, ownerDraw - UI_BLUETEAM1 + 1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
CNSTI4 210
SUBI4
ADDRLP4 40
INDIRI4
ADDI4
ARGI4
ADDRGP4 UI_TeamMember_HandleKey
CALLI4
pop
line 2683
;2683:      break;
ADDRGP4 $2048
JUMPV
LABELV $2059
line 2689
;2684:    case UI_REDTEAM1:
;2685:		case UI_REDTEAM2:
;2686:		case UI_REDTEAM3:
;2687:		case UI_REDTEAM4:
;2688:		case UI_REDTEAM5:
;2689:      UI_TeamMember_HandleKey(flags, special, key, qfalse, ownerDraw - UI_REDTEAM1 + 1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRI4
CNSTI4 215
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 UI_TeamMember_HandleKey
CALLI4
pop
line 2690
;2690:      break;
ADDRGP4 $2048
JUMPV
LABELV $2060
line 2692
;2691:		case UI_NETSOURCE:
;2692:      UI_NetSource_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_NetSource_HandleKey
CALLI4
pop
line 2693
;2693:			break;
ADDRGP4 $2048
JUMPV
LABELV $2061
line 2695
;2694:		case UI_NETFILTER:
;2695:      UI_NetFilter_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_NetFilter_HandleKey
CALLI4
pop
line 2696
;2696:			break;
ADDRGP4 $2048
JUMPV
LABELV $2062
line 2698
;2697:		case UI_OPPONENT_NAME:
;2698:			UI_OpponentName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_OpponentName_HandleKey
CALLI4
pop
line 2699
;2699:			break;
ADDRGP4 $2048
JUMPV
LABELV $2063
line 2701
;2700:		case UI_BOTNAME:
;2701:			return UI_BotName_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 UI_BotName_HandleKey
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
RETI4
ADDRGP4 $2046
JUMPV
line 2702
;2702:			break;
LABELV $2064
line 2704
;2703:		case UI_BOTSKILL:
;2704:			return UI_BotSkill_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 UI_BotSkill_HandleKey
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
RETI4
ADDRGP4 $2046
JUMPV
line 2705
;2705:			break;
LABELV $2065
line 2707
;2706:		case UI_REDBLUE:
;2707:			UI_RedBlue_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_RedBlue_HandleKey
CALLI4
pop
line 2708
;2708:			break;
ADDRGP4 $2048
JUMPV
LABELV $2066
line 2710
;2709:		case UI_CROSSHAIR:
;2710:			UI_Crosshair_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_Crosshair_HandleKey
CALLI4
pop
line 2711
;2711:			break;
ADDRGP4 $2048
JUMPV
LABELV $2067
line 2713
;2712:		case UI_SELECTEDPLAYER:
;2713:			UI_SelectedPlayer_HandleKey(flags, special, key);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 UI_SelectedPlayer_HandleKey
CALLI4
pop
line 2714
;2714:			break;
line 2716
;2715:    default:
;2716:      break;
LABELV $2048
line 2719
;2717:  }
;2718:
;2719:  return qfalse;
CNSTI4 0
RETI4
LABELV $2046
endproc UI_OwnerDrawHandleKey 52 20
proc UI_GetValue 0 0
line 2723
;2720:}
;2721:
;2722:
;2723:static float UI_GetValue(int ownerDraw) {
line 2724
;2724:  return 0;
CNSTF4 0
RETF4
LABELV $2070
endproc UI_GetValue 0 0
proc UI_ServersQsortCompare 4 20
line 2732
;2725:}
;2726:
;2727:/*
;2728:=================
;2729:UI_ServersQsortCompare
;2730:=================
;2731:*/
;2732:static int QDECL UI_ServersQsortCompare( const void *arg1, const void *arg2 ) {
line 2733
;2733:	return trap_LAN_CompareServers( ui_netSource.integer, uiInfo.serverStatus.sortKey, uiInfo.serverStatus.sortDir, *(int*)arg1, *(int*)arg2);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2200
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2204
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_LAN_CompareServers
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2071
endproc UI_ServersQsortCompare 4 20
export UI_ServersSort
proc UI_ServersSort 0 16
line 2742
;2734:}
;2735:
;2736:
;2737:/*
;2738:=================
;2739:UI_ServersSort
;2740:=================
;2741:*/
;2742:void UI_ServersSort(int column, qboolean force) {
line 2744
;2743:
;2744:	if ( !force ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $2078
line 2745
;2745:		if ( uiInfo.serverStatus.sortKey == column ) {
ADDRGP4 uiInfo+99264+2200
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $2080
line 2746
;2746:			return;
ADDRGP4 $2077
JUMPV
LABELV $2080
line 2748
;2747:		}
;2748:	}
LABELV $2078
line 2750
;2749:
;2750:	uiInfo.serverStatus.sortKey = column;
ADDRGP4 uiInfo+99264+2200
ADDRFP4 0
INDIRI4
ASGNI4
line 2751
;2751:	qsort( &uiInfo.serverStatus.displayServers[0], uiInfo.serverStatus.numDisplayServers, sizeof(int), UI_ServersQsortCompare);
ADDRGP4 uiInfo+99264+2220
ARGP4
ADDRGP4 uiInfo+99264+10412
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_ServersQsortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 2752
;2752:}
LABELV $2077
endproc UI_ServersSort 0 16
proc UI_LoadMods 2092 16
line 2799
;2753:
;2754:/*
;2755:static void UI_StartSinglePlayer() {
;2756:	int i,j, k, skill;
;2757:	char buff[1024];
;2758:	i = trap_Cvar_VariableValue( "ui_currentTier" );
;2759:  if (i < 0 || i >= tierCount) {
;2760:    i = 0;
;2761:  }
;2762:	j = trap_Cvar_VariableValue("ui_currentMap");
;2763:	if (j < 0 || j > MAPS_PER_TIER) {
;2764:		j = 0;
;2765:	}
;2766:
;2767: 	trap_Cvar_SetValue( "singleplayer", 1 );
;2768: 	trap_Cvar_SetValue( "g_gametype", Com_Clamp( 0, 7, tierList[i].gameTypes[j] ) );
;2769:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", tierList[i].maps[j] ) );
;2770:	skill = trap_Cvar_VariableValue( "g_spSkill" );
;2771:
;2772:	if (j == MAPS_PER_TIER-1) {
;2773:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
;2774:		Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[0]), skill, "", teamList[k].teamMembers[0]);
;2775:	} else {
;2776:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
;2777:		for (i = 0; i < PLAYERS_PER_TEAM; i++) {
;2778:			Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[i]), skill, "Blue", teamList[k].teamMembers[i]);
;2779:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
;2780:		}
;2781:
;2782:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
;2783:		for (i = 1; i < PLAYERS_PER_TEAM; i++) {
;2784:			Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %i %s 250 %s\n", UI_AIFromName(teamList[k].teamMembers[i]), skill, "Red", teamList[k].teamMembers[i]);
;2785:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
;2786:		}
;2787:		trap_Cmd_ExecuteText( EXEC_APPEND, "wait 5; team Red\n" );
;2788:	}
;2789:	
;2790:
;2791:}
;2792:*/
;2793:
;2794:/*
;2795:===============
;2796:UI_LoadMods
;2797:===============
;2798:*/
;2799:static void UI_LoadMods() {
line 2807
;2800:	int		numdirs;
;2801:	char	dirlist[2048];
;2802:	char	*dirptr;
;2803:  char  *descptr;
;2804:	int		i;
;2805:	int		dirlen;
;2806:
;2807:	uiInfo.modCount = 0;
ADDRGP4 uiInfo+97188
CNSTI4 0
ASGNI4
line 2808
;2808:	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
ADDRGP4 $2092
ARGP4
ADDRGP4 $109
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2068
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 2068
INDIRI4
ASGNI4
line 2809
;2809:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 20
ASGNP4
line 2810
;2810:	for( i = 0; i < numdirs; i++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $2096
JUMPV
LABELV $2093
line 2811
;2811:		dirlen = strlen( dirptr ) + 1;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 2072
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2812
;2812:    descptr = dirptr + dirlen;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 2813
;2813:		uiInfo.modList[uiInfo.modCount].modName = String_Alloc(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+97188
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96676
ADDP4
ADDRLP4 2076
INDIRP4
ASGNP4
line 2814
;2814:		uiInfo.modList[uiInfo.modCount].modDescr = String_Alloc(descptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRGP4 uiInfo+97188
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96676+4
ADDP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 2815
;2815:    dirptr += dirlen + strlen(descptr) + 1;
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ADDRLP4 2084
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 2816
;2816:		uiInfo.modCount++;
ADDRLP4 2088
ADDRGP4 uiInfo+97188
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2817
;2817:		if (uiInfo.modCount >= MAX_MODS) {
ADDRGP4 uiInfo+97188
INDIRI4
CNSTI4 64
LTI4 $2103
line 2818
;2818:			break;
ADDRGP4 $2095
JUMPV
LABELV $2103
line 2820
;2819:		}
;2820:	}
LABELV $2094
line 2810
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2096
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $2093
LABELV $2095
line 2822
;2821:
;2822:}
LABELV $2090
endproc UI_LoadMods 2092 16
proc UI_LoadTeams 4120 16
line 2830
;2823:
;2824:
;2825:/*
;2826:===============
;2827:UI_LoadTeams
;2828:===============
;2829:*/
;2830:static void UI_LoadTeams() {
line 2835
;2831:	char	teamList[4096];
;2832:	char	*teamName;
;2833:	int		i, len, count;
;2834:
;2835:	count = trap_FS_GetFileList( "", "team", teamList, 4096 );
ADDRGP4 $109
ARGP4
ADDRGP4 $2107
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4112
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 4112
INDIRI4
ASGNI4
line 2837
;2836:
;2837:	if (count) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2108
line 2838
;2838:		teamName = teamList;
ADDRLP4 0
ADDRLP4 16
ASGNP4
line 2839
;2839:		for ( i = 0; i < count; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2113
JUMPV
LABELV $2110
line 2840
;2840:			len = strlen( teamName );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4116
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4116
INDIRI4
ASGNI4
line 2841
;2841:			UI_ParseTeamInfo(teamName);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 UI_ParseTeamInfo
CALLV
pop
line 2842
;2842:			teamName += len + 1;
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 2843
;2843:		}
LABELV $2111
line 2839
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2113
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $2110
line 2844
;2844:	}
LABELV $2108
line 2846
;2845:
;2846:}
LABELV $2106
endproc UI_LoadTeams 4120 16
proc UI_LoadMovies 4124 16
line 2854
;2847:
;2848:
;2849:/*
;2850:===============
;2851:UI_LoadMovies
;2852:===============
;2853:*/
;2854:static void UI_LoadMovies() {
line 2859
;2855:	char	movielist[4096];
;2856:	char	*moviename;
;2857:	int		i, len;
;2858:
;2859:	uiInfo.movieCount = trap_FS_GetFileList( "video", "roq", movielist, 4096 );
ADDRGP4 $2116
ARGP4
ADDRGP4 $2117
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4108
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 uiInfo+99252
ADDRLP4 4108
INDIRI4
ASGNI4
line 2861
;2860:
;2861:	if (uiInfo.movieCount) {
ADDRGP4 uiInfo+99252
INDIRI4
CNSTI4 0
EQI4 $2118
line 2862
;2862:		if (uiInfo.movieCount > MAX_MOVIES) {
ADDRGP4 uiInfo+99252
INDIRI4
CNSTI4 256
LEI4 $2121
line 2863
;2863:			uiInfo.movieCount = MAX_MOVIES;
ADDRGP4 uiInfo+99252
CNSTI4 256
ASGNI4
line 2864
;2864:		}
LABELV $2121
line 2865
;2865:		moviename = movielist;
ADDRLP4 0
ADDRLP4 12
ASGNP4
line 2866
;2866:		for ( i = 0; i < uiInfo.movieCount; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2128
JUMPV
LABELV $2125
line 2867
;2867:			len = strlen( moviename );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4112
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4112
INDIRI4
ASGNI4
line 2868
;2868:			if (!Q_stricmp(moviename +  len - 4,".roq")) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI4 -4
ADDP4
ARGP4
ADDRGP4 $2132
ARGP4
ADDRLP4 4116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4116
INDIRI4
CNSTI4 0
NEI4 $2130
line 2869
;2869:				moviename[len-4] = '\0';
ADDRLP4 4
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 2870
;2870:			}
LABELV $2130
line 2871
;2871:			Q_strupr(moviename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 2872
;2872:			uiInfo.movieList[i] = String_Alloc(moviename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4120
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98228
ADDP4
ADDRLP4 4120
INDIRP4
ASGNP4
line 2873
;2873:			moviename += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 2874
;2874:		}
LABELV $2126
line 2866
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2128
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+99252
INDIRI4
LTI4 $2125
line 2875
;2875:	}
LABELV $2118
line 2877
;2876:
;2877:}
LABELV $2114
endproc UI_LoadMovies 4124 16
proc UI_LoadDemos 4168 16
line 2886
;2878:
;2879:
;2880:
;2881:/*
;2882:===============
;2883:UI_LoadDemos
;2884:===============
;2885:*/
;2886:static void UI_LoadDemos() {
line 2892
;2887:	char	demolist[4096];
;2888:	char demoExt[32];
;2889:	char	*demoname;
;2890:	int		i, len;
;2891:
;2892:	Com_sprintf(demoExt, sizeof(demoExt), "dm_%d", (int)trap_Cvar_VariableValue("protocol"));
ADDRGP4 $2136
ARGP4
ADDRLP4 4140
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2135
ARGP4
ADDRLP4 4140
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2894
;2893:
;2894:	uiInfo.demoCount = trap_FS_GetFileList( "demos", demoExt, demolist, 4096 );
ADDRGP4 $2138
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4144
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRGP4 uiInfo+98220
ADDRLP4 4144
INDIRI4
ASGNI4
line 2896
;2895:
;2896:	Com_sprintf(demoExt, sizeof(demoExt), ".dm_%d", (int)trap_Cvar_VariableValue("protocol"));
ADDRGP4 $2136
ARGP4
ADDRLP4 4148
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2139
ARGP4
ADDRLP4 4148
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2898
;2897:
;2898:	if (uiInfo.demoCount) {
ADDRGP4 uiInfo+98220
INDIRI4
CNSTI4 0
EQI4 $2140
line 2899
;2899:		if (uiInfo.demoCount > MAX_DEMOS) {
ADDRGP4 uiInfo+98220
INDIRI4
CNSTI4 256
LEI4 $2143
line 2900
;2900:			uiInfo.demoCount = MAX_DEMOS;
ADDRGP4 uiInfo+98220
CNSTI4 256
ASGNI4
line 2901
;2901:		}
LABELV $2143
line 2902
;2902:		demoname = demolist;
ADDRLP4 0
ADDRLP4 44
ASGNP4
line 2903
;2903:		for ( i = 0; i < uiInfo.demoCount; i++ ) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 $2150
JUMPV
LABELV $2147
line 2904
;2904:			len = strlen( demoname );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4152
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 4152
INDIRI4
ASGNI4
line 2905
;2905:			if (!Q_stricmp(demoname +  len - strlen(demoExt), demoExt)) {
ADDRLP4 4
ARGP4
ADDRLP4 4156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ADDRLP4 4156
INDIRI4
SUBP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4160
INDIRI4
CNSTI4 0
NEI4 $2152
line 2906
;2906:				demoname[len-strlen(demoExt)] = '\0';
ADDRLP4 4
ARGP4
ADDRLP4 4164
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 4164
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 2907
;2907:			}
LABELV $2152
line 2908
;2908:			Q_strupr(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 2909
;2909:			uiInfo.demoList[i] = String_Alloc(demoname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+97196
ADDP4
ADDRLP4 4164
INDIRP4
ASGNP4
line 2910
;2910:			demoname += len + 1;
ADDRLP4 0
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 2911
;2911:		}
LABELV $2148
line 2903
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2150
ADDRLP4 40
INDIRI4
ADDRGP4 uiInfo+98220
INDIRI4
LTI4 $2147
line 2912
;2912:	}
LABELV $2140
line 2914
;2913:
;2914:}
LABELV $2134
endproc UI_LoadDemos 4168 16
proc UI_SetNextMap 8 16
line 2917
;2915:
;2916:
;2917:static qboolean UI_SetNextMap(int actual, int index) {
line 2919
;2918:	int i;
;2919:	for (i = actual + 1; i < uiInfo.mapCount; i++) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2159
JUMPV
LABELV $2156
line 2920
;2920:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2161
line 2921
;2921:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, index + 1, "skirmish");
CNSTP4 0
ARGP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ARGI4
ADDRGP4 $2165
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 2922
;2922:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2155
JUMPV
LABELV $2161
line 2924
;2923:		}
;2924:	}
LABELV $2157
line 2919
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2159
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LTI4 $2156
line 2925
;2925:	return qfalse;
CNSTI4 0
RETI4
LABELV $2155
endproc UI_SetNextMap 8 16
proc UI_StartSkirmish 1160 32
line 2929
;2926:}
;2927:
;2928:
;2929:static void UI_StartSkirmish(qboolean next) {
line 2934
;2930:	int i, k, g, delay, temp;
;2931:	float skill;
;2932:	char buff[MAX_STRING_CHARS];
;2933:
;2934:	if (next) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2167
line 2936
;2935:		int actual;
;2936:		int index = trap_Cvar_VariableValue("ui_mapIndex");
ADDRGP4 $2169
ARGP4
ADDRLP4 1056
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1048
ADDRLP4 1056
INDIRF4
CVFI4 4
ASGNI4
line 2937
;2937:	 	UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 2938
;2938:		UI_SelectedMap(index, &actual);
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1052
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 2939
;2939:		if (UI_SetNextMap(actual, index)) {
ADDRLP4 1052
INDIRI4
ARGI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 UI_SetNextMap
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $2170
line 2940
;2940:		} else {
ADDRGP4 $2171
JUMPV
LABELV $2170
line 2941
;2941:			UI_GameType_HandleKey(0, 0, K_MOUSE1, qfalse);
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 1064
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 178
ARGI4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 2942
;2942:			UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 2943
;2943:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, 0, "skirmish");
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 $2165
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 2944
;2944:		}
LABELV $2171
line 2945
;2945:	}
LABELV $2167
line 2947
;2946:
;2947:	g = uiInfo.gameTypes[ui_gameType.integer].gtEnum;
ADDRLP4 1040
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ASGNI4
line 2948
;2948:	trap_Cvar_SetValue( "g_gametype", g );
ADDRGP4 $1323
ARGP4
ADDRLP4 1040
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 2949
;2949:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", uiInfo.mapList[ui_currentMap.integer].mapLoadName) );
ADDRGP4 $2175
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 2950
;2950:	skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $824
ARGP4
ADDRLP4 1052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
ADDRLP4 1052
INDIRF4
ASGNF4
line 2951
;2951:	trap_Cvar_Set("ui_scoreMap", uiInfo.mapList[ui_currentMap.integer].mapName);
ADDRGP4 $2179
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2953
;2952:
;2953:	k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1099
ARGP4
ADDRLP4 1056
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1060
INDIRI4
ASGNI4
line 2955
;2954:
;2955:	trap_Cvar_Set("ui_singlePlayerActive", "1");
ADDRGP4 $2182
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2958
;2956:
;2957:	// set up sp overrides, will be replaced on postgame
;2958:	temp = trap_Cvar_VariableValue( "capturelimit" );
ADDRGP4 $715
ARGP4
ADDRLP4 1064
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1064
INDIRF4
CVFI4 4
ASGNI4
line 2959
;2959:	trap_Cvar_Set("ui_saveCaptureLimit", va("%i", temp));
ADDRGP4 $1737
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2183
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2960
;2960:	temp = trap_Cvar_VariableValue( "fraglimit" );
ADDRGP4 $716
ARGP4
ADDRLP4 1072
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1072
INDIRF4
CVFI4 4
ASGNI4
line 2961
;2961:	trap_Cvar_Set("ui_saveFragLimit", va("%i", temp));
ADDRGP4 $1737
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2184
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2963
;2962:
;2963:	UI_SetCapFragLimits(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 2965
;2964:
;2965:	temp = trap_Cvar_VariableValue( "cg_drawTimer" );
ADDRGP4 $2185
ARGP4
ADDRLP4 1080
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1080
INDIRF4
CVFI4 4
ASGNI4
line 2966
;2966:	trap_Cvar_Set("ui_drawTimer", va("%i", temp));
ADDRGP4 $1737
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2186
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2967
;2967:	temp = trap_Cvar_VariableValue( "g_doWarmup" );
ADDRGP4 $2187
ARGP4
ADDRLP4 1088
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1088
INDIRF4
CVFI4 4
ASGNI4
line 2968
;2968:	trap_Cvar_Set("ui_doWarmup", va("%i", temp));
ADDRGP4 $1737
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2188
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2969
;2969:	temp = trap_Cvar_VariableValue( "g_friendlyFire" );
ADDRGP4 $2189
ARGP4
ADDRLP4 1096
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1096
INDIRF4
CVFI4 4
ASGNI4
line 2970
;2970:	trap_Cvar_Set("ui_friendlyFire", va("%i", temp));
ADDRGP4 $1737
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2190
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2971
;2971:	temp = trap_Cvar_VariableValue( "sv_maxClients" );
ADDRGP4 $2191
ARGP4
ADDRLP4 1104
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1104
INDIRF4
CVFI4 4
ASGNI4
line 2972
;2972:	trap_Cvar_Set("ui_maxClients", va("%i", temp));
ADDRGP4 $1737
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2192
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2973
;2973:	temp = trap_Cvar_VariableValue( "g_warmup" );
ADDRGP4 $2193
ARGP4
ADDRLP4 1112
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1112
INDIRF4
CVFI4 4
ASGNI4
line 2974
;2974:	trap_Cvar_Set("ui_Warmup", va("%i", temp));
ADDRGP4 $1737
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1116
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2194
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2975
;2975:	temp = trap_Cvar_VariableValue( "sv_pure" );
ADDRGP4 $2195
ARGP4
ADDRLP4 1120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1036
ADDRLP4 1120
INDIRF4
CVFI4 4
ASGNI4
line 2976
;2976:	trap_Cvar_Set("ui_pure", va("%i", temp));
ADDRGP4 $1737
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1124
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2196
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2978
;2977:
;2978:	trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $391
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2979
;2979:	trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $393
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2980
;2980:	trap_Cvar_Set("cg_drawTimer", "1");
ADDRGP4 $2185
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2981
;2981:	trap_Cvar_Set("g_doWarmup", "1");
ADDRGP4 $2187
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2982
;2982:	trap_Cvar_Set("g_warmup", "15");
ADDRGP4 $2193
ARGP4
ADDRGP4 $692
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2983
;2983:	trap_Cvar_Set("sv_pure", "0");
ADDRGP4 $2195
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2984
;2984:	trap_Cvar_Set("g_friendlyFire", "0");
ADDRGP4 $2189
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2985
;2985:	trap_Cvar_Set("g_redTeam", UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 1128
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2197
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2986
;2986:	trap_Cvar_Set("g_blueTeam", UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1099
ARGP4
ADDRLP4 1132
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2198
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2988
;2987:
;2988:	if (trap_Cvar_VariableValue("ui_recordSPDemo")) {
ADDRGP4 $2201
ARGP4
ADDRLP4 1136
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1136
INDIRF4
CNSTF4 0
EQF4 $2199
line 2989
;2989:		Com_sprintf(buff, MAX_STRING_CHARS, "%s_%i", uiInfo.mapList[ui_currentMap.integer].mapLoadName, g);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2202
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2990
;2990:		trap_Cvar_Set("ui_recordSPDemoName", buff);
ADDRGP4 $2206
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2991
;2991:	}
LABELV $2199
line 2993
;2992:
;2993:	delay = 500;
ADDRLP4 1032
CNSTI4 500
ASGNI4
line 2995
;2994:
;2995:	if (g == GT_TOURNAMENT) {
ADDRLP4 1040
INDIRI4
CNSTI4 1
NEI4 $2207
line 2996
;2996:		trap_Cvar_Set("sv_maxClients", "2");
ADDRGP4 $2191
ARGP4
ADDRGP4 $2209
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2997
;2997:		Com_sprintf( buff, sizeof(buff), "wait ; addbot %s %f "", %i \n", uiInfo.mapList[ui_currentMap.integer].opponentName, skill, delay);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2210
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 2998
;2998:		trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 2999
;2999:	} else {
ADDRGP4 $2208
JUMPV
LABELV $2207
line 3000
;3000:		temp = uiInfo.mapList[ui_currentMap.integer].teamMembers * 2;
ADDRLP4 1036
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+16
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 3001
;3001:		trap_Cvar_Set("sv_maxClients", va("%d", temp));
ADDRGP4 $713
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1140
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2191
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3002
;3002:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2220
JUMPV
LABELV $2217
line 3003
;3003:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_FFA) ? "" : "Blue", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1148
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2224
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2230
ADDRLP4 1144
ADDRGP4 $109
ASGNP4
ADDRGP4 $2231
JUMPV
LABELV $2230
ADDRLP4 1144
ADDRGP4 $839
ASGNP4
LABELV $2231
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3004
;3004:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3005
;3005:			delay += 500;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3006
;3006:		}
LABELV $2218
line 3002
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2220
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+16
ADDP4
INDIRI4
LTI4 $2217
line 3007
;3007:		k = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 1144
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1148
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1148
INDIRI4
ASGNI4
line 3008
;3008:		for (i =0; i < uiInfo.mapList[ui_currentMap.integer].teamMembers-1; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2235
JUMPV
LABELV $2232
line 3009
;3009:			Com_sprintf( buff, sizeof(buff), "addbot %s %f %s %i %s\n", UI_AIFromName(uiInfo.teamList[k].teamMembers[i]), skill, (g == GT_FFA) ? "" : "Red", delay, uiInfo.teamList[k].teamMembers[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1156
ADDRGP4 UI_AIFromName
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2224
ARGP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRLP4 1044
INDIRF4
ARGF4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2244
ADDRLP4 1152
ADDRGP4 $109
ASGNP4
ADDRGP4 $2245
JUMPV
LABELV $2244
ADDRLP4 1152
ADDRGP4 $840
ASGNP4
LABELV $2245
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3010
;3010:			trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3011
;3011:			delay += 500;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3012
;3012:		}
LABELV $2233
line 3008
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2235
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
LTI4 $2232
line 3013
;3013:	}
LABELV $2208
line 3014
;3014:	if (g >= GT_TEAM ) {
ADDRLP4 1040
INDIRI4
CNSTI4 3
LTI4 $2246
line 3015
;3015:		trap_Cmd_ExecuteText( EXEC_APPEND, "wait 5; team Red\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2248
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3016
;3016:	}
LABELV $2246
line 3017
;3017:}
LABELV $2166
endproc UI_StartSkirmish 1160 32
proc UI_Update 36 8
line 3019
;3018:
;3019:static void UI_Update(const char *name) {
line 3020
;3020:	int	val = trap_Cvar_VariableValue(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 3022
;3021:
;3022: 	if (Q_stricmp(name, "ui_SetName") == 0) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2252
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2250
line 3023
;3023:		trap_Cvar_Set( "name", UI_Cvar_VariableString("ui_Name"));
ADDRGP4 $2253
ARGP4
ADDRLP4 12
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $1409
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3024
;3024: 	} else if (Q_stricmp(name, "ui_setRate") == 0) {
ADDRGP4 $2251
JUMPV
LABELV $2250
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2256
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2254
line 3025
;3025:		float rate = trap_Cvar_VariableValue("rate");
ADDRGP4 $2257
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 20
INDIRF4
ASGNF4
line 3026
;3026:		if (rate >= 5000) {
ADDRLP4 16
INDIRF4
CNSTF4 1167867904
LTF4 $2258
line 3027
;3027:			trap_Cvar_Set("cl_maxpackets", "30");
ADDRGP4 $2260
ARGP4
ADDRGP4 $689
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3028
;3028:			trap_Cvar_Set("cl_packetdup", "1");
ADDRGP4 $2261
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3029
;3029:		} else if (rate >= 4000) {
ADDRGP4 $2255
JUMPV
LABELV $2258
ADDRLP4 16
INDIRF4
CNSTF4 1165623296
LTF4 $2262
line 3030
;3030:			trap_Cvar_Set("cl_maxpackets", "15");
ADDRGP4 $2260
ARGP4
ADDRGP4 $692
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3031
;3031:			trap_Cvar_Set("cl_packetdup", "2");		// favor less prediction errors when there's packet loss
ADDRGP4 $2261
ARGP4
ADDRGP4 $2209
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3032
;3032:		} else {
ADDRGP4 $2255
JUMPV
LABELV $2262
line 3033
;3033:			trap_Cvar_Set("cl_maxpackets", "15");
ADDRGP4 $2260
ARGP4
ADDRGP4 $692
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3034
;3034:			trap_Cvar_Set("cl_packetdup", "1");		// favor lower bandwidth
ADDRGP4 $2261
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3035
;3035:		}
line 3036
;3036: 	} else if (Q_stricmp(name, "ui_GetName") == 0) {
ADDRGP4 $2255
JUMPV
LABELV $2254
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2266
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2264
line 3037
;3037:		trap_Cvar_Set( "ui_Name", UI_Cvar_VariableString("name"));
ADDRGP4 $1409
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2253
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3038
;3038: 	} else if (Q_stricmp(name, "r_colorbits") == 0) {
ADDRGP4 $2265
JUMPV
LABELV $2264
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2269
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2267
line 3039
;3039:		switch (val) {
ADDRLP4 24
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 16
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2275
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
GTI4 $2278
LABELV $2277
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2272
ADDRGP4 $2268
JUMPV
LABELV $2278
ADDRLP4 0
INDIRI4
CNSTI4 32
EQI4 $2276
ADDRGP4 $2268
JUMPV
LABELV $2272
line 3041
;3040:			case 0:
;3041:				trap_Cvar_SetValue( "r_depthbits", 0 );
ADDRGP4 $2273
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3042
;3042:				trap_Cvar_SetValue( "r_stencilbits", 0 );
ADDRGP4 $2274
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3043
;3043:			break;
ADDRGP4 $2268
JUMPV
LABELV $2275
line 3045
;3044:			case 16:
;3045:				trap_Cvar_SetValue( "r_depthbits", 16 );
ADDRGP4 $2273
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3046
;3046:				trap_Cvar_SetValue( "r_stencilbits", 0 );
ADDRGP4 $2274
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3047
;3047:			break;
ADDRGP4 $2268
JUMPV
LABELV $2276
line 3049
;3048:			case 32:
;3049:				trap_Cvar_SetValue( "r_depthbits", 24 );
ADDRGP4 $2273
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3050
;3050:			break;
line 3052
;3051:		}
;3052:	} else if (Q_stricmp(name, "r_lodbias") == 0) {
ADDRGP4 $2268
JUMPV
LABELV $2267
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2281
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2279
line 3053
;3053:		switch (val) {
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2284
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $2286
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $2287
ADDRGP4 $2280
JUMPV
LABELV $2284
line 3055
;3054:			case 0:
;3055:				trap_Cvar_SetValue( "r_subdivisions", 4 );
ADDRGP4 $2285
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3056
;3056:			break;
ADDRGP4 $2280
JUMPV
LABELV $2286
line 3058
;3057:			case 1:
;3058:				trap_Cvar_SetValue( "r_subdivisions", 12 );
ADDRGP4 $2285
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3059
;3059:			break;
ADDRGP4 $2280
JUMPV
LABELV $2287
line 3061
;3060:			case 2:
;3061:				trap_Cvar_SetValue( "r_subdivisions", 20 );
ADDRGP4 $2285
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3062
;3062:			break;
line 3064
;3063:		}
;3064:	} else if (Q_stricmp(name, "ui_glCustom") == 0) {
ADDRGP4 $2280
JUMPV
LABELV $2279
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2290
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2288
line 3065
;3065:		switch (val) {
ADDRLP4 32
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $2289
ADDRLP4 32
INDIRI4
CNSTI4 3
GTI4 $2289
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2309
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2309
address $2293
address $2305
address $2306
address $2308
code
LABELV $2293
line 3067
;3066:			case 0:	// high quality
;3067:				trap_Cvar_SetValue( "r_fullScreen", 1 );
ADDRGP4 $2294
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3068
;3068:				trap_Cvar_SetValue( "r_subdivisions", 4 );
ADDRGP4 $2285
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3069
;3069:				trap_Cvar_SetValue( "r_vertexlight", 0 );
ADDRGP4 $2295
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3070
;3070:				trap_Cvar_SetValue( "r_lodbias", 0 );
ADDRGP4 $2281
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3071
;3071:				trap_Cvar_SetValue( "r_colorbits", 32 );
ADDRGP4 $2269
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3072
;3072:				trap_Cvar_SetValue( "r_depthbits", 24 );
ADDRGP4 $2273
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3073
;3073:				trap_Cvar_SetValue( "r_picmip", 0 );
ADDRGP4 $2296
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3074
;3074:				trap_Cvar_SetValue( "r_mode", 4 );
ADDRGP4 $2297
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3075
;3075:				trap_Cvar_SetValue( "r_texturebits", 32 );
ADDRGP4 $2298
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3076
;3076:				trap_Cvar_SetValue( "r_fastSky", 0 );
ADDRGP4 $2299
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3077
;3077:				trap_Cvar_SetValue( "r_inGameVideo", 1 );
ADDRGP4 $2300
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3078
;3078:				trap_Cvar_SetValue( "cg_shadows", 1 );
ADDRGP4 $2301
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3079
;3079:				trap_Cvar_SetValue( "cg_brassTime", 2500 );
ADDRGP4 $2302
ARGP4
CNSTF4 1159479296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3080
;3080:				trap_Cvar_Set( "r_texturemode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $2303
ARGP4
ADDRGP4 $2304
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3081
;3081:			break;
ADDRGP4 $2289
JUMPV
LABELV $2305
line 3083
;3082:			case 1: // normal 
;3083:				trap_Cvar_SetValue( "r_fullScreen", 1 );
ADDRGP4 $2294
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3084
;3084:				trap_Cvar_SetValue( "r_subdivisions", 12 );
ADDRGP4 $2285
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3085
;3085:				trap_Cvar_SetValue( "r_vertexlight", 0 );
ADDRGP4 $2295
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3086
;3086:				trap_Cvar_SetValue( "r_lodbias", 0 );
ADDRGP4 $2281
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3087
;3087:				trap_Cvar_SetValue( "r_colorbits", 0 );
ADDRGP4 $2269
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3088
;3088:				trap_Cvar_SetValue( "r_depthbits", 24 );
ADDRGP4 $2273
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3089
;3089:				trap_Cvar_SetValue( "r_picmip", 1 );
ADDRGP4 $2296
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3090
;3090:				trap_Cvar_SetValue( "r_mode", 3 );
ADDRGP4 $2297
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3091
;3091:				trap_Cvar_SetValue( "r_texturebits", 0 );
ADDRGP4 $2298
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3092
;3092:				trap_Cvar_SetValue( "r_fastSky", 0 );
ADDRGP4 $2299
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3093
;3093:				trap_Cvar_SetValue( "r_inGameVideo", 1 );
ADDRGP4 $2300
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3094
;3094:				trap_Cvar_SetValue( "cg_brassTime", 2500 );
ADDRGP4 $2302
ARGP4
CNSTF4 1159479296
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3095
;3095:				trap_Cvar_Set( "r_texturemode", "GL_LINEAR_MIPMAP_LINEAR" );
ADDRGP4 $2303
ARGP4
ADDRGP4 $2304
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3096
;3096:				trap_Cvar_SetValue( "cg_shadows", 0 );
ADDRGP4 $2301
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3097
;3097:			break;
ADDRGP4 $2289
JUMPV
LABELV $2306
line 3099
;3098:			case 2: // fast
;3099:				trap_Cvar_SetValue( "r_fullScreen", 1 );
ADDRGP4 $2294
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3100
;3100:				trap_Cvar_SetValue( "r_subdivisions", 8 );
ADDRGP4 $2285
ARGP4
CNSTF4 1090519040
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3101
;3101:				trap_Cvar_SetValue( "r_vertexlight", 0 );
ADDRGP4 $2295
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3102
;3102:				trap_Cvar_SetValue( "r_lodbias", 1 );
ADDRGP4 $2281
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3103
;3103:				trap_Cvar_SetValue( "r_colorbits", 0 );
ADDRGP4 $2269
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3104
;3104:				trap_Cvar_SetValue( "r_depthbits", 0 );
ADDRGP4 $2273
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3105
;3105:				trap_Cvar_SetValue( "r_picmip", 1 );
ADDRGP4 $2296
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3106
;3106:				trap_Cvar_SetValue( "r_mode", 3 );
ADDRGP4 $2297
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3107
;3107:				trap_Cvar_SetValue( "r_texturebits", 0 );
ADDRGP4 $2298
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3108
;3108:				trap_Cvar_SetValue( "cg_shadows", 0 );
ADDRGP4 $2301
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3109
;3109:				trap_Cvar_SetValue( "r_fastSky", 1 );
ADDRGP4 $2299
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3110
;3110:				trap_Cvar_SetValue( "r_inGameVideo", 0 );
ADDRGP4 $2300
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3111
;3111:				trap_Cvar_SetValue( "cg_brassTime", 0 );
ADDRGP4 $2302
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3112
;3112:				trap_Cvar_Set( "r_texturemode", "GL_LINEAR_MIPMAP_NEAREST" );
ADDRGP4 $2303
ARGP4
ADDRGP4 $2307
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3113
;3113:			break;
ADDRGP4 $2289
JUMPV
LABELV $2308
line 3115
;3114:			case 3: // fastest
;3115:				trap_Cvar_SetValue( "r_fullScreen", 1 );
ADDRGP4 $2294
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3116
;3116:				trap_Cvar_SetValue( "r_subdivisions", 20 );
ADDRGP4 $2285
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3117
;3117:				trap_Cvar_SetValue( "r_vertexlight", 1 );
ADDRGP4 $2295
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3118
;3118:				trap_Cvar_SetValue( "r_lodbias", 2 );
ADDRGP4 $2281
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3119
;3119:				trap_Cvar_SetValue( "r_colorbits", 16 );
ADDRGP4 $2269
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3120
;3120:				trap_Cvar_SetValue( "r_depthbits", 16 );
ADDRGP4 $2273
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3121
;3121:				trap_Cvar_SetValue( "r_mode", 3 );
ADDRGP4 $2297
ARGP4
CNSTF4 1077936128
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3122
;3122:				trap_Cvar_SetValue( "r_picmip", 2 );
ADDRGP4 $2296
ARGP4
CNSTF4 1073741824
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3123
;3123:				trap_Cvar_SetValue( "r_texturebits", 16 );
ADDRGP4 $2298
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3124
;3124:				trap_Cvar_SetValue( "cg_shadows", 0 );
ADDRGP4 $2301
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3125
;3125:				trap_Cvar_SetValue( "cg_brassTime", 0 );
ADDRGP4 $2302
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3126
;3126:				trap_Cvar_SetValue( "r_fastSky", 1 );
ADDRGP4 $2299
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3127
;3127:				trap_Cvar_SetValue( "r_inGameVideo", 0 );
ADDRGP4 $2300
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3128
;3128:				trap_Cvar_Set( "r_texturemode", "GL_LINEAR_MIPMAP_NEAREST" );
ADDRGP4 $2303
ARGP4
ADDRGP4 $2307
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3129
;3129:			break;
line 3131
;3130:		}
;3131:	} else if (Q_stricmp(name, "ui_mousePitch") == 0) {
ADDRGP4 $2289
JUMPV
LABELV $2288
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2312
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $2310
line 3132
;3132:		if (val == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2313
line 3133
;3133:			trap_Cvar_SetValue( "m_pitch", 0.022f );
ADDRGP4 $2315
ARGP4
CNSTF4 1018444120
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3134
;3134:		} else {
ADDRGP4 $2314
JUMPV
LABELV $2313
line 3135
;3135:			trap_Cvar_SetValue( "m_pitch", -0.022f );
ADDRGP4 $2315
ARGP4
CNSTF4 3165927768
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3136
;3136:		}
LABELV $2314
line 3137
;3137:	}
LABELV $2310
LABELV $2289
LABELV $2280
LABELV $2268
LABELV $2265
LABELV $2255
LABELV $2251
line 3138
;3138:}
LABELV $2249
endproc UI_Update 36 8
proc UI_RunMenuScript 1304 24
line 3140
;3139:
;3140:static void UI_RunMenuScript(char **args) {
line 3144
;3141:	const char *name, *name2;
;3142:	char buff[1024];
;3143:
;3144:	if (String_Parse(args, &name)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1032
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $2317
line 3145
;3145:		if (Q_stricmp(name, "StartServer") == 0) {
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2321
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $2319
line 3148
;3146:			int i, clients, oldclients;
;3147:			float skill;
;3148:			trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $393
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3149
;3149:			trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $391
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3150
;3150:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2182
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3151
;3151:			trap_Cvar_SetValue( "dedicated", Com_Clamp( 0, 2, ui_dedicated.integer ) );
CNSTF4 0
ARGF4
CNSTF4 1073741824
ARGF4
ADDRGP4 ui_dedicated+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1056
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $2322
ARGP4
ADDRLP4 1056
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3152
;3152:			trap_Cvar_SetValue( "g_gametype", Com_Clamp( 0, 8, uiInfo.gameTypes[ui_netGameType.integer].gtEnum ) );
CNSTF4 0
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 1060
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $1323
ARGP4
ADDRLP4 1060
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 3153
;3153:			trap_Cvar_Set("g_redTeam", UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 1064
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2197
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3154
;3154:			trap_Cvar_Set("g_blueTeam", UI_Cvar_VariableString("ui_opponentName"));
ADDRGP4 $1099
ARGP4
ADDRLP4 1068
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $2198
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3155
;3155:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", uiInfo.mapList[ui_currentNetMap.integer].mapLoadName ) );
ADDRGP4 $2175
ARGP4
CNSTI4 100
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3156
;3156:			skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $824
ARGP4
ADDRLP4 1076
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1048
ADDRLP4 1076
INDIRF4
ASGNF4
line 3158
;3157:			// set max clients based on spots
;3158:			oldclients = trap_Cvar_VariableValue( "sv_maxClients" );
ADDRGP4 $2191
ARGP4
ADDRLP4 1080
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1052
ADDRLP4 1080
INDIRF4
CVFI4 4
ASGNI4
line 3159
;3159:			clients = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 3160
;3160:			for (i = 0; i < PLAYERS_PER_TEAM; i++) {
ADDRLP4 1040
CNSTI4 0
ASGNI4
LABELV $2330
line 3161
;3161:				int bot = trap_Cvar_VariableValue( va("ui_blueteam%i", i+1));
ADDRGP4 $846
ARGP4
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1088
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1084
ADDRLP4 1092
INDIRF4
CVFI4 4
ASGNI4
line 3162
;3162:				if (bot >= 0) {
ADDRLP4 1084
INDIRI4
CNSTI4 0
LTI4 $2334
line 3163
;3163:					clients++;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3164
;3164:				}
LABELV $2334
line 3165
;3165:				bot = trap_Cvar_VariableValue( va("ui_redteam%i", i+1));
ADDRGP4 $847
ARGP4
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1096
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1084
ADDRLP4 1100
INDIRF4
CVFI4 4
ASGNI4
line 3166
;3166:				if (bot >= 0) {
ADDRLP4 1084
INDIRI4
CNSTI4 0
LTI4 $2336
line 3167
;3167:					clients++;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3168
;3168:				}
LABELV $2336
line 3169
;3169:			}
LABELV $2331
line 3160
ADDRLP4 1040
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 5
LTI4 $2330
line 3170
;3170:			if (clients == 0) {
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $2338
line 3171
;3171:				clients = 8;
ADDRLP4 1044
CNSTI4 8
ASGNI4
line 3172
;3172:			}
LABELV $2338
line 3174
;3173:			
;3174:			if (oldclients > clients) {
ADDRLP4 1052
INDIRI4
ADDRLP4 1044
INDIRI4
LEI4 $2340
line 3175
;3175:				clients = oldclients;
ADDRLP4 1044
ADDRLP4 1052
INDIRI4
ASGNI4
line 3176
;3176:			}
LABELV $2340
line 3178
;3177:
;3178:			trap_Cvar_Set("sv_maxClients", va("%d",clients));
ADDRGP4 $713
ARGP4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2191
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3180
;3179:
;3180:			for (i = 0; i < PLAYERS_PER_TEAM; i++) {
ADDRLP4 1040
CNSTI4 0
ASGNI4
LABELV $2342
line 3181
;3181:				int bot = trap_Cvar_VariableValue( va("ui_blueteam%i", i+1));
ADDRGP4 $846
ARGP4
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1088
ADDRLP4 1096
INDIRF4
CVFI4 4
ASGNI4
line 3182
;3182:				if (bot > 1) {
ADDRLP4 1088
INDIRI4
CNSTI4 1
LEI4 $2346
line 3183
;3183:					if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 3
LTI4 $2348
line 3184
;3184:						Com_sprintf( buff, sizeof(buff), "addbot %s %f %s\n", uiInfo.characterList[bot-2].name, skill, "Blue");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2351
ARGP4
CNSTI4 24
ADDRLP4 1088
INDIRI4
MULI4
ADDRGP4 uiInfo+73448-48
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
INDIRF4
ARGF4
ADDRGP4 $839
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3185
;3185:					} else {
ADDRGP4 $2349
JUMPV
LABELV $2348
line 3186
;3186:						Com_sprintf( buff, sizeof(buff), "addbot %s %f \n", UI_GetBotNameByNumber(bot-2), skill);
ADDRLP4 1088
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1100
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2354
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1048
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 3187
;3187:					}
LABELV $2349
line 3188
;3188:					trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3189
;3189:				}
LABELV $2346
line 3190
;3190:				bot = trap_Cvar_VariableValue( va("ui_redteam%i", i+1));
ADDRGP4 $847
ARGP4
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1104
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1088
ADDRLP4 1104
INDIRF4
CVFI4 4
ASGNI4
line 3191
;3191:				if (bot > 1) {
ADDRLP4 1088
INDIRI4
CNSTI4 1
LEI4 $2355
line 3192
;3192:					if (ui_actualNetGameType.integer >= GT_TEAM) {
ADDRGP4 ui_actualNetGameType+12
INDIRI4
CNSTI4 3
LTI4 $2357
line 3193
;3193:						Com_sprintf( buff, sizeof(buff), "addbot %s %f %s\n", uiInfo.characterList[bot-2].name, skill, "Red");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2351
ARGP4
CNSTI4 24
ADDRLP4 1088
INDIRI4
MULI4
ADDRGP4 uiInfo+73448-48
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
INDIRF4
ARGF4
ADDRGP4 $840
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3194
;3194:					} else {
ADDRGP4 $2358
JUMPV
LABELV $2357
line 3195
;3195:						Com_sprintf( buff, sizeof(buff), "addbot %s %f \n", UI_GetBotNameByNumber(bot-2), skill);
ADDRLP4 1088
INDIRI4
CNSTI4 2
SUBI4
ARGI4
ADDRLP4 1108
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2354
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1048
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 3196
;3196:					}
LABELV $2358
line 3197
;3197:					trap_Cmd_ExecuteText( EXEC_APPEND, buff );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3198
;3198:				}
LABELV $2355
line 3199
;3199:			}
LABELV $2343
line 3180
ADDRLP4 1040
ADDRLP4 1040
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 5
LTI4 $2342
line 3200
;3200:		} else if (Q_stricmp(name, "updateSPMenu") == 0) {
ADDRGP4 $2320
JUMPV
LABELV $2319
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2364
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2362
line 3201
;3201:			UI_SetCapFragLimits(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_SetCapFragLimits
CALLV
pop
line 3202
;3202:			UI_MapCountByGameType(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 3203
;3203:			ui_mapIndex.integer = UI_GetIndexFromSelection(ui_currentMap.integer);
ADDRGP4 ui_currentMap+12
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 UI_GetIndexFromSelection
CALLI4
ASGNI4
ADDRGP4 ui_mapIndex+12
ADDRLP4 1044
INDIRI4
ASGNI4
line 3204
;3204:			trap_Cvar_Set("ui_mapIndex", va("%d", ui_mapIndex.integer));
ADDRGP4 $713
ARGP4
ADDRGP4 ui_mapIndex+12
INDIRI4
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2169
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3205
;3205:			Menu_SetFeederSelection(NULL, FEEDER_MAPS, ui_mapIndex.integer, "skirmish");
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ui_mapIndex+12
INDIRI4
ARGI4
ADDRGP4 $2165
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3206
;3206:			UI_GameType_HandleKey(0, 0, K_MOUSE1, qfalse);
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 178
ARGI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 3207
;3207:			UI_GameType_HandleKey(0, 0, K_MOUSE2, qfalse);
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
CNSTP4 0
ARGP4
CNSTI4 179
ARGI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRGP4 UI_GameType_HandleKey
CALLI4
pop
line 3208
;3208:		} else if (Q_stricmp(name, "resetDefaults") == 0) {
ADDRGP4 $2363
JUMPV
LABELV $2362
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2371
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $2369
line 3209
;3209:			trap_Cmd_ExecuteText( EXEC_APPEND, "exec default.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $2372
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3210
;3210:			trap_Cmd_ExecuteText( EXEC_APPEND, "cvar_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $2373
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3211
;3211:			Controls_SetDefaults();
ADDRGP4 Controls_SetDefaults
CALLV
pop
line 3212
;3212:			trap_Cvar_Set("com_introPlayed", "1" );
ADDRGP4 $2374
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3213
;3213:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2375
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3214
;3214:		} else if (Q_stricmp(name, "getCDKey") == 0) {
ADDRGP4 $2370
JUMPV
LABELV $2369
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2378
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $2376
line 3216
;3215:			char out[17];
;3216:			trap_GetCDKey(buff, 17);
ADDRLP4 0
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 trap_GetCDKey
CALLV
pop
line 3217
;3217:			trap_Cvar_Set("cdkey1", "");
ADDRGP4 $2379
ARGP4
ADDRGP4 $109
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3218
;3218:			trap_Cvar_Set("cdkey2", "");
ADDRGP4 $2380
ARGP4
ADDRGP4 $109
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3219
;3219:			trap_Cvar_Set("cdkey3", "");
ADDRGP4 $2381
ARGP4
ADDRGP4 $109
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3220
;3220:			trap_Cvar_Set("cdkey4", "");
ADDRGP4 $2382
ARGP4
ADDRGP4 $109
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3221
;3221:			if (strlen(buff) == CDKEY_LEN) {
ADDRLP4 0
ARGP4
ADDRLP4 1072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 16
NEI4 $2377
line 3222
;3222:				Q_strncpyz(out, buff, 5);
ADDRLP4 1052
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3223
;3223:				trap_Cvar_Set("cdkey1", out);
ADDRGP4 $2379
ARGP4
ADDRLP4 1052
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3224
;3224:				Q_strncpyz(out, buff + 4, 5);
ADDRLP4 1052
ARGP4
ADDRLP4 0+4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3225
;3225:				trap_Cvar_Set("cdkey2", out);
ADDRGP4 $2380
ARGP4
ADDRLP4 1052
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3226
;3226:				Q_strncpyz(out, buff + 8, 5);
ADDRLP4 1052
ARGP4
ADDRLP4 0+8
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3227
;3227:				trap_Cvar_Set("cdkey3", out);
ADDRGP4 $2381
ARGP4
ADDRLP4 1052
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3228
;3228:				Q_strncpyz(out, buff + 12, 5);
ADDRLP4 1052
ARGP4
ADDRLP4 0+12
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3229
;3229:				trap_Cvar_Set("cdkey4", out);
ADDRGP4 $2382
ARGP4
ADDRLP4 1052
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3230
;3230:			}
line 3232
;3231:
;3232:		} else if (Q_stricmp(name, "verifyCDKey") == 0) {
ADDRGP4 $2377
JUMPV
LABELV $2376
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2390
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $2388
line 3233
;3233:			buff[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 3234
;3234:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey1")); 
ADDRGP4 $2379
ARGP4
ADDRLP4 1056
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 3235
;3235:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey2")); 
ADDRGP4 $2380
ARGP4
ADDRLP4 1060
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 3236
;3236:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey3")); 
ADDRGP4 $2381
ARGP4
ADDRLP4 1064
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 3237
;3237:			Q_strcat(buff, 1024, UI_Cvar_VariableString("cdkey4")); 
ADDRGP4 $2382
ARGP4
ADDRLP4 1068
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 3238
;3238:			trap_Cvar_Set("cdkey", buff);
ADDRGP4 $2391
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3239
;3239:			if (trap_VerifyCDKey(buff, UI_Cvar_VariableString("cdkeychecksum"))) {
ADDRGP4 $2394
ARGP4
ADDRLP4 1072
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 trap_VerifyCDKey
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
EQI4 $2392
line 3240
;3240:				trap_Cvar_Set("ui_cdkeyvalid", "CD Key Appears to be valid.");
ADDRGP4 $2395
ARGP4
ADDRGP4 $2396
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3241
;3241:				trap_SetCDKey(buff);
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetCDKey
CALLV
pop
line 3242
;3242:			} else {
ADDRGP4 $2389
JUMPV
LABELV $2392
line 3243
;3243:				trap_Cvar_Set("ui_cdkeyvalid", "CD Key does not appear to be valid.");
ADDRGP4 $2395
ARGP4
ADDRGP4 $2397
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3244
;3244:			}
line 3245
;3245:		} else if (Q_stricmp(name, "loadArenas") == 0) {
ADDRGP4 $2389
JUMPV
LABELV $2388
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2400
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $2398
line 3246
;3246:			UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 3247
;3247:			UI_MapCountByGameType(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_MapCountByGameType
CALLI4
pop
line 3248
;3248:			Menu_SetFeederSelection(NULL, FEEDER_ALLMAPS, 0, "createserver");
CNSTP4 0
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 $2401
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3249
;3249:		} else if (Q_stricmp(name, "saveControls") == 0) {
ADDRGP4 $2399
JUMPV
LABELV $2398
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2404
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $2402
line 3250
;3250:			Controls_SetConfig(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 Controls_SetConfig
CALLV
pop
line 3251
;3251:		} else if (Q_stricmp(name, "loadControls") == 0) {
ADDRGP4 $2403
JUMPV
LABELV $2402
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2407
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2405
line 3252
;3252:			Controls_GetConfig();
ADDRGP4 Controls_GetConfig
CALLV
pop
line 3253
;3253:		} else if (Q_stricmp(name, "clearError") == 0) {
ADDRGP4 $2406
JUMPV
LABELV $2405
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2410
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $2408
line 3254
;3254:			trap_Cvar_Set("com_errorMessage", "");
ADDRGP4 $2411
ARGP4
ADDRGP4 $109
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3255
;3255:		} else if (Q_stricmp(name, "loadGameInfo") == 0) {
ADDRGP4 $2409
JUMPV
LABELV $2408
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2414
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $2412
line 3259
;3256:#ifdef PRE_RELEASE_TADEMO
;3257:			UI_ParseGameInfo("demogameinfo.txt");
;3258:#else
;3259:			UI_ParseGameInfo("gameinfo.txt");
ADDRGP4 $674
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 3261
;3260:#endif
;3261:			UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 3262
;3262:		} else if (Q_stricmp(name, "resetScores") == 0) {
ADDRGP4 $2413
JUMPV
LABELV $2412
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2423
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $2421
line 3263
;3263:			UI_ClearScores();
ADDRGP4 UI_ClearScores
CALLV
pop
line 3264
;3264:		} else if (Q_stricmp(name, "RefreshServers") == 0) {
ADDRGP4 $2422
JUMPV
LABELV $2421
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2426
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $2424
line 3265
;3265:			UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 3266
;3266:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3267
;3267:		} else if (Q_stricmp(name, "RefreshFilter") == 0) {
ADDRGP4 $2425
JUMPV
LABELV $2424
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2429
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $2427
line 3268
;3268:			UI_StartServerRefresh(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 3269
;3269:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3270
;3270:		} else if (Q_stricmp(name, "RunSPDemo") == 0) {
ADDRGP4 $2428
JUMPV
LABELV $2427
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2432
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $2430
line 3271
;3271:			if (uiInfo.demoAvailable) {
ADDRGP4 uiInfo+73432
INDIRI4
CNSTI4 0
EQI4 $2431
line 3272
;3272:			  trap_Cmd_ExecuteText( EXEC_APPEND, va("demo %s_%i\n", uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum));
ADDRGP4 $2436
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3273
;3273:			}
line 3274
;3274:		} else if (Q_stricmp(name, "LoadDemos") == 0) {
ADDRGP4 $2431
JUMPV
LABELV $2430
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2445
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $2443
line 3275
;3275:			UI_LoadDemos();
ADDRGP4 UI_LoadDemos
CALLV
pop
line 3276
;3276:		} else if (Q_stricmp(name, "LoadMovies") == 0) {
ADDRGP4 $2444
JUMPV
LABELV $2443
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2448
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $2446
line 3277
;3277:			UI_LoadMovies();
ADDRGP4 UI_LoadMovies
CALLV
pop
line 3278
;3278:		} else if (Q_stricmp(name, "LoadMods") == 0) {
ADDRGP4 $2447
JUMPV
LABELV $2446
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2451
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $2449
line 3279
;3279:			UI_LoadMods();
ADDRGP4 UI_LoadMods
CALLV
pop
line 3280
;3280:		} else if (Q_stricmp(name, "playMovie") == 0) {
ADDRGP4 $2450
JUMPV
LABELV $2449
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2454
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $2452
line 3281
;3281:			if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+99260
INDIRI4
CNSTI4 0
LTI4 $2455
line 3282
;3282:			  trap_CIN_StopCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99260
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 3283
;3283:			}
LABELV $2455
line 3284
;3284:			trap_Cmd_ExecuteText( EXEC_APPEND, va("cinematic %s.roq 2\n", uiInfo.movieList[uiInfo.movieIndex]));
ADDRGP4 $2459
ARGP4
ADDRGP4 uiInfo+99256
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98228
ADDP4
INDIRP4
ARGP4
ADDRLP4 1108
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3285
;3285:		} else if (Q_stricmp(name, "RunMod") == 0) {
ADDRGP4 $2453
JUMPV
LABELV $2452
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2464
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $2462
line 3286
;3286:			trap_Cvar_Set( "fs_game", uiInfo.modList[uiInfo.modIndex].modName);
ADDRGP4 $2465
ARGP4
ADDRGP4 uiInfo+97192
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96676
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3287
;3287:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $2468
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3288
;3288:		} else if (Q_stricmp(name, "RunDemo") == 0) {
ADDRGP4 $2463
JUMPV
LABELV $2462
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2471
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $2469
line 3289
;3289:			trap_Cmd_ExecuteText( EXEC_APPEND, va("demo %s\n", uiInfo.demoList[uiInfo.demoIndex]));
ADDRGP4 $2472
ARGP4
ADDRGP4 uiInfo+98224
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+97196
ADDP4
INDIRP4
ARGP4
ADDRLP4 1116
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3290
;3290:		} else if (Q_stricmp(name, "Quake3") == 0) {
ADDRGP4 $2470
JUMPV
LABELV $2469
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2477
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $2475
line 3291
;3291:			trap_Cvar_Set( "fs_game", "");
ADDRGP4 $2465
ARGP4
ADDRGP4 $109
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3292
;3292:			trap_Cmd_ExecuteText( EXEC_APPEND, "vid_restart;" );
CNSTI4 2
ARGI4
ADDRGP4 $2468
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3293
;3293:		} else if (Q_stricmp(name, "closeJoin") == 0) {
ADDRGP4 $2476
JUMPV
LABELV $2475
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2480
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $2478
line 3294
;3294:			if (uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+99264+2212
INDIRI4
CNSTI4 0
EQI4 $2481
line 3295
;3295:				UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 3296
;3296:				uiInfo.serverStatus.nextDisplayRefresh = 0;
ADDRGP4 uiInfo+99264+10420
CNSTI4 0
ASGNI4
line 3297
;3297:				uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+114144
CNSTI4 0
ASGNI4
line 3298
;3298:				uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+119472
CNSTI4 0
ASGNI4
line 3299
;3299:				UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3300
;3300:			} else {
ADDRGP4 $2479
JUMPV
LABELV $2481
line 3301
;3301:				Menus_CloseByName("joinserver");
ADDRGP4 $2489
ARGP4
ADDRGP4 Menus_CloseByName
CALLV
pop
line 3302
;3302:				Menus_OpenByName("main");
ADDRGP4 $2490
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 3303
;3303:			}
line 3304
;3304:		} else if (Q_stricmp(name, "StopRefresh") == 0) {
ADDRGP4 $2479
JUMPV
LABELV $2478
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2493
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $2491
line 3305
;3305:			UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 3306
;3306:			uiInfo.serverStatus.nextDisplayRefresh = 0;
ADDRGP4 uiInfo+99264+10420
CNSTI4 0
ASGNI4
line 3307
;3307:			uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+114144
CNSTI4 0
ASGNI4
line 3308
;3308:			uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+119472
CNSTI4 0
ASGNI4
line 3309
;3309:		} else if (Q_stricmp(name, "UpdateFilter") == 0) {
ADDRGP4 $2492
JUMPV
LABELV $2491
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2500
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $2498
line 3310
;3310:			if (ui_netSource.integer == AS_LOCAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $2501
line 3311
;3311:				UI_StartServerRefresh(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerRefresh
CALLV
pop
line 3312
;3312:			}
LABELV $2501
line 3313
;3313:			UI_BuildServerDisplayList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 3314
;3314:			UI_FeederSelection(FEEDER_SERVERS, 0);
CNSTF4 1073741824
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 UI_FeederSelection
CALLV
pop
line 3315
;3315:		} else if (Q_stricmp(name, "ServerStatus") == 0) {
ADDRGP4 $2499
JUMPV
LABELV $2498
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2506
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $2504
line 3316
;3316:			trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], uiInfo.serverStatusAddress, sizeof(uiInfo.serverStatusAddress));
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 uiInfo+110748
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 3317
;3317:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 3318
;3318:		} else if (Q_stricmp(name, "FoundPlayerServerStatus") == 0) {
ADDRGP4 $2505
JUMPV
LABELV $2504
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2516
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $2514
line 3319
;3319:			Q_strncpyz(uiInfo.serverStatusAddress, uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer], sizeof(uiInfo.serverStatusAddress));
ADDRGP4 uiInfo+110748
ARGP4
ADDRGP4 uiInfo+119464
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117416
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3320
;3320:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 3321
;3321:			Menu_SetFeederSelection(NULL, FEEDER_FINDPLAYER, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3322
;3322:		} else if (Q_stricmp(name, "FindPlayer") == 0) {
ADDRGP4 $2515
JUMPV
LABELV $2514
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2523
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $2521
line 3323
;3323:			UI_BuildFindPlayerList(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildFindPlayerList
CALLV
pop
line 3325
;3324:			// clear the displayed server status info
;3325:			uiInfo.serverStatusInfo.numLines = 0;
ADDRGP4 uiInfo+110812+3328
CNSTI4 0
ASGNI4
line 3326
;3326:			Menu_SetFeederSelection(NULL, FEEDER_FINDPLAYER, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3327
;3327:		} else if (Q_stricmp(name, "JoinServer") == 0) {
ADDRGP4 $2522
JUMPV
LABELV $2521
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2528
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $2526
line 3328
;3328:			trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $393
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3329
;3329:			trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $391
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3330
;3330:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2182
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3331
;3331:			if (uiInfo.serverStatus.currentServer >= 0 && uiInfo.serverStatus.currentServer < uiInfo.serverStatus.numDisplayServers) {
ADDRGP4 uiInfo+99264+2216
INDIRI4
CNSTI4 0
LTI4 $2527
ADDRGP4 uiInfo+99264+2216
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
GEI4 $2527
line 3332
;3332:				trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, 1024);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 3333
;3333:				trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", buff ) );
ADDRGP4 $2542
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1148
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3334
;3334:			}
line 3335
;3335:		} else if (Q_stricmp(name, "FoundPlayerJoinServer") == 0) {
ADDRGP4 $2527
JUMPV
LABELV $2526
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2545
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $2543
line 3336
;3336:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2182
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3337
;3337:			if (uiInfo.currentFoundPlayerServer >= 0 && uiInfo.currentFoundPlayerServer < uiInfo.numFoundPlayerServers) {
ADDRGP4 uiInfo+119464
INDIRI4
CNSTI4 0
LTI4 $2544
ADDRGP4 uiInfo+119464
INDIRI4
ADDRGP4 uiInfo+119468
INDIRI4
GEI4 $2544
line 3338
;3338:				trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer] ) );
ADDRGP4 $2542
ARGP4
ADDRGP4 uiInfo+119464
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117416
ADDP4
ARGP4
ADDRLP4 1152
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3339
;3339:			}
line 3340
;3340:		} else if (Q_stricmp(name, "Quit") == 0) {
ADDRGP4 $2544
JUMPV
LABELV $2543
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2555
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $2553
line 3341
;3341:			trap_Cvar_Set("ui_singlePlayerActive", "0");
ADDRGP4 $2182
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3342
;3342:			trap_Cmd_ExecuteText( EXEC_NOW, "quit");
CNSTI4 0
ARGI4
ADDRGP4 $2556
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3343
;3343:		} else if (Q_stricmp(name, "Controls") == 0) {
ADDRGP4 $2554
JUMPV
LABELV $2553
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2559
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $2557
line 3344
;3344:		  trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $2560
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3345
;3345:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 3346
;3346:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 3347
;3347:			Menus_ActivateByName("setup_menu2");
ADDRGP4 $2561
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 3348
;3348:		} else if (Q_stricmp(name, "Leave") == 0) {
ADDRGP4 $2558
JUMPV
LABELV $2557
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2564
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $2562
line 3349
;3349:			trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2565
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3350
;3350:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 3351
;3351:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 3352
;3352:			Menus_ActivateByName("main");
ADDRGP4 $2490
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 3353
;3353:		} else if (Q_stricmp(name, "ServerSort") == 0) {
ADDRGP4 $2563
JUMPV
LABELV $2562
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2568
ARGP4
ADDRLP4 1164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $2566
line 3355
;3354:			int sortColumn;
;3355:			if (Int_Parse(args, &sortColumn)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1168
ARGP4
ADDRLP4 1172
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
EQI4 $2567
line 3357
;3356:				// if same column we're already sorting on then flip the direction
;3357:				if (sortColumn == uiInfo.serverStatus.sortKey) {
ADDRLP4 1168
INDIRI4
ADDRGP4 uiInfo+99264+2200
INDIRI4
NEI4 $2571
line 3358
;3358:					uiInfo.serverStatus.sortDir = !uiInfo.serverStatus.sortDir;
ADDRGP4 uiInfo+99264+2204
INDIRI4
CNSTI4 0
NEI4 $2580
ADDRLP4 1176
CNSTI4 1
ASGNI4
ADDRGP4 $2581
JUMPV
LABELV $2580
ADDRLP4 1176
CNSTI4 0
ASGNI4
LABELV $2581
ADDRGP4 uiInfo+99264+2204
ADDRLP4 1176
INDIRI4
ASGNI4
line 3359
;3359:				}
LABELV $2571
line 3361
;3360:				// make sure we sort again
;3361:				UI_ServersSort(sortColumn, qtrue);
ADDRLP4 1168
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_ServersSort
CALLV
pop
line 3362
;3362:			}
line 3363
;3363:		} else if (Q_stricmp(name, "nextSkirmish") == 0) {
ADDRGP4 $2567
JUMPV
LABELV $2566
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2584
ARGP4
ADDRLP4 1168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
NEI4 $2582
line 3364
;3364:			UI_StartSkirmish(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartSkirmish
CALLV
pop
line 3365
;3365:		} else if (Q_stricmp(name, "SkirmishStart") == 0) {
ADDRGP4 $2583
JUMPV
LABELV $2582
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2587
ARGP4
ADDRLP4 1172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
NEI4 $2585
line 3366
;3366:			UI_StartSkirmish(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_StartSkirmish
CALLV
pop
line 3367
;3367:		} else if (Q_stricmp(name, "closeingame") == 0) {
ADDRGP4 $2586
JUMPV
LABELV $2585
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2590
ARGP4
ADDRLP4 1176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
NEI4 $2588
line 3368
;3368:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1180
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 3369
;3369:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 3370
;3370:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2560
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3371
;3371:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 3372
;3372:		} else if (Q_stricmp(name, "voteMap") == 0) {
ADDRGP4 $2589
JUMPV
LABELV $2588
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2593
ARGP4
ADDRLP4 1180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $2591
line 3373
;3373:			if (ui_currentNetMap.integer >=0 && ui_currentNetMap.integer < uiInfo.mapCount) {
ADDRGP4 ui_currentNetMap+12
INDIRI4
CNSTI4 0
LTI4 $2592
ADDRGP4 ui_currentNetMap+12
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
GEI4 $2592
line 3374
;3374:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote map %s\n",uiInfo.mapList[ui_currentNetMap.integer].mapLoadName) );
ADDRGP4 $2599
ARGP4
CNSTI4 100
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1184
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3375
;3375:			}
line 3376
;3376:		} else if (Q_stricmp(name, "voteKick") == 0) {
ADDRGP4 $2592
JUMPV
LABELV $2591
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2605
ARGP4
ADDRLP4 1184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $2603
line 3377
;3377:			if (uiInfo.playerIndex >= 0 && uiInfo.playerIndex < uiInfo.playerCount) {
ADDRGP4 uiInfo+78860
INDIRI4
CNSTI4 0
LTI4 $2604
ADDRGP4 uiInfo+78860
INDIRI4
ADDRGP4 uiInfo+78844
INDIRI4
GEI4 $2604
line 3378
;3378:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote kick %s\n",uiInfo.playerNames[uiInfo.playerIndex]) );
ADDRGP4 $2611
ARGP4
ADDRGP4 uiInfo+78860
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78872
ADDP4
ARGP4
ADDRLP4 1188
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3379
;3379:			}
line 3380
;3380:		} else if (Q_stricmp(name, "voteGame") == 0) {
ADDRGP4 $2604
JUMPV
LABELV $2603
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2616
ARGP4
ADDRLP4 1188
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 0
NEI4 $2614
line 3381
;3381:			if (ui_netGameType.integer >= 0 && ui_netGameType.integer < uiInfo.numGameTypes) {
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 0
LTI4 $2615
ADDRGP4 ui_netGameType+12
INDIRI4
ADDRGP4 uiInfo+78576
INDIRI4
GEI4 $2615
line 3382
;3382:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callvote g_gametype %i\n",uiInfo.gameTypes[ui_netGameType.integer].gtEnum) );
ADDRGP4 $2622
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 1192
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3383
;3383:			}
line 3384
;3384:		} else if (Q_stricmp(name, "voteLeader") == 0) {
ADDRGP4 $2615
JUMPV
LABELV $2614
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2628
ARGP4
ADDRLP4 1192
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 0
NEI4 $2626
line 3385
;3385:			if (uiInfo.teamIndex >= 0 && uiInfo.teamIndex < uiInfo.myTeamCount) {
ADDRGP4 uiInfo+78852
INDIRI4
CNSTI4 0
LTI4 $2627
ADDRGP4 uiInfo+78852
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $2627
line 3386
;3386:				trap_Cmd_ExecuteText( EXEC_APPEND, va("callteamvote leader %s\n",uiInfo.teamNames[uiInfo.teamIndex]) );
ADDRGP4 $2634
ARGP4
ADDRGP4 uiInfo+78852
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRLP4 1196
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3387
;3387:			}
line 3388
;3388:		} else if (Q_stricmp(name, "addBot") == 0) {
ADDRGP4 $2627
JUMPV
LABELV $2626
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2639
ARGP4
ADDRLP4 1196
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
NEI4 $2637
line 3389
;3389:			if (trap_Cvar_VariableValue("g_gametype") >= GT_TEAM) {
ADDRGP4 $1323
ARGP4
ADDRLP4 1200
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1200
INDIRF4
CNSTF4 1077936128
LTF4 $2640
line 3390
;3390:				trap_Cmd_ExecuteText( EXEC_APPEND, va("addbot %s %i %s\n", uiInfo.characterList[uiInfo.botIndex].name, uiInfo.skillIndex+1, (uiInfo.redBlue == 0) ? "Red" : "Blue") );
ADDRGP4 $2642
ARGP4
CNSTI4 24
ADDRGP4 uiInfo+73444
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ARGP4
ADDRGP4 uiInfo+96672
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 uiInfo+78840
INDIRI4
CNSTI4 0
NEI4 $2648
ADDRLP4 1204
ADDRGP4 $840
ASGNP4
ADDRGP4 $2649
JUMPV
LABELV $2648
ADDRLP4 1204
ADDRGP4 $839
ASGNP4
LABELV $2649
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1208
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3391
;3391:			} else {
ADDRGP4 $2638
JUMPV
LABELV $2640
line 3392
;3392:				trap_Cmd_ExecuteText( EXEC_APPEND, va("addbot %s %i %s\n", UI_GetBotNameByNumber(uiInfo.botIndex), uiInfo.skillIndex+1, (uiInfo.redBlue == 0) ? "Red" : "Blue") );
ADDRGP4 uiInfo+73444
INDIRI4
ARGI4
ADDRLP4 1208
ADDRGP4 UI_GetBotNameByNumber
CALLP4
ASGNP4
ADDRGP4 $2642
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRGP4 uiInfo+96672
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 uiInfo+78840
INDIRI4
CNSTI4 0
NEI4 $2654
ADDRLP4 1204
ADDRGP4 $840
ASGNP4
ADDRGP4 $2655
JUMPV
LABELV $2654
ADDRLP4 1204
ADDRGP4 $839
ASGNP4
LABELV $2655
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3393
;3393:			}
line 3394
;3394:		} else if (Q_stricmp(name, "addFavorite") == 0) {
ADDRGP4 $2638
JUMPV
LABELV $2637
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2658
ARGP4
ADDRLP4 1200
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
NEI4 $2656
line 3395
;3395:			if (ui_netSource.integer != AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
EQI4 $2657
line 3400
;3396:				char name[MAX_NAME_LENGTH];
;3397:				char addr[MAX_NAME_LENGTH];
;3398:				int res;
;3399:
;3400:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 3401
;3401:				name[0] = addr[0] = '\0';
ADDRLP4 1272
CNSTI1 0
ASGNI1
ADDRLP4 1204
ADDRLP4 1272
INDIRI1
ASGNI1
ADDRLP4 1236
ADDRLP4 1272
INDIRI1
ASGNI1
line 3402
;3402:				Q_strncpyz(name, 	Info_ValueForKey(buff, "hostname"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $2667
ARGP4
ADDRLP4 1276
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1236
ARGP4
ADDRLP4 1276
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3403
;3403:				Q_strncpyz(addr, 	Info_ValueForKey(buff, "addr"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $2668
ARGP4
ADDRLP4 1280
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1204
ARGP4
ADDRLP4 1280
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3404
;3404:				if (strlen(name) > 0 && strlen(addr) > 0) {
ADDRLP4 1236
ARGP4
ADDRLP4 1284
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1284
INDIRI4
CNSTI4 0
LEI4 $2657
ADDRLP4 1204
ARGP4
ADDRLP4 1288
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1288
INDIRI4
CNSTI4 0
LEI4 $2657
line 3405
;3405:					res = trap_LAN_AddServer(AS_FAVORITES, name, addr);
CNSTI4 3
ARGI4
ADDRLP4 1236
ARGP4
ADDRLP4 1204
ARGP4
ADDRLP4 1292
ADDRGP4 trap_LAN_AddServer
CALLI4
ASGNI4
ADDRLP4 1268
ADDRLP4 1292
INDIRI4
ASGNI4
line 3406
;3406:					if (res == 0) {
ADDRLP4 1268
INDIRI4
CNSTI4 0
NEI4 $2671
line 3408
;3407:						// server already in the list
;3408:						Com_Printf("Favorite already in list\n");
ADDRGP4 $2673
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3409
;3409:					}
ADDRGP4 $2657
JUMPV
LABELV $2671
line 3410
;3410:					else if (res == -1) {
ADDRLP4 1268
INDIRI4
CNSTI4 -1
NEI4 $2674
line 3412
;3411:						// list full
;3412:						Com_Printf("Favorite list full\n");
ADDRGP4 $2676
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3413
;3413:					}
ADDRGP4 $2657
JUMPV
LABELV $2674
line 3414
;3414:					else {
line 3416
;3415:						// successfully added
;3416:						Com_Printf("Added favorite server %s\n", addr);
ADDRGP4 $2677
ARGP4
ADDRLP4 1204
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3417
;3417:					}
line 3418
;3418:				}
line 3419
;3419:			}
line 3420
;3420:		} else if (Q_stricmp(name, "deleteFavorite") == 0) {
ADDRGP4 $2657
JUMPV
LABELV $2656
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2680
ARGP4
ADDRLP4 1204
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1204
INDIRI4
CNSTI4 0
NEI4 $2678
line 3421
;3421:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $2679
line 3423
;3422:				char addr[MAX_NAME_LENGTH];
;3423:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.serverStatus.currentServer], buff, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2216
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 3424
;3424:				addr[0] = '\0';
ADDRLP4 1208
CNSTI1 0
ASGNI1
line 3425
;3425:				Q_strncpyz(addr, 	Info_ValueForKey(buff, "addr"), MAX_NAME_LENGTH);
ADDRLP4 0
ARGP4
ADDRGP4 $2668
ARGP4
ADDRLP4 1240
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1208
ARGP4
ADDRLP4 1240
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3426
;3426:				if (strlen(addr) > 0) {
ADDRLP4 1208
ARGP4
ADDRLP4 1244
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 0
LEI4 $2679
line 3427
;3427:					trap_LAN_RemoveServer(AS_FAVORITES, addr);
CNSTI4 3
ARGI4
ADDRLP4 1208
ARGP4
ADDRGP4 trap_LAN_RemoveServer
CALLV
pop
line 3428
;3428:				}
line 3429
;3429:			}
line 3430
;3430:		} else if (Q_stricmp(name, "createFavorite") == 0) {
ADDRGP4 $2679
JUMPV
LABELV $2678
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2693
ARGP4
ADDRLP4 1208
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1208
INDIRI4
CNSTI4 0
NEI4 $2691
line 3431
;3431:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $2692
line 3436
;3432:				char name[MAX_NAME_LENGTH];
;3433:				char addr[MAX_NAME_LENGTH];
;3434:				int res;
;3435:
;3436:				name[0] = addr[0] = '\0';
ADDRLP4 1280
CNSTI1 0
ASGNI1
ADDRLP4 1212
ADDRLP4 1280
INDIRI1
ASGNI1
ADDRLP4 1244
ADDRLP4 1280
INDIRI1
ASGNI1
line 3437
;3437:				Q_strncpyz(name, 	UI_Cvar_VariableString("ui_favoriteName"), MAX_NAME_LENGTH);
ADDRGP4 $2697
ARGP4
ADDRLP4 1284
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1244
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3438
;3438:				Q_strncpyz(addr, 	UI_Cvar_VariableString("ui_favoriteAddress"), MAX_NAME_LENGTH);
ADDRGP4 $2698
ARGP4
ADDRLP4 1288
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1212
ARGP4
ADDRLP4 1288
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3439
;3439:				if (strlen(name) > 0 && strlen(addr) > 0) {
ADDRLP4 1244
ARGP4
ADDRLP4 1292
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1292
INDIRI4
CNSTI4 0
LEI4 $2692
ADDRLP4 1212
ARGP4
ADDRLP4 1296
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1296
INDIRI4
CNSTI4 0
LEI4 $2692
line 3440
;3440:					res = trap_LAN_AddServer(AS_FAVORITES, name, addr);
CNSTI4 3
ARGI4
ADDRLP4 1244
ARGP4
ADDRLP4 1212
ARGP4
ADDRLP4 1300
ADDRGP4 trap_LAN_AddServer
CALLI4
ASGNI4
ADDRLP4 1276
ADDRLP4 1300
INDIRI4
ASGNI4
line 3441
;3441:					if (res == 0) {
ADDRLP4 1276
INDIRI4
CNSTI4 0
NEI4 $2701
line 3443
;3442:						// server already in the list
;3443:						Com_Printf("Favorite already in list\n");
ADDRGP4 $2673
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3444
;3444:					}
ADDRGP4 $2692
JUMPV
LABELV $2701
line 3445
;3445:					else if (res == -1) {
ADDRLP4 1276
INDIRI4
CNSTI4 -1
NEI4 $2703
line 3447
;3446:						// list full
;3447:						Com_Printf("Favorite list full\n");
ADDRGP4 $2676
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3448
;3448:					}
ADDRGP4 $2692
JUMPV
LABELV $2703
line 3449
;3449:					else {
line 3451
;3450:						// successfully added
;3451:						Com_Printf("Added favorite server %s\n", addr);
ADDRGP4 $2677
ARGP4
ADDRLP4 1212
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3452
;3452:					}
line 3453
;3453:				}
line 3454
;3454:			}
line 3455
;3455:		} else if (Q_stricmp(name, "orders") == 0) {
ADDRGP4 $2692
JUMPV
LABELV $2691
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2707
ARGP4
ADDRLP4 1212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
NEI4 $2705
line 3457
;3456:			const char *orders;
;3457:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1216
ARGP4
ADDRLP4 1220
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 0
EQI4 $2706
line 3458
;3458:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1391
ARGP4
ADDRLP4 1228
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1224
ADDRLP4 1228
INDIRF4
CVFI4 4
ASGNI4
line 3459
;3459:				if (selectedPlayer < uiInfo.myTeamCount) {
ADDRLP4 1224
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $2710
line 3460
;3460:					strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 3461
;3461:					trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamClientNums[selectedPlayer]) );
ADDRLP4 0
ARGP4
ADDRLP4 1224
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82968
ADDP4
INDIRI4
ARGI4
ADDRLP4 1232
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1232
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3462
;3462:					trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2714
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3463
;3463:				} else {
ADDRGP4 $2711
JUMPV
LABELV $2710
line 3465
;3464:					int i;
;3465:					for (i = 0; i < uiInfo.myTeamCount; i++) {
ADDRLP4 1232
CNSTI4 0
ASGNI4
ADDRGP4 $2718
JUMPV
LABELV $2715
line 3466
;3466:						if (Q_stricmp(UI_Cvar_VariableString("name"), uiInfo.teamNames[i]) == 0) {
ADDRGP4 $1409
ARGP4
ADDRLP4 1236
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRLP4 1232
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRLP4 1240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
NEI4 $2720
line 3467
;3467:							continue;
ADDRGP4 $2716
JUMPV
LABELV $2720
line 3469
;3468:						}
;3469:						strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 3470
;3470:						trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamNames[i]) );
ADDRLP4 0
ARGP4
ADDRLP4 1232
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
ARGP4
ADDRLP4 1244
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1244
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3471
;3471:						trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2714
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3472
;3472:					}
LABELV $2716
line 3465
ADDRLP4 1232
ADDRLP4 1232
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2718
ADDRLP4 1232
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
LTI4 $2715
line 3473
;3473:				}
LABELV $2711
line 3474
;3474:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1232
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 3475
;3475:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 3476
;3476:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2560
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3477
;3477:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 3478
;3478:			}
line 3479
;3479:		} else if (Q_stricmp(name, "voiceOrdersTeam") == 0) {
ADDRGP4 $2706
JUMPV
LABELV $2705
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2726
ARGP4
ADDRLP4 1216
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1216
INDIRI4
CNSTI4 0
NEI4 $2724
line 3481
;3480:			const char *orders;
;3481:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1220
ARGP4
ADDRLP4 1224
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
EQI4 $2725
line 3482
;3482:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1391
ARGP4
ADDRLP4 1232
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1228
ADDRLP4 1232
INDIRF4
CVFI4 4
ASGNI4
line 3483
;3483:				if (selectedPlayer == uiInfo.myTeamCount) {
ADDRLP4 1228
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
NEI4 $2729
line 3484
;3484:					trap_Cmd_ExecuteText( EXEC_APPEND, orders );
CNSTI4 2
ARGI4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3485
;3485:					trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2714
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3486
;3486:				}
LABELV $2729
line 3487
;3487:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1236
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 3488
;3488:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 3489
;3489:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2560
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3490
;3490:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 3491
;3491:			}
line 3492
;3492:		} else if (Q_stricmp(name, "voiceOrders") == 0) {
ADDRGP4 $2725
JUMPV
LABELV $2724
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2734
ARGP4
ADDRLP4 1220
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 0
NEI4 $2732
line 3494
;3493:			const char *orders;
;3494:			if (String_Parse(args, &orders)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1224
ARGP4
ADDRLP4 1228
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
EQI4 $2733
line 3495
;3495:				int selectedPlayer = trap_Cvar_VariableValue("cg_selectedPlayer");
ADDRGP4 $1391
ARGP4
ADDRLP4 1236
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1232
ADDRLP4 1236
INDIRF4
CVFI4 4
ASGNI4
line 3496
;3496:				if (selectedPlayer < uiInfo.myTeamCount) {
ADDRLP4 1232
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $2737
line 3497
;3497:					strcpy(buff, orders);
ADDRLP4 0
ARGP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 3498
;3498:					trap_Cmd_ExecuteText( EXEC_APPEND, va(buff, uiInfo.teamClientNums[selectedPlayer]) );
ADDRLP4 0
ARGP4
ADDRLP4 1232
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+82968
ADDP4
INDIRI4
ARGI4
ADDRLP4 1240
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1240
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3499
;3499:					trap_Cmd_ExecuteText( EXEC_APPEND, "\n" );
CNSTI4 2
ARGI4
ADDRGP4 $2714
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 3500
;3500:				}
LABELV $2737
line 3501
;3501:				trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 1240
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 3502
;3502:				trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 3503
;3503:				trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2560
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3504
;3504:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 3505
;3505:			}
line 3506
;3506:		} else if (Q_stricmp(name, "glCustom") == 0) {
ADDRGP4 $2733
JUMPV
LABELV $2732
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2743
ARGP4
ADDRLP4 1224
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
NEI4 $2741
line 3507
;3507:			trap_Cvar_Set("ui_glCustom", "4");
ADDRGP4 $2290
ARGP4
ADDRGP4 $2744
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 3508
;3508:		} else if (Q_stricmp(name, "update") == 0) {
ADDRGP4 $2742
JUMPV
LABELV $2741
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2747
ARGP4
ADDRLP4 1228
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
NEI4 $2745
line 3509
;3509:			if (String_Parse(args, &name2)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1232
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
EQI4 $2746
line 3510
;3510:				UI_Update(name2);
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 UI_Update
CALLV
pop
line 3511
;3511:			}
line 3512
;3512:		} else if (Q_stricmp(name, "setPbClStatus") == 0) {
ADDRGP4 $2746
JUMPV
LABELV $2745
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 $2752
ARGP4
ADDRLP4 1232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
NEI4 $2750
line 3514
;3513:			int stat;
;3514:			if ( Int_Parse( args, &stat ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1236
ARGP4
ADDRLP4 1240
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 1240
INDIRI4
CNSTI4 0
EQI4 $2751
line 3515
;3515:				trap_SetPbClStatus( stat );
ADDRLP4 1236
INDIRI4
ARGI4
ADDRGP4 trap_SetPbClStatus
CALLV
pop
line 3516
;3516:		}
ADDRGP4 $2751
JUMPV
LABELV $2750
line 3517
;3517:		else {
line 3518
;3518:			Com_Printf("unknown UI script %s\n", name);
ADDRGP4 $2755
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 3519
;3519:		}
LABELV $2751
LABELV $2746
LABELV $2742
LABELV $2733
LABELV $2725
LABELV $2706
LABELV $2692
LABELV $2679
LABELV $2657
LABELV $2638
LABELV $2627
LABELV $2615
LABELV $2604
LABELV $2592
LABELV $2589
LABELV $2586
LABELV $2583
LABELV $2567
LABELV $2563
LABELV $2558
LABELV $2554
LABELV $2544
LABELV $2527
LABELV $2522
LABELV $2515
LABELV $2505
LABELV $2499
LABELV $2492
LABELV $2479
LABELV $2476
LABELV $2470
LABELV $2463
LABELV $2453
LABELV $2450
LABELV $2447
LABELV $2444
LABELV $2431
LABELV $2428
LABELV $2425
LABELV $2422
LABELV $2413
LABELV $2409
LABELV $2406
LABELV $2403
LABELV $2399
LABELV $2389
LABELV $2377
LABELV $2370
LABELV $2363
LABELV $2320
line 3520
;3520:	}
LABELV $2317
line 3521
;3521:}
LABELV $2316
endproc UI_RunMenuScript 1304 24
proc UI_GetTeamColor 0 0
line 3523
;3522:
;3523:static void UI_GetTeamColor(vec4_t *color) {
line 3524
;3524:}
LABELV $2756
endproc UI_GetTeamColor 0 0
proc UI_MapCountByGameType 16 0
line 3531
;3525:
;3526:/*
;3527:==================
;3528:UI_MapCountByGameType
;3529:==================
;3530:*/
;3531:static int UI_MapCountByGameType(qboolean singlePlayer) {
line 3533
;3532:	int i, c, game;
;3533:	c = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3534
;3534:	game = singlePlayer ? uiInfo.gameTypes[ui_gameType.integer].gtEnum : uiInfo.gameTypes[ui_netGameType.integer].gtEnum;
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2765
ADDRLP4 12
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $2766
JUMPV
LABELV $2765
ADDRLP4 12
ADDRGP4 ui_netGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ASGNI4
LABELV $2766
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 3535
;3535:	if (game == GT_SINGLE_PLAYER) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $2767
line 3536
;3536:		game++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3537
;3537:	} 
LABELV $2767
line 3538
;3538:	if (game == GT_TEAM) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $2769
line 3539
;3539:		game = GT_FFA;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3540
;3540:	}
LABELV $2769
line 3542
;3541:
;3542:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2774
JUMPV
LABELV $2771
line 3543
;3543:		uiInfo.mapList[i].active = qfalse;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+96
ADDP4
CNSTI4 0
ASGNI4
line 3544
;3544:		if ( uiInfo.mapList[i].typeBits & (1 << game)) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2778
line 3545
;3545:			if (singlePlayer) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2782
line 3546
;3546:				if (!(uiInfo.mapList[i].typeBits & (1 << GT_SINGLE_PLAYER))) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+20
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $2784
line 3547
;3547:					continue;
ADDRGP4 $2772
JUMPV
LABELV $2784
line 3549
;3548:				}
;3549:			}
LABELV $2782
line 3550
;3550:			c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3551
;3551:			uiInfo.mapList[i].active = qtrue;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+96
ADDP4
CNSTI4 1
ASGNI4
line 3552
;3552:		}
LABELV $2778
line 3553
;3553:	}
LABELV $2772
line 3542
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2774
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LTI4 $2771
line 3554
;3554:	return c;
ADDRLP4 8
INDIRI4
RETI4
LABELV $2757
endproc UI_MapCountByGameType 16 0
export UI_hasSkinForBase
proc UI_hasSkinForBase 1032 20
line 3557
;3555:}
;3556:
;3557:qboolean UI_hasSkinForBase(const char *base, const char *team) {
line 3560
;3558:	char	test[1024];
;3559:	
;3560:	Com_sprintf( test, sizeof( test ), "models/players/%s/%s/lower_default.skin", base, team );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2791
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3562
;3561:
;3562:	if (trap_FS_FOpenFile(test, 0, FS_READ)) {
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1024
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
EQI4 $2792
line 3563
;3563:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2790
JUMPV
LABELV $2792
line 3565
;3564:	}
;3565:	Com_sprintf( test, sizeof( test ), "models/players/characters/%s/%s/lower_default.skin", base, team );
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2794
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3567
;3566:
;3567:	if (trap_FS_FOpenFile(test, 0, FS_READ)) {
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1028
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $2795
line 3568
;3568:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2790
JUMPV
LABELV $2795
line 3570
;3569:	}
;3570:	return qfalse;
CNSTI4 0
RETI4
LABELV $2790
endproc UI_hasSkinForBase 1032 20
data
align 4
LABELV $2798
byte 4 0
code
proc UI_HeadCountByTeam 40 8
line 3578
;3571:}
;3572:
;3573:/*
;3574:==================
;3575:UI_MapCountByTeam
;3576:==================
;3577:*/
;3578:static int UI_HeadCountByTeam() {
line 3582
;3579:	static int init = 0;
;3580:	int i, j, k, c, tIndex;
;3581:	
;3582:	c = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 3583
;3583:	if (!init) {
ADDRGP4 $2798
INDIRI4
CNSTI4 0
NEI4 $2799
line 3584
;3584:		for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2804
JUMPV
LABELV $2801
line 3585
;3585:			uiInfo.characterList[i].reference = 0;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+20
ADDP4
CNSTI4 0
ASGNI4
line 3586
;3586:			for (j = 0; j < uiInfo.teamCount; j++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2811
JUMPV
LABELV $2808
line 3587
;3587:			  if (UI_hasSkinForBase(uiInfo.characterList[i].base, uiInfo.teamList[j].teamName)) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+12
ADDP4
INDIRP4
ARGP4
CNSTI4 44
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 UI_hasSkinForBase
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $2813
line 3588
;3588:					uiInfo.characterList[i].reference |= (1<<j);
ADDRLP4 24
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+20
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 8
INDIRI4
LSHI4
BORI4
ASGNI4
line 3589
;3589:			  }
LABELV $2813
line 3590
;3590:			}
LABELV $2809
line 3586
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2811
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
LTI4 $2808
line 3591
;3591:		}
LABELV $2802
line 3584
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2804
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
LTI4 $2801
line 3592
;3592:		init = 1;
ADDRGP4 $2798
CNSTI4 1
ASGNI4
line 3593
;3593:	}
LABELV $2799
line 3595
;3594:
;3595:	tIndex = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 3598
;3596:
;3597:	// do names
;3598:	for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2823
JUMPV
LABELV $2820
line 3599
;3599:		uiInfo.characterList[i].active = qfalse;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+16
ADDP4
CNSTI4 0
ASGNI4
line 3600
;3600:		for(j = 0; j < TEAM_MEMBERS; j++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2827
line 3601
;3601:			if (uiInfo.teamList[tIndex].teamMembers[j] != NULL) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2831
line 3602
;3602:				if (uiInfo.characterList[i].reference&(1<<tIndex)) {// && Q_stricmp(uiInfo.teamList[tIndex].teamMembers[j], uiInfo.characterList[i].name)==0) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2835
line 3603
;3603:					uiInfo.characterList[i].active = qtrue;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+16
ADDP4
CNSTI4 1
ASGNI4
line 3604
;3604:					c++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3605
;3605:					break;
ADDRGP4 $2829
JUMPV
LABELV $2835
line 3607
;3606:				}
;3607:			}
LABELV $2831
line 3608
;3608:		}
LABELV $2828
line 3600
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 5
LTI4 $2827
LABELV $2829
line 3609
;3609:	}
LABELV $2821
line 3598
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2823
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
LTI4 $2820
line 3612
;3610:
;3611:	// and then aliases
;3612:	for(j = 0; j < TEAM_MEMBERS; j++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2841
line 3613
;3613:		for(k = 0; k < uiInfo.aliasCount; k++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2848
JUMPV
LABELV $2845
line 3614
;3614:			if (uiInfo.aliasList[k].name != NULL) {
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2850
line 3615
;3615:				if (Q_stricmp(uiInfo.teamList[tIndex].teamMembers[j], uiInfo.aliasList[k].name)==0) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
INDIRP4
ARGP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2853
line 3616
;3616:					for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2861
JUMPV
LABELV $2858
line 3617
;3617:						if (uiInfo.characterList[i].headImage != -1 && uiInfo.characterList[i].reference&(1<<tIndex) && Q_stricmp(uiInfo.aliasList[k].ai, uiInfo.characterList[i].name)==0) {
ADDRLP4 32
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+73448+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2863
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+73448+20
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2863
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+74988+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $2863
line 3618
;3618:							if (uiInfo.characterList[i].active == qfalse) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2860
line 3619
;3619:								uiInfo.characterList[i].active = qtrue;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+16
ADDP4
CNSTI4 1
ASGNI4
line 3620
;3620:								c++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3621
;3621:							}
line 3622
;3622:							break;
ADDRGP4 $2860
JUMPV
LABELV $2863
line 3624
;3623:						}
;3624:					}
LABELV $2859
line 3616
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2861
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
LTI4 $2858
LABELV $2860
line 3625
;3625:				}
LABELV $2853
line 3626
;3626:			}
LABELV $2850
line 3627
;3627:		}
LABELV $2846
line 3613
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2848
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+74984
INDIRI4
LTI4 $2845
line 3628
;3628:	}
LABELV $2842
line 3612
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 5
LTI4 $2841
line 3629
;3629:	return c;
ADDRLP4 16
INDIRI4
RETI4
LABELV $2797
endproc UI_HeadCountByTeam 40 8
proc UI_InsertServerIntoDisplayList 16 0
line 3637
;3630:}
;3631:
;3632:/*
;3633:==================
;3634:UI_InsertServerIntoDisplayList
;3635:==================
;3636:*/
;3637:static void UI_InsertServerIntoDisplayList(int num, int position) {
line 3640
;3638:	int i;
;3639:
;3640:	if (position < 0 || position > uiInfo.serverStatus.numDisplayServers ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $2883
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
LEI4 $2879
LABELV $2883
line 3641
;3641:		return;
ADDRGP4 $2878
JUMPV
LABELV $2879
line 3644
;3642:	}
;3643:	//
;3644:	uiInfo.serverStatus.numDisplayServers++;
ADDRLP4 8
ADDRGP4 uiInfo+99264+10412
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3645
;3645:	for (i = uiInfo.serverStatus.numDisplayServers; i > position; i--) {
ADDRLP4 0
ADDRGP4 uiInfo+99264+10412
INDIRI4
ASGNI4
ADDRGP4 $2889
JUMPV
LABELV $2886
line 3646
;3646:		uiInfo.serverStatus.displayServers[i] = uiInfo.serverStatus.displayServers[i-1];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+99264+2220
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+99264+2220-4
ADDP4
INDIRI4
ASGNI4
line 3647
;3647:	}
LABELV $2887
line 3645
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2889
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $2886
line 3648
;3648:	uiInfo.serverStatus.displayServers[position] = num;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 3649
;3649:}
LABELV $2878
endproc UI_InsertServerIntoDisplayList 16 0
proc UI_RemoveServerFromDisplayList 16 0
line 3656
;3650:
;3651:/*
;3652:==================
;3653:UI_RemoveServerFromDisplayList
;3654:==================
;3655:*/
;3656:static void UI_RemoveServerFromDisplayList(int num) {
line 3659
;3657:	int i, j;
;3658:
;3659:	for (i = 0; i < uiInfo.serverStatus.numDisplayServers; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2903
JUMPV
LABELV $2900
line 3660
;3660:		if (uiInfo.serverStatus.displayServers[i] == num) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $2906
line 3661
;3661:			uiInfo.serverStatus.numDisplayServers--;
ADDRLP4 8
ADDRGP4 uiInfo+99264+10412
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3662
;3662:			for (j = i; j < uiInfo.serverStatus.numDisplayServers; j++) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $2915
JUMPV
LABELV $2912
line 3663
;3663:				uiInfo.serverStatus.displayServers[j] = uiInfo.serverStatus.displayServers[j+1];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+99264+2220
ADDP4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+99264+2220+4
ADDP4
INDIRI4
ASGNI4
line 3664
;3664:			}
LABELV $2913
line 3662
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2915
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
LTI4 $2912
line 3665
;3665:			return;
ADDRGP4 $2899
JUMPV
LABELV $2906
line 3667
;3666:		}
;3667:	}
LABELV $2901
line 3659
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2903
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
LTI4 $2900
line 3668
;3668:}
LABELV $2899
endproc UI_RemoveServerFromDisplayList 16 0
proc UI_BinaryServerInsertion 20 20
line 3675
;3669:
;3670:/*
;3671:==================
;3672:UI_BinaryServerInsertion
;3673:==================
;3674:*/
;3675:static void UI_BinaryServerInsertion(int num) {
line 3679
;3676:	int mid, offset, res, len;
;3677:
;3678:	// use binary search to insert server
;3679:	len = uiInfo.serverStatus.numDisplayServers;
ADDRLP4 12
ADDRGP4 uiInfo+99264+10412
INDIRI4
ASGNI4
line 3680
;3680:	mid = len;
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 3681
;3681:	offset = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3682
;3682:	res = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2927
JUMPV
LABELV $2926
line 3683
;3683:	while(mid > 0) {
line 3684
;3684:		mid = len >> 1;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1
RSHI4
ASGNI4
line 3686
;3685:		//
;3686:		res = trap_LAN_CompareServers( ui_netSource.integer, uiInfo.serverStatus.sortKey,
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2200
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+2204
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 trap_LAN_CompareServers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 3689
;3687:					uiInfo.serverStatus.sortDir, num, uiInfo.serverStatus.displayServers[offset+mid]);
;3688:		// if equal
;3689:		if (res == 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2936
line 3690
;3690:			UI_InsertServerIntoDisplayList(num, offset+mid);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ARGI4
ADDRGP4 UI_InsertServerIntoDisplayList
CALLV
pop
line 3691
;3691:			return;
ADDRGP4 $2923
JUMPV
LABELV $2936
line 3694
;3692:		}
;3693:		// if larger
;3694:		else if (res == 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $2938
line 3695
;3695:			offset += mid;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 3696
;3696:			len -= mid;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 3697
;3697:		}
ADDRGP4 $2939
JUMPV
LABELV $2938
line 3699
;3698:		// if smaller
;3699:		else {
line 3700
;3700:			len -= mid;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 3701
;3701:		}
LABELV $2939
line 3702
;3702:	}
LABELV $2927
line 3683
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $2926
line 3703
;3703:	if (res == 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $2940
line 3704
;3704:		offset++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3705
;3705:	}
LABELV $2940
line 3706
;3706:	UI_InsertServerIntoDisplayList(num, offset);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 UI_InsertServerIntoDisplayList
CALLV
pop
line 3707
;3707:}
LABELV $2923
endproc UI_BinaryServerInsertion 20 20
bss
align 4
LABELV $2943
skip 4
code
proc UI_BuildServerDisplayList 1100 16
line 3714
;3708:
;3709:/*
;3710:==================
;3711:UI_BuildServerDisplayList
;3712:==================
;3713:*/
;3714:static void UI_BuildServerDisplayList(qboolean force) {
line 3720
;3715:	int i, count, clients, maxClients, ping, game, len, visible;
;3716:	char info[MAX_STRING_CHARS];
;3717://	qboolean startRefresh = qtrue; TTimo: unused
;3718:	static int numinvisible;
;3719:
;3720:	if (!(force || uiInfo.uiDC.realTime > uiInfo.serverStatus.nextDisplayRefresh)) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $2944
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+99264+10420
INDIRI4
GTI4 $2944
line 3721
;3721:		return;
ADDRGP4 $2942
JUMPV
LABELV $2944
line 3724
;3722:	}
;3723:	// if we shouldn't reset
;3724:	if ( force == 2 ) {
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $2949
line 3725
;3725:		force = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 3726
;3726:	}
LABELV $2949
line 3729
;3727:
;3728:	// do motd updates here too
;3729:	trap_Cvar_VariableStringBuffer( "cl_motdString", uiInfo.serverStatus.motd, sizeof(uiInfo.serverStatus.motd) );
ADDRGP4 $2951
ARGP4
ADDRGP4 uiInfo+99264+10460
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 3730
;3730:	len = strlen(uiInfo.serverStatus.motd);
ADDRGP4 uiInfo+99264+10460
ARGP4
ADDRLP4 1056
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1056
INDIRI4
ASGNI4
line 3731
;3731:	if (len == 0) {
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $2958
line 3732
;3732:		strcpy(uiInfo.serverStatus.motd, "Welcome to Team Arena!");
ADDRGP4 uiInfo+99264+10460
ARGP4
ADDRGP4 $2962
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 3733
;3733:		len = strlen(uiInfo.serverStatus.motd);
ADDRGP4 uiInfo+99264+10460
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1060
INDIRI4
ASGNI4
line 3734
;3734:	} 
LABELV $2958
line 3735
;3735:	if (len != uiInfo.serverStatus.motdLen) {
ADDRLP4 1052
INDIRI4
ADDRGP4 uiInfo+99264+10436
INDIRI4
EQI4 $2965
line 3736
;3736:		uiInfo.serverStatus.motdLen = len;
ADDRGP4 uiInfo+99264+10436
ADDRLP4 1052
INDIRI4
ASGNI4
line 3737
;3737:		uiInfo.serverStatus.motdWidth = -1;
ADDRGP4 uiInfo+99264+10440
CNSTI4 -1
ASGNI4
line 3738
;3738:	} 
LABELV $2965
line 3740
;3739:
;3740:	if (force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $2973
line 3741
;3741:		numinvisible = 0;
ADDRGP4 $2943
CNSTI4 0
ASGNI4
line 3743
;3742:		// clear number of displayed servers
;3743:		uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+99264+10412
CNSTI4 0
ASGNI4
line 3744
;3744:		uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+99264+10416
CNSTI4 0
ASGNI4
line 3746
;3745:		// set list box index to zero
;3746:		Menu_SetFeederSelection(NULL, FEEDER_SERVERS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 3748
;3747:		// mark all servers as visible so we store ping updates for them
;3748:		trap_LAN_MarkServerVisible(ui_netSource.integer, -1, qtrue);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 3749
;3749:	}
LABELV $2973
line 3752
;3750:
;3751:	// get the server count (comes from the master)
;3752:	count = trap_LAN_GetServerCount(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1060
INDIRI4
ASGNI4
line 3753
;3753:	if (count == -1 || (ui_netSource.integer == AS_LOCAL && count == 0) ) {
ADDRLP4 1036
INDIRI4
CNSTI4 -1
EQI4 $2984
ADDRLP4 1068
CNSTI4 0
ASGNI4
ADDRGP4 ui_netSource+12
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $2981
ADDRLP4 1036
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $2981
LABELV $2984
line 3755
;3754:		// still waiting on a response from the master
;3755:		uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+99264+10412
CNSTI4 0
ASGNI4
line 3756
;3756:		uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+99264+10416
CNSTI4 0
ASGNI4
line 3757
;3757:		uiInfo.serverStatus.nextDisplayRefresh = uiInfo.uiDC.realTime + 500;
ADDRGP4 uiInfo+99264+10420
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3758
;3758:		return;
ADDRGP4 $2942
JUMPV
LABELV $2981
line 3761
;3759:	}
;3760:
;3761:	visible = qfalse;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 3762
;3762:	for (i = 0; i < count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2995
JUMPV
LABELV $2992
line 3764
;3763:		// if we already got info for this server
;3764:		if (!trap_LAN_ServerIsVisible(ui_netSource.integer, i)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ADDRGP4 trap_LAN_ServerIsVisible
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $2996
line 3765
;3765:			continue;
ADDRGP4 $2993
JUMPV
LABELV $2996
line 3767
;3766:		}
;3767:		visible = qtrue;
ADDRLP4 1040
CNSTI4 1
ASGNI4
line 3769
;3768:		// get the ping for this server
;3769:		ping = trap_LAN_GetServerPing(ui_netSource.integer, i);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 trap_LAN_GetServerPing
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1076
INDIRI4
ASGNI4
line 3770
;3770:		if (ping > 0 || ui_netSource.integer == AS_FAVORITES) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $3003
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $3000
LABELV $3003
line 3772
;3771:
;3772:			trap_LAN_GetServerInfo(ui_netSource.integer, i, info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 3774
;3773:
;3774:			clients = atoi(Info_ValueForKey(info, "clients"));
ADDRLP4 8
ARGP4
ADDRGP4 $3005
ARGP4
ADDRLP4 1080
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1084
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1084
INDIRI4
ASGNI4
line 3775
;3775:			uiInfo.serverStatus.numPlayersOnServers += clients;
ADDRLP4 1088
ADDRGP4 uiInfo+99264+10416
ASGNP4
ADDRLP4 1088
INDIRP4
ADDRLP4 1088
INDIRP4
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
ASGNI4
line 3777
;3776:
;3777:			if (ui_browserShowEmpty.integer == 0) {
ADDRGP4 ui_browserShowEmpty+12
INDIRI4
CNSTI4 0
NEI4 $3008
line 3778
;3778:				if (clients == 0) {
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $3011
line 3779
;3779:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 3780
;3780:					continue;
ADDRGP4 $2993
JUMPV
LABELV $3011
line 3782
;3781:				}
;3782:			}
LABELV $3008
line 3784
;3783:
;3784:			if (ui_browserShowFull.integer == 0) {
ADDRGP4 ui_browserShowFull+12
INDIRI4
CNSTI4 0
NEI4 $3014
line 3785
;3785:				maxClients = atoi(Info_ValueForKey(info, "sv_maxclients"));
ADDRLP4 8
ARGP4
ADDRGP4 $1360
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1096
INDIRI4
ASGNI4
line 3786
;3786:				if (clients == maxClients) {
ADDRLP4 1032
INDIRI4
ADDRLP4 1044
INDIRI4
NEI4 $3017
line 3787
;3787:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 3788
;3788:					continue;
ADDRGP4 $2993
JUMPV
LABELV $3017
line 3790
;3789:				}
;3790:			}
LABELV $3014
line 3792
;3791:
;3792:			if (uiInfo.joinGameTypes[ui_joinGameType.integer].gtEnum != -1) {
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78712+4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $3020
line 3793
;3793:				game = atoi(Info_ValueForKey(info, "gametype"));
ADDRLP4 8
ARGP4
ADDRGP4 $3025
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 1096
INDIRI4
ASGNI4
line 3794
;3794:				if (game != uiInfo.joinGameTypes[ui_joinGameType.integer].gtEnum) {
ADDRLP4 1048
INDIRI4
ADDRGP4 ui_joinGameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78712+4
ADDP4
INDIRI4
EQI4 $3026
line 3795
;3795:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 3796
;3796:					continue;
ADDRGP4 $2993
JUMPV
LABELV $3026
line 3798
;3797:				}
;3798:			}
LABELV $3020
line 3800
;3799:				
;3800:			if (ui_serverFilterType.integer > 0) {
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 0
LEI4 $3032
line 3801
;3801:				if (Q_stricmp(Info_ValueForKey(info, "game"), serverFilters[ui_serverFilterType.integer].basedir) != 0) {
ADDRLP4 8
ARGP4
ADDRGP4 $3037
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 ui_serverFilterType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverFilters+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
EQI4 $3035
line 3802
;3802:					trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 3803
;3803:					continue;
ADDRGP4 $2993
JUMPV
LABELV $3035
line 3805
;3804:				}
;3805:			}
LABELV $3032
line 3807
;3806:			// make sure we never add a favorite server twice
;3807:			if (ui_netSource.integer == AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
NEI4 $3041
line 3808
;3808:				UI_RemoveServerFromDisplayList(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_RemoveServerFromDisplayList
CALLV
pop
line 3809
;3809:			}
LABELV $3041
line 3811
;3810:			// insert the server into the list
;3811:			UI_BinaryServerInsertion(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_BinaryServerInsertion
CALLV
pop
line 3813
;3812:			// done with this server
;3813:			if (ping > 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $3044
line 3814
;3814:				trap_LAN_MarkServerVisible(ui_netSource.integer, i, qfalse);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 3815
;3815:				numinvisible++;
ADDRLP4 1092
ADDRGP4 $2943
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3816
;3816:			}
LABELV $3044
line 3817
;3817:		}
LABELV $3000
line 3818
;3818:	}
LABELV $2993
line 3762
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2995
ADDRLP4 0
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $2992
line 3820
;3819:
;3820:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+99264+2192
ADDRGP4 uiInfo+208
INDIRI4
ASGNI4
line 3823
;3821:
;3822:	// if there were no servers visible for ping updates
;3823:	if (!visible) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $3050
line 3826
;3824://		UI_StopServerRefresh();
;3825://		uiInfo.serverStatus.nextDisplayRefresh = 0;
;3826:	}
LABELV $3050
line 3827
;3827:}
LABELV $2942
endproc UI_BuildServerDisplayList 1100 16
data
export serverStatusCvars
align 4
LABELV serverStatusCvars
address $3053
address $3054
address $3055
address $109
address $3056
address $3057
address $1323
address $3058
address $3059
address $3060
address $3061
address $109
address $2136
address $109
address $3062
address $109
address $716
address $109
byte 4 0
byte 4 0
code
proc UI_SortServerStatusInfo 56 8
line 3852
;3828:
;3829:typedef struct
;3830:{
;3831:	char *name, *altName;
;3832:} serverStatusCvar_t;
;3833:
;3834:serverStatusCvar_t serverStatusCvars[] = {
;3835:	{"sv_hostname", "Name"},
;3836:	{"Address", ""},
;3837:	{"gamename", "Game name"},
;3838:	{"g_gametype", "Game type"},
;3839:	{"mapname", "Map"},
;3840:	{"version", ""},
;3841:	{"protocol", ""},
;3842:	{"timelimit", ""},
;3843:	{"fraglimit", ""},
;3844:	{NULL, NULL}
;3845:};
;3846:
;3847:/*
;3848:==================
;3849:UI_SortServerStatusInfo
;3850:==================
;3851:*/
;3852:static void UI_SortServerStatusInfo( serverStatusInfo_t *info ) {
line 3859
;3853:	int i, j, index;
;3854:	char *tmp1, *tmp2;
;3855:
;3856:	// FIXME: if "gamename" == "baseq3" or "missionpack" then
;3857:	// replace the gametype number by FFA, CTF etc.
;3858:	//
;3859:	index = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3860
;3860:	for (i = 0; serverStatusCvars[i].name; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $3067
JUMPV
LABELV $3064
line 3861
;3861:		for (j = 0; j < info->numLines; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3071
JUMPV
LABELV $3068
line 3862
;3862:			if ( !info->lines[j][1] || info->lines[j][1][0] ) {
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3074
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3072
LABELV $3074
line 3863
;3863:				continue;
ADDRGP4 $3069
JUMPV
LABELV $3072
line 3865
;3864:			}
;3865:			if ( !Q_stricmp(serverStatusCvars[i].name, info->lines[j][0]) ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3075
line 3867
;3866:				// swap lines
;3867:				tmp1 = info->lines[index][0];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRP4
ASGNP4
line 3868
;3868:				tmp2 = info->lines[index][3];
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRP4
ASGNP4
line 3869
;3869:				info->lines[index][0] = info->lines[j][0];
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LSHI4
ADDRLP4 36
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 3870
;3870:				info->lines[index][3] = info->lines[j][3];
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 48
CNSTI4 12
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
LSHI4
ADDRLP4 44
INDIRP4
ADDP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 3871
;3871:				info->lines[j][0] = tmp1;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 3872
;3872:				info->lines[j][3] = tmp2;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 3874
;3873:				//
;3874:				if ( strlen(serverStatusCvars[i].altName) ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $3077
line 3875
;3875:					info->lines[index][0] = serverStatusCvars[i].altName;
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars+4
ADDP4
INDIRP4
ASGNP4
line 3876
;3876:				}
LABELV $3077
line 3877
;3877:				index++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3878
;3878:			}
LABELV $3075
line 3879
;3879:		}
LABELV $3069
line 3861
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3071
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
LTI4 $3068
line 3880
;3880:	}
LABELV $3065
line 3860
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3067
ADDRLP4 8
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 serverStatusCvars
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3064
line 3881
;3881:}
LABELV $3063
endproc UI_SortServerStatusInfo 56 8
proc UI_GetServerStatusInfo 168 16
line 3888
;3882:
;3883:/*
;3884:==================
;3885:UI_GetServerStatusInfo
;3886:==================
;3887:*/
;3888:static int UI_GetServerStatusInfo( const char *serverAddress, serverStatusInfo_t *info ) {
line 3892
;3889:	char *p, *score, *ping, *name;
;3890:	int i, len;
;3891:
;3892:	if (!info) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3082
line 3893
;3893:		trap_LAN_ServerStatus( serverAddress, NULL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 3894
;3894:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3081
JUMPV
LABELV $3082
line 3896
;3895:	}
;3896:	memset(info, 0, sizeof(*info));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3332
ARGI4
ADDRGP4 memset
CALLP4
pop
line 3897
;3897:	if ( trap_LAN_ServerStatus( serverAddress, info->text, sizeof(info->text)) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 2112
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 24
ADDRGP4 trap_LAN_ServerStatus
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $3084
line 3898
;3898:		Q_strncpyz(info->address, serverAddress, sizeof(info->address));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3899
;3899:		p = info->text;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 2112
ADDP4
ASGNP4
line 3900
;3900:		info->numLines = 0;
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
CNSTI4 0
ASGNI4
line 3901
;3901:		info->lines[info->numLines][0] = "Address";
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $3055
ASGNP4
line 3902
;3902:		info->lines[info->numLines][1] = "";
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRGP4 $109
ASGNP4
line 3903
;3903:		info->lines[info->numLines][2] = "";
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $109
ASGNP4
line 3904
;3904:		info->lines[info->numLines][3] = info->address;
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 44
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 44
INDIRP4
ASGNP4
line 3905
;3905:		info->numLines++;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $3087
JUMPV
LABELV $3086
line 3907
;3906:		// get the cvars
;3907:		while (p && *p) {
line 3908
;3908:			p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 52
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 52
INDIRP4
ASGNP4
line 3909
;3909:			if (!p) break;
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3089
ADDRGP4 $3088
JUMPV
LABELV $3089
line 3910
;3910:			*p++ = '\0';
ADDRLP4 56
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI1 0
ASGNI1
line 3911
;3911:			if (*p == '\\')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3091
line 3912
;3912:				break;
ADDRGP4 $3088
JUMPV
LABELV $3091
line 3913
;3913:			info->lines[info->numLines][0] = p;
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3914
;3914:			info->lines[info->numLines][1] = "";
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 4
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
LSHI4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 68
INDIRI4
ADDP4
ADDRGP4 $109
ASGNP4
line 3915
;3915:			info->lines[info->numLines][2] = "";
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $109
ASGNP4
line 3916
;3916:			p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 76
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 76
INDIRP4
ASGNP4
line 3917
;3917:			if (!p) break;
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3093
ADDRGP4 $3088
JUMPV
LABELV $3093
line 3918
;3918:			*p++ = '\0';
ADDRLP4 80
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI1 0
ASGNI1
line 3919
;3919:			info->lines[info->numLines][3] = p;
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3921
;3920:
;3921:			info->numLines++;
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3922
;3922:			if (info->numLines >= MAX_SERVERSTATUS_LINES)
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 128
LTI4 $3095
line 3923
;3923:				break;
ADDRGP4 $3088
JUMPV
LABELV $3095
line 3924
;3924:		}
LABELV $3087
line 3907
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3097
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3086
LABELV $3097
LABELV $3088
line 3926
;3925:		// get the player list
;3926:		if (info->numLines < MAX_SERVERSTATUS_LINES-3) {
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 125
GEI4 $3098
line 3928
;3927:			// empty line
;3928:			info->lines[info->numLines][0] = "";
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 56
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $109
ASGNP4
line 3929
;3929:			info->lines[info->numLines][1] = "";
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRGP4 $109
ASGNP4
line 3930
;3930:			info->lines[info->numLines][2] = "";
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $109
ASGNP4
line 3931
;3931:			info->lines[info->numLines][3] = "";
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 72
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 $109
ASGNP4
line 3932
;3932:			info->numLines++;
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3934
;3933:			// header
;3934:			info->lines[info->numLines][0] = "num";
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 80
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRGP4 $3100
ASGNP4
line 3935
;3935:			info->lines[info->numLines][1] = "score";
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
CNSTI4 4
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 88
INDIRI4
ADDP4
ADDRGP4 $3101
ASGNP4
line 3936
;3936:			info->lines[info->numLines][2] = "ping";
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 92
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRGP4 $3102
ASGNP4
line 3937
;3937:			info->lines[info->numLines][3] = "name";
ADDRLP4 96
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 96
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRGP4 $1409
ASGNP4
line 3938
;3938:			info->numLines++;
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3940
;3939:			// parse players
;3940:			i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3941
;3941:			len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3104
JUMPV
LABELV $3103
line 3942
;3942:			while (p && *p) {
line 3943
;3943:				if (*p == '\\')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3106
line 3944
;3944:					*p++ = '\0';
ADDRLP4 104
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 104
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI1 0
ASGNI1
LABELV $3106
line 3945
;3945:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3108
line 3946
;3946:					break;
ADDRGP4 $3105
JUMPV
LABELV $3108
line 3947
;3947:				score = p;
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
line 3948
;3948:				p = strchr(p, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 108
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRP4
ASGNP4
line 3949
;3949:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3110
line 3950
;3950:					break;
ADDRGP4 $3105
JUMPV
LABELV $3110
line 3951
;3951:				*p++ = '\0';
ADDRLP4 112
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 112
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI1 0
ASGNI1
line 3952
;3952:				ping = p;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
line 3953
;3953:				p = strchr(p, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 116
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 116
INDIRP4
ASGNP4
line 3954
;3954:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3112
line 3955
;3955:					break;
ADDRGP4 $3105
JUMPV
LABELV $3112
line 3956
;3956:				*p++ = '\0';
ADDRLP4 120
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 120
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI1 0
ASGNI1
line 3957
;3957:				name = p;
ADDRLP4 20
ADDRLP4 0
INDIRP4
ASGNP4
line 3958
;3958:				Com_sprintf(&info->pings[len], sizeof(info->pings)-len, "%d", i);
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ARGP4
CNSTU4 192
ADDRLP4 4
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 $713
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3959
;3959:				info->lines[info->numLines][0] = &info->pings[len];
ADDRLP4 128
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 128
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 128
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ASGNP4
line 3960
;3960:				len += strlen(&info->pings[len]) + 1;
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 3136
ADDP4
ADDP4
ARGP4
ADDRLP4 136
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 3961
;3961:				info->lines[info->numLines][1] = score;
ADDRLP4 140
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 144
CNSTI4 4
ASGNI4
ADDRLP4 140
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
LSHI4
ADDRLP4 140
INDIRP4
CNSTI4 64
ADDP4
ADDP4
ADDRLP4 144
INDIRI4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 3962
;3962:				info->lines[info->numLines][2] = ping;
ADDRLP4 148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 3963
;3963:				info->lines[info->numLines][3] = name;
ADDRLP4 152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 152
INDIRP4
CNSTI4 64
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 3964
;3964:				info->numLines++;
ADDRLP4 156
ADDRFP4 4
INDIRP4
CNSTI4 3328
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
line 3965
;3965:				if (info->numLines >= MAX_SERVERSTATUS_LINES)
ADDRFP4 4
INDIRP4
CNSTI4 3328
ADDP4
INDIRI4
CNSTI4 128
LTI4 $3114
line 3966
;3966:					break;
ADDRGP4 $3105
JUMPV
LABELV $3114
line 3967
;3967:				p = strchr(p, '\\');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 160
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 160
INDIRP4
ASGNP4
line 3968
;3968:				if (!p)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3116
line 3969
;3969:					break;
ADDRGP4 $3105
JUMPV
LABELV $3116
line 3970
;3970:				*p++ = '\0';
ADDRLP4 164
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 164
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI1 0
ASGNI1
line 3972
;3971:				//
;3972:				i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3973
;3973:			}
LABELV $3104
line 3942
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3118
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3103
LABELV $3118
LABELV $3105
line 3974
;3974:		}
LABELV $3098
line 3975
;3975:		UI_SortServerStatusInfo( info );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 UI_SortServerStatusInfo
CALLV
pop
line 3976
;3976:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3081
JUMPV
LABELV $3084
line 3978
;3977:	}
;3978:	return qfalse;
CNSTI4 0
RETI4
LABELV $3081
endproc UI_GetServerStatusInfo 168 16
proc stristr 12 4
line 3986
;3979:}
;3980:
;3981:/*
;3982:==================
;3983:stristr
;3984:==================
;3985:*/
;3986:static char *stristr(char *str, char *charset) {
ADDRGP4 $3121
JUMPV
LABELV $3120
line 3989
;3987:	int i;
;3988:
;3989:	while(*str) {
line 3990
;3990:		for (i = 0; charset[i] && str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3126
JUMPV
LABELV $3123
line 3991
;3991:			if (toupper(charset[i]) != toupper(str[i])) break;
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
EQI4 $3127
ADDRGP4 $3125
JUMPV
LABELV $3127
line 3992
;3992:		}
LABELV $3124
line 3990
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3126
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
EQI4 $3129
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
NEI4 $3123
LABELV $3129
LABELV $3125
line 3993
;3993:		if (!charset[i]) return str;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3130
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $3119
JUMPV
LABELV $3130
line 3994
;3994:		str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 3995
;3995:	}
LABELV $3121
line 3989
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3120
line 3996
;3996:	return NULL;
CNSTP4 0
RETP4
LABELV $3119
endproc stristr 12 4
bss
align 4
LABELV $3133
skip 4
align 4
LABELV $3134
skip 4
code
proc UI_BuildFindPlayerList 4424 24
line 4004
;3997:}
;3998:
;3999:/*
;4000:==================
;4001:UI_BuildFindPlayerList
;4002:==================
;4003:*/
;4004:static void UI_BuildFindPlayerList(qboolean force) {
line 4011
;4005:	static int numFound, numTimeOuts;
;4006:	int i, j, resend;
;4007:	serverStatusInfo_t info;
;4008:	char name[MAX_NAME_LENGTH+2];
;4009:	char infoString[MAX_STRING_CHARS];
;4010:
;4011:	if (!force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3135
line 4012
;4012:		if (!uiInfo.nextFindPlayerRefresh || uiInfo.nextFindPlayerRefresh > uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+119472
INDIRI4
CNSTI4 0
EQI4 $3142
ADDRGP4 uiInfo+119472
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
LEI4 $3136
LABELV $3142
line 4013
;4013:			return;
ADDRGP4 $3132
JUMPV
line 4015
;4014:		}
;4015:	}
LABELV $3135
line 4016
;4016:	else {
line 4017
;4017:		memset(&uiInfo.pendingServerStatus, 0, sizeof(uiInfo.pendingServerStatus));
ADDRGP4 uiInfo+114148
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2244
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4018
;4018:		uiInfo.numFoundPlayerServers = 0;
ADDRGP4 uiInfo+119468
CNSTI4 0
ASGNI4
line 4019
;4019:		uiInfo.currentFoundPlayerServer = 0;
ADDRGP4 uiInfo+119464
CNSTI4 0
ASGNI4
line 4020
;4020:		trap_Cvar_VariableStringBuffer( "ui_findPlayer", uiInfo.findPlayerName, sizeof(uiInfo.findPlayerName));
ADDRGP4 $3147
ARGP4
ADDRGP4 uiInfo+116392
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 4021
;4021:		Q_CleanStr(uiInfo.findPlayerName);
ADDRGP4 uiInfo+116392
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 4023
;4022:		// should have a string of some length
;4023:		if (!strlen(uiInfo.findPlayerName)) {
ADDRGP4 uiInfo+116392
ARGP4
ADDRLP4 4404
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4404
INDIRI4
CNSTI4 0
NEI4 $3151
line 4024
;4024:			uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+119472
CNSTI4 0
ASGNI4
line 4025
;4025:			return;
ADDRGP4 $3132
JUMPV
LABELV $3151
line 4028
;4026:		}
;4027:		// set resend time
;4028:		resend = ui_serverStatusTimeOut.integer / 2 - 10;
ADDRLP4 4400
ADDRGP4 ui_serverStatusTimeOut+12
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 10
SUBI4
ASGNI4
line 4029
;4029:		if (resend < 50) {
ADDRLP4 4400
INDIRI4
CNSTI4 50
GEI4 $3156
line 4030
;4030:			resend = 50;
ADDRLP4 4400
CNSTI4 50
ASGNI4
line 4031
;4031:		}
LABELV $3156
line 4032
;4032:		trap_Cvar_Set("cl_serverStatusResendTime", va("%d", resend));
ADDRGP4 $713
ARGP4
ADDRLP4 4400
INDIRI4
ARGI4
ADDRLP4 4408
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $3158
ARGP4
ADDRLP4 4408
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4034
;4033:		// reset all server status requests
;4034:		trap_LAN_ServerStatus( NULL, NULL, 0);
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 4036
;4035:		//
;4036:		uiInfo.numFoundPlayerServers = 1;
ADDRGP4 uiInfo+119468
CNSTI4 1
ASGNI4
line 4037
;4037:		Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3166
ARGP4
ADDRGP4 uiInfo+114148
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4040
;4038:						sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;4039:							"searching %d...", uiInfo.pendingServerStatus.num);
;4040:		numFound = 0;
ADDRGP4 $3133
CNSTI4 0
ASGNI4
line 4041
;4041:		numTimeOuts++;
ADDRLP4 4412
ADDRGP4 $3134
ASGNP4
ADDRLP4 4412
INDIRP4
ADDRLP4 4412
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4042
;4042:	}
LABELV $3136
line 4043
;4043:	for (i = 0; i < MAX_SERVERSTATUSREQUESTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3168
line 4045
;4044:		// if this pending server is valid
;4045:		if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3172
line 4047
;4046:			// try to get the server status for this server
;4047:			if (UI_GetServerStatusInfo( uiInfo.pendingServerStatus.server[i].adrstr, &info ) ) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4404
ADDRGP4 UI_GetServerStatusInfo
CALLI4
ASGNI4
ADDRLP4 4404
INDIRI4
CNSTI4 0
EQI4 $3177
line 4049
;4048:				//
;4049:				numFound++;
ADDRLP4 4408
ADDRGP4 $3133
ASGNP4
ADDRLP4 4408
INDIRP4
ADDRLP4 4408
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4051
;4050:				// parse through the server status lines
;4051:				for (j = 0; j < info.numLines; j++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3184
JUMPV
LABELV $3181
line 4053
;4052:					// should have ping info
;4053:					if ( !info.lines[j][2] || !info.lines[j][2][0] ) {
ADDRLP4 4412
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 4412
INDIRI4
ADDRLP4 8+64+8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3192
ADDRLP4 4412
INDIRI4
ADDRLP4 8+64+8
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3186
LABELV $3192
line 4054
;4054:						continue;
ADDRGP4 $3182
JUMPV
LABELV $3186
line 4057
;4055:					}
;4056:					// clean string first
;4057:					Q_strncpyz(name, info.lines[j][3], sizeof(name));
ADDRLP4 3340
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 8+64+12
ADDP4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4058
;4058:					Q_CleanStr(name);
ADDRLP4 3340
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 4060
;4059:					// if the player name is a substring
;4060:					if (stristr(name, uiInfo.findPlayerName)) {
ADDRLP4 3340
ARGP4
ADDRGP4 uiInfo+116392
ARGP4
ADDRLP4 4416
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 4416
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3195
line 4062
;4061:						// add to found server list if we have space (always leave space for a line with the number found)
;4062:						if (uiInfo.numFoundPlayerServers < MAX_FOUNDPLAYER_SERVERS-1) {
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 15
GEI4 $3198
line 4064
;4063:							//
;4064:							Q_strncpyz(uiInfo.foundPlayerServerAddresses[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117416-64
ADDP4
ARGP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4067
;4065:										uiInfo.pendingServerStatus.server[i].adrstr,
;4066:											sizeof(uiInfo.foundPlayerServerAddresses[0]));
;4067:							Q_strncpyz(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440-64
ADDP4
ARGP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4070
;4068:										uiInfo.pendingServerStatus.server[i].name,
;4069:											sizeof(uiInfo.foundPlayerServerNames[0]));
;4070:							uiInfo.numFoundPlayerServers++;
ADDRLP4 4420
ADDRGP4 uiInfo+119468
ASGNP4
ADDRLP4 4420
INDIRP4
ADDRLP4 4420
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4071
;4071:						}
ADDRGP4 $3199
JUMPV
LABELV $3198
line 4072
;4072:						else {
line 4074
;4073:							// can't add any more so we're done
;4074:							uiInfo.pendingServerStatus.num = uiInfo.serverStatus.numDisplayServers;
ADDRGP4 uiInfo+114148
ADDRGP4 uiInfo+99264+10412
INDIRI4
ASGNI4
line 4075
;4075:						}
LABELV $3199
line 4076
;4076:					}
LABELV $3195
line 4077
;4077:				}
LABELV $3182
line 4051
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3184
ADDRLP4 4
INDIRI4
ADDRLP4 8+3328
INDIRI4
LTI4 $3181
line 4078
;4078:				Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3224
ARGP4
ADDRGP4 uiInfo+114148
INDIRI4
ARGI4
ADDRGP4 $3133
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4082
;4079:								sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;4080:									"searching %d/%d...", uiInfo.pendingServerStatus.num, numFound);
;4081:				// retrieved the server status so reuse this spot
;4082:				uiInfo.pendingServerStatus.server[i].valid = qfalse;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
CNSTI4 0
ASGNI4
line 4083
;4083:			}
LABELV $3177
line 4084
;4084:		}
LABELV $3172
line 4086
;4085:		// if empty pending slot or timed out
;4086:		if (!uiInfo.pendingServerStatus.server[i].valid ||
ADDRLP4 4404
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4404
INDIRI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3239
ADDRLP4 4404
INDIRI4
ADDRGP4 uiInfo+114148+4+128
ADDP4
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 ui_serverStatusTimeOut+12
INDIRI4
SUBI4
GEI4 $3229
LABELV $3239
line 4087
;4087:			uiInfo.pendingServerStatus.server[i].startTime < uiInfo.uiDC.realTime - ui_serverStatusTimeOut.integer) {
line 4088
;4088:			if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3240
line 4089
;4089:				numTimeOuts++;
ADDRLP4 4408
ADDRGP4 $3134
ASGNP4
ADDRLP4 4408
INDIRP4
ADDRLP4 4408
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4090
;4090:			}
LABELV $3240
line 4092
;4091:			// reset server status request for this address
;4092:			UI_GetServerStatusInfo( uiInfo.pendingServerStatus.server[i].adrstr, NULL );
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
pop
line 4094
;4093:			// reuse pending slot
;4094:			uiInfo.pendingServerStatus.server[i].valid = qfalse;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
CNSTI4 0
ASGNI4
line 4096
;4095:			// if we didn't try to get the status of all servers in the main browser yet
;4096:			if (uiInfo.pendingServerStatus.num < uiInfo.serverStatus.numDisplayServers) {
ADDRGP4 uiInfo+114148
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
GEI4 $3250
line 4097
;4097:				uiInfo.pendingServerStatus.server[i].startTime = uiInfo.uiDC.realTime;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+128
ADDP4
ADDRGP4 uiInfo+208
INDIRI4
ASGNI4
line 4098
;4098:				trap_LAN_GetServerAddressString(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.pendingServerStatus.num],
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+114148
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 4100
;4099:							uiInfo.pendingServerStatus.server[i].adrstr, sizeof(uiInfo.pendingServerStatus.server[i].adrstr));
;4100:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[uiInfo.pendingServerStatus.num], infoString, sizeof(infoString));
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 uiInfo+114148
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRLP4 3374
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4101
;4101:				Q_strncpyz(uiInfo.pendingServerStatus.server[i].name, Info_ValueForKey(infoString, "hostname"), sizeof(uiInfo.pendingServerStatus.server[0].name));
ADDRLP4 3374
ARGP4
ADDRGP4 $2667
ARGP4
ADDRLP4 4408
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+64
ADDP4
ARGP4
ADDRLP4 4408
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4102
;4102:				uiInfo.pendingServerStatus.server[i].valid = qtrue;
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
CNSTI4 1
ASGNI4
line 4103
;4103:				uiInfo.pendingServerStatus.num++;
ADDRLP4 4412
ADDRGP4 uiInfo+114148
ASGNP4
ADDRLP4 4412
INDIRP4
ADDRLP4 4412
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4104
;4104:				Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1],
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3224
ARGP4
ADDRGP4 uiInfo+114148
INDIRI4
ARGI4
ADDRGP4 $3133
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 4107
;4105:								sizeof(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1]),
;4106:									"searching %d/%d...", uiInfo.pendingServerStatus.num, numFound);
;4107:			}
LABELV $3250
line 4108
;4108:		}
LABELV $3229
line 4109
;4109:	}
LABELV $3169
line 4043
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $3168
line 4110
;4110:	for (i = 0; i < MAX_SERVERSTATUSREQUESTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3288
line 4111
;4111:		if (uiInfo.pendingServerStatus.server[i].valid) {
CNSTI4 140
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+114148+4+136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3292
line 4112
;4112:			break;
ADDRGP4 $3290
JUMPV
LABELV $3292
line 4114
;4113:		}
;4114:	}
LABELV $3289
line 4110
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $3288
LABELV $3290
line 4116
;4115:	// if still trying to retrieve server status info
;4116:	if (i < MAX_SERVERSTATUSREQUESTS) {
ADDRLP4 0
INDIRI4
CNSTI4 16
GEI4 $3297
line 4117
;4117:		uiInfo.nextFindPlayerRefresh = uiInfo.uiDC.realTime + 25;
ADDRGP4 uiInfo+119472
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 4118
;4118:	}
ADDRGP4 $3298
JUMPV
LABELV $3297
line 4119
;4119:	else {
line 4121
;4120:		// add a line that shows the number of servers found
;4121:		if (!uiInfo.numFoundPlayerServers) {
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 0
NEI4 $3301
line 4122
;4122:			Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1], sizeof(uiInfo.foundPlayerServerAddresses[0]), "no servers found");
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3308
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4123
;4123:		}
ADDRGP4 $3302
JUMPV
LABELV $3301
line 4124
;4124:		else {
line 4125
;4125:			Com_sprintf(uiInfo.foundPlayerServerNames[uiInfo.numFoundPlayerServers-1], sizeof(uiInfo.foundPlayerServerAddresses[0]),
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440-64
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3313
ARGP4
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 2
NEI4 $3319
ADDRLP4 4404
ADDRGP4 $109
ASGNP4
ADDRGP4 $3320
JUMPV
LABELV $3319
ADDRLP4 4404
ADDRGP4 $3316
ASGNP4
LABELV $3320
ADDRLP4 4404
INDIRP4
ARGP4
ADDRGP4 uiInfo+116392
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4128
;4126:						"%d server%s found with player %s", uiInfo.numFoundPlayerServers-1,
;4127:						uiInfo.numFoundPlayerServers == 2 ? "":"s", uiInfo.findPlayerName);
;4128:		}
LABELV $3302
line 4129
;4129:		uiInfo.nextFindPlayerRefresh = 0;
ADDRGP4 uiInfo+119472
CNSTI4 0
ASGNI4
line 4131
;4130:		// show the server status info for the selected server
;4131:		UI_FeederSelection(FEEDER_FINDPLAYER, uiInfo.currentFoundPlayerServer);
CNSTF4 1096810496
ARGF4
ADDRGP4 uiInfo+119464
INDIRI4
ARGI4
ADDRGP4 UI_FeederSelection
CALLV
pop
line 4132
;4132:	}
LABELV $3298
line 4133
;4133:}
LABELV $3132
endproc UI_BuildFindPlayerList 4424 24
proc UI_BuildServerStatus 8 16
line 4140
;4134:
;4135:/*
;4136:==================
;4137:UI_BuildServerStatus
;4138:==================
;4139:*/
;4140:static void UI_BuildServerStatus(qboolean force) {
line 4142
;4141:
;4142:	if (uiInfo.nextFindPlayerRefresh) {
ADDRGP4 uiInfo+119472
INDIRI4
CNSTI4 0
EQI4 $3324
line 4143
;4143:		return;
ADDRGP4 $3323
JUMPV
LABELV $3324
line 4145
;4144:	}
;4145:	if (!force) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $3327
line 4146
;4146:		if (!uiInfo.nextServerStatusRefresh || uiInfo.nextServerStatusRefresh > uiInfo.uiDC.realTime) {
ADDRGP4 uiInfo+114144
INDIRI4
CNSTI4 0
EQI4 $3334
ADDRGP4 uiInfo+114144
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
LEI4 $3328
LABELV $3334
line 4147
;4147:			return;
ADDRGP4 $3323
JUMPV
line 4149
;4148:		}
;4149:	}
LABELV $3327
line 4150
;4150:	else {
line 4151
;4151:		Menu_SetFeederSelection(NULL, FEEDER_SERVERSTATUS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4152
;4152:		uiInfo.serverStatusInfo.numLines = 0;
ADDRGP4 uiInfo+110812+3328
CNSTI4 0
ASGNI4
line 4154
;4153:		// reset all server status requests
;4154:		trap_LAN_ServerStatus( NULL, NULL, 0);
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_LAN_ServerStatus
CALLI4
pop
line 4155
;4155:	}
LABELV $3328
line 4156
;4156:	if (uiInfo.serverStatus.currentServer < 0 || uiInfo.serverStatus.currentServer > uiInfo.serverStatus.numDisplayServers || uiInfo.serverStatus.numDisplayServers == 0) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 uiInfo+99264+2216
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $3348
ADDRGP4 uiInfo+99264+2216
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
GTI4 $3348
ADDRGP4 uiInfo+99264+10412
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $3337
LABELV $3348
line 4157
;4157:		return;
ADDRGP4 $3323
JUMPV
LABELV $3337
line 4159
;4158:	}
;4159:	if (UI_GetServerStatusInfo( uiInfo.serverStatusAddress, &uiInfo.serverStatusInfo ) ) {
ADDRGP4 uiInfo+110748
ARGP4
ADDRGP4 uiInfo+110812
ARGP4
ADDRLP4 4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $3349
line 4160
;4160:		uiInfo.nextServerStatusRefresh = 0;
ADDRGP4 uiInfo+114144
CNSTI4 0
ASGNI4
line 4161
;4161:		UI_GetServerStatusInfo( uiInfo.serverStatusAddress, NULL );
ADDRGP4 uiInfo+110748
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 UI_GetServerStatusInfo
CALLI4
pop
line 4162
;4162:	}
ADDRGP4 $3350
JUMPV
LABELV $3349
line 4163
;4163:	else {
line 4164
;4164:		uiInfo.nextServerStatusRefresh = uiInfo.uiDC.realTime + 500;
ADDRGP4 uiInfo+114144
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4165
;4165:	}
LABELV $3350
line 4166
;4166:}
LABELV $3323
endproc UI_BuildServerStatus 8 16
proc UI_FeederCount 12 4
line 4173
;4167:
;4168:/*
;4169:==================
;4170:UI_FeederCount
;4171:==================
;4172:*/
;4173:static int UI_FeederCount(float feederID) {
line 4174
;4174:	if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3358
line 4175
;4175:		return UI_HeadCountByTeam();
ADDRLP4 0
ADDRGP4 UI_HeadCountByTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $3357
JUMPV
LABELV $3358
line 4176
;4176:	} else if (feederID == FEEDER_Q3HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3360
line 4177
;4177:		return uiInfo.q3HeadCount;
ADDRGP4 uiInfo+119488
INDIRI4
RETI4
ADDRGP4 $3357
JUMPV
LABELV $3360
line 4178
;4178:	} else if (feederID == FEEDER_CINEMATICS) {
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $3363
line 4179
;4179:		return uiInfo.movieCount;
ADDRGP4 uiInfo+99252
INDIRI4
RETI4
ADDRGP4 $3357
JUMPV
LABELV $3363
line 4180
;4180:	} else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS) {
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $3368
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $3366
LABELV $3368
line 4181
;4181:		return UI_MapCountByGameType(feederID == FEEDER_MAPS ? qtrue : qfalse);
ADDRFP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $3370
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $3371
JUMPV
LABELV $3370
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $3371
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_MapCountByGameType
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $3357
JUMPV
LABELV $3366
line 4182
;4182:	} else if (feederID == FEEDER_SERVERS) {
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $3372
line 4183
;4183:		return uiInfo.serverStatus.numDisplayServers;
ADDRGP4 uiInfo+99264+10412
INDIRI4
RETI4
ADDRGP4 $3357
JUMPV
LABELV $3372
line 4184
;4184:	} else if (feederID == FEEDER_SERVERSTATUS) {
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $3376
line 4185
;4185:		return uiInfo.serverStatusInfo.numLines;
ADDRGP4 uiInfo+110812+3328
INDIRI4
RETI4
ADDRGP4 $3357
JUMPV
LABELV $3376
line 4186
;4186:	} else if (feederID == FEEDER_FINDPLAYER) {
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $3380
line 4187
;4187:		return uiInfo.numFoundPlayerServers;
ADDRGP4 uiInfo+119468
INDIRI4
RETI4
ADDRGP4 $3357
JUMPV
LABELV $3380
line 4188
;4188:	} else if (feederID == FEEDER_PLAYER_LIST) {
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $3383
line 4189
;4189:		if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) {
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+78856
INDIRI4
LEI4 $3385
line 4190
;4190:			uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+78856
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 4191
;4191:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 4192
;4192:		}
LABELV $3385
line 4193
;4193:		return uiInfo.playerCount;
ADDRGP4 uiInfo+78844
INDIRI4
RETI4
ADDRGP4 $3357
JUMPV
LABELV $3383
line 4194
;4194:	} else if (feederID == FEEDER_TEAM_LIST) {
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $3392
line 4195
;4195:		if (uiInfo.uiDC.realTime > uiInfo.playerRefresh) {
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+78856
INDIRI4
LEI4 $3394
line 4196
;4196:			uiInfo.playerRefresh = uiInfo.uiDC.realTime + 3000;
ADDRGP4 uiInfo+78856
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 4197
;4197:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 4198
;4198:		}
LABELV $3394
line 4199
;4199:		return uiInfo.myTeamCount;
ADDRGP4 uiInfo+78848
INDIRI4
RETI4
ADDRGP4 $3357
JUMPV
LABELV $3392
line 4200
;4200:	} else if (feederID == FEEDER_MODS) {
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $3401
line 4201
;4201:		return uiInfo.modCount;
ADDRGP4 uiInfo+97188
INDIRI4
RETI4
ADDRGP4 $3357
JUMPV
LABELV $3401
line 4202
;4202:	} else if (feederID == FEEDER_DEMOS) {
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $3404
line 4203
;4203:		return uiInfo.demoCount;
ADDRGP4 uiInfo+98220
INDIRI4
RETI4
ADDRGP4 $3357
JUMPV
LABELV $3404
line 4205
;4204:	}
;4205:	return 0;
CNSTI4 0
RETI4
LABELV $3357
endproc UI_FeederCount 12 4
proc UI_SelectedMap 8 0
line 4208
;4206:}
;4207:
;4208:static const char *UI_SelectedMap(int index, int *actual) {
line 4210
;4209:	int i, c;
;4210:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4211
;4211:	*actual = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4212
;4212:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3411
JUMPV
LABELV $3408
line 4213
;4213:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3413
line 4214
;4214:			if (c == index) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3417
line 4215
;4215:				*actual = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 4216
;4216:				return uiInfo.mapList[i].mapName;
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228
ADDP4
INDIRP4
RETP4
ADDRGP4 $3407
JUMPV
LABELV $3417
line 4217
;4217:			} else {
line 4218
;4218:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4219
;4219:			}
line 4220
;4220:		}
LABELV $3413
line 4221
;4221:	}
LABELV $3409
line 4212
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3411
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LTI4 $3408
line 4222
;4222:	return "";
ADDRGP4 $109
RETP4
LABELV $3407
endproc UI_SelectedMap 8 0
proc UI_SelectedHead 8 0
line 4225
;4223:}
;4224:
;4225:static const char *UI_SelectedHead(int index, int *actual) {
line 4227
;4226:	int i, c;
;4227:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4228
;4228:	*actual = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4229
;4229:	for (i = 0; i < uiInfo.characterCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3424
JUMPV
LABELV $3421
line 4230
;4230:		if (uiInfo.characterList[i].active) {
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3426
line 4231
;4231:			if (c == index) {
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3430
line 4232
;4232:				*actual = i;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 4233
;4233:				return uiInfo.characterList[i].name;
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
RETP4
ADDRGP4 $3420
JUMPV
LABELV $3430
line 4234
;4234:			} else {
line 4235
;4235:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4236
;4236:			}
line 4237
;4237:		}
LABELV $3426
line 4238
;4238:	}
LABELV $3422
line 4229
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3424
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
LTI4 $3421
line 4239
;4239:	return "";
ADDRGP4 $109
RETP4
LABELV $3420
endproc UI_SelectedHead 8 0
proc UI_GetIndexFromSelection 8 0
line 4242
;4240:}
;4241:
;4242:static int UI_GetIndexFromSelection(int actual) {
line 4244
;4243:	int i, c;
;4244:	c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4245
;4245:	for (i = 0; i < uiInfo.mapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3437
JUMPV
LABELV $3434
line 4246
;4246:		if (uiInfo.mapList[i].active) {
CNSTI4 100
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+96
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3439
line 4247
;4247:			if (i == actual) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $3443
line 4248
;4248:				return c;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $3433
JUMPV
LABELV $3443
line 4250
;4249:			}
;4250:				c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4251
;4251:		}
LABELV $3439
line 4252
;4252:	}
LABELV $3435
line 4245
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3437
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
LTI4 $3434
line 4253
;4253:  return 0;
CNSTI4 0
RETI4
LABELV $3433
endproc UI_GetIndexFromSelection 8 0
proc UI_UpdatePendingPings 0 4
line 4256
;4254:}
;4255:
;4256:static void UI_UpdatePendingPings() { 
line 4257
;4257:	trap_LAN_ResetPings(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ResetPings
CALLV
pop
line 4258
;4258:	uiInfo.serverStatus.refreshActive = qtrue;
ADDRGP4 uiInfo+99264+2212
CNSTI4 1
ASGNI4
line 4259
;4259:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+99264+2192
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 4261
;4260:
;4261:}
LABELV $3445
endproc UI_UpdatePendingPings 0 4
bss
align 1
LABELV $3453
skip 1024
align 1
LABELV $3454
skip 1024
align 1
LABELV $3455
skip 32
data
align 4
LABELV $3456
byte 4 -1
align 4
LABELV $3457
byte 4 0
code
proc UI_FeederItemText 64 20
line 4263
;4262:
;4263:static const char *UI_FeederItemText(float feederID, int index, int column, qhandle_t *handle) {
line 4269
;4264:	static char info[MAX_STRING_CHARS];
;4265:	static char hostname[1024];
;4266:	static char clientBuff[32];
;4267:	static int lastColumn = -1;
;4268:	static int lastTime = 0;
;4269:	*handle = -1;
ADDRFP4 12
INDIRP4
CNSTI4 -1
ASGNI4
line 4270
;4270:	if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3458
line 4272
;4271:		int actual;
;4272:		return UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ADDRGP4 UI_SelectedHead
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3458
line 4273
;4273:	} else if (feederID == FEEDER_Q3HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3460
line 4274
;4274:		if (index >= 0 && index < uiInfo.q3HeadCount) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $3461
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+119488
INDIRI4
GEI4 $3461
line 4275
;4275:			return uiInfo.q3HeadNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+119492
ADDP4
RETP4
ADDRGP4 $3452
JUMPV
line 4277
;4276:		}
;4277:	} else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS) {
LABELV $3460
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $3468
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $3466
LABELV $3468
line 4279
;4278:		int actual;
;4279:		return UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 UI_SelectedMap
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3466
line 4280
;4280:	} else if (feederID == FEEDER_SERVERS) {
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $3469
line 4281
;4281:		if (index >= 0 && index < uiInfo.serverStatus.numDisplayServers) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3470
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
GEI4 $3470
line 4283
;4282:			int ping, game, punkbuster;
;4283:			if (lastColumn != column || lastTime > uiInfo.uiDC.realTime + 5000) {
ADDRGP4 $3456
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $3478
ADDRGP4 $3457
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 5000
ADDI4
LEI4 $3475
LABELV $3478
line 4284
;4284:				trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[index], info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 $3453
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4285
;4285:				lastColumn = column;
ADDRGP4 $3456
ADDRFP4 8
INDIRI4
ASGNI4
line 4286
;4286:				lastTime = uiInfo.uiDC.realTime;
ADDRGP4 $3457
ADDRGP4 uiInfo+208
INDIRI4
ASGNI4
line 4287
;4287:			}
LABELV $3475
line 4288
;4288:			ping = atoi(Info_ValueForKey(info, "ping"));
ADDRGP4 $3453
ARGP4
ADDRGP4 $3102
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
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 4289
;4289:			if (ping == -1) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
NEI4 $3483
line 4292
;4290:				// if we ever see a ping that is out of date, do a server refresh
;4291:				// UI_UpdatePendingPings();
;4292:			}
LABELV $3483
line 4293
;4293:			switch (column) {
ADDRLP4 28
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $3470
ADDRLP4 28
INDIRI4
CNSTI4 5
GTI4 $3470
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $3513
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $3513
address $3487
address $3496
address $3497
address $3499
address $3503
address $3507
code
LABELV $3487
line 4295
;4294:				case SORT_HOST : 
;4295:					if (ping <= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $3488
line 4296
;4296:						return Info_ValueForKey(info, "addr");
ADDRGP4 $3453
ARGP4
ADDRGP4 $2668
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3488
line 4297
;4297:					} else {
line 4298
;4298:						if ( ui_netSource.integer == AS_LOCAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $3490
line 4299
;4299:							Com_sprintf( hostname, sizeof(hostname), "%s [%s]",
ADDRGP4 $3453
ARGP4
ADDRGP4 $2667
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3453
ARGP4
ADDRGP4 $3494
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $3454
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3493
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4302
;4300:											Info_ValueForKey(info, "hostname"),
;4301:											netnames[atoi(Info_ValueForKey(info, "nettype"))] );
;4302:							return hostname;
ADDRGP4 $3454
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3490
line 4304
;4303:						}
;4304:						else {
line 4305
;4305:							Com_sprintf( hostname, sizeof(hostname), "%s", Info_ValueForKey(info, "hostname"));
ADDRGP4 $3453
ARGP4
ADDRGP4 $2667
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3454
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $3495
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4306
;4306:							return hostname;
ADDRGP4 $3454
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3496
line 4309
;4307:						}
;4308:					}
;4309:				case SORT_MAP : return Info_ValueForKey(info, "mapname");
ADDRGP4 $3453
ARGP4
ADDRGP4 $3059
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3497
line 4311
;4310:				case SORT_CLIENTS : 
;4311:					Com_sprintf( clientBuff, sizeof(clientBuff), "%s (%s)", Info_ValueForKey(info, "clients"), Info_ValueForKey(info, "sv_maxclients"));
ADDRGP4 $3453
ARGP4
ADDRGP4 $3005
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3453
ARGP4
ADDRGP4 $1360
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $3455
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $3498
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4312
;4312:					return clientBuff;
ADDRGP4 $3455
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3499
line 4314
;4313:				case SORT_GAME : 
;4314:					game = atoi(Info_ValueForKey(info, "gametype"));
ADDRGP4 $3453
ARGP4
ADDRGP4 $3025
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 4315
;4315:					if (game >= 0 && game < numTeamArenaGameTypes) {
ADDRLP4 52
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $3500
ADDRLP4 52
INDIRI4
ADDRGP4 numTeamArenaGameTypes
INDIRI4
GEI4 $3500
line 4316
;4316:						return teamArenaGameTypes[game];
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamArenaGameTypes
ADDP4
INDIRP4
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3500
line 4317
;4317:					} else {
line 4318
;4318:						return "Unknown";
ADDRGP4 $3502
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3503
line 4321
;4319:					}
;4320:				case SORT_PING : 
;4321:					if (ping <= 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $3504
line 4322
;4322:						return "...";
ADDRGP4 $3506
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3504
line 4323
;4323:					} else {
line 4324
;4324:						return Info_ValueForKey(info, "ping");
ADDRGP4 $3453
ARGP4
ADDRGP4 $3102
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3507
line 4327
;4325:					}
;4326:				case SORT_PUNKBUSTER:
;4327:					punkbuster = atoi(Info_ValueForKey(info, "punkbuster"));
ADDRGP4 $3453
ARGP4
ADDRGP4 $3508
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 60
INDIRI4
ASGNI4
line 4328
;4328:					if ( punkbuster ) {
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $3509
line 4329
;4329:						return "Yes";
ADDRGP4 $3511
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3509
line 4330
;4330:					} else {
line 4331
;4331:						return "No";
ADDRGP4 $3512
RETP4
ADDRGP4 $3452
JUMPV
line 4334
;4332:					}
;4333:			}
;4334:		}
line 4335
;4335:	} else if (feederID == FEEDER_SERVERSTATUS) {
LABELV $3469
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $3514
line 4336
;4336:		if ( index >= 0 && index < uiInfo.serverStatusInfo.numLines ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3515
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+110812+3328
INDIRI4
GEI4 $3515
line 4337
;4337:			if ( column >= 0 && column < 4 ) {
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3515
ADDRLP4 8
INDIRI4
CNSTI4 4
GEI4 $3515
line 4338
;4338:				return uiInfo.serverStatusInfo.lines[index][column];
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 uiInfo+110812+64
ADDP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $3452
JUMPV
line 4340
;4339:			}
;4340:		}
line 4341
;4341:	} else if (feederID == FEEDER_FINDPLAYER) {
LABELV $3514
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $3524
line 4342
;4342:		if ( index >= 0 && index < uiInfo.numFoundPlayerServers ) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3525
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+119468
INDIRI4
GEI4 $3525
line 4344
;4343:			//return uiInfo.foundPlayerServerAddresses[index];
;4344:			return uiInfo.foundPlayerServerNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+118440
ADDP4
RETP4
ADDRGP4 $3452
JUMPV
line 4346
;4345:		}
;4346:	} else if (feederID == FEEDER_PLAYER_LIST) {
LABELV $3524
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $3530
line 4347
;4347:		if (index >= 0 && index < uiInfo.playerCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3531
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78844
INDIRI4
GEI4 $3531
line 4348
;4348:			return uiInfo.playerNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+78872
ADDP4
RETP4
ADDRGP4 $3452
JUMPV
line 4350
;4349:		}
;4350:	} else if (feederID == FEEDER_TEAM_LIST) {
LABELV $3530
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $3536
line 4351
;4351:		if (index >= 0 && index < uiInfo.myTeamCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3537
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+78848
INDIRI4
GEI4 $3537
line 4352
;4352:			return uiInfo.teamNames[index];
ADDRFP4 4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 uiInfo+80920
ADDP4
RETP4
ADDRGP4 $3452
JUMPV
line 4354
;4353:		}
;4354:	} else if (feederID == FEEDER_MODS) {
LABELV $3536
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $3542
line 4355
;4355:		if (index >= 0 && index < uiInfo.modCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3543
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+97188
INDIRI4
GEI4 $3543
line 4356
;4356:			if (uiInfo.modList[index].modDescr && *uiInfo.modList[index].modDescr) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+96676+4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3547
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+96676+4
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3547
line 4357
;4357:				return uiInfo.modList[index].modDescr;
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96676+4
ADDP4
INDIRP4
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3547
line 4358
;4358:			} else {
line 4359
;4359:				return uiInfo.modList[index].modName;
ADDRFP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+96676
ADDP4
INDIRP4
RETP4
ADDRGP4 $3452
JUMPV
line 4362
;4360:			}
;4361:		}
;4362:	} else if (feederID == FEEDER_CINEMATICS) {
LABELV $3542
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $3556
line 4363
;4363:		if (index >= 0 && index < uiInfo.movieCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3557
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+99252
INDIRI4
GEI4 $3557
line 4364
;4364:			return uiInfo.movieList[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+98228
ADDP4
INDIRP4
RETP4
ADDRGP4 $3452
JUMPV
line 4366
;4365:		}
;4366:	} else if (feederID == FEEDER_DEMOS) {
LABELV $3556
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $3562
line 4367
;4367:		if (index >= 0 && index < uiInfo.demoCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3564
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+98220
INDIRI4
GEI4 $3564
line 4368
;4368:			return uiInfo.demoList[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+97196
ADDP4
INDIRP4
RETP4
ADDRGP4 $3452
JUMPV
LABELV $3564
line 4370
;4369:		}
;4370:	}
LABELV $3562
LABELV $3557
LABELV $3543
LABELV $3537
LABELV $3531
LABELV $3525
LABELV $3515
LABELV $3470
LABELV $3461
line 4371
;4371:	return "";
ADDRGP4 $109
RETP4
LABELV $3452
endproc UI_FeederItemText 64 20
proc UI_FeederItemImage 20 8
line 4375
;4372:}
;4373:
;4374:
;4375:static qhandle_t UI_FeederItemImage(float feederID, int index) {
line 4376
;4376:  if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3569
line 4378
;4377:	int actual;
;4378:	UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedHead
CALLP4
pop
line 4379
;4379:	index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 4380
;4380:	if (index >= 0 && index < uiInfo.characterCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3570
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
GEI4 $3570
line 4381
;4381:		if (uiInfo.characterList[index].headImage == -1) {
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+8
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $3574
line 4382
;4382:			uiInfo.characterList[index].headImage = trap_R_RegisterShaderNoMip(uiInfo.characterList[index].imageName);
ADDRLP4 8
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+73448+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+73448+8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 4383
;4383:		}
LABELV $3574
line 4384
;4384:		return uiInfo.characterList[index].headImage;
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+8
ADDP4
INDIRI4
RETI4
ADDRGP4 $3568
JUMPV
line 4386
;4385:	}
;4386:  } else if (feederID == FEEDER_Q3HEADS) {
LABELV $3569
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3584
line 4387
;4387:    if (index >= 0 && index < uiInfo.q3HeadCount) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $3585
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+119488
INDIRI4
GEI4 $3585
line 4388
;4388:      return uiInfo.q3HeadIcons[index];
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+135876
ADDP4
INDIRI4
RETI4
ADDRGP4 $3568
JUMPV
line 4390
;4389:    }
;4390:	} else if (feederID == FEEDER_ALLMAPS || feederID == FEEDER_MAPS) {
LABELV $3584
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
EQF4 $3592
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $3590
LABELV $3592
line 4392
;4391:		int actual;
;4392:		UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 4393
;4393:		index = actual;
ADDRFP4 4
ADDRLP4 4
INDIRI4
ASGNI4
line 4394
;4394:		if (index >= 0 && index < uiInfo.mapCount) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $3593
ADDRLP4 8
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
GEI4 $3593
line 4395
;4395:			if (uiInfo.mapList[index].levelShot == -1) {
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+92
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $3596
line 4396
;4396:				uiInfo.mapList[index].levelShot = trap_R_RegisterShaderNoMip(uiInfo.mapList[index].imageName);
ADDRLP4 12
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83228+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 uiInfo+83228+92
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 4397
;4397:			}
LABELV $3596
line 4398
;4398:			return uiInfo.mapList[index].levelShot;
CNSTI4 100
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+92
ADDP4
INDIRI4
RETI4
ADDRGP4 $3568
JUMPV
LABELV $3593
line 4400
;4399:		}
;4400:	}
LABELV $3590
LABELV $3585
LABELV $3570
line 4401
;4401:  return 0;
CNSTI4 0
RETI4
LABELV $3568
endproc UI_FeederItemImage 20 8
bss
align 1
LABELV $3607
skip 1024
code
proc UI_FeederSelection 40 24
line 4404
;4402:}
;4403:
;4404:static void UI_FeederSelection(float feederID, int index) {
line 4406
;4405:	static char info[MAX_STRING_CHARS];
;4406:  if (feederID == FEEDER_HEADS) {
ADDRFP4 0
INDIRF4
CNSTF4 0
NEF4 $3608
line 4408
;4407:	int actual;
;4408:	UI_SelectedHead(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 UI_SelectedHead
CALLP4
pop
line 4409
;4409:	index = actual;
ADDRFP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 4410
;4410:    if (index >= 0 && index < uiInfo.characterCount) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $3609
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
GEI4 $3609
line 4411
;4411:		trap_Cvar_Set( "team_model", va("%s", uiInfo.characterList[index].base));
ADDRGP4 $3495
ARGP4
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $966
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4412
;4412:		trap_Cvar_Set( "team_headmodel", va("*%s", uiInfo.characterList[index].name)); 
ADDRGP4 $3615
ARGP4
CNSTI4 24
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $967
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4413
;4413:		updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 4414
;4414:    }
line 4415
;4415:  } else if (feederID == FEEDER_Q3HEADS) {
ADDRGP4 $3609
JUMPV
LABELV $3608
ADDRFP4 0
INDIRF4
CNSTF4 1094713344
NEF4 $3617
line 4416
;4416:    if (index >= 0 && index < uiInfo.q3HeadCount) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $3618
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+119488
INDIRI4
GEI4 $3618
line 4417
;4417:      trap_Cvar_Set( "model", uiInfo.q3HeadNames[index]);
ADDRGP4 $962
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+119492
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4418
;4418:      trap_Cvar_Set( "headmodel", uiInfo.q3HeadNames[index]);
ADDRGP4 $963
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+119492
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4419
;4419:			updateModel = qtrue;
ADDRGP4 updateModel
CNSTI4 1
ASGNI4
line 4420
;4420:		}
line 4421
;4421:  } else if (feederID == FEEDER_MAPS || feederID == FEEDER_ALLMAPS) {
ADDRGP4 $3618
JUMPV
LABELV $3617
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
EQF4 $3626
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $3624
LABELV $3626
line 4423
;4422:		int actual, map;
;4423:		map = (feederID == FEEDER_ALLMAPS) ? ui_currentNetMap.integer : ui_currentMap.integer;
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
NEF4 $3630
ADDRLP4 12
ADDRGP4 ui_currentNetMap+12
INDIRI4
ASGNI4
ADDRGP4 $3631
JUMPV
LABELV $3630
ADDRLP4 12
ADDRGP4 ui_currentMap+12
INDIRI4
ASGNI4
LABELV $3631
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 4424
;4424:		if (uiInfo.mapList[map].cinematic >= 0) {
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $3632
line 4425
;4425:		  trap_CIN_StopCinematic(uiInfo.mapList[map].cinematic);
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4426
;4426:		  uiInfo.mapList[map].cinematic = -1;
CNSTI4 100
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
CNSTI4 -1
ASGNI4
line 4427
;4427:		}
LABELV $3632
line 4428
;4428:		UI_SelectedMap(index, &actual);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_SelectedMap
CALLP4
pop
line 4429
;4429:		trap_Cvar_Set("ui_mapIndex", va("%d", index));
ADDRGP4 $713
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2169
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4430
;4430:		ui_mapIndex.integer = index;
ADDRGP4 ui_mapIndex+12
ADDRFP4 4
INDIRI4
ASGNI4
line 4432
;4431:
;4432:		if (feederID == FEEDER_MAPS) {
ADDRFP4 0
INDIRF4
CNSTF4 1065353216
NEF4 $3641
line 4433
;4433:			ui_currentMap.integer = actual;
ADDRGP4 ui_currentMap+12
ADDRLP4 4
INDIRI4
ASGNI4
line 4434
;4434:			trap_Cvar_Set("ui_currentMap", va("%d", actual));
ADDRGP4 $713
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $888
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4435
;4435:	  	uiInfo.mapList[ui_currentMap.integer].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[ui_currentMap.integer].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $790
ARGP4
ADDRLP4 24
CNSTI4 100
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
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
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 4436
;4436:			UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 4437
;4437:			trap_Cvar_Set("ui_opponentModel", uiInfo.mapList[ui_currentMap.integer].opponentName);
ADDRGP4 $1092
ARGP4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+12
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4438
;4438:			updateOpponentModel = qtrue;
ADDRGP4 updateOpponentModel
CNSTI4 1
ASGNI4
line 4439
;4439:		} else {
ADDRGP4 $3625
JUMPV
LABELV $3641
line 4440
;4440:			ui_currentNetMap.integer = actual;
ADDRGP4 ui_currentNetMap+12
ADDRLP4 4
INDIRI4
ASGNI4
line 4441
;4441:			trap_Cvar_Set("ui_currentNetMap", va("%d", actual));
ADDRGP4 $713
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $886
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4442
;4442:	  	uiInfo.mapList[ui_currentNetMap.integer].cinematic = trap_CIN_PlayCinematic(va("%s.roq", uiInfo.mapList[ui_currentNetMap.integer].mapLoadName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $790
ARGP4
ADDRLP4 24
CNSTI4 100
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
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
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 ui_currentNetMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 4443
;4443:		}
line 4445
;4444:
;4445:  } else if (feederID == FEEDER_SERVERS) {
ADDRGP4 $3625
JUMPV
LABELV $3624
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
NEF4 $3666
line 4446
;4446:		const char *mapName = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 4447
;4447:		uiInfo.serverStatus.currentServer = index;
ADDRGP4 uiInfo+99264+2216
ADDRFP4 4
INDIRI4
ASGNI4
line 4448
;4448:		trap_LAN_GetServerInfo(ui_netSource.integer, uiInfo.serverStatus.displayServers[index], info, MAX_STRING_CHARS);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+99264+2220
ADDP4
INDIRI4
ARGI4
ADDRGP4 $3607
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetServerInfo
CALLV
pop
line 4449
;4449:		uiInfo.serverStatus.currentServerPreview = trap_R_RegisterShaderNoMip(va("levelshots/%s", Info_ValueForKey(info, "mapname")));
ADDRGP4 $3607
ARGP4
ADDRGP4 $3059
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $1039
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+99264+10428
ADDRLP4 16
INDIRI4
ASGNI4
line 4450
;4450:		if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+99264+10432
INDIRI4
CNSTI4 0
LTI4 $3675
line 4451
;4451:		  trap_CIN_StopCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+99264+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4452
;4452:			uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+99264+10432
CNSTI4 -1
ASGNI4
line 4453
;4453:		}
LABELV $3675
line 4454
;4454:		mapName = Info_ValueForKey(info, "mapname");
ADDRGP4 $3607
ARGP4
ADDRGP4 $3059
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 4455
;4455:		if (mapName && *mapName) {
ADDRLP4 24
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3667
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3667
line 4456
;4456:			uiInfo.serverStatus.currentServerCinematic = trap_CIN_PlayCinematic(va("%s.roq", mapName), 0, 0, 0, 0, (CIN_loop | CIN_silent) );
ADDRGP4 $790
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRGP4 uiInfo+99264+10432
ADDRLP4 36
INDIRI4
ASGNI4
line 4457
;4457:		}
line 4458
;4458:  } else if (feederID == FEEDER_SERVERSTATUS) {
ADDRGP4 $3667
JUMPV
LABELV $3666
ADDRFP4 0
INDIRF4
CNSTF4 1095761920
NEF4 $3687
line 4460
;4459:		//
;4460:  } else if (feederID == FEEDER_FINDPLAYER) {
ADDRGP4 $3688
JUMPV
LABELV $3687
ADDRFP4 0
INDIRF4
CNSTF4 1096810496
NEF4 $3689
line 4461
;4461:	  uiInfo.currentFoundPlayerServer = index;
ADDRGP4 uiInfo+119464
ADDRFP4 4
INDIRI4
ASGNI4
line 4463
;4462:	  //
;4463:	  if ( index < uiInfo.numFoundPlayerServers-1) {
ADDRFP4 4
INDIRI4
ADDRGP4 uiInfo+119468
INDIRI4
CNSTI4 1
SUBI4
GEI4 $3690
line 4465
;4464:			// build a new server status for this server
;4465:			Q_strncpyz(uiInfo.serverStatusAddress, uiInfo.foundPlayerServerAddresses[uiInfo.currentFoundPlayerServer], sizeof(uiInfo.serverStatusAddress));
ADDRGP4 uiInfo+110748
ARGP4
ADDRGP4 uiInfo+119464
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+117416
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4466
;4466:			Menu_SetFeederSelection(NULL, FEEDER_SERVERSTATUS, 0, NULL);
CNSTP4 0
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 Menu_SetFeederSelection
CALLV
pop
line 4467
;4467:			UI_BuildServerStatus(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_BuildServerStatus
CALLV
pop
line 4468
;4468:	  }
line 4469
;4469:  } else if (feederID == FEEDER_PLAYER_LIST) {
ADDRGP4 $3690
JUMPV
LABELV $3689
ADDRFP4 0
INDIRF4
CNSTF4 1088421888
NEF4 $3699
line 4470
;4470:		uiInfo.playerIndex = index;
ADDRGP4 uiInfo+78860
ADDRFP4 4
INDIRI4
ASGNI4
line 4471
;4471:  } else if (feederID == FEEDER_TEAM_LIST) {
ADDRGP4 $3700
JUMPV
LABELV $3699
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
NEF4 $3702
line 4472
;4472:		uiInfo.teamIndex = index;
ADDRGP4 uiInfo+78852
ADDRFP4 4
INDIRI4
ASGNI4
line 4473
;4473:  } else if (feederID == FEEDER_MODS) {
ADDRGP4 $3703
JUMPV
LABELV $3702
ADDRFP4 0
INDIRF4
CNSTF4 1091567616
NEF4 $3705
line 4474
;4474:		uiInfo.modIndex = index;
ADDRGP4 uiInfo+97192
ADDRFP4 4
INDIRI4
ASGNI4
line 4475
;4475:  } else if (feederID == FEEDER_CINEMATICS) {
ADDRGP4 $3706
JUMPV
LABELV $3705
ADDRFP4 0
INDIRF4
CNSTF4 1097859072
NEF4 $3708
line 4476
;4476:		uiInfo.movieIndex = index;
ADDRGP4 uiInfo+99256
ADDRFP4 4
INDIRI4
ASGNI4
line 4477
;4477:		if (uiInfo.previewMovie >= 0) {
ADDRGP4 uiInfo+99260
INDIRI4
CNSTI4 0
LTI4 $3711
line 4478
;4478:		  trap_CIN_StopCinematic(uiInfo.previewMovie);
ADDRGP4 uiInfo+99260
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4479
;4479:		}
LABELV $3711
line 4480
;4480:		uiInfo.previewMovie = -1;
ADDRGP4 uiInfo+99260
CNSTI4 -1
ASGNI4
line 4481
;4481:  } else if (feederID == FEEDER_DEMOS) {
ADDRGP4 $3709
JUMPV
LABELV $3708
ADDRFP4 0
INDIRF4
CNSTF4 1092616192
NEF4 $3716
line 4482
;4482:		uiInfo.demoIndex = index;
ADDRGP4 uiInfo+98224
ADDRFP4 4
INDIRI4
ASGNI4
line 4483
;4483:	}
LABELV $3716
LABELV $3709
LABELV $3706
LABELV $3703
LABELV $3700
LABELV $3690
LABELV $3688
LABELV $3667
LABELV $3625
LABELV $3618
LABELV $3609
line 4484
;4484:}
LABELV $3606
endproc UI_FeederSelection 40 24
proc Team_Parse 72 12
line 4486
;4485:
;4486:static qboolean Team_Parse(char **p) {
line 4491
;4487:  char *token;
;4488:  const char *tempStr;
;4489:	int i;
;4490:
;4491:  token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 4493
;4492:
;4493:  if (token[0] != '{') {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $3723
line 4494
;4494:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3719
JUMPV
LABELV $3722
line 4497
;4495:  }
;4496:
;4497:  while ( 1 ) {
line 4499
;4498:
;4499:    token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 4501
;4500:    
;4501:    if (Q_stricmp(token, "}") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $3725
line 4502
;4502:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3719
JUMPV
LABELV $3725
line 4505
;4503:    }
;4504:
;4505:    if ( !token || token[0] == 0 ) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3729
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3727
LABELV $3729
line 4506
;4506:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3719
JUMPV
LABELV $3727
line 4509
;4507:    }
;4508:
;4509:    if (token[0] == '{') {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $3730
line 4511
;4510:      // seven tokens per line, team name and icon, and 5 team member names
;4511:      if (!String_Parse(p, &uiInfo.teamList[uiInfo.teamCount].teamName) || !String_Parse(p, &tempStr)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 44
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $3736
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 32
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $3732
LABELV $3736
line 4512
;4512:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3719
JUMPV
LABELV $3732
line 4516
;4513:      }
;4514:    
;4515:
;4516:			uiInfo.teamList[uiInfo.teamCount].imageName = tempStr;
CNSTI4 44
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+4
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 4517
;4517:	    uiInfo.teamList[uiInfo.teamCount].teamIcon = trap_R_RegisterShaderNoMip(uiInfo.teamList[uiInfo.teamCount].imageName);
ADDRLP4 36
CNSTI4 44
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+28
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 4518
;4518:		  uiInfo.teamList[uiInfo.teamCount].teamIcon_Metal = trap_R_RegisterShaderNoMip(va("%s_metal",uiInfo.teamList[uiInfo.teamCount].imageName));
ADDRGP4 $766
ARGP4
ADDRLP4 44
CNSTI4 44
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+32
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 4519
;4519:			uiInfo.teamList[uiInfo.teamCount].teamIcon_Name = trap_R_RegisterShaderNoMip(va("%s_name", uiInfo.teamList[uiInfo.teamCount].imageName));
ADDRGP4 $771
ARGP4
ADDRLP4 56
CNSTI4 44
ASGNI4
ADDRLP4 56
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+36
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 4521
;4520:
;4521:			uiInfo.teamList[uiInfo.teamCount].cinematic = -1;
CNSTI4 44
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
CNSTI4 -1
ASGNI4
line 4523
;4522:
;4523:			for (i = 0; i < TEAM_MEMBERS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3761
line 4524
;4524:				uiInfo.teamList[uiInfo.teamCount].teamMembers[i] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
CNSTP4 0
ASGNP4
line 4525
;4525:				if (!String_Parse(p, &uiInfo.teamList[uiInfo.teamCount].teamMembers[i])) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 44
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+8
ADDP4
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $3768
line 4526
;4526:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3719
JUMPV
LABELV $3768
line 4528
;4527:				}
;4528:			}
LABELV $3762
line 4523
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $3761
line 4530
;4529:
;4530:      Com_Printf("Loaded team %s with team icon %s.\n", uiInfo.teamList[uiInfo.teamCount].teamName, tempStr);
ADDRGP4 $3773
ARGP4
CNSTI4 44
ADDRGP4 uiInfo+75756
INDIRI4
MULI4
ADDRGP4 uiInfo+75760
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4531
;4531:      if (uiInfo.teamCount < MAX_TEAMS) {
ADDRGP4 uiInfo+75756
INDIRI4
CNSTI4 64
GEI4 $3776
line 4532
;4532:        uiInfo.teamCount++;
ADDRLP4 68
ADDRGP4 uiInfo+75756
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4533
;4533:      } else {
ADDRGP4 $3777
JUMPV
LABELV $3776
line 4534
;4534:        Com_Printf("Too many teams, last team replaced!\n");
ADDRGP4 $3780
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4535
;4535:      }
LABELV $3777
line 4536
;4536:      token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 68
INDIRP4
ASGNP4
line 4537
;4537:      if (token[0] != '}') {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $3781
line 4538
;4538:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3719
JUMPV
LABELV $3781
line 4540
;4539:      }
;4540:    }
LABELV $3730
line 4541
;4541:  }
LABELV $3723
line 4497
ADDRGP4 $3722
JUMPV
line 4543
;4542:
;4543:  return qfalse;
CNSTI4 0
RETI4
LABELV $3719
endproc Team_Parse 72 12
proc Character_Parse 68 12
line 4546
;4544:}
;4545:
;4546:static qboolean Character_Parse(char **p) {
line 4550
;4547:  char *token;
;4548:  const char *tempStr;
;4549:
;4550:  token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 4552
;4551:
;4552:  if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $3787
line 4553
;4553:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3783
JUMPV
LABELV $3786
line 4557
;4554:  }
;4555:
;4556:
;4557:  while ( 1 ) {
line 4558
;4558:    token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 4560
;4559:
;4560:    if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $3789
line 4561
;4561:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3783
JUMPV
LABELV $3789
line 4564
;4562:    }
;4563:
;4564:    if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3793
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3791
LABELV $3793
line 4565
;4565:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3783
JUMPV
LABELV $3791
line 4568
;4566:    }
;4567:
;4568:    if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $3794
line 4570
;4569:      // two tokens per line, character name and sex
;4570:      if (!String_Parse(p, &uiInfo.characterList[uiInfo.characterCount].name) || !String_Parse(p, &tempStr)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 24
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $3800
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 28
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3796
LABELV $3800
line 4571
;4571:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3783
JUMPV
LABELV $3796
line 4574
;4572:      }
;4573:    
;4574:      uiInfo.characterList[uiInfo.characterCount].headImage = -1;
CNSTI4 24
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+8
ADDP4
CNSTI4 -1
ASGNI4
line 4575
;4575:			uiInfo.characterList[uiInfo.characterCount].imageName = String_Alloc(va("models/players/heads/%s/icon_default.tga", uiInfo.characterList[uiInfo.characterCount].name));
ADDRGP4 $3807
ARGP4
ADDRLP4 32
CNSTI4 24
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 String_Alloc
CALLP4
ASGNP4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+4
ADDP4
ADDRLP4 40
INDIRP4
ASGNP4
line 4577
;4576:
;4577:	  if (tempStr && (!Q_stricmp(tempStr, "female"))) {
ADDRLP4 44
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3810
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 $3812
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $3810
line 4578
;4578:        uiInfo.characterList[uiInfo.characterCount].base = String_Alloc(va("Janet"));
ADDRGP4 $3816
ARGP4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 24
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+12
ADDP4
ADDRLP4 56
INDIRP4
ASGNP4
line 4579
;4579:      } else if (tempStr && (!Q_stricmp(tempStr, "male"))) {
ADDRGP4 $3811
JUMPV
LABELV $3810
ADDRLP4 52
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3817
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 $3819
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $3817
line 4580
;4580:        uiInfo.characterList[uiInfo.characterCount].base = String_Alloc(va("James"));
ADDRGP4 $1087
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 24
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+12
ADDP4
ADDRLP4 64
INDIRP4
ASGNP4
line 4581
;4581:	  } else {
ADDRGP4 $3818
JUMPV
LABELV $3817
line 4582
;4582:        uiInfo.characterList[uiInfo.characterCount].base = String_Alloc(va("%s",tempStr));
ADDRGP4 $3495
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 String_Alloc
CALLP4
ASGNP4
CNSTI4 24
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+12
ADDP4
ADDRLP4 64
INDIRP4
ASGNP4
line 4583
;4583:	  }
LABELV $3818
LABELV $3811
line 4585
;4584:
;4585:      Com_Printf("Loaded %s character %s.\n", uiInfo.characterList[uiInfo.characterCount].base, uiInfo.characterList[uiInfo.characterCount].name);
ADDRGP4 $3826
ARGP4
ADDRLP4 60
CNSTI4 24
ASGNI4
ADDRLP4 60
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
INDIRI4
ADDRGP4 uiInfo+73440
INDIRI4
MULI4
ADDRGP4 uiInfo+73448
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4586
;4586:      if (uiInfo.characterCount < MAX_HEADS) {
ADDRGP4 uiInfo+73440
INDIRI4
CNSTI4 64
GEI4 $3832
line 4587
;4587:        uiInfo.characterCount++;
ADDRLP4 64
ADDRGP4 uiInfo+73440
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4588
;4588:      } else {
ADDRGP4 $3833
JUMPV
LABELV $3832
line 4589
;4589:        Com_Printf("Too many characters, last character replaced!\n");
ADDRGP4 $3836
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4590
;4590:      }
LABELV $3833
line 4592
;4591:     
;4592:      token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 64
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 64
INDIRP4
ASGNP4
line 4593
;4593:      if (token[0] != '}') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $3837
line 4594
;4594:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3783
JUMPV
LABELV $3837
line 4596
;4595:      }
;4596:    }
LABELV $3794
line 4597
;4597:  }
LABELV $3787
line 4557
ADDRGP4 $3786
JUMPV
line 4599
;4598:
;4599:  return qfalse;
CNSTI4 0
RETI4
LABELV $3783
endproc Character_Parse 68 12
proc Alias_Parse 40 12
line 4603
;4600:}
;4601:
;4602:
;4603:static qboolean Alias_Parse(char **p) {
line 4606
;4604:  char *token;
;4605:
;4606:  token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 4608
;4607:
;4608:  if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $3843
line 4609
;4609:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3839
JUMPV
LABELV $3842
line 4612
;4610:  }
;4611:
;4612:  while ( 1 ) {
line 4613
;4613:    token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 4615
;4614:
;4615:    if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $3845
line 4616
;4616:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3839
JUMPV
LABELV $3845
line 4619
;4617:    }
;4618:
;4619:    if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3849
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3847
LABELV $3849
line 4620
;4620:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3839
JUMPV
LABELV $3847
line 4623
;4621:    }
;4622:
;4623:    if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $3850
line 4625
;4624:      // three tokens per line, character name, bot alias, and preferred action a - all purpose, d - defense, o - offense
;4625:      if (!String_Parse(p, &uiInfo.aliasList[uiInfo.aliasCount].name) || !String_Parse(p, &uiInfo.aliasList[uiInfo.aliasCount].ai) || !String_Parse(p, &uiInfo.aliasList[uiInfo.aliasCount].action)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ADDRGP4 uiInfo+74984
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $3863
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ADDRGP4 uiInfo+74984
INDIRI4
MULI4
ADDRGP4 uiInfo+74988+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $3863
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ADDRGP4 uiInfo+74984
INDIRI4
MULI4
ADDRGP4 uiInfo+74988+8
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3852
LABELV $3863
line 4626
;4626:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3839
JUMPV
LABELV $3852
line 4629
;4627:      }
;4628:    
;4629:      Com_Printf("Loaded character alias %s using character ai %s.\n", uiInfo.aliasList[uiInfo.aliasCount].name, uiInfo.aliasList[uiInfo.aliasCount].ai);
ADDRGP4 $3864
ARGP4
ADDRLP4 32
CNSTI4 12
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+74984
INDIRI4
MULI4
ADDRGP4 uiInfo+74988
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ADDRGP4 uiInfo+74984
INDIRI4
MULI4
ADDRGP4 uiInfo+74988+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4630
;4630:      if (uiInfo.aliasCount < MAX_ALIASES) {
ADDRGP4 uiInfo+74984
INDIRI4
CNSTI4 64
GEI4 $3870
line 4631
;4631:        uiInfo.aliasCount++;
ADDRLP4 36
ADDRGP4 uiInfo+74984
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4632
;4632:      } else {
ADDRGP4 $3871
JUMPV
LABELV $3870
line 4633
;4633:        Com_Printf("Too many aliases, last alias replaced!\n");
ADDRGP4 $3874
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4634
;4634:      }
LABELV $3871
line 4636
;4635:     
;4636:      token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 4637
;4637:      if (token[0] != '}') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $3875
line 4638
;4638:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3839
JUMPV
LABELV $3875
line 4640
;4639:      }
;4640:    }
LABELV $3850
line 4641
;4641:  }
LABELV $3843
line 4612
ADDRGP4 $3842
JUMPV
line 4643
;4642:
;4643:  return qfalse;
CNSTI4 0
RETI4
LABELV $3839
endproc Alias_Parse 40 12
proc UI_ParseTeamInfo 44 8
line 4652
;4644:}
;4645:
;4646:
;4647:
;4648:// mode 
;4649:// 0 - high level parsing
;4650:// 1 - team parsing
;4651:// 2 - character parsing
;4652:static void UI_ParseTeamInfo(const char *teamFile) {
line 4655
;4653:	char	*token;
;4654:  char *p;
;4655:  char *buff = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 4658
;4656:  //static int mode = 0; TTimo: unused
;4657:
;4658:  buff = GetMenuBuffer(teamFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 GetMenuBuffer
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 4659
;4659:  if (!buff) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3878
line 4660
;4660:    return;
ADDRGP4 $3877
JUMPV
LABELV $3878
line 4663
;4661:  }
;4662:
;4663:  p = buff;
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $3881
JUMPV
LABELV $3880
line 4665
;4664:
;4665:	while ( 1 ) {
line 4666
;4666:		token = COM_ParseExt( &p, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 4667
;4667:		if( !token || token[0] == 0 || token[0] == '}') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3886
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $3886
ADDRLP4 24
INDIRI4
CNSTI4 125
NEI4 $3883
LABELV $3886
line 4668
;4668:			break;
ADDRGP4 $3882
JUMPV
LABELV $3883
line 4671
;4669:		}
;4670:
;4671:		if ( Q_stricmp( token, "}" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3887
line 4672
;4672:      break;
ADDRGP4 $3882
JUMPV
LABELV $3887
line 4675
;4673:    }
;4674:
;4675:    if (Q_stricmp(token, "teams") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3891
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $3889
line 4677
;4676:
;4677:      if (Team_Parse(&p)) {
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 Team_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $3882
line 4678
;4678:        continue;
ADDRGP4 $3881
JUMPV
line 4679
;4679:      } else {
line 4680
;4680:        break;
LABELV $3889
line 4684
;4681:      }
;4682:    }
;4683:
;4684:    if (Q_stricmp(token, "characters") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3896
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $3894
line 4685
;4685:      Character_Parse(&p);
ADDRLP4 4
ARGP4
ADDRGP4 Character_Parse
CALLI4
pop
line 4686
;4686:    }
LABELV $3894
line 4688
;4687:
;4688:    if (Q_stricmp(token, "aliases") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $3899
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $3897
line 4689
;4689:      Alias_Parse(&p);
ADDRLP4 4
ARGP4
ADDRGP4 Alias_Parse
CALLI4
pop
line 4690
;4690:    }
LABELV $3897
line 4692
;4691:
;4692:  }
LABELV $3881
line 4665
ADDRGP4 $3880
JUMPV
LABELV $3882
line 4694
;4693:
;4694:}
LABELV $3877
endproc UI_ParseTeamInfo 44 8
proc GameType_Parse 28 8
line 4697
;4695:
;4696:
;4697:static qboolean GameType_Parse(char **p, qboolean join) {
line 4700
;4698:	char *token;
;4699:
;4700:	token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 4702
;4701:
;4702:	if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $3901
line 4703
;4703:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3900
JUMPV
LABELV $3901
line 4706
;4704:	}
;4705:
;4706:	if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $3903
line 4707
;4707:		uiInfo.numJoinGameTypes = 0;
ADDRGP4 uiInfo+78708
CNSTI4 0
ASGNI4
line 4708
;4708:	} else {
ADDRGP4 $3908
JUMPV
LABELV $3903
line 4709
;4709:		uiInfo.numGameTypes = 0;
ADDRGP4 uiInfo+78576
CNSTI4 0
ASGNI4
line 4710
;4710:	}
ADDRGP4 $3908
JUMPV
LABELV $3907
line 4712
;4711:
;4712:	while ( 1 ) {
line 4713
;4713:		token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 4715
;4714:
;4715:		if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $3910
line 4716
;4716:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3900
JUMPV
LABELV $3910
line 4719
;4717:		}
;4718:
;4719:		if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3914
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3912
LABELV $3914
line 4720
;4720:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3900
JUMPV
LABELV $3912
line 4723
;4721:		}
;4722:
;4723:		if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $3915
line 4725
;4724:			// two tokens per line, character name and sex
;4725:			if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $3917
line 4726
;4726:				if (!String_Parse(p, &uiInfo.joinGameTypes[uiInfo.numJoinGameTypes].gameType) || !Int_Parse(p, &uiInfo.joinGameTypes[uiInfo.numJoinGameTypes].gtEnum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+78708
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78712
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $3926
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+78708
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78712+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $3918
LABELV $3926
line 4727
;4727:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3900
JUMPV
line 4729
;4728:				}
;4729:			} else {
LABELV $3917
line 4730
;4730:				if (!String_Parse(p, &uiInfo.gameTypes[uiInfo.numGameTypes].gameType) || !Int_Parse(p, &uiInfo.gameTypes[uiInfo.numGameTypes].gtEnum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+78576
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $3934
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 uiInfo+78576
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $3927
LABELV $3934
line 4731
;4731:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3900
JUMPV
LABELV $3927
line 4733
;4732:				}
;4733:			}
LABELV $3918
line 4735
;4734:    
;4735:			if (join) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $3935
line 4736
;4736:				if (uiInfo.numJoinGameTypes < MAX_GAMETYPES) {
ADDRGP4 uiInfo+78708
INDIRI4
CNSTI4 16
GEI4 $3937
line 4737
;4737:					uiInfo.numJoinGameTypes++;
ADDRLP4 20
ADDRGP4 uiInfo+78708
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4738
;4738:				} else {
ADDRGP4 $3936
JUMPV
LABELV $3937
line 4739
;4739:					Com_Printf("Too many net game types, last one replace!\n");
ADDRGP4 $3941
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4740
;4740:				}		
line 4741
;4741:			} else {
ADDRGP4 $3936
JUMPV
LABELV $3935
line 4742
;4742:				if (uiInfo.numGameTypes < MAX_GAMETYPES) {
ADDRGP4 uiInfo+78576
INDIRI4
CNSTI4 16
GEI4 $3942
line 4743
;4743:					uiInfo.numGameTypes++;
ADDRLP4 20
ADDRGP4 uiInfo+78576
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4744
;4744:				} else {
ADDRGP4 $3943
JUMPV
LABELV $3942
line 4745
;4745:					Com_Printf("Too many game types, last one replace!\n");
ADDRGP4 $3946
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4746
;4746:				}		
LABELV $3943
line 4747
;4747:			}
LABELV $3936
line 4749
;4748:     
;4749:			token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 4750
;4750:			if (token[0] != '}') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
EQI4 $3947
line 4751
;4751:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3900
JUMPV
LABELV $3947
line 4753
;4752:			}
;4753:		}
LABELV $3915
line 4754
;4754:	}
LABELV $3908
line 4712
ADDRGP4 $3907
JUMPV
line 4755
;4755:	return qfalse;
CNSTI4 0
RETI4
LABELV $3900
endproc GameType_Parse 28 8
proc MapList_Parse 52 8
line 4758
;4756:}
;4757:
;4758:static qboolean MapList_Parse(char **p) {
line 4761
;4759:	char *token;
;4760:
;4761:	token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 4763
;4762:
;4763:	if (token[0] != '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $3950
line 4764
;4764:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3949
JUMPV
LABELV $3950
line 4767
;4765:	}
;4766:
;4767:	uiInfo.mapCount = 0;
ADDRGP4 uiInfo+83224
CNSTI4 0
ASGNI4
ADDRGP4 $3954
JUMPV
LABELV $3953
line 4769
;4768:
;4769:	while ( 1 ) {
line 4770
;4770:		token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 4772
;4771:
;4772:		if (Q_stricmp(token, "}") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $3956
line 4773
;4773:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3949
JUMPV
LABELV $3956
line 4776
;4774:		}
;4775:
;4776:		if ( !token || token[0] == 0 ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3960
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3958
LABELV $3960
line 4777
;4777:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3949
JUMPV
LABELV $3958
line 4780
;4778:		}
;4779:
;4780:		if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $3961
line 4781
;4781:			if (!String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].mapName) || !String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].mapLoadName) 
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $3974
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $3974
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+16
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $3963
LABELV $3974
line 4782
;4782:				||!Int_Parse(p, &uiInfo.mapList[uiInfo.mapCount].teamMembers) ) {
line 4783
;4783:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3949
JUMPV
LABELV $3963
line 4786
;4784:			}
;4785:
;4786:			if (!String_Parse(p, &uiInfo.mapList[uiInfo.mapCount].opponentName)) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+12
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 String_Parse
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $3975
line 4787
;4787:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3949
JUMPV
LABELV $3975
line 4790
;4788:			}
;4789:
;4790:			uiInfo.mapList[uiInfo.mapCount].typeBits = 0;
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+20
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $3984
JUMPV
LABELV $3983
line 4792
;4791:
;4792:			while (1) {
line 4793
;4793:				token = COM_ParseExt(p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 36
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 4794
;4794:				if (token[0] >= '0' && token[0] <= '9') {
ADDRLP4 40
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 48
LTI4 $3985
ADDRLP4 40
INDIRI4
CNSTI4 57
GTI4 $3985
line 4795
;4795:					uiInfo.mapList[uiInfo.mapCount].typeBits |= (1 << (token[0] - 0x030));
ADDRLP4 44
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+20
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
LSHI4
BORI4
ASGNI4
line 4796
;4796:					if (!Int_Parse(p, &uiInfo.mapList[uiInfo.mapCount].timeToBeat[token[0] - 0x30])) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 2
LSHI4
CNSTI4 192
SUBI4
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+28
ADDP4
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 Int_Parse
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $3987
line 4797
;4797:						return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3949
JUMPV
line 4799
;4798:					}
;4799:				} else {
line 4800
;4800:					break;
LABELV $3987
line 4802
;4801:				} 
;4802:			}
LABELV $3984
line 4792
ADDRGP4 $3983
JUMPV
LABELV $3985
line 4809
;4803:
;4804:			//mapList[mapCount].imageName = String_Alloc(va("levelshots/%s", mapList[mapCount].mapLoadName));
;4805:			//if (uiInfo.mapCount == 0) {
;4806:			  // only load the first cinematic, selection loads the others
;4807:  			//  uiInfo.mapList[uiInfo.mapCount].cinematic = trap_CIN_PlayCinematic(va("%s.roq",uiInfo.mapList[uiInfo.mapCount].mapLoadName), qfalse, qfalse, qtrue, 0, 0, 0, 0);
;4808:			//}
;4809:  		uiInfo.mapList[uiInfo.mapCount].cinematic = -1;
CNSTI4 100
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
CNSTI4 -1
ASGNI4
line 4810
;4810:			uiInfo.mapList[uiInfo.mapCount].levelShot = trap_R_RegisterShaderNoMip(va("levelshots/%s_small", uiInfo.mapList[uiInfo.mapCount].mapLoadName));
ADDRGP4 $4002
ARGP4
ADDRLP4 36
CNSTI4 100
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 uiInfo+83224
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+92
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 4812
;4811:
;4812:			if (uiInfo.mapCount < MAX_MAPS) {
ADDRGP4 uiInfo+83224
INDIRI4
CNSTI4 128
GEI4 $4006
line 4813
;4813:				uiInfo.mapCount++;
ADDRLP4 48
ADDRGP4 uiInfo+83224
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4814
;4814:			} else {
ADDRGP4 $4007
JUMPV
LABELV $4006
line 4815
;4815:				Com_Printf("Too many maps, last one replaced!\n");
ADDRGP4 $4010
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 4816
;4816:			}
LABELV $4007
line 4817
;4817:		}
LABELV $3961
line 4818
;4818:	}
LABELV $3954
line 4769
ADDRGP4 $3953
JUMPV
line 4819
;4819:	return qfalse;
CNSTI4 0
RETI4
LABELV $3949
endproc MapList_Parse 52 8
proc UI_ParseGameInfo 44 8
line 4822
;4820:}
;4821:
;4822:static void UI_ParseGameInfo(const char *teamFile) {
line 4825
;4823:	char	*token;
;4824:	char *p;
;4825:	char *buff = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 4828
;4826:	//int mode = 0; TTimo: unused
;4827:
;4828:	buff = GetMenuBuffer(teamFile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 GetMenuBuffer
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 4829
;4829:	if (!buff) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $4012
line 4830
;4830:		return;
ADDRGP4 $4011
JUMPV
LABELV $4012
line 4833
;4831:	}
;4832:
;4833:	p = buff;
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $4015
JUMPV
LABELV $4014
line 4835
;4834:
;4835:	while ( 1 ) {
line 4836
;4836:		token = COM_ParseExt( &p, qtrue );
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 4837
;4837:		if( !token || token[0] == 0 || token[0] == '}') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4020
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $4020
ADDRLP4 24
INDIRI4
CNSTI4 125
NEI4 $4017
LABELV $4020
line 4838
;4838:			break;
ADDRGP4 $4016
JUMPV
LABELV $4017
line 4841
;4839:		}
;4840:
;4841:		if ( Q_stricmp( token, "}" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $4021
line 4842
;4842:			break;
ADDRGP4 $4016
JUMPV
LABELV $4021
line 4845
;4843:		}
;4844:
;4845:		if (Q_stricmp(token, "gametypes") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4025
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $4023
line 4847
;4846:
;4847:			if (GameType_Parse(&p, qfalse)) {
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 GameType_Parse
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $4016
line 4848
;4848:				continue;
ADDRGP4 $4015
JUMPV
line 4849
;4849:			} else {
line 4850
;4850:				break;
LABELV $4023
line 4854
;4851:			}
;4852:		}
;4853:
;4854:		if (Q_stricmp(token, "joingametypes") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4030
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $4028
line 4856
;4855:
;4856:			if (GameType_Parse(&p, qtrue)) {
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 GameType_Parse
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $4016
line 4857
;4857:				continue;
ADDRGP4 $4015
JUMPV
line 4858
;4858:			} else {
line 4859
;4859:				break;
LABELV $4028
line 4863
;4860:			}
;4861:		}
;4862:
;4863:		if (Q_stricmp(token, "maps") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $4035
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $4033
line 4865
;4864:			// start a new menu
;4865:			MapList_Parse(&p);
ADDRLP4 4
ARGP4
ADDRGP4 MapList_Parse
CALLI4
pop
line 4866
;4866:		}
LABELV $4033
line 4868
;4867:
;4868:	}
LABELV $4015
line 4835
ADDRGP4 $4014
JUMPV
LABELV $4016
line 4869
;4869:}
LABELV $4011
endproc UI_ParseGameInfo 44 8
proc UI_Pause 4 8
line 4871
;4870:
;4871:static void UI_Pause(qboolean b) {
line 4872
;4872:	if (b) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $4037
line 4874
;4873:		// pause the game and set the ui keycatcher
;4874:	  trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $2560
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4875
;4875:		trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4876
;4876:	} else {
ADDRGP4 $4038
JUMPV
LABELV $4037
line 4878
;4877:		// unpause the game and clear the ui keycatcher
;4878:		trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 4879
;4879:		trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 4880
;4880:		trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2560
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4881
;4881:	}
LABELV $4038
line 4882
;4882:}
LABELV $4036
endproc UI_Pause 4 8
proc UI_PlayCinematic 4 24
line 4891
;4883:
;4884:#ifndef MISSIONPACK // bk001206
;4885:static int UI_OwnerDraw_Width(int ownerDraw) {
;4886:  // bk001205 - LCC missing return value
;4887:  return 0;
;4888:}
;4889:#endif
;4890:
;4891:static int UI_PlayCinematic(const char *name, float x, float y, float w, float h) {
line 4892
;4892:  return trap_CIN_PlayCinematic(name, x, y, w, h, (CIN_loop | CIN_silent));
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 0
ADDRGP4 trap_CIN_PlayCinematic
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $4039
endproc UI_PlayCinematic 4 24
proc UI_StopCinematic 20 4
line 4895
;4893:}
;4894:
;4895:static void UI_StopCinematic(int handle) {
line 4896
;4896:	if (handle >= 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
LTI4 $4041
line 4897
;4897:	  trap_CIN_StopCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4898
;4898:	} else {
ADDRGP4 $4042
JUMPV
LABELV $4041
line 4899
;4899:		handle = abs(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 abs
CALLI4
ASGNI4
ADDRFP4 0
ADDRLP4 0
INDIRI4
ASGNI4
line 4900
;4900:		if (handle == UI_MAPCINEMATIC) {
ADDRFP4 0
INDIRI4
CNSTI4 244
NEI4 $4043
line 4901
;4901:			if (uiInfo.mapList[ui_currentMap.integer].cinematic >= 0) {
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4044
line 4902
;4902:			  trap_CIN_StopCinematic(uiInfo.mapList[ui_currentMap.integer].cinematic);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4903
;4903:			  uiInfo.mapList[ui_currentMap.integer].cinematic = -1;
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+24
ADDP4
CNSTI4 -1
ASGNI4
line 4904
;4904:			}
line 4905
;4905:		} else if (handle == UI_NETMAPCINEMATIC) {
ADDRGP4 $4044
JUMPV
LABELV $4043
ADDRFP4 0
INDIRI4
CNSTI4 246
NEI4 $4056
line 4906
;4906:			if (uiInfo.serverStatus.currentServerCinematic >= 0) {
ADDRGP4 uiInfo+99264+10432
INDIRI4
CNSTI4 0
LTI4 $4057
line 4907
;4907:			  trap_CIN_StopCinematic(uiInfo.serverStatus.currentServerCinematic);
ADDRGP4 uiInfo+99264+10432
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4908
;4908:				uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+99264+10432
CNSTI4 -1
ASGNI4
line 4909
;4909:			}
line 4910
;4910:		} else if (handle == UI_CLANCINEMATIC) {
ADDRGP4 $4057
JUMPV
LABELV $4056
ADDRFP4 0
INDIRI4
CNSTI4 251
NEI4 $4066
line 4911
;4911:		  int i = UI_TeamIndexFromName(UI_Cvar_VariableString("ui_teamName"));
ADDRGP4 $698
ARGP4
ADDRLP4 8
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 UI_TeamIndexFromName
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 4912
;4912:		  if (i >= 0 && i < uiInfo.teamCount) {
ADDRLP4 16
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $4068
ADDRLP4 16
INDIRI4
ADDRGP4 uiInfo+75756
INDIRI4
GEI4 $4068
line 4913
;4913:				if (uiInfo.teamList[i].cinematic >= 0) {
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
CNSTI4 0
LTI4 $4071
line 4914
;4914:				  trap_CIN_StopCinematic(uiInfo.teamList[i].cinematic);
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_CIN_StopCinematic
CALLI4
pop
line 4915
;4915:					uiInfo.teamList[i].cinematic = -1;
CNSTI4 44
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 uiInfo+75760+40
ADDP4
CNSTI4 -1
ASGNI4
line 4916
;4916:				}
LABELV $4071
line 4917
;4917:			}
LABELV $4068
line 4918
;4918:		}
LABELV $4066
LABELV $4057
LABELV $4044
line 4919
;4919:	}
LABELV $4042
line 4920
;4920:}
LABELV $4040
endproc UI_StopCinematic 20 4
proc UI_DrawCinematic 0 20
line 4922
;4921:
;4922:static void UI_DrawCinematic(int handle, float x, float y, float w, float h) {
line 4923
;4923:	trap_CIN_SetExtents(handle, x, y, w, h);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 12
INDIRF4
CVFI4 4
ARGI4
ADDRFP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 trap_CIN_SetExtents
CALLV
pop
line 4924
;4924:  trap_CIN_DrawCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_DrawCinematic
CALLV
pop
line 4925
;4925:}
LABELV $4079
endproc UI_DrawCinematic 0 20
proc UI_RunCinematicFrame 0 4
line 4927
;4926:
;4927:static void UI_RunCinematicFrame(int handle) {
line 4928
;4928:  trap_CIN_RunCinematic(handle);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_CIN_RunCinematic
CALLI4
pop
line 4929
;4929:}
LABELV $4080
endproc UI_RunCinematicFrame 0 4
proc UI_BuildQ3Model_List 4520 20
line 4939
;4930:
;4931:
;4932:
;4933:/*
;4934:=================
;4935:PlayerModel_BuildList
;4936:=================
;4937:*/
;4938:static void UI_BuildQ3Model_List( void )
;4939:{
line 4953
;4940:	int		numdirs;
;4941:	int		numfiles;
;4942:	char	dirlist[2048];
;4943:	char	filelist[2048];
;4944:	char	skinname[64];
;4945:	char	scratch[256];
;4946:	char*	dirptr;
;4947:	char*	fileptr;
;4948:	int		i;
;4949:	int		j, k, dirty;
;4950:	int		dirlen;
;4951:	int		filelen;
;4952:
;4953:	uiInfo.q3HeadCount = 0;
ADDRGP4 uiInfo+119488
CNSTI4 0
ASGNI4
line 4956
;4954:
;4955:	// iterate directory of all player models
;4956:	numdirs = trap_FS_GetFileList("models/players", "/", dirlist, 2048 );
ADDRGP4 $4083
ARGP4
ADDRGP4 $4084
ARGP4
ADDRLP4 2408
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4456
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 2404
ADDRLP4 4456
INDIRI4
ASGNI4
line 4957
;4957:	dirptr  = dirlist;
ADDRLP4 340
ADDRLP4 2408
ASGNP4
line 4958
;4958:	for (i=0; i<numdirs && uiInfo.q3HeadCount < MAX_PLAYERMODELS; i++,dirptr+=dirlen+1)
ADDRLP4 352
CNSTI4 0
ASGNI4
ADDRGP4 $4088
JUMPV
LABELV $4085
line 4959
;4959:	{
line 4960
;4960:		dirlen = strlen(dirptr);
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 4460
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 348
ADDRLP4 4460
INDIRI4
ASGNI4
line 4962
;4961:		
;4962:		if (dirlen && dirptr[dirlen-1]=='/') dirptr[dirlen-1]='\0';
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $4090
ADDRLP4 348
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 340
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $4090
ADDRLP4 348
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 340
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $4090
line 4964
;4963:
;4964:		if (!strcmp(dirptr,".") || !strcmp(dirptr,".."))
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 $4094
ARGP4
ADDRLP4 4468
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4468
INDIRI4
CNSTI4 0
EQI4 $4096
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 $4095
ARGP4
ADDRLP4 4472
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4472
INDIRI4
CNSTI4 0
NEI4 $4092
LABELV $4096
line 4965
;4965:			continue;
ADDRGP4 $4086
JUMPV
LABELV $4092
line 4968
;4966:			
;4967:		// iterate all skin files in directory
;4968:		numfiles = trap_FS_GetFileList( va("models/players/%s",dirptr), "tga", filelist, 2048 );
ADDRGP4 $4097
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 4476
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4476
INDIRP4
ARGP4
ADDRGP4 $4098
ARGP4
ADDRLP4 356
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4480
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 344
ADDRLP4 4480
INDIRI4
ASGNI4
line 4969
;4969:		fileptr  = filelist;
ADDRLP4 328
ADDRLP4 356
ASGNP4
line 4970
;4970:		for (j=0; j<numfiles && uiInfo.q3HeadCount < MAX_PLAYERMODELS;j++,fileptr+=filelen+1)
ADDRLP4 332
CNSTI4 0
ASGNI4
ADDRGP4 $4102
JUMPV
LABELV $4099
line 4971
;4971:		{
line 4972
;4972:			filelen = strlen(fileptr);
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 4484
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 336
ADDRLP4 4484
INDIRI4
ASGNI4
line 4974
;4973:
;4974:			COM_StripExtension(fileptr,skinname);
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 260
ARGP4
ADDRGP4 COM_StripExtension
CALLV
pop
line 4977
;4975:
;4976:			// look for icon_????
;4977:			if (Q_stricmpn(skinname, "icon_", 5) == 0 && !(Q_stricmp(skinname,"icon_blue") == 0 || Q_stricmp(skinname,"icon_red") == 0))
ADDRLP4 260
ARGP4
ADDRGP4 $4106
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4488
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 4488
INDIRI4
CNSTI4 0
NEI4 $4104
ADDRLP4 260
ARGP4
ADDRGP4 $4107
ARGP4
ADDRLP4 4492
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4492
INDIRI4
CNSTI4 0
EQI4 $4104
ADDRLP4 260
ARGP4
ADDRGP4 $4108
ARGP4
ADDRLP4 4496
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4496
INDIRI4
CNSTI4 0
EQI4 $4104
line 4978
;4978:			{
line 4979
;4979:				if (Q_stricmp(skinname, "icon_default") == 0) {
ADDRLP4 260
ARGP4
ADDRGP4 $4111
ARGP4
ADDRLP4 4500
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4500
INDIRI4
CNSTI4 0
NEI4 $4109
line 4980
;4980:					Com_sprintf( scratch, sizeof(scratch), dirptr);
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4981
;4981:				} else {
ADDRGP4 $4110
JUMPV
LABELV $4109
line 4982
;4982:					Com_sprintf( scratch, sizeof(scratch), "%s/%s",dirptr, skinname + 5);
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $4112
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 260+5
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4983
;4983:				}
LABELV $4110
line 4984
;4984:				dirty = 0;
ADDRLP4 324
CNSTI4 0
ASGNI4
line 4985
;4985:				for(k=0;k<uiInfo.q3HeadCount;k++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $4117
JUMPV
LABELV $4114
line 4986
;4986:					if (!Q_stricmp(scratch, uiInfo.q3HeadNames[uiInfo.q3HeadCount])) {
ADDRLP4 4
ARGP4
ADDRGP4 uiInfo+119488
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+119492
ADDP4
ARGP4
ADDRLP4 4504
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4504
INDIRI4
CNSTI4 0
NEI4 $4119
line 4987
;4987:						dirty = 1;
ADDRLP4 324
CNSTI4 1
ASGNI4
line 4988
;4988:						break;
ADDRGP4 $4116
JUMPV
LABELV $4119
line 4990
;4989:					}
;4990:				}
LABELV $4115
line 4985
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $4117
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+119488
INDIRI4
LTI4 $4114
LABELV $4116
line 4991
;4991:				if (!dirty) {
ADDRLP4 324
INDIRI4
CNSTI4 0
NEI4 $4123
line 4992
;4992:					Com_sprintf( uiInfo.q3HeadNames[uiInfo.q3HeadCount], sizeof(uiInfo.q3HeadNames[uiInfo.q3HeadCount]), scratch);
ADDRGP4 uiInfo+119488
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+119492
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4993
;4993:					uiInfo.q3HeadIcons[uiInfo.q3HeadCount++] = trap_R_RegisterShaderNoMip(va("models/players/%s/%s",dirptr,skinname));
ADDRLP4 4508
ADDRGP4 uiInfo+119488
ASGNP4
ADDRLP4 4504
ADDRLP4 4508
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4508
INDIRP4
ADDRLP4 4504
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $4131
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 4512
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4512
INDIRP4
ARGP4
ADDRLP4 4516
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 4504
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uiInfo+135876
ADDP4
ADDRLP4 4516
INDIRI4
ASGNI4
line 4994
;4994:				}
LABELV $4123
line 4995
;4995:			}
LABELV $4104
line 4997
;4996:
;4997:		}
LABELV $4100
line 4970
ADDRLP4 4484
CNSTI4 1
ASGNI4
ADDRLP4 332
ADDRLP4 332
INDIRI4
ADDRLP4 4484
INDIRI4
ADDI4
ASGNI4
ADDRLP4 328
ADDRLP4 336
INDIRI4
ADDRLP4 4484
INDIRI4
ADDI4
ADDRLP4 328
INDIRP4
ADDP4
ASGNP4
LABELV $4102
ADDRLP4 332
INDIRI4
ADDRLP4 344
INDIRI4
GEI4 $4132
ADDRGP4 uiInfo+119488
INDIRI4
CNSTI4 256
LTI4 $4099
LABELV $4132
line 4998
;4998:	}	
LABELV $4086
line 4958
ADDRLP4 4460
CNSTI4 1
ASGNI4
ADDRLP4 352
ADDRLP4 352
INDIRI4
ADDRLP4 4460
INDIRI4
ADDI4
ASGNI4
ADDRLP4 340
ADDRLP4 348
INDIRI4
ADDRLP4 4460
INDIRI4
ADDI4
ADDRLP4 340
INDIRP4
ADDP4
ASGNP4
LABELV $4088
ADDRLP4 352
INDIRI4
ADDRLP4 2404
INDIRI4
GEI4 $4133
ADDRGP4 uiInfo+119488
INDIRI4
CNSTI4 256
LTI4 $4085
LABELV $4133
line 5000
;4999:
;5000:}
LABELV $4081
endproc UI_BuildQ3Model_List 4520 20
export _UI_Init
proc _UI_Init 52 16
line 5009
;5001:
;5002:
;5003:
;5004:/*
;5005:=================
;5006:UI_Init
;5007:=================
;5008:*/
;5009:void _UI_Init( qboolean inGameLoad ) {
line 5015
;5010:	const char *menuSet;
;5011:	int start;
;5012:
;5013:	//uiInfo.inGameLoad = inGameLoad;
;5014:
;5015:	UI_RegisterCvars();
ADDRGP4 UI_RegisterCvars
CALLV
pop
line 5016
;5016:	UI_InitMemory();
ADDRGP4 UI_InitMemory
CALLV
pop
line 5019
;5017:
;5018:	// cache redundant calulations
;5019:	trap_GetGlconfig( &uiInfo.uiDC.glconfig );
ADDRGP4 uiInfo+62068
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 5022
;5020:
;5021:	// for 640x480 virtualized screen
;5022:	uiInfo.uiDC.yscale = uiInfo.uiDC.glconfig.vidHeight * (1.0/480.0);
ADDRGP4 uiInfo+196
CNSTF4 990414985
ADDRGP4 uiInfo+62068+11308
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 5023
;5023:	uiInfo.uiDC.xscale = uiInfo.uiDC.glconfig.vidWidth * (1.0/640.0);
ADDRGP4 uiInfo+200
CNSTF4 986500301
ADDRGP4 uiInfo+62068+11304
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 5024
;5024:	if ( uiInfo.uiDC.glconfig.vidWidth * 480 > uiInfo.uiDC.glconfig.vidHeight * 640 ) {
CNSTI4 480
ADDRGP4 uiInfo+62068+11304
INDIRI4
MULI4
CNSTI4 640
ADDRGP4 uiInfo+62068+11308
INDIRI4
MULI4
LEI4 $4142
line 5026
;5025:		// wide screen
;5026:		uiInfo.uiDC.bias = 0.5 * ( uiInfo.uiDC.glconfig.vidWidth - ( uiInfo.uiDC.glconfig.vidHeight * (640.0/480.0) ) );
ADDRGP4 uiInfo+204
CNSTF4 1056964608
ADDRGP4 uiInfo+62068+11304
INDIRI4
CVIF4 4
CNSTF4 1068149419
ADDRGP4 uiInfo+62068+11308
INDIRI4
CVIF4 4
MULF4
SUBF4
MULF4
ASGNF4
line 5027
;5027:	}
ADDRGP4 $4143
JUMPV
LABELV $4142
line 5028
;5028:	else {
line 5030
;5029:		// no wide screen
;5030:		uiInfo.uiDC.bias = 0;
ADDRGP4 uiInfo+204
CNSTF4 0
ASGNF4
line 5031
;5031:	}
LABELV $4143
line 5035
;5032:
;5033:
;5034:  //UI_Load();
;5035:	uiInfo.uiDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
ADDRGP4 uiInfo
ADDRGP4 trap_R_RegisterShaderNoMip
ASGNP4
line 5036
;5036:	uiInfo.uiDC.setColor = &UI_SetColor;
ADDRGP4 uiInfo+4
ADDRGP4 UI_SetColor
ASGNP4
line 5037
;5037:	uiInfo.uiDC.drawHandlePic = &UI_DrawHandlePic;
ADDRGP4 uiInfo+8
ADDRGP4 UI_DrawHandlePic
ASGNP4
line 5038
;5038:	uiInfo.uiDC.drawStretchPic = &trap_R_DrawStretchPic;
ADDRGP4 uiInfo+12
ADDRGP4 trap_R_DrawStretchPic
ASGNP4
line 5039
;5039:	uiInfo.uiDC.drawText = &Text_Paint;
ADDRGP4 uiInfo+16
ADDRGP4 Text_Paint
ASGNP4
line 5040
;5040:	uiInfo.uiDC.textWidth = &Text_Width;
ADDRGP4 uiInfo+20
ADDRGP4 Text_Width
ASGNP4
line 5041
;5041:	uiInfo.uiDC.textHeight = &Text_Height;
ADDRGP4 uiInfo+24
ADDRGP4 Text_Height
ASGNP4
line 5042
;5042:	uiInfo.uiDC.registerModel = &trap_R_RegisterModel;
ADDRGP4 uiInfo+28
ADDRGP4 trap_R_RegisterModel
ASGNP4
line 5043
;5043:	uiInfo.uiDC.modelBounds = &trap_R_ModelBounds;
ADDRGP4 uiInfo+32
ADDRGP4 trap_R_ModelBounds
ASGNP4
line 5044
;5044:	uiInfo.uiDC.fillRect = &UI_FillRect;
ADDRGP4 uiInfo+36
ADDRGP4 UI_FillRect
ASGNP4
line 5045
;5045:	uiInfo.uiDC.drawRect = &_UI_DrawRect;
ADDRGP4 uiInfo+40
ADDRGP4 _UI_DrawRect
ASGNP4
line 5046
;5046:	uiInfo.uiDC.drawSides = &_UI_DrawSides;
ADDRGP4 uiInfo+44
ADDRGP4 _UI_DrawSides
ASGNP4
line 5047
;5047:	uiInfo.uiDC.drawTopBottom = &_UI_DrawTopBottom;
ADDRGP4 uiInfo+48
ADDRGP4 _UI_DrawTopBottom
ASGNP4
line 5048
;5048:	uiInfo.uiDC.clearScene = &trap_R_ClearScene;
ADDRGP4 uiInfo+52
ADDRGP4 trap_R_ClearScene
ASGNP4
line 5049
;5049:	uiInfo.uiDC.drawSides = &_UI_DrawSides;
ADDRGP4 uiInfo+44
ADDRGP4 _UI_DrawSides
ASGNP4
line 5050
;5050:	uiInfo.uiDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
ADDRGP4 uiInfo+56
ADDRGP4 trap_R_AddRefEntityToScene
ASGNP4
line 5051
;5051:	uiInfo.uiDC.renderScene = &trap_R_RenderScene;
ADDRGP4 uiInfo+60
ADDRGP4 trap_R_RenderScene
ASGNP4
line 5052
;5052:	uiInfo.uiDC.registerFont = &trap_R_RegisterFont;
ADDRGP4 uiInfo+64
ADDRGP4 trap_R_RegisterFont
ASGNP4
line 5053
;5053:	uiInfo.uiDC.ownerDrawItem = &UI_OwnerDraw;
ADDRGP4 uiInfo+68
ADDRGP4 UI_OwnerDraw
ASGNP4
line 5054
;5054:	uiInfo.uiDC.getValue = &UI_GetValue;
ADDRGP4 uiInfo+72
ADDRGP4 UI_GetValue
ASGNP4
line 5055
;5055:	uiInfo.uiDC.ownerDrawVisible = &UI_OwnerDrawVisible;
ADDRGP4 uiInfo+76
ADDRGP4 UI_OwnerDrawVisible
ASGNP4
line 5056
;5056:	uiInfo.uiDC.runScript = &UI_RunMenuScript;
ADDRGP4 uiInfo+80
ADDRGP4 UI_RunMenuScript
ASGNP4
line 5057
;5057:	uiInfo.uiDC.getTeamColor = &UI_GetTeamColor;
ADDRGP4 uiInfo+84
ADDRGP4 UI_GetTeamColor
ASGNP4
line 5058
;5058:	uiInfo.uiDC.setCVar = trap_Cvar_Set;
ADDRGP4 uiInfo+96
ADDRGP4 trap_Cvar_Set
ASGNP4
line 5059
;5059:	uiInfo.uiDC.getCVarString = trap_Cvar_VariableStringBuffer;
ADDRGP4 uiInfo+88
ADDRGP4 trap_Cvar_VariableStringBuffer
ASGNP4
line 5060
;5060:	uiInfo.uiDC.getCVarValue = trap_Cvar_VariableValue;
ADDRGP4 uiInfo+92
ADDRGP4 trap_Cvar_VariableValue
ASGNP4
line 5061
;5061:	uiInfo.uiDC.drawTextWithCursor = &Text_PaintWithCursor;
ADDRGP4 uiInfo+100
ADDRGP4 Text_PaintWithCursor
ASGNP4
line 5062
;5062:	uiInfo.uiDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
ADDRGP4 uiInfo+104
ADDRGP4 trap_Key_SetOverstrikeMode
ASGNP4
line 5063
;5063:	uiInfo.uiDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
ADDRGP4 uiInfo+108
ADDRGP4 trap_Key_GetOverstrikeMode
ASGNP4
line 5064
;5064:	uiInfo.uiDC.startLocalSound = &trap_S_StartLocalSound;
ADDRGP4 uiInfo+112
ADDRGP4 trap_S_StartLocalSound
ASGNP4
line 5065
;5065:	uiInfo.uiDC.ownerDrawHandleKey = &UI_OwnerDrawHandleKey;
ADDRGP4 uiInfo+116
ADDRGP4 UI_OwnerDrawHandleKey
ASGNP4
line 5066
;5066:	uiInfo.uiDC.feederCount = &UI_FeederCount;
ADDRGP4 uiInfo+120
ADDRGP4 UI_FeederCount
ASGNP4
line 5067
;5067:	uiInfo.uiDC.feederItemImage = &UI_FeederItemImage;
ADDRGP4 uiInfo+128
ADDRGP4 UI_FeederItemImage
ASGNP4
line 5068
;5068:	uiInfo.uiDC.feederItemText = &UI_FeederItemText;
ADDRGP4 uiInfo+124
ADDRGP4 UI_FeederItemText
ASGNP4
line 5069
;5069:	uiInfo.uiDC.feederSelection = &UI_FeederSelection;
ADDRGP4 uiInfo+132
ADDRGP4 UI_FeederSelection
ASGNP4
line 5070
;5070:	uiInfo.uiDC.setBinding = &trap_Key_SetBinding;
ADDRGP4 uiInfo+144
ADDRGP4 trap_Key_SetBinding
ASGNP4
line 5071
;5071:	uiInfo.uiDC.getBindingBuf = &trap_Key_GetBindingBuf;
ADDRGP4 uiInfo+140
ADDRGP4 trap_Key_GetBindingBuf
ASGNP4
line 5072
;5072:	uiInfo.uiDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
ADDRGP4 uiInfo+136
ADDRGP4 trap_Key_KeynumToStringBuf
ASGNP4
line 5073
;5073:	uiInfo.uiDC.executeText = &trap_Cmd_ExecuteText;
ADDRGP4 uiInfo+148
ADDRGP4 trap_Cmd_ExecuteText
ASGNP4
line 5074
;5074:	uiInfo.uiDC.Error = &Com_Error; 
ADDRGP4 uiInfo+152
ADDRGP4 Com_Error
ASGNP4
line 5075
;5075:	uiInfo.uiDC.Print = &Com_Printf; 
ADDRGP4 uiInfo+156
ADDRGP4 Com_Printf
ASGNP4
line 5076
;5076:	uiInfo.uiDC.Pause = &UI_Pause;
ADDRGP4 uiInfo+160
ADDRGP4 UI_Pause
ASGNP4
line 5077
;5077:	uiInfo.uiDC.ownerDrawWidth = &UI_OwnerDrawWidth;
ADDRGP4 uiInfo+164
ADDRGP4 UI_OwnerDrawWidth
ASGNP4
line 5078
;5078:	uiInfo.uiDC.registerSound = &trap_S_RegisterSound;
ADDRGP4 uiInfo+168
ADDRGP4 trap_S_RegisterSound
ASGNP4
line 5079
;5079:	uiInfo.uiDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
ADDRGP4 uiInfo+172
ADDRGP4 trap_S_StartBackgroundTrack
ASGNP4
line 5080
;5080:	uiInfo.uiDC.stopBackgroundTrack = &trap_S_StopBackgroundTrack;
ADDRGP4 uiInfo+176
ADDRGP4 trap_S_StopBackgroundTrack
ASGNP4
line 5081
;5081:	uiInfo.uiDC.playCinematic = &UI_PlayCinematic;
ADDRGP4 uiInfo+180
ADDRGP4 UI_PlayCinematic
ASGNP4
line 5082
;5082:	uiInfo.uiDC.stopCinematic = &UI_StopCinematic;
ADDRGP4 uiInfo+184
ADDRGP4 UI_StopCinematic
ASGNP4
line 5083
;5083:	uiInfo.uiDC.drawCinematic = &UI_DrawCinematic;
ADDRGP4 uiInfo+188
ADDRGP4 UI_DrawCinematic
ASGNP4
line 5084
;5084:	uiInfo.uiDC.runCinematicFrame = &UI_RunCinematicFrame;
ADDRGP4 uiInfo+192
ADDRGP4 UI_RunCinematicFrame
ASGNP4
line 5086
;5085:
;5086:	Init_Display(&uiInfo.uiDC);
ADDRGP4 uiInfo
ARGP4
ADDRGP4 Init_Display
CALLV
pop
line 5088
;5087:
;5088:	String_Init();
ADDRGP4 String_Init
CALLV
pop
line 5090
;5089:  
;5090:	uiInfo.uiDC.cursor	= trap_R_RegisterShaderNoMip( "menu/art/3_cursor2" );
ADDRGP4 $4204
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+73408
ADDRLP4 8
INDIRI4
ASGNI4
line 5091
;5091:	uiInfo.uiDC.whiteShader = trap_R_RegisterShaderNoMip( "white" );
ADDRGP4 $4206
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 uiInfo+73400
ADDRLP4 12
INDIRI4
ASGNI4
line 5093
;5092:
;5093:	AssetCache();
ADDRGP4 AssetCache
CALLV
pop
line 5095
;5094:
;5095:	start = trap_Milliseconds();
ADDRLP4 16
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 5097
;5096:
;5097:  uiInfo.teamCount = 0;
ADDRGP4 uiInfo+75756
CNSTI4 0
ASGNI4
line 5098
;5098:  uiInfo.characterCount = 0;
ADDRGP4 uiInfo+73440
CNSTI4 0
ASGNI4
line 5099
;5099:  uiInfo.aliasCount = 0;
ADDRGP4 uiInfo+74984
CNSTI4 0
ASGNI4
line 5105
;5100:
;5101:#ifdef PRE_RELEASE_TADEMO
;5102:	UI_ParseTeamInfo("demoteaminfo.txt");
;5103:	UI_ParseGameInfo("demogameinfo.txt");
;5104:#else
;5105:	UI_ParseTeamInfo("teaminfo.txt");
ADDRGP4 $4210
ARGP4
ADDRGP4 UI_ParseTeamInfo
CALLV
pop
line 5106
;5106:	UI_LoadTeams();
ADDRGP4 UI_LoadTeams
CALLV
pop
line 5107
;5107:	UI_ParseGameInfo("gameinfo.txt");
ADDRGP4 $674
ARGP4
ADDRGP4 UI_ParseGameInfo
CALLV
pop
line 5110
;5108:#endif
;5109:
;5110:	menuSet = UI_Cvar_VariableString("ui_menuFiles");
ADDRGP4 $668
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 5111
;5111:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4213
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4211
LABELV $4213
line 5112
;5112:		menuSet = "ui/menus.txt";
ADDRLP4 0
ADDRGP4 $640
ASGNP4
line 5113
;5113:	}
LABELV $4211
line 5121
;5114:
;5115:#if 0
;5116:	if (uiInfo.inGameLoad) {
;5117:		UI_LoadMenus("ui/ingame.txt", qtrue);
;5118:	} else { // bk010222: left this: UI_LoadMenus(menuSet, qtrue);
;5119:	}
;5120:#else 
;5121:	UI_LoadMenus(menuSet, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 5122
;5122:	UI_LoadMenus("ui/ingame.txt", qfalse);
ADDRGP4 $4214
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 5125
;5123:#endif
;5124:	
;5125:	Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5127
;5126:
;5127:	trap_LAN_LoadCachedServers();
ADDRGP4 trap_LAN_LoadCachedServers
CALLV
pop
line 5128
;5128:	UI_LoadBestScores(uiInfo.mapList[ui_currentMap.integer].mapLoadName, uiInfo.gameTypes[ui_gameType.integer].gtEnum);
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+83228+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 ui_gameType+12
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 uiInfo+78580+4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_LoadBestScores
CALLV
pop
line 5130
;5129:
;5130:	UI_BuildQ3Model_List();
ADDRGP4 UI_BuildQ3Model_List
CALLV
pop
line 5131
;5131:	UI_LoadBots();
ADDRGP4 UI_LoadBots
CALLV
pop
line 5134
;5132:
;5133:	// sets defaults for ui temp cvars
;5134:	uiInfo.effectsColor = gamecodetoui[(int)trap_Cvar_VariableValue("color1")-1];
ADDRGP4 $1756
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiInfo+136904
ADDRLP4 28
INDIRF4
CVFI4 4
CNSTI4 2
LSHI4
ADDRGP4 gamecodetoui-4
ADDP4
INDIRI4
ASGNI4
line 5135
;5135:	uiInfo.currentCrosshair = (int)trap_Cvar_VariableValue("cg_drawCrosshair");
ADDRGP4 $2022
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 uiInfo+119476
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 5136
;5136:	trap_Cvar_Set("ui_mousePitch", (trap_Cvar_VariableValue("m_pitch") >= 0) ? "0" : "1");
ADDRGP4 $2315
ARGP4
ADDRLP4 40
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 0
LTF4 $4225
ADDRLP4 36
ADDRGP4 $392
ASGNP4
ADDRGP4 $4226
JUMPV
LABELV $4225
ADDRLP4 36
ADDRGP4 $395
ASGNP4
LABELV $4226
ADDRGP4 $2312
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5138
;5137:
;5138:	uiInfo.serverStatus.currentServerCinematic = -1;
ADDRGP4 uiInfo+99264+10432
CNSTI4 -1
ASGNI4
line 5139
;5139:	uiInfo.previewMovie = -1;
ADDRGP4 uiInfo+99260
CNSTI4 -1
ASGNI4
line 5141
;5140:
;5141:	if (trap_Cvar_VariableValue("ui_TeamArenaFirstRun") == 0) {
ADDRGP4 $4232
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 0
NEF4 $4230
line 5142
;5142:		trap_Cvar_Set("s_volume", "0.8");
ADDRGP4 $4233
ARGP4
ADDRGP4 $4234
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5143
;5143:		trap_Cvar_Set("s_musicvolume", "0.5");
ADDRGP4 $4235
ARGP4
ADDRGP4 $4236
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5144
;5144:		trap_Cvar_Set("ui_TeamArenaFirstRun", "1");
ADDRGP4 $4232
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5145
;5145:	}
LABELV $4230
line 5147
;5146:
;5147:	trap_Cvar_Register(NULL, "debug_protocol", "", 0 );
CNSTP4 0
ARGP4
ADDRGP4 $4237
ARGP4
ADDRGP4 $109
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5149
;5148:
;5149:	trap_Cvar_Set("ui_actualNetGameType", va("%d", ui_netGameType.integer));
ADDRGP4 $713
ARGP4
ADDRGP4 ui_netGameType+12
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $728
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5150
;5150:}
LABELV $4134
endproc _UI_Init 52 16
export _UI_KeyEvent
proc _UI_KeyEvent 16 12
line 5158
;5151:
;5152:
;5153:/*
;5154:=================
;5155:UI_KeyEvent
;5156:=================
;5157:*/
;5158:void _UI_KeyEvent( int key, qboolean down ) {
line 5160
;5159:
;5160:  if (Menu_Count() > 0) {
ADDRLP4 0
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $4240
line 5161
;5161:    menuDef_t *menu = Menu_GetFocused();
ADDRLP4 8
ADDRGP4 Menu_GetFocused
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 5162
;5162:		if (menu) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4242
line 5163
;5163:			if (key == K_ESCAPE && down && !Menus_AnyFullScreenVisible()) {
ADDRFP4 0
INDIRI4
CNSTI4 27
NEI4 $4244
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $4244
ADDRLP4 12
ADDRGP4 Menus_AnyFullScreenVisible
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $4244
line 5164
;5164:				Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5165
;5165:			} else {
ADDRGP4 $4243
JUMPV
LABELV $4244
line 5166
;5166:				Menu_HandleKey(menu, key, down );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Menu_HandleKey
CALLV
pop
line 5167
;5167:			}
line 5168
;5168:		} else {
ADDRGP4 $4243
JUMPV
LABELV $4242
line 5169
;5169:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 12
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5170
;5170:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 5171
;5171:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2560
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5172
;5172:		}
LABELV $4243
line 5173
;5173:  }
LABELV $4240
line 5178
;5174:
;5175:  //if ((s > 0) && (s != menu_null_sound)) {
;5176:	//  trap_S_StartLocalSound( s, CHAN_LOCAL_SOUND );
;5177:  //}
;5178:}
LABELV $4239
endproc _UI_KeyEvent 16 12
export _UI_MouseEvent
proc _UI_MouseEvent 12 12
line 5186
;5179:
;5180:/*
;5181:=================
;5182:UI_MouseEvent
;5183:=================
;5184:*/
;5185:void _UI_MouseEvent( int dx, int dy )
;5186:{
line 5188
;5187:	// update mouse screen position
;5188:	uiInfo.uiDC.cursorx += dx;
ADDRLP4 0
ADDRGP4 uiInfo+216
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 5189
;5189:	if (uiInfo.uiDC.cursorx < 0)
ADDRGP4 uiInfo+216
INDIRI4
CNSTI4 0
GEI4 $4248
line 5190
;5190:		uiInfo.uiDC.cursorx = 0;
ADDRGP4 uiInfo+216
CNSTI4 0
ASGNI4
ADDRGP4 $4249
JUMPV
LABELV $4248
line 5191
;5191:	else if (uiInfo.uiDC.cursorx > SCREEN_WIDTH)
ADDRGP4 uiInfo+216
INDIRI4
CNSTI4 640
LEI4 $4252
line 5192
;5192:		uiInfo.uiDC.cursorx = SCREEN_WIDTH;
ADDRGP4 uiInfo+216
CNSTI4 640
ASGNI4
LABELV $4252
LABELV $4249
line 5194
;5193:
;5194:	uiInfo.uiDC.cursory += dy;
ADDRLP4 4
ADDRGP4 uiInfo+220
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 5195
;5195:	if (uiInfo.uiDC.cursory < 0)
ADDRGP4 uiInfo+220
INDIRI4
CNSTI4 0
GEI4 $4257
line 5196
;5196:		uiInfo.uiDC.cursory = 0;
ADDRGP4 uiInfo+220
CNSTI4 0
ASGNI4
ADDRGP4 $4258
JUMPV
LABELV $4257
line 5197
;5197:	else if (uiInfo.uiDC.cursory > SCREEN_HEIGHT)
ADDRGP4 uiInfo+220
INDIRI4
CNSTI4 480
LEI4 $4261
line 5198
;5198:		uiInfo.uiDC.cursory = SCREEN_HEIGHT;
ADDRGP4 uiInfo+220
CNSTI4 480
ASGNI4
LABELV $4261
LABELV $4258
line 5200
;5199:
;5200:  if (Menu_Count() > 0) {
ADDRLP4 8
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $4265
line 5203
;5201:    //menuDef_t *menu = Menu_GetFocused();
;5202:    //Menu_HandleMouseMove(menu, uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory);
;5203:		Display_MouseMove(NULL, uiInfo.uiDC.cursorx, uiInfo.uiDC.cursory);
CNSTP4 0
ARGP4
ADDRGP4 uiInfo+216
INDIRI4
ARGI4
ADDRGP4 uiInfo+220
INDIRI4
ARGI4
ADDRGP4 Display_MouseMove
CALLI4
pop
line 5204
;5204:  }
LABELV $4265
line 5206
;5205:
;5206:}
LABELV $4246
endproc _UI_MouseEvent 12 12
export UI_LoadNonIngame
proc UI_LoadNonIngame 12 8
line 5208
;5207:
;5208:void UI_LoadNonIngame() {
line 5209
;5209:	const char *menuSet = UI_Cvar_VariableString("ui_menuFiles");
ADDRGP4 $668
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 5210
;5210:	if (menuSet == NULL || menuSet[0] == '\0') {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4272
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4270
LABELV $4272
line 5211
;5211:		menuSet = "ui/menus.txt";
ADDRLP4 0
ADDRGP4 $640
ASGNP4
line 5212
;5212:	}
LABELV $4270
line 5213
;5213:	UI_LoadMenus(menuSet, qfalse);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_LoadMenus
CALLV
pop
line 5214
;5214:	uiInfo.inGameLoad = qfalse;
ADDRGP4 uiInfo+136908
CNSTI4 0
ASGNI4
line 5215
;5215:}
LABELV $4269
endproc UI_LoadNonIngame 12 8
export _UI_SetActiveMenu
proc _UI_SetActiveMenu 292 12
line 5217
;5216:
;5217:void _UI_SetActiveMenu( uiMenuCommand_t menu ) {
line 5222
;5218:	char buf[256];
;5219:
;5220:	// this should be the ONLY way the menu system is brought up
;5221:	// enusure minumum menu data is cached
;5222:  if (Menu_Count() > 0) {
ADDRLP4 256
ADDRGP4 Menu_Count
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
LEI4 $4275
line 5224
;5223:		vec3_t v;
;5224:		v[0] = v[1] = v[2] = 0;
ADDRLP4 272
CNSTF4 0
ASGNF4
ADDRLP4 260+8
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 272
INDIRF4
ASGNF4
ADDRLP4 260
ADDRLP4 272
INDIRF4
ASGNF4
line 5225
;5225:	  switch ( menu ) {
ADDRLP4 276
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
LTI4 $4279
ADDRLP4 276
INDIRI4
CNSTI4 6
GTI4 $4279
ADDRLP4 276
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $4303
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $4303
address $4282
address $4283
address $4301
address $4274
address $4274
address $4293
address $4296
code
LABELV $4282
line 5227
;5226:	  case UIMENU_NONE:
;5227:			trap_Key_SetCatcher( trap_Key_GetCatcher() & ~KEYCATCH_UI );
ADDRLP4 284
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5228
;5228:			trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 5229
;5229:			trap_Cvar_Set( "cl_paused", "0" );
ADDRGP4 $2560
ARGP4
ADDRGP4 $392
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5230
;5230:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5232
;5231:
;5232:		  return;
ADDRGP4 $4274
JUMPV
LABELV $4283
line 5235
;5233:	  case UIMENU_MAIN:
;5234:			//trap_Cvar_Set( "sv_killserver", "1" );
;5235:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5238
;5236:			//trap_S_StartLocalSound( trap_S_RegisterSound("sound/misc/menu_background.wav", qfalse) , CHAN_LOCAL_SOUND );
;5237:			//trap_S_StartBackgroundTrack("sound/misc/menu_background.wav", NULL);
;5238:			if (uiInfo.inGameLoad) {
ADDRGP4 uiInfo+136908
INDIRI4
CNSTI4 0
EQI4 $4284
line 5239
;5239:				UI_LoadNonIngame();
ADDRGP4 UI_LoadNonIngame
CALLV
pop
line 5240
;5240:			}
LABELV $4284
line 5241
;5241:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5242
;5242:			Menus_ActivateByName("main");
ADDRGP4 $2490
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 5243
;5243:			trap_Cvar_VariableStringBuffer("com_errorMessage", buf, sizeof(buf));
ADDRGP4 $2411
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5244
;5244:			if (strlen(buf)) {
ADDRLP4 0
ARGP4
ADDRLP4 288
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $4274
line 5245
;5245:				if (!ui_singlePlayerActive.integer) {
ADDRGP4 ui_singlePlayerActive+12
INDIRI4
CNSTI4 0
NEI4 $4289
line 5246
;5246:					Menus_ActivateByName("error_popmenu");
ADDRGP4 $4292
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 5247
;5247:				} else {
ADDRGP4 $4274
JUMPV
LABELV $4289
line 5248
;5248:					trap_Cvar_Set("com_errorMessage", "");
ADDRGP4 $2411
ARGP4
ADDRGP4 $109
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5249
;5249:				}
line 5250
;5250:			}
line 5251
;5251:		  return;
ADDRGP4 $4274
JUMPV
LABELV $4293
line 5253
;5252:	  case UIMENU_TEAM:
;5253:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5254
;5254:      Menus_ActivateByName("team");
ADDRGP4 $2107
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 5255
;5255:		  return;
ADDRGP4 $4274
JUMPV
line 5261
;5256:	  case UIMENU_NEED_CD:
;5257:			// no cd check in TA
;5258:			//trap_Key_SetCatcher( KEYCATCH_UI );
;5259:      //Menus_ActivateByName("needcd");
;5260:		  //UI_ConfirmMenu( "Insert the CD", NULL, NeedCDAction );
;5261:		  return;
line 5267
;5262:	  case UIMENU_BAD_CD_KEY:
;5263:			// no cd check in TA
;5264:			//trap_Key_SetCatcher( KEYCATCH_UI );
;5265:      //Menus_ActivateByName("badcd");
;5266:		  //UI_ConfirmMenu( "Bad CD Key", NULL, NeedCDKeyAction );
;5267:		  return;
LABELV $4296
line 5270
;5268:	  case UIMENU_POSTGAME:
;5269:			//trap_Cvar_Set( "sv_killserver", "1" );
;5270:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5271
;5271:			if (uiInfo.inGameLoad) {
ADDRGP4 uiInfo+136908
INDIRI4
CNSTI4 0
EQI4 $4297
line 5272
;5272:				UI_LoadNonIngame();
ADDRGP4 UI_LoadNonIngame
CALLV
pop
line 5273
;5273:			}
LABELV $4297
line 5274
;5274:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5275
;5275:			Menus_ActivateByName("endofgame");
ADDRGP4 $4300
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 5277
;5276:		  //UI_ConfirmMenu( "Bad CD Key", NULL, NeedCDKeyAction );
;5277:		  return;
ADDRGP4 $4274
JUMPV
LABELV $4301
line 5279
;5278:	  case UIMENU_INGAME:
;5279:		  trap_Cvar_Set( "cl_paused", "1" );
ADDRGP4 $2560
ARGP4
ADDRGP4 $395
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5280
;5280:			trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 5281
;5281:			UI_BuildPlayerList();
ADDRGP4 UI_BuildPlayerList
CALLV
pop
line 5282
;5282:			Menus_CloseAll();
ADDRGP4 Menus_CloseAll
CALLV
pop
line 5283
;5283:			Menus_ActivateByName("ingame");
ADDRGP4 $4302
ARGP4
ADDRGP4 Menus_ActivateByName
CALLP4
pop
line 5284
;5284:		  return;
LABELV $4279
line 5286
;5285:	  }
;5286:  }
LABELV $4275
line 5287
;5287:}
LABELV $4274
endproc _UI_SetActiveMenu 292 12
export _UI_IsFullscreen
proc _UI_IsFullscreen 4 0
line 5289
;5288:
;5289:qboolean _UI_IsFullscreen( void ) {
line 5290
;5290:	return Menus_AnyFullScreenVisible();
ADDRLP4 0
ADDRGP4 Menus_AnyFullScreenVisible
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $4304
endproc _UI_IsFullscreen 4 0
proc UI_ReadableSize 16 16
line 5299
;5291:}
;5292:
;5293:
;5294:
;5295:static connstate_t	lastConnState;
;5296:static char			lastLoadingText[MAX_INFO_VALUE];
;5297:
;5298:static void UI_ReadableSize ( char *buf, int bufsize, int value )
;5299:{
line 5300
;5300:	if (value > 1024*1024*1024 ) { // gigs
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
LEI4 $4306
line 5301
;5301:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $713
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1073741824
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5302
;5302:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d GB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $4308
ARGP4
ADDRLP4 12
CNSTI4 1073741824
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5304
;5303:			(value % (1024*1024*1024))*100 / (1024*1024*1024) );
;5304:	} else if (value > 1024*1024 ) { // megs
ADDRGP4 $4307
JUMPV
LABELV $4306
ADDRFP4 8
INDIRI4
CNSTI4 1048576
LEI4 $4309
line 5305
;5305:		Com_sprintf( buf, bufsize, "%d", value / (1024*1024) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $713
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1048576
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5306
;5306:		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d MB", 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ARGI4
ADDRGP4 $4311
ARGP4
ADDRLP4 12
CNSTI4 1048576
ASGNI4
CNSTI4 100
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
MODI4
MULI4
ADDRLP4 12
INDIRI4
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5308
;5307:			(value % (1024*1024))*100 / (1024*1024) );
;5308:	} else if (value > 1024 ) { // kilos
ADDRGP4 $4310
JUMPV
LABELV $4309
ADDRFP4 8
INDIRI4
CNSTI4 1024
LEI4 $4312
line 5309
;5309:		Com_sprintf( buf, bufsize, "%d KB", value / 1024 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4314
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1024
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5310
;5310:	} else { // bytes
ADDRGP4 $4313
JUMPV
LABELV $4312
line 5311
;5311:		Com_sprintf( buf, bufsize, "%d bytes", value );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4315
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5312
;5312:	}
LABELV $4313
LABELV $4310
LABELV $4307
line 5313
;5313:}
LABELV $4305
endproc UI_ReadableSize 16 16
proc UI_PrintTime 8 20
line 5316
;5314:
;5315:// Assumes time is in msec
;5316:static void UI_PrintTime ( char *buf, int bufsize, int time ) {
line 5317
;5317:	time /= 1000;  // change to seconds
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 5319
;5318:
;5319:	if (time > 3600) { // in the hours range
ADDRFP4 8
INDIRI4
CNSTI4 3600
LEI4 $4317
line 5320
;5320:		Com_sprintf( buf, bufsize, "%d hr %d min", time / 3600, (time % 3600) / 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4319
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 3600
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 60
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5321
;5321:	} else if (time > 60) { // mins
ADDRGP4 $4318
JUMPV
LABELV $4317
ADDRFP4 8
INDIRI4
CNSTI4 60
LEI4 $4320
line 5322
;5322:		Com_sprintf( buf, bufsize, "%d min %d sec", time / 60, time % 60 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4322
ARGP4
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 60
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5323
;5323:	} else  { // secs
ADDRGP4 $4321
JUMPV
LABELV $4320
line 5324
;5324:		Com_sprintf( buf, bufsize, "%d sec", time );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $4323
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5325
;5325:	}
LABELV $4321
LABELV $4318
line 5326
;5326:}
LABELV $4316
endproc UI_PrintTime 8 20
export Text_PaintCenter
proc Text_PaintCenter 8 32
line 5328
;5327:
;5328:void Text_PaintCenter(float x, float y, float scale, vec4_t color, const char *text, float adjust) {
line 5329
;5329:	int len = Text_Width(text, scale, 0);
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 5330
;5330:	Text_Paint(x - len / 2, y, scale, color, text, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 Text_Paint
CALLV
pop
line 5331
;5331:}
LABELV $4324
endproc Text_PaintCenter 8 32
export Text_PaintCenter_AutoWrapped
proc Text_PaintCenter_AutoWrapped 1056 24
line 5333
;5332:
;5333:void Text_PaintCenter_AutoWrapped(float x, float y, float xmax, float ystep, float scale, vec4_t color, const char *str, float adjust) {
line 5339
;5334:	int width;
;5335:	char *s1,*s2,*s3;
;5336:	char c_bcp;
;5337:	char buf[1024];
;5338:
;5339:	if (!str || str[0]=='\0')
ADDRLP4 1044
ADDRFP4 24
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4328
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4326
LABELV $4328
line 5340
;5340:		return;
ADDRGP4 $4325
JUMPV
LABELV $4326
line 5342
;5341:
;5342:	Q_strncpyz(buf, str, sizeof(buf));
ADDRLP4 20
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5343
;5343:	s1 = s2 = s3 = buf;
ADDRLP4 0
ADDRLP4 20
ASGNP4
ADDRLP4 4
ADDRLP4 20
ASGNP4
ADDRLP4 12
ADDRLP4 20
ASGNP4
ADDRGP4 $4330
JUMPV
LABELV $4329
line 5345
;5344:
;5345:	while (1) {
LABELV $4332
line 5346
;5346:		do {
line 5347
;5347:			s3++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 5348
;5348:		} while (*s3!=' ' && *s3!='\0');
LABELV $4333
ADDRLP4 1048
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 32
EQI4 $4335
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $4332
LABELV $4335
line 5349
;5349:		c_bcp = *s3;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 5350
;5350:		*s3 = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 5351
;5351:		width = Text_Width(s1, scale, 0);
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 1052
ADDRGP4 Text_Width
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 1052
INDIRI4
ASGNI4
line 5352
;5352:		*s3 = c_bcp;
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI1
ASGNI1
line 5353
;5353:		if (width > xmax) {
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRFP4 8
INDIRF4
LEF4 $4336
line 5354
;5354:			if (s1==s2)
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $4338
line 5355
;5355:			{
line 5357
;5356:				// fuck, don't have a clean cut, we'll overflow
;5357:				s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 5358
;5358:			}
LABELV $4338
line 5359
;5359:			*s2 = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 5360
;5360:			Text_PaintCenter(x, y, scale, color, s1, adjust);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 28
INDIRF4
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5361
;5361:			y += ystep;
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 5362
;5362:			if (c_bcp == '\0')
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4340
line 5363
;5363:      {
line 5368
;5364:				// that was the last word
;5365:        // we could start a new loop, but that wouldn't be much use
;5366:        // even if the word is too long, we would overflow it (see above)
;5367:        // so just print it now if needed
;5368:        s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 5369
;5369:        if (*s2 != '\0') // if we are printing an overflowing line we have s2 == s3
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4331
line 5370
;5370:          Text_PaintCenter(x, y, scale, color, s2, adjust);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 28
INDIRF4
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5371
;5371:        break;
ADDRGP4 $4331
JUMPV
LABELV $4340
line 5373
;5372:      }
;5373:			s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 5374
;5374:			s1 = s2;
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
line 5375
;5375:			s3 = s2;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 5376
;5376:		}
ADDRGP4 $4337
JUMPV
LABELV $4336
line 5378
;5377:		else
;5378:		{
line 5379
;5379:			s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 5380
;5380:			if (c_bcp == '\0') // we reached the end
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $4344
line 5381
;5381:			{
line 5382
;5382:				Text_PaintCenter(x, y, scale, color, s1, adjust);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
INDIRF4
ARGF4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 28
INDIRF4
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5383
;5383:				break;
ADDRGP4 $4331
JUMPV
LABELV $4344
line 5385
;5384:			}
;5385:		}
LABELV $4337
line 5386
;5386:	}
LABELV $4330
line 5345
ADDRGP4 $4329
JUMPV
LABELV $4331
line 5387
;5387:}
LABELV $4325
endproc Text_PaintCenter_AutoWrapped 1056 24
data
align 1
LABELV $4347
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $4348
byte 1 69
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $4349
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 0
code
proc UI_DisplayDownloadInfo 312 24
line 5389
;5388:
;5389:static void UI_DisplayDownloadInfo( const char *downloadName, float centerPoint, float yStart, float scale ) {
line 5400
;5390:	static char dlText[]	= "Downloading:";
;5391:	static char etaText[]	= "Estimated time left:";
;5392:	static char xferText[]	= "Transfer rate:";
;5393:
;5394:	int downloadSize, downloadCount, downloadTime;
;5395:	char dlSizeBuf[64], totalSizeBuf[64], xferRateBuf[64], dlTimeBuf[64];
;5396:	int xferRate;
;5397:	int leftWidth;
;5398:	const char *s;
;5399:
;5400:	downloadSize = trap_Cvar_VariableValue( "cl_downloadSize" );
ADDRGP4 $4350
ARGP4
ADDRLP4 280
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 280
INDIRF4
CVFI4 4
ASGNI4
line 5401
;5401:	downloadCount = trap_Cvar_VariableValue( "cl_downloadCount" );
ADDRGP4 $4351
ARGP4
ADDRLP4 284
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 284
INDIRF4
CVFI4 4
ASGNI4
line 5402
;5402:	downloadTime = trap_Cvar_VariableValue( "cl_downloadTime" );
ADDRGP4 $4352
ARGP4
ADDRLP4 288
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 140
ADDRLP4 288
INDIRF4
CVFI4 4
ASGNI4
line 5404
;5403:
;5404:	leftWidth = 320;
ADDRLP4 8
CNSTI4 320
ASGNI4
line 5406
;5405:
;5406:	UI_SetColor(colorWhite);
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 5407
;5407:	Text_PaintCenter(centerPoint, yStart + 112, scale, colorWhite, dlText, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1121976320
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4347
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5408
;5408:	Text_PaintCenter(centerPoint, yStart + 192, scale, colorWhite, etaText, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1128267776
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4348
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5409
;5409:	Text_PaintCenter(centerPoint, yStart + 248, scale, colorWhite, xferText, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1131937792
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4349
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5411
;5410:
;5411:	if (downloadSize > 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $4353
line 5412
;5412:		s = va( "%s (%d%%)", downloadName, downloadCount * 100 / downloadSize );
ADDRGP4 $4355
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 100
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
DIVI4
ARGI4
ADDRLP4 292
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 292
INDIRP4
ASGNP4
line 5413
;5413:	} else {
ADDRGP4 $4354
JUMPV
LABELV $4353
line 5414
;5414:		s = downloadName;
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
line 5415
;5415:	}
LABELV $4354
line 5417
;5416:
;5417:	Text_PaintCenter(centerPoint, yStart+136, scale, colorWhite, s, 0);
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1124597760
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5419
;5418:
;5419:	UI_ReadableSize( dlSizeBuf,		sizeof dlSizeBuf,		downloadCount );
ADDRLP4 12
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 5420
;5420:	UI_ReadableSize( totalSizeBuf,	sizeof totalSizeBuf,	downloadSize );
ADDRLP4 76
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 5422
;5421:
;5422:	if (downloadCount < 4096 || !downloadTime) {
ADDRLP4 4
INDIRI4
CNSTI4 4096
LTI4 $4358
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $4356
LABELV $4358
line 5423
;5423:		Text_PaintCenter(leftWidth, yStart+216, scale, colorWhite, "estimating", 0);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4359
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5424
;5424:		Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), 0);
ADDRGP4 $4360
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 292
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 292
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5425
;5425:	} else {
ADDRGP4 $4357
JUMPV
LABELV $4356
line 5426
;5426:		if ((uiInfo.uiDC.realTime - downloadTime) / 1000) {
ADDRGP4 uiInfo+208
INDIRI4
ADDRLP4 140
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 0
EQI4 $4361
line 5427
;5427:			xferRate = downloadCount / ((uiInfo.uiDC.realTime - downloadTime) / 1000);
ADDRLP4 144
ADDRLP4 4
INDIRI4
ADDRGP4 uiInfo+208
INDIRI4
ADDRLP4 140
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
DIVI4
ASGNI4
line 5428
;5428:		} else {
ADDRGP4 $4362
JUMPV
LABELV $4361
line 5429
;5429:			xferRate = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 5430
;5430:		}
LABELV $4362
line 5431
;5431:		UI_ReadableSize( xferRateBuf, sizeof xferRateBuf, xferRate );
ADDRLP4 152
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRGP4 UI_ReadableSize
CALLV
pop
line 5434
;5432:
;5433:		// Extrapolate estimated completion time
;5434:		if (downloadSize && xferRate) {
ADDRLP4 292
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 292
INDIRI4
EQI4 $4365
ADDRLP4 144
INDIRI4
ADDRLP4 292
INDIRI4
EQI4 $4365
line 5435
;5435:			int n = downloadSize / xferRate; // estimated time for entire d/l in secs
ADDRLP4 296
ADDRLP4 0
INDIRI4
ADDRLP4 144
INDIRI4
DIVI4
ASGNI4
line 5438
;5436:
;5437:			// We do it in K (/1024) because we'd overflow around 4MB
;5438:			UI_PrintTime ( dlTimeBuf, sizeof dlTimeBuf, 
ADDRLP4 216
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 300
ADDRLP4 296
INDIRI4
ASGNI4
ADDRLP4 304
CNSTI4 1024
ASGNI4
CNSTI4 1000
ADDRLP4 300
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 304
INDIRI4
DIVI4
ADDRLP4 300
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
DIVI4
DIVI4
SUBI4
MULI4
ARGI4
ADDRGP4 UI_PrintTime
CALLV
pop
line 5441
;5439:				(n - (((downloadCount/1024) * n) / (downloadSize/1024))) * 1000);
;5440:
;5441:			Text_PaintCenter(leftWidth, yStart+216, scale, colorWhite, dlTimeBuf, 0);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 216
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5442
;5442:			Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), 0);
ADDRGP4 $4360
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 308
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 308
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5443
;5443:		} else {
ADDRGP4 $4366
JUMPV
LABELV $4365
line 5444
;5444:			Text_PaintCenter(leftWidth, yStart+216, scale, colorWhite, "estimating", 0);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1129840640
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 $4359
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5445
;5445:			if (downloadSize) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $4367
line 5446
;5446:				Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), 0);
ADDRGP4 $4360
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5447
;5447:			} else {
ADDRGP4 $4368
JUMPV
LABELV $4367
line 5448
;5448:				Text_PaintCenter(leftWidth, yStart+160, scale, colorWhite, va("(%s copied)", dlSizeBuf), 0);
ADDRGP4 $4369
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1126170624
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5449
;5449:			}
LABELV $4368
line 5450
;5450:		}
LABELV $4366
line 5452
;5451:
;5452:		if (xferRate) {
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $4370
line 5453
;5453:			Text_PaintCenter(leftWidth, yStart+272, scale, colorWhite, va("%s/Sec", xferRateBuf), 0);
ADDRGP4 $4372
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRF4
CNSTF4 1132986368
ADDF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5454
;5454:		}
LABELV $4370
line 5455
;5455:	}
LABELV $4357
line 5456
;5456:}
LABELV $4346
endproc UI_DisplayDownloadInfo 312 24
export UI_DrawConnectScreen
proc UI_DrawConnectScreen 5440 32
line 5466
;5457:
;5458:/*
;5459:========================
;5460:UI_DrawConnectScreen
;5461:
;5462:This will also be overlaid on the cgame info screen during loading
;5463:to prevent it from blinking away too rapidly on local or lan games.
;5464:========================
;5465:*/
;5466:void UI_DrawConnectScreen( qboolean overlay ) {
line 5473
;5467:	char			*s;
;5468:	uiClientState_t	cstate;
;5469:	char			info[MAX_INFO_VALUE];
;5470:	char text[256];
;5471:	float centerPoint, yStart, scale;
;5472:	
;5473:	menuDef_t *menu = Menus_FindByName("Connect");
ADDRGP4 $4374
ARGP4
ADDRLP4 4384
ADDRGP4 Menus_FindByName
CALLP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4384
INDIRP4
ASGNP4
line 5476
;5474:
;5475:
;5476:	if ( !overlay && menu ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4375
ADDRLP4 4120
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $4375
line 5477
;5477:		Menu_Paint(menu, qtrue);
ADDRLP4 4120
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Menu_Paint
CALLV
pop
line 5478
;5478:	}
LABELV $4375
line 5480
;5479:
;5480:	if (!overlay) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4377
line 5481
;5481:		centerPoint = 320;
ADDRLP4 3084
CNSTF4 1134559232
ASGNF4
line 5482
;5482:		yStart = 130;
ADDRLP4 3092
CNSTF4 1124204544
ASGNF4
line 5483
;5483:		scale = 0.5f;
ADDRLP4 3088
CNSTF4 1056964608
ASGNF4
line 5484
;5484:	} else {
ADDRGP4 $4378
JUMPV
LABELV $4377
line 5485
;5485:		centerPoint = 320;
ADDRLP4 3084
CNSTF4 1134559232
ASGNF4
line 5486
;5486:		yStart = 32;
ADDRLP4 3092
CNSTF4 1107296256
ASGNF4
line 5487
;5487:		scale = 0.6f;
ADDRLP4 3088
CNSTF4 1058642330
ASGNF4
line 5488
;5488:		return;
ADDRGP4 $4373
JUMPV
LABELV $4378
line 5492
;5489:	}
;5490:
;5491:	// see what information we should display
;5492:	trap_GetClientState( &cstate );
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 5494
;5493:
;5494:	info[0] = '\0';
ADDRLP4 3096
CNSTI1 0
ASGNI1
line 5495
;5495:	if( trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) ) ) {
CNSTI4 0
ARGI4
ADDRLP4 3096
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4388
ADDRGP4 trap_GetConfigString
CALLI4
ASGNI4
ADDRLP4 4388
INDIRI4
CNSTI4 0
EQI4 $4379
line 5496
;5496:		Text_PaintCenter(centerPoint, yStart, scale, colorWhite, va( "Loading %s", Info_ValueForKey( info, "mapname" )), 0);
ADDRLP4 3096
ARGP4
ADDRGP4 $3059
ARGP4
ADDRLP4 4392
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $4381
ARGP4
ADDRLP4 4392
INDIRP4
ARGP4
ADDRLP4 4396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5497
;5497:	}
LABELV $4379
line 5499
;5498:
;5499:	if (!Q_stricmp(cstate.servername,"localhost")) {
ADDRLP4 0+12
ARGP4
ADDRGP4 $4385
ARGP4
ADDRLP4 4392
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4392
INDIRI4
CNSTI4 0
NEI4 $4382
line 5500
;5500:		Text_PaintCenter(centerPoint, yStart + 48, scale, colorWhite, va("Starting up..."), ITEM_TEXTSTYLE_SHADOWEDMORE);
ADDRGP4 $4386
ARGP4
ADDRLP4 4396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
CNSTF4 1086324736
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5501
;5501:	} else {
ADDRGP4 $4383
JUMPV
LABELV $4382
line 5502
;5502:		strcpy(text, va("Connecting to %s", cstate.servername));
ADDRGP4 $4387
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 4396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4124
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 5503
;5503:		Text_PaintCenter(centerPoint, yStart + 48, scale, colorWhite,text , ITEM_TEXTSTYLE_SHADOWEDMORE);
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4124
ARGP4
CNSTF4 1086324736
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5504
;5504:	}
LABELV $4383
line 5507
;5505:
;5506:	// display global MOTD at bottom
;5507:	Text_PaintCenter(centerPoint, 600, scale, colorWhite, Info_ValueForKey( cstate.updateInfoString, "motd" ), 0);
ADDRLP4 0+1036
ARGP4
ADDRGP4 $4390
ARGP4
ADDRLP4 4396
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3084
INDIRF4
ARGF4
CNSTF4 1142292480
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4396
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5509
;5508:	// print any server info (server full, bad version, etc)
;5509:	if ( cstate.connState < CA_CONNECTED ) {
ADDRLP4 0
INDIRI4
CNSTI4 5
GEI4 $4391
line 5510
;5510:		Text_PaintCenter_AutoWrapped(centerPoint, yStart + 176, 630, 20, scale, colorWhite, cstate.messageString, 0);
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
CNSTF4 1127219200
ADDF4
ARGF4
CNSTF4 1142784000
ARGF4
CNSTF4 1101004800
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 0+2060
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter_AutoWrapped
CALLV
pop
line 5511
;5511:	}
LABELV $4391
line 5513
;5512:
;5513:	if ( lastConnState > cstate.connState ) {
ADDRGP4 lastConnState
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $4394
line 5514
;5514:		lastLoadingText[0] = '\0';
ADDRGP4 lastLoadingText
CNSTI1 0
ASGNI1
line 5515
;5515:	}
LABELV $4394
line 5516
;5516:	lastConnState = cstate.connState;
ADDRGP4 lastConnState
ADDRLP4 0
INDIRI4
ASGNI4
line 5518
;5517:
;5518:	switch ( cstate.connState ) {
ADDRLP4 4400
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4400
INDIRI4
CNSTI4 3
LTI4 $4373
ADDRLP4 4400
INDIRI4
CNSTI4 7
GTI4 $4373
ADDRLP4 4400
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $4412-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $4412
address $4399
address $4402
address $4405
address $4373
address $4373
code
LABELV $4399
line 5520
;5519:	case CA_CONNECTING:
;5520:		s = va("Awaiting connection...%i", cstate.connectPacketCount);
ADDRGP4 $4400
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4408
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4380
ADDRLP4 4408
INDIRP4
ASGNP4
line 5521
;5521:		break;
ADDRGP4 $4397
JUMPV
LABELV $4402
line 5523
;5522:	case CA_CHALLENGING:
;5523:		s = va("Awaiting challenge...%i", cstate.connectPacketCount);
ADDRGP4 $4403
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 4412
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4380
ADDRLP4 4412
INDIRP4
ASGNP4
line 5524
;5524:		break;
ADDRGP4 $4397
JUMPV
LABELV $4405
line 5525
;5525:	case CA_CONNECTED: {
line 5528
;5526:		char downloadName[MAX_INFO_VALUE];
;5527:
;5528:			trap_Cvar_VariableStringBuffer( "cl_downloadName", downloadName, sizeof(downloadName) );
ADDRGP4 $4406
ARGP4
ADDRLP4 4416
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5529
;5529:			if (*downloadName) {
ADDRLP4 4416
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $4407
line 5530
;5530:				UI_DisplayDownloadInfo( downloadName, centerPoint, yStart, scale );
ADDRLP4 4416
ARGP4
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 UI_DisplayDownloadInfo
CALLV
pop
line 5531
;5531:				return;
ADDRGP4 $4373
JUMPV
LABELV $4407
line 5533
;5532:			}
;5533:		}
line 5534
;5534:		s = "Awaiting gamestate...";
ADDRLP4 4380
ADDRGP4 $4409
ASGNP4
line 5535
;5535:		break;
line 5537
;5536:	case CA_LOADING:
;5537:		return;
line 5539
;5538:	case CA_PRIMED:
;5539:		return;
line 5541
;5540:	default:
;5541:		return;
LABELV $4397
line 5545
;5542:	}
;5543:
;5544:
;5545:	if (Q_stricmp(cstate.servername,"localhost")) {
ADDRLP4 0+12
ARGP4
ADDRGP4 $4385
ARGP4
ADDRLP4 4408
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4408
INDIRI4
CNSTI4 0
EQI4 $4414
line 5546
;5546:		Text_PaintCenter(centerPoint, yStart + 80, scale, colorWhite, s, 0);
ADDRLP4 3084
INDIRF4
ARGF4
ADDRLP4 3092
INDIRF4
CNSTF4 1117782016
ADDF4
ARGF4
ADDRLP4 3088
INDIRF4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 4380
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Text_PaintCenter
CALLV
pop
line 5547
;5547:	}
LABELV $4414
line 5550
;5548:
;5549:	// password required / connection rejected information goes here
;5550:}
LABELV $4373
endproc UI_DrawConnectScreen 5440 32
data
align 4
LABELV cvarTable
address ui_ffa_fraglimit
address $4418
address $691
byte 4 1
address ui_ffa_timelimit
address $4419
address $392
byte 4 1
address ui_tourney_fraglimit
address $4420
address $392
byte 4 1
address ui_tourney_timelimit
address $4421
address $692
byte 4 1
address ui_team_fraglimit
address $4422
address $392
byte 4 1
address ui_team_timelimit
address $4423
address $691
byte 4 1
address ui_team_friendly
address $4424
address $395
byte 4 1
address ui_ctf_capturelimit
address $4425
address $4426
byte 4 1
address ui_ctf_timelimit
address $4427
address $689
byte 4 1
address ui_ctf_friendly
address $4428
address $392
byte 4 1
address ui_arenasFile
address $4429
address $109
byte 4 80
address ui_botsFile
address $4430
address $109
byte 4 80
address ui_spScores1
address $4431
address $109
byte 4 65
address ui_spScores2
address $4432
address $109
byte 4 65
address ui_spScores3
address $4433
address $109
byte 4 65
address ui_spScores4
address $4434
address $109
byte 4 65
address ui_spScores5
address $4435
address $109
byte 4 65
address ui_spAwards
address $4436
address $109
byte 4 65
address ui_spVideos
address $4437
address $109
byte 4 65
address ui_spSkill
address $824
address $2209
byte 4 1
address ui_spSelection
address $4438
address $109
byte 4 64
address ui_browserMaster
address $4439
address $392
byte 4 1
address ui_browserGameType
address $4440
address $392
byte 4 1
address ui_browserSortKey
address $4441
address $2744
byte 4 1
address ui_browserShowFull
address $4442
address $395
byte 4 1
address ui_browserShowEmpty
address $4443
address $395
byte 4 1
address ui_brassTime
address $2302
address $4444
byte 4 1
address ui_drawCrosshair
address $2022
address $2744
byte 4 1
address ui_drawCrosshairNames
address $4445
address $395
byte 4 1
address ui_marks
address $4446
address $395
byte 4 1
address ui_server1
address $4447
address $109
byte 4 1
address ui_server2
address $4448
address $109
byte 4 1
address ui_server3
address $4449
address $109
byte 4 1
address ui_server4
address $4450
address $109
byte 4 1
address ui_server5
address $4451
address $109
byte 4 1
address ui_server6
address $4452
address $109
byte 4 1
address ui_server7
address $4453
address $109
byte 4 1
address ui_server8
address $4454
address $109
byte 4 1
address ui_server9
address $4455
address $109
byte 4 1
address ui_server10
address $4456
address $109
byte 4 1
address ui_server11
address $4457
address $109
byte 4 1
address ui_server12
address $4458
address $109
byte 4 1
address ui_server13
address $4459
address $109
byte 4 1
address ui_server14
address $4460
address $109
byte 4 1
address ui_server15
address $4461
address $109
byte 4 1
address ui_server16
address $4462
address $109
byte 4 1
address ui_cdkeychecked
address $4463
address $392
byte 4 64
address ui_new
address $4464
address $392
byte 4 256
address ui_debug
address $4465
address $392
byte 4 256
address ui_initialized
address $4466
address $392
byte 4 256
address ui_teamName
address $698
address $4467
byte 4 1
address ui_opponentName
address $1099
address $4468
byte 4 1
address ui_redteam
address $4469
address $4467
byte 4 1
address ui_blueteam
address $4470
address $4468
byte 4 1
address ui_dedicated
address $4471
address $392
byte 4 1
address ui_gameType
address $4472
address $4473
byte 4 1
address ui_joinGameType
address $4474
address $392
byte 4 1
address ui_netGameType
address $4475
address $4473
byte 4 1
address ui_actualNetGameType
address $4476
address $4473
byte 4 1
address ui_redteam1
address $4477
address $392
byte 4 1
address ui_redteam2
address $4478
address $392
byte 4 1
address ui_redteam3
address $4479
address $392
byte 4 1
address ui_redteam4
address $4480
address $392
byte 4 1
address ui_redteam5
address $4481
address $392
byte 4 1
address ui_blueteam1
address $4482
address $392
byte 4 1
address ui_blueteam2
address $4483
address $392
byte 4 1
address ui_blueteam3
address $4484
address $392
byte 4 1
address ui_blueteam4
address $4485
address $392
byte 4 1
address ui_blueteam5
address $4486
address $392
byte 4 1
address ui_netSource
address $1929
address $392
byte 4 1
address ui_menuFiles
address $668
address $640
byte 4 1
address ui_currentTier
address $1021
address $392
byte 4 1
address ui_currentMap
address $888
address $392
byte 4 1
address ui_currentNetMap
address $886
address $392
byte 4 1
address ui_mapIndex
address $2169
address $392
byte 4 1
address ui_currentOpponent
address $4487
address $392
byte 4 1
address ui_selectedPlayer
address $1391
address $392
byte 4 1
address ui_selectedPlayerName
address $1399
address $109
byte 4 1
address ui_lastServerRefresh_0
address $4488
address $109
byte 4 1
address ui_lastServerRefresh_1
address $4489
address $109
byte 4 1
address ui_lastServerRefresh_2
address $4490
address $109
byte 4 1
address ui_lastServerRefresh_3
address $4491
address $109
byte 4 1
address ui_singlePlayerActive
address $2182
address $392
byte 4 0
address ui_scoreAccuracy
address $4492
address $392
byte 4 1
address ui_scoreImpressives
address $4493
address $392
byte 4 1
address ui_scoreExcellents
address $4494
address $392
byte 4 1
address ui_scoreCaptures
address $4495
address $392
byte 4 1
address ui_scoreDefends
address $4496
address $392
byte 4 1
address ui_scoreAssists
address $4497
address $392
byte 4 1
address ui_scoreGauntlets
address $4498
address $392
byte 4 1
address ui_scoreScore
address $4499
address $392
byte 4 1
address ui_scorePerfect
address $4500
address $392
byte 4 1
address ui_scoreTeam
address $4501
address $4502
byte 4 1
address ui_scoreBase
address $4503
address $392
byte 4 1
address ui_scoreTime
address $4504
address $4505
byte 4 1
address ui_scoreTimeBonus
address $4506
address $392
byte 4 1
address ui_scoreSkillBonus
address $4507
address $392
byte 4 1
address ui_scoreShutoutBonus
address $4508
address $392
byte 4 1
address ui_fragLimit
address $714
address $693
byte 4 0
address ui_captureLimit
address $712
address $694
byte 4 0
address ui_smallFont
address $4509
address $4510
byte 4 1
address ui_bigFont
address $4511
address $4512
byte 4 1
address ui_findPlayer
address $3147
address $4513
byte 4 1
address ui_Q3Model
address $4514
address $392
byte 4 1
address ui_hudFiles
address $4515
address $4516
byte 4 1
address ui_recordSPDemo
address $2201
address $392
byte 4 1
address ui_teamArenaFirstRun
address $4517
address $392
byte 4 1
address ui_realWarmUp
address $2193
address $691
byte 4 1
address ui_realCaptureLimit
address $715
address $4426
byte 4 1029
address ui_serverStatusTimeOut
address $4518
address $4519
byte 4 1
align 4
LABELV cvarTableSize
byte 4 110
export UI_RegisterCvars
code
proc UI_RegisterCvars 12 16
line 5817
;5551:
;5552:
;5553:/*
;5554:================
;5555:cvars
;5556:================
;5557:*/
;5558:
;5559:typedef struct {
;5560:	vmCvar_t	*vmCvar;
;5561:	char		*cvarName;
;5562:	char		*defaultString;
;5563:	int			cvarFlags;
;5564:} cvarTable_t;
;5565:
;5566:vmCvar_t	ui_ffa_fraglimit;
;5567:vmCvar_t	ui_ffa_timelimit;
;5568:
;5569:vmCvar_t	ui_tourney_fraglimit;
;5570:vmCvar_t	ui_tourney_timelimit;
;5571:
;5572:vmCvar_t	ui_team_fraglimit;
;5573:vmCvar_t	ui_team_timelimit;
;5574:vmCvar_t	ui_team_friendly;
;5575:
;5576:vmCvar_t	ui_ctf_capturelimit;
;5577:vmCvar_t	ui_ctf_timelimit;
;5578:vmCvar_t	ui_ctf_friendly;
;5579:
;5580:vmCvar_t	ui_arenasFile;
;5581:vmCvar_t	ui_botsFile;
;5582:vmCvar_t	ui_spScores1;
;5583:vmCvar_t	ui_spScores2;
;5584:vmCvar_t	ui_spScores3;
;5585:vmCvar_t	ui_spScores4;
;5586:vmCvar_t	ui_spScores5;
;5587:vmCvar_t	ui_spAwards;
;5588:vmCvar_t	ui_spVideos;
;5589:vmCvar_t	ui_spSkill;
;5590:
;5591:vmCvar_t	ui_spSelection;
;5592:
;5593:vmCvar_t	ui_browserMaster;
;5594:vmCvar_t	ui_browserGameType;
;5595:vmCvar_t	ui_browserSortKey;
;5596:vmCvar_t	ui_browserShowFull;
;5597:vmCvar_t	ui_browserShowEmpty;
;5598:
;5599:vmCvar_t	ui_brassTime;
;5600:vmCvar_t	ui_drawCrosshair;
;5601:vmCvar_t	ui_drawCrosshairNames;
;5602:vmCvar_t	ui_marks;
;5603:
;5604:vmCvar_t	ui_server1;
;5605:vmCvar_t	ui_server2;
;5606:vmCvar_t	ui_server3;
;5607:vmCvar_t	ui_server4;
;5608:vmCvar_t	ui_server5;
;5609:vmCvar_t	ui_server6;
;5610:vmCvar_t	ui_server7;
;5611:vmCvar_t	ui_server8;
;5612:vmCvar_t	ui_server9;
;5613:vmCvar_t	ui_server10;
;5614:vmCvar_t	ui_server11;
;5615:vmCvar_t	ui_server12;
;5616:vmCvar_t	ui_server13;
;5617:vmCvar_t	ui_server14;
;5618:vmCvar_t	ui_server15;
;5619:vmCvar_t	ui_server16;
;5620:
;5621:vmCvar_t	ui_cdkeychecked;
;5622:
;5623:vmCvar_t	ui_redteam;
;5624:vmCvar_t	ui_redteam1;
;5625:vmCvar_t	ui_redteam2;
;5626:vmCvar_t	ui_redteam3;
;5627:vmCvar_t	ui_redteam4;
;5628:vmCvar_t	ui_redteam5;
;5629:vmCvar_t	ui_blueteam;
;5630:vmCvar_t	ui_blueteam1;
;5631:vmCvar_t	ui_blueteam2;
;5632:vmCvar_t	ui_blueteam3;
;5633:vmCvar_t	ui_blueteam4;
;5634:vmCvar_t	ui_blueteam5;
;5635:vmCvar_t	ui_teamName;
;5636:vmCvar_t	ui_dedicated;
;5637:vmCvar_t	ui_gameType;
;5638:vmCvar_t	ui_netGameType;
;5639:vmCvar_t	ui_actualNetGameType;
;5640:vmCvar_t	ui_joinGameType;
;5641:vmCvar_t	ui_netSource;
;5642:vmCvar_t	ui_serverFilterType;
;5643:vmCvar_t	ui_opponentName;
;5644:vmCvar_t	ui_menuFiles;
;5645:vmCvar_t	ui_currentTier;
;5646:vmCvar_t	ui_currentMap;
;5647:vmCvar_t	ui_currentNetMap;
;5648:vmCvar_t	ui_mapIndex;
;5649:vmCvar_t	ui_currentOpponent;
;5650:vmCvar_t	ui_selectedPlayer;
;5651:vmCvar_t	ui_selectedPlayerName;
;5652:vmCvar_t	ui_lastServerRefresh_0;
;5653:vmCvar_t	ui_lastServerRefresh_1;
;5654:vmCvar_t	ui_lastServerRefresh_2;
;5655:vmCvar_t	ui_lastServerRefresh_3;
;5656:vmCvar_t	ui_singlePlayerActive;
;5657:vmCvar_t	ui_scoreAccuracy;
;5658:vmCvar_t	ui_scoreImpressives;
;5659:vmCvar_t	ui_scoreExcellents;
;5660:vmCvar_t	ui_scoreCaptures;
;5661:vmCvar_t	ui_scoreDefends;
;5662:vmCvar_t	ui_scoreAssists;
;5663:vmCvar_t	ui_scoreGauntlets;
;5664:vmCvar_t	ui_scoreScore;
;5665:vmCvar_t	ui_scorePerfect;
;5666:vmCvar_t	ui_scoreTeam;
;5667:vmCvar_t	ui_scoreBase;
;5668:vmCvar_t	ui_scoreTimeBonus;
;5669:vmCvar_t	ui_scoreSkillBonus;
;5670:vmCvar_t	ui_scoreShutoutBonus;
;5671:vmCvar_t	ui_scoreTime;
;5672:vmCvar_t	ui_captureLimit;
;5673:vmCvar_t	ui_fragLimit;
;5674:vmCvar_t	ui_smallFont;
;5675:vmCvar_t	ui_bigFont;
;5676:vmCvar_t	ui_findPlayer;
;5677:vmCvar_t	ui_Q3Model;
;5678:vmCvar_t	ui_hudFiles;
;5679:vmCvar_t	ui_recordSPDemo;
;5680:vmCvar_t	ui_realCaptureLimit;
;5681:vmCvar_t	ui_realWarmUp;
;5682:vmCvar_t	ui_serverStatusTimeOut;
;5683:
;5684:
;5685:// bk001129 - made static to avoid aliasing
;5686:static cvarTable_t		cvarTable[] = {
;5687:	{ &ui_ffa_fraglimit, "ui_ffa_fraglimit", "20", CVAR_ARCHIVE },
;5688:	{ &ui_ffa_timelimit, "ui_ffa_timelimit", "0", CVAR_ARCHIVE },
;5689:
;5690:	{ &ui_tourney_fraglimit, "ui_tourney_fraglimit", "0", CVAR_ARCHIVE },
;5691:	{ &ui_tourney_timelimit, "ui_tourney_timelimit", "15", CVAR_ARCHIVE },
;5692:
;5693:	{ &ui_team_fraglimit, "ui_team_fraglimit", "0", CVAR_ARCHIVE },
;5694:	{ &ui_team_timelimit, "ui_team_timelimit", "20", CVAR_ARCHIVE },
;5695:	{ &ui_team_friendly, "ui_team_friendly",  "1", CVAR_ARCHIVE },
;5696:
;5697:	{ &ui_ctf_capturelimit, "ui_ctf_capturelimit", "8", CVAR_ARCHIVE },
;5698:	{ &ui_ctf_timelimit, "ui_ctf_timelimit", "30", CVAR_ARCHIVE },
;5699:	{ &ui_ctf_friendly, "ui_ctf_friendly",  "0", CVAR_ARCHIVE },
;5700:
;5701:	{ &ui_arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM },
;5702:	{ &ui_botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM },
;5703:	{ &ui_spScores1, "g_spScores1", "", CVAR_ARCHIVE | CVAR_ROM },
;5704:	{ &ui_spScores2, "g_spScores2", "", CVAR_ARCHIVE | CVAR_ROM },
;5705:	{ &ui_spScores3, "g_spScores3", "", CVAR_ARCHIVE | CVAR_ROM },
;5706:	{ &ui_spScores4, "g_spScores4", "", CVAR_ARCHIVE | CVAR_ROM },
;5707:	{ &ui_spScores5, "g_spScores5", "", CVAR_ARCHIVE | CVAR_ROM },
;5708:	{ &ui_spAwards, "g_spAwards", "", CVAR_ARCHIVE | CVAR_ROM },
;5709:	{ &ui_spVideos, "g_spVideos", "", CVAR_ARCHIVE | CVAR_ROM },
;5710:	{ &ui_spSkill, "g_spSkill", "2", CVAR_ARCHIVE },
;5711:
;5712:	{ &ui_spSelection, "ui_spSelection", "", CVAR_ROM },
;5713:
;5714:	{ &ui_browserMaster, "ui_browserMaster", "0", CVAR_ARCHIVE },
;5715:	{ &ui_browserGameType, "ui_browserGameType", "0", CVAR_ARCHIVE },
;5716:	{ &ui_browserSortKey, "ui_browserSortKey", "4", CVAR_ARCHIVE },
;5717:	{ &ui_browserShowFull, "ui_browserShowFull", "1", CVAR_ARCHIVE },
;5718:	{ &ui_browserShowEmpty, "ui_browserShowEmpty", "1", CVAR_ARCHIVE },
;5719:
;5720:	{ &ui_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE },
;5721:	{ &ui_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE },
;5722:	{ &ui_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE },
;5723:	{ &ui_marks, "cg_marks", "1", CVAR_ARCHIVE },
;5724:
;5725:	{ &ui_server1, "server1", "", CVAR_ARCHIVE },
;5726:	{ &ui_server2, "server2", "", CVAR_ARCHIVE },
;5727:	{ &ui_server3, "server3", "", CVAR_ARCHIVE },
;5728:	{ &ui_server4, "server4", "", CVAR_ARCHIVE },
;5729:	{ &ui_server5, "server5", "", CVAR_ARCHIVE },
;5730:	{ &ui_server6, "server6", "", CVAR_ARCHIVE },
;5731:	{ &ui_server7, "server7", "", CVAR_ARCHIVE },
;5732:	{ &ui_server8, "server8", "", CVAR_ARCHIVE },
;5733:	{ &ui_server9, "server9", "", CVAR_ARCHIVE },
;5734:	{ &ui_server10, "server10", "", CVAR_ARCHIVE },
;5735:	{ &ui_server11, "server11", "", CVAR_ARCHIVE },
;5736:	{ &ui_server12, "server12", "", CVAR_ARCHIVE },
;5737:	{ &ui_server13, "server13", "", CVAR_ARCHIVE },
;5738:	{ &ui_server14, "server14", "", CVAR_ARCHIVE },
;5739:	{ &ui_server15, "server15", "", CVAR_ARCHIVE },
;5740:	{ &ui_server16, "server16", "", CVAR_ARCHIVE },
;5741:	{ &ui_cdkeychecked, "ui_cdkeychecked", "0", CVAR_ROM },
;5742:	{ &ui_new, "ui_new", "0", CVAR_TEMP },
;5743:	{ &ui_debug, "ui_debug", "0", CVAR_TEMP },
;5744:	{ &ui_initialized, "ui_initialized", "0", CVAR_TEMP },
;5745:	{ &ui_teamName, "ui_teamName", "Pagans", CVAR_ARCHIVE },
;5746:	{ &ui_opponentName, "ui_opponentName", "Stroggs", CVAR_ARCHIVE },
;5747:	{ &ui_redteam, "ui_redteam", "Pagans", CVAR_ARCHIVE },
;5748:	{ &ui_blueteam, "ui_blueteam", "Stroggs", CVAR_ARCHIVE },
;5749:	{ &ui_dedicated, "ui_dedicated", "0", CVAR_ARCHIVE },
;5750:	{ &ui_gameType, "ui_gametype", "3", CVAR_ARCHIVE },
;5751:	{ &ui_joinGameType, "ui_joinGametype", "0", CVAR_ARCHIVE },
;5752:	{ &ui_netGameType, "ui_netGametype", "3", CVAR_ARCHIVE },
;5753:	{ &ui_actualNetGameType, "ui_actualNetGametype", "3", CVAR_ARCHIVE },
;5754:	{ &ui_redteam1, "ui_redteam1", "0", CVAR_ARCHIVE },
;5755:	{ &ui_redteam2, "ui_redteam2", "0", CVAR_ARCHIVE },
;5756:	{ &ui_redteam3, "ui_redteam3", "0", CVAR_ARCHIVE },
;5757:	{ &ui_redteam4, "ui_redteam4", "0", CVAR_ARCHIVE },
;5758:	{ &ui_redteam5, "ui_redteam5", "0", CVAR_ARCHIVE },
;5759:	{ &ui_blueteam1, "ui_blueteam1", "0", CVAR_ARCHIVE },
;5760:	{ &ui_blueteam2, "ui_blueteam2", "0", CVAR_ARCHIVE },
;5761:	{ &ui_blueteam3, "ui_blueteam3", "0", CVAR_ARCHIVE },
;5762:	{ &ui_blueteam4, "ui_blueteam4", "0", CVAR_ARCHIVE },
;5763:	{ &ui_blueteam5, "ui_blueteam5", "0", CVAR_ARCHIVE },
;5764:	{ &ui_netSource, "ui_netSource", "0", CVAR_ARCHIVE },
;5765:	{ &ui_menuFiles, "ui_menuFiles", "ui/menus.txt", CVAR_ARCHIVE },
;5766:	{ &ui_currentTier, "ui_currentTier", "0", CVAR_ARCHIVE },
;5767:	{ &ui_currentMap, "ui_currentMap", "0", CVAR_ARCHIVE },
;5768:	{ &ui_currentNetMap, "ui_currentNetMap", "0", CVAR_ARCHIVE },
;5769:	{ &ui_mapIndex, "ui_mapIndex", "0", CVAR_ARCHIVE },
;5770:	{ &ui_currentOpponent, "ui_currentOpponent", "0", CVAR_ARCHIVE },
;5771:	{ &ui_selectedPlayer, "cg_selectedPlayer", "0", CVAR_ARCHIVE},
;5772:	{ &ui_selectedPlayerName, "cg_selectedPlayerName", "", CVAR_ARCHIVE},
;5773:	{ &ui_lastServerRefresh_0, "ui_lastServerRefresh_0", "", CVAR_ARCHIVE},
;5774:	{ &ui_lastServerRefresh_1, "ui_lastServerRefresh_1", "", CVAR_ARCHIVE},
;5775:	{ &ui_lastServerRefresh_2, "ui_lastServerRefresh_2", "", CVAR_ARCHIVE},
;5776:	{ &ui_lastServerRefresh_3, "ui_lastServerRefresh_3", "", CVAR_ARCHIVE},
;5777:	{ &ui_singlePlayerActive, "ui_singlePlayerActive", "0", 0},
;5778:	{ &ui_scoreAccuracy, "ui_scoreAccuracy", "0", CVAR_ARCHIVE},
;5779:	{ &ui_scoreImpressives, "ui_scoreImpressives", "0", CVAR_ARCHIVE},
;5780:	{ &ui_scoreExcellents, "ui_scoreExcellents", "0", CVAR_ARCHIVE},
;5781:	{ &ui_scoreCaptures, "ui_scoreCaptures", "0", CVAR_ARCHIVE},
;5782:	{ &ui_scoreDefends, "ui_scoreDefends", "0", CVAR_ARCHIVE},
;5783:	{ &ui_scoreAssists, "ui_scoreAssists", "0", CVAR_ARCHIVE},
;5784:	{ &ui_scoreGauntlets, "ui_scoreGauntlets", "0",CVAR_ARCHIVE},
;5785:	{ &ui_scoreScore, "ui_scoreScore", "0", CVAR_ARCHIVE},
;5786:	{ &ui_scorePerfect, "ui_scorePerfect", "0", CVAR_ARCHIVE},
;5787:	{ &ui_scoreTeam, "ui_scoreTeam", "0 to 0", CVAR_ARCHIVE},
;5788:	{ &ui_scoreBase, "ui_scoreBase", "0", CVAR_ARCHIVE},
;5789:	{ &ui_scoreTime, "ui_scoreTime", "00:00", CVAR_ARCHIVE},
;5790:	{ &ui_scoreTimeBonus, "ui_scoreTimeBonus", "0", CVAR_ARCHIVE},
;5791:	{ &ui_scoreSkillBonus, "ui_scoreSkillBonus", "0", CVAR_ARCHIVE},
;5792:	{ &ui_scoreShutoutBonus, "ui_scoreShutoutBonus", "0", CVAR_ARCHIVE},
;5793:	{ &ui_fragLimit, "ui_fragLimit", "10", 0},
;5794:	{ &ui_captureLimit, "ui_captureLimit", "5", 0},
;5795:	{ &ui_smallFont, "ui_smallFont", "0.25", CVAR_ARCHIVE},
;5796:	{ &ui_bigFont, "ui_bigFont", "0.4", CVAR_ARCHIVE},
;5797:	{ &ui_findPlayer, "ui_findPlayer", "Sarge", CVAR_ARCHIVE},
;5798:	{ &ui_Q3Model, "ui_q3model", "0", CVAR_ARCHIVE},
;5799:	{ &ui_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE},
;5800:	{ &ui_recordSPDemo, "ui_recordSPDemo", "0", CVAR_ARCHIVE},
;5801:	{ &ui_teamArenaFirstRun, "ui_teamArenaFirstRun", "0", CVAR_ARCHIVE},
;5802:	{ &ui_realWarmUp, "g_warmup", "20", CVAR_ARCHIVE},
;5803:	{ &ui_realCaptureLimit, "capturelimit", "8", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART},
;5804:	{ &ui_serverStatusTimeOut, "ui_serverStatusTimeOut", "7000", CVAR_ARCHIVE},
;5805:
;5806:};
;5807:
;5808:// bk001129 - made static to avoid aliasing
;5809:static int		cvarTableSize = sizeof(cvarTable) / sizeof(cvarTable[0]);
;5810:
;5811:
;5812:/*
;5813:=================
;5814:UI_RegisterCvars
;5815:=================
;5816:*/
;5817:void UI_RegisterCvars( void ) {
line 5821
;5818:	int			i;
;5819:	cvarTable_t	*cv;
;5820:
;5821:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $4524
JUMPV
LABELV $4521
line 5822
;5822:		trap_Cvar_Register( cv->vmCvar, cv->cvarName, cv->defaultString, cv->cvarFlags );
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5823
;5823:	}
LABELV $4522
line 5821
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $4524
ADDRLP4 4
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $4521
line 5824
;5824:}
LABELV $4520
endproc UI_RegisterCvars 12 16
export UI_UpdateCvars
proc UI_UpdateCvars 8 4
line 5831
;5825:
;5826:/*
;5827:=================
;5828:UI_UpdateCvars
;5829:=================
;5830:*/
;5831:void UI_UpdateCvars( void ) {
line 5835
;5832:	int			i;
;5833:	cvarTable_t	*cv;
;5834:
;5835:	for ( i = 0, cv = cvarTable ; i < cvarTableSize ; i++, cv++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $4529
JUMPV
LABELV $4526
line 5836
;5836:		trap_Cvar_Update( cv->vmCvar );
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5837
;5837:	}
LABELV $4527
line 5835
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $4529
ADDRLP4 0
INDIRI4
ADDRGP4 cvarTableSize
INDIRI4
LTI4 $4526
line 5838
;5838:}
LABELV $4525
endproc UI_UpdateCvars 8 4
proc UI_StopServerRefresh 12 12
line 5847
;5839:
;5840:
;5841:/*
;5842:=================
;5843:ArenaServers_StopRefresh
;5844:=================
;5845:*/
;5846:static void UI_StopServerRefresh( void )
;5847:{
line 5850
;5848:	int count;
;5849:
;5850:	if (!uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+99264+2212
INDIRI4
CNSTI4 0
NEI4 $4531
line 5852
;5851:		// not currently refreshing
;5852:		return;
ADDRGP4 $4530
JUMPV
LABELV $4531
line 5854
;5853:	}
;5854:	uiInfo.serverStatus.refreshActive = qfalse;
ADDRGP4 uiInfo+99264+2212
CNSTI4 0
ASGNI4
line 5855
;5855:	Com_Printf("%d servers listed in browser with %d players.\n",
ADDRGP4 $4537
ARGP4
ADDRGP4 uiInfo+99264+10412
INDIRI4
ARGI4
ADDRGP4 uiInfo+99264+10416
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 5858
;5856:					uiInfo.serverStatus.numDisplayServers,
;5857:					uiInfo.serverStatus.numPlayersOnServers);
;5858:	count = trap_LAN_GetServerCount(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 5859
;5859:	if (count - uiInfo.serverStatus.numDisplayServers > 0) {
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
SUBI4
CNSTI4 0
LEI4 $4543
line 5860
;5860:		Com_Printf("%d servers not listed due to packet loss or pings higher than %d\n",
ADDRGP4 $4550
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $4547
ARGP4
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+99264+10412
INDIRI4
SUBI4
ARGI4
ADDRLP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 5863
;5861:						count - uiInfo.serverStatus.numDisplayServers,
;5862:						(int) trap_Cvar_VariableValue("cl_maxPing"));
;5863:	}
LABELV $4543
line 5865
;5864:
;5865:}
LABELV $4530
endproc UI_StopServerRefresh 12 12
proc UI_DoServerRefresh 8 4
line 5890
;5866:
;5867:/*
;5868:=================
;5869:ArenaServers_MaxPing
;5870:=================
;5871:*/
;5872:#ifndef MISSIONPACK // bk001206
;5873:static int ArenaServers_MaxPing( void ) {
;5874:	int		maxPing;
;5875:
;5876:	maxPing = (int)trap_Cvar_VariableValue( "cl_maxPing" );
;5877:	if( maxPing < 100 ) {
;5878:		maxPing = 100;
;5879:	}
;5880:	return maxPing;
;5881:}
;5882:#endif
;5883:
;5884:/*
;5885:=================
;5886:UI_DoServerRefresh
;5887:=================
;5888:*/
;5889:static void UI_DoServerRefresh( void )
;5890:{
line 5891
;5891:	qboolean wait = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5893
;5892:
;5893:	if (!uiInfo.serverStatus.refreshActive) {
ADDRGP4 uiInfo+99264+2212
INDIRI4
CNSTI4 0
NEI4 $4552
line 5894
;5894:		return;
ADDRGP4 $4551
JUMPV
LABELV $4552
line 5896
;5895:	}
;5896:	if (ui_netSource.integer != AS_FAVORITES) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 3
EQI4 $4556
line 5897
;5897:		if (ui_netSource.integer == AS_LOCAL) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $4559
line 5898
;5898:			if (!trap_LAN_GetServerCount(ui_netSource.integer)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $4560
line 5899
;5899:				wait = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 5900
;5900:			}
line 5901
;5901:		} else {
ADDRGP4 $4560
JUMPV
LABELV $4559
line 5902
;5902:			if (trap_LAN_GetServerCount(ui_netSource.integer) < 0) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $4565
line 5903
;5903:				wait = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 5904
;5904:			}
LABELV $4565
line 5905
;5905:		}
LABELV $4560
line 5906
;5906:	}
LABELV $4556
line 5908
;5907:
;5908:	if (uiInfo.uiDC.realTime < uiInfo.serverStatus.refreshtime) {
ADDRGP4 uiInfo+208
INDIRI4
ADDRGP4 uiInfo+99264+2192
INDIRI4
GEI4 $4568
line 5909
;5909:		if (wait) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $4573
line 5910
;5910:			return;
ADDRGP4 $4551
JUMPV
LABELV $4573
line 5912
;5911:		}
;5912:	}
LABELV $4568
line 5915
;5913:
;5914:	// if still trying to retrieve pings
;5915:	if (trap_LAN_UpdateVisiblePings(ui_netSource.integer)) {
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_LAN_UpdateVisiblePings
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $4575
line 5916
;5916:		uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+99264+2192
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 5917
;5917:	} else if (!wait) {
ADDRGP4 $4576
JUMPV
LABELV $4575
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $4581
line 5919
;5918:		// get the last servers in the list
;5919:		UI_BuildServerDisplayList(2);
CNSTI4 2
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 5921
;5920:		// stop the refresh
;5921:		UI_StopServerRefresh();
ADDRGP4 UI_StopServerRefresh
CALLV
pop
line 5922
;5922:	}
LABELV $4581
LABELV $4576
line 5924
;5923:	//
;5924:	UI_BuildServerDisplayList(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_BuildServerDisplayList
CALLV
pop
line 5925
;5925:}
LABELV $4551
endproc UI_DoServerRefresh 8 4
proc UI_StartServerRefresh 68 24
line 5933
;5926:
;5927:/*
;5928:=================
;5929:UI_StartServerRefresh
;5930:=================
;5931:*/
;5932:static void UI_StartServerRefresh(qboolean full)
;5933:{
line 5938
;5934:	int		i;
;5935:	char	*ptr;
;5936:
;5937:	qtime_t q;
;5938:	trap_RealTime(&q);
ADDRLP4 0
ARGP4
ADDRGP4 trap_RealTime
CALLI4
pop
line 5939
;5939: 	trap_Cvar_Set( va("ui_lastServerRefresh_%i", ui_netSource.integer), va("%s-%i, %i at %i:%i", MonthAbbrev[q.tm_mon],q.tm_mday, 1900+q.tm_year,q.tm_hour,q.tm_min));
ADDRGP4 $1314
ARGP4
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $4585
ARGP4
ADDRLP4 0+16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 MonthAbbrev
ADDP4
INDIRP4
ARGP4
ADDRLP4 0+12
INDIRI4
ARGI4
ADDRLP4 0+20
INDIRI4
CNSTI4 1900
ADDI4
ARGI4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5941
;5940:
;5941:	if (!full) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $4591
line 5942
;5942:		UI_UpdatePendingPings();
ADDRGP4 UI_UpdatePendingPings
CALLV
pop
line 5943
;5943:		return;
ADDRGP4 $4583
JUMPV
LABELV $4591
line 5946
;5944:	}
;5945:
;5946:	uiInfo.serverStatus.refreshActive = qtrue;
ADDRGP4 uiInfo+99264+2212
CNSTI4 1
ASGNI4
line 5947
;5947:	uiInfo.serverStatus.nextDisplayRefresh = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+99264+10420
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 5949
;5948:	// clear number of displayed servers
;5949:	uiInfo.serverStatus.numDisplayServers = 0;
ADDRGP4 uiInfo+99264+10412
CNSTI4 0
ASGNI4
line 5950
;5950:	uiInfo.serverStatus.numPlayersOnServers = 0;
ADDRGP4 uiInfo+99264+10416
CNSTI4 0
ASGNI4
line 5952
;5951:	// mark all servers as visible so we store ping updates for them
;5952:	trap_LAN_MarkServerVisible(ui_netSource.integer, -1, qtrue);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_LAN_MarkServerVisible
CALLV
pop
line 5954
;5953:	// reset all the pings
;5954:	trap_LAN_ResetPings(ui_netSource.integer);
ADDRGP4 ui_netSource+12
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ResetPings
CALLV
pop
line 5956
;5955:	//
;5956:	if( ui_netSource.integer == AS_LOCAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 0
NEI4 $4604
line 5957
;5957:		trap_Cmd_ExecuteText( EXEC_NOW, "localservers\n" );
CNSTI4 0
ARGI4
ADDRGP4 $4607
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5958
;5958:		uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 1000;
ADDRGP4 uiInfo+99264+2192
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 5959
;5959:		return;
ADDRGP4 $4583
JUMPV
LABELV $4604
line 5962
;5960:	}
;5961:
;5962:	uiInfo.serverStatus.refreshtime = uiInfo.uiDC.realTime + 5000;
ADDRGP4 uiInfo+99264+2192
ADDRGP4 uiInfo+208
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 5963
;5963:	if( ui_netSource.integer == AS_GLOBAL || ui_netSource.integer == AS_MPLAYER ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
EQI4 $4618
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 1
NEI4 $4614
LABELV $4618
line 5964
;5964:		if( ui_netSource.integer == AS_GLOBAL ) {
ADDRGP4 ui_netSource+12
INDIRI4
CNSTI4 2
NEI4 $4619
line 5965
;5965:			i = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 5966
;5966:		}
ADDRGP4 $4620
JUMPV
LABELV $4619
line 5967
;5967:		else {
line 5968
;5968:			i = 1;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 5969
;5969:		}
LABELV $4620
line 5971
;5970:
;5971:		ptr = UI_Cvar_VariableString("debug_protocol");
ADDRGP4 $4237
ARGP4
ADDRLP4 52
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 52
INDIRP4
ASGNP4
line 5972
;5972:		if (strlen(ptr)) {
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $4622
line 5973
;5973:			trap_Cmd_ExecuteText( EXEC_NOW, va( "globalservers %d %s full empty\n", i, ptr));
ADDRGP4 $4624
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5974
;5974:		}
ADDRGP4 $4623
JUMPV
LABELV $4622
line 5975
;5975:		else {
line 5976
;5976:			trap_Cmd_ExecuteText( EXEC_NOW, va( "globalservers %d %d full empty\n", i, (int)trap_Cvar_VariableValue( "protocol" ) ) );
ADDRGP4 $2136
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $4625
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 60
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 5977
;5977:		}
LABELV $4623
line 5978
;5978:	}
LABELV $4614
line 5979
;5979:}
LABELV $4583
endproc UI_StartServerRefresh 68 24
bss
export ui_realWarmUp
align 4
LABELV ui_realWarmUp
skip 272
export ui_realCaptureLimit
align 4
LABELV ui_realCaptureLimit
skip 272
export ui_recordSPDemo
align 4
LABELV ui_recordSPDemo
skip 272
export ui_hudFiles
align 4
LABELV ui_hudFiles
skip 272
export ui_Q3Model
align 4
LABELV ui_Q3Model
skip 272
export ui_findPlayer
align 4
LABELV ui_findPlayer
skip 272
export ui_scoreCaptures
align 4
LABELV ui_scoreCaptures
skip 272
export ui_teamName
align 4
LABELV ui_teamName
skip 272
export ui_blueteam5
align 4
LABELV ui_blueteam5
skip 272
export ui_blueteam4
align 4
LABELV ui_blueteam4
skip 272
export ui_blueteam3
align 4
LABELV ui_blueteam3
skip 272
export ui_blueteam2
align 4
LABELV ui_blueteam2
skip 272
export ui_blueteam1
align 4
LABELV ui_blueteam1
skip 272
export ui_blueteam
align 4
LABELV ui_blueteam
skip 272
export ui_redteam5
align 4
LABELV ui_redteam5
skip 272
export ui_redteam4
align 4
LABELV ui_redteam4
skip 272
export ui_redteam3
align 4
LABELV ui_redteam3
skip 272
export ui_redteam2
align 4
LABELV ui_redteam2
skip 272
export ui_redteam1
align 4
LABELV ui_redteam1
skip 272
export ui_redteam
align 4
LABELV ui_redteam
skip 272
align 1
LABELV lastLoadingText
skip 1024
align 4
LABELV lastConnState
skip 4
export startTime
align 4
LABELV startTime
skip 4
export ui_teamArenaFirstRun
align 4
LABELV ui_teamArenaFirstRun
skip 272
export ui_initialized
align 4
LABELV ui_initialized
skip 272
export ui_debug
align 4
LABELV ui_debug
skip 272
export ui_new
align 4
LABELV ui_new
skip 272
import ProcessNewUI
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
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
import UI_GetBotNameByNumber
import UI_LoadBots
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
import trap_VerifyCDKey
import trap_R_RemapShader
import trap_RealTime
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_S_StartBackgroundTrack
import trap_S_StopBackgroundTrack
import trap_R_RegisterFont
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_CompareServers
import trap_LAN_ServerStatus
import trap_LAN_ResetPings
import trap_LAN_RemoveServer
import trap_LAN_AddServer
import trap_LAN_UpdateVisiblePings
import trap_LAN_ServerIsVisible
import trap_LAN_MarkServerVisible
import trap_LAN_SaveCachedServers
import trap_LAN_LoadCachedServers
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerPing
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
import trap_R_ModelBounds
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
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import UI_LoadBestScores
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
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
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawSides
import UI_DrawTopBottom
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
export uiInfo
align 4
LABELV uiInfo
skip 136912
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
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_MainMenu
import MainMenu_Cache
import UI_LoadArenas
import UI_ClearScores
import UI_AdjustTimeByGame
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
export ui_serverStatusTimeOut
align 4
LABELV ui_serverStatusTimeOut
skip 272
export ui_bigFont
align 4
LABELV ui_bigFont
skip 272
export ui_smallFont
align 4
LABELV ui_smallFont
skip 272
export ui_scoreTime
align 4
LABELV ui_scoreTime
skip 272
export ui_scoreShutoutBonus
align 4
LABELV ui_scoreShutoutBonus
skip 272
export ui_scoreSkillBonus
align 4
LABELV ui_scoreSkillBonus
skip 272
export ui_scoreTimeBonus
align 4
LABELV ui_scoreTimeBonus
skip 272
export ui_scoreBase
align 4
LABELV ui_scoreBase
skip 272
export ui_scoreTeam
align 4
LABELV ui_scoreTeam
skip 272
export ui_scorePerfect
align 4
LABELV ui_scorePerfect
skip 272
export ui_scoreScore
align 4
LABELV ui_scoreScore
skip 272
export ui_scoreGauntlets
align 4
LABELV ui_scoreGauntlets
skip 272
export ui_scoreAssists
align 4
LABELV ui_scoreAssists
skip 272
export ui_scoreDefends
align 4
LABELV ui_scoreDefends
skip 272
export ui_scoreExcellents
align 4
LABELV ui_scoreExcellents
skip 272
export ui_scoreImpressives
align 4
LABELV ui_scoreImpressives
skip 272
export ui_scoreAccuracy
align 4
LABELV ui_scoreAccuracy
skip 272
export ui_singlePlayerActive
align 4
LABELV ui_singlePlayerActive
skip 272
export ui_lastServerRefresh_3
align 4
LABELV ui_lastServerRefresh_3
skip 272
export ui_lastServerRefresh_2
align 4
LABELV ui_lastServerRefresh_2
skip 272
export ui_lastServerRefresh_1
align 4
LABELV ui_lastServerRefresh_1
skip 272
export ui_lastServerRefresh_0
align 4
LABELV ui_lastServerRefresh_0
skip 272
export ui_selectedPlayerName
align 4
LABELV ui_selectedPlayerName
skip 272
export ui_selectedPlayer
align 4
LABELV ui_selectedPlayer
skip 272
export ui_currentOpponent
align 4
LABELV ui_currentOpponent
skip 272
export ui_mapIndex
align 4
LABELV ui_mapIndex
skip 272
export ui_currentNetMap
align 4
LABELV ui_currentNetMap
skip 272
export ui_currentMap
align 4
LABELV ui_currentMap
skip 272
export ui_currentTier
align 4
LABELV ui_currentTier
skip 272
export ui_menuFiles
align 4
LABELV ui_menuFiles
skip 272
export ui_opponentName
align 4
LABELV ui_opponentName
skip 272
export ui_dedicated
align 4
LABELV ui_dedicated
skip 272
export ui_serverFilterType
align 4
LABELV ui_serverFilterType
skip 272
export ui_netSource
align 4
LABELV ui_netSource
skip 272
export ui_joinGameType
align 4
LABELV ui_joinGameType
skip 272
export ui_actualNetGameType
align 4
LABELV ui_actualNetGameType
skip 272
export ui_netGameType
align 4
LABELV ui_netGameType
skip 272
export ui_gameType
align 4
LABELV ui_gameType
skip 272
export ui_fragLimit
align 4
LABELV ui_fragLimit
skip 272
export ui_captureLimit
align 4
LABELV ui_captureLimit
skip 272
export ui_cdkeychecked
align 4
LABELV ui_cdkeychecked
skip 272
import ui_cdkey
export ui_server16
align 4
LABELV ui_server16
skip 272
export ui_server15
align 4
LABELV ui_server15
skip 272
export ui_server14
align 4
LABELV ui_server14
skip 272
export ui_server13
align 4
LABELV ui_server13
skip 272
export ui_server12
align 4
LABELV ui_server12
skip 272
export ui_server11
align 4
LABELV ui_server11
skip 272
export ui_server10
align 4
LABELV ui_server10
skip 272
export ui_server9
align 4
LABELV ui_server9
skip 272
export ui_server8
align 4
LABELV ui_server8
skip 272
export ui_server7
align 4
LABELV ui_server7
skip 272
export ui_server6
align 4
LABELV ui_server6
skip 272
export ui_server5
align 4
LABELV ui_server5
skip 272
export ui_server4
align 4
LABELV ui_server4
skip 272
export ui_server3
align 4
LABELV ui_server3
skip 272
export ui_server2
align 4
LABELV ui_server2
skip 272
export ui_server1
align 4
LABELV ui_server1
skip 272
export ui_marks
align 4
LABELV ui_marks
skip 272
export ui_drawCrosshairNames
align 4
LABELV ui_drawCrosshairNames
skip 272
export ui_drawCrosshair
align 4
LABELV ui_drawCrosshair
skip 272
export ui_brassTime
align 4
LABELV ui_brassTime
skip 272
export ui_browserShowEmpty
align 4
LABELV ui_browserShowEmpty
skip 272
export ui_browserShowFull
align 4
LABELV ui_browserShowFull
skip 272
export ui_browserSortKey
align 4
LABELV ui_browserSortKey
skip 272
export ui_browserGameType
align 4
LABELV ui_browserGameType
skip 272
export ui_browserMaster
align 4
LABELV ui_browserMaster
skip 272
export ui_spSelection
align 4
LABELV ui_spSelection
skip 272
export ui_spSkill
align 4
LABELV ui_spSkill
skip 272
export ui_spVideos
align 4
LABELV ui_spVideos
skip 272
export ui_spAwards
align 4
LABELV ui_spAwards
skip 272
export ui_spScores5
align 4
LABELV ui_spScores5
skip 272
export ui_spScores4
align 4
LABELV ui_spScores4
skip 272
export ui_spScores3
align 4
LABELV ui_spScores3
skip 272
export ui_spScores2
align 4
LABELV ui_spScores2
skip 272
export ui_spScores1
align 4
LABELV ui_spScores1
skip 272
export ui_botsFile
align 4
LABELV ui_botsFile
skip 272
export ui_arenasFile
align 4
LABELV ui_arenasFile
skip 272
export ui_ctf_friendly
align 4
LABELV ui_ctf_friendly
skip 272
export ui_ctf_timelimit
align 4
LABELV ui_ctf_timelimit
skip 272
export ui_ctf_capturelimit
align 4
LABELV ui_ctf_capturelimit
skip 272
export ui_team_friendly
align 4
LABELV ui_team_friendly
skip 272
export ui_team_timelimit
align 4
LABELV ui_team_timelimit
skip 272
export ui_team_fraglimit
align 4
LABELV ui_team_fraglimit
skip 272
export ui_tourney_timelimit
align 4
LABELV ui_tourney_timelimit
skip 272
export ui_tourney_fraglimit
align 4
LABELV ui_tourney_fraglimit
skip 272
export ui_ffa_timelimit
align 4
LABELV ui_ffa_timelimit
skip 272
export ui_ffa_fraglimit
align 4
LABELV ui_ffa_fraglimit
skip 272
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
LABELV $4625
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $4624
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $4607
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $4585
byte 1 37
byte 1 115
byte 1 45
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $4550
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $4547
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $4537
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $4519
byte 1 55
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $4518
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 79
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $4517
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 70
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 82
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $4516
byte 1 117
byte 1 105
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $4515
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 117
byte 1 100
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4514
byte 1 117
byte 1 105
byte 1 95
byte 1 113
byte 1 51
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $4513
byte 1 83
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $4512
byte 1 48
byte 1 46
byte 1 52
byte 1 0
align 1
LABELV $4511
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $4510
byte 1 48
byte 1 46
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $4509
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $4508
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 104
byte 1 117
byte 1 116
byte 1 111
byte 1 117
byte 1 116
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $4507
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $4506
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 66
byte 1 111
byte 1 110
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $4505
byte 1 48
byte 1 48
byte 1 58
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $4504
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4503
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $4502
byte 1 48
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 48
byte 1 0
align 1
LABELV $4501
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $4500
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $4499
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $4498
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $4497
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 65
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $4496
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $4495
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4494
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $4493
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 73
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4492
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $4491
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 51
byte 1 0
align 1
LABELV $4490
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 50
byte 1 0
align 1
LABELV $4489
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $4488
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $4487
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 79
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $4486
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 53
byte 1 0
align 1
LABELV $4485
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 52
byte 1 0
align 1
LABELV $4484
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 51
byte 1 0
align 1
LABELV $4483
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 50
byte 1 0
align 1
LABELV $4482
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 49
byte 1 0
align 1
LABELV $4481
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 53
byte 1 0
align 1
LABELV $4480
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 52
byte 1 0
align 1
LABELV $4479
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 51
byte 1 0
align 1
LABELV $4478
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 50
byte 1 0
align 1
LABELV $4477
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 49
byte 1 0
align 1
LABELV $4476
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 78
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4475
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4474
byte 1 117
byte 1 105
byte 1 95
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4473
byte 1 51
byte 1 0
align 1
LABELV $4472
byte 1 117
byte 1 105
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
LABELV $4471
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $4470
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $4469
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $4468
byte 1 83
byte 1 116
byte 1 114
byte 1 111
byte 1 103
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $4467
byte 1 80
byte 1 97
byte 1 103
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $4466
byte 1 117
byte 1 105
byte 1 95
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $4465
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 0
align 1
LABELV $4464
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 119
byte 1 0
align 1
LABELV $4463
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $4462
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $4461
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $4460
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 52
byte 1 0
align 1
LABELV $4459
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $4458
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $4457
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $4456
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $4455
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 57
byte 1 0
align 1
LABELV $4454
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 56
byte 1 0
align 1
LABELV $4453
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 55
byte 1 0
align 1
LABELV $4452
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 54
byte 1 0
align 1
LABELV $4451
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 53
byte 1 0
align 1
LABELV $4450
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 52
byte 1 0
align 1
LABELV $4449
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 51
byte 1 0
align 1
LABELV $4448
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $4447
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $4446
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $4445
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4444
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $4443
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $4442
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $4441
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $4440
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $4439
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $4438
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
LABELV $4437
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $4436
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $4435
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 53
byte 1 0
align 1
LABELV $4434
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 52
byte 1 0
align 1
LABELV $4433
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 51
byte 1 0
align 1
LABELV $4432
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $4431
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 49
byte 1 0
align 1
LABELV $4430
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $4429
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $4428
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $4427
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4426
byte 1 56
byte 1 0
align 1
LABELV $4425
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4424
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $4423
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4422
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4421
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4420
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4419
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4418
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $4409
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $4406
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4403
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $4400
byte 1 65
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 46
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $4390
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $4387
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4386
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 117
byte 1 112
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $4385
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $4381
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4374
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $4372
byte 1 37
byte 1 115
byte 1 47
byte 1 83
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $4369
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $4360
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $4359
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $4355
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 37
byte 1 37
byte 1 41
byte 1 0
align 1
LABELV $4352
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4351
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $4350
byte 1 99
byte 1 108
byte 1 95
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $4323
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $4322
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $4319
byte 1 37
byte 1 100
byte 1 32
byte 1 104
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $4315
byte 1 37
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4314
byte 1 37
byte 1 100
byte 1 32
byte 1 75
byte 1 66
byte 1 0
align 1
LABELV $4311
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 77
byte 1 66
byte 1 0
align 1
LABELV $4308
byte 1 46
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 32
byte 1 71
byte 1 66
byte 1 0
align 1
LABELV $4302
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4300
byte 1 101
byte 1 110
byte 1 100
byte 1 111
byte 1 102
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4292
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 95
byte 1 112
byte 1 111
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $4237
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $4236
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $4235
byte 1 115
byte 1 95
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4234
byte 1 48
byte 1 46
byte 1 56
byte 1 0
align 1
LABELV $4233
byte 1 115
byte 1 95
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $4232
byte 1 117
byte 1 105
byte 1 95
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 70
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 82
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $4214
byte 1 117
byte 1 105
byte 1 47
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $4210
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $4206
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $4204
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 51
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $4131
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
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4112
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $4111
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
byte 1 0
align 1
LABELV $4108
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $4107
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $4106
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 0
align 1
LABELV $4098
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $4097
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
byte 1 0
align 1
LABELV $4095
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $4094
byte 1 46
byte 1 0
align 1
LABELV $4084
byte 1 47
byte 1 0
align 1
LABELV $4083
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
byte 1 0
align 1
LABELV $4035
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $4030
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4025
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $4010
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $4002
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
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $3946
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $3941
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 110
byte 1 101
byte 1 116
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $3899
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $3896
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $3891
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $3874
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $3864
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3836
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $3826
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3819
byte 1 109
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $3816
byte 1 74
byte 1 97
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $3812
byte 1 102
byte 1 101
byte 1 109
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $3807
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
byte 1 104
byte 1 101
byte 1 97
byte 1 100
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
LABELV $3780
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $3773
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3615
byte 1 42
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $3512
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $3511
byte 1 89
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $3508
byte 1 112
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3506
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $3502
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $3498
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $3495
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $3494
byte 1 110
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $3493
byte 1 37
byte 1 115
byte 1 32
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 0
align 1
LABELV $3316
byte 1 115
byte 1 0
align 1
LABELV $3313
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 37
byte 1 115
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $3308
byte 1 110
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $3224
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 100
byte 1 47
byte 1 37
byte 1 100
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $3166
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $3158
byte 1 99
byte 1 108
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 110
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3147
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $3102
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $3101
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $3100
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $3062
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $3061
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $3060
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $3059
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3058
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $3057
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3056
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3055
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $3054
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3053
byte 1 115
byte 1 118
byte 1 95
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3037
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $3025
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
LABELV $3005
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2962
byte 1 87
byte 1 101
byte 1 108
byte 1 99
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 33
byte 1 0
align 1
LABELV $2951
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $2794
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
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2791
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
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2755
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 85
byte 1 73
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2752
byte 1 115
byte 1 101
byte 1 116
byte 1 80
byte 1 98
byte 1 67
byte 1 108
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $2747
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2744
byte 1 52
byte 1 0
align 1
LABELV $2743
byte 1 103
byte 1 108
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $2734
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2726
byte 1 118
byte 1 111
byte 1 105
byte 1 99
byte 1 101
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2714
byte 1 10
byte 1 0
align 1
LABELV $2707
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2698
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $2697
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2693
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2680
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2677
byte 1 65
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2676
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $2673
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $2668
byte 1 97
byte 1 100
byte 1 100
byte 1 114
byte 1 0
align 1
LABELV $2667
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2658
byte 1 97
byte 1 100
byte 1 100
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2642
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2639
byte 1 97
byte 1 100
byte 1 100
byte 1 66
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $2634
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
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2628
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 76
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2622
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
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
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $2616
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2611
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2605
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 75
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $2599
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2593
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $2590
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 105
byte 1 110
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2587
byte 1 83
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $2584
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $2568
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $2565
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $2564
byte 1 76
byte 1 101
byte 1 97
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $2561
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 50
byte 1 0
align 1
LABELV $2560
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2559
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $2556
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2555
byte 1 81
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2545
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2542
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2528
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2523
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2516
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $2506
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $2500
byte 1 85
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2493
byte 1 83
byte 1 116
byte 1 111
byte 1 112
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $2490
byte 1 109
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2489
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2480
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $2477
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $2472
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2471
byte 1 82
byte 1 117
byte 1 110
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $2468
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 59
byte 1 0
align 1
LABELV $2465
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2464
byte 1 82
byte 1 117
byte 1 110
byte 1 77
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $2459
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 114
byte 1 111
byte 1 113
byte 1 32
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $2454
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 77
byte 1 111
byte 1 118
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $2451
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 77
byte 1 111
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $2448
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 77
byte 1 111
byte 1 118
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2445
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $2436
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $2432
byte 1 82
byte 1 117
byte 1 110
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $2429
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2426
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2423
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2414
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $2411
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $2410
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 114
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $2407
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $2404
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $2401
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2400
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $2397
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $2396
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 32
byte 1 65
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 114
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $2395
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $2394
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 115
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $2391
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $2390
byte 1 118
byte 1 101
byte 1 114
byte 1 105
byte 1 102
byte 1 121
byte 1 67
byte 1 68
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $2382
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 52
byte 1 0
align 1
LABELV $2381
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 51
byte 1 0
align 1
LABELV $2380
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 50
byte 1 0
align 1
LABELV $2379
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 49
byte 1 0
align 1
LABELV $2378
byte 1 103
byte 1 101
byte 1 116
byte 1 67
byte 1 68
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $2375
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $2374
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2373
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $2372
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2371
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2364
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 83
byte 1 80
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $2354
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $2351
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2322
byte 1 100
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2321
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2315
byte 1 109
byte 1 95
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $2312
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 111
byte 1 117
byte 1 115
byte 1 101
byte 1 80
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $2307
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 0
align 1
LABELV $2304
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 0
align 1
LABELV $2303
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $2302
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2301
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 115
byte 1 0
align 1
LABELV $2300
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 0
align 1
LABELV $2299
byte 1 114
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 107
byte 1 121
byte 1 0
align 1
LABELV $2298
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2297
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $2296
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 109
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $2295
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $2294
byte 1 114
byte 1 95
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 83
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $2290
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 108
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $2285
byte 1 114
byte 1 95
byte 1 115
byte 1 117
byte 1 98
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $2281
byte 1 114
byte 1 95
byte 1 108
byte 1 111
byte 1 100
byte 1 98
byte 1 105
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $2274
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2273
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2269
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2266
byte 1 117
byte 1 105
byte 1 95
byte 1 71
byte 1 101
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2261
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 100
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2260
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2257
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2256
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 101
byte 1 116
byte 1 82
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2253
byte 1 117
byte 1 105
byte 1 95
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2252
byte 1 117
byte 1 105
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2248
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 53
byte 1 59
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2224
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2210
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $2209
byte 1 50
byte 1 0
align 1
LABELV $2206
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2202
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2201
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 83
byte 1 80
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $2198
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2197
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2196
byte 1 117
byte 1 105
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2195
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2194
byte 1 117
byte 1 105
byte 1 95
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2193
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2192
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2191
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2190
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2189
byte 1 103
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2188
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2187
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $2186
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2185
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $2184
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2183
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2182
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $2179
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $2175
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 59
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2169
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $2165
byte 1 115
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $2139
byte 1 46
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $2138
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $2136
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $2135
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $2132
byte 1 46
byte 1 114
byte 1 111
byte 1 113
byte 1 0
align 1
LABELV $2117
byte 1 114
byte 1 111
byte 1 113
byte 1 0
align 1
LABELV $2116
byte 1 118
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 0
align 1
LABELV $2107
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2092
byte 1 36
byte 1 109
byte 1 111
byte 1 100
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $2044
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $2022
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $1929
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $1818
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 110
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1787
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1756
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $1737
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1540
byte 1 80
byte 1 73
byte 1 88
byte 1 69
byte 1 76
byte 1 70
byte 1 79
byte 1 82
byte 1 77
byte 1 65
byte 1 84
byte 1 58
byte 1 32
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 90
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $1536
byte 1 86
byte 1 69
byte 1 82
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1533
byte 1 86
byte 1 69
byte 1 78
byte 1 68
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1425
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1422
byte 1 71
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 40
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 41
byte 1 0
align 1
LABELV $1409
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1399
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1391
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1371
byte 1 110
byte 1 0
align 1
LABELV $1360
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
LABELV $1359
byte 1 116
byte 1 0
align 1
LABELV $1358
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $1323
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
LABELV $1314
byte 1 117
byte 1 105
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 82
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1312
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 78
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 67
byte 1 76
byte 1 73
byte 1 67
byte 1 75
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 44
byte 1 32
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 66
byte 1 65
byte 1 67
byte 1 75
byte 1 83
byte 1 80
byte 1 65
byte 1 67
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $1311
byte 1 87
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 46
byte 1 46
byte 1 46
byte 1 32
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 83
byte 1 67
byte 1 65
byte 1 80
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1276
byte 1 37
byte 1 105
byte 1 46
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1099
byte 1 117
byte 1 105
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1092
byte 1 117
byte 1 105
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1087
byte 1 74
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1039
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
byte 1 0
align 1
LABELV $1026
byte 1 84
byte 1 105
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1021
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 84
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1018
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $984
byte 1 83
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $967
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $966
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $963
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $962
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $961
byte 1 117
byte 1 105
byte 1 95
byte 1 81
byte 1 51
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $918
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $903
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
LABELV $888
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $886
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 101
byte 1 116
byte 1 77
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $856
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $853
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $847
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $846
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $840
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $839
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $838
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $831
byte 1 117
byte 1 105
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $830
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $824
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
LABELV $790
byte 1 37
byte 1 115
byte 1 46
byte 1 114
byte 1 111
byte 1 113
byte 1 0
align 1
LABELV $771
byte 1 37
byte 1 115
byte 1 95
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $766
byte 1 37
byte 1 115
byte 1 95
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $738
byte 1 117
byte 1 105
byte 1 95
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $728
byte 1 117
byte 1 105
byte 1 95
byte 1 97
byte 1 99
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 78
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $727
byte 1 117
byte 1 105
byte 1 95
byte 1 110
byte 1 101
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $716
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $715
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $714
byte 1 117
byte 1 105
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $713
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $712
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $698
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $696
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $694
byte 1 53
byte 1 0
align 1
LABELV $693
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $692
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $691
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $690
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $689
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $688
byte 1 51
byte 1 53
byte 1 0
align 1
LABELV $687
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $686
byte 1 52
byte 1 53
byte 1 0
align 1
LABELV $685
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $684
byte 1 53
byte 1 53
byte 1 0
align 1
LABELV $683
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $682
byte 1 54
byte 1 53
byte 1 0
align 1
LABELV $681
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $680
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $679
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $678
byte 1 56
byte 1 53
byte 1 0
align 1
LABELV $677
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $676
byte 1 57
byte 1 53
byte 1 0
align 1
LABELV $675
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $674
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $668
byte 1 117
byte 1 105
byte 1 95
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $666
byte 1 85
byte 1 73
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $663
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 0
align 1
LABELV $643
byte 1 94
byte 1 49
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 117
byte 1 105
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 44
byte 1 32
byte 1 117
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 105
byte 1 110
byte 1 117
byte 1 101
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $640
byte 1 117
byte 1 105
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $639
byte 1 94
byte 1 51
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $617
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 100
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $611
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 71
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 68
byte 1 101
byte 1 102
byte 1 0
align 1
LABELV $597
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $591
byte 1 71
byte 1 108
byte 1 121
byte 1 112
byte 1 104
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $586
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 10
byte 1 0
align 1
LABELV $585
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 10
byte 1 0
align 1
LABELV $574
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $566
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 89
byte 1 0
align 1
LABELV $558
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 88
byte 1 0
align 1
LABELV $550
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 65
byte 1 109
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $542
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $534
byte 1 102
byte 1 97
byte 1 100
byte 1 101
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $522
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $514
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 66
byte 1 117
byte 1 122
byte 1 122
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $506
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 70
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $498
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $490
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 69
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $482
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $473
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $464
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $453
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $449
byte 1 125
byte 1 0
align 1
LABELV $440
byte 1 123
byte 1 0
align 1
LABELV $433
byte 1 94
byte 1 49
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $430
byte 1 94
byte 1 49
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $395
byte 1 49
byte 1 0
align 1
LABELV $394
byte 1 115
byte 1 118
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $393
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
LABELV $392
byte 1 48
byte 1 0
align 1
LABELV $391
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
LABELV $228
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 110
byte 1 101
byte 1 119
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $226
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $219
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 95
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $216
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 108
byte 1 105
byte 1 100
byte 1 101
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $213
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 116
byte 1 104
byte 1 117
byte 1 109
byte 1 98
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $210
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $207
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $204
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 117
byte 1 112
byte 1 95
byte 1 97
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $201
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 100
byte 1 119
byte 1 110
byte 1 95
byte 1 97
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $198
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $195
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
byte 1 120
byte 1 95
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $191
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
byte 1 120
byte 1 95
byte 1 99
byte 1 121
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $187
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
byte 1 120
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $183
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
byte 1 120
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $179
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
byte 1 120
byte 1 95
byte 1 103
byte 1 114
byte 1 110
byte 1 0
align 1
LABELV $175
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
byte 1 120
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $171
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
byte 1 120
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $168
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
byte 1 120
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $165
byte 1 117
byte 1 105
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 98
byte 1 97
byte 1 114
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $146
byte 1 73
byte 1 80
byte 1 88
byte 1 0
align 1
LABELV $145
byte 1 85
byte 1 68
byte 1 80
byte 1 0
align 1
LABELV $144
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $143
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $142
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $141
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 112
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $140
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $139
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $138
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $137
byte 1 72
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $136
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $135
byte 1 79
byte 1 110
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $134
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $133
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
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
byte 1 0
align 1
LABELV $132
byte 1 83
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $131
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $130
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $129
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 84
byte 1 79
byte 1 85
byte 1 82
byte 1 78
byte 1 65
byte 1 77
byte 1 69
byte 1 78
byte 1 84
byte 1 0
align 1
LABELV $128
byte 1 72
byte 1 65
byte 1 82
byte 1 86
byte 1 69
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $127
byte 1 79
byte 1 86
byte 1 69
byte 1 82
byte 1 76
byte 1 79
byte 1 65
byte 1 68
byte 1 0
align 1
LABELV $126
byte 1 49
byte 1 70
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $125
byte 1 67
byte 1 84
byte 1 70
byte 1 0
align 1
LABELV $124
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 68
byte 1 77
byte 1 0
align 1
LABELV $123
byte 1 83
byte 1 80
byte 1 0
align 1
LABELV $122
byte 1 84
byte 1 79
byte 1 85
byte 1 82
byte 1 78
byte 1 65
byte 1 77
byte 1 69
byte 1 78
byte 1 84
byte 1 0
align 1
LABELV $121
byte 1 70
byte 1 70
byte 1 65
byte 1 0
align 1
LABELV $120
byte 1 111
byte 1 115
byte 1 112
byte 1 0
align 1
LABELV $119
byte 1 79
byte 1 83
byte 1 80
byte 1 0
align 1
LABELV $118
byte 1 119
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $117
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 70
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $116
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $115
byte 1 65
byte 1 108
byte 1 108
byte 1 105
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $114
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $113
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $112
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $111
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $110
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 51
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $109
byte 1 0
align 1
LABELV $108
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $107
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $106
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $105
byte 1 77
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $104
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $103
byte 1 78
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $102
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $101
byte 1 72
byte 1 117
byte 1 114
byte 1 116
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $100
byte 1 66
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 73
byte 1 116
byte 1 32
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $99
byte 1 73
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 32
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $98
byte 1 68
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $97
byte 1 78
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $96
byte 1 79
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $95
byte 1 83
byte 1 101
byte 1 112
byte 1 0
align 1
LABELV $94
byte 1 65
byte 1 117
byte 1 103
byte 1 0
align 1
LABELV $93
byte 1 74
byte 1 117
byte 1 108
byte 1 0
align 1
LABELV $92
byte 1 74
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $91
byte 1 77
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $90
byte 1 65
byte 1 112
byte 1 114
byte 1 0
align 1
LABELV $89
byte 1 77
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $88
byte 1 70
byte 1 101
byte 1 98
byte 1 0
align 1
LABELV $87
byte 1 74
byte 1 97
byte 1 110
byte 1 0
