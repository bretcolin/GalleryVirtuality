data
align 4
LABELV master_items
address $67
address $68
address $69
byte 4 0
align 4
LABELV servertype_items
address $70
address $71
byte 4 0
align 4
LABELV sortkey_items
address $72
address $73
address $74
address $75
address $76
byte 4 0
align 4
LABELV gamenames
address $77
byte 4 0
align 4
LABELV netnames
address $78
address $79
address $80
byte 4 0
code
proc ArenaServers_MaxPing 8 4
file "../ui_servers2.c"
line 215
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:MULTIPLAYER MENU (SERVER BROWSER)
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define MAX_GLOBALSERVERS		128
;16:#define MAX_PINGREQUESTS		32
;17:#define MAX_ADDRESSLENGTH		64
;18:#define MAX_HOSTNAMELENGTH		22
;19:#define MAX_MAPNAMELENGTH		16
;20:#define MAX_LISTBOXITEMS		128
;21:#define MAX_LOCALSERVERS		128
;22:#define MAX_STATUSLENGTH		64
;23:#define MAX_LEAGUELENGTH		28
;24:#define MAX_LISTBOXWIDTH		68
;25:
;26:#define ART_BACK0				"menu/art/back_0"
;27:#define ART_BACK1				"menu/art/back_1"
;28:#define ART_CREATE0				"menu/art/create_0"
;29:#define ART_CREATE1				"menu/art/create_1"
;30:#define ART_SPECIFY0			"menu/art/specify_0"
;31:#define ART_SPECIFY1			"menu/art/specify_1"
;32:#define ART_REFRESH0			"menu/art/refresh_0"
;33:#define ART_REFRESH1			"menu/art/refresh_1"
;34:#define ART_CONNECT0			"menu/art/fight_0"
;35:#define ART_CONNECT1			"menu/art/fight_1"
;36:#define ART_ARROWS0				"menu/art/arrows_vert_0"
;37:#define ART_ARROWS_UP			"menu/art/arrows_vert_top"
;38:#define ART_ARROWS_DOWN			"menu/art/arrows_vert_bot"
;39:#define ART_UNKNOWNMAP			"menu/art/unknownmap"
;40:#define ART_REMOVE0				"menu/art/delete_0"
;41:#define ART_REMOVE1				"menu/art/delete_1"
;42:
;43:#define ID_MASTER			10
;44:#define ID_GAMETYPE			11
;45:#define ID_SORTKEY			12
;46:#define ID_SHOW_FULL		13
;47:#define ID_SHOW_EMPTY		14
;48:#define ID_LIST				15
;49:#define ID_SCROLL_UP		16
;50:#define ID_SCROLL_DOWN		17
;51:#define ID_BACK				18
;52:#define ID_REFRESH			19
;53:#define ID_SPECIFY			20
;54:#define ID_CREATE			21
;55:#define ID_CONNECT			22
;56:#define ID_REMOVE			23
;57://#define ID_PUNKBUSTER 24
;58:
;59:#define GR_LOGO				30
;60:#define GR_LETTERS			31
;61:
;62:#define AS_LOCAL			0
;63:#define AS_MPLAYER			1
;64:#define AS_GLOBAL			2
;65:#define AS_FAVORITES		3
;66:
;67:#define SORT_HOST			0
;68:#define SORT_MAP			1
;69:#define SORT_CLIENTS		2
;70:#define SORT_GAME			3
;71:#define SORT_PING			4
;72:
;73:#define GAMES_ALL			0
;74:#define GAMES_GALLERIES			1
;75://#define GAMES_TEAMPLAY		2
;76://#define GAMES_TOURNEY		3
;77://#define GAMES_CTF			4
;78:
;79:static const char *master_items[] = {
;80:	"Local",
;81:	"Internet",
;82:	"Favorites",
;83:	0
;84:};
;85:
;86:static const char *servertype_items[] = {
;87:	"All",
;88:	"Galleries",
;89:	0
;90:};
;91:
;92:static const char *sortkey_items[] = {
;93:	"Server Name",
;94:	"Map Name",
;95:	"Open Player Spots",
;96:	"Game Type",
;97:	"Ping Time",
;98:	0
;99:};
;100:
;101:static char* gamenames[] = {
;102://	"DM ",	// deathmatch
;103://	"1v1",	// tournament
;104://	"SP ",	// single player
;105://	"Team DM",	// team deathmatch
;106://	"CTF",	// capture the flag
;107://	"One Flag CTF",		// one flag ctf
;108://	"OverLoad",				// Overload
;109://	"Harvester",			// Harvester
;110://	"Rocket Arena 3",	// Rocket Arena 3
;111://	"Q3F",						// Q3F
;112://	"Urban Terror",		// Urban Terror
;113://	"OSP",						// Orange Smoothie Productions
;114:	"Gallery",			// unknown
;115:	0
;116:};
;117:
;118:static char* netnames[] = {
;119:	"???",
;120:	"UDP",
;121:	"IPX",
;122:	NULL
;123:};
;124:
;125:typedef struct {
;126:	char	adrstr[MAX_ADDRESSLENGTH];
;127:	int		start;
;128:} pinglist_t;
;129:
;130:typedef struct servernode_s {
;131:	char	adrstr[MAX_ADDRESSLENGTH];
;132:	char	hostname[MAX_HOSTNAMELENGTH+3];
;133:	char	mapname[MAX_MAPNAMELENGTH];
;134:	int		numclients;
;135:	int		maxclients;
;136:	int		pingtime;
;137:	int		gametype;
;138:	char	gamename[12];
;139:	int		nettype;
;140:	int		minPing;
;141:	int		maxPing;
;142:
;143:} servernode_t; 
;144:
;145:typedef struct {
;146:	char			buff[MAX_LISTBOXWIDTH];
;147:	servernode_t*	servernode;
;148:} table_t;
;149:
;150:typedef struct {
;151:	menuframework_s		menu;
;152:
;153:	menutext_s			banner;
;154:
;155:	menulist_s			master;
;156:	menulist_s			gametype;
;157:	menulist_s			sortkey;
;158:	menuradiobutton_s	showfull;
;159:	menuradiobutton_s	showempty;
;160:
;161:	menulist_s			list;
;162:	menubitmap_s		mappic;
;163:	menubitmap_s		arrows;
;164:	menubitmap_s		up;
;165:	menubitmap_s		down;
;166:	menutext_s			status;
;167:	menutext_s			statusbar;
;168:
;169:	menubitmap_s		remove;
;170:	menubitmap_s		back;
;171:	menubitmap_s		refresh;
;172:	menubitmap_s		specify;
;173:	menubitmap_s		create;
;174:	menubitmap_s		go;
;175:
;176:	pinglist_t			pinglist[MAX_PINGREQUESTS];
;177:	table_t				table[MAX_LISTBOXITEMS];
;178:	char*				items[MAX_LISTBOXITEMS];
;179:	int					numqueriedservers;
;180:	int					*numservers;
;181:	servernode_t		*serverlist;	
;182:	int					currentping;
;183:	qboolean			refreshservers;
;184:	int					nextpingtime;
;185:	int					maxservers;
;186:	int					refreshtime;
;187:	char				favoriteaddresses[MAX_FAVORITESERVERS][MAX_ADDRESSLENGTH];
;188:	int					numfavoriteaddresses;
;189:
;190:} arenaservers_t;
;191:
;192:static arenaservers_t	g_arenaservers;
;193:
;194:
;195:static servernode_t		g_globalserverlist[MAX_GLOBALSERVERS];
;196:static int				g_numglobalservers;
;197:static servernode_t		g_localserverlist[MAX_LOCALSERVERS];
;198:static int				g_numlocalservers;
;199:static servernode_t		g_favoriteserverlist[MAX_FAVORITESERVERS];
;200:static int				g_numfavoriteservers;
;201:static servernode_t		g_mplayerserverlist[MAX_GLOBALSERVERS];
;202:static int				g_nummplayerservers;
;203:static int				g_servertype;
;204:static int				g_gametype;
;205:static int				g_sortkey;
;206:static int				g_emptyservers;
;207:static int				g_fullservers;
;208:
;209:
;210:/*
;211:=================
;212:ArenaServers_MaxPing
;213:=================
;214:*/
;215:static int ArenaServers_MaxPing( void ) {
line 218
;216:	int		maxPing;
;217:
;218:	maxPing = (int)trap_Cvar_VariableValue( "cl_maxPing" );
ADDRGP4 $85
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
line 219
;219:	if( maxPing < 100 ) {
ADDRLP4 0
INDIRI4
CNSTI4 100
GEI4 $86
line 220
;220:		maxPing = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 221
;221:	}
LABELV $86
line 222
;222:	return maxPing;
ADDRLP4 0
INDIRI4
RETI4
LABELV $84
endproc ArenaServers_MaxPing 8 4
proc ArenaServers_Compare 68 8
line 231
;223:}
;224:
;225:
;226:/*
;227:=================
;228:ArenaServers_Compare
;229:=================
;230:*/
;231:static int QDECL ArenaServers_Compare( const void *arg1, const void *arg2 ) {
line 237
;232:	float			f1;
;233:	float			f2;
;234:	servernode_t*	t1;
;235:	servernode_t*	t2;
;236:
;237:	t1 = (servernode_t *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 238
;238:	t2 = (servernode_t *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 240
;239:
;240:	switch( g_sortkey ) {
ADDRLP4 16
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $89
ADDRLP4 16
INDIRI4
CNSTI4 4
GTI4 $89
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $112
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $112
address $91
address $92
address $93
address $102
address $107
code
LABELV $91
line 242
;241:	case SORT_HOST:
;242:		return Q_stricmp( t1->hostname, t2->hostname );
ADDRLP4 20
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $88
JUMPV
LABELV $92
line 245
;243:
;244:	case SORT_MAP:
;245:		return Q_stricmp( t1->mapname, t2->mapname );
ADDRLP4 28
CNSTI4 89
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
ADDRGP4 $88
JUMPV
LABELV $93
line 248
;246:
;247:	case SORT_CLIENTS:
;248:		f1 = t1->maxclients - t1->numclients;
ADDRLP4 36
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 249
;249:		if( f1 < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $94
line 250
;250:			f1 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 251
;251:		}
LABELV $94
line 253
;252:
;253:		f2 = t2->maxclients - t2->numclients;
ADDRLP4 40
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 254
;254:		if( f2 < 0 ) {
ADDRLP4 12
INDIRF4
CNSTF4 0
GEF4 $96
line 255
;255:			f2 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 256
;256:		}
LABELV $96
line 258
;257:
;258:		if( f1 < f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $98
line 259
;259:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $88
JUMPV
LABELV $98
line 261
;260:		}
;261:		if( f1 == f2 ) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $100
line 262
;262:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $88
JUMPV
LABELV $100
line 264
;263:		}
;264:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $88
JUMPV
LABELV $102
line 267
;265:
;266:	case SORT_GAME:
;267:		if( t1->gametype < t2->gametype ) {
ADDRLP4 44
CNSTI4 120
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
GEI4 $103
line 268
;268:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $88
JUMPV
LABELV $103
line 270
;269:		}
;270:		if( t1->gametype == t2->gametype ) {
ADDRLP4 48
CNSTI4 120
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
NEI4 $105
line 271
;271:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $88
JUMPV
LABELV $105
line 273
;272:		}
;273:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $88
JUMPV
LABELV $107
line 276
;274:
;275:	case SORT_PING:
;276:		if( t1->pingtime < t2->pingtime ) {
ADDRLP4 52
CNSTI4 116
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
GEI4 $108
line 277
;277:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $88
JUMPV
LABELV $108
line 279
;278:		}
;279:		if( t1->pingtime > t2->pingtime ) {
ADDRLP4 56
CNSTI4 116
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
LEI4 $110
line 280
;280:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $88
JUMPV
LABELV $110
line 282
;281:		}
;282:		return Q_stricmp( t1->hostname, t2->hostname );
ADDRLP4 60
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
ADDRGP4 $88
JUMPV
LABELV $89
line 285
;283:	}
;284:
;285:	return 0;
CNSTI4 0
RETI4
LABELV $88
endproc ArenaServers_Compare 68 8
proc ArenaServers_Go 8 8
line 294
;286:}
;287:
;288:
;289:/*
;290:=================
;291:ArenaServers_Go
;292:=================
;293:*/
;294:static void ArenaServers_Go( void ) {
line 297
;295:	servernode_t*	servernode;
;296:
;297:	servernode = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 72
ADDRGP4 g_arenaservers+776+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4072+68
ADDP4
INDIRP4
ASGNP4
line 298
;298:	if( servernode ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
line 299
;299:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "connect %s\n", servernode->adrstr ) );
ADDRGP4 $120
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 300
;300:	}
LABELV $118
line 301
;301:}
LABELV $113
endproc ArenaServers_Go 8 8
bss
align 1
LABELV $122
skip 64
code
proc ArenaServers_UpdatePicture 4 16
line 309
;302:
;303:
;304:/*
;305:=================
;306:ArenaServers_UpdatePicture
;307:=================
;308:*/
;309:static void ArenaServers_UpdatePicture( void ) {
line 313
;310:	static char		picname[64];
;311:	servernode_t*	servernodeptr;
;312:
;313:	if( !g_arenaservers.list.numitems ) {
ADDRGP4 g_arenaservers+776+68
INDIRI4
CNSTI4 0
NEI4 $123
line 314
;314:		g_arenaservers.mappic.generic.name = NULL;
ADDRGP4 g_arenaservers+872+4
CNSTP4 0
ASGNP4
line 315
;315:	}
ADDRGP4 $124
JUMPV
LABELV $123
line 316
;316:	else {
line 317
;317:		servernodeptr = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
CNSTI4 72
ADDRGP4 g_arenaservers+776+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4072+68
ADDP4
INDIRP4
ASGNP4
line 318
;318:		Com_sprintf( picname, sizeof(picname), "levelshots/%s.tga", servernodeptr->mapname );
ADDRGP4 $122
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $133
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 319
;319:		g_arenaservers.mappic.generic.name = picname;
ADDRGP4 g_arenaservers+872+4
ADDRGP4 $122
ASGNP4
line 321
;320:	
;321:	}
LABELV $124
line 324
;322:
;323:	// force shader update during draw
;324:	g_arenaservers.mappic.shader = 0;
ADDRGP4 g_arenaservers+872+68
CNSTI4 0
ASGNI4
line 325
;325:}
LABELV $121
endproc ArenaServers_UpdatePicture 4 16
proc ArenaServers_UpdateMenu 64 48
line 333
;326:
;327:
;328:/*
;329:=================
;330:ArenaServers_UpdateMenu
;331:=================
;332:*/
;333:static void ArenaServers_UpdateMenu( void ) {
line 342
;334:	int				i;
;335:	int				j;
;336:	int				count;
;337:	char*			buff;
;338:	servernode_t*	servernodeptr;
;339:	table_t*		tableptr;
;340:	char			*pingColor;
;341:
;342:	if( g_arenaservers.numqueriedservers > 0 ) {
ADDRGP4 g_arenaservers+13800
INDIRI4
CNSTI4 0
LEI4 $139
line 344
;343:		// servers found
;344:		if( g_arenaservers.refreshservers && ( g_arenaservers.currentping <= g_arenaservers.numqueriedservers ) ) {
ADDRGP4 g_arenaservers+13816
INDIRI4
CNSTI4 0
EQI4 $142
ADDRGP4 g_arenaservers+13812
INDIRI4
ADDRGP4 g_arenaservers+13800
INDIRI4
GTI4 $142
line 346
;345:			// show progress
;346:			Com_sprintf( g_arenaservers.status.string, MAX_STATUSLENGTH, "%d of %d Arena Servers.", g_arenaservers.currentping, g_arenaservers.numqueriedservers);
ADDRGP4 g_arenaservers+1224+60
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $149
ARGP4
ADDRGP4 g_arenaservers+13812
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+13800
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 347
;347:			g_arenaservers.statusbar.string  = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1296+60
ADDRGP4 $154
ASGNP4
line 348
;348:			qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+13808
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ARGI4
CNSTI4 148
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 349
;349:		}
ADDRGP4 $140
JUMPV
LABELV $142
line 350
;350:		else {
line 352
;351:			// all servers pinged - enable controls
;352:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 28
ADDRGP4 g_arenaservers+360+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 353
;353:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 32
ADDRGP4 g_arenaservers+456+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 354
;354:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 36
ADDRGP4 g_arenaservers+552+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 355
;355:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+712+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 356
;356:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+648+44
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 357
;357:			g_arenaservers.list.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+776+44
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 358
;358:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+1544+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 359
;359:			g_arenaservers.go.generic.flags			&= ~QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+1808+44
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 363
;360://			g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
;361:
;362:			// update status bar
;363:			if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 60
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 2
EQI4 $175
ADDRLP4 60
INDIRI4
CNSTI4 1
NEI4 $173
LABELV $175
line 365
;364://				g_arenaservers.statusbar.string = quake3worldMessage;
;365:			}
ADDRGP4 $140
JUMPV
LABELV $173
line 366
;366:			else {
line 367
;367:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1296+60
ADDRGP4 $178
ASGNP4
line 368
;368:			}
line 370
;369:
;370:		}
line 371
;371:	}
ADDRGP4 $140
JUMPV
LABELV $139
line 372
;372:	else {
line 374
;373:		// no servers found
;374:		if( g_arenaservers.refreshservers ) {
ADDRGP4 g_arenaservers+13816
INDIRI4
CNSTI4 0
EQI4 $179
line 375
;375:			strcpy( g_arenaservers.status.string,"Scanning For Servers." );
ADDRGP4 g_arenaservers+1224+60
INDIRP4
ARGP4
ADDRGP4 $184
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 376
;376:			g_arenaservers.statusbar.string = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1296+60
ADDRGP4 $154
ASGNP4
line 379
;377:
;378:			// disable controls during refresh
;379:			g_arenaservers.master.generic.flags		|= QMF_GRAYED;
ADDRLP4 28
ADDRGP4 g_arenaservers+360+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 380
;380:			g_arenaservers.gametype.generic.flags	|= QMF_GRAYED;
ADDRLP4 32
ADDRGP4 g_arenaservers+456+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 381
;381:			g_arenaservers.sortkey.generic.flags	|= QMF_GRAYED;
ADDRLP4 36
ADDRGP4 g_arenaservers+552+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 382
;382:			g_arenaservers.showempty.generic.flags	|= QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+712+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 383
;383:			g_arenaservers.showfull.generic.flags	|= QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+648+44
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 384
;384:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+776+44
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 385
;385:			g_arenaservers.refresh.generic.flags	|= QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+1544+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 386
;386:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+1808+44
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 388
;387://			g_arenaservers.punkbuster.generic.flags |= QMF_GRAYED;
;388:		}
ADDRGP4 $180
JUMPV
LABELV $179
line 389
;389:		else {
line 390
;390:			if( g_arenaservers.numqueriedservers < 0 ) {
ADDRGP4 g_arenaservers+13800
INDIRI4
CNSTI4 0
GEI4 $203
line 391
;391:				strcpy(g_arenaservers.status.string,"No Response From Master Server." );
ADDRGP4 g_arenaservers+1224+60
INDIRP4
ARGP4
ADDRGP4 $208
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 392
;392:			}
ADDRGP4 $204
JUMPV
LABELV $203
line 393
;393:			else {
line 394
;394:				strcpy(g_arenaservers.status.string,"No Servers Found." );
ADDRGP4 g_arenaservers+1224+60
INDIRP4
ARGP4
ADDRGP4 $211
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 395
;395:			}
LABELV $204
line 398
;396:
;397:			// update status bar
;398:			if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 28
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $214
ADDRLP4 28
INDIRI4
CNSTI4 1
NEI4 $212
LABELV $214
line 400
;399://				g_arenaservers.statusbar.string = quake3worldMessage;
;400:			}
ADDRGP4 $213
JUMPV
LABELV $212
line 401
;401:			else {
line 402
;402:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1296+60
ADDRGP4 $178
ASGNP4
line 403
;403:			}
LABELV $213
line 406
;404:
;405:			// end of refresh - set control state
;406:			g_arenaservers.master.generic.flags		&= ~QMF_GRAYED;
ADDRLP4 32
ADDRGP4 g_arenaservers+360+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 407
;407:			g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 36
ADDRGP4 g_arenaservers+456+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 408
;408:			g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 40
ADDRGP4 g_arenaservers+552+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 409
;409:			g_arenaservers.showempty.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 44
ADDRGP4 g_arenaservers+712+44
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 410
;410:			g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 48
ADDRGP4 g_arenaservers+648+44
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 411
;411:			g_arenaservers.list.generic.flags		|= QMF_GRAYED;
ADDRLP4 52
ADDRGP4 g_arenaservers+776+44
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 412
;412:			g_arenaservers.refresh.generic.flags	&= ~QMF_GRAYED;
ADDRLP4 56
ADDRGP4 g_arenaservers+1544+44
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 413
;413:			g_arenaservers.go.generic.flags			|= QMF_GRAYED;
ADDRLP4 60
ADDRGP4 g_arenaservers+1808+44
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 415
;414://			g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
;415:		}
LABELV $180
line 418
;416:
;417:		// zero out list box
;418:		g_arenaservers.list.numitems = 0;
ADDRGP4 g_arenaservers+776+68
CNSTI4 0
ASGNI4
line 419
;419:		g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+776+64
CNSTI4 0
ASGNI4
line 420
;420:		g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+776+72
CNSTI4 0
ASGNI4
line 423
;421:
;422:		// update picture
;423:		ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 424
;424:		return;
ADDRGP4 $138
JUMPV
LABELV $140
line 428
;425:	}
;426:
;427:	// build list box strings - apply culling filters
;428:	servernodeptr = g_arenaservers.serverlist;
ADDRLP4 0
ADDRGP4 g_arenaservers+13808
INDIRP4
ASGNP4
line 429
;429:	count         = *g_arenaservers.numservers;
ADDRLP4 24
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ASGNI4
line 430
;430:	for( i = 0, j = 0; i < count; i++, servernodeptr++ ) {
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $244
JUMPV
LABELV $241
line 431
;431:		tableptr = &g_arenaservers.table[j];
ADDRLP4 4
CNSTI4 72
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4072
ADDP4
ASGNP4
line 432
;432:		tableptr->servernode = servernodeptr;
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 433
;433:		buff = tableptr->buff;
ADDRLP4 16
ADDRLP4 4
INDIRP4
ASGNP4
line 436
;434:
;435:		// can only cull valid results
;436:		if( !g_emptyservers && !servernodeptr->numclients ) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 g_emptyservers
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $246
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $246
line 437
;437:			continue;
ADDRGP4 $242
JUMPV
LABELV $246
line 440
;438:		}
;439:
;440:		if( !g_fullservers && ( servernodeptr->numclients == servernodeptr->maxclients ) ) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
NEI4 $248
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
NEI4 $248
line 441
;441:			continue;
ADDRGP4 $242
JUMPV
LABELV $248
line 444
;442:		}
;443:
;444:		switch( g_gametype ) {
ADDRLP4 40
ADDRGP4 g_gametype
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $251
ADDRLP4 40
INDIRI4
CNSTI4 1
EQI4 $253
ADDRGP4 $250
JUMPV
line 446
;445:		case GAMES_ALL:
;446:			break;
LABELV $253
line 449
;447:
;448:		case GAMES_GALLERIES:
;449:			if( servernodeptr->gametype != GT_FFA ) {
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
CNSTI4 0
EQI4 $251
line 450
;450:				continue;
ADDRGP4 $242
JUMPV
line 452
;451:			}
;452:			break;
LABELV $250
LABELV $251
line 473
;453:
;454://		case GAMES_TEAMPLAY:
;455://			if( servernodeptr->gametype != GT_TEAM ) {
;456://				continue;
;457://			}
;458://			break;
;459:
;460://		case GAMES_TOURNEY:
;461://			if( servernodeptr->gametype != GT_TOURNAMENT ) {
;462://				continue;
;463://			}
;464://			break;
;465:
;466://		case GAMES_CTF:
;467://			if( servernodeptr->gametype != GT_CTF ) {
;468://				continue;
;469://			}
;470://			break;
;471:		}
;472:
;473:		if( servernodeptr->pingtime < servernodeptr->minPing ) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
GEI4 $256
line 474
;474:			pingColor = S_COLOR_BLUE;
ADDRLP4 20
ADDRGP4 $258
ASGNP4
line 475
;475:		}
ADDRGP4 $257
JUMPV
LABELV $256
line 476
;476:		else if( servernodeptr->maxPing && servernodeptr->pingtime > servernodeptr->maxPing ) {
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $259
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $259
line 477
;477:			pingColor = S_COLOR_BLUE;
ADDRLP4 20
ADDRGP4 $258
ASGNP4
line 478
;478:		}
ADDRGP4 $260
JUMPV
LABELV $259
line 479
;479:		else if( servernodeptr->pingtime < 200 ) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CNSTI4 200
GEI4 $261
line 480
;480:			pingColor = S_COLOR_GREEN;
ADDRLP4 20
ADDRGP4 $263
ASGNP4
line 481
;481:		}
ADDRGP4 $262
JUMPV
LABELV $261
line 482
;482:		else if( servernodeptr->pingtime < 400 ) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CNSTI4 400
GEI4 $264
line 483
;483:			pingColor = S_COLOR_YELLOW;
ADDRLP4 20
ADDRGP4 $266
ASGNP4
line 484
;484:		}
ADDRGP4 $265
JUMPV
LABELV $264
line 485
;485:		else {
line 486
;486:			pingColor = S_COLOR_RED;
ADDRLP4 20
ADDRGP4 $267
ASGNP4
line 487
;487:		}
LABELV $265
LABELV $262
LABELV $260
LABELV $257
line 489
;488:
;489:		Com_sprintf( buff, MAX_LISTBOXWIDTH, "%-20.20s %-12.12s %2d/%2d %-8.8s %3s %s%3d " S_COLOR_YELLOW "%s", 
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 68
ARGI4
ADDRGP4 $268
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 494
;490:			servernodeptr->hostname, servernodeptr->mapname, servernodeptr->numclients,
;491: 			servernodeptr->maxclients, servernodeptr->gamename,
;492:			netnames[servernodeptr->nettype], pingColor, servernodeptr->pingtime,
;493:		j++);
;494:	}
LABELV $242
line 430
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ASGNP4
LABELV $244
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $241
line 496
;495:
;496:	g_arenaservers.list.numitems = j;
ADDRGP4 g_arenaservers+776+68
ADDRLP4 8
INDIRI4
ASGNI4
line 497
;497:	g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+776+64
CNSTI4 0
ASGNI4
line 498
;498:	g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+776+72
CNSTI4 0
ASGNI4
line 501
;499:
;500:	// update picture
;501:	ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 502
;502:}
LABELV $138
endproc ArenaServers_UpdateMenu 64 48
proc ArenaServers_Remove 24 12
line 511
;503:
;504:
;505:/*
;506:=================
;507:ArenaServers_Remove
;508:=================
;509:*/
;510:static void ArenaServers_Remove( void )
;511:{
line 516
;512:	int				i;
;513:	servernode_t*	servernodeptr;
;514:	table_t*		tableptr;
;515:
;516:	if (!g_arenaservers.list.numitems)
ADDRGP4 g_arenaservers+776+68
INDIRI4
CNSTI4 0
NEI4 $276
line 517
;517:		return;
ADDRGP4 $275
JUMPV
LABELV $276
line 523
;518:
;519:	// remove selected item from display list
;520:	// items are in scattered order due to sort and cull
;521:	// perform delete on list box contents, resync all lists
;522:
;523:	tableptr      = &g_arenaservers.table[g_arenaservers.list.curvalue];
ADDRLP4 8
CNSTI4 72
ADDRGP4 g_arenaservers+776+64
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4072
ADDP4
ASGNP4
line 524
;524:	servernodeptr = tableptr->servernode;
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ASGNP4
line 527
;525:
;526:	// find address in master list
;527:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $286
JUMPV
LABELV $283
line 528
;528:		if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],servernodeptr->adrstr))
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $288
line 529
;529:				break;
ADDRGP4 $285
JUMPV
LABELV $288
LABELV $284
line 527
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $286
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14856
INDIRI4
LTI4 $283
LABELV $285
line 532
;530:
;531:	// delete address from master list
;532:	if (i <= g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14856
INDIRI4
CNSTI4 1
SUBI4
GTI4 $291
line 533
;533:	{
line 534
;534:		if (i < g_arenaservers.numfavoriteaddresses-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14856
INDIRI4
CNSTI4 1
SUBI4
GEI4 $294
line 535
;535:		{
line 537
;536:			// shift items up
;537:			memcpy( &g_arenaservers.favoriteaddresses[i], &g_arenaservers.favoriteaddresses[i+1], (g_arenaservers.numfavoriteaddresses - i - 1)*sizeof(MAX_ADDRESSLENGTH));
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
ADDRLP4 20
INDIRI4
ADDRGP4 g_arenaservers+13832+64
ADDP4
ARGP4
ADDRGP4 g_arenaservers+14856
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
SUBI4
CVIU4 4
CNSTI4 2
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 538
;538:		}
LABELV $294
line 539
;539:		g_arenaservers.numfavoriteaddresses--;
ADDRLP4 16
ADDRGP4 g_arenaservers+14856
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 540
;540:	}	
LABELV $291
line 543
;541:
;542:	// find address in server list
;543:	for (i=0; i<g_numfavoriteservers; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $305
JUMPV
LABELV $302
line 544
;544:		if (&g_favoriteserverlist[i] == servernodeptr)
CNSTI4 148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $306
line 545
;545:				break;
ADDRGP4 $304
JUMPV
LABELV $306
LABELV $303
line 543
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $305
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $302
LABELV $304
line 548
;546:
;547:	// delete address from server list
;548:	if (i <= g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GTI4 $308
line 549
;549:	{
line 550
;550:		if (i < g_numfavoriteservers-1)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GEI4 $310
line 551
;551:		{
line 553
;552:			// shift items up
;553:			memcpy( &g_favoriteserverlist[i], &g_favoriteserverlist[i+1], (g_numfavoriteservers - i - 1)*sizeof(servernode_t));
ADDRLP4 20
CNSTI4 148
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 20
INDIRI4
ADDRGP4 g_favoriteserverlist+148
ADDP4
ARGP4
CNSTU4 148
ADDRGP4 g_numfavoriteservers
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
SUBI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 554
;554:		}
LABELV $310
line 555
;555:		g_numfavoriteservers--;
ADDRLP4 16
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 556
;556:	}	
LABELV $308
line 558
;557:
;558:	g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13800
ADDRGP4 g_arenaservers+14856
INDIRI4
ASGNI4
line 559
;559:	g_arenaservers.currentping       = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13812
ADDRGP4 g_arenaservers+14856
INDIRI4
ASGNI4
line 560
;560:}
LABELV $275
endproc ArenaServers_Remove 24 12
proc ArenaServers_Insert 76 12
line 569
;561:
;562:
;563:/*
;564:=================
;565:ArenaServers_Insert
;566:=================
;567:*/
;568:static void ArenaServers_Insert( char* adrstr, char* info, int pingtime )
;569:{
line 575
;570:	servernode_t*	servernodeptr;
;571:	char*			s;
;572:	int				i;
;573:
;574:
;575:	if ((pingtime >= ArenaServers_MaxPing()) && (g_servertype != AS_FAVORITES))
ADDRLP4 12
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $318
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $318
line 576
;576:	{
line 578
;577:		// slow global or local servers do not get entered
;578:		return;
ADDRGP4 $317
JUMPV
LABELV $318
line 581
;579:	}
;580:
;581:	if (*g_arenaservers.numservers >= g_arenaservers.maxservers) {
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ADDRGP4 g_arenaservers+13824
INDIRI4
LTI4 $320
line 583
;582:		// list full;
;583:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers)-1;
ADDRLP4 0
CNSTI4 148
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_arenaservers+13808
INDIRP4
ADDP4
CNSTI4 -148
ADDP4
ASGNP4
line 584
;584:	} else {
ADDRGP4 $321
JUMPV
LABELV $320
line 586
;585:		// next slot
;586:		servernodeptr = g_arenaservers.serverlist+(*g_arenaservers.numservers);
ADDRLP4 0
CNSTI4 148
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_arenaservers+13808
INDIRP4
ADDP4
ASGNP4
line 587
;587:		(*g_arenaservers.numservers)++;
ADDRLP4 16
ADDRGP4 g_arenaservers+13804
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 588
;588:	}
LABELV $321
line 590
;589:
;590:	Q_strncpyz( servernodeptr->adrstr, adrstr, MAX_ADDRESSLENGTH );
ADDRLP4 0
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
line 592
;591:
;592:	Q_strncpyz( servernodeptr->hostname, Info_ValueForKey( info, "hostname"), MAX_HOSTNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $329
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 22
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 593
;593:	Q_CleanStr( servernodeptr->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 594
;594:	Q_strupr( servernodeptr->hostname );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 596
;595:
;596:	Q_strncpyz( servernodeptr->mapname, Info_ValueForKey( info, "mapname"), MAX_MAPNAMELENGTH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $330
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 597
;597:	Q_CleanStr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 598
;598:	Q_strupr( servernodeptr->mapname );
ADDRLP4 0
INDIRP4
CNSTI4 89
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 600
;599:
;600:	servernodeptr->numclients = atoi( Info_ValueForKey( info, "clients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $331
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 601
;601:	servernodeptr->maxclients = atoi( Info_ValueForKey( info, "sv_maxclients") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $332
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 602
;602:	servernodeptr->pingtime   = pingtime;
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 603
;603:	servernodeptr->minPing    = atoi( Info_ValueForKey( info, "minPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $333
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 604
;604:	servernodeptr->maxPing    = atoi( Info_ValueForKey( info, "maxPing") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $334
ARGP4
ADDRLP4 48
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 623
;605://	servernodeptr->bPB = atoi( Info_ValueForKey( info, "punkbuster") );
;606:
;607:	/*
;608:	s = Info_ValueForKey( info, "nettype" );
;609:	for (i=0; ;i++)
;610:	{
;611:		if (!netnames[i])
;612:		{
;613:			servernodeptr->nettype = 0;
;614:			break;
;615:		}
;616:		else if (!Q_stricmp( netnames[i], s ))
;617:		{
;618:			servernodeptr->nettype = i;
;619:			break;
;620:		}
;621:	}
;622:	*/
;623:	servernodeptr->nettype = atoi(Info_ValueForKey(info, "nettype"));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $335
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
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 625
;624:
;625:	s = Info_ValueForKey( info, "game");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $336
ARGP4
ADDRLP4 64
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 64
INDIRP4
ASGNP4
line 626
;626:	i = atoi( Info_ValueForKey( info, "gametype") );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 68
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 72
INDIRI4
ASGNI4
line 627
;627:	if( i < 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $338
line 628
;628:		i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 629
;629:	}
ADDRGP4 $339
JUMPV
LABELV $338
line 630
;630:	else if( i > 11 ) {
ADDRLP4 4
INDIRI4
CNSTI4 11
LEI4 $340
line 631
;631:		i = 12;
ADDRLP4 4
CNSTI4 12
ASGNI4
line 632
;632:	}
LABELV $340
LABELV $339
line 633
;633:	if( *s ) {
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $342
line 634
;634:		servernodeptr->gametype = i;//-1;
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 635
;635:		Q_strncpyz( servernodeptr->gamename, s, sizeof(servernodeptr->gamename) );
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 636
;636:	}
ADDRGP4 $343
JUMPV
LABELV $342
line 637
;637:	else {
line 638
;638:		servernodeptr->gametype = i;
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 639
;639:		Q_strncpyz( servernodeptr->gamename, gamenames[i], sizeof(servernodeptr->gamename) );
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gamenames
ADDP4
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 640
;640:	}
LABELV $343
line 641
;641:}
LABELV $317
endproc ArenaServers_Insert 76 12
export ArenaServers_InsertFavorites
proc ArenaServers_InsertFavorites 1040 12
line 652
;642:
;643:
;644:/*
;645:=================
;646:ArenaServers_InsertFavorites
;647:
;648:Insert nonresponsive address book entries into display lists.
;649:=================
;650:*/
;651:void ArenaServers_InsertFavorites( void )
;652:{
line 658
;653:	int		i;
;654:	int		j;
;655:	char	info[MAX_INFO_STRING];
;656:
;657:	// resync existing results with new or deleted cvars
;658:	info[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 659
;659:	Info_SetValueForKey( info, "hostname", "No Response" );
ADDRLP4 8
ARGP4
ADDRGP4 $329
ARGP4
ADDRGP4 $345
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 660
;660:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $349
JUMPV
LABELV $346
line 661
;661:	{
line 663
;662:		// find favorite address in refresh list
;663:		for (j=0; j<g_numfavoriteservers; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $354
JUMPV
LABELV $351
line 664
;664:			if (!Q_stricmp(g_arenaservers.favoriteaddresses[i],g_favoriteserverlist[j].adrstr))
ADDRLP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
CNSTI4 148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $355
line 665
;665:				break;
ADDRGP4 $353
JUMPV
LABELV $355
LABELV $352
line 663
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $354
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $351
LABELV $353
line 667
;666:
;667:		if ( j >= g_numfavoriteservers)
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $358
line 668
;668:		{
line 670
;669:			// not in list, add it
;670:			ArenaServers_Insert( g_arenaservers.favoriteaddresses[i], info, ArenaServers_MaxPing() );
ADDRLP4 1036
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Insert
CALLV
pop
line 671
;671:		}
LABELV $358
line 672
;672:	}
LABELV $347
line 660
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $349
ADDRLP4 4
INDIRI4
ADDRGP4 g_arenaservers+14856
INDIRI4
LTI4 $346
line 673
;673:}
LABELV $344
endproc ArenaServers_InsertFavorites 1040 12
export ArenaServers_LoadFavorites
proc ArenaServers_LoadFavorites 3488 12
line 684
;674:
;675:
;676:/*
;677:=================
;678:ArenaServers_LoadFavorites
;679:
;680:Load cvar address book entries into local lists.
;681:=================
;682:*/
;683:void ArenaServers_LoadFavorites( void )
;684:{
line 693
;685:	int				i;
;686:	int				j;
;687:	int				numtempitems;
;688:	char			emptyinfo[MAX_INFO_STRING];
;689:	char			adrstr[MAX_ADDRESSLENGTH];
;690:	servernode_t	templist[MAX_FAVORITESERVERS];
;691:	qboolean		found;
;692:
;693:	found        = qfalse;
ADDRLP4 2444
CNSTI4 0
ASGNI4
line 694
;694:	emptyinfo[0] = '\0';
ADDRLP4 2448
CNSTI1 0
ASGNI1
line 697
;695:
;696:	// copy the old
;697:	memcpy( templist, g_favoriteserverlist, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRLP4 72
ARGP4
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 2368
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 698
;698:	numtempitems = g_numfavoriteservers;
ADDRLP4 68
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 701
;699:
;700:	// clear the current for sync
;701:	memset( g_favoriteserverlist, 0, sizeof(servernode_t)*MAX_FAVORITESERVERS );
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 702
;702:	g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 705
;703:
;704:	// resync existing results with new or deleted cvars
;705:	for (i=0; i<MAX_FAVORITESERVERS; i++)
ADDRLP4 2440
CNSTI4 0
ASGNI4
LABELV $362
line 706
;706:	{
line 707
;707:		trap_Cvar_VariableStringBuffer( va("server%d",i+1), adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 $366
ARGP4
ADDRLP4 2440
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 3472
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 3472
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 708
;708:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $367
line 709
;709:			continue;
ADDRGP4 $363
JUMPV
LABELV $367
line 713
;710:
;711:		// quick sanity check to avoid slow domain name resolving
;712:		// first character must be numeric
;713:		if (adrstr[0] < '0' || adrstr[0] > '9')
ADDRLP4 3476
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 3476
INDIRI4
CNSTI4 48
LTI4 $371
ADDRLP4 3476
INDIRI4
CNSTI4 57
LEI4 $369
LABELV $371
line 714
;714:			continue;
ADDRGP4 $363
JUMPV
LABELV $369
line 719
;715:
;716:		// favorite server addresses must be maintained outside refresh list
;717:		// this mimics local and global netadr's stored in client
;718:		// these can be fetched to fill ping list
;719:		strcpy( g_arenaservers.favoriteaddresses[g_numfavoriteservers], adrstr );
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 722
;720:
;721:		// find this server in the old list
;722:		for (j=0; j<numtempitems; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $376
JUMPV
LABELV $373
line 723
;723:			if (!Q_stricmp( templist[j].adrstr, adrstr ))
CNSTI4 148
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 3480
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3480
INDIRI4
CNSTI4 0
NEI4 $377
line 724
;724:				break;
ADDRGP4 $375
JUMPV
LABELV $377
LABELV $374
line 722
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $376
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $373
LABELV $375
line 726
;725:
;726:		if (j < numtempitems)
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
GEI4 $379
line 727
;727:		{
line 729
;728:			// found server - add exisiting results
;729:			memcpy( &g_favoriteserverlist[g_numfavoriteservers], &templist[j], sizeof(servernode_t) );
ADDRLP4 3484
CNSTI4 148
ASGNI4
ADDRLP4 3484
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 3484
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 3484
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 730
;730:			found = qtrue;
ADDRLP4 2444
CNSTI4 1
ASGNI4
line 731
;731:		}
ADDRGP4 $380
JUMPV
LABELV $379
line 733
;732:		else
;733:		{
line 735
;734:			// add new server
;735:			Q_strncpyz( g_favoriteserverlist[g_numfavoriteservers].adrstr, adrstr, MAX_ADDRESSLENGTH );
CNSTI4 148
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 736
;736:			g_favoriteserverlist[g_numfavoriteservers].pingtime = ArenaServers_MaxPing();
ADDRLP4 3484
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
CNSTI4 148
ADDRGP4 g_numfavoriteservers
INDIRI4
MULI4
ADDRGP4 g_favoriteserverlist+116
ADDP4
ADDRLP4 3484
INDIRI4
ASGNI4
line 737
;737:		}
LABELV $380
line 739
;738:
;739:		g_numfavoriteservers++;
ADDRLP4 3484
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 3484
INDIRP4
ADDRLP4 3484
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 740
;740:	}
LABELV $363
line 705
ADDRLP4 2440
ADDRLP4 2440
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2440
INDIRI4
CNSTI4 16
LTI4 $362
line 742
;741:
;742:	g_arenaservers.numfavoriteaddresses = g_numfavoriteservers;
ADDRGP4 g_arenaservers+14856
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 744
;743:
;744:	if (!found)
ADDRLP4 2444
INDIRI4
CNSTI4 0
NEI4 $383
line 745
;745:	{
line 748
;746:		// no results were found, reset server list
;747:		// list will be automatically refreshed when selected
;748:		g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 749
;749:	}
LABELV $383
line 750
;750:}
LABELV $361
endproc ArenaServers_LoadFavorites 3488 12
proc ArenaServers_StopRefresh 0 16
line 759
;751:
;752:
;753:/*
;754:=================
;755:ArenaServers_StopRefresh
;756:=================
;757:*/
;758:static void ArenaServers_StopRefresh( void )
;759:{
line 760
;760:	if (!g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+13816
INDIRI4
CNSTI4 0
NEI4 $386
line 762
;761:		// not currently refreshing
;762:		return;
ADDRGP4 $385
JUMPV
LABELV $386
line 764
;763:
;764:	g_arenaservers.refreshservers = qfalse;
ADDRGP4 g_arenaservers+13816
CNSTI4 0
ASGNI4
line 766
;765:
;766:	if (g_servertype == AS_FAVORITES)
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $390
line 767
;767:	{
line 769
;768:		// nonresponsive favorites must be shown
;769:		ArenaServers_InsertFavorites();
ADDRGP4 ArenaServers_InsertFavorites
CALLV
pop
line 770
;770:	}
LABELV $390
line 773
;771:
;772:	// final tally
;773:	if (g_arenaservers.numqueriedservers >= 0)
ADDRGP4 g_arenaservers+13800
INDIRI4
CNSTI4 0
LTI4 $392
line 774
;774:	{
line 775
;775:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+13812
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ASGNI4
line 776
;776:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+13800
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ASGNI4
line 777
;777:	}
LABELV $392
line 780
;778:	
;779:	// sort
;780:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+13808
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ARGI4
CNSTI4 148
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 782
;781:
;782:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 783
;783:}
LABELV $385
endproc ArenaServers_StopRefresh 0 16
proc ArenaServers_DoRefresh 1120 16
line 792
;784:
;785:
;786:/*
;787:=================
;788:ArenaServers_DoRefresh
;789:=================
;790:*/
;791:static void ArenaServers_DoRefresh( void )
;792:{
line 800
;793:	int		i;
;794:	int		j;
;795:	int		time;
;796:	int		maxPing;
;797:	char	adrstr[MAX_ADDRESSLENGTH];
;798:	char	info[MAX_INFO_STRING];
;799:
;800:	if (uis.realtime < g_arenaservers.refreshtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+13828
INDIRI4
GEI4 $402
line 801
;801:	{
line 802
;802:	  if (g_servertype != AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $406
line 803
;803:			if (g_servertype == AS_LOCAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $408
line 804
;804:				if (!trap_LAN_GetServerCount(g_servertype)) {
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $410
line 805
;805:					return;
ADDRGP4 $401
JUMPV
LABELV $410
line 807
;806:				}
;807:			}
LABELV $408
line 808
;808:			if (trap_LAN_GetServerCount(g_servertype) < 0) {
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
GEI4 $412
line 810
;809:			  // still waiting for response
;810:			  return;
ADDRGP4 $401
JUMPV
LABELV $412
line 812
;811:			}
;812:	  }
LABELV $406
line 813
;813:	}
LABELV $402
line 815
;814:
;815:	if (uis.realtime < g_arenaservers.nextpingtime)
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+13820
INDIRI4
GEI4 $414
line 816
;816:	{
line 818
;817:		// wait for time trigger
;818:		return;
ADDRGP4 $401
JUMPV
LABELV $414
line 822
;819:	}
;820:
;821:	// trigger at 10Hz intervals
;822:	g_arenaservers.nextpingtime = uis.realtime + 10;
ADDRGP4 g_arenaservers+13820
ADDRGP4 uis+4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 825
;823:
;824:	// process ping results
;825:	maxPing = ArenaServers_MaxPing();
ADDRLP4 1104
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 1104
INDIRI4
ASGNI4
line 826
;826:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
LABELV $420
line 827
;827:	{
line 828
;828:		trap_LAN_GetPing( i, adrstr, MAX_ADDRESSLENGTH, &time );
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 72
ARGP4
ADDRGP4 trap_LAN_GetPing
CALLV
pop
line 829
;829:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $424
line 830
;830:		{
line 832
;831:			// ignore empty or pending pings
;832:			continue;
ADDRGP4 $421
JUMPV
LABELV $424
line 836
;833:		}
;834:
;835:		// find ping result in our local list
;836:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $426
line 837
;837:			if (!Q_stricmp( adrstr, g_arenaservers.pinglist[j].adrstr ))
ADDRLP4 4
ARGP4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896
ADDP4
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $430
line 838
;838:				break;
ADDRGP4 $428
JUMPV
LABELV $430
LABELV $427
line 836
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $426
LABELV $428
line 840
;839:
;840:		if (j < MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $433
line 841
;841:		{
line 843
;842:			// found it
;843:			if (!time)
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $435
line 844
;844:			{
line 845
;845:				time = uis.realtime - g_arenaservers.pinglist[j].start;
ADDRLP4 72
ADDRGP4 uis+4
INDIRI4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896+64
ADDP4
INDIRI4
SUBI4
ASGNI4
line 846
;846:				if (time < maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $440
line 847
;847:				{
line 849
;848:					// still waiting
;849:					continue;
ADDRGP4 $421
JUMPV
LABELV $440
line 851
;850:				}
;851:			}
LABELV $435
line 853
;852:
;853:			if (time > maxPing)
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $442
line 854
;854:			{
line 856
;855:				// stale it out
;856:				info[0] = '\0';
ADDRLP4 80
CNSTI1 0
ASGNI1
line 857
;857:				time    = maxPing;
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 858
;858:			}
ADDRGP4 $443
JUMPV
LABELV $442
line 860
;859:			else
;860:			{
line 861
;861:				trap_LAN_GetPingInfo( i, info, MAX_INFO_STRING );
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetPingInfo
CALLV
pop
line 862
;862:			}
LABELV $443
line 865
;863:
;864:			// insert ping results
;865:			ArenaServers_Insert( adrstr, info, time );
ADDRLP4 4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Insert
CALLV
pop
line 868
;866:
;867:			// clear this query from internal list
;868:			g_arenaservers.pinglist[j].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896
ADDP4
CNSTI1 0
ASGNI1
line 869
;869:   		}
LABELV $433
line 872
;870:
;871:		// clear this query from external list
;872:		trap_LAN_ClearPing( i );
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 873
;873:	}
LABELV $421
line 826
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 32
LTI4 $420
line 877
;874:
;875:	// get results of servers query
;876:	// counts can increase as servers respond
;877:	if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $445
line 878
;878:	  g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+13800
ADDRGP4 g_arenaservers+14856
INDIRI4
ASGNI4
line 879
;879:	} else {
ADDRGP4 $446
JUMPV
LABELV $445
line 880
;880:	  g_arenaservers.numqueriedservers = trap_LAN_GetServerCount(g_servertype);
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRGP4 g_arenaservers+13800
ADDRLP4 1108
INDIRI4
ASGNI4
line 881
;881:	}
LABELV $446
line 888
;882:
;883://	if (g_arenaservers.numqueriedservers > g_arenaservers.maxservers)
;884://		g_arenaservers.numqueriedservers = g_arenaservers.maxservers;
;885:
;886:	// send ping requests in reasonable bursts
;887:	// iterate ping through all found servers
;888:	for (i=0; i<MAX_PINGREQUESTS && g_arenaservers.currentping < g_arenaservers.numqueriedservers; i++)
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $453
JUMPV
LABELV $450
line 889
;889:	{
line 890
;890:		if (trap_LAN_GetPingQueueCount() >= MAX_PINGREQUESTS)
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 32
LTI4 $456
line 891
;891:		{
line 893
;892:			// ping queue is full
;893:			break;
ADDRGP4 $452
JUMPV
LABELV $456
line 897
;894:		}
;895:
;896:		// find empty slot
;897:		for (j=0; j<MAX_PINGREQUESTS; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $458
line 898
;898:			if (!g_arenaservers.pinglist[j].adrstr[0])
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $462
line 899
;899:				break;
ADDRGP4 $460
JUMPV
LABELV $462
LABELV $459
line 897
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $458
LABELV $460
line 901
;900:
;901:		if (j >= MAX_PINGREQUESTS)
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $465
line 903
;902:			// no empty slots available yet - wait for timeout
;903:			break;
ADDRGP4 $452
JUMPV
LABELV $465
line 907
;904:
;905:		// get an address to ping
;906:
;907:		if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $467
line 908
;908:		  strcpy( adrstr, g_arenaservers.favoriteaddresses[g_arenaservers.currentping] ); 		
ADDRLP4 4
ARGP4
ADDRGP4 g_arenaservers+13812
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 909
;909:		} else {
ADDRGP4 $468
JUMPV
LABELV $467
line 910
;910:		  trap_LAN_GetServerAddressString(g_servertype, g_arenaservers.currentping, adrstr, MAX_ADDRESSLENGTH );
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+13812
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 911
;911:		}
LABELV $468
line 913
;912:
;913:		strcpy( g_arenaservers.pinglist[j].adrstr, adrstr );
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 914
;914:		g_arenaservers.pinglist[j].start = uis.realtime;
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896+64
ADDP4
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 916
;915:
;916:		trap_Cmd_ExecuteText( EXEC_NOW, va( "ping %s\n", adrstr )  );
ADDRGP4 $476
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 919
;917:		
;918:		// advance to next server
;919:		g_arenaservers.currentping++;
ADDRLP4 1116
ADDRGP4 g_arenaservers+13812
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 920
;920:	}
LABELV $451
line 888
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $453
ADDRLP4 68
INDIRI4
CNSTI4 32
GEI4 $478
ADDRGP4 g_arenaservers+13812
INDIRI4
ADDRGP4 g_arenaservers+13800
INDIRI4
LTI4 $450
LABELV $478
LABELV $452
line 922
;921:
;922:	if (!trap_LAN_GetPingQueueCount())
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $479
line 923
;923:	{
line 925
;924:		// all pings completed
;925:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 926
;926:		return;
ADDRGP4 $401
JUMPV
LABELV $479
line 930
;927:	}
;928:
;929:	// update the user interface with ping status
;930:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 931
;931:}
LABELV $401
endproc ArenaServers_DoRefresh 1120 16
proc ArenaServers_StartRefresh 88 16
line 940
;932:
;933:
;934:/*
;935:=================
;936:ArenaServers_StartRefresh
;937:=================
;938:*/
;939:static void ArenaServers_StartRefresh( void )
;940:{
line 944
;941:	int		i;
;942:	char	myargs[32], protocol[32];
;943:
;944:	memset( g_arenaservers.serverlist, 0, g_arenaservers.maxservers*sizeof(table_t) );
ADDRGP4 g_arenaservers+13808
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 72
ADDRGP4 g_arenaservers+13824
INDIRI4
CVIU4 4
MULU4
CVUI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 946
;945:
;946:	for (i=0; i<MAX_PINGREQUESTS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $484
line 947
;947:	{
line 948
;948:		g_arenaservers.pinglist[i].adrstr[0] = '\0';
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+1896
ADDP4
CNSTI1 0
ASGNI1
line 949
;949:		trap_LAN_ClearPing( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 950
;950:	}
LABELV $485
line 946
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $484
line 952
;951:
;952:	g_arenaservers.refreshservers    = qtrue;
ADDRGP4 g_arenaservers+13816
CNSTI4 1
ASGNI4
line 953
;953:	g_arenaservers.currentping       = 0;
ADDRGP4 g_arenaservers+13812
CNSTI4 0
ASGNI4
line 954
;954:	g_arenaservers.nextpingtime      = 0;
ADDRGP4 g_arenaservers+13820
CNSTI4 0
ASGNI4
line 955
;955:	*g_arenaservers.numservers       = 0;
ADDRGP4 g_arenaservers+13804
INDIRP4
CNSTI4 0
ASGNI4
line 956
;956:	g_arenaservers.numqueriedservers = 0;
ADDRGP4 g_arenaservers+13800
CNSTI4 0
ASGNI4
line 959
;957:
;958:	// allow max 5 seconds for responses
;959:	g_arenaservers.refreshtime = uis.realtime + 5000;
ADDRGP4 g_arenaservers+13828
ADDRGP4 uis+4
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 962
;960:
;961:	// place menu in zeroed state
;962:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 964
;963:
;964:	if( g_servertype == AS_LOCAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $496
line 965
;965:		trap_Cmd_ExecuteText( EXEC_APPEND, "localservers\n" );
CNSTI4 2
ARGI4
ADDRGP4 $498
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 966
;966:		return;
ADDRGP4 $481
JUMPV
LABELV $496
line 969
;967:	}
;968:
;969:	if( g_servertype == AS_GLOBAL || g_servertype == AS_MPLAYER ) {
ADDRLP4 68
ADDRGP4 g_servertype
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $501
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $499
LABELV $501
line 970
;970:		if( g_servertype == AS_GLOBAL ) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 2
NEI4 $502
line 971
;971:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 972
;972:		}
ADDRGP4 $503
JUMPV
LABELV $502
line 973
;973:		else {
line 974
;974:			i = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 975
;975:		}
LABELV $503
line 977
;976:
;977:		switch( g_arenaservers.gametype.curvalue ) {
ADDRLP4 72
ADDRGP4 g_arenaservers+456+64
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $508
ADDRLP4 72
INDIRI4
CNSTI4 1
EQI4 $509
ADDRGP4 $504
JUMPV
LABELV $504
LABELV $508
line 980
;978:		default:
;979:		case GAMES_ALL:
;980:			myargs[0] = 0;
ADDRLP4 36
CNSTI1 0
ASGNI1
line 981
;981:			break;
ADDRGP4 $505
JUMPV
LABELV $509
line 984
;982:
;983:		case GAMES_GALLERIES:
;984:			strcpy( myargs, " ffa" );
ADDRLP4 36
ARGP4
ADDRGP4 $510
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 985
;985:			break;
LABELV $505
line 1001
;986:
;987://		case GAMES_TEAMPLAY:
;988://			strcpy( myargs, " team" );
;989://			break;
;990:
;991://		case GAMES_TOURNEY:
;992://			strcpy( myargs, " tourney" );
;993://			break;
;994:
;995://		case GAMES_CTF:
;996://			strcpy( myargs, " ctf" );
;997://			break;
;998:		}
;999:
;1000:
;1001:		if (g_emptyservers) {
ADDRGP4 g_emptyservers
INDIRI4
CNSTI4 0
EQI4 $511
line 1002
;1002:			strcat(myargs, " empty");
ADDRLP4 36
ARGP4
ADDRGP4 $513
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1003
;1003:		}
LABELV $511
line 1005
;1004:
;1005:		if (g_fullservers) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
EQI4 $514
line 1006
;1006:			strcat(myargs, " full");
ADDRLP4 36
ARGP4
ADDRGP4 $516
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1007
;1007:		}
LABELV $514
line 1009
;1008:
;1009:		protocol[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1010
;1010:		trap_Cvar_VariableStringBuffer( "debug_protocol", protocol, sizeof(protocol) );
ADDRGP4 $517
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1011
;1011:		if (strlen(protocol)) {
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $518
line 1012
;1012:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %s%s\n", i, protocol, myargs ));
ADDRGP4 $520
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1013
;1013:		}
ADDRGP4 $519
JUMPV
LABELV $518
line 1014
;1014:		else {
line 1015
;1015:			trap_Cmd_ExecuteText( EXEC_APPEND, va( "globalservers %d %d%s\n", i, (int)trap_Cvar_VariableValue( "protocol" ), myargs ) );
ADDRGP4 $522
ARGP4
ADDRLP4 80
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $521
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 80
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 36
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1016
;1016:		}
LABELV $519
line 1017
;1017:	}
LABELV $499
line 1018
;1018:}
LABELV $481
endproc ArenaServers_StartRefresh 88 16
export ArenaServers_SaveChanges
proc ArenaServers_SaveChanges 12 8
line 1027
;1019:
;1020:
;1021:/*
;1022:=================
;1023:ArenaServers_SaveChanges
;1024:=================
;1025:*/
;1026:void ArenaServers_SaveChanges( void )
;1027:{
line 1030
;1028:	int	i;
;1029:
;1030:	for (i=0; i<g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $527
JUMPV
LABELV $524
line 1031
;1031:		trap_Cvar_Set( va("server%d",i+1), g_arenaservers.favoriteaddresses[i] );
ADDRGP4 $366
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+13832
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $525
line 1030
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $527
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+14856
INDIRI4
LTI4 $524
line 1033
;1032:
;1033:	for (; i<MAX_FAVORITESERVERS; i++)
ADDRGP4 $533
JUMPV
LABELV $530
line 1034
;1034:		trap_Cvar_Set( va("server%d",i+1), "" );
ADDRGP4 $366
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $178
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $531
line 1033
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $533
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $530
line 1035
;1035:}
LABELV $523
endproc ArenaServers_SaveChanges 12 8
export ArenaServers_Sort
proc ArenaServers_Sort 0 16
line 1043
;1036:
;1037:
;1038:/*
;1039:=================
;1040:ArenaServers_Sort
;1041:=================
;1042:*/
;1043:void ArenaServers_Sort( int type ) {
line 1044
;1044:	if( g_sortkey == type ) {
ADDRGP4 g_sortkey
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $535
line 1045
;1045:		return;
ADDRGP4 $534
JUMPV
LABELV $535
line 1048
;1046:	}
;1047:
;1048:	g_sortkey = type;
ADDRGP4 g_sortkey
ADDRFP4 0
INDIRI4
ASGNI4
line 1049
;1049:	qsort( g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof( servernode_t ), ArenaServers_Compare);
ADDRGP4 g_arenaservers+13808
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ARGI4
CNSTI4 148
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1050
;1050:}
LABELV $534
endproc ArenaServers_Sort 0 16
export ArenaServers_SetType
proc ArenaServers_SetType 20 8
line 1059
;1051:
;1052:
;1053:/*
;1054:=================
;1055:ArenaServers_SetType
;1056:=================
;1057:*/
;1058:void ArenaServers_SetType( int type )
;1059:{
line 1060
;1060:	if (g_servertype == type)
ADDRGP4 g_servertype
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $540
line 1061
;1061:		return;
ADDRGP4 $539
JUMPV
LABELV $540
line 1063
;1062:
;1063:	g_servertype = type;
ADDRGP4 g_servertype
ADDRFP4 0
INDIRI4
ASGNI4
line 1065
;1064:
;1065:	switch( type ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $542
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $542
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $568
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $568
address $544
address $562
address $550
address $556
code
LABELV $542
LABELV $544
line 1068
;1066:	default:
;1067:	case AS_LOCAL:
;1068:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 4
ADDRGP4 g_arenaservers+1368+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1069
;1069:		g_arenaservers.serverlist = g_localserverlist;
ADDRGP4 g_arenaservers+13808
ADDRGP4 g_localserverlist
ASGNP4
line 1070
;1070:		g_arenaservers.numservers = &g_numlocalservers;
ADDRGP4 g_arenaservers+13804
ADDRGP4 g_numlocalservers
ASGNP4
line 1071
;1071:		g_arenaservers.maxservers = MAX_LOCALSERVERS;
ADDRGP4 g_arenaservers+13824
CNSTI4 128
ASGNI4
line 1072
;1072:		break;
ADDRGP4 $543
JUMPV
LABELV $550
line 1075
;1073:
;1074:	case AS_GLOBAL:
;1075:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
ADDRGP4 g_arenaservers+1368+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1076
;1076:		g_arenaservers.serverlist = g_globalserverlist;
ADDRGP4 g_arenaservers+13808
ADDRGP4 g_globalserverlist
ASGNP4
line 1077
;1077:		g_arenaservers.numservers = &g_numglobalservers;
ADDRGP4 g_arenaservers+13804
ADDRGP4 g_numglobalservers
ASGNP4
line 1078
;1078:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+13824
CNSTI4 128
ASGNI4
line 1079
;1079:		break;
ADDRGP4 $543
JUMPV
LABELV $556
line 1082
;1080:
;1081:	case AS_FAVORITES:
;1082:		g_arenaservers.remove.generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 12
ADDRGP4 g_arenaservers+1368+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 1083
;1083:		g_arenaservers.serverlist = g_favoriteserverlist;
ADDRGP4 g_arenaservers+13808
ADDRGP4 g_favoriteserverlist
ASGNP4
line 1084
;1084:		g_arenaservers.numservers = &g_numfavoriteservers;
ADDRGP4 g_arenaservers+13804
ADDRGP4 g_numfavoriteservers
ASGNP4
line 1085
;1085:		g_arenaservers.maxservers = MAX_FAVORITESERVERS;
ADDRGP4 g_arenaservers+13824
CNSTI4 16
ASGNI4
line 1086
;1086:		break;
ADDRGP4 $543
JUMPV
LABELV $562
line 1089
;1087:
;1088:	case AS_MPLAYER:
;1089:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 g_arenaservers+1368+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1090
;1090:		g_arenaservers.serverlist = g_mplayerserverlist;
ADDRGP4 g_arenaservers+13808
ADDRGP4 g_mplayerserverlist
ASGNP4
line 1091
;1091:		g_arenaservers.numservers = &g_nummplayerservers;
ADDRGP4 g_arenaservers+13804
ADDRGP4 g_nummplayerservers
ASGNP4
line 1092
;1092:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+13824
CNSTI4 128
ASGNI4
line 1093
;1093:		break;
LABELV $543
line 1097
;1094:		
;1095:	}
;1096:
;1097:	if( !*g_arenaservers.numservers ) {
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $569
line 1098
;1098:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1099
;1099:	}
ADDRGP4 $570
JUMPV
LABELV $569
line 1100
;1100:	else {
line 1102
;1101:		// avoid slow operation, use existing results
;1102:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+13812
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ASGNI4
line 1103
;1103:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers; 
ADDRGP4 g_arenaservers+13800
ADDRGP4 g_arenaservers+13804
INDIRP4
INDIRI4
ASGNI4
line 1104
;1104:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1105
;1105:	}
LABELV $570
line 1106
;1106:	strcpy(g_arenaservers.status.string,"hit refresh to update");
ADDRGP4 g_arenaservers+1224+60
INDIRP4
ARGP4
ADDRGP4 $578
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1107
;1107:}
LABELV $539
endproc ArenaServers_SetType 20 8
proc ArenaServers_Event 12 8
line 1114
;1108:
;1109:/*
;1110:=================
;1111:ArenaServers_Event
;1112:=================
;1113:*/
;1114:static void ArenaServers_Event( void* ptr, int event ) {
line 1118
;1115:	int		id;
;1116:	int value;
;1117:
;1118:	id = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1120
;1119:
;1120:	if( event != QM_ACTIVATED && id != ID_LIST ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $580
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $580
line 1121
;1121:		return;
ADDRGP4 $579
JUMPV
LABELV $580
line 1124
;1122:	}
;1123:
;1124:	switch( id ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $582
ADDRLP4 0
INDIRI4
CNSTI4 23
GTI4 $582
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $627-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $627
address $584
address $590
address $596
address $602
address $608
address $614
address $617
address $619
address $621
address $622
address $623
address $624
address $625
address $626
code
LABELV $584
line 1126
;1125:	case ID_MASTER:
;1126:		value = g_arenaservers.master.curvalue;
ADDRLP4 4
ADDRGP4 g_arenaservers+360+64
INDIRI4
ASGNI4
line 1127
;1127:		if (value >= 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $587
line 1128
;1128:		{
line 1129
;1129:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1130
;1130:		}
LABELV $587
line 1131
;1131:		trap_Cvar_SetValue( "ui_browserMaster", value );
ADDRGP4 $589
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1132
;1132:		ArenaServers_SetType( value );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1133
;1133:		break;
ADDRGP4 $583
JUMPV
LABELV $590
line 1136
;1134:
;1135:	case ID_GAMETYPE:
;1136:		trap_Cvar_SetValue( "ui_browserGameType", g_arenaservers.gametype.curvalue );
ADDRGP4 $591
ARGP4
ADDRGP4 g_arenaservers+456+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1137
;1137:		g_gametype = g_arenaservers.gametype.curvalue;
ADDRGP4 g_gametype
ADDRGP4 g_arenaservers+456+64
INDIRI4
ASGNI4
line 1138
;1138:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1139
;1139:		break;
ADDRGP4 $583
JUMPV
LABELV $596
line 1142
;1140:
;1141:	case ID_SORTKEY:
;1142:		trap_Cvar_SetValue( "ui_browserSortKey", g_arenaservers.sortkey.curvalue );
ADDRGP4 $597
ARGP4
ADDRGP4 g_arenaservers+552+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1143
;1143:		ArenaServers_Sort( g_arenaservers.sortkey.curvalue );
ADDRGP4 g_arenaservers+552+64
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Sort
CALLV
pop
line 1144
;1144:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1145
;1145:		break;
ADDRGP4 $583
JUMPV
LABELV $602
line 1148
;1146:
;1147:	case ID_SHOW_FULL:
;1148:		trap_Cvar_SetValue( "ui_browserShowFull", g_arenaservers.showfull.curvalue );
ADDRGP4 $603
ARGP4
ADDRGP4 g_arenaservers+648+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1149
;1149:		g_fullservers = g_arenaservers.showfull.curvalue;
ADDRGP4 g_fullservers
ADDRGP4 g_arenaservers+648+60
INDIRI4
ASGNI4
line 1150
;1150:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1151
;1151:		break;
ADDRGP4 $583
JUMPV
LABELV $608
line 1154
;1152:
;1153:	case ID_SHOW_EMPTY:
;1154:		trap_Cvar_SetValue( "ui_browserShowEmpty", g_arenaservers.showempty.curvalue );
ADDRGP4 $609
ARGP4
ADDRGP4 g_arenaservers+712+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1155
;1155:		g_emptyservers = g_arenaservers.showempty.curvalue;
ADDRGP4 g_emptyservers
ADDRGP4 g_arenaservers+712+60
INDIRI4
ASGNI4
line 1156
;1156:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1157
;1157:		break;
ADDRGP4 $583
JUMPV
LABELV $614
line 1160
;1158:
;1159:	case ID_LIST:
;1160:		if( event == QM_GOTFOCUS ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $583
line 1161
;1161:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1162
;1162:		}
line 1163
;1163:		break;
ADDRGP4 $583
JUMPV
LABELV $617
line 1166
;1164:
;1165:	case ID_SCROLL_UP:
;1166:		ScrollList_Key( &g_arenaservers.list, K_UPARROW );
ADDRGP4 g_arenaservers+776
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1167
;1167:		break;
ADDRGP4 $583
JUMPV
LABELV $619
line 1170
;1168:
;1169:	case ID_SCROLL_DOWN:
;1170:		ScrollList_Key( &g_arenaservers.list, K_DOWNARROW );
ADDRGP4 g_arenaservers+776
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1171
;1171:		break;
ADDRGP4 $583
JUMPV
LABELV $621
line 1174
;1172:
;1173:	case ID_BACK:
;1174:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1175
;1175:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1176
;1176:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1177
;1177:		break;
ADDRGP4 $583
JUMPV
LABELV $622
line 1180
;1178:
;1179:	case ID_REFRESH:
;1180:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1181
;1181:		break;
ADDRGP4 $583
JUMPV
LABELV $623
line 1184
;1182:
;1183:	case ID_SPECIFY:
;1184:		UI_SpecifyServerMenu();
ADDRGP4 UI_SpecifyServerMenu
CALLV
pop
line 1185
;1185:		break;
ADDRGP4 $583
JUMPV
LABELV $624
line 1188
;1186:
;1187:	case ID_CREATE:
;1188:		UI_StartServerMenu( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 1189
;1189:		break;
ADDRGP4 $583
JUMPV
LABELV $625
line 1192
;1190:
;1191:	case ID_CONNECT:
;1192:		ArenaServers_Go();
ADDRGP4 ArenaServers_Go
CALLV
pop
line 1193
;1193:		break;
ADDRGP4 $583
JUMPV
LABELV $626
line 1196
;1194:
;1195:	case ID_REMOVE:
;1196:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1197
;1197:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1198
;1198:		break;
LABELV $582
LABELV $583
line 1200
;1199:	}
;1200:}
LABELV $579
endproc ArenaServers_Event 12 8
proc ArenaServers_MenuDraw 0 4
line 1209
;1201:
;1202:
;1203:/*
;1204:=================
;1205:ArenaServers_MenuDraw
;1206:=================
;1207:*/
;1208:static void ArenaServers_MenuDraw( void )
;1209:{
line 1210
;1210:	if (g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+13816
INDIRI4
CNSTI4 0
EQI4 $630
line 1211
;1211:		ArenaServers_DoRefresh();
ADDRGP4 ArenaServers_DoRefresh
CALLV
pop
LABELV $630
line 1213
;1212:
;1213:	Menu_Draw( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1214
;1214:}
LABELV $629
endproc ArenaServers_MenuDraw 0 4
proc ArenaServers_MenuKey 16 8
line 1222
;1215:
;1216:
;1217:/*
;1218:=================
;1219:ArenaServers_MenuKey
;1220:=================
;1221:*/
;1222:static sfxHandle_t ArenaServers_MenuKey( int key ) {
line 1223
;1223:	if( key == K_SPACE  && g_arenaservers.refreshservers ) {
ADDRFP4 0
INDIRI4
CNSTI4 32
NEI4 $634
ADDRGP4 g_arenaservers+13816
INDIRI4
CNSTI4 0
EQI4 $634
line 1224
;1224:		ArenaServers_StopRefresh();	
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1225
;1225:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $633
JUMPV
LABELV $634
line 1228
;1226:	}
;1227:
;1228:	if( ( key == K_DEL || key == K_KP_DEL ) && ( g_servertype == AS_FAVORITES ) &&
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 140
EQI4 $640
ADDRLP4 0
INDIRI4
CNSTI4 171
NEI4 $637
LABELV $640
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $637
ADDRGP4 g_arenaservers
ARGP4
ADDRLP4 4
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRGP4 g_arenaservers+776
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $637
line 1229
;1229:		( Menu_ItemAtCursor( &g_arenaservers.menu) == &g_arenaservers.list ) ) {
line 1230
;1230:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1231
;1231:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1232
;1232:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $633
JUMPV
LABELV $637
line 1235
;1233:	}
;1234:
;1235:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 179
EQI4 $643
ADDRLP4 8
INDIRI4
CNSTI4 27
NEI4 $641
LABELV $643
line 1236
;1236:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1237
;1237:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1238
;1238:	}
LABELV $641
line 1241
;1239:
;1240:
;1241:	return Menu_DefaultKey( &g_arenaservers.menu, key );
ADDRGP4 g_arenaservers
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
LABELV $633
endproc ArenaServers_MenuKey 16 8
bss
align 1
LABELV $645
skip 64
code
proc ArenaServers_MenuInit 36 16
line 1250
;1242:}
;1243:
;1244:
;1245:/*
;1246:=================
;1247:ArenaServers_MenuInit
;1248:=================
;1249:*/
;1250:static void ArenaServers_MenuInit( void ) {
line 1258
;1251:	int			i;
;1252:	int			type;
;1253:	int			y;
;1254:	int			value;
;1255:	static char	statusbuffer[MAX_STATUSLENGTH];
;1256:
;1257:	// zero set all our globals
;1258:	memset( &g_arenaservers, 0 ,sizeof(arenaservers_t) );
ADDRGP4 g_arenaservers
ARGP4
CNSTI4 0
ARGI4
CNSTI4 14860
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1260
;1259:
;1260:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 1262
;1261:
;1262:	g_arenaservers.menu.fullscreen = qtrue;
ADDRGP4 g_arenaservers+280
CNSTI4 1
ASGNI4
line 1263
;1263:	g_arenaservers.menu.wrapAround = qtrue;
ADDRGP4 g_arenaservers+276
CNSTI4 1
ASGNI4
line 1264
;1264:	g_arenaservers.menu.draw       = ArenaServers_MenuDraw;
ADDRGP4 g_arenaservers+268
ADDRGP4 ArenaServers_MenuDraw
ASGNP4
line 1265
;1265:	g_arenaservers.menu.key        = ArenaServers_MenuKey;
ADDRGP4 g_arenaservers+272
ADDRGP4 ArenaServers_MenuKey
ASGNP4
line 1267
;1266:
;1267:	g_arenaservers.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 g_arenaservers+288
CNSTI4 10
ASGNI4
line 1268
;1268:	g_arenaservers.banner.generic.flags = QMF_CENTER_JUSTIFY;
ADDRGP4 g_arenaservers+288+44
CNSTU4 8
ASGNU4
line 1269
;1269:	g_arenaservers.banner.generic.x	    = 320;
ADDRGP4 g_arenaservers+288+12
CNSTI4 320
ASGNI4
line 1270
;1270:	g_arenaservers.banner.generic.y	    = 16;
ADDRGP4 g_arenaservers+288+16
CNSTI4 16
ASGNI4
line 1271
;1271:	g_arenaservers.banner.string  		= "GALLERIES";
ADDRGP4 g_arenaservers+288+60
ADDRGP4 $659
ASGNP4
line 1272
;1272:	g_arenaservers.banner.style  	    = UI_CENTER;
ADDRGP4 g_arenaservers+288+64
CNSTI4 1
ASGNI4
line 1273
;1273:	g_arenaservers.banner.color  	    = color_white;
ADDRGP4 g_arenaservers+288+68
ADDRGP4 color_white
ASGNP4
line 1275
;1274:
;1275:	y = 80;
ADDRLP4 4
CNSTI4 80
ASGNI4
line 1276
;1276:	g_arenaservers.master.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+360
CNSTI4 3
ASGNI4
line 1277
;1277:	g_arenaservers.master.generic.name			= "Servers:";
ADDRGP4 g_arenaservers+360+4
ADDRGP4 $667
ASGNP4
line 1278
;1278:	g_arenaservers.master.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+360+44
CNSTU4 258
ASGNU4
line 1279
;1279:	g_arenaservers.master.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+360+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1280
;1280:	g_arenaservers.master.generic.id			= ID_MASTER;
ADDRGP4 g_arenaservers+360+8
CNSTI4 10
ASGNI4
line 1281
;1281:	g_arenaservers.master.generic.x				= 320;
ADDRGP4 g_arenaservers+360+12
CNSTI4 320
ASGNI4
line 1282
;1282:	g_arenaservers.master.generic.y				= y;
ADDRGP4 g_arenaservers+360+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1283
;1283:	g_arenaservers.master.itemnames				= master_items;
ADDRGP4 g_arenaservers+360+76
ADDRGP4 master_items
ASGNP4
line 1285
;1284:
;1285:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1286
;1286:	g_arenaservers.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+456
CNSTI4 3
ASGNI4
line 1287
;1287:	g_arenaservers.gametype.generic.name		= "Game Type:";
ADDRGP4 g_arenaservers+456+4
ADDRGP4 $683
ASGNP4
line 1288
;1288:	g_arenaservers.gametype.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+456+44
CNSTU4 258
ASGNU4
line 1289
;1289:	g_arenaservers.gametype.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+456+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1290
;1290:	g_arenaservers.gametype.generic.id			= ID_GAMETYPE;
ADDRGP4 g_arenaservers+456+8
CNSTI4 11
ASGNI4
line 1291
;1291:	g_arenaservers.gametype.generic.x			= 320;
ADDRGP4 g_arenaservers+456+12
CNSTI4 320
ASGNI4
line 1292
;1292:	g_arenaservers.gametype.generic.y			= y;
ADDRGP4 g_arenaservers+456+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1293
;1293:	g_arenaservers.gametype.itemnames			= servertype_items;
ADDRGP4 g_arenaservers+456+76
ADDRGP4 servertype_items
ASGNP4
line 1295
;1294:
;1295:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1296
;1296:	g_arenaservers.sortkey.generic.type			= MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+552
CNSTI4 3
ASGNI4
line 1297
;1297:	g_arenaservers.sortkey.generic.name			= "Sort By:";
ADDRGP4 g_arenaservers+552+4
ADDRGP4 $699
ASGNP4
line 1298
;1298:	g_arenaservers.sortkey.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+552+44
CNSTU4 258
ASGNU4
line 1299
;1299:	g_arenaservers.sortkey.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+552+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1300
;1300:	g_arenaservers.sortkey.generic.id			= ID_SORTKEY;
ADDRGP4 g_arenaservers+552+8
CNSTI4 12
ASGNI4
line 1301
;1301:	g_arenaservers.sortkey.generic.x			= 320;
ADDRGP4 g_arenaservers+552+12
CNSTI4 320
ASGNI4
line 1302
;1302:	g_arenaservers.sortkey.generic.y			= y;
ADDRGP4 g_arenaservers+552+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1303
;1303:	g_arenaservers.sortkey.itemnames			= sortkey_items;
ADDRGP4 g_arenaservers+552+76
ADDRGP4 sortkey_items
ASGNP4
line 1305
;1304:
;1305:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1306
;1306:	g_arenaservers.showfull.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+648
CNSTI4 5
ASGNI4
line 1307
;1307:	g_arenaservers.showfull.generic.name		= "Show Full:";
ADDRGP4 g_arenaservers+648+4
ADDRGP4 $715
ASGNP4
line 1308
;1308:	g_arenaservers.showfull.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+648+44
CNSTU4 258
ASGNU4
line 1309
;1309:	g_arenaservers.showfull.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+648+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1310
;1310:	g_arenaservers.showfull.generic.id			= ID_SHOW_FULL;
ADDRGP4 g_arenaservers+648+8
CNSTI4 13
ASGNI4
line 1311
;1311:	g_arenaservers.showfull.generic.x			= 320;
ADDRGP4 g_arenaservers+648+12
CNSTI4 320
ASGNI4
line 1312
;1312:	g_arenaservers.showfull.generic.y			= y;
ADDRGP4 g_arenaservers+648+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1314
;1313:
;1314:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1315
;1315:	g_arenaservers.showempty.generic.type		= MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+712
CNSTI4 5
ASGNI4
line 1316
;1316:	g_arenaservers.showempty.generic.name		= "Show Empty:";
ADDRGP4 g_arenaservers+712+4
ADDRGP4 $729
ASGNP4
line 1317
;1317:	g_arenaservers.showempty.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 g_arenaservers+712+44
CNSTU4 258
ASGNU4
line 1318
;1318:	g_arenaservers.showempty.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+712+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1319
;1319:	g_arenaservers.showempty.generic.id			= ID_SHOW_EMPTY;
ADDRGP4 g_arenaservers+712+8
CNSTI4 14
ASGNI4
line 1320
;1320:	g_arenaservers.showempty.generic.x			= 320;
ADDRGP4 g_arenaservers+712+12
CNSTI4 320
ASGNI4
line 1321
;1321:	g_arenaservers.showempty.generic.y			= y;
ADDRGP4 g_arenaservers+712+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1323
;1322:
;1323:	y += 3 * SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 48
ADDI4
ASGNI4
line 1324
;1324:	g_arenaservers.list.generic.type			= MTYPE_SCROLLLIST;
ADDRGP4 g_arenaservers+776
CNSTI4 8
ASGNI4
line 1325
;1325:	g_arenaservers.list.generic.flags			= QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 g_arenaservers+776+44
CNSTU4 128
ASGNU4
line 1326
;1326:	g_arenaservers.list.generic.id				= ID_LIST;
ADDRGP4 g_arenaservers+776+8
CNSTI4 15
ASGNI4
line 1327
;1327:	g_arenaservers.list.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+776+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1328
;1328:	g_arenaservers.list.generic.x				= 72;
ADDRGP4 g_arenaservers+776+12
CNSTI4 72
ASGNI4
line 1329
;1329:	g_arenaservers.list.generic.y				= y;
ADDRGP4 g_arenaservers+776+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1330
;1330:	g_arenaservers.list.width					= MAX_LISTBOXWIDTH;
ADDRGP4 g_arenaservers+776+80
CNSTI4 68
ASGNI4
line 1331
;1331:	g_arenaservers.list.height					= 11;
ADDRGP4 g_arenaservers+776+84
CNSTI4 11
ASGNI4
line 1332
;1332:	g_arenaservers.list.itemnames				= (const char **)g_arenaservers.items;
ADDRGP4 g_arenaservers+776+76
ADDRGP4 g_arenaservers+13288
ASGNP4
line 1333
;1333:	for( i = 0; i < MAX_LISTBOXITEMS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $758
line 1334
;1334:		g_arenaservers.items[i] = g_arenaservers.table[i].buff;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaservers+13288
ADDP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaservers+4072
ADDP4
ASGNP4
line 1335
;1335:	}
LABELV $759
line 1333
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $758
line 1337
;1336:
;1337:	g_arenaservers.mappic.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+872
CNSTI4 6
ASGNI4
line 1338
;1338:	g_arenaservers.mappic.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+872+44
CNSTU4 16388
ASGNU4
line 1339
;1339:	g_arenaservers.mappic.generic.x				= 72;
ADDRGP4 g_arenaservers+872+12
CNSTI4 72
ASGNI4
line 1340
;1340:	g_arenaservers.mappic.generic.y				= 80;
ADDRGP4 g_arenaservers+872+16
CNSTI4 80
ASGNI4
line 1341
;1341:	g_arenaservers.mappic.width					= 128;
ADDRGP4 g_arenaservers+872+76
CNSTI4 128
ASGNI4
line 1342
;1342:	g_arenaservers.mappic.height				= 96;
ADDRGP4 g_arenaservers+872+80
CNSTI4 96
ASGNI4
line 1343
;1343:	g_arenaservers.mappic.errorpic				= ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+872+64
ADDRGP4 $777
ASGNP4
line 1345
;1344:
;1345:	g_arenaservers.arrows.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+960
CNSTI4 6
ASGNI4
line 1346
;1346:	g_arenaservers.arrows.generic.name			= ART_ARROWS0;
ADDRGP4 g_arenaservers+960+4
ADDRGP4 $781
ASGNP4
line 1347
;1347:	g_arenaservers.arrows.generic.flags			= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 g_arenaservers+960+44
CNSTU4 16388
ASGNU4
line 1348
;1348:	g_arenaservers.arrows.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+960+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1349
;1349:	g_arenaservers.arrows.generic.x				= 512+48;
ADDRGP4 g_arenaservers+960+12
CNSTI4 560
ASGNI4
line 1350
;1350:	g_arenaservers.arrows.generic.y				= 240-64+16;
ADDRGP4 g_arenaservers+960+16
CNSTI4 192
ASGNI4
line 1351
;1351:	g_arenaservers.arrows.width					= 64;
ADDRGP4 g_arenaservers+960+76
CNSTI4 64
ASGNI4
line 1352
;1352:	g_arenaservers.arrows.height				= 128;
ADDRGP4 g_arenaservers+960+80
CNSTI4 128
ASGNI4
line 1354
;1353:
;1354:	g_arenaservers.up.generic.type				= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1048
CNSTI4 6
ASGNI4
line 1355
;1355:	g_arenaservers.up.generic.flags				= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1048+44
CNSTU4 2308
ASGNU4
line 1356
;1356:	g_arenaservers.up.generic.callback			= ArenaServers_Event;
ADDRGP4 g_arenaservers+1048+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1357
;1357:	g_arenaservers.up.generic.id				= ID_SCROLL_UP;
ADDRGP4 g_arenaservers+1048+8
CNSTI4 16
ASGNI4
line 1358
;1358:	g_arenaservers.up.generic.x					= 512+48;
ADDRGP4 g_arenaservers+1048+12
CNSTI4 560
ASGNI4
line 1359
;1359:	g_arenaservers.up.generic.y					= 240-64+16;
ADDRGP4 g_arenaservers+1048+16
CNSTI4 192
ASGNI4
line 1360
;1360:	g_arenaservers.up.width						= 64;
ADDRGP4 g_arenaservers+1048+76
CNSTI4 64
ASGNI4
line 1361
;1361:	g_arenaservers.up.height					= 64;
ADDRGP4 g_arenaservers+1048+80
CNSTI4 64
ASGNI4
line 1362
;1362:	g_arenaservers.up.focuspic					= ART_ARROWS_UP;
ADDRGP4 g_arenaservers+1048+60
ADDRGP4 $811
ASGNP4
line 1364
;1363:
;1364:	g_arenaservers.down.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1136
CNSTI4 6
ASGNI4
line 1365
;1365:	g_arenaservers.down.generic.flags			= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1136+44
CNSTU4 2308
ASGNU4
line 1366
;1366:	g_arenaservers.down.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1136+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1367
;1367:	g_arenaservers.down.generic.id				= ID_SCROLL_DOWN;
ADDRGP4 g_arenaservers+1136+8
CNSTI4 17
ASGNI4
line 1368
;1368:	g_arenaservers.down.generic.x				= 512+48;
ADDRGP4 g_arenaservers+1136+12
CNSTI4 560
ASGNI4
line 1369
;1369:	g_arenaservers.down.generic.y				= 240+16;
ADDRGP4 g_arenaservers+1136+16
CNSTI4 256
ASGNI4
line 1370
;1370:	g_arenaservers.down.width					= 64;
ADDRGP4 g_arenaservers+1136+76
CNSTI4 64
ASGNI4
line 1371
;1371:	g_arenaservers.down.height					= 64;
ADDRGP4 g_arenaservers+1136+80
CNSTI4 64
ASGNI4
line 1372
;1372:	g_arenaservers.down.focuspic				= ART_ARROWS_DOWN;
ADDRGP4 g_arenaservers+1136+60
ADDRGP4 $829
ASGNP4
line 1374
;1373:
;1374:	y = 376;
ADDRLP4 4
CNSTI4 376
ASGNI4
line 1375
;1375:	g_arenaservers.status.generic.type		= MTYPE_TEXT;
ADDRGP4 g_arenaservers+1224
CNSTI4 7
ASGNI4
line 1376
;1376:	g_arenaservers.status.generic.x			= 320;
ADDRGP4 g_arenaservers+1224+12
CNSTI4 320
ASGNI4
line 1377
;1377:	g_arenaservers.status.generic.y			= y;
ADDRGP4 g_arenaservers+1224+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1378
;1378:	g_arenaservers.status.string			= statusbuffer;
ADDRGP4 g_arenaservers+1224+60
ADDRGP4 $645
ASGNP4
line 1379
;1379:	g_arenaservers.status.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1224+64
CNSTI4 17
ASGNI4
line 1380
;1380:	g_arenaservers.status.color				= menu_text_color;
ADDRGP4 g_arenaservers+1224+68
ADDRGP4 menu_text_color
ASGNP4
line 1382
;1381:
;1382:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1383
;1383:	g_arenaservers.statusbar.generic.type   = MTYPE_TEXT;
ADDRGP4 g_arenaservers+1296
CNSTI4 7
ASGNI4
line 1384
;1384:	g_arenaservers.statusbar.generic.x	    = 320;
ADDRGP4 g_arenaservers+1296+12
CNSTI4 320
ASGNI4
line 1385
;1385:	g_arenaservers.statusbar.generic.y	    = y;
ADDRGP4 g_arenaservers+1296+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1386
;1386:	g_arenaservers.statusbar.string	        = "";
ADDRGP4 g_arenaservers+1296+60
ADDRGP4 $178
ASGNP4
line 1387
;1387:	g_arenaservers.statusbar.style	        = UI_CENTER|UI_SMALLFONT;
ADDRGP4 g_arenaservers+1296+64
CNSTI4 17
ASGNI4
line 1388
;1388:	g_arenaservers.statusbar.color	        = text_color_normal;
ADDRGP4 g_arenaservers+1296+68
ADDRGP4 text_color_normal
ASGNP4
line 1390
;1389:
;1390:	g_arenaservers.remove.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1368
CNSTI4 6
ASGNI4
line 1391
;1391:	g_arenaservers.remove.generic.name		= ART_REMOVE0;
ADDRGP4 g_arenaservers+1368+4
ADDRGP4 $855
ASGNP4
line 1392
;1392:	g_arenaservers.remove.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1368+44
CNSTU4 260
ASGNU4
line 1393
;1393:	g_arenaservers.remove.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1368+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1394
;1394:	g_arenaservers.remove.generic.id		= ID_REMOVE;
ADDRGP4 g_arenaservers+1368+8
CNSTI4 23
ASGNI4
line 1395
;1395:	g_arenaservers.remove.generic.x			= 450;
ADDRGP4 g_arenaservers+1368+12
CNSTI4 450
ASGNI4
line 1396
;1396:	g_arenaservers.remove.generic.y			= 86;
ADDRGP4 g_arenaservers+1368+16
CNSTI4 86
ASGNI4
line 1397
;1397:	g_arenaservers.remove.width				= 96;
ADDRGP4 g_arenaservers+1368+76
CNSTI4 96
ASGNI4
line 1398
;1398:	g_arenaservers.remove.height			= 48;
ADDRGP4 g_arenaservers+1368+80
CNSTI4 48
ASGNI4
line 1399
;1399:	g_arenaservers.remove.focuspic			= ART_REMOVE1;
ADDRGP4 g_arenaservers+1368+60
ADDRGP4 $872
ASGNP4
line 1401
;1400:
;1401:	g_arenaservers.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1456
CNSTI4 6
ASGNI4
line 1402
;1402:	g_arenaservers.back.generic.name		= ART_BACK0;
ADDRGP4 g_arenaservers+1456+4
ADDRGP4 $876
ASGNP4
line 1403
;1403:	g_arenaservers.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1456+44
CNSTU4 260
ASGNU4
line 1404
;1404:	g_arenaservers.back.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1456+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1405
;1405:	g_arenaservers.back.generic.id			= ID_BACK;
ADDRGP4 g_arenaservers+1456+8
CNSTI4 18
ASGNI4
line 1406
;1406:	g_arenaservers.back.generic.x			= 0;
ADDRGP4 g_arenaservers+1456+12
CNSTI4 0
ASGNI4
line 1407
;1407:	g_arenaservers.back.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1456+16
CNSTI4 416
ASGNI4
line 1408
;1408:	g_arenaservers.back.width				= 128;
ADDRGP4 g_arenaservers+1456+76
CNSTI4 128
ASGNI4
line 1409
;1409:	g_arenaservers.back.height				= 64;
ADDRGP4 g_arenaservers+1456+80
CNSTI4 64
ASGNI4
line 1410
;1410:	g_arenaservers.back.focuspic			= ART_BACK1;
ADDRGP4 g_arenaservers+1456+60
ADDRGP4 $893
ASGNP4
line 1412
;1411:
;1412:	g_arenaservers.specify.generic.type	    = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1632
CNSTI4 6
ASGNI4
line 1413
;1413:	g_arenaservers.specify.generic.name		= ART_SPECIFY0;
ADDRGP4 g_arenaservers+1632+4
ADDRGP4 $897
ASGNP4
line 1414
;1414:	g_arenaservers.specify.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1632+44
CNSTU4 260
ASGNU4
line 1415
;1415:	g_arenaservers.specify.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1632+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1416
;1416:	g_arenaservers.specify.generic.id	    = ID_SPECIFY;
ADDRGP4 g_arenaservers+1632+8
CNSTI4 20
ASGNI4
line 1417
;1417:	g_arenaservers.specify.generic.x		= 128;
ADDRGP4 g_arenaservers+1632+12
CNSTI4 128
ASGNI4
line 1418
;1418:	g_arenaservers.specify.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1632+16
CNSTI4 416
ASGNI4
line 1419
;1419:	g_arenaservers.specify.width  		    = 128;
ADDRGP4 g_arenaservers+1632+76
CNSTI4 128
ASGNI4
line 1420
;1420:	g_arenaservers.specify.height  		    = 64;
ADDRGP4 g_arenaservers+1632+80
CNSTI4 64
ASGNI4
line 1421
;1421:	g_arenaservers.specify.focuspic         = ART_SPECIFY1;
ADDRGP4 g_arenaservers+1632+60
ADDRGP4 $914
ASGNP4
line 1423
;1422:
;1423:	g_arenaservers.refresh.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1544
CNSTI4 6
ASGNI4
line 1424
;1424:	g_arenaservers.refresh.generic.name		= ART_REFRESH0;
ADDRGP4 g_arenaservers+1544+4
ADDRGP4 $918
ASGNP4
line 1425
;1425:	g_arenaservers.refresh.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1544+44
CNSTU4 260
ASGNU4
line 1426
;1426:	g_arenaservers.refresh.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1544+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1427
;1427:	g_arenaservers.refresh.generic.id		= ID_REFRESH;
ADDRGP4 g_arenaservers+1544+8
CNSTI4 19
ASGNI4
line 1428
;1428:	g_arenaservers.refresh.generic.x		= 256;
ADDRGP4 g_arenaservers+1544+12
CNSTI4 256
ASGNI4
line 1429
;1429:	g_arenaservers.refresh.generic.y		= 480-64;
ADDRGP4 g_arenaservers+1544+16
CNSTI4 416
ASGNI4
line 1430
;1430:	g_arenaservers.refresh.width			= 128;
ADDRGP4 g_arenaservers+1544+76
CNSTI4 128
ASGNI4
line 1431
;1431:	g_arenaservers.refresh.height			= 64;
ADDRGP4 g_arenaservers+1544+80
CNSTI4 64
ASGNI4
line 1432
;1432:	g_arenaservers.refresh.focuspic			= ART_REFRESH1;
ADDRGP4 g_arenaservers+1544+60
ADDRGP4 $935
ASGNP4
line 1434
;1433:
;1434:	g_arenaservers.create.generic.type		= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1720
CNSTI4 6
ASGNI4
line 1435
;1435:	g_arenaservers.create.generic.name		= ART_CREATE0;
ADDRGP4 g_arenaservers+1720+4
ADDRGP4 $939
ASGNP4
line 1436
;1436:	g_arenaservers.create.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1720+44
CNSTU4 260
ASGNU4
line 1437
;1437:	g_arenaservers.create.generic.callback	= ArenaServers_Event;
ADDRGP4 g_arenaservers+1720+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1438
;1438:	g_arenaservers.create.generic.id		= ID_CREATE;
ADDRGP4 g_arenaservers+1720+8
CNSTI4 21
ASGNI4
line 1439
;1439:	g_arenaservers.create.generic.x			= 384;
ADDRGP4 g_arenaservers+1720+12
CNSTI4 384
ASGNI4
line 1440
;1440:	g_arenaservers.create.generic.y			= 480-64;
ADDRGP4 g_arenaservers+1720+16
CNSTI4 416
ASGNI4
line 1441
;1441:	g_arenaservers.create.width				= 128;
ADDRGP4 g_arenaservers+1720+76
CNSTI4 128
ASGNI4
line 1442
;1442:	g_arenaservers.create.height			= 64;
ADDRGP4 g_arenaservers+1720+80
CNSTI4 64
ASGNI4
line 1443
;1443:	g_arenaservers.create.focuspic			= ART_CREATE1;
ADDRGP4 g_arenaservers+1720+60
ADDRGP4 $956
ASGNP4
line 1445
;1444:
;1445:	g_arenaservers.go.generic.type			= MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1808
CNSTI4 6
ASGNI4
line 1446
;1446:	g_arenaservers.go.generic.name			= ART_CONNECT0;
ADDRGP4 g_arenaservers+1808+4
ADDRGP4 $960
ASGNP4
line 1447
;1447:	g_arenaservers.go.generic.flags			= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1808+44
CNSTU4 272
ASGNU4
line 1448
;1448:	g_arenaservers.go.generic.callback		= ArenaServers_Event;
ADDRGP4 g_arenaservers+1808+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1449
;1449:	g_arenaservers.go.generic.id			= ID_CONNECT;
ADDRGP4 g_arenaservers+1808+8
CNSTI4 22
ASGNI4
line 1450
;1450:	g_arenaservers.go.generic.x				= 640;
ADDRGP4 g_arenaservers+1808+12
CNSTI4 640
ASGNI4
line 1451
;1451:	g_arenaservers.go.generic.y				= 480-64;
ADDRGP4 g_arenaservers+1808+16
CNSTI4 416
ASGNI4
line 1452
;1452:	g_arenaservers.go.width					= 128;
ADDRGP4 g_arenaservers+1808+76
CNSTI4 128
ASGNI4
line 1453
;1453:	g_arenaservers.go.height				= 64;
ADDRGP4 g_arenaservers+1808+80
CNSTI4 64
ASGNI4
line 1454
;1454:	g_arenaservers.go.focuspic				= ART_CONNECT1;
ADDRGP4 g_arenaservers+1808+60
ADDRGP4 $977
ASGNP4
line 1456
;1455:	
;1456:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.banner );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1458
;1457:
;1458:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.master );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1459
;1459:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.gametype );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1460
;1460:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.sortkey );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+552
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1461
;1461:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showfull);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1462
;1462:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.showempty );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+712
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1464
;1463:
;1464:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.mappic );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+872
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1465
;1465:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.list );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1466
;1466:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.status );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1224
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1467
;1467:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.statusbar );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1468
;1468:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.arrows );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+960
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1469
;1469:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.up );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1048
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1470
;1470:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.down );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1136
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1472
;1471:
;1472:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.remove );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1368
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1473
;1473:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.back );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1474
;1474:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.specify );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1632
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1475
;1475:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.refresh );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1544
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1476
;1476:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.create );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1720
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1477
;1477:	Menu_AddItem( &g_arenaservers.menu, (void*) &g_arenaservers.go );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1808
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1480
;1478:
;1479:	
;1480:	ArenaServers_LoadFavorites();
ADDRGP4 ArenaServers_LoadFavorites
CALLV
pop
line 1482
;1481:
;1482:	g_servertype = Com_Clamp( 0, 3, ui_browserMaster.integer );
CNSTF4 0
ARGF4
CNSTF4 1077936128
ARGF4
ADDRGP4 ui_browserMaster+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_servertype
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1484
;1483:	// hack to get rid of MPlayer stuff
;1484:	value = g_servertype;
ADDRLP4 8
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1485
;1485:	if (value >= 1)
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $998
line 1486
;1486:		value--;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $998
line 1487
;1487:	g_arenaservers.master.curvalue = value;
ADDRGP4 g_arenaservers+360+64
ADDRLP4 8
INDIRI4
ASGNI4
line 1489
;1488:
;1489:	g_gametype = Com_Clamp( 0, 4, ui_browserGameType.integer );
CNSTF4 0
ARGF4
CNSTF4 1082130432
ARGF4
ADDRGP4 ui_browserGameType+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_gametype
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 1490
;1490:	g_arenaservers.gametype.curvalue = g_gametype;
ADDRGP4 g_arenaservers+456+64
ADDRGP4 g_gametype
INDIRI4
ASGNI4
line 1492
;1491:
;1492:	g_sortkey = Com_Clamp( 0, 4, ui_browserSortKey.integer );
CNSTF4 0
ARGF4
CNSTF4 1082130432
ARGF4
ADDRGP4 ui_browserSortKey+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_sortkey
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 1493
;1493:	g_arenaservers.sortkey.curvalue = g_sortkey;
ADDRGP4 g_arenaservers+552+64
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
line 1495
;1494:
;1495:	g_fullservers = Com_Clamp( 0, 1, ui_browserShowFull.integer );
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowFull+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_fullservers
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 1496
;1496:	g_arenaservers.showfull.curvalue = g_fullservers;
ADDRGP4 g_arenaservers+648+60
ADDRGP4 g_fullservers
INDIRI4
ASGNI4
line 1498
;1497:
;1498:	g_emptyservers = Com_Clamp( 0, 1, ui_browserShowEmpty.integer );
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowEmpty+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_emptyservers
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 1499
;1499:	g_arenaservers.showempty.curvalue = g_emptyservers;	
ADDRGP4 g_arenaservers+712+60
ADDRGP4 g_emptyservers
INDIRI4
ASGNI4
line 1503
;1500:
;1501:
;1502:	// force to initial state and refresh
;1503:	type = g_servertype;
ADDRLP4 12
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1504
;1504:	g_servertype = -1;
ADDRGP4 g_servertype
CNSTI4 -1
ASGNI4
line 1505
;1505:	ArenaServers_SetType( type );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1507
;1506:
;1507:	trap_Cvar_Register(NULL, "debug_protocol", "", 0 );
CNSTP4 0
ARGP4
ADDRGP4 $517
ARGP4
ADDRGP4 $178
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1508
;1508:}
LABELV $644
endproc ArenaServers_MenuInit 36 16
export ArenaServers_Cache
proc ArenaServers_Cache 0 4
line 1516
;1509:
;1510:
;1511:/*
;1512:=================
;1513:ArenaServers_Cache
;1514:=================
;1515:*/
;1516:void ArenaServers_Cache( void ) {
line 1517
;1517:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $876
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1518
;1518:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $893
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1519
;1519:	trap_R_RegisterShaderNoMip( ART_CREATE0 );
ADDRGP4 $939
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1520
;1520:	trap_R_RegisterShaderNoMip( ART_CREATE1 );
ADDRGP4 $956
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1521
;1521:	trap_R_RegisterShaderNoMip( ART_SPECIFY0 );
ADDRGP4 $897
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1522
;1522:	trap_R_RegisterShaderNoMip( ART_SPECIFY1 );
ADDRGP4 $914
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1523
;1523:	trap_R_RegisterShaderNoMip( ART_REFRESH0 );
ADDRGP4 $918
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1524
;1524:	trap_R_RegisterShaderNoMip( ART_REFRESH1 );
ADDRGP4 $935
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1525
;1525:	trap_R_RegisterShaderNoMip( ART_CONNECT0 );
ADDRGP4 $960
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1526
;1526:	trap_R_RegisterShaderNoMip( ART_CONNECT1 );
ADDRGP4 $977
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1527
;1527:	trap_R_RegisterShaderNoMip( ART_ARROWS0  );
ADDRGP4 $781
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1528
;1528:	trap_R_RegisterShaderNoMip( ART_ARROWS_UP );
ADDRGP4 $811
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1529
;1529:	trap_R_RegisterShaderNoMip( ART_ARROWS_DOWN );
ADDRGP4 $829
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1530
;1530:	trap_R_RegisterShaderNoMip( ART_UNKNOWNMAP );
ADDRGP4 $777
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1531
;1531:}
LABELV $1014
endproc ArenaServers_Cache 0 4
export UI_ArenaServersMenu
proc UI_ArenaServersMenu 0 4
line 1539
;1532:
;1533:
;1534:/*
;1535:=================
;1536:UI_ArenaServersMenu
;1537:=================
;1538:*/
;1539:void UI_ArenaServersMenu( void ) {
line 1540
;1540:	ArenaServers_MenuInit();
ADDRGP4 ArenaServers_MenuInit
CALLV
pop
line 1541
;1541:	UI_PushMenu( &g_arenaservers.menu );
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1542
;1542:}						  
LABELV $1015
endproc UI_ArenaServersMenu 0 4
bss
align 4
LABELV g_fullservers
skip 4
align 4
LABELV g_emptyservers
skip 4
align 4
LABELV g_sortkey
skip 4
align 4
LABELV g_gametype
skip 4
align 4
LABELV g_servertype
skip 4
align 4
LABELV g_nummplayerservers
skip 4
align 4
LABELV g_mplayerserverlist
skip 18944
align 4
LABELV g_numfavoriteservers
skip 4
align 4
LABELV g_favoriteserverlist
skip 2368
align 4
LABELV g_numlocalservers
skip 4
align 4
LABELV g_localserverlist
skip 18944
align 4
LABELV g_numglobalservers
skip 4
align 4
LABELV g_globalserverlist
skip 18944
align 4
LABELV g_arenaservers
skip 14860
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
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
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
LABELV $977
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
LABELV $960
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
LABELV $956
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $939
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $935
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
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $918
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
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $914
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
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $897
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
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $893
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
LABELV $876
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
LABELV $872
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $855
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $829
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $811
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $781
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $777
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
LABELV $729
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $715
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $699
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 66
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $683
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $667
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $659
byte 1 71
byte 1 65
byte 1 76
byte 1 76
byte 1 69
byte 1 82
byte 1 73
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $609
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
LABELV $603
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
LABELV $597
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
LABELV $591
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
LABELV $589
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
LABELV $578
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $522
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
LABELV $521
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
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $520
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
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $517
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
LABELV $516
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $513
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $510
byte 1 32
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $498
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
LABELV $476
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $366
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $345
byte 1 78
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $337
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
LABELV $336
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $335
byte 1 110
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $334
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $333
byte 1 109
byte 1 105
byte 1 110
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $332
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
LABELV $331
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $330
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $329
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
LABELV $268
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 46
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 46
byte 1 49
byte 1 50
byte 1 115
byte 1 32
byte 1 37
byte 1 50
byte 1 100
byte 1 47
byte 1 37
byte 1 50
byte 1 100
byte 1 32
byte 1 37
byte 1 45
byte 1 56
byte 1 46
byte 1 56
byte 1 115
byte 1 32
byte 1 37
byte 1 51
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 51
byte 1 100
byte 1 32
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $267
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $266
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $263
byte 1 94
byte 1 50
byte 1 0
align 1
LABELV $258
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $211
byte 1 78
byte 1 111
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $208
byte 1 78
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 32
byte 1 70
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $184
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $178
byte 1 0
align 1
LABELV $154
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 83
byte 1 80
byte 1 65
byte 1 67
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $149
byte 1 37
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $133
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
LABELV $120
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
LABELV $85
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
LABELV $80
byte 1 73
byte 1 80
byte 1 88
byte 1 0
align 1
LABELV $79
byte 1 85
byte 1 68
byte 1 80
byte 1 0
align 1
LABELV $78
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $77
byte 1 71
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $76
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
LABELV $75
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
LABELV $74
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
LABELV $73
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
LABELV $72
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
LABELV $71
byte 1 71
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $70
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $69
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
LABELV $68
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
LABELV $67
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 0
