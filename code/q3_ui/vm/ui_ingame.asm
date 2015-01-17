code
proc InGame_RestartAction 0 8
file "../ui_ingame.c"
line 55
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:INGAME MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15:#define INGAME_FRAME					"menu/art/addbotframe"
;16://#define INGAME_FRAME					"menu/art/cut_frame"
;17:#define INGAME_MENU_VERTICAL_SPACING	28
;18:
;19://#define ID_TEAM					10
;20://#define ID_ADDBOTS				11
;21://#define ID_REMOVEBOTS			12
;22:#define ID_SETUP				13
;23://#define ID_SERVERINFO			14
;24:#define ID_LEAVEGALLERY			15
;25:#define ID_RESTARTGALLERY				16
;26:#define ID_QUIT					17
;27:#define ID_RESUME				18
;28://#define ID_TEAMORDERS			19
;29:
;30:
;31:typedef struct {
;32:	menuframework_s	menu;
;33:
;34:	menubitmap_s	frame;
;35://	menutext_s		team;
;36:	menutext_s		setup;
;37://	menutext_s		server;
;38:	menutext_s		leavegallery;
;39:	menutext_s		restartgallery;
;40://	menutext_s		addbots;
;41://	menutext_s		removebots;
;42://	menutext_s		teamorders;
;43:	menutext_s		quit;
;44:	menutext_s		resume;
;45:} ingamemenu_t;
;46:
;47:static ingamemenu_t	s_ingame;
;48:
;49:
;50:/*
;51:=================
;52:InGame_RestartAction
;53:=================
;54:*/
;55:static void InGame_RestartAction( qboolean result ) {
line 56
;56:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $69
line 57
;57:		return;
ADDRGP4 $68
JUMPV
LABELV $69
line 60
;58:	}
;59:
;60:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 61
;61:	trap_Cmd_ExecuteText( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $71
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 62
;62:}
LABELV $68
endproc InGame_RestartAction 0 8
proc InGame_QuitAction 0 0
line 70
;63:
;64:
;65:/*
;66:=================
;67:InGame_QuitAction
;68:=================
;69:*/
;70:static void InGame_QuitAction( qboolean result ) {
line 71
;71:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $73
line 72
;72:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 74
;73:	}
;74:	UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 75
;75:	UI_CreditMenu();
ADDRGP4 UI_CreditMenu
CALLV
pop
line 76
;76:}
LABELV $72
endproc InGame_QuitAction 0 0
export InGame_Event
proc InGame_Event 8 12
line 84
;77:
;78:
;79:/*
;80:=================
;81:InGame_Event
;82:=================
;83:*/
;84:void InGame_Event( void *ptr, int notification ) {
line 85
;85:	if( notification != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $76
line 86
;86:		return;
ADDRGP4 $75
JUMPV
LABELV $76
line 89
;87:	}
;88:
;89:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 13
LTI4 $78
ADDRLP4 0
INDIRI4
CNSTI4 18
GTI4 $78
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $88-52
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $88
address $81
address $78
address $82
address $84
address $86
address $87
code
LABELV $81
line 95
;90://	case ID_TEAM:
;91://		UI_TeamMainMenu();
;92://		break;
;93:
;94:	case ID_SETUP:
;95:		UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 96
;96:		break;
ADDRGP4 $79
JUMPV
LABELV $82
line 99
;97:
;98:	case ID_LEAVEGALLERY:
;99:		trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
CNSTI4 2
ARGI4
ADDRGP4 $83
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 100
;100:		break;
ADDRGP4 $79
JUMPV
LABELV $84
line 103
;101:
;102:	case ID_RESTARTGALLERY:
;103:		UI_ConfirmMenu( "RESTART GALLERY?", (voidfunc_f)NULL, InGame_RestartAction );
ADDRGP4 $85
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_RestartAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 104
;104:		break;
ADDRGP4 $79
JUMPV
LABELV $86
line 107
;105:
;106:	case ID_QUIT:
;107:        UI_CreditMenu();
ADDRGP4 UI_CreditMenu
CALLV
pop
line 108
;108:		break;
ADDRGP4 $79
JUMPV
LABELV $87
line 127
;109:
;110://	case ID_SERVERINFO:
;111://		UI_ServerInfoMenu();
;112://		break;
;113:
;114://	case ID_ADDBOTS:
;115://		UI_AddBotsMenu();
;116://		break;
;117:
;118://	case ID_REMOVEBOTS:
;119://		UI_RemoveBotsMenu();
;120://		break;
;121:
;122://	case ID_TEAMORDERS:
;123://		UI_TeamOrdersMenu();
;124://		break;
;125:
;126:	case ID_RESUME:
;127:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 128
;128:		break;
LABELV $78
LABELV $79
line 130
;129:	}
;130:}
LABELV $75
endproc InGame_Event 8 12
export InGame_MenuInit
proc InGame_MenuInit 4124 12
line 138
;131:
;132:
;133:/*
;134:=================
;135:InGame_MenuInit
;136:=================
;137:*/
;138:void InGame_MenuInit( void ) {
line 144
;139:	int		y;
;140:	uiClientState_t	cs;
;141:	char	info[MAX_INFO_STRING];
;142:	int		team;
;143:
;144:	memset( &s_ingame, 0 ,sizeof(ingamemenu_t) );
ADDRGP4 s_ingame
ARGP4
CNSTI4 0
ARGI4
CNSTI4 736
ARGI4
ADDRGP4 memset
CALLP4
pop
line 146
;145:
;146:	InGame_Cache();
ADDRGP4 InGame_Cache
CALLV
pop
line 148
;147:
;148:	s_ingame.menu.wrapAround = qtrue;
ADDRGP4 s_ingame+276
CNSTI4 1
ASGNI4
line 149
;149:	s_ingame.menu.fullscreen = qfalse;
ADDRGP4 s_ingame+280
CNSTI4 0
ASGNI4
line 151
;150:
;151:	s_ingame.frame.generic.type			= MTYPE_BITMAP;
ADDRGP4 s_ingame+288
CNSTI4 6
ASGNI4
line 152
;152:	s_ingame.frame.generic.flags		= QMF_INACTIVE;
ADDRGP4 s_ingame+288+44
CNSTU4 16384
ASGNU4
line 153
;153:	s_ingame.frame.generic.name			= INGAME_FRAME;
ADDRGP4 s_ingame+288+4
ADDRGP4 $98
ASGNP4
line 154
;154:	s_ingame.frame.generic.x			= 320-233;//142;
ADDRGP4 s_ingame+288+12
CNSTI4 87
ASGNI4
line 155
;155:	s_ingame.frame.generic.y			= 240-166;//118;
ADDRGP4 s_ingame+288+16
CNSTI4 74
ASGNI4
line 156
;156:	s_ingame.frame.width				= 466;//359;
ADDRGP4 s_ingame+288+76
CNSTI4 466
ASGNI4
line 157
;157:	s_ingame.frame.height				= 332;//256;
ADDRGP4 s_ingame+288+80
CNSTI4 332
ASGNI4
line 160
;158:
;159:	//y = 96;
;160:	y = 88;
ADDRLP4 0
CNSTI4 88
ASGNI4
line 199
;161://	s_ingame.team.generic.type			= MTYPE_PTEXT;
;162://	s_ingame.team.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;163://	s_ingame.team.generic.x				= 320;
;164://	s_ingame.team.generic.y				= y;
;165://	s_ingame.team.generic.id			= ID_TEAM;
;166://	s_ingame.team.generic.callback		= InGame_Event; 
;167://	s_ingame.team.string				= "START";
;168://	s_ingame.team.color					= color_yellow;
;169://	s_ingame.team.style					= UI_CENTER|UI_SMALLFONT;
;170:
;171://	y += INGAME_MENU_VERTICAL_SPACING;
;172://	s_ingame.addbots.generic.type		= MTYPE_PTEXT;
;173://	s_ingame.addbots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;174://	s_ingame.addbots.generic.x			= 320;
;175://	s_ingame.addbots.generic.y			= y;
;176://	s_ingame.addbots.generic.id			= ID_ADDBOTS;
;177://	s_ingame.addbots.generic.callback	= InGame_Event; 
;178://	s_ingame.addbots.string				= "ADD BOTS";
;179://	s_ingame.addbots.color				= color_yellow;
;180://	s_ingame.addbots.style				= UI_CENTER|UI_SMALLFONT;
;181://	if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
;182://		s_ingame.addbots.generic.flags |= QMF_GRAYED;
;183://	}
;184:
;185://	y += INGAME_MENU_VERTICAL_SPACING;
;186://	s_ingame.removebots.generic.type		= MTYPE_PTEXT;
;187://	s_ingame.removebots.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;188://	s_ingame.removebots.generic.x			= 320;
;189://	s_ingame.removebots.generic.y			= y;
;190://	s_ingame.removebots.generic.id			= ID_REMOVEBOTS;
;191://	s_ingame.removebots.generic.callback	= InGame_Event; 
;192://	s_ingame.removebots.string				= "REMOVE BOTS";
;193://	s_ingame.removebots.color				= color_yellow;
;194://	s_ingame.removebots.style				= UI_CENTER|UI_SMALLFONT;
;195://	if( !trap_Cvar_VariableValue( "sv_running" ) || !trap_Cvar_VariableValue( "bot_enable" ) || (trap_Cvar_VariableValue( "g_gametype" ) == GT_SINGLE_PLAYER)) {
;196://		s_ingame.removebots.generic.flags |= QMF_GRAYED;
;197://	}
;198:
;199:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 221
;200://	s_ingame.teamorders.generic.type		= MTYPE_PTEXT;
;201://	s_ingame.teamorders.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;202://	s_ingame.teamorders.generic.x			= 320;
;203://	s_ingame.teamorders.generic.y			= y;
;204://	s_ingame.teamorders.generic.id			= ID_TEAMORDERS;
;205://	s_ingame.teamorders.generic.callback	= InGame_Event; 
;206://	s_ingame.teamorders.string				= "TEAM ORDERS";
;207://	s_ingame.teamorders.color				= color_yellow;
;208://	s_ingame.teamorders.style				= UI_CENTER|UI_SMALLFONT;
;209://	if( !(trap_Cvar_VariableValue( "g_gametype" ) >= GT_TEAM) ) {
;210://		s_ingame.teamorders.generic.flags |= QMF_GRAYED;
;211://	}
;212://	else {
;213://		trap_GetClientState( &cs );
;214://		trap_GetConfigString( CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING );
;215://		team = atoi( Info_ValueForKey( info, "t" ) );
;216://		if( team == TEAM_SPECTATOR ) {
;217://			s_ingame.teamorders.generic.flags |= QMF_GRAYED;
;218://		}
;219://	}
;220:
;221:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 222
;222:	s_ingame.setup.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+376
CNSTI4 9
ASGNI4
line 223
;223:	s_ingame.setup.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+376+44
CNSTU4 264
ASGNU4
line 224
;224:	s_ingame.setup.generic.x			= 320;
ADDRGP4 s_ingame+376+12
CNSTI4 320
ASGNI4
line 225
;225:	s_ingame.setup.generic.y			= y;
ADDRGP4 s_ingame+376+16
ADDRLP4 0
INDIRI4
ASGNI4
line 226
;226:	s_ingame.setup.generic.id			= ID_SETUP;
ADDRGP4 s_ingame+376+8
CNSTI4 13
ASGNI4
line 227
;227:	s_ingame.setup.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+376+48
ADDRGP4 InGame_Event
ASGNP4
line 228
;228:	s_ingame.setup.string				= "SETUP";
ADDRGP4 s_ingame+376+60
ADDRGP4 $120
ASGNP4
line 229
;229:	s_ingame.setup.color				= color_yellow;
ADDRGP4 s_ingame+376+68
ADDRGP4 color_yellow
ASGNP4
line 230
;230:	s_ingame.setup.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+376+64
CNSTI4 17
ASGNI4
line 243
;231:
;232://	y += INGAME_MENU_VERTICAL_SPACING;
;233://	s_ingame.server.generic.type		= MTYPE_PTEXT;
;234://	s_ingame.server.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;235://	s_ingame.server.generic.x			= 320;
;236://	s_ingame.server.generic.y			= y;
;237://	s_ingame.server.generic.id			= ID_SERVERINFO;
;238://	s_ingame.server.generic.callback	= InGame_Event; 
;239://	s_ingame.server.string				= "SERVER INFO";
;240://	s_ingame.server.color				= color_yellow;
;241://	s_ingame.server.style				= UI_CENTER|UI_SMALLFONT;
;242:
;243:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 244
;244:	s_ingame.restartgallery.generic.type		= MTYPE_PTEXT;
ADDRGP4 s_ingame+520
CNSTI4 9
ASGNI4
line 245
;245:	s_ingame.restartgallery.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+520+44
CNSTU4 264
ASGNU4
line 246
;246:	s_ingame.restartgallery.generic.x			= 320;
ADDRGP4 s_ingame+520+12
CNSTI4 320
ASGNI4
line 247
;247:	s_ingame.restartgallery.generic.y			= y;
ADDRGP4 s_ingame+520+16
ADDRLP4 0
INDIRI4
ASGNI4
line 248
;248:	s_ingame.restartgallery.generic.id			= ID_RESTARTGALLERY;
ADDRGP4 s_ingame+520+8
CNSTI4 16
ASGNI4
line 249
;249:	s_ingame.restartgallery.generic.callback	= InGame_Event; 
ADDRGP4 s_ingame+520+48
ADDRGP4 InGame_Event
ASGNP4
line 250
;250:	s_ingame.restartgallery.string				= "RESTART GALLERY";
ADDRGP4 s_ingame+520+60
ADDRGP4 $138
ASGNP4
line 251
;251:	s_ingame.restartgallery.color				= color_yellow;
ADDRGP4 s_ingame+520+68
ADDRGP4 color_yellow
ASGNP4
line 252
;252:	s_ingame.restartgallery.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+520+64
CNSTI4 17
ASGNI4
line 253
;253:	if( !trap_Cvar_VariableValue( "sv_running" ) ) {
ADDRGP4 $145
ARGP4
ADDRLP4 4116
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4116
INDIRF4
CNSTF4 0
NEF4 $143
line 254
;254:		s_ingame.restartgallery.generic.flags |= QMF_GRAYED;
ADDRLP4 4120
ADDRGP4 s_ingame+520+44
ASGNP4
ADDRLP4 4120
INDIRP4
ADDRLP4 4120
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 255
;255:	}
LABELV $143
line 257
;256:
;257:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 258
;258:	s_ingame.resume.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+664
CNSTI4 9
ASGNI4
line 259
;259:	s_ingame.resume.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+664+44
CNSTU4 264
ASGNU4
line 260
;260:	s_ingame.resume.generic.x				= 320;
ADDRGP4 s_ingame+664+12
CNSTI4 320
ASGNI4
line 261
;261:	s_ingame.resume.generic.y				= y;
ADDRGP4 s_ingame+664+16
ADDRLP4 0
INDIRI4
ASGNI4
line 262
;262:	s_ingame.resume.generic.id				= ID_RESUME;
ADDRGP4 s_ingame+664+8
CNSTI4 18
ASGNI4
line 263
;263:	s_ingame.resume.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+664+48
ADDRGP4 InGame_Event
ASGNP4
line 264
;264:	s_ingame.resume.string					= "RESUME";
ADDRGP4 s_ingame+664+60
ADDRGP4 $161
ASGNP4
line 265
;265:	s_ingame.resume.color					= color_yellow;
ADDRGP4 s_ingame+664+68
ADDRGP4 color_yellow
ASGNP4
line 266
;266:	s_ingame.resume.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+664+64
CNSTI4 17
ASGNI4
line 268
;267:
;268:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 269
;269:	s_ingame.leavegallery.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+448
CNSTI4 9
ASGNI4
line 270
;270:	s_ingame.leavegallery.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+448+44
CNSTU4 264
ASGNU4
line 271
;271:	s_ingame.leavegallery.generic.x			= 320;
ADDRGP4 s_ingame+448+12
CNSTI4 320
ASGNI4
line 272
;272:	s_ingame.leavegallery.generic.y			= y;
ADDRGP4 s_ingame+448+16
ADDRLP4 0
INDIRI4
ASGNI4
line 273
;273:	s_ingame.leavegallery.generic.id			= ID_LEAVEGALLERY;
ADDRGP4 s_ingame+448+8
CNSTI4 15
ASGNI4
line 274
;274:	s_ingame.leavegallery.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+448+48
ADDRGP4 InGame_Event
ASGNP4
line 275
;275:	s_ingame.leavegallery.string				= "LEAVE GALLERY";
ADDRGP4 s_ingame+448+60
ADDRGP4 $179
ASGNP4
line 276
;276:	s_ingame.leavegallery.color				= color_yellow;
ADDRGP4 s_ingame+448+68
ADDRGP4 color_yellow
ASGNP4
line 277
;277:	s_ingame.leavegallery.style				= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+448+64
CNSTI4 17
ASGNI4
line 279
;278:
;279:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 280
;280:	s_ingame.quit.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_ingame+592
CNSTI4 9
ASGNI4
line 281
;281:	s_ingame.quit.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+592+44
CNSTU4 264
ASGNU4
line 282
;282:	s_ingame.quit.generic.x				= 320;
ADDRGP4 s_ingame+592+12
CNSTI4 320
ASGNI4
line 283
;283:	s_ingame.quit.generic.y				= y;
ADDRGP4 s_ingame+592+16
ADDRLP4 0
INDIRI4
ASGNI4
line 284
;284:	s_ingame.quit.generic.id			= ID_QUIT;
ADDRGP4 s_ingame+592+8
CNSTI4 17
ASGNI4
line 285
;285:	s_ingame.quit.generic.callback		= InGame_Event; 
ADDRGP4 s_ingame+592+48
ADDRGP4 InGame_Event
ASGNP4
line 286
;286:	s_ingame.quit.string				= "EXIT";
ADDRGP4 s_ingame+592+60
ADDRGP4 $197
ASGNP4
line 287
;287:	s_ingame.quit.color					= color_yellow;
ADDRGP4 s_ingame+592+68
ADDRGP4 color_yellow
ASGNP4
line 288
;288:	s_ingame.quit.style					= UI_CENTER|UI_SMALLFONT;
ADDRGP4 s_ingame+592+64
CNSTI4 17
ASGNI4
line 290
;289:
;290:	Menu_AddItem( &s_ingame.menu, &s_ingame.frame );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 295
;291://	Menu_AddItem( &s_ingame.menu, &s_ingame.team );
;292://	Menu_AddItem( &s_ingame.menu, &s_ingame.addbots );
;293://	Menu_AddItem( &s_ingame.menu, &s_ingame.removebots );
;294://	Menu_AddItem( &s_ingame.menu, &s_ingame.teamorders );
;295:	Menu_AddItem( &s_ingame.menu, &s_ingame.setup );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+376
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 297
;296://	Menu_AddItem( &s_ingame.menu, &s_ingame.server );
;297:	Menu_AddItem( &s_ingame.menu, &s_ingame.restartgallery );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+520
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 298
;298:	Menu_AddItem( &s_ingame.menu, &s_ingame.resume );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+664
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 299
;299:	Menu_AddItem( &s_ingame.menu, &s_ingame.leavegallery );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 300
;300:	Menu_AddItem( &s_ingame.menu, &s_ingame.quit );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+592
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 301
;301:}
LABELV $90
endproc InGame_MenuInit 4124 12
export InGame_Cache
proc InGame_Cache 0 4
line 309
;302:
;303:
;304:/*
;305:=================
;306:InGame_Cache
;307:=================
;308:*/
;309:void InGame_Cache( void ) {
line 310
;310:	trap_R_RegisterShaderNoMip( INGAME_FRAME );
ADDRGP4 $98
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 311
;311:}
LABELV $208
endproc InGame_Cache 0 4
export UI_InGameMenu
proc UI_InGameMenu 0 4
line 319
;312:
;313:
;314:/*
;315:=================
;316:UI_InGameMenu
;317:=================
;318:*/
;319:void UI_InGameMenu( void ) {
line 321
;320:	// force as top level menu
;321:	uis.menusp = 0;  
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 324
;322:
;323:	// set menu cursor to a nice location
;324:	uis.cursorx = 319;
ADDRGP4 uis+8
CNSTI4 319
ASGNI4
line 325
;325:	uis.cursory = 80;
ADDRGP4 uis+12
CNSTI4 80
ASGNI4
line 327
;326:
;327:	InGame_MenuInit();
ADDRGP4 InGame_MenuInit
CALLV
pop
line 328
;328:	UI_PushMenu( &s_ingame.menu );
ADDRGP4 s_ingame
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 329
;329:}
LABELV $209
endproc UI_InGameMenu 0 4
proc DynamicMenu_SubMenuInit 8 0
line 380
;330:/*
;331:===========================
;332:
;333:INGAME DYNAMIC COMMAND MENU
;334:
;335:===========================
;336:*/
;337:
;338:#define MAX_DYNAMICDEPTH 	6
;339:#define MAX_MENUSTRING 		16
;340:
;341:#define MENUSPACE_X		4
;342:#define MENUSPACE_Y		1
;343:
;344:
;345:typedef void (*createHandler)(void);
;346:typedef void (*eventHandler)(int index);
;347:
;348:
;349:typedef struct {
;350:	char text[MAX_MENUSTRING];
;351:	int index;
;352:	int id;
;353:	createHandler createSubMenu;
;354:	eventHandler runEvent;
;355:} dynamicitem_t;
;356:
;357:
;358:typedef struct {
;359:	menuframework_s menu;
;360:
;361:	menubitmap_s	frame;
;362:	menutext_s item[MAX_MENUITEMS];
;363:	dynamicitem_t data[MAX_MENUITEMS];
;364:
;365:	int start[MAX_DYNAMICDEPTH];
;366:	int end[MAX_DYNAMICDEPTH];	// indicates to (last item + 1)
;367:	int active[MAX_DYNAMICDEPTH];
;368:
;369:	int gametype;
;370:	int depth;
;371:} dynamicmenu_t;
;372:
;373:static dynamicmenu_t s_dynamic;
;374:/*
;375:=================
;376:DynamicMenu_InitSubMenu
;377:=================
;378:*/
;379:static qboolean DynamicMenu_SubMenuInit( void)
;380:{
line 383
;381:	int pos;
;382:
;383:	if (s_dynamic.depth == MAX_DYNAMICDEPTH)
ADDRGP4 s_dynamic+7108
INDIRI4
CNSTI4 6
NEI4 $216
line 384
;384:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $215
JUMPV
LABELV $216
line 386
;385:
;386:	if (s_dynamic.depth == 0)
ADDRGP4 s_dynamic+7108
INDIRI4
CNSTI4 0
NEI4 $219
line 387
;387:		pos = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $220
JUMPV
LABELV $219
line 389
;388:	else
;389:		pos = s_dynamic.end[s_dynamic.depth - 1];
ADDRLP4 0
ADDRGP4 s_dynamic+7108
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7056-4
ADDP4
INDIRI4
ASGNI4
LABELV $220
line 391
;390:
;391:	if (pos == MAX_MENUITEMS)
ADDRLP4 0
INDIRI4
CNSTI4 64
NEI4 $225
line 392
;392:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $215
JUMPV
LABELV $225
line 394
;393:
;394:	s_dynamic.depth++;
ADDRLP4 4
ADDRGP4 s_dynamic+7108
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 395
;395:	s_dynamic.active[s_dynamic.depth - 1] = -1;
ADDRGP4 s_dynamic+7108
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7080-4
ADDP4
CNSTI4 -1
ASGNI4
line 396
;396:	s_dynamic.start[s_dynamic.depth - 1] = pos;
ADDRGP4 s_dynamic+7108
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7032-4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 397
;397:	s_dynamic.end[s_dynamic.depth - 1] = pos;
ADDRGP4 s_dynamic+7108
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7056-4
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 399
;398:
;399:	return qtrue;
CNSTI4 1
RETI4
LABELV $215
endproc DynamicMenu_SubMenuInit 8 0
proc DynamicMenu_AddItem 24 12
line 409
;400:}
;401:
;402:/*
;403:=================
;404:DynamicMenu_AddItem
;405:=================
;406:*/
;407:static qboolean DynamicMenu_AddItem( const char* string, 
;408:	int id, createHandler crh, eventHandler evh)
;409:{
line 412
;410:	int index, depth;
;411:
;412:	depth = s_dynamic.depth - 1;
ADDRLP4 4
ADDRGP4 s_dynamic+7108
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 413
;413:	index = s_dynamic.end[depth];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7056
ADDP4
INDIRI4
ASGNI4
line 415
;414:
;415:	if (index == MAX_MENUITEMS)
ADDRLP4 0
INDIRI4
CNSTI4 64
NEI4 $240
line 416
;416:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $237
JUMPV
LABELV $240
line 419
;417:
;418:	// can't have submenu and event attached to menu item	
;419:	if (crh && evh)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $242
ADDRFP4 12
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $242
line 420
;420:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $237
JUMPV
LABELV $242
line 422
;421:
;422:	if (!string || !string[0])
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $246
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $244
LABELV $246
line 423
;423:		string = "[no text]";
ADDRFP4 0
ADDRGP4 $247
ASGNP4
LABELV $244
line 425
;424:
;425:	s_dynamic.data[index].index = index;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4984+16
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 426
;426:	s_dynamic.data[index].id = id;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4984+20
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 427
;427:	s_dynamic.data[index].createSubMenu = crh;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4984+24
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 428
;428:	s_dynamic.data[index].runEvent = evh;
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4984+28
ADDP4
ADDRFP4 12
INDIRP4
ASGNP4
line 429
;429:	Q_strncpyz(s_dynamic.data[index].text, string, MAX_MENUSTRING);
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4984
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 431
;430:
;431:	s_dynamic.end[depth]++;
ADDRLP4 20
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7056
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 433
;432:
;433:	return qtrue;
CNSTI4 1
RETI4
LABELV $237
endproc DynamicMenu_AddItem 24 12
proc DynamicMenu_FinishSubMenuInit 68 4
line 442
;434:}
;435:
;436:/*
;437:=================
;438:DynamicMenu_FinishInitSubMenu
;439:=================
;440:*/
;441:static void DynamicMenu_FinishSubMenuInit( void )
;442:{
line 452
;443:	int depth;
;444:	int width, maxwidth;
;445:	int height, lineheight;
;446:	int posx, posy;
;447:	int i, count, start, active;
;448:	float scale;
;449:	menutext_s* ptr;
;450:	qboolean submenu;
;451:
;452:	depth = s_dynamic.depth - 1;
ADDRLP4 40
ADDRGP4 s_dynamic+7108
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 455
;453:
;454:	// find the widest item
;455:	submenu = qfalse;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 456
;456:	maxwidth = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 457
;457:	start = s_dynamic.start[depth];
ADDRLP4 12
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7032
ADDP4
INDIRI4
ASGNI4
line 458
;458:	count = s_dynamic.end[depth] - start;
ADDRLP4 32
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7056
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 459
;459:	for ( i = 0; i < count; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $265
JUMPV
LABELV $262
line 460
;460:	{
line 461
;461:		width = UI_ProportionalStringWidth(s_dynamic.data[i + start].text);
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4984
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 56
INDIRI4
ASGNI4
line 462
;462:		if (width > maxwidth)
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $267
line 463
;463:			maxwidth = width;
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
LABELV $267
line 465
;464:
;465:		if (s_dynamic.data[i + start].createSubMenu)
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4984+24
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $269
line 466
;466:			submenu = qtrue;	
ADDRLP4 36
CNSTI4 1
ASGNI4
LABELV $269
line 467
;467:	}
LABELV $263
line 459
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $265
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $262
line 469
;468:
;469:	scale = UI_ProportionalSizeScale(UI_SMALLFONT);
CNSTI4 16
ARGI4
ADDRLP4 56
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 56
INDIRF4
ASGNF4
line 470
;470:	if (submenu)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $273
line 471
;471:	{
line 473
;472:		// space and submenu pointer
;473:		maxwidth += UI_ProportionalStringWidth(" \r");
ADDRGP4 $275
ARGP4
ADDRLP4 60
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 24
INDIRI4
ADDRLP4 60
INDIRI4
ADDI4
ASGNI4
line 474
;474:	}
LABELV $273
line 476
;475:
;476:	maxwidth *= scale;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CVIF4 4
ADDRLP4 44
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 479
;477:
;478:	// determine the position of the menu
;479:	lineheight = PROP_HEIGHT * scale + 2*MENUSPACE_Y;
ADDRLP4 8
CNSTF4 1104674816
ADDRLP4 44
INDIRF4
MULF4
CNSTF4 1073741824
ADDF4
CVFI4 4
ASGNI4
line 480
;480:	height = count * lineheight;
ADDRLP4 48
ADDRLP4 32
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ASGNI4
line 482
;481:
;482:	if (depth == 0)
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $276
line 483
;483:	{
line 484
;484:		posy = 240 - height/2;
ADDRLP4 16
CNSTI4 240
ADDRLP4 48
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 485
;485:		posx = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 486
;486:	}
ADDRGP4 $277
JUMPV
LABELV $276
line 488
;487:	else
;488:	{
line 489
;489:		active = s_dynamic.active[depth - 1];
ADDRLP4 52
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7080-4
ADDP4
INDIRI4
ASGNI4
line 490
;490:		posx = s_dynamic.item[active].generic.right;
ADDRLP4 20
CNSTI4 72
ADDRLP4 52
INDIRI4
MULI4
ADDRGP4 s_dynamic+376+28
ADDP4
INDIRI4
ASGNI4
line 491
;491:		posy = s_dynamic.item[active].generic.top;
ADDRLP4 16
CNSTI4 72
ADDRLP4 52
INDIRI4
MULI4
ADDRGP4 s_dynamic+376+24
ADDP4
INDIRI4
ASGNI4
line 493
;492:
;493:		if (posy + height > 480 - 64)
ADDRLP4 16
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CNSTI4 416
LEI4 $284
line 494
;494:			posy = 480 - 64 - height;
ADDRLP4 16
CNSTI4 416
ADDRLP4 48
INDIRI4
SUBI4
ASGNI4
LABELV $284
line 495
;495:	}
LABELV $277
line 497
;496:
;497:	for (i = 0; i < count; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $289
JUMPV
LABELV $286
line 498
;498:	{
line 499
;499:		ptr = &s_dynamic.item[start + i];
ADDRLP4 4
CNSTI4 72
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
MULI4
ADDRGP4 s_dynamic+376
ADDP4
ASGNP4
line 501
;500:
;501:		ptr->generic.x = posx + MENUSPACE_X;
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 20
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 502
;502:		ptr->generic.y = posy + i*lineheight + MENUSPACE_Y;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDI4
CNSTI4 1
ADDI4
ASGNI4
line 504
;503:
;504:		ptr->generic.left = posx;
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 505
;505:		ptr->generic.right = posx + maxwidth + 2*MENUSPACE_X;
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
CNSTI4 8
ADDI4
ASGNI4
line 506
;506:		ptr->generic.top = posy + i*lineheight;
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDI4
ASGNI4
line 507
;507:		ptr->generic.bottom = posy + (i+1)*lineheight - 1;
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDI4
ADDRLP4 8
INDIRI4
MULI4
ADDI4
ADDRLP4 60
INDIRI4
SUBI4
ASGNI4
line 509
;508:
;509:		ptr->generic.flags &= ~(QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 64
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRU4
CNSTU4 4294946815
BANDU4
ASGNU4
line 510
;510:	}
LABELV $287
line 497
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $289
ADDRLP4 0
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $286
line 511
;511:}
LABELV $258
endproc DynamicMenu_FinishSubMenuInit 68 4
proc DynamicMenu_OnActiveList 8 0
line 519
;512:
;513:/*
;514:=================
;515:DynamicMenu_OnActiveList
;516:=================
;517:*/
;518:static qboolean DynamicMenu_OnActiveList( int index )
;519:{
line 523
;520:	int depth;
;521:	int i;
;522:
;523:	depth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7108
INDIRI4
ASGNI4
line 525
;524:
;525:	for ( i = 0; i < depth ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $296
JUMPV
LABELV $293
line 526
;526:		if (s_dynamic.active[i] == index)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7080
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $297
line 527
;527:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $291
JUMPV
LABELV $297
LABELV $294
line 525
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $296
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $293
line 529
;528:			
;529:	return qfalse;
CNSTI4 0
RETI4
LABELV $291
endproc DynamicMenu_OnActiveList 8 0
proc DynamicMenu_MenuItemDraw 56 20
line 538
;530:}
;531:
;532:/*
;533:=================
;534:DynamicMenu_MenuItemDraw
;535:=================
;536:*/
;537:static void DynamicMenu_MenuItemDraw( void* self )
;538:{
line 548
;539:	int		x;
;540:	int		y;
;541:
;542:	int		w,h;
;543:	float *	color;
;544:	int		style;
;545:	menutext_s* t;
;546:	vec4_t	back_color;
;547:
;548:	t = (menutext_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 552
;549:
;550:
;551:	// draw the background;
;552:	x = t->generic.left;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 553
;553:	y = t->generic.top;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 554
;554:	w = t->generic.right - x;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 555
;555:	h = t->generic.bottom - y;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 557
;556:
;557:	back_color[0] = 0.0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 558
;558:	back_color[1] = 0.0;
ADDRLP4 12+4
CNSTF4 0
ASGNF4
line 559
;559:	back_color[2] = 0.0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 560
;560:	if (DynamicMenu_OnActiveList(t->generic.id))
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 DynamicMenu_OnActiveList
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $303
line 561
;561:	{
line 562
;562:		back_color[3] = 0.33;
ADDRLP4 12+12
CNSTF4 1051260355
ASGNF4
line 563
;563:	}
ADDRGP4 $304
JUMPV
LABELV $303
line 565
;564:	else
;565:	{
line 566
;566:		back_color[3] = 0.1;
ADDRLP4 12+12
CNSTF4 1036831949
ASGNF4
line 567
;567:	}
LABELV $304
line 569
;568:
;569:	UI_FillRect(x, y, w, h, back_color);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 572
;570:
;571:	// draw the text
;572:	x = t->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 573
;573:	y = t->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 575
;574:
;575:	if (t->generic.flags & QMF_GRAYED)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $307
line 576
;576:		color = text_color_disabled;
ADDRLP4 36
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $308
JUMPV
LABELV $307
line 578
;577:	else
;578:		color = t->color;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRP4
ASGNP4
LABELV $308
line 580
;579:
;580:	style = t->style;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 581
;581:	if( t->generic.flags & QMF_PULSEIFFOCUS ) {
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 256
BANDU4
CNSTU4 0
EQU4 $309
line 582
;582:		if( Menu_ItemAtCursor( t->generic.parent ) == t ) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRP4
CVPU4 4
NEU4 $311
line 583
;583:			style |= UI_PULSE;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 584
;584:		}
ADDRGP4 $312
JUMPV
LABELV $311
line 585
;585:		else {
line 586
;586:			style |= UI_INVERSE;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 587
;587:		}
LABELV $312
line 588
;588:	}
LABELV $309
line 590
;589:
;590:	UI_DrawProportionalString( x, y, t->string, style, color );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 593
;591:
;592:	// draw the cursor for submenu if needed
;593:	x = t->generic.left + w;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ASGNI4
line 594
;594:	if (s_dynamic.data[ t->generic.id ].createSubMenu)
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4984+24
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $313
line 595
;595:	{
line 596
;596:		UI_DrawChar( x, y, 13, style|UI_RIGHT, color);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 13
ARGI4
ADDRLP4 32
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 597
;597:	}
LABELV $313
line 598
;598:}
LABELV $300
endproc DynamicMenu_MenuItemDraw 56 20
proc DynamicMenu_MenuDraw 12 20
line 606
;599:
;600:/*
;601:=================
;602:DynamicMenu_MenuDraw
;603:=================
;604:*/
;605:static void DynamicMenu_MenuDraw( void )
;606:{
line 607
;607:	UI_DrawString(0, 0, va("This Gallery was built", s_dynamic.depth), 
ADDRGP4 $318
ARGP4
ADDRGP4 s_dynamic+7108
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 609
;608:		UI_SMALLFONT, color_white);
;609:	UI_DrawString(0, 32, va("by artists for artists.",
ADDRGP4 $320
ARGP4
ADDRGP4 s_dynamic+7080
INDIRI4
ARGI4
ADDRGP4 s_dynamic+7080+4
INDIRI4
ARGI4
ADDRGP4 s_dynamic+7080+8
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 613
;610:		s_dynamic.active[0], s_dynamic.active[1], s_dynamic.active[2] ),
;611:		UI_SMALLFONT, color_white);
;612:
;613:	Menu_Draw(&s_dynamic.menu);
ADDRGP4 s_dynamic
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 614
;614:}
LABELV $317
endproc DynamicMenu_MenuDraw 12 20
proc DynamicMenu_IndexDepth 12 0
line 622
;615:
;616:/*
;617:=================
;618:DynamicMenu_IndexDepth
;619:=================
;620:*/
;621:static int DynamicMenu_IndexDepth( int pos )
;622:{
line 626
;623:	int i;
;624:	int maxdepth, depth;
;625:
;626:	maxdepth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7108
INDIRI4
ASGNI4
line 627
;627:	depth = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 628
;628:	for (i = 0; i < maxdepth; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $331
JUMPV
LABELV $328
line 629
;629:	{
line 630
;630:		if (pos < s_dynamic.end[i])
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7056
ADDP4
INDIRI4
GEI4 $332
line 631
;631:		{
line 632
;632:			depth = i + 1;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 633
;633:			break;
ADDRGP4 $330
JUMPV
LABELV $332
line 635
;634:		}
;635:	}
LABELV $329
line 628
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $331
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $328
LABELV $330
line 637
;636:
;637:	return depth;
ADDRLP4 8
INDIRI4
RETI4
LABELV $326
endproc DynamicMenu_IndexDepth 12 0
proc DynamicMenu_SetFocus 24 8
line 646
;638:}
;639:
;640:/*
;641:=================
;642:DynamicMenu_SetFocus
;643:=================
;644:*/
;645:static void DynamicMenu_SetFocus( int pos )
;646:{
line 650
;647:	int i;
;648:	int depth, newdepth;
;649:
;650:	depth = s_dynamic.depth;
ADDRLP4 4
ADDRGP4 s_dynamic+7108
INDIRI4
ASGNI4
line 651
;651:	newdepth = DynamicMenu_IndexDepth(pos);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 DynamicMenu_IndexDepth
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 653
;652:
;653:	if (newdepth == 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $337
line 654
;654:	{
line 655
;655:		Com_Printf("SetFocus: index %i outside menu\n", pos);
ADDRGP4 $339
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 656
;656:		return;
ADDRGP4 $335
JUMPV
LABELV $337
line 659
;657:	}
;658:
;659:	s_dynamic.active[ newdepth - 1 ] = pos;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7080-4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 660
;660:	s_dynamic.depth = newdepth;
ADDRGP4 s_dynamic+7108
ADDRLP4 8
INDIRI4
ASGNI4
line 663
;661:
;662:	// hide any previous submenus
;663:	if (newdepth < depth)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $343
line 664
;664:	{
line 665
;665:		for (i = s_dynamic.start[ newdepth ]; 
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7032
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $348
JUMPV
LABELV $345
line 667
;666:			i < s_dynamic.end[depth - 1]; i++)
;667:		{
line 668
;668:			s_dynamic.item[i].generic.flags |= (QMF_HIDDEN|QMF_INACTIVE);
ADDRLP4 16
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+376+44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 669
;669:			s_dynamic.item[i].generic.flags &= ~QMF_GRAYED;
ADDRLP4 20
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+376+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 4294959103
BANDU4
ASGNU4
line 670
;670:		}
LABELV $346
line 666
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $348
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7056-4
ADDP4
INDIRI4
LTI4 $345
line 671
;671:	}
LABELV $343
line 673
;672:
;673:	s_dynamic.active[newdepth - 1] = pos;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_dynamic+7080-4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 676
;674:
;675:	// show this sub-menu (if needed)
;676:	if (s_dynamic.data[pos].createSubMenu)
ADDRFP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4984+24
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $358
line 677
;677:		s_dynamic.data[pos].createSubMenu();
ADDRFP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4984+24
ADDP4
INDIRP4
CALLV
pop
LABELV $358
line 678
;678:}
LABELV $335
endproc DynamicMenu_SetFocus 24 8
proc DynamicMenu_ClearFocus 0 0
line 686
;679:
;680:/*
;681:=================
;682:DynamicMenu_ClearFocus
;683:=================
;684:*/
;685:static void DynamicMenu_ClearFocus( int pos )
;686:{
line 687
;687:}
LABELV $364
endproc DynamicMenu_ClearFocus 0 0
proc DynamicMenu_ActivateControl 16 8
line 695
;688:
;689:/*
;690:=================
;691:DynamicMenu_ActivateControl
;692:=================
;693:*/
;694:static void DynamicMenu_ActivateControl( int pos )
;695:{
line 699
;696:	int i;
;697:	int depth;
;698:
;699:	depth = DynamicMenu_IndexDepth(pos);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 DynamicMenu_IndexDepth
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 701
;700:
;701:	if (depth == 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $366
line 702
;702:	{
line 703
;703:		Com_Printf("ActivateControl: index %i outside menu\n", pos);
ADDRGP4 $368
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 704
;704:		return;
ADDRGP4 $365
JUMPV
LABELV $366
line 708
;705:	}
;706:
;707:	// not at the deepest level, can't be a command
;708:	if (depth < s_dynamic.depth)
ADDRLP4 0
INDIRI4
ADDRGP4 s_dynamic+7108
INDIRI4
GEI4 $369
line 709
;709:		return;
ADDRGP4 $365
JUMPV
LABELV $369
line 711
;710:
;711:	if (s_dynamic.data[pos].runEvent)
ADDRFP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4984+28
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $372
line 712
;712:		s_dynamic.data[pos].runEvent(pos);
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4984+28
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $373
JUMPV
LABELV $372
line 714
;713:	else
;714:		Com_Printf("ActivateControl: index %i has no event\n", pos);
ADDRGP4 $378
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
LABELV $373
line 715
;715:}
LABELV $365
endproc DynamicMenu_ActivateControl 16 8
proc DynamicMenu_MenuEvent 8 4
line 723
;716:
;717:/*
;718:=================
;719:DynamicMenu_MenuEvent
;720:=================
;721:*/
;722:static void DynamicMenu_MenuEvent( void* self, int event )
;723:{
line 726
;724:	menutext_s* t;
;725:
;726:	t = (menutext_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 728
;727:
;728:	switch (event)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $382
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $383
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $384
ADDRGP4 $380
JUMPV
line 729
;729:	{
LABELV $382
line 731
;730:	case QM_GOTFOCUS:
;731:		DynamicMenu_SetFocus(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_SetFocus
CALLV
pop
line 732
;732:		break;
ADDRGP4 $381
JUMPV
LABELV $383
line 734
;733:	case QM_LOSTFOCUS:
;734:		DynamicMenu_ClearFocus(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_ClearFocus
CALLV
pop
line 735
;735:		break;
ADDRGP4 $381
JUMPV
LABELV $384
line 737
;736:	case QM_ACTIVATED:
;737:		DynamicMenu_ActivateControl(t->generic.id);
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 DynamicMenu_ActivateControl
CALLV
pop
line 738
;738:		break;
LABELV $380
LABELV $381
line 740
;739:	}
;740:}
LABELV $379
endproc DynamicMenu_MenuEvent 8 4
proc DynamicMenu_Close 0 0
line 748
;741:
;742:/*
;743:=================
;744:DynamicMenu_Close
;745:=================
;746:*/
;747:static void DynamicMenu_Close( void )
;748:{
line 749
;749:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 750
;750:}
LABELV $385
endproc DynamicMenu_Close 0 0
proc DM_Close_Event 0 0
line 758
;751:
;752:/*
;753:=================
;754:DM_Close_Event
;755:=================
;756:*/
;757:static void DM_Close_Event( int index )
;758:{
line 759
;759:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 760
;760:}
LABELV $386
endproc DM_Close_Event 0 0
proc DynamicMenu_InitPrimaryMenu 0 16
line 768
;761:
;762:/*
;763:=================
;764:DynamicMenu_InitPrimaryMenu
;765:=================
;766:*/
;767:static void DynamicMenu_InitPrimaryMenu( void )
;768:{
line 769
;769:	DynamicMenu_SubMenuInit();
ADDRGP4 DynamicMenu_SubMenuInit
CALLI4
pop
line 771
;770:
;771:	DynamicMenu_AddItem("Close!", 0, NULL, DM_Close_Event);
ADDRGP4 $388
ARGP4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 DM_Close_Event
ARGP4
ADDRGP4 DynamicMenu_AddItem
CALLI4
pop
line 773
;772:
;773:	DynamicMenu_FinishSubMenuInit();
ADDRGP4 DynamicMenu_FinishSubMenuInit
CALLV
pop
line 774
;774:}
LABELV $387
endproc DynamicMenu_InitPrimaryMenu 0 16
proc DynamicMenu_MenuInit 12 8
line 782
;775:
;776:/*
;777:=================
;778:DynamicMenu_MenuInit
;779:=================
;780:*/
;781:static void DynamicMenu_MenuInit( void )
;782:{
line 785
;783:	int i;
;784:
;785:	s_dynamic.menu.draw = DynamicMenu_MenuDraw;
ADDRGP4 s_dynamic+268
ADDRGP4 DynamicMenu_MenuDraw
ASGNP4
line 786
;786:	s_dynamic.menu.fullscreen = qfalse;
ADDRGP4 s_dynamic+280
CNSTI4 0
ASGNI4
line 787
;787:	s_dynamic.menu.wrapAround = qfalse;
ADDRGP4 s_dynamic+276
CNSTI4 0
ASGNI4
line 789
;788:
;789:	for (i = 0; i < MAX_MENUITEMS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $393
line 790
;790:	{
line 791
;791:		s_dynamic.item[i].generic.type = MTYPE_PTEXT;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+376
ADDP4
CNSTI4 9
ASGNI4
line 792
;792:		s_dynamic.item[i].generic.flags = QMF_INACTIVE
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+376+44
ADDP4
CNSTU4 53504
ASGNU4
line 794
;793:			|QMF_HIDDEN|QMF_NODEFAULTINIT|QMF_PULSEIFFOCUS;
;794:		s_dynamic.item[i].generic.ownerdraw = DynamicMenu_MenuItemDraw ;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+376+56
ADDP4
ADDRGP4 DynamicMenu_MenuItemDraw
ASGNP4
line 795
;795:		s_dynamic.item[i].generic.callback = DynamicMenu_MenuEvent ;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+376+48
ADDP4
ADDRGP4 DynamicMenu_MenuEvent
ASGNP4
line 796
;796:		s_dynamic.item[i].generic.id = i;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+376+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 797
;797:		s_dynamic.item[i].string = s_dynamic.data[i].text;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+376+60
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 s_dynamic+4984
ADDP4
ASGNP4
line 798
;798:		s_dynamic.item[i].style = UI_SMALLFONT|UI_DROPSHADOW;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+376+64
ADDP4
CNSTI4 2064
ASGNI4
line 799
;799:		s_dynamic.item[i].color = color_white;
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+376+68
ADDP4
ADDRGP4 color_white
ASGNP4
line 801
;800: 
;801:		Menu_AddItem(&s_dynamic.menu, &s_dynamic.item[i]);
ADDRGP4 s_dynamic
ARGP4
CNSTI4 72
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 s_dynamic+376
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 802
;802:	}
LABELV $394
line 789
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $393
line 805
;803:
;804:	// start up the menu system
;805:	s_dynamic.depth = 0;
ADDRGP4 s_dynamic+7108
CNSTI4 0
ASGNI4
line 810
;806:
;807://	Uncomment the next line if adding part II as well
;808://	DynamicMenu_InitMapItems();
;809:
;810:	DynamicMenu_InitPrimaryMenu();
ADDRGP4 DynamicMenu_InitPrimaryMenu
CALLV
pop
line 811
;811:}
LABELV $389
endproc DynamicMenu_MenuInit 12 8
export UI_DynamicMenuCache
proc UI_DynamicMenuCache 0 0
line 819
;812:
;813:/*
;814:=================
;815:UI_DynamicMenuCache
;816:=================
;817:*/
;818:void UI_DynamicMenuCache( void )
;819:{
line 820
;820:}
LABELV $415
endproc UI_DynamicMenuCache 0 0
export UI_DynamicMenu
proc UI_DynamicMenu 4124 12
line 828
;821:
;822:/*
;823:=================
;824:UI_DynamicMenu
;825:=================
;826:*/
;827:void UI_DynamicMenu( void )
;828:{
line 833
;829:	uiClientState_t	cs;
;830:	char	info[MAX_INFO_STRING];
;831:	int	playerTeam;
;832:
;833:	trap_GetClientState( &cs );
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 834
;834:	trap_GetConfigString( CS_PLAYERS 
ADDRLP4 0+8
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 3084
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 836
;835:		+ cs.clientNum, info, MAX_INFO_STRING );
;836:	playerTeam = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 3084
ARGP4
ADDRGP4 $418
ARGP4
ADDRLP4 4112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4112
INDIRP4
ARGP4
ADDRLP4 4116
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4108
ADDRLP4 4116
INDIRI4
ASGNI4
line 843
;837:
;838://	Uncomment the next two code lines if adding part II 
;839://	as well, or specs can't use the menu either
;840://	if (playerTeam == TEAM_SPECTATOR)
;841://		return;
;842:
;843:	memset(&s_dynamic.menu, 0, sizeof(dynamicmenu_t));
ADDRGP4 s_dynamic
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7112
ARGI4
ADDRGP4 memset
CALLP4
pop
line 845
;844:
;845:	s_dynamic.gametype = (int)trap_Cvar_VariableValue("g_gametype");
ADDRGP4 $420
ARGP4
ADDRLP4 4120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_dynamic+7104
ADDRLP4 4120
INDIRF4
CVFI4 4
ASGNI4
line 852
;846:
;847://	Uncomment the next three lines if adding part II as well
;848://	if (s_dynamic.gametype != GT_TEAM && 
;849://			s_dynamic.gametype != GT_CTF)
;850://		return;
;851:
;852:	UI_DynamicMenuCache();
ADDRGP4 UI_DynamicMenuCache
CALLV
pop
line 855
;853:
;854:	// force as top level menu
;855:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 858
;856:
;857:	// set menu cursor to a nice location
;858:	uis.cursorx = 50;
ADDRGP4 uis+8
CNSTI4 50
ASGNI4
line 859
;859:	uis.cursory = 240;
ADDRGP4 uis+12
CNSTI4 240
ASGNI4
line 861
;860:
;861:	DynamicMenu_MenuInit();
ADDRGP4 DynamicMenu_MenuInit
CALLV
pop
line 863
;862:
;863:	UI_PushMenu( &s_dynamic.menu );
ADDRGP4 s_dynamic
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 864
;864:}
LABELV $416
endproc UI_DynamicMenu 4124 12
export UI_DynamicCommandMenu_f
proc UI_DynamicCommandMenu_f 0 0
line 872
;865:
;866:/*
;867:=================
;868:UI_DynamicCommandMenu_f
;869:=================
;870:*/
;871:void UI_DynamicCommandMenu_f( void )
;872:{
line 873
;873:	UI_DynamicMenu();
ADDRGP4 UI_DynamicMenu
CALLV
pop
line 874
;874:}info, MAX_INFO_STRING );
LABELV $424
endproc UI_DynamicCommandMenu_f 0 0
bss
align 4
LABELV s_dynamic
skip 7112
align 4
LABELV s_ingame
skip 736
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
LABELV $420
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
LABELV $418
byte 1 116
byte 1 0
align 1
LABELV $388
byte 1 67
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $378
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $368
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 67
byte 1 111
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $339
byte 1 83
byte 1 101
byte 1 116
byte 1 70
byte 1 111
byte 1 99
byte 1 117
byte 1 115
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $320
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $318
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 71
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $275
byte 1 32
byte 1 13
byte 1 0
align 1
LABELV $247
byte 1 91
byte 1 110
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 93
byte 1 0
align 1
LABELV $197
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $179
byte 1 76
byte 1 69
byte 1 65
byte 1 86
byte 1 69
byte 1 32
byte 1 71
byte 1 65
byte 1 76
byte 1 76
byte 1 69
byte 1 82
byte 1 89
byte 1 0
align 1
LABELV $161
byte 1 82
byte 1 69
byte 1 83
byte 1 85
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $145
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $138
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 76
byte 1 76
byte 1 69
byte 1 82
byte 1 89
byte 1 0
align 1
LABELV $120
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $98
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
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $85
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 76
byte 1 76
byte 1 69
byte 1 82
byte 1 89
byte 1 63
byte 1 0
align 1
LABELV $83
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
LABELV $71
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 48
byte 1 10
byte 1 0
