data
align 4
LABELV teamoverlay_names
address $68
address $69
address $70
address $71
byte 4 0
code
proc Preferences_SetMenuItems 36 4
file "../ui_preferences.c"
line 72
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:GAME OPTIONS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:
;12:#include "ui_local.h"
;13:
;14:
;15://#define ART_FRAMEL				"menu/art/frame2_l"
;16://#define ART_FRAMER				"menu/art/frame1_r"
;17:#define ART_BACK0				"menu/art/back_0"
;18:#define ART_BACK1				"menu/art/back_1"
;19:
;20:#define PREFERENCES_X_POS		360
;21:
;22:#define ID_CROSSHAIR			127
;23://#define ID_SIMPLEITEMS			128
;24:#define ID_HIGHQUALITYSKY		129
;25://#define ID_EJECTINGBRASS		130
;26:#define ID_WALLMARKS			131
;27:#define ID_DYNAMICLIGHTS		132
;28://#define ID_IDENTIFYTARGET		133
;29:#define ID_SYNCEVERYFRAME		134
;30://#define ID_FORCEMODEL			135
;31://#define ID_DRAWTEAMOVERLAY		136
;32://#define ID_ALLOWDOWNLOAD			137
;33:#define ID_BACK					138
;34:
;35:#define	NUM_CROSSHAIRS			10
;36:
;37:
;38:typedef struct {
;39:	menuframework_s		menu;
;40:
;41:	menutext_s			banner;
;42://	menubitmap_s		framel;
;43://	menubitmap_s		framer;
;44:
;45:	menulist_s			crosshair;
;46://	menuradiobutton_s	simpleitems;
;47://	menuradiobutton_s	brass;
;48:	menuradiobutton_s	wallmarks;
;49:	menuradiobutton_s	dynamiclights;
;50://	menuradiobutton_s	identifytarget;
;51:	menuradiobutton_s	highqualitysky;
;52:	menuradiobutton_s	synceveryframe;
;53://	menuradiobutton_s	forcemodel;
;54://	menulist_s			drawteamoverlay;
;55://	menuradiobutton_s	allowdownload;
;56:	menubitmap_s		back;
;57:
;58:	qhandle_t			crosshairShader[NUM_CROSSHAIRS];
;59:} preferences_t;
;60:
;61:static preferences_t s_preferences;
;62:
;63:static const char *teamoverlay_names[] =
;64:{
;65:	"off",
;66:	"upper right",
;67:	"lower right",
;68:	"lower left",
;69:	0
;70:};
;71:
;72:static void Preferences_SetMenuItems( void ) {
line 73
;73:	s_preferences.crosshair.curvalue		= (int)trap_Cvar_VariableValue( "cg_drawCrosshair" ) % NUM_CROSSHAIRS;
ADDRGP4 $75
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_preferences+360+64
ADDRLP4 0
INDIRF4
CVFI4 4
CNSTI4 10
MODI4
ASGNI4
line 76
;74://	s_preferences.simpleitems.curvalue		= trap_Cvar_VariableValue( "cg_simpleItems" ) != 0;
;75://	s_preferences.brass.curvalue			= trap_Cvar_VariableValue( "cg_brassTime" ) != 0;
;76:	s_preferences.wallmarks.curvalue		= trap_Cvar_VariableValue( "cg_marks" ) != 0;
ADDRGP4 $78
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 0
EQF4 $80
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $81
JUMPV
LABELV $80
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $81
ADDRGP4 s_preferences+456+60
ADDRLP4 4
INDIRI4
ASGNI4
line 78
;77://	s_preferences.identifytarget.curvalue	= trap_Cvar_VariableValue( "cg_drawCrosshairNames" ) != 0;
;78:	s_preferences.dynamiclights.curvalue	= trap_Cvar_VariableValue( "r_dynamiclight" ) != 0;
ADDRGP4 $84
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 0
EQF4 $86
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $87
JUMPV
LABELV $86
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $87
ADDRGP4 s_preferences+520+60
ADDRLP4 12
INDIRI4
ASGNI4
line 79
;79:	s_preferences.highqualitysky.curvalue	= trap_Cvar_VariableValue ( "r_fastsky" ) == 0;
ADDRGP4 $90
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
NEF4 $92
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $93
JUMPV
LABELV $92
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $93
ADDRGP4 s_preferences+584+60
ADDRLP4 20
INDIRI4
ASGNI4
line 80
;80:	s_preferences.synceveryframe.curvalue	= trap_Cvar_VariableValue( "r_finish" ) != 0;
ADDRGP4 $96
ARGP4
ADDRLP4 32
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 0
EQF4 $98
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $99
JUMPV
LABELV $98
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $99
ADDRGP4 s_preferences+648+60
ADDRLP4 28
INDIRI4
ASGNI4
line 84
;81://	s_preferences.forcemodel.curvalue		= trap_Cvar_VariableValue( "cg_forcemodel" ) != 0;
;82://	s_preferences.drawteamoverlay.curvalue	= Com_Clamp( 0, 3, trap_Cvar_VariableValue( "cg_drawTeamOverlay" ) );
;83://	s_preferences.allowdownload.curvalue	= trap_Cvar_VariableValue( "cl_allowDownload" ) != 0;
;84:}
LABELV $72
endproc Preferences_SetMenuItems 36 4
proc Preferences_Event 16 8
line 87
;85:
;86:
;87:static void Preferences_Event( void* ptr, int notification ) {
line 88
;88:	if( notification != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $101
line 89
;89:		return;
ADDRGP4 $100
JUMPV
LABELV $101
line 92
;90:	}
;91:
;92:	switch( ((menucommon_s*)ptr)->id ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 127
LTI4 $103
ADDRLP4 0
INDIRI4
CNSTI4 138
GTI4 $103
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $133-508
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $133
address $106
address $103
address $117
address $103
address $123
address $126
address $103
address $129
address $103
address $103
address $103
address $132
code
LABELV $106
line 94
;93:	case ID_CROSSHAIR:
;94:		s_preferences.crosshair.curvalue++;
ADDRLP4 8
ADDRGP4 s_preferences+360+64
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 95
;95:		if( s_preferences.crosshair.curvalue == NUM_CROSSHAIRS ) {
ADDRGP4 s_preferences+360+64
INDIRI4
CNSTI4 10
NEI4 $109
line 96
;96:			s_preferences.crosshair.curvalue = 0;
ADDRGP4 s_preferences+360+64
CNSTI4 0
ASGNI4
line 97
;97:		}
LABELV $109
line 98
;98:		trap_Cvar_SetValue( "cg_drawCrosshair", s_preferences.crosshair.curvalue );
ADDRGP4 $75
ARGP4
ADDRGP4 s_preferences+360+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 99
;99:		break;
ADDRGP4 $104
JUMPV
LABELV $117
line 106
;100:
;101://	case ID_SIMPLEITEMS:
;102://		trap_Cvar_SetValue( "cg_simpleItems", s_preferences.simpleitems.curvalue );
;103://		break;
;104:
;105:	case ID_HIGHQUALITYSKY:
;106:		trap_Cvar_SetValue( "r_fastsky", !s_preferences.highqualitysky.curvalue );
ADDRGP4 $90
ARGP4
ADDRGP4 s_preferences+584+60
INDIRI4
CNSTI4 0
NEI4 $121
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $122
JUMPV
LABELV $121
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $122
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 107
;107:		break;
ADDRGP4 $104
JUMPV
LABELV $123
line 117
;108:
;109://	case ID_EJECTINGBRASS:
;110://		if ( s_preferences.brass.curvalue )
;111://			trap_Cvar_Reset( "cg_brassTime" );
;112://		else
;113://			trap_Cvar_SetValue( "cg_brassTime", 0 );
;114://		break;
;115:
;116:	case ID_WALLMARKS:
;117:		trap_Cvar_SetValue( "cg_marks", s_preferences.wallmarks.curvalue );
ADDRGP4 $78
ARGP4
ADDRGP4 s_preferences+456+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 118
;118:		break;
ADDRGP4 $104
JUMPV
LABELV $126
line 121
;119:
;120:	case ID_DYNAMICLIGHTS:
;121:		trap_Cvar_SetValue( "r_dynamiclight", s_preferences.dynamiclights.curvalue );
ADDRGP4 $84
ARGP4
ADDRGP4 s_preferences+520+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 122
;122:		break;		
ADDRGP4 $104
JUMPV
LABELV $129
line 129
;123:
;124://	case ID_IDENTIFYTARGET:
;125://		trap_Cvar_SetValue( "cg_drawCrosshairNames", s_preferences.identifytarget.curvalue );
;126://		break;
;127:
;128:	case ID_SYNCEVERYFRAME:
;129:		trap_Cvar_SetValue( "r_finish", s_preferences.synceveryframe.curvalue );
ADDRGP4 $96
ARGP4
ADDRGP4 s_preferences+648+60
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 130
;130:		break;
ADDRGP4 $104
JUMPV
LABELV $132
line 146
;131:
;132://	case ID_FORCEMODEL:
;133://		trap_Cvar_SetValue( "cg_forcemodel", s_preferences.forcemodel.curvalue );
;134://		break;
;135:
;136://	case ID_DRAWTEAMOVERLAY:
;137://		trap_Cvar_SetValue( "cg_drawTeamOverlay", s_preferences.drawteamoverlay.curvalue );
;138://		break;
;139:
;140://	case ID_ALLOWDOWNLOAD:
;141://		trap_Cvar_SetValue( "cl_allowDownload", s_preferences.allowdownload.curvalue );
;142://		trap_Cvar_SetValue( "sv_allowDownload", s_preferences.allowdownload.curvalue );
;143://		break;
;144:
;145:	case ID_BACK:
;146:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 147
;147:		break;
LABELV $103
LABELV $104
line 149
;148:	}
;149:}
LABELV $100
endproc Preferences_Event 16 8
proc Crosshair_Draw 48 20
line 157
;150:
;151:
;152:/*
;153:=================
;154:Crosshair_Draw
;155:=================
;156:*/
;157:static void Crosshair_Draw( void *self ) {
line 164
;158:	menulist_s	*s;
;159:	float		*color;
;160:	int			x, y;
;161:	int			style;
;162:	qboolean	focus;
;163:
;164:	s = (menulist_s *)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 165
;165:	x = s->generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 166
;166:	y =	s->generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 168
;167:
;168:	style = UI_SMALLFONT;
ADDRLP4 20
CNSTI4 16
ASGNI4
line 169
;169:	focus = (s->generic.parent->cursor == s->generic.menuPosition);
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
NEI4 $137
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $138
JUMPV
LABELV $137
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $138
ADDRLP4 16
ADDRLP4 24
INDIRI4
ASGNI4
line 171
;170:
;171:	if ( s->generic.flags & QMF_GRAYED )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $139
line 172
;172:		color = text_color_disabled;
ADDRLP4 12
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $140
JUMPV
LABELV $139
line 173
;173:	else if ( focus )
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $141
line 174
;174:	{
line 175
;175:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 176
;176:		style |= UI_PULSE;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 177
;177:	}
ADDRGP4 $142
JUMPV
LABELV $141
line 178
;178:	else if ( s->generic.flags & QMF_BLINK )
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1
BANDU4
CNSTU4 0
EQU4 $143
line 179
;179:	{
line 180
;180:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 181
;181:		style |= UI_BLINK;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 182
;182:	}
ADDRGP4 $144
JUMPV
LABELV $143
line 184
;183:	else
;184:		color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
LABELV $144
LABELV $142
LABELV $140
line 186
;185:
;186:	if ( focus )
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $145
line 187
;187:	{
line 189
;188:		// draw cursor
;189:		UI_FillRect( s->generic.left, s->generic.top, s->generic.right-s->generic.left+1, s->generic.bottom-s->generic.top+1, listbar_color ); 
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
line 190
;190:		UI_DrawChar( x, y, 13, UI_CENTER|UI_BLINK|UI_SMALLFONT, color);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTI4 4113
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 191
;191:	}
LABELV $145
line 193
;192:
;193:	UI_DrawString( x - SMALLCHAR_WIDTH, y, s->generic.name, style|UI_RIGHT, color );
ADDRLP4 4
INDIRI4
CNSTI4 8
SUBI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 194
;194:	if( !s->curvalue ) {
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 0
NEI4 $147
line 195
;195:		return;
ADDRGP4 $135
JUMPV
LABELV $147
line 197
;196:	}
;197:	UI_DrawHandlePic( x + SMALLCHAR_WIDTH, y - 4, 24, 24, s_preferences.crosshairShader[s->curvalue] );
ADDRLP4 4
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRLP4 32
CNSTF4 1103101952
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_preferences+800
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 198
;198:}
LABELV $135
endproc Crosshair_Draw 48 20
proc Preferences_MenuInit 8 12
line 201
;199:
;200:
;201:static void Preferences_MenuInit( void ) {
line 204
;202:	int				y;
;203:
;204:	memset( &s_preferences, 0 ,sizeof(preferences_t) );
ADDRGP4 s_preferences
ARGP4
CNSTI4 0
ARGI4
CNSTI4 840
ARGI4
ADDRGP4 memset
CALLP4
pop
line 206
;205:
;206:	Preferences_Cache();
ADDRGP4 Preferences_Cache
CALLV
pop
line 208
;207:
;208:	s_preferences.menu.wrapAround = qtrue;
ADDRGP4 s_preferences+276
CNSTI4 1
ASGNI4
line 209
;209:	s_preferences.menu.fullscreen = qtrue;
ADDRGP4 s_preferences+280
CNSTI4 1
ASGNI4
line 211
;210:
;211:	s_preferences.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_preferences+288
CNSTI4 10
ASGNI4
line 212
;212:	s_preferences.banner.generic.x	   = 320;
ADDRGP4 s_preferences+288+12
CNSTI4 320
ASGNI4
line 213
;213:	s_preferences.banner.generic.y	   = 16;
ADDRGP4 s_preferences+288+16
CNSTI4 16
ASGNI4
line 214
;214:	s_preferences.banner.string		   = "GALLERY OPTIONS";
ADDRGP4 s_preferences+288+60
ADDRGP4 $160
ASGNP4
line 215
;215:	s_preferences.banner.color         = color_white;
ADDRGP4 s_preferences+288+68
ADDRGP4 color_white
ASGNP4
line 216
;216:	s_preferences.banner.style         = UI_CENTER;
ADDRGP4 s_preferences+288+64
CNSTI4 1
ASGNI4
line 234
;217:/*
;218:	s_preferences.framel.generic.type  = MTYPE_BITMAP;
;219:	s_preferences.framel.generic.name  = ART_FRAMEL;
;220:	s_preferences.framel.generic.flags = QMF_INACTIVE;
;221:	s_preferences.framel.generic.x	   = 0;
;222:	s_preferences.framel.generic.y	   = 78;
;223:	s_preferences.framel.width  	   = 256;
;224:	s_preferences.framel.height  	   = 329;
;225:
;226:	s_preferences.framer.generic.type  = MTYPE_BITMAP;
;227:	s_preferences.framer.generic.name  = ART_FRAMER;
;228:	s_preferences.framer.generic.flags = QMF_INACTIVE;
;229:	s_preferences.framer.generic.x	   = 376;
;230:	s_preferences.framer.generic.y	   = 76;
;231:	s_preferences.framer.width  	   = 256;
;232:	s_preferences.framer.height  	   = 334;
;233:*/
;234:	y = 144;
ADDRLP4 0
CNSTI4 144
ASGNI4
line 235
;235:	s_preferences.crosshair.generic.type		= MTYPE_TEXT;
ADDRGP4 s_preferences+360
CNSTI4 7
ASGNI4
line 236
;236:	s_preferences.crosshair.generic.flags		= QMF_PULSEIFFOCUS|QMF_SMALLFONT|QMF_NODEFAULTINIT|QMF_OWNERDRAW;
ADDRGP4 s_preferences+360+44
CNSTU4 98562
ASGNU4
line 237
;237:	s_preferences.crosshair.generic.x			= PREFERENCES_X_POS;
ADDRGP4 s_preferences+360+12
CNSTI4 360
ASGNI4
line 238
;238:	s_preferences.crosshair.generic.y			= y;
ADDRGP4 s_preferences+360+16
ADDRLP4 0
INDIRI4
ASGNI4
line 239
;239:	s_preferences.crosshair.generic.name		= "Crosshair:";
ADDRGP4 s_preferences+360+4
ADDRGP4 $174
ASGNP4
line 240
;240:	s_preferences.crosshair.generic.callback	= Preferences_Event;
ADDRGP4 s_preferences+360+48
ADDRGP4 Preferences_Event
ASGNP4
line 241
;241:	s_preferences.crosshair.generic.ownerdraw	= Crosshair_Draw;
ADDRGP4 s_preferences+360+56
ADDRGP4 Crosshair_Draw
ASGNP4
line 242
;242:	s_preferences.crosshair.generic.id			= ID_CROSSHAIR;
ADDRGP4 s_preferences+360+8
CNSTI4 127
ASGNI4
line 243
;243:	s_preferences.crosshair.generic.top			= y - 4;
ADDRGP4 s_preferences+360+24
ADDRLP4 0
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 244
;244:	s_preferences.crosshair.generic.bottom		= y + 20;
ADDRGP4 s_preferences+360+32
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 245
;245:	s_preferences.crosshair.generic.left		= PREFERENCES_X_POS - ( ( strlen(s_preferences.crosshair.generic.name) + 1 ) * SMALLCHAR_WIDTH );
ADDRGP4 s_preferences+360+4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 s_preferences+360+20
CNSTI4 360
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 8
ADDI4
SUBI4
ASGNI4
line 246
;246:	s_preferences.crosshair.generic.right		= PREFERENCES_X_POS + 48;
ADDRGP4 s_preferences+360+28
CNSTI4 408
ASGNI4
line 257
;247:
;248://	y += BIGCHAR_HEIGHT+2+4;
;249://	s_preferences.simpleitems.generic.type        = MTYPE_RADIOBUTTON;
;250://	s_preferences.simpleitems.generic.name	      = "Simple Items:";
;251://	s_preferences.simpleitems.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;252://	s_preferences.simpleitems.generic.callback    = Preferences_Event;
;253://	s_preferences.simpleitems.generic.id          = ID_SIMPLEITEMS;
;254://	s_preferences.simpleitems.generic.x	          = PREFERENCES_X_POS;
;255://	s_preferences.simpleitems.generic.y	          = y;
;256:
;257:	y += BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 258
;258:	s_preferences.wallmarks.generic.type          = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+456
CNSTI4 5
ASGNI4
line 259
;259:	s_preferences.wallmarks.generic.name	      = "Marks on Walls:";
ADDRGP4 s_preferences+456+4
ADDRGP4 $194
ASGNP4
line 260
;260:	s_preferences.wallmarks.generic.flags	      = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+456+44
CNSTU4 258
ASGNU4
line 261
;261:	s_preferences.wallmarks.generic.callback      = Preferences_Event;
ADDRGP4 s_preferences+456+48
ADDRGP4 Preferences_Event
ASGNP4
line 262
;262:	s_preferences.wallmarks.generic.id            = ID_WALLMARKS;
ADDRGP4 s_preferences+456+8
CNSTI4 131
ASGNI4
line 263
;263:	s_preferences.wallmarks.generic.x	          = PREFERENCES_X_POS;
ADDRGP4 s_preferences+456+12
CNSTI4 360
ASGNI4
line 264
;264:	s_preferences.wallmarks.generic.y	          = y;
ADDRGP4 s_preferences+456+16
ADDRLP4 0
INDIRI4
ASGNI4
line 275
;265:
;266://	y += BIGCHAR_HEIGHT+2;
;267://	s_preferences.brass.generic.type              = MTYPE_RADIOBUTTON;
;268://	s_preferences.brass.generic.name	          = "Ejecting Brass:";
;269://	s_preferences.brass.generic.flags	          = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;270://	s_preferences.brass.generic.callback          = Preferences_Event;
;271://	s_preferences.brass.generic.id                = ID_EJECTINGBRASS;
;272://	s_preferences.brass.generic.x	              = PREFERENCES_X_POS;
;273://	s_preferences.brass.generic.y	              = y;
;274:
;275:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 276
;276:	s_preferences.dynamiclights.generic.type      = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+520
CNSTI4 5
ASGNI4
line 277
;277:	s_preferences.dynamiclights.generic.name	  = "Dynamic Lights:";
ADDRGP4 s_preferences+520+4
ADDRGP4 $208
ASGNP4
line 278
;278:	s_preferences.dynamiclights.generic.flags     = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+520+44
CNSTU4 258
ASGNU4
line 279
;279:	s_preferences.dynamiclights.generic.callback  = Preferences_Event;
ADDRGP4 s_preferences+520+48
ADDRGP4 Preferences_Event
ASGNP4
line 280
;280:	s_preferences.dynamiclights.generic.id        = ID_DYNAMICLIGHTS;
ADDRGP4 s_preferences+520+8
CNSTI4 132
ASGNI4
line 281
;281:	s_preferences.dynamiclights.generic.x	      = PREFERENCES_X_POS;
ADDRGP4 s_preferences+520+12
CNSTI4 360
ASGNI4
line 282
;282:	s_preferences.dynamiclights.generic.y	      = y;
ADDRGP4 s_preferences+520+16
ADDRLP4 0
INDIRI4
ASGNI4
line 293
;283:
;284://	y += BIGCHAR_HEIGHT+2;
;285://	s_preferences.identifytarget.generic.type     = MTYPE_RADIOBUTTON;
;286://	s_preferences.identifytarget.generic.name	  = "Identify Target:";
;287://	s_preferences.identifytarget.generic.flags    = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;288://	s_preferences.identifytarget.generic.callback = Preferences_Event;
;289://	s_preferences.identifytarget.generic.id       = ID_IDENTIFYTARGET;
;290://	s_preferences.identifytarget.generic.x	      = PREFERENCES_X_POS;
;291://	s_preferences.identifytarget.generic.y	      = y;
;292:
;293:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 294
;294:	s_preferences.highqualitysky.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+584
CNSTI4 5
ASGNI4
line 295
;295:	s_preferences.highqualitysky.generic.name	  = "High Quality Sky:";
ADDRGP4 s_preferences+584+4
ADDRGP4 $222
ASGNP4
line 296
;296:	s_preferences.highqualitysky.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+584+44
CNSTU4 258
ASGNU4
line 297
;297:	s_preferences.highqualitysky.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+584+48
ADDRGP4 Preferences_Event
ASGNP4
line 298
;298:	s_preferences.highqualitysky.generic.id       = ID_HIGHQUALITYSKY;
ADDRGP4 s_preferences+584+8
CNSTI4 129
ASGNI4
line 299
;299:	s_preferences.highqualitysky.generic.x	      = PREFERENCES_X_POS;
ADDRGP4 s_preferences+584+12
CNSTI4 360
ASGNI4
line 300
;300:	s_preferences.highqualitysky.generic.y	      = y;
ADDRGP4 s_preferences+584+16
ADDRLP4 0
INDIRI4
ASGNI4
line 302
;301:
;302:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 303
;303:	s_preferences.synceveryframe.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_preferences+648
CNSTI4 5
ASGNI4
line 304
;304:	s_preferences.synceveryframe.generic.name	  = "Sync Every Frame:";
ADDRGP4 s_preferences+648+4
ADDRGP4 $236
ASGNP4
line 305
;305:	s_preferences.synceveryframe.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
ADDRGP4 s_preferences+648+44
CNSTU4 258
ASGNU4
line 306
;306:	s_preferences.synceveryframe.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+648+48
ADDRGP4 Preferences_Event
ASGNP4
line 307
;307:	s_preferences.synceveryframe.generic.id       = ID_SYNCEVERYFRAME;
ADDRGP4 s_preferences+648+8
CNSTI4 134
ASGNI4
line 308
;308:	s_preferences.synceveryframe.generic.x	      = PREFERENCES_X_POS;
ADDRGP4 s_preferences+648+12
CNSTI4 360
ASGNI4
line 309
;309:	s_preferences.synceveryframe.generic.y	      = y;
ADDRGP4 s_preferences+648+16
ADDRLP4 0
INDIRI4
ASGNI4
line 339
;310:
;311://	y += BIGCHAR_HEIGHT+2;
;312://	s_preferences.forcemodel.generic.type     = MTYPE_RADIOBUTTON;
;313://	s_preferences.forcemodel.generic.name	  = "Force Player Models:";
;314://	s_preferences.forcemodel.generic.flags	  = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;315://	s_preferences.forcemodel.generic.callback = Preferences_Event;
;316://	s_preferences.forcemodel.generic.id       = ID_FORCEMODEL;
;317://	s_preferences.forcemodel.generic.x	      = PREFERENCES_X_POS;
;318://	s_preferences.forcemodel.generic.y	      = y;
;319:
;320://	y += BIGCHAR_HEIGHT+2;
;321://	s_preferences.allowdownload.generic.type     = MTYPE_RADIOBUTTON;
;322://	s_preferences.allowdownload.generic.name	   = "Automatic Downloading:";
;323://	s_preferences.allowdownload.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;324://	s_preferences.allowdownload.generic.callback = Preferences_Event;
;325://	s_preferences.allowdownload.generic.id       = ID_ALLOWDOWNLOAD;
;326://	s_preferences.allowdownload.generic.x	       = PREFERENCES_X_POS;
;327://	s_preferences.allowdownload.generic.y	       = y;
;328:	
;329://	y += BIGCHAR_HEIGHT+2;
;330://	s_preferences.drawteamoverlay.generic.type     = MTYPE_SPINCONTROL;
;331://	s_preferences.drawteamoverlay.generic.name	   = "Draw Team Overlay:";
;332://	s_preferences.drawteamoverlay.generic.flags	   = QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;333://	s_preferences.drawteamoverlay.generic.callback = Preferences_Event;
;334://	s_preferences.drawteamoverlay.generic.id       = ID_DRAWTEAMOVERLAY;
;335://	s_preferences.drawteamoverlay.generic.x	       = PREFERENCES_X_POS;
;336://	s_preferences.drawteamoverlay.generic.y	       = y;
;337://	s_preferences.drawteamoverlay.itemnames			= teamoverlay_names;
;338:
;339:	y += BIGCHAR_HEIGHT+2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 340
;340:	s_preferences.back.generic.type	    = MTYPE_BITMAP;
ADDRGP4 s_preferences+712
CNSTI4 6
ASGNI4
line 341
;341:	s_preferences.back.generic.name     = ART_BACK0;
ADDRGP4 s_preferences+712+4
ADDRGP4 $250
ASGNP4
line 342
;342:	s_preferences.back.generic.flags    = QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 s_preferences+712+44
CNSTU4 260
ASGNU4
line 343
;343:	s_preferences.back.generic.callback = Preferences_Event;
ADDRGP4 s_preferences+712+48
ADDRGP4 Preferences_Event
ASGNP4
line 344
;344:	s_preferences.back.generic.id	    = ID_BACK;
ADDRGP4 s_preferences+712+8
CNSTI4 138
ASGNI4
line 345
;345:	s_preferences.back.generic.x		= 0;
ADDRGP4 s_preferences+712+12
CNSTI4 0
ASGNI4
line 346
;346:	s_preferences.back.generic.y		= 480-64;
ADDRGP4 s_preferences+712+16
CNSTI4 416
ASGNI4
line 347
;347:	s_preferences.back.width  		    = 128;
ADDRGP4 s_preferences+712+76
CNSTI4 128
ASGNI4
line 348
;348:	s_preferences.back.height  		    = 64;
ADDRGP4 s_preferences+712+80
CNSTI4 64
ASGNI4
line 349
;349:	s_preferences.back.focuspic         = ART_BACK1;
ADDRGP4 s_preferences+712+60
ADDRGP4 $267
ASGNP4
line 351
;350:
;351:	Menu_AddItem( &s_preferences.menu, &s_preferences.banner );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 355
;352://	Menu_AddItem( &s_preferences.menu, &s_preferences.framel );
;353://	Menu_AddItem( &s_preferences.menu, &s_preferences.framer );
;354:
;355:	Menu_AddItem( &s_preferences.menu, &s_preferences.crosshair );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 357
;356://	Menu_AddItem( &s_preferences.menu, &s_preferences.simpleitems );
;357:	Menu_AddItem( &s_preferences.menu, &s_preferences.wallmarks );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 359
;358://	Menu_AddItem( &s_preferences.menu, &s_preferences.brass );
;359:	Menu_AddItem( &s_preferences.menu, &s_preferences.dynamiclights );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+520
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 361
;360://	Menu_AddItem( &s_preferences.menu, &s_preferences.identifytarget );
;361:	Menu_AddItem( &s_preferences.menu, &s_preferences.highqualitysky );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+584
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 362
;362:	Menu_AddItem( &s_preferences.menu, &s_preferences.synceveryframe );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+648
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 368
;363://	Menu_AddItem( &s_preferences.menu, &s_preferences.forcemodel );
;364://	Menu_AddItem( &s_preferences.menu, &s_preferences.allowdownload );
;365://	Menu_AddItem( &s_preferences.menu, &s_preferences.drawteamoverlay );
;366:
;367:
;368:	Menu_AddItem( &s_preferences.menu, &s_preferences.back );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 s_preferences+712
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 370
;369:
;370:	Preferences_SetMenuItems();
ADDRGP4 Preferences_SetMenuItems
CALLV
pop
line 371
;371:}
LABELV $150
endproc Preferences_MenuInit 8 12
export Preferences_Cache
proc Preferences_Cache 16 8
line 379
;372:
;373:
;374:/*
;375:===============
;376:Preferences_Cache
;377:===============
;378:*/
;379:void Preferences_Cache( void ) {
line 384
;380:	int		n;
;381:
;382://	trap_R_RegisterShaderNoMip( ART_FRAMEL );
;383://	trap_R_RegisterShaderNoMip( ART_FRAMER );
;384:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $250
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 385
;385:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $267
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 386
;386:	for( n = 0; n < NUM_CROSSHAIRS; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $276
line 387
;387:		s_preferences.crosshairShader[n] = trap_R_RegisterShaderNoMip( va("gfx/2d/crosshair%c", 'a' + n ) );
ADDRGP4 $281
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_preferences+800
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 388
;388:	}
LABELV $277
line 386
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $276
line 389
;389:}
LABELV $275
endproc Preferences_Cache 16 8
export UI_PreferencesMenu
proc UI_PreferencesMenu 0 4
line 397
;390:
;391:
;392:/*
;393:===============
;394:UI_PreferencesMenu
;395:===============
;396:*/
;397:void UI_PreferencesMenu( void ) {
line 398
;398:	Preferences_MenuInit();
ADDRGP4 Preferences_MenuInit
CALLV
pop
line 399
;399:	UI_PushMenu( &s_preferences.menu );
ADDRGP4 s_preferences
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 400
;400:}
LABELV $282
endproc UI_PreferencesMenu 0 4
bss
align 4
LABELV s_preferences
skip 840
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
LABELV $281
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
LABELV $267
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
LABELV $250
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
LABELV $236
byte 1 83
byte 1 121
byte 1 110
byte 1 99
byte 1 32
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 70
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $222
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 83
byte 1 107
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $208
byte 1 68
byte 1 121
byte 1 110
byte 1 97
byte 1 109
byte 1 105
byte 1 99
byte 1 32
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $194
byte 1 77
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 87
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $174
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $160
byte 1 71
byte 1 65
byte 1 76
byte 1 76
byte 1 69
byte 1 82
byte 1 89
byte 1 32
byte 1 79
byte 1 80
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $96
byte 1 114
byte 1 95
byte 1 102
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $90
byte 1 114
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 115
byte 1 107
byte 1 121
byte 1 0
align 1
LABELV $84
byte 1 114
byte 1 95
byte 1 100
byte 1 121
byte 1 110
byte 1 97
byte 1 109
byte 1 105
byte 1 99
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $78
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
LABELV $75
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
LABELV $71
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $70
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $69
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $68
byte 1 111
byte 1 102
byte 1 102
byte 1 0
