code
proc MainMenu_ExitAction 0 0
file "../ui_menu.c"
line 56
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:MAIN MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14://#define ID_SINGLEPLAYER			10
;15:#define ID_GALLERY			11
;16:#define ID_SETUP				12
;17://#define ID_DEMOS				13
;18://#define ID_CINEMATICS			14
;19://#define ID_TEAM		15
;20://#define ID_MODS					16
;21:#define ID_EXIT					17
;22:
;23://#define MAIN_BANNER_MODEL				"models/mapobjects/banner/banner5.md3"
;24:#define MAIN_MENU_VERTICAL_SPACING		34
;25:
;26:
;27:typedef struct {
;28:	menuframework_s	menu;
;29:
;30://	menutext_s		singleplayer;
;31:	menutext_s		gallery;
;32:	menutext_s		setup;
;33://	menutext_s		demos;
;34://	menutext_s		cinematics;
;35://	menutext_s		mods;
;36:	menutext_s		exit; 
;37:
;38:	qhandle_t		bannerModel;
;39:} mainmenu_t;
;40:
;41:
;42:static mainmenu_t s_main;
;43:
;44:typedef struct {
;45:	menuframework_s menu;	
;46:	char errorMessage[4096];
;47:} errorMessage_t;
;48:
;49:static errorMessage_t s_errorMessage;
;50:
;51:/*
;52:=================
;53:MainMenu_ExitAction
;54:=================
;55:*/
;56:static void MainMenu_ExitAction( qboolean result ) {
line 57
;57:	if( !result ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $70
line 58
;58:		return;
ADDRGP4 $69
JUMPV
LABELV $70
line 60
;59:	}
;60:	UI_CreditMenu();
ADDRGP4 UI_CreditMenu
CALLV
pop
line 61
;61:}
LABELV $69
endproc MainMenu_ExitAction 0 0
export Main_MenuEvent
proc Main_MenuEvent 12 4
line 70
;62:
;63:
;64:
;65:/*
;66:=================
;67:Main_MenuEvent
;68:=================
;69:*/
;70:void Main_MenuEvent (void* ptr, int event) {
line 71
;71:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $73
line 72
;72:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 75
;73:	}
;74:
;75:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
CNSTI4 11
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $78
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $79
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $75
LABELV $81
ADDRLP4 0
INDIRI4
CNSTI4 17
EQI4 $80
ADDRGP4 $75
JUMPV
LABELV $78
line 81
;76://	case ID_SINGLEPLAYER:
;77://		UI_SPLevelMenu();
;78://		break;
;79:
;80:	case ID_GALLERY:
;81:		UI_StartServerMenu( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 82
;82:		break;
ADDRGP4 $76
JUMPV
LABELV $79
line 85
;83:
;84:	case ID_SETUP:
;85:		UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 86
;86:		break;
ADDRGP4 $76
JUMPV
LABELV $80
line 101
;87:/*
;88:	case ID_DEMOS:
;89:		UI_DemosMenu();
;90:		break;
;91:*/
;92://	case ID_CINEMATICS:
;93://		UI_CinematicsMenu();
;94://		break;
;95:
;96://	case ID_MODS:
;97://		UI_ModsMenu();
;98://		break;
;99:
;100:	case ID_EXIT:
;101:	    UI_CreditMenu();
ADDRGP4 UI_CreditMenu
CALLV
pop
line 102
;102:		break;
LABELV $75
LABELV $76
line 104
;103:	}
;104:}
LABELV $72
endproc Main_MenuEvent 12 4
export MainMenu_Cache
proc MainMenu_Cache 0 0
line 112
;105:
;106:
;107:/*
;108:===============
;109:MainMenu_Cache
;110:===============
;111:*/
;112:void MainMenu_Cache( void ) {
line 114
;113://	s_main.bannerModel = trap_R_RegisterModel( MAIN_BANNER_MODEL );
;114:}
LABELV $82
endproc MainMenu_Cache 0 0
export ErrorMessage_Key
proc ErrorMessage_Key 0 8
line 117
;115:
;116:sfxHandle_t ErrorMessage_Key(int key)
;117:{
line 118
;118:	trap_Cvar_Set( "com_errorMessage", "" );
ADDRGP4 $84
ARGP4
ADDRGP4 $85
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 119
;119:	UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 120
;120:	return (menu_null_sound);
ADDRGP4 menu_null_sound
INDIRI4
RETI4
LABELV $83
endproc ErrorMessage_Key 0 8
lit
align 4
LABELV $87
byte 4 1065353216
byte 4 1065353216
byte 4 0
byte 4 1065353216
code
proc Main_MenuDraw 572 28
line 130
;121:}
;122:
;123:/*
;124:===============
;125:Main_MenuDraw
;126:TTimo: this function is common to the main menu and errorMessage menu
;127:===============
;128:*/
;129:
;130:static void Main_MenuDraw( void ) {
line 137
;131:	refdef_t		refdef;
;132:	refEntity_t		ent;
;133:	vec3_t			origin;
;134:	vec3_t			angles;
;135:	float			adjust;
;136:	float			x, y, w, h;
;137:	vec4_t			color = {1.0, 1.0, 0, 1};
ADDRLP4 400
ADDRGP4 $87
INDIRB
ASGNB 16
line 141
;138:
;139:	// setup the refdef
;140:
;141:	memset( &refdef, 0, sizeof( refdef ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 143
;142:
;143:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 145
;144:
;145:	AxisClear( refdef.viewaxis );
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 147
;146:
;147:	x = 0;
ADDRLP4 384
CNSTF4 0
ASGNF4
line 148
;148:	y = 0;
ADDRLP4 388
CNSTF4 0
ASGNF4
line 149
;149:	w = 640;
ADDRLP4 392
CNSTF4 1142947840
ASGNF4
line 150
;150:	h = 120;
ADDRLP4 396
CNSTF4 1123024896
ASGNF4
line 151
;151:	UI_AdjustFrom640( &x, &y, &w, &h );
ADDRLP4 384
ARGP4
ADDRLP4 388
ARGP4
ADDRLP4 392
ARGP4
ADDRLP4 396
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 152
;152:	refdef.x = x;
ADDRLP4 0
ADDRLP4 384
INDIRF4
CVFI4 4
ASGNI4
line 153
;153:	refdef.y = y;
ADDRLP4 0+4
ADDRLP4 388
INDIRF4
CVFI4 4
ASGNI4
line 154
;154:	refdef.width = w;
ADDRLP4 0+8
ADDRLP4 392
INDIRF4
CVFI4 4
ASGNI4
line 155
;155:	refdef.height = h;
ADDRLP4 0+12
ADDRLP4 396
INDIRF4
CVFI4 4
ASGNI4
line 157
;156:
;157:	adjust = 0; // JDC: Kenneth asked me to stop this 1.0 * sin( (float)uis.realtime / 1000 );
ADDRLP4 380
CNSTF4 0
ASGNF4
line 158
;158:	refdef.fov_x = 60 + adjust;
ADDRLP4 0+16
ADDRLP4 380
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 159
;159:	refdef.fov_y = 19.6875 + adjust;
ADDRLP4 0+20
ADDRLP4 380
INDIRF4
CNSTF4 1100840960
ADDF4
ASGNF4
line 161
;160:
;161:	refdef.time = uis.realtime;
ADDRLP4 0+72
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 163
;162:
;163:	origin[0] = 300;
ADDRLP4 368
CNSTF4 1133903872
ASGNF4
line 164
;164:	origin[1] = 0;
ADDRLP4 368+4
CNSTF4 0
ASGNF4
line 165
;165:	origin[2] = -32;
ADDRLP4 368+8
CNSTF4 3254779904
ASGNF4
line 167
;166:
;167:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 184
;168:
;169:	// add the model
;170:
;171://	memset( &ent, 0, sizeof(ent) );
;172:
;173://	adjust = 5.0 * sin( (float)uis.realtime / 5000 );
;174://	VectorSet( angles, 0, 180 + adjust, 0 );
;175://	AnglesToAxis( angles, ent.axis );
;176://	ent.hModel = s_main.bannerModel;
;177://	VectorCopy( origin, ent.origin );
;178://	VectorCopy( origin, ent.lightingOrigin );
;179://	ent.renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;
;180://	VectorCopy( ent.origin, ent.oldorigin );
;181:
;182://	trap_R_AddRefEntityToScene( &ent );
;183:
;184:	trap_R_RenderScene( &refdef );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 186
;185:	
;186:	if (strlen(s_errorMessage.errorMessage))
ADDRGP4 s_errorMessage+288
ARGP4
ADDRLP4 568
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 568
INDIRI4
CNSTI4 0
EQI4 $99
line 187
;187:	{
line 188
;188:		UI_DrawProportionalString_AutoWrapped( 320, 192, 600, 20, s_errorMessage.errorMessage, UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
CNSTI4 600
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 s_errorMessage+288
ARGP4
CNSTI4 2065
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString_AutoWrapped
CALLV
pop
line 189
;189:	}
ADDRGP4 $100
JUMPV
LABELV $99
line 191
;190:	else
;191:	{
line 193
;192:		// standard menu drawing
;193:		Menu_Draw( &s_main.menu );		
ADDRGP4 s_main
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 194
;194:	}
LABELV $100
line 200
;195:
;196://	if (uis.demoversion) {
;197://		UI_DrawProportionalString( 320, 427, "DEMO      Gallery      DEMO", UI_CENTER|UI_SMALLFONT, color );
;198://		UI_DrawString( 320, 450, "Gallery (c) 2015-2016, Bret C. Sheppard  All Rights Reserved", UI_CENTER|UI_SMALLFONT, color_yellow );
;199://	} else {
;200:		UI_DrawString( 320, 450, "Gallery       bretcolin@gmail.com", UI_CENTER|UI_SMALLFONT, color_yellow );
CNSTI4 320
ARGI4
CNSTI4 450
ARGI4
ADDRGP4 $103
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 202
;201://	}
;202:}
LABELV $86
endproc Main_MenuDraw 572 28
export UI_MainMenu
proc UI_MainMenu 16 12
line 241
;203:
;204:
;205:/*
;206:===============
;207:UI_TeamArenaExists
;208:===============
;209:*/
;210:/*
;211:static qboolean UI_TeamArenaExists( void ) {
;212:	int		numdirs;
;213:	char	dirlist[2048];
;214:	char	*dirptr;
;215:  char  *descptr;
;216:	int		i;
;217:	int		dirlen;
;218:
;219:	numdirs = trap_FS_GetFileList( "$modlist", "", dirlist, sizeof(dirlist) );
;220:	dirptr  = dirlist;
;221:	for( i = 0; i < numdirs; i++ ) {
;222:		dirlen = strlen( dirptr ) + 1;
;223:    descptr = dirptr + dirlen;
;224:		if (Q_stricmp(dirptr, "missionpack") == 0) {
;225:			return qtrue;
;226:		}
;227:    dirptr += dirlen + strlen(descptr) + 1;
;228:	}
;229:	return qfalse;
;230:}
;231:*/
;232:/*
;233:===============
;234:UI_MainMenu
;235:
;236:The main menu only comes up when not in a game,
;237:so make sure that the attract loop server is down
;238:and that local cinematics are killed
;239:===============
;240:*/
;241:void UI_MainMenu( void ) {
line 243
;242:	int		y;
;243:	qboolean teamArena = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 244
;244:	int		style = UI_CENTER | UI_DROPSHADOW;
ADDRLP4 4
CNSTI4 2049
ASGNI4
line 246
;245:
;246:	trap_Cvar_Set( "sv_killserver", "1" );
ADDRGP4 $105
ARGP4
ADDRGP4 $106
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 248
;247:	
;248:	memset( &s_main, 0 ,sizeof(mainmenu_t) );
ADDRGP4 s_main
ARGP4
CNSTI4 0
ARGI4
CNSTI4 508
ARGI4
ADDRGP4 memset
CALLP4
pop
line 249
;249:	memset( &s_errorMessage, 0 ,sizeof(errorMessage_t) );
ADDRGP4 s_errorMessage
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4384
ARGI4
ADDRGP4 memset
CALLP4
pop
line 252
;250:
;251:	// com_errorMessage would need that too
;252:	MainMenu_Cache();
ADDRGP4 MainMenu_Cache
CALLV
pop
line 254
;253:	
;254:	trap_Cvar_VariableStringBuffer( "com_errorMessage", s_errorMessage.errorMessage, sizeof(s_errorMessage.errorMessage) );
ADDRGP4 $84
ARGP4
ADDRGP4 s_errorMessage+288
ARGP4
CNSTI4 4096
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 255
;255:	if (strlen(s_errorMessage.errorMessage))
ADDRGP4 s_errorMessage+288
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $109
line 256
;256:	{	
line 257
;257:		s_errorMessage.menu.draw = Main_MenuDraw;
ADDRGP4 s_errorMessage+268
ADDRGP4 Main_MenuDraw
ASGNP4
line 258
;258:		s_errorMessage.menu.key = ErrorMessage_Key;
ADDRGP4 s_errorMessage+272
ADDRGP4 ErrorMessage_Key
ASGNP4
line 259
;259:		s_errorMessage.menu.fullscreen = qtrue;
ADDRGP4 s_errorMessage+280
CNSTI4 1
ASGNI4
line 260
;260:		s_errorMessage.menu.wrapAround = qtrue;
ADDRGP4 s_errorMessage+276
CNSTI4 1
ASGNI4
line 261
;261:		s_errorMessage.menu.showlogo = qtrue;		
ADDRGP4 s_errorMessage+284
CNSTI4 1
ASGNI4
line 263
;262:
;263:		trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 264
;264:		uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 265
;265:		UI_PushMenu ( &s_errorMessage.menu );
ADDRGP4 s_errorMessage
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 267
;266:		
;267:		return;
ADDRGP4 $104
JUMPV
LABELV $109
line 270
;268:	}
;269:
;270:	s_main.menu.draw = Main_MenuDraw;
ADDRGP4 s_main+268
ADDRGP4 Main_MenuDraw
ASGNP4
line 271
;271:	s_main.menu.fullscreen = qtrue;
ADDRGP4 s_main+280
CNSTI4 1
ASGNI4
line 272
;272:	s_main.menu.wrapAround = qtrue;
ADDRGP4 s_main+276
CNSTI4 1
ASGNI4
line 273
;273:	s_main.menu.showlogo = qtrue;
ADDRGP4 s_main+284
CNSTI4 1
ASGNI4
line 275
;274:
;275:	y = 155;				 //134
ADDRLP4 0
CNSTI4 155
ASGNI4
line 286
;276://	s_main.singleplayer.generic.type		= MTYPE_PTEXT;
;277://	s_main.singleplayer.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;278://	s_main.singleplayer.generic.x			= 320;
;279://	s_main.singleplayer.generic.y			= y;
;280://	s_main.singleplayer.generic.id			= ID_SINGLEPLAYER;
;281://	s_main.singleplayer.generic.callback	= Main_MenuEvent; 
;282://	s_main.singleplayer.string				= "SINGLE PLAYER";
;283://	s_main.singleplayer.color				= color_yellow;
;284://	s_main.singleplayer.style				= style;
;285:
;286:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 287
;287:	s_main.gallery.generic.type			= MTYPE_PTEXT;
ADDRGP4 s_main+288
CNSTI4 9
ASGNI4
line 288
;288:	s_main.gallery.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+288+44
CNSTU4 264
ASGNU4
line 289
;289:	s_main.gallery.generic.x			= 120;
ADDRGP4 s_main+288+12
CNSTI4 120
ASGNI4
line 290
;290:	s_main.gallery.generic.y			= y;
ADDRGP4 s_main+288+16
ADDRLP4 0
INDIRI4
ASGNI4
line 291
;291:	s_main.gallery.generic.id			= ID_GALLERY;
ADDRGP4 s_main+288+8
CNSTI4 11
ASGNI4
line 292
;292:	s_main.gallery.generic.callback		= Main_MenuEvent; 
ADDRGP4 s_main+288+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 293
;293:	s_main.gallery.string				= "GALLERY";
ADDRGP4 s_main+288+60
ADDRGP4 $135
ASGNP4
line 294
;294:	s_main.gallery.color				= color_white;
ADDRGP4 s_main+288+68
ADDRGP4 color_white
ASGNP4
line 295
;295:	s_main.gallery.style				= style;
ADDRGP4 s_main+288+64
ADDRLP4 4
INDIRI4
ASGNI4
line 297
;296:
;297:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 298
;298:	s_main.setup.generic.type				= MTYPE_PTEXT;
ADDRGP4 s_main+360
CNSTI4 9
ASGNI4
line 299
;299:	s_main.setup.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+360+44
CNSTU4 264
ASGNU4
line 300
;300:	s_main.setup.generic.x					= 120;
ADDRGP4 s_main+360+12
CNSTI4 120
ASGNI4
line 301
;301:	s_main.setup.generic.y					= y;
ADDRGP4 s_main+360+16
ADDRLP4 0
INDIRI4
ASGNI4
line 302
;302:	s_main.setup.generic.id					= ID_SETUP;
ADDRGP4 s_main+360+8
CNSTI4 12
ASGNI4
line 303
;303:	s_main.setup.generic.callback			= Main_MenuEvent; 
ADDRGP4 s_main+360+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 304
;304:	s_main.setup.string						= "SETUP";
ADDRGP4 s_main+360+60
ADDRGP4 $153
ASGNP4
line 305
;305:	s_main.setup.color						= color_yellow;
ADDRGP4 s_main+360+68
ADDRGP4 color_yellow
ASGNP4
line 306
;306:	s_main.setup.style						= style;
ADDRGP4 s_main+360+64
ADDRLP4 4
INDIRI4
ASGNI4
line 342
;307:/*
;308:	y += MAIN_MENU_VERTICAL_SPACING;
;309:	s_main.demos.generic.type				= MTYPE_PTEXT;
;310:	s_main.demos.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;311:	s_main.demos.generic.x					= 320;
;312:	s_main.demos.generic.y					= y;
;313:	s_main.demos.generic.id					= ID_DEMOS;
;314:	s_main.demos.generic.callback			= Main_MenuEvent; 
;315:	s_main.demos.string						= "DEMOS";
;316:	s_main.demos.color						= color_yellow;
;317:	s_main.demos.style						= style;
;318:*/
;319://	y += MAIN_MENU_VERTICAL_SPACING;
;320://	s_main.cinematics.generic.type			= MTYPE_PTEXT;
;321://	s_main.cinematics.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;322://	s_main.cinematics.generic.x				= 120;
;323://	s_main.cinematics.generic.y				= y;
;324://	s_main.cinematics.generic.id		    = ID_CINEMATICS;
;325://	s_main.cinematics.generic.callback		= Main_MenuEvent; 
;326://	s_main.cinematics.string			    = "CINEMATICS";
;327://	s_main.cinematics.color					= color_yellow;
;328://	s_main.cinematics.style					= style;	
;329:	
;330:
;331://	y += MAIN_MENU_VERTICAL_SPACING;
;332://	s_main.mods.generic.type			= MTYPE_PTEXT;
;333://	s_main.mods.generic.flags			= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;334://	s_main.mods.generic.x				= 320;
;335://	s_main.mods.generic.y				= y;
;336://	s_main.mods.generic.id				= ID_MODS;
;337://	s_main.mods.generic.callback		= Main_MenuEvent; 
;338://	s_main.mods.string					= "MODS";
;339://	s_main.mods.color					= color_yellow;
;340://	s_main.mods.style					= style;
;341:
;342:	y += MAIN_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 343
;343:	s_main.exit.generic.type				= MTYPE_PTEXT;
ADDRGP4 s_main+432
CNSTI4 9
ASGNI4
line 344
;344:	s_main.exit.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_main+432+44
CNSTU4 264
ASGNU4
line 345
;345:	s_main.exit.generic.x					= 120;
ADDRGP4 s_main+432+12
CNSTI4 120
ASGNI4
line 346
;346:	s_main.exit.generic.y					= y;
ADDRGP4 s_main+432+16
ADDRLP4 0
INDIRI4
ASGNI4
line 347
;347:	s_main.exit.generic.id					= ID_EXIT;
ADDRGP4 s_main+432+8
CNSTI4 17
ASGNI4
line 348
;348:	s_main.exit.generic.callback			= Main_MenuEvent; 
ADDRGP4 s_main+432+48
ADDRGP4 Main_MenuEvent
ASGNP4
line 349
;349:	s_main.exit.string						= "EXIT";
ADDRGP4 s_main+432+60
ADDRGP4 $171
ASGNP4
line 350
;350:	s_main.exit.color						= color_yellow;
ADDRGP4 s_main+432+68
ADDRGP4 color_yellow
ASGNP4
line 351
;351:	s_main.exit.style						= style;
ADDRGP4 s_main+432+64
ADDRLP4 4
INDIRI4
ASGNI4
line 354
;352:
;353://	Menu_AddItem( &s_main.menu,	&s_main.singleplayer );
;354:	Menu_AddItem( &s_main.menu,	&s_main.gallery );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 355
;355:	Menu_AddItem( &s_main.menu,	&s_main.setup );
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 360
;356://	Menu_AddItem( &s_main.menu,	&s_main.demos );
;357://	Menu_AddItem( &s_main.menu,	&s_main.cinematics );
;358://	}
;359://	Menu_AddItem( &s_main.menu,	&s_main.mods );
;360:	Menu_AddItem( &s_main.menu,	&s_main.exit );             
ADDRGP4 s_main
ARGP4
ADDRGP4 s_main+432
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 362
;361:
;362:	trap_Key_SetCatcher( KEYCATCH_UI );
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 363
;363:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 364
;364:	UI_PushMenu ( &s_main.menu );
ADDRGP4 s_main
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 366
;365:		
;366:}
LABELV $104
endproc UI_MainMenu 16 12
bss
align 4
LABELV s_errorMessage
skip 4384
align 4
LABELV s_main
skip 508
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
import UI_DynamicMenu
import UI_DynamicMenuCache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
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
LABELV $171
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $153
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $135
byte 1 71
byte 1 65
byte 1 76
byte 1 76
byte 1 69
byte 1 82
byte 1 89
byte 1 0
align 1
LABELV $106
byte 1 49
byte 1 0
align 1
LABELV $105
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
LABELV $103
byte 1 71
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 98
byte 1 114
byte 1 101
byte 1 116
byte 1 99
byte 1 111
byte 1 108
byte 1 105
byte 1 110
byte 1 64
byte 1 103
byte 1 109
byte 1 97
byte 1 105
byte 1 108
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $85
byte 1 0
align 1
LABELV $84
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
