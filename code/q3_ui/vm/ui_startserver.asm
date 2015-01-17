data
align 4
LABELV gametype_items
address $68
byte 4 0
align 4
LABELV gametype_remap
byte 4 0
byte 4 3
byte 4 1
byte 4 4
align 4
LABELV gametype_remap2
byte 4 0
byte 4 2
byte 4 0
byte 4 1
byte 4 3
code
proc GametypeBits 36 8
file "../ui_startserver.c"
line 94
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:START SERVER MENU *****
;7:
;8:=============================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define GAMESERVER_BACK0		"menu/art/back_0"
;16:#define GAMESERVER_BACK1		"menu/art/back_1"
;17:#define GAMESERVER_NEXT0		"menu/art/next_0"
;18:#define GAMESERVER_NEXT1		"menu/art/next_1"
;19://#define GAMESERVER_FRAMEL		"menu/art/frame2_l"
;20://#define GAMESERVER_FRAMER		"menu/art/frame1_r"
;21:#define GAMESERVER_SELECT		"menu/art/maps_select"
;22:#define GAMESERVER_SELECTED		"menu/art/maps_selected"
;23:#define GAMESERVER_FIGHT0		"menu/art/fight_0"
;24:#define GAMESERVER_FIGHT1		"menu/art/fight_1"
;25:#define GAMESERVER_UNKNOWNMAP	"menu/art/unknownmap"
;26:#define GAMESERVER_ARROWS		"menu/art/gs_arrows_0"
;27:#define GAMESERVER_ARROWSL		"menu/art/gs_arrows_l"
;28:#define GAMESERVER_ARROWSR		"menu/art/gs_arrows_r"
;29:
;30:#define MAX_MAPROWS		2
;31:#define MAX_MAPCOLS		2
;32:#define MAX_MAPSPERPAGE	4
;33:
;34:#define	MAX_SERVERSTEXT	8192
;35:
;36:#define MAX_SERVERMAPS	64
;37:#define MAX_NAMELENGTH	16
;38:
;39:#define ID_GAMETYPE				10
;40:#define ID_PICTURES				11	// 12, 13, 14
;41:#define ID_PREVPAGE				15
;42:#define ID_NEXTPAGE				16
;43:#define ID_STARTSERVERBACK		17
;44:#define ID_STARTSERVERNEXT		18
;45:
;46:typedef struct {
;47:	menuframework_s	menu;
;48:
;49:	menutext_s		banner;
;50://	menubitmap_s	framel;
;51://	menubitmap_s	framer;
;52:
;53:	menulist_s		gametype;
;54:	menubitmap_s	mappics[MAX_MAPSPERPAGE];
;55:	menubitmap_s	mapbuttons[MAX_MAPSPERPAGE];
;56:	menubitmap_s	arrows;
;57:	menubitmap_s	prevpage;
;58:	menubitmap_s	nextpage;
;59:	menubitmap_s	back;
;60:	menubitmap_s	next;
;61:
;62:	menutext_s		mapname;
;63:	menubitmap_s	item_null;
;64:
;65:	qboolean		multiplayer;
;66:	int				currentmap;
;67:	int				nummaps;
;68:	int				page;
;69:	int				maxpages;
;70:	char			maplist[MAX_SERVERMAPS][MAX_NAMELENGTH];
;71:	int				mapGamebits[MAX_SERVERMAPS];
;72:} startserver_t;
;73:
;74:static startserver_t s_startserver;
;75:
;76:static const char *gametype_items[] = {
;77:	"Galleries",
;78:	0
;79:};
;80:
;81:static int gametype_remap[] = {GT_FFA, GT_TEAM, GT_TOURNAMENT, GT_CTF};
;82:static int gametype_remap2[] = {0, 2, 0, 1, 3};
;83:
;84:// use ui_servers2.c definition
;85:
;86:static void UI_ServerOptionsMenu( qboolean multiplayer );
;87:
;88:
;89:/*
;90:=================
;91:GametypeBits
;92:=================
;93:*/
;94:static int GametypeBits( char *string ) {
line 99
;95:	int		bits;
;96:	char	*p;
;97:	char	*token;
;98:
;99:	bits = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 100
;100:	p = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $71
JUMPV
LABELV $70
line 101
;101:	while( 1 ) {
line 102
;102:		token = COM_ParseExt( &p, qfalse );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 103
;103:		if( token[0] == 0 ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $73
line 104
;104:			break;
ADDRGP4 $72
JUMPV
LABELV $73
line 107
;105:		}
;106:
;107:		if( Q_stricmp( token, "ffa" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $77
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $75
line 108
;108:			bits |= 1 << GT_FFA;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 109
;109:			continue;
ADDRGP4 $71
JUMPV
LABELV $75
line 112
;110:		}
;111:
;112:		if( Q_stricmp( token, "tourney" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $80
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $78
line 113
;113:			bits |= 1 << GT_TOURNAMENT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 114
;114:			continue;
ADDRGP4 $71
JUMPV
LABELV $78
line 117
;115:		}
;116:
;117:		if( Q_stricmp( token, "single" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $83
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $81
line 118
;118:			bits |= 1 << GT_SINGLE_PLAYER;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 119
;119:			continue;
ADDRGP4 $71
JUMPV
LABELV $81
line 122
;120:		}
;121:
;122:		if( Q_stricmp( token, "team" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $86
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $84
line 123
;123:			bits |= 1 << GT_TEAM;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 124
;124:			continue;
ADDRGP4 $71
JUMPV
LABELV $84
line 127
;125:		}
;126:
;127:		if( Q_stricmp( token, "ctf" ) == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $89
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $87
line 128
;128:			bits |= 1 << GT_CTF;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 129
;129:			continue;
LABELV $87
line 131
;130:		}
;131:	}
LABELV $71
line 101
ADDRGP4 $70
JUMPV
LABELV $72
line 133
;132:
;133:	return bits;
ADDRLP4 4
INDIRI4
RETI4
LABELV $69
endproc GametypeBits 36 8
bss
align 1
LABELV $91
skip 256
code
proc StartServer_Update 28 16
line 142
;134:}
;135:
;136:
;137:/*
;138:=================
;139:StartServer_Update
;140:=================
;141:*/
;142:static void StartServer_Update( void ) {
line 147
;143:	int				i;
;144:	int				top;
;145:	static	char	picname[MAX_MAPSPERPAGE][64];
;146:
;147:	top = s_startserver.page*MAX_MAPSPERPAGE;
ADDRLP4 4
ADDRGP4 s_startserver+1772
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 149
;148:
;149:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $93
line 150
;150:	{
line 151
;151:		if (top+i >= s_startserver.nummaps)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRGP4 s_startserver+1768
INDIRI4
LTI4 $97
line 152
;152:			break;
ADDRGP4 $115
JUMPV
LABELV $97
line 154
;153:
;154:		Com_sprintf( picname[i], sizeof(picname[i]), "levelshots/%s", s_startserver.maplist[top+i] );
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 $91
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $100
ARGP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 4
LSHI4
ADDRGP4 s_startserver+1780
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 156
;155:
;156:		s_startserver.mappics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 157
;157:		s_startserver.mappics[i].generic.name   = picname[i];
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 $91
ADDP4
ASGNP4
line 158
;158:		s_startserver.mappics[i].shader         = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+68
ADDP4
CNSTI4 0
ASGNI4
line 161
;159:
;160:		// reset
;161:		s_startserver.mapbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 20
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 162
;162:		s_startserver.mapbuttons[i].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 24
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 163
;163:	}
LABELV $94
line 149
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $93
line 165
;164:
;165:	for (; i<MAX_MAPSPERPAGE; i++)
ADDRGP4 $115
JUMPV
LABELV $112
line 166
;166:	{
line 167
;167:		s_startserver.mappics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 168
;168:		s_startserver.mappics[i].generic.name   = NULL;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+4
ADDP4
CNSTP4 0
ASGNP4
line 169
;169:		s_startserver.mappics[i].shader         = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+68
ADDP4
CNSTI4 0
ASGNI4
line 172
;170:
;171:		// disable
;172:		s_startserver.mapbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 173
;173:		s_startserver.mapbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 16
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 174
;174:	}
LABELV $113
line 165
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $115
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $112
line 178
;175:
;176:
;177:	// no servers to start
;178:	if( !s_startserver.nummaps ) {
ADDRGP4 s_startserver+1768
INDIRI4
CNSTI4 0
NEI4 $126
line 179
;179:		s_startserver.next.generic.flags |= QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_startserver+1512+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 182
;180:
;181:		// set the map name
;182:		strcpy( s_startserver.mapname.string, "NO MAPS FOUND" );
ADDRGP4 s_startserver+1600+60
INDIRP4
ARGP4
ADDRGP4 $133
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 183
;183:	}
ADDRGP4 $127
JUMPV
LABELV $126
line 184
;184:	else {
line 186
;185:		// set the highlight
;186:		s_startserver.next.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_startserver+1512+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 187
;187:		i = s_startserver.currentmap - top;
ADDRLP4 0
ADDRGP4 s_startserver+1764
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 188
;188:		if ( i >=0 && i < MAX_MAPSPERPAGE ) 
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $137
ADDRLP4 0
INDIRI4
CNSTI4 4
GEI4 $137
line 189
;189:		{
line 190
;190:			s_startserver.mappics[i].generic.flags    |= QMF_HIGHLIGHT;
ADDRLP4 16
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 191
;191:			s_startserver.mapbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 20
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 192
;192:		}
LABELV $137
line 195
;193:
;194:		// set the map name
;195:		strcpy( s_startserver.mapname.string, s_startserver.maplist[s_startserver.currentmap] );
ADDRGP4 s_startserver+1600+60
INDIRP4
ARGP4
ADDRGP4 s_startserver+1764
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_startserver+1780
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 196
;196:	}
LABELV $127
line 198
;197:	
;198:	Q_strupr( s_startserver.mapname.string );
ADDRGP4 s_startserver+1600+60
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 199
;199:}
LABELV $90
endproc StartServer_Update 28 16
proc StartServer_MapEvent 0 0
line 207
;200:
;201:
;202:/*
;203:=================
;204:StartServer_MapEvent
;205:=================
;206:*/
;207:static void StartServer_MapEvent( void* ptr, int event ) {
line 208
;208:	if( event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $150
line 209
;209:		return;
ADDRGP4 $149
JUMPV
LABELV $150
line 212
;210:	}
;211:
;212:	s_startserver.currentmap = (s_startserver.page*MAX_MAPSPERPAGE) + (((menucommon_s*)ptr)->id - ID_PICTURES);
ADDRGP4 s_startserver+1764
ADDRGP4 s_startserver+1772
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 11
SUBI4
ADDI4
ASGNI4
line 213
;213:	StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 214
;214:}
LABELV $149
endproc StartServer_MapEvent 0 0
proc StartServer_GametypeEvent 44 12
line 222
;215:
;216:
;217:/*
;218:=================
;219:StartServer_GametypeEvent
;220:=================
;221:*/
;222:static void StartServer_GametypeEvent( void* ptr, int event ) {
line 229
;223:	int			i;
;224:	int			count;
;225:	int			gamebits;
;226:	int			matchbits;
;227:	const char	*info;
;228:
;229:	if( event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $155
line 230
;230:		return;
ADDRGP4 $154
JUMPV
LABELV $155
line 233
;231:	}
;232:
;233:	count = UI_GetNumArenas();
ADDRLP4 20
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 234
;234:	s_startserver.nummaps = 0;
ADDRGP4 s_startserver+1768
CNSTI4 0
ASGNI4
line 235
;235:	matchbits = 1 << gametype_remap[s_startserver.gametype.curvalue];
ADDRLP4 12
CNSTI4 1
ADDRGP4 s_startserver+360+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
LSHI4
ASGNI4
line 236
;236:	if( gametype_remap[s_startserver.gametype.curvalue] == GT_FFA ) {
ADDRGP4 s_startserver+360+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
CNSTI4 0
NEI4 $160
line 237
;237:		matchbits |= ( 1 << GT_SINGLE_PLAYER );
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 238
;238:	}
LABELV $160
line 239
;239:	for( i = 0; i < count; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $167
JUMPV
LABELV $164
line 240
;240:		info = UI_GetArenaInfoByNumber( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 242
;241:
;242:		gamebits = GametypeBits( Info_ValueForKey( info, "type") );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $168
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 GametypeBits
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 243
;243:		if( !( gamebits & matchbits ) ) {
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
BANDI4
CNSTI4 0
NEI4 $169
line 244
;244:			continue;
ADDRGP4 $165
JUMPV
LABELV $169
line 247
;245:		}
;246:
;247:		Q_strncpyz( s_startserver.maplist[s_startserver.nummaps], Info_ValueForKey( info, "map"), MAX_NAMELENGTH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $173
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 s_startserver+1768
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_startserver+1780
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 248
;248:		Q_strupr( s_startserver.maplist[s_startserver.nummaps] );
ADDRGP4 s_startserver+1768
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_startserver+1780
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 249
;249:		s_startserver.mapGamebits[s_startserver.nummaps] = gamebits;
ADDRGP4 s_startserver+1768
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2804
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 250
;250:		s_startserver.nummaps++;
ADDRLP4 40
ADDRGP4 s_startserver+1768
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 251
;251:	}
LABELV $165
line 239
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $167
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $164
line 252
;252:	s_startserver.maxpages = (s_startserver.nummaps + MAX_MAPSPERPAGE-1)/MAX_MAPSPERPAGE;
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRGP4 s_startserver+1776
ADDRGP4 s_startserver+1768
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 24
INDIRI4
DIVI4
ASGNI4
line 253
;253:	s_startserver.page = 0;
ADDRGP4 s_startserver+1772
CNSTI4 0
ASGNI4
line 254
;254:	s_startserver.currentmap = 0;
ADDRGP4 s_startserver+1764
CNSTI4 0
ASGNI4
line 256
;255:
;256:	StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 257
;257:}
LABELV $154
endproc StartServer_GametypeEvent 44 12
proc StartServer_MenuEvent 12 8
line 265
;258:
;259:
;260:/*
;261:=================
;262:StartServer_MenuEvent
;263:=================
;264:*/
;265:static void StartServer_MenuEvent( void* ptr, int event ) {
line 266
;266:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $184
line 267
;267:		return;
ADDRGP4 $183
JUMPV
LABELV $184
line 270
;268:	}
;269:
;270:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $186
ADDRLP4 0
INDIRI4
CNSTI4 18
GTI4 $186
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $206-60
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $206
address $189
address $194
address $205
address $200
code
LABELV $189
line 272
;271:	case ID_PREVPAGE:
;272:		if( s_startserver.page > 0 ) {
ADDRGP4 s_startserver+1772
INDIRI4
CNSTI4 0
LEI4 $187
line 273
;273:			s_startserver.page--;
ADDRLP4 8
ADDRGP4 s_startserver+1772
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 274
;274:			StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 275
;275:		}
line 276
;276:		break;
ADDRGP4 $187
JUMPV
LABELV $194
line 279
;277:
;278:	case ID_NEXTPAGE:
;279:		if( s_startserver.page < s_startserver.maxpages - 1 ) {
ADDRGP4 s_startserver+1772
INDIRI4
ADDRGP4 s_startserver+1776
INDIRI4
CNSTI4 1
SUBI4
GEI4 $187
line 280
;280:			s_startserver.page++;
ADDRLP4 8
ADDRGP4 s_startserver+1772
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 281
;281:			StartServer_Update();
ADDRGP4 StartServer_Update
CALLV
pop
line 282
;282:		}
line 283
;283:		break;
ADDRGP4 $187
JUMPV
LABELV $200
line 286
;284:
;285:	case ID_STARTSERVERNEXT:
;286:		trap_Cvar_SetValue( "g_gameType", gametype_remap[s_startserver.gametype.curvalue] );
ADDRGP4 $201
ARGP4
ADDRGP4 s_startserver+360+64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gametype_remap
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 287
;287:		UI_ServerOptionsMenu( s_startserver.multiplayer );
ADDRGP4 s_startserver+1760
INDIRI4
ARGI4
ADDRGP4 UI_ServerOptionsMenu
CALLV
pop
line 288
;288:		break;
ADDRGP4 $187
JUMPV
LABELV $205
line 291
;289:
;290:	case ID_STARTSERVERBACK:
;291:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 292
;292:		break;
LABELV $186
LABELV $187
line 294
;293:	}
;294:}
LABELV $183
endproc StartServer_MenuEvent 12 8
proc StartServer_LevelshotDraw 48 20
line 302
;295:
;296:
;297:/*
;298:===============
;299:StartServer_LevelshotDraw
;300:===============
;301:*/
;302:static void StartServer_LevelshotDraw( void *self ) {
line 310
;303:	menubitmap_s	*b;
;304:	int				x;
;305:	int				y;
;306:	int				w;
;307:	int				h;
;308:	int				n;
;309:
;310:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 312
;311:
;312:	if( !b->generic.name ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $209
line 313
;313:		return;
ADDRGP4 $208
JUMPV
LABELV $209
line 316
;314:	}
;315:
;316:	if( b->generic.name && !b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $211
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $211
line 317
;317:		b->shader = trap_R_RegisterShaderNoMip( b->generic.name );
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 318
;318:		if( !b->shader && b->errorpic ) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $213
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $213
line 319
;319:			b->shader = trap_R_RegisterShaderNoMip( b->errorpic );
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 320
;320:		}
LABELV $213
line 321
;321:	}
LABELV $211
line 323
;322:
;323:	if( b->focuspic && !b->focusshader ) {
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $215
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
NEI4 $215
line 324
;324:		b->focusshader = trap_R_RegisterShaderNoMip( b->focuspic );
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 325
;325:	}
LABELV $215
line 327
;326:
;327:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 328
;328:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 329
;329:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 330
;330:	h =	b->height;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 331
;331:	if( b->shader ) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $217
line 332
;332:		UI_DrawHandlePic( x, y, w, h, b->shader );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 333
;333:	}
LABELV $217
line 335
;334:
;335:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 336
;336:	y = b->generic.y + b->height;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDI4
ASGNI4
line 337
;337:	UI_FillRect( x, y, b->width, 28, colorBlack );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1105199104
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 339
;338:
;339:	x += b->width / 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 340
;340:	y += 4;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 341
;341:	n = s_startserver.page * MAX_MAPSPERPAGE + b->generic.id - ID_PICTURES;
ADDRLP4 20
ADDRGP4 s_startserver+1772
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
CNSTI4 11
SUBI4
ASGNI4
line 342
;342:	UI_DrawString( x, y, s_startserver.maplist[n], UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_startserver+1780
ADDP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 344
;343:
;344:	x = b->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 345
;345:	y = b->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 346
;346:	w = b->width;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 347
;347:	h =	b->height + 28;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 348
;348:	if( b->generic.flags & QMF_HIGHLIGHT ) {	
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 64
BANDU4
CNSTU4 0
EQU4 $221
line 349
;349:		UI_DrawHandlePic( x, y, w, h, b->focusshader );
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 350
;350:	}
LABELV $221
line 351
;351:}
LABELV $208
endproc StartServer_LevelshotDraw 48 20
bss
align 1
LABELV $224
skip 64
code
proc StartServer_MenuInit 20 12
line 359
;352:
;353:
;354:/*
;355:=================
;356:StartServer_MenuInit
;357:=================
;358:*/
;359:static void StartServer_MenuInit( void ) {
line 366
;360:	int	i;
;361:	int	x;
;362:	int	y;
;363:	static char mapnamebuffer[64];
;364:
;365:	// zero set all our globals
;366:	memset( &s_startserver, 0 ,sizeof(startserver_t) );
ADDRGP4 s_startserver
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3060
ARGI4
ADDRGP4 memset
CALLP4
pop
line 368
;367:
;368:	StartServer_Cache();
ADDRGP4 StartServer_Cache
CALLV
pop
line 370
;369:
;370:	s_startserver.menu.wrapAround = qtrue;
ADDRGP4 s_startserver+276
CNSTI4 1
ASGNI4
line 371
;371:	s_startserver.menu.fullscreen = qtrue;
ADDRGP4 s_startserver+280
CNSTI4 1
ASGNI4
line 373
;372:
;373:	s_startserver.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_startserver+288
CNSTI4 10
ASGNI4
line 374
;374:	s_startserver.banner.generic.x	   = 320;
ADDRGP4 s_startserver+288+12
CNSTI4 320
ASGNI4
line 375
;375:	s_startserver.banner.generic.y	   = 16;
ADDRGP4 s_startserver+288+16
CNSTI4 16
ASGNI4
line 376
;376:	s_startserver.banner.string        = "GALLERIES";
ADDRGP4 s_startserver+288+60
ADDRGP4 $234
ASGNP4
line 377
;377:	s_startserver.banner.color         = color_white;
ADDRGP4 s_startserver+288+68
ADDRGP4 color_white
ASGNP4
line 378
;378:	s_startserver.banner.style         = UI_CENTER;
ADDRGP4 s_startserver+288+64
CNSTI4 1
ASGNI4
line 396
;379:/*
;380:	s_startserver.framel.generic.type  = MTYPE_BITMAP;
;381:	s_startserver.framel.generic.name  = GAMESERVER_FRAMEL;
;382:	s_startserver.framel.generic.flags = QMF_INACTIVE;
;383:	s_startserver.framel.generic.x	   = 0;  
;384:	s_startserver.framel.generic.y	   = 78;
;385:	s_startserver.framel.width  	   = 256;
;386:	s_startserver.framel.height  	   = 329;
;387:
;388:	s_startserver.framer.generic.type  = MTYPE_BITMAP;
;389:	s_startserver.framer.generic.name  = GAMESERVER_FRAMER;
;390:	s_startserver.framer.generic.flags = QMF_INACTIVE;
;391:	s_startserver.framer.generic.x	   = 376;
;392:	s_startserver.framer.generic.y	   = 76;
;393:	s_startserver.framer.width  	   = 256;
;394:	s_startserver.framer.height  	   = 334;
;395:*/
;396:	s_startserver.gametype.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_startserver+360
CNSTI4 3
ASGNI4
line 397
;397:	s_startserver.gametype.generic.name		= "Gallery:";
ADDRGP4 s_startserver+360+4
ADDRGP4 $242
ASGNP4
line 398
;398:	s_startserver.gametype.generic.flags	= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_startserver+360+44
CNSTU4 258
ASGNU4
line 399
;399:	s_startserver.gametype.generic.callback	= StartServer_GametypeEvent;
ADDRGP4 s_startserver+360+48
ADDRGP4 StartServer_GametypeEvent
ASGNP4
line 400
;400:	s_startserver.gametype.generic.id		= ID_GAMETYPE;
ADDRGP4 s_startserver+360+8
CNSTI4 10
ASGNI4
line 401
;401:	s_startserver.gametype.generic.x		= 320 - 24;
ADDRGP4 s_startserver+360+12
CNSTI4 296
ASGNI4
line 402
;402:	s_startserver.gametype.generic.y		= 368;
ADDRGP4 s_startserver+360+16
CNSTI4 368
ASGNI4
line 403
;403:	s_startserver.gametype.itemnames		= gametype_items;
ADDRGP4 s_startserver+360+76
ADDRGP4 gametype_items
ASGNP4
line 405
;404:
;405:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $255
line 406
;406:	{
line 407
;407:		x =	(i % MAX_MAPCOLS) * (128+8) + 188;
ADDRLP4 4
CNSTI4 136
ADDRLP4 0
INDIRI4
CNSTI4 2
MODI4
MULI4
CNSTI4 188
ADDI4
ASGNI4
line 408
;408:		y = (i / MAX_MAPROWS) * (128+8) + 96;
ADDRLP4 8
CNSTI4 136
ADDRLP4 0
INDIRI4
CNSTI4 2
DIVI4
MULI4
CNSTI4 96
ADDI4
ASGNI4
line 410
;409:
;410:		s_startserver.mappics[i].generic.type   = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456
ADDP4
CNSTI4 6
ASGNI4
line 411
;411:		s_startserver.mappics[i].generic.flags  = QMF_LEFT_JUSTIFY|QMF_INACTIVE;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+44
ADDP4
CNSTU4 16388
ASGNU4
line 412
;412:		s_startserver.mappics[i].generic.x	    = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 413
;413:		s_startserver.mappics[i].generic.y	    = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 414
;414:		s_startserver.mappics[i].generic.id		= ID_PICTURES+i;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 11
ADDI4
ASGNI4
line 415
;415:		s_startserver.mappics[i].width  		= 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+76
ADDP4
CNSTI4 128
ASGNI4
line 416
;416:		s_startserver.mappics[i].height  	    = 96;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+80
ADDP4
CNSTI4 96
ASGNI4
line 417
;417:		s_startserver.mappics[i].focuspic       = GAMESERVER_SELECTED;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+60
ADDP4
ADDRGP4 $274
ASGNP4
line 418
;418:		s_startserver.mappics[i].errorpic       = GAMESERVER_UNKNOWNMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+64
ADDP4
ADDRGP4 $277
ASGNP4
line 419
;419:		s_startserver.mappics[i].generic.ownerdraw = StartServer_LevelshotDraw;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456+56
ADDP4
ADDRGP4 StartServer_LevelshotDraw
ASGNP4
line 421
;420:
;421:		s_startserver.mapbuttons[i].generic.type     = MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808
ADDP4
CNSTI4 6
ASGNI4
line 422
;422:		s_startserver.mapbuttons[i].generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_NODEFAULTINIT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+44
ADDP4
CNSTU4 33028
ASGNU4
line 423
;423:		s_startserver.mapbuttons[i].generic.id       = ID_PICTURES+i;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 11
ADDI4
ASGNI4
line 424
;424:		s_startserver.mapbuttons[i].generic.callback = StartServer_MapEvent;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+48
ADDP4
ADDRGP4 StartServer_MapEvent
ASGNP4
line 425
;425:		s_startserver.mapbuttons[i].generic.x	     = x - 30;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 30
SUBI4
ASGNI4
line 426
;426:		s_startserver.mapbuttons[i].generic.y	     = y - 32;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 427
;427:		s_startserver.mapbuttons[i].width  		     = 256;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+76
ADDP4
CNSTI4 256
ASGNI4
line 428
;428:		s_startserver.mapbuttons[i].height  	     = 248;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+80
ADDP4
CNSTI4 248
ASGNI4
line 429
;429:		s_startserver.mapbuttons[i].generic.left     = x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 430
;430:		s_startserver.mapbuttons[i].generic.top  	 = y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 431
;431:		s_startserver.mapbuttons[i].generic.right    = x + 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 432
;432:		s_startserver.mapbuttons[i].generic.bottom   = y + 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 433
;433:		s_startserver.mapbuttons[i].focuspic         = GAMESERVER_SELECT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808+60
ADDP4
ADDRGP4 $305
ASGNP4
line 434
;434:	}
LABELV $256
line 405
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $255
line 436
;435:
;436:	s_startserver.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_startserver+1160
CNSTI4 6
ASGNI4
line 437
;437:	s_startserver.arrows.generic.name  = GAMESERVER_ARROWS;
ADDRGP4 s_startserver+1160+4
ADDRGP4 $309
ASGNP4
line 438
;438:	s_startserver.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 s_startserver+1160+44
CNSTU4 16384
ASGNU4
line 439
;439:	s_startserver.arrows.generic.x	   = 260;
ADDRGP4 s_startserver+1160+12
CNSTI4 260
ASGNI4
line 440
;440:	s_startserver.arrows.generic.y	   = 400;
ADDRGP4 s_startserver+1160+16
CNSTI4 400
ASGNI4
line 441
;441:	s_startserver.arrows.width  	   = 128;
ADDRGP4 s_startserver+1160+76
CNSTI4 128
ASGNI4
line 442
;442:	s_startserver.arrows.height  	   = 32;
ADDRGP4 s_startserver+1160+80
CNSTI4 32
ASGNI4
line 444
;443:
;444:	s_startserver.prevpage.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1248
CNSTI4 6
ASGNI4
line 445
;445:	s_startserver.prevpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1248+44
CNSTU4 260
ASGNU4
line 446
;446:	s_startserver.prevpage.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1248+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 447
;447:	s_startserver.prevpage.generic.id	    = ID_PREVPAGE;
ADDRGP4 s_startserver+1248+8
CNSTI4 15
ASGNI4
line 448
;448:	s_startserver.prevpage.generic.x		= 260;
ADDRGP4 s_startserver+1248+12
CNSTI4 260
ASGNI4
line 449
;449:	s_startserver.prevpage.generic.y		= 400;
ADDRGP4 s_startserver+1248+16
CNSTI4 400
ASGNI4
line 450
;450:	s_startserver.prevpage.width  		    = 64;
ADDRGP4 s_startserver+1248+76
CNSTI4 64
ASGNI4
line 451
;451:	s_startserver.prevpage.height  		    = 32;
ADDRGP4 s_startserver+1248+80
CNSTI4 32
ASGNI4
line 452
;452:	s_startserver.prevpage.focuspic         = GAMESERVER_ARROWSL;
ADDRGP4 s_startserver+1248+60
ADDRGP4 $337
ASGNP4
line 454
;453:
;454:	s_startserver.nextpage.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1336
CNSTI4 6
ASGNI4
line 455
;455:	s_startserver.nextpage.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1336+44
CNSTU4 260
ASGNU4
line 456
;456:	s_startserver.nextpage.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1336+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 457
;457:	s_startserver.nextpage.generic.id	    = ID_NEXTPAGE;
ADDRGP4 s_startserver+1336+8
CNSTI4 16
ASGNI4
line 458
;458:	s_startserver.nextpage.generic.x		= 321;
ADDRGP4 s_startserver+1336+12
CNSTI4 321
ASGNI4
line 459
;459:	s_startserver.nextpage.generic.y		= 400;
ADDRGP4 s_startserver+1336+16
CNSTI4 400
ASGNI4
line 460
;460:	s_startserver.nextpage.width  		    = 64;
ADDRGP4 s_startserver+1336+76
CNSTI4 64
ASGNI4
line 461
;461:	s_startserver.nextpage.height  		    = 32;
ADDRGP4 s_startserver+1336+80
CNSTI4 32
ASGNI4
line 462
;462:	s_startserver.nextpage.focuspic         = GAMESERVER_ARROWSR;
ADDRGP4 s_startserver+1336+60
ADDRGP4 $355
ASGNP4
line 464
;463:
;464:	s_startserver.mapname.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_startserver+1600
CNSTI4 9
ASGNI4
line 465
;465:	s_startserver.mapname.generic.flags = QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_startserver+1600+44
CNSTU4 16392
ASGNU4
line 466
;466:	s_startserver.mapname.generic.x	    = 320;
ADDRGP4 s_startserver+1600+12
CNSTI4 320
ASGNI4
line 467
;467:	s_startserver.mapname.generic.y	    = 440;
ADDRGP4 s_startserver+1600+16
CNSTI4 440
ASGNI4
line 468
;468:	s_startserver.mapname.string        = mapnamebuffer;
ADDRGP4 s_startserver+1600+60
ADDRGP4 $224
ASGNP4
line 469
;469:	s_startserver.mapname.style         = UI_CENTER|UI_BIGFONT;
ADDRGP4 s_startserver+1600+64
CNSTI4 33
ASGNI4
line 470
;470:	s_startserver.mapname.color         = text_color_normal;
ADDRGP4 s_startserver+1600+68
ADDRGP4 text_color_normal
ASGNP4
line 472
;471:
;472:	s_startserver.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1424
CNSTI4 6
ASGNI4
line 473
;473:	s_startserver.back.generic.name     = GAMESERVER_BACK0;
ADDRGP4 s_startserver+1424+4
ADDRGP4 $372
ASGNP4
line 474
;474:	s_startserver.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1424+44
CNSTU4 260
ASGNU4
line 475
;475:	s_startserver.back.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1424+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 476
;476:	s_startserver.back.generic.id	    = ID_STARTSERVERBACK;
ADDRGP4 s_startserver+1424+8
CNSTI4 17
ASGNI4
line 477
;477:	s_startserver.back.generic.x		= 0;
ADDRGP4 s_startserver+1424+12
CNSTI4 0
ASGNI4
line 478
;478:	s_startserver.back.generic.y		= 480-64;
ADDRGP4 s_startserver+1424+16
CNSTI4 416
ASGNI4
line 479
;479:	s_startserver.back.width  		    = 128;
ADDRGP4 s_startserver+1424+76
CNSTI4 128
ASGNI4
line 480
;480:	s_startserver.back.height  		    = 64;
ADDRGP4 s_startserver+1424+80
CNSTI4 64
ASGNI4
line 481
;481:	s_startserver.back.focuspic         = GAMESERVER_BACK1;
ADDRGP4 s_startserver+1424+60
ADDRGP4 $389
ASGNP4
line 483
;482:
;483:	s_startserver.next.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_startserver+1512
CNSTI4 6
ASGNI4
line 484
;484:	s_startserver.next.generic.name     = GAMESERVER_NEXT0;
ADDRGP4 s_startserver+1512+4
ADDRGP4 $393
ASGNP4
line 485
;485:	s_startserver.next.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_startserver+1512+44
CNSTU4 272
ASGNU4
line 486
;486:	s_startserver.next.generic.callback = StartServer_MenuEvent;
ADDRGP4 s_startserver+1512+48
ADDRGP4 StartServer_MenuEvent
ASGNP4
line 487
;487:	s_startserver.next.generic.id	    = ID_STARTSERVERNEXT;
ADDRGP4 s_startserver+1512+8
CNSTI4 18
ASGNI4
line 488
;488:	s_startserver.next.generic.x		= 640;
ADDRGP4 s_startserver+1512+12
CNSTI4 640
ASGNI4
line 489
;489:	s_startserver.next.generic.y		= 480-64;
ADDRGP4 s_startserver+1512+16
CNSTI4 416
ASGNI4
line 490
;490:	s_startserver.next.width  		    = 128;
ADDRGP4 s_startserver+1512+76
CNSTI4 128
ASGNI4
line 491
;491:	s_startserver.next.height  		    = 64;
ADDRGP4 s_startserver+1512+80
CNSTI4 64
ASGNI4
line 492
;492:	s_startserver.next.focuspic         = GAMESERVER_NEXT1;
ADDRGP4 s_startserver+1512+60
ADDRGP4 $410
ASGNP4
line 494
;493:
;494:	s_startserver.item_null.generic.type	= MTYPE_BITMAP;
ADDRGP4 s_startserver+1672
CNSTI4 6
ASGNI4
line 495
;495:	s_startserver.item_null.generic.flags	= QMF_LEFT_JUSTIFY|QMF_MOUSEONLY|QMF_SILENT;
ADDRGP4 s_startserver+1672+44
CNSTU4 1050628
ASGNU4
line 496
;496:	s_startserver.item_null.generic.x		= 0;
ADDRGP4 s_startserver+1672+12
CNSTI4 0
ASGNI4
line 497
;497:	s_startserver.item_null.generic.y		= 0;
ADDRGP4 s_startserver+1672+16
CNSTI4 0
ASGNI4
line 498
;498:	s_startserver.item_null.width			= 640;
ADDRGP4 s_startserver+1672+76
CNSTI4 640
ASGNI4
line 499
;499:	s_startserver.item_null.height			= 480;
ADDRGP4 s_startserver+1672+80
CNSTI4 480
ASGNI4
line 501
;500:
;501:	Menu_AddItem( &s_startserver.menu, &s_startserver.banner );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 505
;502://	Menu_AddItem( &s_startserver.menu, &s_startserver.framel );
;503://	Menu_AddItem( &s_startserver.menu, &s_startserver.framer );
;504:
;505:	Menu_AddItem( &s_startserver.menu, &s_startserver.gametype );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 506
;506:	for (i=0; i<MAX_MAPSPERPAGE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $424
line 507
;507:	{
line 508
;508:		Menu_AddItem( &s_startserver.menu, &s_startserver.mappics[i] );
ADDRGP4 s_startserver
ARGP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+456
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 509
;509:		Menu_AddItem( &s_startserver.menu, &s_startserver.mapbuttons[i] );
ADDRGP4 s_startserver
ARGP4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_startserver+808
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 510
;510:	}
LABELV $425
line 506
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $424
line 512
;511:
;512:	Menu_AddItem( &s_startserver.menu, &s_startserver.arrows );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1160
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 513
;513:	Menu_AddItem( &s_startserver.menu, &s_startserver.prevpage );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1248
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 514
;514:	Menu_AddItem( &s_startserver.menu, &s_startserver.nextpage );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1336
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 515
;515:	Menu_AddItem( &s_startserver.menu, &s_startserver.back );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1424
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 516
;516:	Menu_AddItem( &s_startserver.menu, &s_startserver.next );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1512
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 517
;517:	Menu_AddItem( &s_startserver.menu, &s_startserver.mapname );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1600
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 518
;518:	Menu_AddItem( &s_startserver.menu, &s_startserver.item_null );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 s_startserver+1672
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 520
;519:
;520:	StartServer_GametypeEvent( NULL, QM_ACTIVATED );
CNSTP4 0
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 StartServer_GametypeEvent
CALLV
pop
line 521
;521:}
LABELV $223
endproc StartServer_MenuInit 20 12
export StartServer_Cache
proc StartServer_Cache 100 16
line 530
;522:
;523:
;524:/*
;525:=================
;526:StartServer_Cache
;527:=================
;528:*/
;529:void StartServer_Cache( void )
;530:{
line 536
;531:	int				i;
;532:	const char		*info;
;533:	qboolean		precache;
;534:	char			picname[64];
;535:
;536:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK0 );	
ADDRGP4 $372
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 537
;537:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK1 );	
ADDRGP4 $389
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 538
;538:	trap_R_RegisterShaderNoMip( GAMESERVER_NEXT0 );	
ADDRGP4 $393
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 539
;539:	trap_R_RegisterShaderNoMip( GAMESERVER_NEXT1 );	
ADDRGP4 $410
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 542
;540://	trap_R_RegisterShaderNoMip( GAMESERVER_FRAMEL );	
;541://	trap_R_RegisterShaderNoMip( GAMESERVER_FRAMER );	
;542:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECT );	
ADDRGP4 $305
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 543
;543:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECTED );	
ADDRGP4 $274
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 544
;544:	trap_R_RegisterShaderNoMip( GAMESERVER_UNKNOWNMAP );
ADDRGP4 $277
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 545
;545:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWS );
ADDRGP4 $309
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 546
;546:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWSL );
ADDRGP4 $337
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 547
;547:	trap_R_RegisterShaderNoMip( GAMESERVER_ARROWSR );
ADDRGP4 $355
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 549
;548:
;549:	precache = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $438
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 76
INDIRF4
CVFI4 4
ASGNI4
line 551
;550:
;551:	s_startserver.nummaps = UI_GetNumArenas();
ADDRLP4 80
ADDRGP4 UI_GetNumArenas
CALLI4
ASGNI4
ADDRGP4 s_startserver+1768
ADDRLP4 80
INDIRI4
ASGNI4
line 553
;552:
;553:	for( i = 0; i < s_startserver.nummaps; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $443
JUMPV
LABELV $440
line 554
;554:		info = UI_GetArenaInfoByNumber( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 84
INDIRP4
ASGNP4
line 556
;555:
;556:		Q_strncpyz( s_startserver.maplist[i], Info_ValueForKey( info, "map"), MAX_NAMELENGTH );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $173
ARGP4
ADDRLP4 88
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_startserver+1780
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 557
;557:		Q_strupr( s_startserver.maplist[i] );
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_startserver+1780
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 558
;558:		s_startserver.mapGamebits[i] = GametypeBits( Info_ValueForKey( info, "type") );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $168
ARGP4
ADDRLP4 92
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 GametypeBits
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_startserver+2804
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 560
;559:
;560:		if( precache ) {
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $448
line 561
;561:			Com_sprintf( picname, sizeof(picname), "levelshots/%s", s_startserver.maplist[i] );
ADDRLP4 8
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $100
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_startserver+1780
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 562
;562:			trap_R_RegisterShaderNoMip(picname);
ADDRLP4 8
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 563
;563:		}
LABELV $448
line 564
;564:	}
LABELV $441
line 553
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $443
ADDRLP4 0
INDIRI4
ADDRGP4 s_startserver+1768
INDIRI4
LTI4 $440
line 566
;565:
;566:	s_startserver.maxpages = (s_startserver.nummaps + MAX_MAPSPERPAGE-1)/MAX_MAPSPERPAGE;
ADDRLP4 84
CNSTI4 4
ASGNI4
ADDRGP4 s_startserver+1776
ADDRGP4 s_startserver+1768
INDIRI4
ADDRLP4 84
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 84
INDIRI4
DIVI4
ASGNI4
line 567
;567:}
LABELV $437
endproc StartServer_Cache 100 16
export UI_StartServerMenu
proc UI_StartServerMenu 0 4
line 575
;568:
;569:
;570:/*
;571:=================
;572:UI_StartServerMenu
;573:=================
;574:*/
;575:void UI_StartServerMenu( qboolean multiplayer ) {
line 576
;576:	StartServer_MenuInit();
ADDRGP4 StartServer_MenuInit
CALLV
pop
line 577
;577:	s_startserver.multiplayer = multiplayer;
ADDRGP4 s_startserver+1760
ADDRFP4 0
INDIRI4
ASGNI4
line 578
;578:	UI_PushMenu( &s_startserver.menu );
ADDRGP4 s_startserver
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 579
;579:}
LABELV $453
endproc UI_StartServerMenu 0 4
data
align 4
LABELV dedicated_list
address $456
address $457
address $458
byte 4 0
code
proc BotAlreadySelected 12 8
line 650
;580:
;581:
;582:
;583:/*
;584:=============================================================================
;585:
;586:SERVER OPTIONS MENU *****
;587:
;588:=============================================================================
;589:*/
;590:
;591:#define ID_PLAYER_TYPE			20
;592:#define ID_MAXCLIENTS			21
;593:#define ID_DEDICATED			22
;594:#define ID_GO					23
;595:#define ID_BACK					24
;596:
;597:#define PLAYER_SLOTS			12
;598:
;599:
;600:typedef struct {
;601:	menuframework_s		menu;
;602:
;603:	menutext_s			banner;
;604:
;605:	menubitmap_s		mappic;
;606:	menubitmap_s		picframe;
;607:
;608:	menulist_s			dedicated;
;609:	menufield_s			timelimit;
;610:	menufield_s			fraglimit;
;611:	menufield_s			flaglimit;
;612:	menuradiobutton_s	friendlyfire;
;613:	menufield_s			hostname;
;614:	menuradiobutton_s	pure;
;615:
;616:	menutext_s			player0;
;617:	menulist_s			playerType[PLAYER_SLOTS];
;618:	menutext_s			playerName[PLAYER_SLOTS];
;619:	menulist_s			playerTeam[PLAYER_SLOTS];
;620:
;621:	menubitmap_s		go;
;622:	menubitmap_s		next;
;623:	menubitmap_s		back;
;624:
;625:	qboolean			multiplayer;
;626:	int					gametype;
;627:	char				mapnamebuffer[32];
;628:	char				playerNameBuffers[PLAYER_SLOTS][16];
;629:
;630:	qboolean			newBot;
;631:	int					newBotIndex;
;632:	char				newBotName[16];	
;633:
;634:} serveroptions_t;
;635:
;636:static serveroptions_t s_serveroptions;
;637:
;638:static const char *dedicated_list[] = {
;639:	"No",
;640:	"LAN",
;641:	"Internet",
;642:	0
;643:};
;644:
;645:/*
;646:=================
;647:BotAlreadySelected
;648:=================
;649:*/
;650:static qboolean BotAlreadySelected( const char *checkName ) {
line 653
;651:	int		n;
;652:
;653:	for( n = 1; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $460
line 654
;654:		if( s_serveroptions.playerType[n].curvalue != 1 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+64
ADDP4
INDIRI4
CNSTI4 1
EQI4 $464
line 655
;655:			continue;
ADDRGP4 $461
JUMPV
LABELV $464
line 657
;656:		}
;657:		if( (s_serveroptions.gametype >= GT_TEAM) &&
ADDRGP4 s_serveroptions+5596
INDIRI4
CNSTI4 3
LTI4 $468
ADDRLP4 4
CNSTI4 96
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4176+64
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRGP4 s_serveroptions+5828
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4176+64
ADDP4
INDIRI4
EQI4 $468
line 658
;658:			(s_serveroptions.playerTeam[n].curvalue != s_serveroptions.playerTeam[s_serveroptions.newBotIndex].curvalue ) ) {
line 659
;659:			continue;
ADDRGP4 $461
JUMPV
LABELV $468
line 661
;660:		}
;661:		if( Q_stricmp( checkName, s_serveroptions.playerNameBuffers[n] ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5632
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $476
line 662
;662:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $459
JUMPV
LABELV $476
line 664
;663:		}
;664:	}
LABELV $461
line 653
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $460
line 666
;665:
;666:	return qfalse;
CNSTI4 0
RETI4
LABELV $459
endproc BotAlreadySelected 12 8
proc ServerOptions_Start 156 16
line 675
;667:}
;668:
;669:
;670:/*
;671:=================
;672:ServerOptions_Start
;673:=================
;674:*/
;675:static void ServerOptions_Start( void ) {
line 687
;676:	int		timelimit;
;677:	int		fraglimit;
;678:	int		maxclients;
;679:	int		dedicated;
;680:	int		friendlyfire;
;681:	int		flaglimit;
;682:	int		pure;
;683:	int		n;
;684:	char	buf[64];
;685:
;686:
;687:	timelimit	 = atoi( s_serveroptions.timelimit.field.buffer );
ADDRGP4 s_serveroptions+632+60+12
ARGP4
ADDRLP4 96
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 96
INDIRI4
ASGNI4
line 688
;688:	fraglimit	 = atoi( s_serveroptions.fraglimit.field.buffer );
ADDRGP4 s_serveroptions+964+60+12
ARGP4
ADDRLP4 100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 100
INDIRI4
ASGNI4
line 689
;689:	flaglimit	 = atoi( s_serveroptions.flaglimit.field.buffer );
ADDRGP4 s_serveroptions+1296+60+12
ARGP4
ADDRLP4 104
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 104
INDIRI4
ASGNI4
line 690
;690:	dedicated	 = s_serveroptions.dedicated.curvalue;
ADDRLP4 80
ADDRGP4 s_serveroptions+536+64
INDIRI4
ASGNI4
line 691
;691:	friendlyfire = s_serveroptions.friendlyfire.curvalue;
ADDRLP4 88
ADDRGP4 s_serveroptions+1628+60
INDIRI4
ASGNI4
line 692
;692:	pure		 = s_serveroptions.pure.curvalue;
ADDRLP4 92
ADDRGP4 s_serveroptions+2024+60
INDIRI4
ASGNI4
line 694
;693:	//set maxclients
;694:	for( n = 0, maxclients = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 108
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRLP4 108
INDIRI4
ASGNI4
ADDRLP4 68
ADDRLP4 108
INDIRI4
ASGNI4
ADDRGP4 $498
JUMPV
LABELV $495
line 695
;695:		if( s_serveroptions.playerType[n].curvalue == 2 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+64
ADDP4
INDIRI4
CNSTI4 2
NEI4 $499
line 696
;696:			continue;
ADDRGP4 $496
JUMPV
LABELV $499
line 698
;697:		}
;698:		if( (s_serveroptions.playerType[n].curvalue == 1) && (s_serveroptions.playerNameBuffers[n][0] == 0) ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+64
ADDP4
INDIRI4
CNSTI4 1
NEI4 $503
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5632
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $503
line 699
;699:			continue;
ADDRGP4 $496
JUMPV
LABELV $503
line 701
;700:		}
;701:		maxclients++;
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 702
;702:	}
LABELV $496
line 694
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $498
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $495
line 704
;703:
;704:	switch( s_serveroptions.gametype ) {
ADDRLP4 112
ADDRGP4 s_serveroptions+5596
INDIRI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
LTI4 $508
ADDRLP4 112
INDIRI4
CNSTI4 4
GTI4 $508
ADDRLP4 112
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $525
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $525
address $511
address $514
address $508
address $517
address $521
code
LABELV $511
LABELV $508
line 707
;705:	case GT_FFA:
;706:	default:
;707:		trap_Cvar_SetValue( "ui_ffa_fraglimit", fraglimit );
ADDRGP4 $512
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 708
;708:		trap_Cvar_SetValue( "ui_ffa_timelimit", timelimit );
ADDRGP4 $513
ARGP4
ADDRLP4 72
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 709
;709:		break;
ADDRGP4 $509
JUMPV
LABELV $514
line 712
;710:
;711:	case GT_TOURNAMENT:
;712:		trap_Cvar_SetValue( "ui_tourney_fraglimit", fraglimit );
ADDRGP4 $515
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 713
;713:		trap_Cvar_SetValue( "ui_tourney_timelimit", timelimit );
ADDRGP4 $516
ARGP4
ADDRLP4 72
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 714
;714:		break;
ADDRGP4 $509
JUMPV
LABELV $517
line 717
;715:
;716:	case GT_TEAM:
;717:		trap_Cvar_SetValue( "ui_team_fraglimit", fraglimit );
ADDRGP4 $518
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 718
;718:		trap_Cvar_SetValue( "ui_team_timelimit", timelimit );
ADDRGP4 $519
ARGP4
ADDRLP4 72
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 719
;719:		trap_Cvar_SetValue( "ui_team_friendlt", friendlyfire );
ADDRGP4 $520
ARGP4
ADDRLP4 88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 720
;720:		break;
ADDRGP4 $509
JUMPV
LABELV $521
line 723
;721:
;722:	case GT_CTF:
;723:		trap_Cvar_SetValue( "ui_ctf_fraglimit", fraglimit );
ADDRGP4 $522
ARGP4
ADDRLP4 76
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 724
;724:		trap_Cvar_SetValue( "ui_ctf_timelimit", timelimit );
ADDRGP4 $523
ARGP4
ADDRLP4 72
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 725
;725:		trap_Cvar_SetValue( "ui_ctf_friendlt", friendlyfire );
ADDRGP4 $524
ARGP4
ADDRLP4 88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 726
;726:		break;
LABELV $509
line 729
;727:	}
;728:
;729:	trap_Cvar_SetValue( "sv_maxclients", Com_Clamp( 0, 12, maxclients ) );
CNSTF4 0
ARGF4
CNSTF4 1094713344
ARGF4
ADDRLP4 68
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 116
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $526
ARGP4
ADDRLP4 116
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 730
;730:	trap_Cvar_SetValue( "dedicated", Com_Clamp( 0, 2, dedicated ) );
CNSTF4 0
ARGF4
CNSTF4 1073741824
ARGF4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 120
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $527
ARGP4
ADDRLP4 120
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 731
;731:	trap_Cvar_SetValue ("timelimit", Com_Clamp( 0, timelimit, timelimit ) );
CNSTF4 0
ARGF4
ADDRLP4 124
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 124
INDIRF4
ARGF4
ADDRLP4 124
INDIRF4
ARGF4
ADDRLP4 128
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $528
ARGP4
ADDRLP4 128
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 732
;732:	trap_Cvar_SetValue ("fraglimit", Com_Clamp( 0, fraglimit, fraglimit ) );
CNSTF4 0
ARGF4
ADDRLP4 132
ADDRLP4 76
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 132
INDIRF4
ARGF4
ADDRLP4 132
INDIRF4
ARGF4
ADDRLP4 136
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $529
ARGP4
ADDRLP4 136
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 733
;733:	trap_Cvar_SetValue ("capturelimit", Com_Clamp( 0, flaglimit, flaglimit ) );
CNSTF4 0
ARGF4
ADDRLP4 140
ADDRLP4 84
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRLP4 144
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 $530
ARGP4
ADDRLP4 144
INDIRF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 734
;734:	trap_Cvar_SetValue( "g_friendlyfire", friendlyfire );
ADDRGP4 $531
ARGP4
ADDRLP4 88
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 735
;735:	trap_Cvar_SetValue( "sv_pure", pure );
ADDRGP4 $532
ARGP4
ADDRLP4 92
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 736
;736:	trap_Cvar_Set("sv_hostname", s_serveroptions.hostname.field.buffer );	
ADDRGP4 $533
ARGP4
ADDRGP4 s_serveroptions+1692+60+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 740
;737:
;738:
;739:	// the wait commands will allow the dedicated to take effect
;740:	trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait ; wait ; map %s\n", s_startserver.maplist[s_startserver.currentmap] ) );
ADDRGP4 $537
ARGP4
ADDRGP4 s_startserver+1764
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_startserver+1780
ADDP4
ARGP4
ADDRLP4 148
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 148
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 743
;741:
;742:	// add bots
;743:	trap_Cmd_ExecuteText( EXEC_APPEND, "wait 3\n" );
CNSTI4 2
ARGI4
ADDRGP4 $540
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 744
;744:	for( n = 1; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $541
line 745
;745:		if( s_serveroptions.playerType[n].curvalue != 1 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+64
ADDP4
INDIRI4
CNSTI4 1
EQI4 $545
line 746
;746:			continue;
ADDRGP4 $542
JUMPV
LABELV $545
line 748
;747:		}
;748:		if( s_serveroptions.playerNameBuffers[n][0] == 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5632
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $549
line 749
;749:			continue;
ADDRGP4 $542
JUMPV
LABELV $549
line 751
;750:		}
;751:		if( s_serveroptions.playerNameBuffers[n][0] == '-' ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5632
ADDP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $552
line 752
;752:			continue;
ADDRGP4 $542
JUMPV
LABELV $552
line 754
;753:		}
;754:		if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5596
INDIRI4
CNSTI4 3
LTI4 $555
line 755
;755:			Com_sprintf( buf, sizeof(buf), "addbot %s %i %s\n", s_serveroptions.playerNameBuffers[n] );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $558
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5632
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 756
;756:		}
ADDRGP4 $556
JUMPV
LABELV $555
line 757
;757:		else {
line 758
;758:			Com_sprintf( buf, sizeof(buf), "addbot %s %i\n", s_serveroptions.playerNameBuffers[n] );
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $560
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5632
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 759
;759:		}
LABELV $556
line 760
;760:		trap_Cmd_ExecuteText( EXEC_APPEND, buf );
CNSTI4 2
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 761
;761:	}
LABELV $542
line 744
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $541
line 764
;762:
;763:	// set player's team
;764:	if( dedicated == 0 && s_serveroptions.gametype >= GT_TEAM ) {
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $562
ADDRGP4 s_serveroptions+5596
INDIRI4
CNSTI4 3
LTI4 $562
line 765
;765:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "wait 5; team %s\n" ) );
ADDRGP4 $565
ARGP4
ADDRLP4 152
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 152
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 766
;766:	}
LABELV $562
line 767
;767:}
LABELV $479
endproc ServerOptions_Start 156 16
proc ServerOptions_InitPlayerItems 12 12
line 775
;768:
;769:
;770:/*
;771:=================
;772:ServerOptions_InitPlayerItems
;773:=================
;774:*/
;775:static void ServerOptions_InitPlayerItems( void ) {
line 780
;776:	int		n;
;777:	int		v;
;778:
;779:	// init types
;780:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5592
INDIRI4
CNSTI4 0
EQI4 $567
line 781
;781:		v = 0;	// open
ADDRLP4 4
CNSTI4 0
ASGNI4
line 782
;782:	}
ADDRGP4 $568
JUMPV
LABELV $567
line 783
;783:	else {
line 784
;784:		v = 1;	// bot
ADDRLP4 4
CNSTI4 1
ASGNI4
line 785
;785:	}
LABELV $568
line 787
;786:	
;787:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $570
line 788
;788:		s_serveroptions.playerType[n].curvalue = v;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+64
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 789
;789:	}
LABELV $571
line 787
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $570
line 791
;790:
;791:	if( s_serveroptions.multiplayer && (s_serveroptions.gametype < GT_TEAM) ) {
ADDRGP4 s_serveroptions+5592
INDIRI4
CNSTI4 0
EQI4 $576
ADDRGP4 s_serveroptions+5596
INDIRI4
CNSTI4 3
GEI4 $576
line 792
;792:		for( n = 8; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 8
ASGNI4
LABELV $580
line 793
;793:			s_serveroptions.playerType[n].curvalue = 2;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+64
ADDP4
CNSTI4 2
ASGNI4
line 794
;794:		}
LABELV $581
line 792
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $580
line 795
;795:	}
LABELV $576
line 798
;796:
;797:	// if not a dedicated server, first slot is reserved for the human on the server
;798:	if( s_serveroptions.dedicated.curvalue == 0 ) {
ADDRGP4 s_serveroptions+536+64
INDIRI4
CNSTI4 0
NEI4 $586
line 800
;799:		// human
;800:		s_serveroptions.playerType[0].generic.flags |= QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_serveroptions+2160+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 801
;801:		s_serveroptions.playerType[0].curvalue = 0;
ADDRGP4 s_serveroptions+2160+64
CNSTI4 0
ASGNI4
line 802
;802:		trap_Cvar_VariableStringBuffer( "name", s_serveroptions.playerNameBuffers[0], sizeof(s_serveroptions.playerNameBuffers[0]) );
ADDRGP4 $594
ARGP4
ADDRGP4 s_serveroptions+5632
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 803
;803:		Q_CleanStr( s_serveroptions.playerNameBuffers[0] );
ADDRGP4 s_serveroptions+5632
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 804
;804:	}
LABELV $586
line 807
;805:
;806:	// init teams
;807:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5596
INDIRI4
CNSTI4 3
LTI4 $598
line 808
;808:		for( n = 0; n < (PLAYER_SLOTS / 2); n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $601
line 809
;809:			s_serveroptions.playerTeam[n].curvalue = 0;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4176+64
ADDP4
CNSTI4 0
ASGNI4
line 810
;810:		}
LABELV $602
line 808
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $601
line 811
;811:		for( ; n < PLAYER_SLOTS; n++ ) {
ADDRGP4 $610
JUMPV
LABELV $607
line 812
;812:			s_serveroptions.playerTeam[n].curvalue = 1;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4176+64
ADDP4
CNSTI4 1
ASGNI4
line 813
;813:		}
LABELV $608
line 811
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $610
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $607
line 814
;814:	}
ADDRGP4 $599
JUMPV
LABELV $598
line 815
;815:	else {
line 816
;816:		for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $613
line 817
;817:			s_serveroptions.playerTeam[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4176+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 818
;818:		}
LABELV $614
line 816
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $613
line 819
;819:	}
LABELV $599
line 820
;820:}
LABELV $566
endproc ServerOptions_InitPlayerItems 12 12
proc ServerOptions_SetPlayerItems 12 0
line 828
;821:
;822:
;823:/*
;824:=================
;825:ServerOptions_SetPlayerItems
;826:=================
;827:*/
;828:static void ServerOptions_SetPlayerItems( void ) {
line 840
;829:	int		start;
;830:	int		n;
;831:
;832:	// types
;833://	for( n = 0; n < PLAYER_SLOTS; n++ ) {
;834://		if( (!s_serveroptions.multiplayer) && (n > 0) && (s_serveroptions.playerType[n].curvalue == 0) ) {
;835://			s_serveroptions.playerType[n].curvalue = 1;
;836://		}
;837://	}
;838:
;839:	// names
;840:	if( s_serveroptions.dedicated.curvalue == 0 ) {
ADDRGP4 s_serveroptions+536+64
INDIRI4
CNSTI4 0
NEI4 $620
line 841
;841:		s_serveroptions.player0.string = "Human";
ADDRGP4 s_serveroptions+2088+60
ADDRGP4 $626
ASGNP4
line 842
;842:		s_serveroptions.playerName[0].generic.flags &= ~QMF_HIDDEN;
ADDRLP4 8
ADDRGP4 s_serveroptions+3312+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294963199
BANDU4
ASGNU4
line 844
;843:
;844:		start = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 845
;845:	}
ADDRGP4 $621
JUMPV
LABELV $620
line 846
;846:	else {
line 847
;847:		s_serveroptions.player0.string = "Open";
ADDRGP4 s_serveroptions+2088+60
ADDRGP4 $631
ASGNP4
line 848
;848:		start = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 849
;849:	}
LABELV $621
line 850
;850:	for( n = start; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $635
JUMPV
LABELV $632
line 851
;851:		if( s_serveroptions.playerType[n].curvalue == 1 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+64
ADDP4
INDIRI4
CNSTI4 1
NEI4 $636
line 852
;852:			s_serveroptions.playerName[n].generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3312+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 853
;853:		}
ADDRGP4 $637
JUMPV
LABELV $636
line 854
;854:		else {
line 855
;855:			s_serveroptions.playerName[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3312+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 856
;856:		}
LABELV $637
line 857
;857:	}
LABELV $633
line 850
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $635
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $632
line 860
;858:
;859:	// teams
;860:	if( s_serveroptions.gametype < GT_TEAM ) {
ADDRGP4 s_serveroptions+5596
INDIRI4
CNSTI4 3
GEI4 $644
line 861
;861:		return;
ADDRGP4 $619
JUMPV
LABELV $644
line 863
;862:	}
;863:	for( n = start; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $650
JUMPV
LABELV $647
line 864
;864:		if( s_serveroptions.playerType[n].curvalue == 2 ) {
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+64
ADDP4
INDIRI4
CNSTI4 2
NEI4 $651
line 865
;865:			s_serveroptions.playerTeam[n].generic.flags |= (QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4176+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 866
;866:		}
ADDRGP4 $652
JUMPV
LABELV $651
line 867
;867:		else {
line 868
;868:			s_serveroptions.playerTeam[n].generic.flags &= ~(QMF_INACTIVE|QMF_HIDDEN);
ADDRLP4 8
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4176+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 869
;869:		}
LABELV $652
line 870
;870:	}
LABELV $648
line 863
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $650
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $647
line 871
;871:}
LABELV $619
endproc ServerOptions_SetPlayerItems 12 0
proc ServerOptions_Event 8 0
line 879
;872:
;873:
;874:/*
;875:=================
;876:ServerOptions_Event
;877:=================
;878:*/
;879:static void ServerOptions_Event( void* ptr, int event ) {
line 880
;880:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $660
ADDRLP4 0
INDIRI4
CNSTI4 24
GTI4 $660
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $676-72
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $676
address $670
address $660
address $663
address $666
address $666
address $667
address $673
code
LABELV $663
line 886
;881:	
;882:	//if( event != QM_ACTIVATED && event != QM_LOSTFOCUS) {
;883:	//	return;
;884:	//}
;885:	case ID_PLAYER_TYPE:
;886:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $664
line 887
;887:			break;
ADDRGP4 $661
JUMPV
LABELV $664
line 889
;888:		}
;889:		ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 890
;890:		break;
ADDRGP4 $661
JUMPV
LABELV $666
line 894
;891:
;892:	case ID_MAXCLIENTS:
;893:	case ID_DEDICATED:
;894:		ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 895
;895:		break;
ADDRGP4 $661
JUMPV
LABELV $667
line 897
;896:	case ID_GO:
;897:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $668
line 898
;898:			break;
ADDRGP4 $661
JUMPV
LABELV $668
line 900
;899:		}
;900:		ServerOptions_Start();
ADDRGP4 ServerOptions_Start
CALLV
pop
line 901
;901:		break;
ADDRGP4 $661
JUMPV
LABELV $670
line 904
;902:
;903:	case ID_STARTSERVERNEXT:
;904:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $661
line 905
;905:			break;
ADDRGP4 $661
JUMPV
line 907
;906:		}
;907:		break;
LABELV $673
line 909
;908:	case ID_BACK:
;909:		if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $674
line 910
;910:			break;
ADDRGP4 $661
JUMPV
LABELV $674
line 912
;911:		}
;912:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 913
;913:		break;
LABELV $660
LABELV $661
line 915
;914:	}
;915:}
LABELV $659
endproc ServerOptions_Event 8 0
proc ServerOptions_PlayerNameEvent 4 4
line 918
;916:
;917:
;918:static void ServerOptions_PlayerNameEvent( void* ptr, int event ) {
line 921
;919:	int		n;
;920:
;921:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $679
line 922
;922:		return;
ADDRGP4 $678
JUMPV
LABELV $679
line 924
;923:	}
;924:	n = ((menutext_s*)ptr)->generic.id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 925
;925:	s_serveroptions.newBotIndex = n;
ADDRGP4 s_serveroptions+5828
ADDRLP4 0
INDIRI4
ASGNI4
line 926
;926:	UI_BotSelectMenu( s_serveroptions.playerNameBuffers[n] );
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5632
ADDP4
ARGP4
ADDRGP4 UI_BotSelectMenu
CALLV
pop
line 927
;927:}
LABELV $678
endproc ServerOptions_PlayerNameEvent 4 4
proc ServerOptions_StatusBar 4 20
line 935
;928:
;929:
;930:/*
;931:=================
;932:ServerOptions_StatusBar
;933:=================
;934:*/
;935:static void ServerOptions_StatusBar( void* ptr ) {
line 936
;936:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $684
JUMPV
LABELV $684
line 938
;937:	default:
;938:		UI_DrawString( 320, 440, "0 = NO LIMIT", UI_CENTER|UI_SMALLFONT, colorWhite );
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRGP4 $687
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 939
;939:		break;
LABELV $685
line 941
;940:	}
;941:}
LABELV $683
endproc ServerOptions_StatusBar 4 20
proc ServerOptions_LevelshotDraw 20 20
line 949
;942:
;943:
;944:/*
;945:===============
;946:ServerOptions_LevelshotDraw
;947:===============
;948:*/
;949:static void ServerOptions_LevelshotDraw( void *self ) {
line 955
;950:	menubitmap_s	*b;
;951:	int				x;
;952:	int				y;
;953:
;954:	// strange place for this, but it works
;955:	if( s_serveroptions.newBot ) {
ADDRGP4 s_serveroptions+5824
INDIRI4
CNSTI4 0
EQI4 $689
line 956
;956:		Q_strncpyz( s_serveroptions.playerNameBuffers[s_serveroptions.newBotIndex], s_serveroptions.newBotName, 16 );
ADDRGP4 s_serveroptions+5828
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5632
ADDP4
ARGP4
ADDRGP4 s_serveroptions+5832
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 957
;957:		s_serveroptions.newBot = qfalse;
ADDRGP4 s_serveroptions+5824
CNSTI4 0
ASGNI4
line 958
;958:	}
LABELV $689
line 960
;959:
;960:	b = (menubitmap_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 962
;961:
;962:	Bitmap_Draw( b );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Bitmap_Draw
CALLV
pop
line 964
;963:
;964:	x = b->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 965
;965:	y = b->generic.y + b->height;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDI4
ASGNI4
line 966
;966:	UI_FillRect( x, y, b->width, 40, colorBlack );
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1109393408
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 968
;967:
;968:	x += b->width / 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ASGNI4
line 969
;969:	y += 4;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 970
;970:	UI_DrawString( x, y, s_serveroptions.mapnamebuffer, UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 s_serveroptions+5600
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 972
;971:
;972:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 973
;973:	UI_DrawString( x, y, gametype_items[gametype_remap2[s_serveroptions.gametype]], UI_CENTER|UI_SMALLFONT, color_orange );
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRGP4 s_serveroptions+5596
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 gametype_remap2
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 gametype_items
ADDP4
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 974
;974:}
LABELV $688
endproc ServerOptions_LevelshotDraw 20 20
proc ServerOptions_InitBotNames 1072 12
line 977
;975:
;976:
;977:static void ServerOptions_InitBotNames( void ) {
line 986
;978:	int			count;
;979:	int			n;
;980:	const char	*arenaInfo;
;981:	const char	*botInfo;
;982:	char		*p;
;983:	char		*bot;
;984:	char		bots[MAX_INFO_STRING];
;985:
;986:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5596
INDIRI4
CNSTI4 3
LTI4 $699
line 987
;987:		Q_strncpyz( s_serveroptions.playerNameBuffers[1], "grunt", 16 );
ADDRGP4 s_serveroptions+5632+16
ARGP4
ADDRGP4 $704
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 988
;988:		Q_strncpyz( s_serveroptions.playerNameBuffers[2], "major", 16 );
ADDRGP4 s_serveroptions+5632+32
ARGP4
ADDRGP4 $707
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 989
;989:		if( s_serveroptions.gametype == GT_TEAM ) {
ADDRGP4 s_serveroptions+5596
INDIRI4
CNSTI4 3
NEI4 $708
line 990
;990:			Q_strncpyz( s_serveroptions.playerNameBuffers[3], "visor", 16 );
ADDRGP4 s_serveroptions+5632+48
ARGP4
ADDRGP4 $713
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 991
;991:		}
ADDRGP4 $709
JUMPV
LABELV $708
line 992
;992:		else {
line 993
;993:			s_serveroptions.playerType[3].curvalue = 2;
ADDRGP4 s_serveroptions+2160+288+64
CNSTI4 2
ASGNI4
line 994
;994:		}
LABELV $709
line 995
;995:		s_serveroptions.playerType[4].curvalue = 2;
ADDRGP4 s_serveroptions+2160+384+64
CNSTI4 2
ASGNI4
line 996
;996:		s_serveroptions.playerType[5].curvalue = 2;
ADDRGP4 s_serveroptions+2160+480+64
CNSTI4 2
ASGNI4
line 998
;997:
;998:		Q_strncpyz( s_serveroptions.playerNameBuffers[6], "sarge", 16 );
ADDRGP4 s_serveroptions+5632+96
ARGP4
ADDRGP4 $725
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 999
;999:		Q_strncpyz( s_serveroptions.playerNameBuffers[7], "grunt", 16 );
ADDRGP4 s_serveroptions+5632+112
ARGP4
ADDRGP4 $704
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1000
;1000:		Q_strncpyz( s_serveroptions.playerNameBuffers[8], "major", 16 );
ADDRGP4 s_serveroptions+5632+128
ARGP4
ADDRGP4 $707
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1001
;1001:		if( s_serveroptions.gametype == GT_TEAM ) {
ADDRGP4 s_serveroptions+5596
INDIRI4
CNSTI4 3
NEI4 $730
line 1002
;1002:			Q_strncpyz( s_serveroptions.playerNameBuffers[9], "visor", 16 );
ADDRGP4 s_serveroptions+5632+144
ARGP4
ADDRGP4 $713
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1003
;1003:		}
ADDRGP4 $731
JUMPV
LABELV $730
line 1004
;1004:		else {
line 1005
;1005:			s_serveroptions.playerType[9].curvalue = 2;
ADDRGP4 s_serveroptions+2160+864+64
CNSTI4 2
ASGNI4
line 1006
;1006:		}
LABELV $731
line 1007
;1007:		s_serveroptions.playerType[10].curvalue = 2;
ADDRGP4 s_serveroptions+2160+960+64
CNSTI4 2
ASGNI4
line 1008
;1008:		s_serveroptions.playerType[11].curvalue = 2;
ADDRGP4 s_serveroptions+2160+1056+64
CNSTI4 2
ASGNI4
line 1010
;1009:
;1010:		return;
ADDRGP4 $698
JUMPV
LABELV $699
line 1013
;1011:	}
;1012:
;1013:	count = 1;	// skip the first slot, reserved for a human
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1016
;1014:
;1015:	// get info for this map
;1016:	arenaInfo = UI_GetArenaInfoByMap( s_serveroptions.mapnamebuffer );
ADDRGP4 s_serveroptions+5600
ARGP4
ADDRLP4 1048
ADDRGP4 UI_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1048
INDIRP4
ASGNP4
line 1019
;1017:
;1018:	// get the bot info - we'll seed with them if any are listed
;1019:	Q_strncpyz( bots, Info_ValueForKey( arenaInfo, "bots" ), sizeof(bots) );
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 $745
ARGP4
ADDRLP4 1052
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1020
;1020:	p = &bots[0];
ADDRLP4 0
ADDRLP4 20
ASGNP4
ADDRGP4 $747
JUMPV
line 1021
;1021:	while( *p && count < PLAYER_SLOTS ) {
LABELV $749
line 1023
;1022:		//skip spaces
;1023:		while( *p && *p == ' ' ) {
line 1024
;1024:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1025
;1025:		}
LABELV $750
line 1023
ADDRLP4 1056
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $752
ADDRLP4 1056
INDIRI4
CNSTI4 32
EQI4 $749
LABELV $752
line 1026
;1026:		if( !p ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $753
line 1027
;1027:			break;
ADDRGP4 $748
JUMPV
LABELV $753
line 1031
;1028:		}
;1029:
;1030:		// mark start of bot name
;1031:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $756
JUMPV
LABELV $755
line 1034
;1032:
;1033:		// skip until space of null
;1034:		while( *p && *p != ' ' ) {
line 1035
;1035:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1036
;1036:		}
LABELV $756
line 1034
ADDRLP4 1060
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $758
ADDRLP4 1060
INDIRI4
CNSTI4 32
NEI4 $755
LABELV $758
line 1037
;1037:		if( *p ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $759
line 1038
;1038:			*p++ = 0;
ADDRLP4 1064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1064
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1064
INDIRP4
CNSTI1 0
ASGNI1
line 1039
;1039:		}
LABELV $759
line 1041
;1040:
;1041:		botInfo = UI_GetBotInfoByName( bot );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 UI_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1064
INDIRP4
ASGNP4
line 1042
;1042:		bot = Info_ValueForKey( botInfo, "name" );
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $594
ARGP4
ADDRLP4 1068
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1068
INDIRP4
ASGNP4
line 1044
;1043:
;1044:		Q_strncpyz( s_serveroptions.playerNameBuffers[count], bot, sizeof(s_serveroptions.playerNameBuffers[count]) );
ADDRLP4 4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5632
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1045
;1045:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1046
;1046:	}
LABELV $747
line 1021
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $763
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $750
LABELV $763
LABELV $748
line 1049
;1047:
;1048:	// set the rest of the bot slots to "---"
;1049:	for( n = count; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $767
JUMPV
LABELV $764
line 1050
;1050:		strcpy( s_serveroptions.playerNameBuffers[n], "--------" );
ADDRLP4 12
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5632
ADDP4
ARGP4
ADDRGP4 $769
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1051
;1051:	}
LABELV $765
line 1049
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $767
ADDRLP4 12
INDIRI4
CNSTI4 12
LTI4 $764
line 1054
;1052:
;1053:	// pad up to #8 as open slots
;1054:	for( ;count < 8; count++ ) {
ADDRGP4 $773
JUMPV
LABELV $770
line 1055
;1055:		s_serveroptions.playerType[count].curvalue = 0;
CNSTI4 96
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+64
ADDP4
CNSTI4 0
ASGNI4
line 1056
;1056:	}
LABELV $771
line 1054
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $773
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $770
line 1059
;1057:
;1058:	// close off the rest by default
;1059:	for( ;count < PLAYER_SLOTS; count++ ) {
ADDRGP4 $779
JUMPV
LABELV $776
line 1060
;1060:		if( s_serveroptions.playerType[count].curvalue == 1 ) {
CNSTI4 96
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+64
ADDP4
INDIRI4
CNSTI4 1
NEI4 $780
line 1061
;1061:			s_serveroptions.playerType[count].curvalue = 2;
CNSTI4 96
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+64
ADDP4
CNSTI4 2
ASGNI4
line 1062
;1062:		}
LABELV $780
line 1063
;1063:	}
LABELV $777
line 1059
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $779
ADDRLP4 4
INDIRI4
CNSTI4 12
LTI4 $776
line 1064
;1064:}
LABELV $698
endproc ServerOptions_InitBotNames 1072 12
bss
align 1
LABELV $787
skip 64
code
proc ServerOptions_SetMenuItems 84 16
line 1072
;1065:
;1066:
;1067:/*
;1068:=================
;1069:ServerOptions_SetMenuItems
;1070:=================
;1071:*/
;1072:static void ServerOptions_SetMenuItems( void ) {
line 1075
;1073:	static char picname[64];
;1074:
;1075:	switch( s_serveroptions.gametype ) {
ADDRLP4 0
ADDRGP4 s_serveroptions+5596
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $788
ADDRLP4 0
INDIRI4
CNSTI4 4
GTI4 $788
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $827
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $827
address $791
address $799
address $788
address $806
address $816
code
LABELV $791
LABELV $788
line 1078
;1076:	case GT_FFA:
;1077:	default:
;1078:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ffa_fraglimit" ) ) );
ADDRGP4 $512
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+964+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $795
ARGP4
ADDRLP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1079
;1079:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ffa_timelimit" ) ) );
ADDRGP4 $513
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+632+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $795
ARGP4
ADDRLP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1080
;1080:		break;
ADDRGP4 $789
JUMPV
LABELV $799
line 1083
;1081:
;1082:	case GT_TOURNAMENT:
;1083:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_tourney_fraglimit" ) ) );
ADDRGP4 $515
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+964+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $795
ARGP4
ADDRLP4 24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1084
;1084:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_tourney_timelimit" ) ) );
ADDRGP4 $516
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+632+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $795
ARGP4
ADDRLP4 32
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1085
;1085:		break;
ADDRGP4 $789
JUMPV
LABELV $806
line 1088
;1086:
;1087:	case GT_TEAM:
;1088:		Com_sprintf( s_serveroptions.fraglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_team_fraglimit" ) ) );
ADDRGP4 $518
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+964+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $795
ARGP4
ADDRLP4 40
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1089
;1089:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_team_timelimit" ) ) );
ADDRGP4 $519
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+632+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $795
ARGP4
ADDRLP4 48
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1090
;1090:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_team_friendly" ) );
ADDRGP4 $815
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1628+60
ADDRLP4 56
INDIRF4
CVFI4 4
ASGNI4
line 1091
;1091:		break;
ADDRGP4 $789
JUMPV
LABELV $816
line 1094
;1092:
;1093:	case GT_CTF:
;1094:		Com_sprintf( s_serveroptions.flaglimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 100, trap_Cvar_VariableValue( "ui_ctf_capturelimit" ) ) );
ADDRGP4 $820
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1296+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $795
ARGP4
ADDRLP4 64
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1095
;1095:		Com_sprintf( s_serveroptions.timelimit.field.buffer, 4, "%i", (int)Com_Clamp( 0, 999, trap_Cvar_VariableValue( "ui_ctf_timelimit" ) ) );
ADDRGP4 $523
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1148829696
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+632+60+12
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 $795
ARGP4
ADDRLP4 72
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1096
;1096:		s_serveroptions.friendlyfire.curvalue = (int)Com_Clamp( 0, 1, trap_Cvar_VariableValue( "ui_ctf_friendly" ) );
ADDRGP4 $826
ARGP4
ADDRLP4 76
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 76
INDIRF4
ARGF4
ADDRLP4 80
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+1628+60
ADDRLP4 80
INDIRF4
CVFI4 4
ASGNI4
line 1097
;1097:		break;
LABELV $789
line 1100
;1098:	}
;1099:
;1100:	Q_strncpyz( s_serveroptions.hostname.field.buffer, UI_Cvar_VariableString( "sv_hostname" ), sizeof( s_serveroptions.hostname.field.buffer ) );
ADDRGP4 $533
ARGP4
ADDRLP4 4
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_serveroptions+1692+60+12
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1101
;1101:	s_serveroptions.pure.curvalue = Com_Clamp( 0, 1, trap_Cvar_VariableValue( "sv_pure" ) );
ADDRGP4 $532
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+2024+60
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1104
;1102:
;1103:	// set the map pic
;1104:	Com_sprintf( picname, 64, "levelshots/%s", s_startserver.maplist[s_startserver.currentmap] );
ADDRGP4 $787
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $100
ARGP4
ADDRGP4 s_startserver+1764
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_startserver+1780
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1105
;1105:	s_serveroptions.mappic.generic.name = picname;
ADDRGP4 s_serveroptions+360+4
ADDRGP4 $787
ASGNP4
line 1108
;1106:
;1107:	// set the map name
;1108:	strcpy( s_serveroptions.mapnamebuffer, s_startserver.mapname.string );
ADDRGP4 s_serveroptions+5600
ARGP4
ADDRGP4 s_startserver+1600+60
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1109
;1109:	Q_strupr( s_serveroptions.mapnamebuffer );
ADDRGP4 s_serveroptions+5600
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 1112
;1110:
;1111:	// get the player selections initialized
;1112:	ServerOptions_InitPlayerItems();
ADDRGP4 ServerOptions_InitPlayerItems
CALLV
pop
line 1113
;1113:	ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1116
;1114:
;1115:	// seed bot names
;1116:	ServerOptions_InitBotNames();
ADDRGP4 ServerOptions_InitBotNames
CALLV
pop
line 1117
;1117:	ServerOptions_SetPlayerItems();
ADDRGP4 ServerOptions_SetPlayerItems
CALLV
pop
line 1118
;1118:}
LABELV $786
endproc ServerOptions_SetMenuItems 84 16
proc PlayerName_Draw 48 20
line 1125
;1119:
;1120:/*
;1121:=================
;1122:PlayerName_Draw
;1123:=================
;1124:*/
;1125:static void PlayerName_Draw( void *item ) {
line 1132
;1126:	menutext_s	*s;
;1127:	float		*color;
;1128:	int			x, y;
;1129:	int			style;
;1130:	qboolean	focus;
;1131:
;1132:	s = (menutext_s *)item;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1134
;1133:
;1134:	x = s->generic.x;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1135
;1135:	y =	s->generic.y;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1137
;1136:
;1137:	style = UI_SMALLFONT;
ADDRLP4 16
CNSTI4 16
ASGNI4
line 1138
;1138:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $846
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $847
JUMPV
LABELV $846
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $847
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 1140
;1139:
;1140:	if ( s->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $848
line 1141
;1141:		color = text_color_disabled;
ADDRLP4 4
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $849
JUMPV
LABELV $848
line 1142
;1142:	else if ( focus )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $850
line 1143
;1143:	{
line 1144
;1144:		color = text_color_highlight;
ADDRLP4 4
ADDRGP4 text_color_highlight
ASGNP4
line 1145
;1145:		style |= UI_PULSE;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1146
;1146:	}
ADDRGP4 $851
JUMPV
LABELV $850
line 1147
;1147:	else if ( s->generic.flags & QMF_BLINK )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $852
line 1148
;1148:	{
line 1149
;1149:		color = text_color_highlight;
ADDRLP4 4
ADDRGP4 text_color_highlight
ASGNP4
line 1150
;1150:		style |= UI_BLINK;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1151
;1151:	}
ADDRGP4 $853
JUMPV
LABELV $852
line 1153
;1152:	else
;1153:		color = text_color_normal;
ADDRLP4 4
ADDRGP4 text_color_normal
ASGNP4
LABELV $853
LABELV $851
LABELV $849
line 1155
;1154:
;1155:	if ( focus )
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $854
line 1156
;1156:	{
line 1158
;1157:		// draw cursor
;1158:		UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color ); 
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
ADDRLP4 44
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
SUBI4
ADDRLP4 44
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1159
;1159:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4113
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 1160
;1160:	}
LABELV $854
line 1162
;1161:
;1162:	UI_DrawString( x - SMALLCHAR_WIDTH, y, s->generic.name, style|UI_RIGHT, color );
ADDRLP4 8
INDIRI4
CNSTI4 8
SUBI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1163
;1163:	UI_DrawString( x + SMALLCHAR_WIDTH, y, s->string, style|UI_LEFT, color );
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1164
;1164:}
LABELV $844
endproc PlayerName_Draw 48 20
proc ServerOptions_MenuInit 40 12
line 1174
;1165:
;1166:
;1167:/*
;1168:=================
;1169:ServerOptions_MenuInit
;1170:=================
;1171:*/
;1172:#define OPTIONS_X	456
;1173:
;1174:static void ServerOptions_MenuInit( qboolean multiplayer ) {
line 1178
;1175:	int		y;
;1176:	int		n;
;1177:
;1178:	memset( &s_serveroptions, 0 ,sizeof(serveroptions_t) );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 0
ARGI4
CNSTI4 5848
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1179
;1179:	s_serveroptions.multiplayer = multiplayer;
ADDRGP4 s_serveroptions+5592
ADDRFP4 0
INDIRI4
ASGNI4
line 1180
;1180:	s_serveroptions.gametype = (int)Com_Clamp( 0, 5, trap_Cvar_VariableValue( "g_gameType" ) );
ADDRGP4 $201
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1084227584
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 s_serveroptions+5596
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 1182
;1181:
;1182:	ServerOptions_Cache();
ADDRGP4 ServerOptions_Cache
CALLV
pop
line 1184
;1183:
;1184:	s_serveroptions.menu.wrapAround = qtrue;
ADDRGP4 s_serveroptions+276
CNSTI4 1
ASGNI4
line 1185
;1185:	s_serveroptions.menu.fullscreen = qtrue;
ADDRGP4 s_serveroptions+280
CNSTI4 1
ASGNI4
line 1187
;1186:
;1187:	s_serveroptions.banner.generic.type			= MTYPE_BTEXT;
ADDRGP4 s_serveroptions+288
CNSTI4 10
ASGNI4
line 1188
;1188:	s_serveroptions.banner.generic.x			= 320;
ADDRGP4 s_serveroptions+288+12
CNSTI4 320
ASGNI4
line 1189
;1189:	s_serveroptions.banner.generic.y			= 16;
ADDRGP4 s_serveroptions+288+16
CNSTI4 16
ASGNI4
line 1190
;1190:	s_serveroptions.banner.string  				= "GALLERY";
ADDRGP4 s_serveroptions+288+60
ADDRGP4 $868
ASGNP4
line 1191
;1191:	s_serveroptions.banner.color  				= color_white;
ADDRGP4 s_serveroptions+288+68
ADDRGP4 color_white
ASGNP4
line 1192
;1192:	s_serveroptions.banner.style  				= UI_CENTER;
ADDRGP4 s_serveroptions+288+64
CNSTI4 1
ASGNI4
line 1194
;1193:
;1194:	s_serveroptions.mappic.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_serveroptions+360
CNSTI4 6
ASGNI4
line 1195
;1195:	s_serveroptions.mappic.generic.flags		= QMF_CENTER_JUSTIFY|QMF_INACTIVE;
ADDRGP4 s_serveroptions+360+44
CNSTU4 16392
ASGNU4
line 1196
;1196:	s_serveroptions.mappic.generic.x			= 352;
ADDRGP4 s_serveroptions+360+12
CNSTI4 352
ASGNI4
line 1197
;1197:	s_serveroptions.mappic.generic.y			= 80;
ADDRGP4 s_serveroptions+360+16
CNSTI4 80
ASGNI4
line 1198
;1198:	s_serveroptions.mappic.width				= 320;
ADDRGP4 s_serveroptions+360+76
CNSTI4 320
ASGNI4
line 1199
;1199:	s_serveroptions.mappic.height				= 240;
ADDRGP4 s_serveroptions+360+80
CNSTI4 240
ASGNI4
line 1200
;1200:	s_serveroptions.mappic.errorpic				= GAMESERVER_UNKNOWNMAP;
ADDRGP4 s_serveroptions+360+64
ADDRGP4 $277
ASGNP4
line 1201
;1201:	s_serveroptions.mappic.generic.ownerdraw	= ServerOptions_LevelshotDraw;
ADDRGP4 s_serveroptions+360+56
ADDRGP4 ServerOptions_LevelshotDraw
ASGNP4
line 1203
;1202:
;1203:	s_serveroptions.picframe.generic.type		= MTYPE_BITMAP;
ADDRGP4 s_serveroptions+448
CNSTI4 6
ASGNI4
line 1204
;1204:	s_serveroptions.picframe.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE|QMF_HIGHLIGHT;
ADDRGP4 s_serveroptions+448+44
CNSTU4 16452
ASGNU4
line 1205
;1205:	s_serveroptions.picframe.generic.x			= 352 - 38;
ADDRGP4 s_serveroptions+448+12
CNSTI4 314
ASGNI4
line 1206
;1206:	s_serveroptions.picframe.generic.y			= 80 - 40;
ADDRGP4 s_serveroptions+448+16
CNSTI4 40
ASGNI4
line 1207
;1207:	s_serveroptions.picframe.width  			= 320;
ADDRGP4 s_serveroptions+448+76
CNSTI4 320
ASGNI4
line 1208
;1208:	s_serveroptions.picframe.height  			= 320;
ADDRGP4 s_serveroptions+448+80
CNSTI4 320
ASGNI4
line 1209
;1209:	s_serveroptions.picframe.focuspic			= GAMESERVER_SELECT;
ADDRGP4 s_serveroptions+448+60
ADDRGP4 $305
ASGNP4
line 1211
;1210:
;1211:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1212
;1212:	s_serveroptions.timelimit.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+632
CNSTI4 4
ASGNI4
line 1213
;1213:	s_serveroptions.timelimit.generic.name       = "Time Limit:";
ADDRGP4 s_serveroptions+632+4
ADDRGP4 $904
ASGNP4
line 1214
;1214:	s_serveroptions.timelimit.generic.flags      = QMF_NUMBERSONLY|QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+632+44
CNSTU4 290
ASGNU4
line 1215
;1215:	s_serveroptions.timelimit.generic.x	         = OPTIONS_X;
ADDRGP4 s_serveroptions+632+12
CNSTI4 456
ASGNI4
line 1216
;1216:	s_serveroptions.timelimit.generic.y	         = y;
ADDRGP4 s_serveroptions+632+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1217
;1217:	s_serveroptions.timelimit.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+632+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1218
;1218:	s_serveroptions.timelimit.field.widthInChars = 3;
ADDRGP4 s_serveroptions+632+60+8
CNSTI4 3
ASGNI4
line 1219
;1219:	s_serveroptions.timelimit.field.maxchars     = 3;
ADDRGP4 s_serveroptions+632+60+268
CNSTI4 3
ASGNI4
line 1221
;1220:
;1221:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5596
INDIRI4
CNSTI4 3
LTI4 $919
line 1222
;1222:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1223
;1223:		s_serveroptions.friendlyfire.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+1628
CNSTI4 5
ASGNI4
line 1224
;1224:		s_serveroptions.friendlyfire.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1628+44
CNSTU4 258
ASGNU4
line 1225
;1225:		s_serveroptions.friendlyfire.generic.x	      = OPTIONS_X;
ADDRGP4 s_serveroptions+1628+12
CNSTI4 456
ASGNI4
line 1226
;1226:		s_serveroptions.friendlyfire.generic.y	      = y;
ADDRGP4 s_serveroptions+1628+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1227
;1227:		s_serveroptions.friendlyfire.generic.name	  = "Friendly Fire:";
ADDRGP4 s_serveroptions+1628+4
ADDRGP4 $931
ASGNP4
line 1228
;1228:	}
LABELV $919
line 1230
;1229:
;1230:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1231
;1231:	s_serveroptions.pure.generic.type			= MTYPE_RADIOBUTTON;
ADDRGP4 s_serveroptions+2024
CNSTI4 5
ASGNI4
line 1232
;1232:	s_serveroptions.pure.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2024+44
CNSTU4 258
ASGNU4
line 1233
;1233:	s_serveroptions.pure.generic.x				= OPTIONS_X;
ADDRGP4 s_serveroptions+2024+12
CNSTI4 456
ASGNI4
line 1234
;1234:	s_serveroptions.pure.generic.y				= y;
ADDRGP4 s_serveroptions+2024+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1235
;1235:	s_serveroptions.pure.generic.name			= "Pure Server:";
ADDRGP4 s_serveroptions+2024+4
ADDRGP4 $941
ASGNP4
line 1237
;1236:
;1237:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5592
INDIRI4
CNSTI4 0
EQI4 $942
line 1238
;1238:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1239
;1239:		s_serveroptions.dedicated.generic.type		= MTYPE_SPINCONTROL;
ADDRGP4 s_serveroptions+536
CNSTI4 3
ASGNI4
line 1240
;1240:		s_serveroptions.dedicated.generic.id		= ID_DEDICATED;
ADDRGP4 s_serveroptions+536+8
CNSTI4 22
ASGNI4
line 1241
;1241:		s_serveroptions.dedicated.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_serveroptions+536+44
CNSTU4 258
ASGNU4
line 1242
;1242:		s_serveroptions.dedicated.generic.callback	= ServerOptions_Event;
ADDRGP4 s_serveroptions+536+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1243
;1243:		s_serveroptions.dedicated.generic.x			= OPTIONS_X;
ADDRGP4 s_serveroptions+536+12
CNSTI4 456
ASGNI4
line 1244
;1244:		s_serveroptions.dedicated.generic.y			= y;
ADDRGP4 s_serveroptions+536+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1245
;1245:		s_serveroptions.dedicated.generic.name		= "Dedicated:";
ADDRGP4 s_serveroptions+536+4
ADDRGP4 $958
ASGNP4
line 1246
;1246:		s_serveroptions.dedicated.itemnames			= dedicated_list;
ADDRGP4 s_serveroptions+536+76
ADDRGP4 dedicated_list
ASGNP4
line 1247
;1247:	}
LABELV $942
line 1249
;1248:
;1249:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5592
INDIRI4
CNSTI4 0
EQI4 $961
line 1250
;1250:		y += BIGCHAR_HEIGHT+2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 1251
;1251:		s_serveroptions.hostname.generic.type       = MTYPE_FIELD;
ADDRGP4 s_serveroptions+1692
CNSTI4 4
ASGNI4
line 1252
;1252:		s_serveroptions.hostname.generic.name       = "Hostname:";
ADDRGP4 s_serveroptions+1692+4
ADDRGP4 $967
ASGNP4
line 1253
;1253:		s_serveroptions.hostname.generic.flags      = QMF_SMALLFONT;
ADDRGP4 s_serveroptions+1692+44
CNSTU4 2
ASGNU4
line 1254
;1254:		s_serveroptions.hostname.generic.x          = OPTIONS_X;
ADDRGP4 s_serveroptions+1692+12
CNSTI4 456
ASGNI4
line 1255
;1255:		s_serveroptions.hostname.generic.y	        = y;
ADDRGP4 s_serveroptions+1692+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1256
;1256:		s_serveroptions.hostname.field.widthInChars = 18;
ADDRGP4 s_serveroptions+1692+60+8
CNSTI4 18
ASGNI4
line 1257
;1257:		s_serveroptions.hostname.field.maxchars     = 64;
ADDRGP4 s_serveroptions+1692+60+268
CNSTI4 64
ASGNI4
line 1258
;1258:	}
LABELV $961
line 1260
;1259:
;1260:	y += ( 2 * SMALLCHAR_HEIGHT );
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 1261
;1261:	s_serveroptions.player0.generic.type			= MTYPE_TEXT;
ADDRGP4 s_serveroptions+2088
CNSTI4 7
ASGNI4
line 1262
;1262:	s_serveroptions.player0.generic.flags			= QMF_SMALLFONT;
ADDRGP4 s_serveroptions+2088+44
CNSTU4 2
ASGNU4
line 1263
;1263:	s_serveroptions.player0.generic.x				= 32 + SMALLCHAR_WIDTH;
ADDRGP4 s_serveroptions+2088+12
CNSTI4 40
ASGNI4
line 1264
;1264:	s_serveroptions.player0.generic.y				= y;
ADDRGP4 s_serveroptions+2088+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1265
;1265:	s_serveroptions.player0.color					= color_orange;
ADDRGP4 s_serveroptions+2088+68
ADDRGP4 color_orange
ASGNP4
line 1266
;1266:	s_serveroptions.player0.style					= UI_LEFT|UI_SMALLFONT;
ADDRGP4 s_serveroptions+2088+64
CNSTI4 16
ASGNI4
line 1268
;1267:
;1268:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $991
line 1269
;1269:		s_serveroptions.playerType[n].generic.type		= MTYPE_SPINCONTROL;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160
ADDP4
CNSTI4 3
ASGNI4
line 1270
;1270:		s_serveroptions.playerType[n].generic.flags		= QMF_SMALLFONT;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+44
ADDP4
CNSTU4 2
ASGNU4
line 1271
;1271:		s_serveroptions.playerType[n].generic.id		= ID_PLAYER_TYPE;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+8
ADDP4
CNSTI4 20
ASGNI4
line 1272
;1272:		s_serveroptions.playerType[n].generic.callback	= ServerOptions_Event;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+48
ADDP4
ADDRGP4 ServerOptions_Event
ASGNP4
line 1273
;1273:		s_serveroptions.playerType[n].generic.x			= 32;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+12
ADDP4
CNSTI4 32
ASGNI4
line 1274
;1274:		s_serveroptions.playerType[n].generic.y			= y;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1277
;1275://		s_serveroptions.playerType[n].itemnames			= playerType_list;
;1276:
;1277:		s_serveroptions.playerName[n].generic.type		= MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3312
ADDP4
CNSTI4 7
ASGNI4
line 1278
;1278:		s_serveroptions.playerName[n].generic.flags		= QMF_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3312+44
ADDP4
CNSTU4 2
ASGNU4
line 1279
;1279:		s_serveroptions.playerName[n].generic.x			= 96;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3312+12
ADDP4
CNSTI4 96
ASGNI4
line 1280
;1280:		s_serveroptions.playerName[n].generic.y			= y;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3312+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1281
;1281:		s_serveroptions.playerName[n].generic.callback	= ServerOptions_PlayerNameEvent;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3312+48
ADDP4
ADDRGP4 ServerOptions_PlayerNameEvent
ASGNP4
line 1282
;1282:		s_serveroptions.playerName[n].generic.id		= n;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3312+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1283
;1283:		s_serveroptions.playerName[n].generic.ownerdraw	= PlayerName_Draw;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3312+56
ADDP4
ADDRGP4 PlayerName_Draw
ASGNP4
line 1284
;1284:		s_serveroptions.playerName[n].color				= color_orange;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3312+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1285
;1285:		s_serveroptions.playerName[n].style				= UI_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3312+64
ADDP4
CNSTI4 16
ASGNI4
line 1286
;1286:		s_serveroptions.playerName[n].string			= s_serveroptions.playerNameBuffers[n];
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3312+60
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 s_serveroptions+5632
ADDP4
ASGNP4
line 1287
;1287:		s_serveroptions.playerName[n].generic.top		= s_serveroptions.playerName[n].generic.y;
ADDRLP4 24
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 s_serveroptions+3312+24
ADDP4
ADDRLP4 24
INDIRI4
ADDRGP4 s_serveroptions+3312+16
ADDP4
INDIRI4
ASGNI4
line 1288
;1288:		s_serveroptions.playerName[n].generic.bottom	= s_serveroptions.playerName[n].generic.y + SMALLCHAR_HEIGHT;
ADDRLP4 28
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRGP4 s_serveroptions+3312+32
ADDP4
ADDRLP4 28
INDIRI4
ADDRGP4 s_serveroptions+3312+16
ADDP4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1289
;1289:		s_serveroptions.playerName[n].generic.left		= s_serveroptions.playerName[n].generic.x - SMALLCHAR_HEIGHT/ 2;
ADDRLP4 32
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 s_serveroptions+3312+20
ADDP4
ADDRLP4 32
INDIRI4
ADDRGP4 s_serveroptions+3312+12
ADDP4
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 1290
;1290:		s_serveroptions.playerName[n].generic.right		= s_serveroptions.playerName[n].generic.x + 16 * SMALLCHAR_WIDTH;
ADDRLP4 36
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 s_serveroptions+3312+28
ADDP4
ADDRLP4 36
INDIRI4
ADDRGP4 s_serveroptions+3312+12
ADDP4
INDIRI4
CNSTI4 128
ADDI4
ASGNI4
line 1292
;1291:
;1292:		s_serveroptions.playerTeam[n].generic.type		= MTYPE_SPINCONTROL;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4176
ADDP4
CNSTI4 3
ASGNI4
line 1293
;1293:		s_serveroptions.playerTeam[n].generic.flags		= QMF_SMALLFONT;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4176+44
ADDP4
CNSTU4 2
ASGNU4
line 1294
;1294:		s_serveroptions.playerTeam[n].generic.x			= 240;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4176+12
ADDP4
CNSTI4 240
ASGNI4
line 1295
;1295:		s_serveroptions.playerTeam[n].generic.y			= y;
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4176+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1298
;1296://		s_serveroptions.playerTeam[n].itemnames			= playerTeam_list;
;1297:
;1298:		y += ( SMALLCHAR_HEIGHT + 4 );
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 1299
;1299:	}
LABELV $992
line 1268
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $991
line 1301
;1300:
;1301:	s_serveroptions.back.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5504
CNSTI4 6
ASGNI4
line 1302
;1302:	s_serveroptions.back.generic.name     = GAMESERVER_BACK0;
ADDRGP4 s_serveroptions+5504+4
ADDRGP4 $372
ASGNP4
line 1303
;1303:	s_serveroptions.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serveroptions+5504+44
CNSTU4 260
ASGNU4
line 1304
;1304:	s_serveroptions.back.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5504+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1305
;1305:	s_serveroptions.back.generic.id	      = ID_BACK;
ADDRGP4 s_serveroptions+5504+8
CNSTI4 24
ASGNI4
line 1306
;1306:	s_serveroptions.back.generic.x		  = 0;
ADDRGP4 s_serveroptions+5504+12
CNSTI4 0
ASGNI4
line 1307
;1307:	s_serveroptions.back.generic.y		  = 480-64;
ADDRGP4 s_serveroptions+5504+16
CNSTI4 416
ASGNI4
line 1308
;1308:	s_serveroptions.back.width  		  = 128;
ADDRGP4 s_serveroptions+5504+76
CNSTI4 128
ASGNI4
line 1309
;1309:	s_serveroptions.back.height  		  = 64;
ADDRGP4 s_serveroptions+5504+80
CNSTI4 64
ASGNI4
line 1310
;1310:	s_serveroptions.back.focuspic         = GAMESERVER_BACK1;
ADDRGP4 s_serveroptions+5504+60
ADDRGP4 $389
ASGNP4
line 1312
;1311:
;1312:	s_serveroptions.next.generic.type	  = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5416
CNSTI4 6
ASGNI4
line 1313
;1313:	s_serveroptions.next.generic.name     = GAMESERVER_NEXT0;
ADDRGP4 s_serveroptions+5416+4
ADDRGP4 $393
ASGNP4
line 1314
;1314:	s_serveroptions.next.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS|QMF_INACTIVE|QMF_GRAYED|QMF_HIDDEN;
ADDRGP4 s_serveroptions+5416+44
CNSTU4 28944
ASGNU4
line 1315
;1315:	s_serveroptions.next.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5416+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1316
;1316:	s_serveroptions.next.generic.id	      = ID_STARTSERVERNEXT;
ADDRGP4 s_serveroptions+5416+8
CNSTI4 18
ASGNI4
line 1317
;1317:	s_serveroptions.next.generic.x		  = 640;
ADDRGP4 s_serveroptions+5416+12
CNSTI4 640
ASGNI4
line 1318
;1318:	s_serveroptions.next.generic.y		  = 480-64-72;
ADDRGP4 s_serveroptions+5416+16
CNSTI4 344
ASGNI4
line 1319
;1319:	s_serveroptions.next.generic.statusbar  = ServerOptions_StatusBar;
ADDRGP4 s_serveroptions+5416+52
ADDRGP4 ServerOptions_StatusBar
ASGNP4
line 1320
;1320:	s_serveroptions.next.width  		  = 128;
ADDRGP4 s_serveroptions+5416+76
CNSTI4 128
ASGNI4
line 1321
;1321:	s_serveroptions.next.height  		  = 64;
ADDRGP4 s_serveroptions+5416+80
CNSTI4 64
ASGNI4
line 1322
;1322:	s_serveroptions.next.focuspic         = GAMESERVER_NEXT1;
ADDRGP4 s_serveroptions+5416+60
ADDRGP4 $410
ASGNP4
line 1324
;1323:
;1324:	s_serveroptions.go.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_serveroptions+5328
CNSTI4 6
ASGNI4
line 1325
;1325:	s_serveroptions.go.generic.name     = GAMESERVER_FIGHT0;
ADDRGP4 s_serveroptions+5328+4
ADDRGP4 $1092
ASGNP4
line 1326
;1326:	s_serveroptions.go.generic.flags    = QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_serveroptions+5328+44
CNSTU4 272
ASGNU4
line 1327
;1327:	s_serveroptions.go.generic.callback = ServerOptions_Event;
ADDRGP4 s_serveroptions+5328+48
ADDRGP4 ServerOptions_Event
ASGNP4
line 1328
;1328:	s_serveroptions.go.generic.id	    = ID_GO;
ADDRGP4 s_serveroptions+5328+8
CNSTI4 23
ASGNI4
line 1329
;1329:	s_serveroptions.go.generic.x		= 640;
ADDRGP4 s_serveroptions+5328+12
CNSTI4 640
ASGNI4
line 1330
;1330:	s_serveroptions.go.generic.y		= 480-64;
ADDRGP4 s_serveroptions+5328+16
CNSTI4 416
ASGNI4
line 1331
;1331:	s_serveroptions.go.width  		    = 128;
ADDRGP4 s_serveroptions+5328+76
CNSTI4 128
ASGNI4
line 1332
;1332:	s_serveroptions.go.height  		    = 64;
ADDRGP4 s_serveroptions+5328+80
CNSTI4 64
ASGNI4
line 1333
;1333:	s_serveroptions.go.focuspic         = GAMESERVER_FIGHT1;
ADDRGP4 s_serveroptions+5328+60
ADDRGP4 $1109
ASGNP4
line 1335
;1334:
;1335:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.banner );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1337
;1336:
;1337:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.mappic );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1338
;1338:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.picframe );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1341
;1339:
;1340://	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.botSkill );
;1341:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.player0 );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2088
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1342
;1342:	for( n = 0; n < PLAYER_SLOTS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1114
line 1343
;1343:		if( n != 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1118
line 1344
;1344:			Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerType[n] );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+2160
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1345
;1345:		}
LABELV $1118
line 1346
;1346:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerName[n] );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+3312
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1347
;1347:		if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5596
INDIRI4
CNSTI4 3
LTI4 $1122
line 1348
;1348:			Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.playerTeam[n] );
ADDRGP4 s_serveroptions
ARGP4
CNSTI4 96
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_serveroptions+4176
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1349
;1349:		}
LABELV $1122
line 1350
;1350:	}
LABELV $1115
line 1342
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 12
LTI4 $1114
line 1358
;1351:
;1352://	if( s_serveroptions.gametype != GT_CTF ) {
;1353://		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.fraglimit );
;1354://	}
;1355://	else {
;1356://		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.flaglimit );
;1357://	}
;1358:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.timelimit );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+632
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1359
;1359:	if( s_serveroptions.gametype >= GT_TEAM ) {
ADDRGP4 s_serveroptions+5596
INDIRI4
CNSTI4 3
LTI4 $1127
line 1360
;1360:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.friendlyfire );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1628
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1361
;1361:	}
LABELV $1127
line 1362
;1362:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.pure );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+2024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1363
;1363:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5592
INDIRI4
CNSTI4 0
EQI4 $1132
line 1364
;1364:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.dedicated );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1365
;1365:	}
LABELV $1132
line 1366
;1366:	if( s_serveroptions.multiplayer ) {
ADDRGP4 s_serveroptions+5592
INDIRI4
CNSTI4 0
EQI4 $1136
line 1367
;1367:		Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.hostname );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+1692
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1368
;1368:	}
LABELV $1136
line 1370
;1369:
;1370:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.back );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1371
;1371:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.next );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1372
;1372:	Menu_AddItem( &s_serveroptions.menu, &s_serveroptions.go );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 s_serveroptions+5328
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1375
;1373:
;1374:	
;1375:	ServerOptions_SetMenuItems();
ADDRGP4 ServerOptions_SetMenuItems
CALLV
pop
line 1376
;1376:}
LABELV $856
endproc ServerOptions_MenuInit 40 12
export ServerOptions_Cache
proc ServerOptions_Cache 0 4
line 1383
;1377:
;1378:/*
;1379:=================
;1380:ServerOptions_Cache
;1381:=================
;1382:*/
;1383:void ServerOptions_Cache( void ) {
line 1384
;1384:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK0 );
ADDRGP4 $372
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1385
;1385:	trap_R_RegisterShaderNoMip( GAMESERVER_BACK1 );
ADDRGP4 $389
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1386
;1386:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT0 );
ADDRGP4 $1092
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1387
;1387:	trap_R_RegisterShaderNoMip( GAMESERVER_FIGHT1 );
ADDRGP4 $1109
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1388
;1388:	trap_R_RegisterShaderNoMip( GAMESERVER_SELECT );
ADDRGP4 $305
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1389
;1389:	trap_R_RegisterShaderNoMip( GAMESERVER_UNKNOWNMAP );
ADDRGP4 $277
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1390
;1390:}
LABELV $1143
endproc ServerOptions_Cache 0 4
proc UI_ServerOptionsMenu 0 4
line 1398
;1391:
;1392:
;1393:/*
;1394:=================
;1395:UI_ServerOptionsMenu
;1396:=================
;1397:*/
;1398:static void UI_ServerOptionsMenu( qboolean multiplayer ) {
line 1399
;1399:	ServerOptions_MenuInit( multiplayer );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ServerOptions_MenuInit
CALLV
pop
line 1400
;1400:	UI_PushMenu( &s_serveroptions.menu );
ADDRGP4 s_serveroptions
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1401
;1401:}
LABELV $1144
endproc UI_ServerOptionsMenu 0 4
proc UI_BotSelectMenu_SortCompare 44 8
line 1462
;1402:
;1403:
;1404:
;1405:/*
;1406:=============================================================================
;1407:
;1408:BOT SELECT MENU *****
;1409:
;1410:=============================================================================
;1411:*/
;1412:
;1413:
;1414:#define BOTSELECT_BACK0			"menu/art/back_0"
;1415:#define BOTSELECT_BACK1			"menu/art/back_1"
;1416:#define BOTSELECT_ACCEPT0		"menu/art/accept_0"
;1417:#define BOTSELECT_ACCEPT1		"menu/art/accept_1"
;1418:#define BOTSELECT_SELECT		"menu/art/opponents_select"
;1419:#define BOTSELECT_SELECTED		"menu/art/opponents_selected"
;1420:#define BOTSELECT_ARROWS		"menu/art/gs_arrows_0"
;1421:#define BOTSELECT_ARROWSL		"menu/art/gs_arrows_l"
;1422:#define BOTSELECT_ARROWSR		"menu/art/gs_arrows_r"
;1423:
;1424:#define PLAYERGRID_COLS			4
;1425:#define PLAYERGRID_ROWS			4
;1426:#define MAX_MODELSPERPAGE		(PLAYERGRID_ROWS * PLAYERGRID_COLS)
;1427:
;1428:
;1429:typedef struct {
;1430:	menuframework_s	menu;
;1431:
;1432:	menutext_s		banner;
;1433:
;1434:	menubitmap_s	pics[MAX_MODELSPERPAGE];
;1435:	menubitmap_s	picbuttons[MAX_MODELSPERPAGE];
;1436:	menutext_s		picnames[MAX_MODELSPERPAGE];
;1437:
;1438:	menubitmap_s	arrows;
;1439:	menubitmap_s	left;
;1440:	menubitmap_s	right;
;1441:
;1442:	menubitmap_s	go;
;1443:	menubitmap_s	back;
;1444:
;1445:	int				numBots;
;1446:	int				modelpage;
;1447:	int				numpages;
;1448:	int				selectedmodel;
;1449:	int				sortedBotNums[MAX_BOTS];
;1450:	char			boticons[MAX_MODELSPERPAGE][MAX_QPATH];
;1451:	char			botnames[MAX_MODELSPERPAGE][16];
;1452:} botSelectInfo_t;
;1453:
;1454:static botSelectInfo_t	botSelectInfo;
;1455:
;1456:
;1457:/*
;1458:=================
;1459:UI_BotSelectMenu_SortCompare
;1460:=================
;1461:*/
;1462:static int QDECL UI_BotSelectMenu_SortCompare( const void *arg1, const void *arg2 ) {
line 1467
;1463:	int			num1, num2;
;1464:	const char	*info1, *info2;
;1465:	const char	*name1, *name2;
;1466:
;1467:	num1 = *(int *)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1468
;1468:	num2 = *(int *)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1470
;1469:
;1470:	info1 = UI_GetBotInfoByNumber( num1 );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 1471
;1471:	info2 = UI_GetBotInfoByNumber( num2 );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 1473
;1472:
;1473:	name1 = Info_ValueForKey( info1, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $594
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 1474
;1474:	name2 = Info_ValueForKey( info2, "name" );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $594
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 1476
;1475:
;1476:	return Q_stricmp( name1, name2 );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $1146
endproc UI_BotSelectMenu_SortCompare 44 8
proc UI_BotSelectMenu_BuildList 12 16
line 1485
;1477:}
;1478:
;1479:
;1480:/*
;1481:=================
;1482:UI_BotSelectMenu_BuildList
;1483:=================
;1484:*/
;1485:static void UI_BotSelectMenu_BuildList( void ) {
line 1488
;1486:	int		n;
;1487:
;1488:	botSelectInfo.modelpage = 0;
ADDRGP4 botSelectInfo+4772
CNSTI4 0
ASGNI4
line 1489
;1489:	botSelectInfo.numBots = UI_GetNumBots();
ADDRLP4 4
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRGP4 botSelectInfo+4768
ADDRLP4 4
INDIRI4
ASGNI4
line 1490
;1490:	botSelectInfo.numpages = botSelectInfo.numBots / MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4776
ADDRGP4 botSelectInfo+4768
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 1491
;1491:	if( botSelectInfo.numBots % MAX_MODELSPERPAGE ) {
ADDRGP4 botSelectInfo+4768
INDIRI4
CNSTI4 16
MODI4
CNSTI4 0
EQI4 $1152
line 1492
;1492:		botSelectInfo.numpages++;
ADDRLP4 8
ADDRGP4 botSelectInfo+4776
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1493
;1493:	}
LABELV $1152
line 1496
;1494:
;1495:	// initialize the array
;1496:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1159
JUMPV
LABELV $1156
line 1497
;1497:		botSelectInfo.sortedBotNums[n] = n;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+4784
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1498
;1498:	}
LABELV $1157
line 1496
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1159
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
LTI4 $1156
line 1501
;1499:
;1500:	// now sort it
;1501:	qsort( botSelectInfo.sortedBotNums, botSelectInfo.numBots, sizeof(botSelectInfo.sortedBotNums[0]), UI_BotSelectMenu_SortCompare );
ADDRGP4 botSelectInfo+4784
ARGP4
ADDRGP4 botSelectInfo+4768
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_BotSelectMenu_SortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1502
;1502:}
LABELV $1147
endproc UI_BotSelectMenu_BuildList 12 16
proc ServerPlayerIcon 80 20
line 1510
;1503:
;1504:
;1505:/*
;1506:=================
;1507:ServerPlayerIcon
;1508:=================
;1509:*/
;1510:static void ServerPlayerIcon( const char *modelAndSkin, char *iconName, int iconNameMaxSize ) {
line 1514
;1511:	char	*skin;
;1512:	char	model[MAX_QPATH];
;1513:
;1514:	Q_strncpyz( model, modelAndSkin, sizeof(model));
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
line 1515
;1515:	skin = Q_strrchr( model, '/' );
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
line 1516
;1516:	if ( skin ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1166
line 1517
;1517:		*skin++ = '\0';
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
line 1518
;1518:	}
ADDRGP4 $1167
JUMPV
LABELV $1166
line 1519
;1519:	else {
line 1520
;1520:		skin = "default";
ADDRLP4 0
ADDRGP4 $1168
ASGNP4
line 1521
;1521:	}
LABELV $1167
line 1523
;1522:
;1523:	Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_%s.tga", model, skin );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1169
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1525
;1524:
;1525:	if( !trap_R_RegisterShaderNoMip( iconName ) && Q_stricmp( skin, "default" ) != 0 ) {
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
NEI4 $1170
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1168
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $1170
line 1526
;1526:		Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_default.tga", model );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1172
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1527
;1527:	}
LABELV $1170
line 1528
;1528:}
LABELV $1165
endproc ServerPlayerIcon 80 20
proc UI_BotSelectMenu_UpdateGrid 36 12
line 1536
;1529:
;1530:
;1531:/*
;1532:=================
;1533:UI_BotSelectMenu_UpdateGrid
;1534:=================
;1535:*/
;1536:static void UI_BotSelectMenu_UpdateGrid( void ) {
line 1541
;1537:	const char	*info;
;1538:	int			i;
;1539:    int			j;
;1540:
;1541:	j = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRLP4 4
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1542
;1542:	for( i = 0; i < (PLAYERGRID_ROWS * PLAYERGRID_COLS); i++, j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1175
line 1543
;1543:		if( j < botSelectInfo.numBots ) { 
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
GEI4 $1179
line 1544
;1544:			info = UI_GetBotInfoByNumber( botSelectInfo.sortedBotNums[j] );
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+4784
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 1545
;1545:			ServerPlayerIcon( Info_ValueForKey( info, "model" ), botSelectInfo.boticons[i], MAX_QPATH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $1183
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+8880
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 ServerPlayerIcon
CALLV
pop
line 1546
;1546:			Q_strncpyz( botSelectInfo.botnames[i], Info_ValueForKey( info, "name" ), 16 );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $594
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+9904
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
line 1547
;1547:			Q_CleanStr( botSelectInfo.botnames[i] );
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+9904
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1548
;1548: 			botSelectInfo.pics[i].generic.name = botSelectInfo.boticons[i];
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+8880
ADDP4
ASGNP4
line 1549
;1549:			if( BotAlreadySelected( botSelectInfo.botnames[i] ) ) {
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+9904
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 BotAlreadySelected
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $1190
line 1550
;1550:				botSelectInfo.picnames[i].color = color_red;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+68
ADDP4
ADDRGP4 color_red
ASGNP4
line 1551
;1551:			}
ADDRGP4 $1191
JUMPV
LABELV $1190
line 1552
;1552:			else {
line 1553
;1553:				botSelectInfo.picnames[i].color = color_orange;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1554
;1554:			}
LABELV $1191
line 1555
;1555:			botSelectInfo.picbuttons[i].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 32
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 1556
;1556:		}
ADDRGP4 $1180
JUMPV
LABELV $1179
line 1557
;1557:		else {
line 1559
;1558:			// dead slot
;1559: 			botSelectInfo.pics[i].generic.name         = NULL;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+4
ADDP4
CNSTP4 0
ASGNP4
line 1560
;1560:			botSelectInfo.picbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1561
;1561:			botSelectInfo.botnames[i][0] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+9904
ADDP4
CNSTI1 0
ASGNI1
line 1562
;1562:		}
LABELV $1180
line 1564
;1563:
;1564: 		botSelectInfo.pics[i].generic.flags       &= ~QMF_HIGHLIGHT;
ADDRLP4 12
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 1565
;1565: 		botSelectInfo.pics[i].shader               = 0;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+68
ADDP4
CNSTI4 0
ASGNI4
line 1566
;1566: 		botSelectInfo.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 16
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 1567
;1567:	}
LABELV $1176
line 1542
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1175
line 1570
;1568:
;1569:	// set selected model
;1570:	i = botSelectInfo.selectedmodel % MAX_MODELSPERPAGE;
ADDRLP4 0
ADDRGP4 botSelectInfo+4780
INDIRI4
CNSTI4 16
MODI4
ASGNI4
line 1571
;1571:	botSelectInfo.pics[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 16
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 1572
;1572:	botSelectInfo.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 20
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 1574
;1573:
;1574:	if( botSelectInfo.numpages > 1 ) {
ADDRGP4 botSelectInfo+4776
INDIRI4
CNSTI4 1
LEI4 $1215
line 1575
;1575:		if( botSelectInfo.modelpage > 0 ) {
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 0
LEI4 $1218
line 1576
;1576:			botSelectInfo.left.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4416+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 1577
;1577:		}
ADDRGP4 $1219
JUMPV
LABELV $1218
line 1578
;1578:		else {
line 1579
;1579:			botSelectInfo.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4416+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1580
;1580:		}
LABELV $1219
line 1582
;1581:
;1582:		if( botSelectInfo.modelpage < (botSelectInfo.numpages - 1) ) {
ADDRGP4 botSelectInfo+4772
INDIRI4
ADDRGP4 botSelectInfo+4776
INDIRI4
CNSTI4 1
SUBI4
GEI4 $1225
line 1583
;1583:			botSelectInfo.right.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4504+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 4294950911
BANDU4
ASGNU4
line 1584
;1584:		}
ADDRGP4 $1216
JUMPV
LABELV $1225
line 1585
;1585:		else {
line 1586
;1586:			botSelectInfo.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4504+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1587
;1587:		}
line 1588
;1588:	}
ADDRGP4 $1216
JUMPV
LABELV $1215
line 1589
;1589:	else {
line 1591
;1590:		// hide left/right markers
;1591:		botSelectInfo.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 24
ADDRGP4 botSelectInfo+4416+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1592
;1592:		botSelectInfo.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 28
ADDRGP4 botSelectInfo+4504+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 1593
;1593:	}
LABELV $1216
line 1594
;1594:}
LABELV $1173
endproc UI_BotSelectMenu_UpdateGrid 36 12
proc UI_BotSelectMenu_Default 28 8
line 1602
;1595:
;1596:
;1597:/*
;1598:=================
;1599:UI_BotSelectMenu_Default
;1600:=================
;1601:*/
;1602:static void UI_BotSelectMenu_Default( char *bot ) {
line 1608
;1603:	const char	*botInfo;
;1604:	const char	*test;
;1605:	int			n;
;1606:	int			i;
;1607:
;1608:	for( n = 0; n < botSelectInfo.numBots; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1241
JUMPV
LABELV $1238
line 1609
;1609:		botInfo = UI_GetBotInfoByNumber( n );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 1610
;1610:		test = Info_ValueForKey( botInfo, "name" );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $594
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 1611
;1611:		if( Q_stricmp( bot, test ) == 0 ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $1243
line 1612
;1612:			break;
ADDRGP4 $1240
JUMPV
LABELV $1243
line 1614
;1613:		}
;1614:	}
LABELV $1239
line 1608
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1241
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
LTI4 $1238
LABELV $1240
line 1615
;1615:	if( n == botSelectInfo.numBots ) {
ADDRLP4 0
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
NEI4 $1245
line 1616
;1616:		botSelectInfo.selectedmodel = 0;
ADDRGP4 botSelectInfo+4780
CNSTI4 0
ASGNI4
line 1617
;1617:		return;
ADDRGP4 $1237
JUMPV
LABELV $1245
line 1620
;1618:	}
;1619:
;1620:	for( i = 0; i < botSelectInfo.numBots; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1252
JUMPV
LABELV $1249
line 1621
;1621:		if( botSelectInfo.sortedBotNums[i] == n ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botSelectInfo+4784
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1254
line 1622
;1622:			break;
ADDRGP4 $1251
JUMPV
LABELV $1254
line 1624
;1623:		}
;1624:	}
LABELV $1250
line 1620
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1252
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
LTI4 $1249
LABELV $1251
line 1625
;1625:	if( i == botSelectInfo.numBots ) {
ADDRLP4 4
INDIRI4
ADDRGP4 botSelectInfo+4768
INDIRI4
NEI4 $1257
line 1626
;1626:		botSelectInfo.selectedmodel = 0;
ADDRGP4 botSelectInfo+4780
CNSTI4 0
ASGNI4
line 1627
;1627:		return;
ADDRGP4 $1237
JUMPV
LABELV $1257
line 1630
;1628:	}
;1629:
;1630:	botSelectInfo.selectedmodel = i;
ADDRGP4 botSelectInfo+4780
ADDRLP4 4
INDIRI4
ASGNI4
line 1631
;1631:}
LABELV $1237
endproc UI_BotSelectMenu_Default 28 8
proc UI_BotSelectMenu_LeftEvent 4 0
line 1639
;1632:
;1633:
;1634:/*
;1635:=================
;1636:UI_BotSelectMenu_LeftEvent
;1637:=================
;1638:*/
;1639:static void UI_BotSelectMenu_LeftEvent( void* ptr, int event ) {
line 1640
;1640:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1263
line 1641
;1641:		return;
ADDRGP4 $1262
JUMPV
LABELV $1263
line 1643
;1642:	}
;1643:	if( botSelectInfo.modelpage > 0 ) {
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 0
LEI4 $1265
line 1644
;1644:		botSelectInfo.modelpage--;
ADDRLP4 0
ADDRGP4 botSelectInfo+4772
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1645
;1645:		botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4780
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1646
;1646:		UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 1647
;1647:	}
LABELV $1265
line 1648
;1648:}
LABELV $1262
endproc UI_BotSelectMenu_LeftEvent 4 0
proc UI_BotSelectMenu_RightEvent 4 0
line 1656
;1649:
;1650:
;1651:/*
;1652:=================
;1653:UI_BotSelectMenu_RightEvent
;1654:=================
;1655:*/
;1656:static void UI_BotSelectMenu_RightEvent( void* ptr, int event ) {
line 1657
;1657:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1272
line 1658
;1658:		return;
ADDRGP4 $1271
JUMPV
LABELV $1272
line 1660
;1659:	}
;1660:	if( botSelectInfo.modelpage < botSelectInfo.numpages - 1 ) {
ADDRGP4 botSelectInfo+4772
INDIRI4
ADDRGP4 botSelectInfo+4776
INDIRI4
CNSTI4 1
SUBI4
GEI4 $1274
line 1661
;1661:		botSelectInfo.modelpage++;
ADDRLP4 0
ADDRGP4 botSelectInfo+4772
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1662
;1662:		botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4780
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 1663
;1663:		UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 1664
;1664:	}
LABELV $1274
line 1665
;1665:}
LABELV $1271
endproc UI_BotSelectMenu_RightEvent 4 0
proc UI_BotSelectMenu_BotEvent 12 0
line 1673
;1666:
;1667:
;1668:/*
;1669:=================
;1670:UI_BotSelectMenu_BotEvent
;1671:=================
;1672:*/
;1673:static void UI_BotSelectMenu_BotEvent( void* ptr, int event ) {
line 1676
;1674:	int		i;
;1675:
;1676:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1282
line 1677
;1677:		return;
ADDRGP4 $1281
JUMPV
LABELV $1282
line 1680
;1678:	}
;1679:
;1680:	for( i = 0; i < (PLAYERGRID_ROWS * PLAYERGRID_COLS); i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1284
line 1681
;1681: 		botSelectInfo.pics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 4294967231
BANDU4
ASGNU4
line 1682
;1682: 		botSelectInfo.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 1683
;1683:	}
LABELV $1285
line 1680
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1284
line 1686
;1684:
;1685:	// set selected
;1686:	i = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1687
;1687:	botSelectInfo.pics[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 4
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 1688
;1688:	botSelectInfo.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 8
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 4294967039
BANDU4
ASGNU4
line 1689
;1689:	botSelectInfo.selectedmodel = botSelectInfo.modelpage * MAX_MODELSPERPAGE + i;
ADDRGP4 botSelectInfo+4780
ADDRGP4 botSelectInfo+4772
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 1690
;1690:}
LABELV $1281
endproc UI_BotSelectMenu_BotEvent 12 0
proc UI_BotSelectMenu_BackEvent 0 0
line 1698
;1691:
;1692:
;1693:/*
;1694:=================
;1695:UI_BotSelectMenu_BackEvent
;1696:=================
;1697:*/
;1698:static void UI_BotSelectMenu_BackEvent( void* ptr, int event ) {
line 1699
;1699:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1299
line 1700
;1700:		return;
ADDRGP4 $1298
JUMPV
LABELV $1299
line 1702
;1701:	}
;1702:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1703
;1703:}
LABELV $1298
endproc UI_BotSelectMenu_BackEvent 0 0
proc UI_BotSelectMenu_SelectEvent 4 12
line 1711
;1704:
;1705:
;1706:/*
;1707:=================
;1708:UI_BotSelectMenu_SelectEvent
;1709:=================
;1710:*/
;1711:static void UI_BotSelectMenu_SelectEvent( void* ptr, int event ) {
line 1712
;1712:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $1302
line 1713
;1713:		return;
ADDRGP4 $1301
JUMPV
LABELV $1302
line 1715
;1714:	}
;1715:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1717
;1716:
;1717:	s_serveroptions.newBot = qtrue;
ADDRGP4 s_serveroptions+5824
CNSTI4 1
ASGNI4
line 1718
;1718:	Q_strncpyz( s_serveroptions.newBotName, botSelectInfo.botnames[botSelectInfo.selectedmodel % MAX_MODELSPERPAGE], 16 );
ADDRGP4 s_serveroptions+5832
ARGP4
ADDRLP4 0
CNSTI4 16
ASGNI4
ADDRGP4 botSelectInfo+4780
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+9904
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1719
;1719:}
LABELV $1301
endproc UI_BotSelectMenu_SelectEvent 4 12
export UI_BotSelectMenu_Cache
proc UI_BotSelectMenu_Cache 0 4
line 1727
;1720:
;1721:
;1722:/*
;1723:=================
;1724:UI_BotSelectMenu_Cache
;1725:=================
;1726:*/
;1727:void UI_BotSelectMenu_Cache( void ) {
line 1728
;1728:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK0 );
ADDRGP4 $372
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1729
;1729:	trap_R_RegisterShaderNoMip( BOTSELECT_BACK1 );
ADDRGP4 $389
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1730
;1730:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT0 );
ADDRGP4 $1309
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1731
;1731:	trap_R_RegisterShaderNoMip( BOTSELECT_ACCEPT1 );
ADDRGP4 $1310
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1732
;1732:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECT );
ADDRGP4 $1311
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1733
;1733:	trap_R_RegisterShaderNoMip( BOTSELECT_SELECTED );
ADDRGP4 $1312
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1734
;1734:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWS );
ADDRGP4 $309
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1735
;1735:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSL );
ADDRGP4 $337
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1736
;1736:	trap_R_RegisterShaderNoMip( BOTSELECT_ARROWSR );
ADDRGP4 $355
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1737
;1737:}
LABELV $1308
endproc UI_BotSelectMenu_Cache 0 4
proc UI_BotSelectMenu_Init 36 12
line 1740
;1738:
;1739:
;1740:static void UI_BotSelectMenu_Init( char *bot ) {
line 1744
;1741:	int		i, j, k;
;1742:	int		x, y;
;1743:
;1744:	memset( &botSelectInfo, 0 ,sizeof(botSelectInfo) );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 10160
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1745
;1745:	botSelectInfo.menu.wrapAround = qtrue;
ADDRGP4 botSelectInfo+276
CNSTI4 1
ASGNI4
line 1746
;1746:	botSelectInfo.menu.fullscreen = qtrue;
ADDRGP4 botSelectInfo+280
CNSTI4 1
ASGNI4
line 1748
;1747:
;1748:	UI_BotSelectMenu_Cache();
ADDRGP4 UI_BotSelectMenu_Cache
CALLV
pop
line 1750
;1749:
;1750:	botSelectInfo.banner.generic.type	= MTYPE_BTEXT;
ADDRGP4 botSelectInfo+288
CNSTI4 10
ASGNI4
line 1751
;1751:	botSelectInfo.banner.generic.x		= 320;
ADDRGP4 botSelectInfo+288+12
CNSTI4 320
ASGNI4
line 1752
;1752:	botSelectInfo.banner.generic.y		= 16;
ADDRGP4 botSelectInfo+288+16
CNSTI4 16
ASGNI4
line 1753
;1753:	botSelectInfo.banner.string			= "SELECT BOT";
ADDRGP4 botSelectInfo+288+60
ADDRGP4 $1323
ASGNP4
line 1754
;1754:	botSelectInfo.banner.color			= color_white;
ADDRGP4 botSelectInfo+288+68
ADDRGP4 color_white
ASGNP4
line 1755
;1755:	botSelectInfo.banner.style			= UI_CENTER;
ADDRGP4 botSelectInfo+288+64
CNSTI4 1
ASGNI4
line 1757
;1756:
;1757:	y =	80;
ADDRLP4 8
CNSTI4 80
ASGNI4
line 1758
;1758:	for( i = 0, k = 0; i < PLAYERGRID_ROWS; i++) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $1331
JUMPV
LABELV $1328
line 1759
;1759:		x =	180;
ADDRLP4 4
CNSTI4 180
ASGNI4
line 1760
;1760:		for( j = 0; j < PLAYERGRID_COLS; j++, k++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $1332
line 1761
;1761:			botSelectInfo.pics[k].generic.type				= MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360
ADDP4
CNSTI4 6
ASGNI4
line 1762
;1762:			botSelectInfo.pics[k].generic.flags				= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+44
ADDP4
CNSTU4 16388
ASGNU4
line 1763
;1763:			botSelectInfo.pics[k].generic.x					= x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1764
;1764:			botSelectInfo.pics[k].generic.y					= y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1765
;1765: 			botSelectInfo.pics[k].generic.name				= botSelectInfo.boticons[k];
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 botSelectInfo+8880
ADDP4
ASGNP4
line 1766
;1766:			botSelectInfo.pics[k].width						= 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+76
ADDP4
CNSTI4 64
ASGNI4
line 1767
;1767:			botSelectInfo.pics[k].height					= 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+80
ADDP4
CNSTI4 64
ASGNI4
line 1768
;1768:			botSelectInfo.pics[k].focuspic					= BOTSELECT_SELECTED;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+60
ADDP4
ADDRGP4 $1312
ASGNP4
line 1769
;1769:			botSelectInfo.pics[k].focuscolor				= colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 1771
;1770:
;1771:			botSelectInfo.picbuttons[k].generic.type		= MTYPE_BITMAP;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768
ADDP4
CNSTI4 6
ASGNI4
line 1772
;1772:			botSelectInfo.picbuttons[k].generic.flags		= QMF_LEFT_JUSTIFY|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+44
ADDP4
CNSTU4 33028
ASGNU4
line 1773
;1773:			botSelectInfo.picbuttons[k].generic.callback	= UI_BotSelectMenu_BotEvent;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+48
ADDP4
ADDRGP4 UI_BotSelectMenu_BotEvent
ASGNP4
line 1774
;1774:			botSelectInfo.picbuttons[k].generic.id			= k;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1775
;1775:			botSelectInfo.picbuttons[k].generic.x			= x - 16;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 1776
;1776:			botSelectInfo.picbuttons[k].generic.y			= y - 16;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 1777
;1777:			botSelectInfo.picbuttons[k].generic.left		= x;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1778
;1778:			botSelectInfo.picbuttons[k].generic.top			= y;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1779
;1779:			botSelectInfo.picbuttons[k].generic.right		= x + 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1780
;1780:			botSelectInfo.picbuttons[k].generic.bottom		= y + 64;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1781
;1781:			botSelectInfo.picbuttons[k].width				= 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+76
ADDP4
CNSTI4 128
ASGNI4
line 1782
;1782:			botSelectInfo.picbuttons[k].height				= 128;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+80
ADDP4
CNSTI4 128
ASGNI4
line 1783
;1783:			botSelectInfo.picbuttons[k].focuspic			= BOTSELECT_SELECT;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+60
ADDP4
ADDRGP4 $1311
ASGNP4
line 1784
;1784:			botSelectInfo.picbuttons[k].focuscolor			= colorRed;
CNSTI4 88
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768+84
ADDP4
ADDRGP4 colorRed
ASGNP4
line 1786
;1785:
;1786:			botSelectInfo.picnames[k].generic.type			= MTYPE_TEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176
ADDP4
CNSTI4 7
ASGNI4
line 1787
;1787:			botSelectInfo.picnames[k].generic.flags			= QMF_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+44
ADDP4
CNSTU4 2
ASGNU4
line 1788
;1788:			botSelectInfo.picnames[k].generic.x				= x + 32;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 1789
;1789:			botSelectInfo.picnames[k].generic.y				= y + 64;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 1790
;1790:			botSelectInfo.picnames[k].string				= botSelectInfo.botnames[k];
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+60
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 botSelectInfo+9904
ADDP4
ASGNP4
line 1791
;1791:			botSelectInfo.picnames[k].color					= color_orange;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+68
ADDP4
ADDRGP4 color_orange
ASGNP4
line 1792
;1792:			botSelectInfo.picnames[k].style					= UI_CENTER|UI_SMALLFONT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176+64
ADDP4
CNSTI4 17
ASGNI4
line 1794
;1793:
;1794:			x += (64 + 6);
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 1795
;1795:		}
LABELV $1333
line 1760
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LTI4 $1332
line 1796
;1796:		y += (64 + SMALLCHAR_HEIGHT + 6);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 86
ADDI4
ASGNI4
line 1797
;1797:	}
LABELV $1329
line 1758
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1331
ADDRLP4 16
INDIRI4
CNSTI4 4
LTI4 $1328
line 1799
;1798:
;1799:	botSelectInfo.arrows.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4328
CNSTI4 6
ASGNI4
line 1800
;1800:	botSelectInfo.arrows.generic.name		= BOTSELECT_ARROWS;
ADDRGP4 botSelectInfo+4328+4
ADDRGP4 $309
ASGNP4
line 1801
;1801:	botSelectInfo.arrows.generic.flags		= QMF_INACTIVE;
ADDRGP4 botSelectInfo+4328+44
CNSTU4 16384
ASGNU4
line 1802
;1802:	botSelectInfo.arrows.generic.x			= 260;
ADDRGP4 botSelectInfo+4328+12
CNSTI4 260
ASGNI4
line 1803
;1803:	botSelectInfo.arrows.generic.y			= 440;
ADDRGP4 botSelectInfo+4328+16
CNSTI4 440
ASGNI4
line 1804
;1804:	botSelectInfo.arrows.width				= 128;
ADDRGP4 botSelectInfo+4328+76
CNSTI4 128
ASGNI4
line 1805
;1805:	botSelectInfo.arrows.height				= 32;
ADDRGP4 botSelectInfo+4328+80
CNSTI4 32
ASGNI4
line 1807
;1806:
;1807:	botSelectInfo.left.generic.type			= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4416
CNSTI4 6
ASGNI4
line 1808
;1808:	botSelectInfo.left.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4416+44
CNSTU4 260
ASGNU4
line 1809
;1809:	botSelectInfo.left.generic.callback		= UI_BotSelectMenu_LeftEvent;
ADDRGP4 botSelectInfo+4416+48
ADDRGP4 UI_BotSelectMenu_LeftEvent
ASGNP4
line 1810
;1810:	botSelectInfo.left.generic.x			= 260;
ADDRGP4 botSelectInfo+4416+12
CNSTI4 260
ASGNI4
line 1811
;1811:	botSelectInfo.left.generic.y			= 440;
ADDRGP4 botSelectInfo+4416+16
CNSTI4 440
ASGNI4
line 1812
;1812:	botSelectInfo.left.width  				= 64;
ADDRGP4 botSelectInfo+4416+76
CNSTI4 64
ASGNI4
line 1813
;1813:	botSelectInfo.left.height  				= 32;
ADDRGP4 botSelectInfo+4416+80
CNSTI4 32
ASGNI4
line 1814
;1814:	botSelectInfo.left.focuspic				= BOTSELECT_ARROWSL;
ADDRGP4 botSelectInfo+4416+60
ADDRGP4 $337
ASGNP4
line 1816
;1815:
;1816:	botSelectInfo.right.generic.type	    = MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4504
CNSTI4 6
ASGNI4
line 1817
;1817:	botSelectInfo.right.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4504+44
CNSTU4 260
ASGNU4
line 1818
;1818:	botSelectInfo.right.generic.callback	= UI_BotSelectMenu_RightEvent;
ADDRGP4 botSelectInfo+4504+48
ADDRGP4 UI_BotSelectMenu_RightEvent
ASGNP4
line 1819
;1819:	botSelectInfo.right.generic.x			= 321;
ADDRGP4 botSelectInfo+4504+12
CNSTI4 321
ASGNI4
line 1820
;1820:	botSelectInfo.right.generic.y			= 440;
ADDRGP4 botSelectInfo+4504+16
CNSTI4 440
ASGNI4
line 1821
;1821:	botSelectInfo.right.width  				= 64;
ADDRGP4 botSelectInfo+4504+76
CNSTI4 64
ASGNI4
line 1822
;1822:	botSelectInfo.right.height  		    = 32;
ADDRGP4 botSelectInfo+4504+80
CNSTI4 32
ASGNI4
line 1823
;1823:	botSelectInfo.right.focuspic			= BOTSELECT_ARROWSR;
ADDRGP4 botSelectInfo+4504+60
ADDRGP4 $355
ASGNP4
line 1825
;1824:
;1825:	botSelectInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4680
CNSTI4 6
ASGNI4
line 1826
;1826:	botSelectInfo.back.generic.name		= BOTSELECT_BACK0;
ADDRGP4 botSelectInfo+4680+4
ADDRGP4 $372
ASGNP4
line 1827
;1827:	botSelectInfo.back.generic.flags	= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4680+44
CNSTU4 260
ASGNU4
line 1828
;1828:	botSelectInfo.back.generic.callback	= UI_BotSelectMenu_BackEvent;
ADDRGP4 botSelectInfo+4680+48
ADDRGP4 UI_BotSelectMenu_BackEvent
ASGNP4
line 1829
;1829:	botSelectInfo.back.generic.x		= 0;
ADDRGP4 botSelectInfo+4680+12
CNSTI4 0
ASGNI4
line 1830
;1830:	botSelectInfo.back.generic.y		= 480-64;
ADDRGP4 botSelectInfo+4680+16
CNSTI4 416
ASGNI4
line 1831
;1831:	botSelectInfo.back.width			= 128;
ADDRGP4 botSelectInfo+4680+76
CNSTI4 128
ASGNI4
line 1832
;1832:	botSelectInfo.back.height			= 64;
ADDRGP4 botSelectInfo+4680+80
CNSTI4 64
ASGNI4
line 1833
;1833:	botSelectInfo.back.focuspic			= BOTSELECT_BACK1;
ADDRGP4 botSelectInfo+4680+60
ADDRGP4 $389
ASGNP4
line 1835
;1834:
;1835:	botSelectInfo.go.generic.type		= MTYPE_BITMAP;
ADDRGP4 botSelectInfo+4592
CNSTI4 6
ASGNI4
line 1836
;1836:	botSelectInfo.go.generic.name		= BOTSELECT_ACCEPT0;
ADDRGP4 botSelectInfo+4592+4
ADDRGP4 $1309
ASGNP4
line 1837
;1837:	botSelectInfo.go.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 botSelectInfo+4592+44
CNSTU4 272
ASGNU4
line 1838
;1838:	botSelectInfo.go.generic.callback	= UI_BotSelectMenu_SelectEvent;
ADDRGP4 botSelectInfo+4592+48
ADDRGP4 UI_BotSelectMenu_SelectEvent
ASGNP4
line 1839
;1839:	botSelectInfo.go.generic.x			= 640;
ADDRGP4 botSelectInfo+4592+12
CNSTI4 640
ASGNI4
line 1840
;1840:	botSelectInfo.go.generic.y			= 480-64;
ADDRGP4 botSelectInfo+4592+16
CNSTI4 416
ASGNI4
line 1841
;1841:	botSelectInfo.go.width				= 128;
ADDRGP4 botSelectInfo+4592+76
CNSTI4 128
ASGNI4
line 1842
;1842:	botSelectInfo.go.height				= 64;
ADDRGP4 botSelectInfo+4592+80
CNSTI4 64
ASGNI4
line 1843
;1843:	botSelectInfo.go.focuspic			= BOTSELECT_ACCEPT1;
ADDRGP4 botSelectInfo+4592+60
ADDRGP4 $1310
ASGNP4
line 1845
;1844:
;1845:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.banner );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1846
;1846:	for( i = 0; i < MAX_MODELSPERPAGE; i++ ) {
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $1473
line 1847
;1847:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.pics[i] );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 88
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 botSelectInfo+360
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1848
;1848:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.picbuttons[i] );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 88
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 botSelectInfo+1768
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1849
;1849:		Menu_AddItem( &botSelectInfo.menu,	&botSelectInfo.picnames[i] );
ADDRGP4 botSelectInfo
ARGP4
CNSTI4 72
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 botSelectInfo+3176
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1850
;1850:	}
LABELV $1474
line 1846
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 16
LTI4 $1473
line 1851
;1851:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.arrows );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4328
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1852
;1852:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.left );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1853
;1853:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.right );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1854
;1854:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.back );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1855
;1855:	Menu_AddItem( &botSelectInfo.menu, &botSelectInfo.go );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 botSelectInfo+4592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1857
;1856:
;1857:	UI_BotSelectMenu_BuildList();
ADDRGP4 UI_BotSelectMenu_BuildList
CALLV
pop
line 1858
;1858:	UI_BotSelectMenu_Default( bot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_BotSelectMenu_Default
CALLV
pop
line 1859
;1859:	botSelectInfo.modelpage = botSelectInfo.selectedmodel / MAX_MODELSPERPAGE;
ADDRGP4 botSelectInfo+4772
ADDRGP4 botSelectInfo+4780
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 1860
;1860:	UI_BotSelectMenu_UpdateGrid();
ADDRGP4 UI_BotSelectMenu_UpdateGrid
CALLV
pop
line 1861
;1861:}
LABELV $1313
endproc UI_BotSelectMenu_Init 36 12
export UI_BotSelectMenu
proc UI_BotSelectMenu 0 4
line 1869
;1862:
;1863:
;1864:/*
;1865:=================
;1866:UI_BotSelectMenu
;1867:=================
;1868:*/
;1869:void UI_BotSelectMenu( char *bot ) {
line 1870
;1870:	UI_BotSelectMenu_Init( bot );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UI_BotSelectMenu_Init
CALLV
pop
line 1871
;1871:	UI_PushMenu( &botSelectInfo.menu );
ADDRGP4 botSelectInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1872
;1872:}
LABELV $1487
endproc UI_BotSelectMenu 0 4
bss
align 4
LABELV botSelectInfo
skip 10160
align 4
LABELV s_serveroptions
skip 5848
align 4
LABELV s_startserver
skip 3060
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
LABELV $1323
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $1312
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
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
LABELV $1311
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
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
LABELV $1310
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1309
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1183
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1172
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
LABELV $1169
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
LABELV $1168
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $1109
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
LABELV $1092
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
LABELV $967
byte 1 72
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $958
byte 1 68
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 58
byte 1 0
align 1
LABELV $941
byte 1 80
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $931
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 32
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $904
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 76
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $868
byte 1 71
byte 1 65
byte 1 76
byte 1 76
byte 1 69
byte 1 82
byte 1 89
byte 1 0
align 1
LABELV $826
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
LABELV $820
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
LABELV $815
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
LABELV $795
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $769
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 0
align 1
LABELV $745
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $725
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $713
byte 1 118
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $707
byte 1 109
byte 1 97
byte 1 106
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $704
byte 1 103
byte 1 114
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $687
byte 1 48
byte 1 32
byte 1 61
byte 1 32
byte 1 78
byte 1 79
byte 1 32
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $631
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $626
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $594
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $565
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
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $560
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
byte 1 10
byte 1 0
align 1
LABELV $558
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
LABELV $540
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 51
byte 1 10
byte 1 0
align 1
LABELV $537
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
LABELV $533
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
LABELV $532
byte 1 115
byte 1 118
byte 1 95
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $531
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
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $530
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
LABELV $529
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
LABELV $528
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
LABELV $527
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
LABELV $526
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
LABELV $524
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
byte 1 116
byte 1 0
align 1
LABELV $523
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
LABELV $522
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 116
byte 1 102
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
LABELV $520
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
byte 1 116
byte 1 0
align 1
LABELV $519
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
LABELV $518
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
LABELV $516
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
LABELV $515
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
LABELV $513
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
LABELV $512
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
LABELV $458
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
LABELV $457
byte 1 76
byte 1 65
byte 1 78
byte 1 0
align 1
LABELV $456
byte 1 78
byte 1 111
byte 1 0
align 1
LABELV $438
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $410
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
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 49
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
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 48
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
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $372
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
LABELV $355
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $337
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $309
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $305
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
LABELV $277
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
LABELV $274
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
LABELV $242
byte 1 71
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $234
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
LABELV $201
byte 1 103
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
LABELV $173
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $168
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $133
byte 1 78
byte 1 79
byte 1 32
byte 1 77
byte 1 65
byte 1 80
byte 1 83
byte 1 32
byte 1 70
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $100
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
LABELV $89
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $86
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $83
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $80
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $77
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $68
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
