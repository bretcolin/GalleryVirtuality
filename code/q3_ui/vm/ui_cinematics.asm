data
align 4
LABELV cinematics
address $68
address $69
code
proc UI_CinematicsMenu_BackEvent 0 0
file "../ui_cinematics.c"
line 64
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:
;6:#define ART_BACK0		"menu/art/back_0"
;7:#define ART_BACK1		"menu/art/back_1"	
;8:#define ART_FRAMEL		"menu/art/frame2_l"
;9:#define ART_FRAMER		"menu/art/frame1_r"
;10:
;11:#define VERTICAL_SPACING	30
;12:
;13:#define ID_BACK			10
;14:#define ID_CIN_IDLOGO	11
;15:#define ID_CIN_INTRO	12
;16://#define ID_CIN_TIER1	13
;17://#define ID_CIN_TIER2	14
;18://#define ID_CIN_TIER3	15
;19://#define ID_CIN_TIER4	16
;20://#define ID_CIN_TIER5	17
;21://#define ID_CIN_TIER6	18
;22://#define ID_CIN_TIER7	19
;23:#define ID_CIN_END		20
;24:
;25:
;26:typedef struct {
;27:	menuframework_s	menu;
;28:	menutext_s		banner;
;29:	menubitmap_s	framel;
;30:	menubitmap_s	framer;
;31:	menutext_s		cin_idlogo;
;32:	menutext_s		cin_intro;
;33://	menutext_s		cin_tier1;
;34://	menutext_s		cin_tier2;
;35://	menutext_s		cin_tier3;
;36://	menutext_s		cin_tier4;
;37://	menutext_s		cin_tier5;
;38://	menutext_s		cin_tier6;
;39://	menutext_s		cin_tier7;
;40://	menutext_s		cin_end;
;41:	menubitmap_s	back;
;42:} cinematicsMenuInfo_t;
;43:
;44:static cinematicsMenuInfo_t	cinematicsMenuInfo;
;45:
;46:static char *cinematics[] = {
;47:	"idlogo",
;48:	"intro",
;49://	"tier1",
;50://	"tier2",
;51://	"tier3",
;52://	"tier4",
;53://	"tier5",
;54://	"tier6",
;55://	"tier7",
;56://	"end"
;57:};
;58:
;59:/*
;60:===============
;61:UI_CinematicsMenu_BackEvent
;62:===============
;63:*/
;64:static void UI_CinematicsMenu_BackEvent( void *ptr, int event ) {
line 65
;65:	if( event != QM_ACTIVATED ) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $71
line 66
;66:		return;
ADDRGP4 $70
JUMPV
LABELV $71
line 68
;67:	}
;68:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 69
;69:}
LABELV $70
endproc UI_CinematicsMenu_BackEvent 0 0
proc UI_CinematicsMenu_Event 12 8
line 77
;70:
;71:
;72:/*
;73:===============
;74:UI_CinematicsMenu_Event
;75:===============
;76:*/
;77:static void UI_CinematicsMenu_Event( void *ptr, int event ) {
line 80
;78:	int		n;
;79:
;80:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $74
line 81
;81:		return;
ADDRGP4 $73
JUMPV
LABELV $74
line 83
;82:
;83:	n = ((menucommon_s*)ptr)->id - ID_CIN_IDLOGO;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 11
SUBI4
ASGNI4
line 84
;84:	trap_Cvar_Set( "nextmap", va( "ui_cinematics %i", n ) );
ADDRGP4 $77
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $76
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 85
;85:	if( uis.demoversion && ((menucommon_s*)ptr)->id == ID_CIN_END ) {
ADDRGP4 uis+11440
INDIRI4
CNSTI4 0
EQI4 $78
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 20
NEI4 $78
line 86
;86:		trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect; cinematic demoEnd.RoQ 1\n" );
CNSTI4 2
ARGI4
ADDRGP4 $81
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 87
;87:	}
ADDRGP4 $79
JUMPV
LABELV $78
line 88
;88:	else {
line 89
;89:		trap_Cmd_ExecuteText( EXEC_APPEND, va( "disconnect; cinematic %s.RoQ\n", cinematics[n] ) );
ADDRGP4 $82
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cinematics
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 90
;90:	}
LABELV $79
line 91
;91:}
LABELV $73
endproc UI_CinematicsMenu_Event 12 8
proc UI_CinematicsMenu_Init 8 12
line 99
;92:
;93:
;94:/*
;95:===============
;96:UI_CinematicsMenu_Init
;97:===============
;98:*/
;99:static void UI_CinematicsMenu_Init( void ) {
line 102
;100:	int		y;
;101:
;102:	UI_CinematicsMenu_Cache();
ADDRGP4 UI_CinematicsMenu_Cache
CALLV
pop
line 104
;103:
;104:	memset( &cinematicsMenuInfo, 0, sizeof(cinematicsMenuInfo) );
ADDRGP4 cinematicsMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 768
ARGI4
ADDRGP4 memset
CALLP4
pop
line 105
;105:	cinematicsMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 cinematicsMenuInfo+280
CNSTI4 1
ASGNI4
line 107
;106:
;107:	cinematicsMenuInfo.banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 cinematicsMenuInfo+288
CNSTI4 10
ASGNI4
line 108
;108:	cinematicsMenuInfo.banner.generic.x			= 320;
ADDRGP4 cinematicsMenuInfo+288+12
CNSTI4 320
ASGNI4
line 109
;109:	cinematicsMenuInfo.banner.generic.y			= 16;
ADDRGP4 cinematicsMenuInfo+288+16
CNSTI4 16
ASGNI4
line 110
;110:	cinematicsMenuInfo.banner.string			= "CINEMATICS";
ADDRGP4 cinematicsMenuInfo+288+60
ADDRGP4 $92
ASGNP4
line 111
;111:	cinematicsMenuInfo.banner.color				= color_white;
ADDRGP4 cinematicsMenuInfo+288+68
ADDRGP4 color_white
ASGNP4
line 112
;112:	cinematicsMenuInfo.banner.style				= UI_CENTER;
ADDRGP4 cinematicsMenuInfo+288+64
CNSTI4 1
ASGNI4
line 114
;113:
;114:	cinematicsMenuInfo.framel.generic.type		= MTYPE_BITMAP;
ADDRGP4 cinematicsMenuInfo+360
CNSTI4 6
ASGNI4
line 115
;115:	cinematicsMenuInfo.framel.generic.name		= ART_FRAMEL;
ADDRGP4 cinematicsMenuInfo+360+4
ADDRGP4 $100
ASGNP4
line 116
;116:	cinematicsMenuInfo.framel.generic.flags		= QMF_INACTIVE;
ADDRGP4 cinematicsMenuInfo+360+44
CNSTU4 16384
ASGNU4
line 117
;117:	cinematicsMenuInfo.framel.generic.x			= 0;  
ADDRGP4 cinematicsMenuInfo+360+12
CNSTI4 0
ASGNI4
line 118
;118:	cinematicsMenuInfo.framel.generic.y			= 78;
ADDRGP4 cinematicsMenuInfo+360+16
CNSTI4 78
ASGNI4
line 119
;119:	cinematicsMenuInfo.framel.width  			= 256;
ADDRGP4 cinematicsMenuInfo+360+76
CNSTI4 256
ASGNI4
line 120
;120:	cinematicsMenuInfo.framel.height  			= 329;
ADDRGP4 cinematicsMenuInfo+360+80
CNSTI4 329
ASGNI4
line 122
;121:
;122:	cinematicsMenuInfo.framer.generic.type		= MTYPE_BITMAP;
ADDRGP4 cinematicsMenuInfo+448
CNSTI4 6
ASGNI4
line 123
;123:	cinematicsMenuInfo.framer.generic.name		= ART_FRAMER;
ADDRGP4 cinematicsMenuInfo+448+4
ADDRGP4 $114
ASGNP4
line 124
;124:	cinematicsMenuInfo.framer.generic.flags		= QMF_INACTIVE;
ADDRGP4 cinematicsMenuInfo+448+44
CNSTU4 16384
ASGNU4
line 125
;125:	cinematicsMenuInfo.framer.generic.x			= 376;
ADDRGP4 cinematicsMenuInfo+448+12
CNSTI4 376
ASGNI4
line 126
;126:	cinematicsMenuInfo.framer.generic.y			= 76;
ADDRGP4 cinematicsMenuInfo+448+16
CNSTI4 76
ASGNI4
line 127
;127:	cinematicsMenuInfo.framer.width  			= 256;
ADDRGP4 cinematicsMenuInfo+448+76
CNSTI4 256
ASGNI4
line 128
;128:	cinematicsMenuInfo.framer.height  			= 334;
ADDRGP4 cinematicsMenuInfo+448+80
CNSTI4 334
ASGNI4
line 130
;129:
;130:	y = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 131
;131:	cinematicsMenuInfo.cin_idlogo.generic.type		= MTYPE_PTEXT;
ADDRGP4 cinematicsMenuInfo+536
CNSTI4 9
ASGNI4
line 132
;132:	cinematicsMenuInfo.cin_idlogo.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cinematicsMenuInfo+536+44
CNSTU4 264
ASGNU4
line 133
;133:	cinematicsMenuInfo.cin_idlogo.generic.x			= 320;
ADDRGP4 cinematicsMenuInfo+536+12
CNSTI4 320
ASGNI4
line 134
;134:	cinematicsMenuInfo.cin_idlogo.generic.y			= y;
ADDRGP4 cinematicsMenuInfo+536+16
ADDRLP4 0
INDIRI4
ASGNI4
line 135
;135:	cinematicsMenuInfo.cin_idlogo.generic.id		= ID_CIN_IDLOGO;
ADDRGP4 cinematicsMenuInfo+536+8
CNSTI4 11
ASGNI4
line 136
;136:	cinematicsMenuInfo.cin_idlogo.generic.callback	= UI_CinematicsMenu_Event; 
ADDRGP4 cinematicsMenuInfo+536+48
ADDRGP4 UI_CinematicsMenu_Event
ASGNP4
line 137
;137:	cinematicsMenuInfo.cin_idlogo.string			= "GALLERY LOGO";
ADDRGP4 cinematicsMenuInfo+536+60
ADDRGP4 $138
ASGNP4
line 138
;138:	cinematicsMenuInfo.cin_idlogo.color				= color_yellow;
ADDRGP4 cinematicsMenuInfo+536+68
ADDRGP4 color_yellow
ASGNP4
line 139
;139:	cinematicsMenuInfo.cin_idlogo.style				= UI_CENTER;
ADDRGP4 cinematicsMenuInfo+536+64
CNSTI4 1
ASGNI4
line 141
;140:
;141:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 30
ADDI4
ASGNI4
line 142
;142:	cinematicsMenuInfo.cin_intro.generic.type		= MTYPE_PTEXT;
ADDRGP4 cinematicsMenuInfo+608
CNSTI4 9
ASGNI4
line 143
;143:	cinematicsMenuInfo.cin_intro.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cinematicsMenuInfo+608+44
CNSTU4 264
ASGNU4
line 144
;144:	cinematicsMenuInfo.cin_intro.generic.x			= 320;
ADDRGP4 cinematicsMenuInfo+608+12
CNSTI4 320
ASGNI4
line 145
;145:	cinematicsMenuInfo.cin_intro.generic.y			= y;
ADDRGP4 cinematicsMenuInfo+608+16
ADDRLP4 0
INDIRI4
ASGNI4
line 146
;146:	cinematicsMenuInfo.cin_intro.generic.id			= ID_CIN_INTRO;
ADDRGP4 cinematicsMenuInfo+608+8
CNSTI4 12
ASGNI4
line 147
;147:	cinematicsMenuInfo.cin_intro.generic.callback	= UI_CinematicsMenu_Event; 
ADDRGP4 cinematicsMenuInfo+608+48
ADDRGP4 UI_CinematicsMenu_Event
ASGNP4
line 148
;148:	cinematicsMenuInfo.cin_intro.string				= "INTRO";
ADDRGP4 cinematicsMenuInfo+608+60
ADDRGP4 $156
ASGNP4
line 149
;149:	cinematicsMenuInfo.cin_intro.color				= color_yellow;
ADDRGP4 cinematicsMenuInfo+608+68
ADDRGP4 color_yellow
ASGNP4
line 150
;150:	cinematicsMenuInfo.cin_intro.style				= UI_CENTER;
ADDRGP4 cinematicsMenuInfo+608+64
CNSTI4 1
ASGNI4
line 151
;151:	if( uis.demoversion ) {
ADDRGP4 uis+11440
INDIRI4
CNSTI4 0
EQI4 $161
line 152
;152:		cinematicsMenuInfo.cin_intro.generic.flags |= QMF_GRAYED;
ADDRLP4 4
ADDRGP4 cinematicsMenuInfo+608+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 153
;153:	}
LABELV $161
line 268
;154:/*
;155:	y += VERTICAL_SPACING;
;156:	cinematicsMenuInfo.cin_tier1.generic.type		= MTYPE_PTEXT;
;157:	cinematicsMenuInfo.cin_tier1.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;158:	cinematicsMenuInfo.cin_tier1.generic.x			= 320;
;159:	cinematicsMenuInfo.cin_tier1.generic.y			= y;
;160:	cinematicsMenuInfo.cin_tier1.generic.id			= ID_CIN_TIER1;
;161:	cinematicsMenuInfo.cin_tier1.generic.callback	= UI_CinematicsMenu_Event; 
;162:	cinematicsMenuInfo.cin_tier1.string				= "Tier 1";
;163:	cinematicsMenuInfo.cin_tier1.color				= color_red;
;164:	cinematicsMenuInfo.cin_tier1.style				= UI_CENTER;
;165:	if( !UI_CanShowTierVideo( 1 ) ) {
;166:		cinematicsMenuInfo.cin_tier1.generic.flags |= QMF_GRAYED;
;167:	}
;168:
;169:	y += VERTICAL_SPACING;
;170:	cinematicsMenuInfo.cin_tier2.generic.type		= MTYPE_PTEXT;
;171:	cinematicsMenuInfo.cin_tier2.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;172:	cinematicsMenuInfo.cin_tier2.generic.x			= 320;
;173:	cinematicsMenuInfo.cin_tier2.generic.y			= y;
;174:	cinematicsMenuInfo.cin_tier2.generic.id			= ID_CIN_TIER2;
;175:	cinematicsMenuInfo.cin_tier2.generic.callback	= UI_CinematicsMenu_Event; 
;176:	cinematicsMenuInfo.cin_tier2.string				= "Tier 2";
;177:	cinematicsMenuInfo.cin_tier2.color				= color_red;
;178:	cinematicsMenuInfo.cin_tier2.style				= UI_CENTER;
;179:	if( !UI_CanShowTierVideo( 2 ) ) {
;180:		cinematicsMenuInfo.cin_tier2.generic.flags |= QMF_GRAYED;
;181:	}
;182:
;183:	y += VERTICAL_SPACING;
;184:	cinematicsMenuInfo.cin_tier3.generic.type		= MTYPE_PTEXT;
;185:	cinematicsMenuInfo.cin_tier3.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;186:	cinematicsMenuInfo.cin_tier3.generic.x			= 320;
;187:	cinematicsMenuInfo.cin_tier3.generic.y			= y;
;188:	cinematicsMenuInfo.cin_tier3.generic.id			= ID_CIN_TIER3;
;189:	cinematicsMenuInfo.cin_tier3.generic.callback	= UI_CinematicsMenu_Event; 
;190:	cinematicsMenuInfo.cin_tier3.string				= "Tier 3";
;191:	cinematicsMenuInfo.cin_tier3.color				= color_red;
;192:	cinematicsMenuInfo.cin_tier3.style				= UI_CENTER;
;193:	if( !UI_CanShowTierVideo( 3 ) ) {
;194:		cinematicsMenuInfo.cin_tier3.generic.flags |= QMF_GRAYED;
;195:	}
;196:
;197:	y += VERTICAL_SPACING;
;198:	cinematicsMenuInfo.cin_tier4.generic.type		= MTYPE_PTEXT;
;199:	cinematicsMenuInfo.cin_tier4.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;200:	cinematicsMenuInfo.cin_tier4.generic.x			= 320;
;201:	cinematicsMenuInfo.cin_tier4.generic.y			= y;
;202:	cinematicsMenuInfo.cin_tier4.generic.id			= ID_CIN_TIER4;
;203:	cinematicsMenuInfo.cin_tier4.generic.callback	= UI_CinematicsMenu_Event; 
;204:	cinematicsMenuInfo.cin_tier4.string				= "Tier 4";
;205:	cinematicsMenuInfo.cin_tier4.color				= color_red;
;206:	cinematicsMenuInfo.cin_tier4.style				= UI_CENTER;
;207:	if( !UI_CanShowTierVideo( 4 ) ) {
;208:		cinematicsMenuInfo.cin_tier4.generic.flags |= QMF_GRAYED;
;209:	}
;210:
;211:	y += VERTICAL_SPACING;
;212:	cinematicsMenuInfo.cin_tier5.generic.type		= MTYPE_PTEXT;
;213:	cinematicsMenuInfo.cin_tier5.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;214:	cinematicsMenuInfo.cin_tier5.generic.x			= 320;
;215:	cinematicsMenuInfo.cin_tier5.generic.y			= y;
;216:	cinematicsMenuInfo.cin_tier5.generic.id			= ID_CIN_TIER5;
;217:	cinematicsMenuInfo.cin_tier5.generic.callback	= UI_CinematicsMenu_Event; 
;218:	cinematicsMenuInfo.cin_tier5.string				= "Tier 5";
;219:	cinematicsMenuInfo.cin_tier5.color				= color_red;
;220:	cinematicsMenuInfo.cin_tier5.style				= UI_CENTER;
;221:	if( !UI_CanShowTierVideo( 5 ) ) {
;222:		cinematicsMenuInfo.cin_tier5.generic.flags |= QMF_GRAYED;
;223:	}
;224:
;225:	y += VERTICAL_SPACING;
;226:	cinematicsMenuInfo.cin_tier6.generic.type		= MTYPE_PTEXT;
;227:	cinematicsMenuInfo.cin_tier6.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;228:	cinematicsMenuInfo.cin_tier6.generic.x			= 320;
;229:	cinematicsMenuInfo.cin_tier6.generic.y			= y;
;230:	cinematicsMenuInfo.cin_tier6.generic.id			= ID_CIN_TIER6;
;231:	cinematicsMenuInfo.cin_tier6.generic.callback	= UI_CinematicsMenu_Event; 
;232:	cinematicsMenuInfo.cin_tier6.string				= "Tier 6";
;233:	cinematicsMenuInfo.cin_tier6.color				= color_red;
;234:	cinematicsMenuInfo.cin_tier6.style				= UI_CENTER;
;235:	if( !UI_CanShowTierVideo( 6 ) ) {
;236:		cinematicsMenuInfo.cin_tier6.generic.flags |= QMF_GRAYED;
;237:	}
;238:
;239:	y += VERTICAL_SPACING;
;240:	cinematicsMenuInfo.cin_tier7.generic.type		= MTYPE_PTEXT;
;241:	cinematicsMenuInfo.cin_tier7.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;242:	cinematicsMenuInfo.cin_tier7.generic.x			= 320;
;243:	cinematicsMenuInfo.cin_tier7.generic.y			= y;
;244:	cinematicsMenuInfo.cin_tier7.generic.id			= ID_CIN_TIER7;
;245:	cinematicsMenuInfo.cin_tier7.generic.callback	= UI_CinematicsMenu_Event; 
;246:	cinematicsMenuInfo.cin_tier7.string				= "Tier 7";
;247:	cinematicsMenuInfo.cin_tier7.color				= color_red;
;248:	cinematicsMenuInfo.cin_tier7.style				= UI_CENTER;
;249:	if( !UI_CanShowTierVideo( 7 ) ) {
;250:		cinematicsMenuInfo.cin_tier7.generic.flags |= QMF_GRAYED;
;251:	}
;252:
;253:	y += VERTICAL_SPACING;
;254:	cinematicsMenuInfo.cin_end.generic.type			= MTYPE_PTEXT;
;255:	cinematicsMenuInfo.cin_end.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;256:	cinematicsMenuInfo.cin_end.generic.x			= 320;
;257:	cinematicsMenuInfo.cin_end.generic.y			= y;
;258:	cinematicsMenuInfo.cin_end.generic.id			= ID_CIN_END;
;259:	cinematicsMenuInfo.cin_end.generic.callback		= UI_CinematicsMenu_Event; 
;260:	cinematicsMenuInfo.cin_end.string				= "END";
;261:	cinematicsMenuInfo.cin_end.color				= color_red;
;262:	cinematicsMenuInfo.cin_end.style				= UI_CENTER;
;263:	if( !UI_CanShowTierVideo( 8 ) ) {
;264:		cinematicsMenuInfo.cin_end.generic.flags |= QMF_GRAYED;
;265:	}
;266:/*
;267:*/
;268:	cinematicsMenuInfo.back.generic.type		= MTYPE_BITMAP;
ADDRGP4 cinematicsMenuInfo+680
CNSTI4 6
ASGNI4
line 269
;269:	cinematicsMenuInfo.back.generic.name		= ART_BACK0;
ADDRGP4 cinematicsMenuInfo+680+4
ADDRGP4 $169
ASGNP4
line 270
;270:	cinematicsMenuInfo.back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 cinematicsMenuInfo+680+44
CNSTU4 260
ASGNU4
line 271
;271:	cinematicsMenuInfo.back.generic.id			= ID_BACK;
ADDRGP4 cinematicsMenuInfo+680+8
CNSTI4 10
ASGNI4
line 272
;272:	cinematicsMenuInfo.back.generic.callback	= UI_CinematicsMenu_BackEvent;
ADDRGP4 cinematicsMenuInfo+680+48
ADDRGP4 UI_CinematicsMenu_BackEvent
ASGNP4
line 273
;273:	cinematicsMenuInfo.back.generic.x			= 0;
ADDRGP4 cinematicsMenuInfo+680+12
CNSTI4 0
ASGNI4
line 274
;274:	cinematicsMenuInfo.back.generic.y			= 480-64;
ADDRGP4 cinematicsMenuInfo+680+16
CNSTI4 416
ASGNI4
line 275
;275:	cinematicsMenuInfo.back.width				= 128;
ADDRGP4 cinematicsMenuInfo+680+76
CNSTI4 128
ASGNI4
line 276
;276:	cinematicsMenuInfo.back.height				= 64;
ADDRGP4 cinematicsMenuInfo+680+80
CNSTI4 64
ASGNI4
line 277
;277:	cinematicsMenuInfo.back.focuspic			= ART_BACK1;
ADDRGP4 cinematicsMenuInfo+680+60
ADDRGP4 $186
ASGNP4
line 279
;278:
;279:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.banner );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 280
;280:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.framel );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+360
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 281
;281:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.framer );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+448
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 282
;282:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_idlogo );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+536
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 283
;283:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_intro );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+608
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 292
;284://	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_tier1 );
;285://	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_tier2 );
;286://	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_tier3 );
;287://	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_tier4 );
;288://	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_tier5 );
;289://	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_tier6 );
;290://	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_tier7 );
;291://	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.cin_end );
;292:	Menu_AddItem( &cinematicsMenuInfo.menu, &cinematicsMenuInfo.back );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 cinematicsMenuInfo+680
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 293
;293:}
LABELV $83
endproc UI_CinematicsMenu_Init 8 12
export UI_CinematicsMenu_Cache
proc UI_CinematicsMenu_Cache 0 4
line 301
;294:
;295:
;296:/*
;297:=================
;298:UI_CinematicsMenu_Cache
;299:=================
;300:*/
;301:void UI_CinematicsMenu_Cache( void ) {
line 302
;302:	trap_R_RegisterShaderNoMip( ART_BACK0 );
ADDRGP4 $169
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 303
;303:	trap_R_RegisterShaderNoMip( ART_BACK1 );
ADDRGP4 $186
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 304
;304:	trap_R_RegisterShaderNoMip( ART_FRAMEL );
ADDRGP4 $100
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 305
;305:	trap_R_RegisterShaderNoMip( ART_FRAMER );
ADDRGP4 $114
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 306
;306:}
LABELV $193
endproc UI_CinematicsMenu_Cache 0 4
export UI_CinematicsMenu
proc UI_CinematicsMenu 0 4
line 314
;307:
;308:
;309:/*
;310:===============
;311:UI_CinematicsMenu
;312:===============
;313:*/
;314:void UI_CinematicsMenu( void ) {
line 315
;315:	UI_CinematicsMenu_Init();
ADDRGP4 UI_CinematicsMenu_Init
CALLV
pop
line 316
;316:	UI_PushMenu( &cinematicsMenuInfo.menu );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 317
;317:}
LABELV $194
endproc UI_CinematicsMenu 0 4
export UI_CinematicsMenu_f
proc UI_CinematicsMenu_f 12 8
line 325
;318:
;319:
;320:/*
;321:===============
;322:UI_CinematicsMenu_f
;323:===============
;324:*/
;325:void UI_CinematicsMenu_f( void ) {
line 328
;326:	int		n;
;327:
;328:	n = atoi( UI_Argv( 1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 329
;329:	UI_CinematicsMenu();
ADDRGP4 UI_CinematicsMenu
CALLV
pop
line 330
;330:	Menu_SetCursorToItem( &cinematicsMenuInfo.menu, cinematicsMenuInfo.menu.items[n + 3] );
ADDRGP4 cinematicsMenuInfo
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cinematicsMenuInfo+12+12
ADDP4
INDIRP4
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 331
;331:}
LABELV $195
endproc UI_CinematicsMenu_f 12 8
bss
align 4
LABELV cinematicsMenuInfo
skip 768
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
LABELV $186
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
LABELV $169
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
LABELV $156
byte 1 73
byte 1 78
byte 1 84
byte 1 82
byte 1 79
byte 1 0
align 1
LABELV $138
byte 1 71
byte 1 65
byte 1 76
byte 1 76
byte 1 69
byte 1 82
byte 1 89
byte 1 32
byte 1 76
byte 1 79
byte 1 71
byte 1 79
byte 1 0
align 1
LABELV $114
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
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $100
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
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 50
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $92
byte 1 67
byte 1 73
byte 1 78
byte 1 69
byte 1 77
byte 1 65
byte 1 84
byte 1 73
byte 1 67
byte 1 83
byte 1 0
align 1
LABELV $82
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
byte 1 59
byte 1 32
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
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $81
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
byte 1 59
byte 1 32
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
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 69
byte 1 110
byte 1 100
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 32
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $77
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $76
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $69
byte 1 105
byte 1 110
byte 1 116
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $68
byte 1 105
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 111
byte 1 0
