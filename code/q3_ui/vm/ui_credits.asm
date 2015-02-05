data
export color_background
align 4
LABELV color_background
byte 4 0
byte 4 0
byte 4 0
byte 4 0
export color_headertext
align 4
LABELV color_headertext
byte 4 1057300152
byte 4 1047233823
byte 4 1034147594
byte 4 1065353216
export color_maintext
align 4
LABELV color_maintext
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export credits
align 4
LABELV credits
address $69
byte 4 16417
address color_headertext
address $70
byte 4 17
address color_headertext
address $71
byte 4 17
address color_blue
address $72
byte 4 17
address color_headertext
address $73
byte 4 17
address color_maintext
address $71
byte 4 17
address color_blue
address $74
byte 4 17
address color_maintext
address $75
byte 4 17
address color_maintext
address $71
byte 4 17
address color_blue
address $71
byte 4 17
address color_blue
address $76
byte 4 17
address color_headertext
address $77
byte 4 17
address color_maintext
address $71
byte 4 17
address color_blue
address $71
byte 4 17
address color_blue
address $78
byte 4 17
address color_headertext
address $79
byte 4 17
address color_maintext
address $71
byte 4 17
address color_blue
address $71
byte 4 17
address color_blue
address $80
byte 4 17
address color_headertext
address $77
byte 4 17
address color_maintext
address $71
byte 4 17
address color_blue
address $71
byte 4 17
address color_blue
address $81
byte 4 17
address color_headertext
address $82
byte 4 17
address color_maintext
address $71
byte 4 17
address color_blue
address $71
byte 4 17
address color_blue
address $83
byte 4 17
address color_headertext
address $84
byte 4 17
address color_maintext
address $85
byte 4 17
address color_maintext
address $71
byte 4 17
address color_blue
address $86
byte 4 17
address color_maintext
address $87
byte 4 17
address color_headertext
address $71
byte 4 17
address color_blue
address $82
byte 4 17
address color_maintext
address $88
byte 4 17
address color_maintext
byte 4 0
skip 8
code
proc UI_CreditMenu_Key 4 8
file "../ui_credits.c"
line 84
;1:// INCLUDE FILES
;2:#include "ui_local.h"
;3:
;4:// CONSTANT DEFINITIONS
;5:
;6:#define SCROLLSPEED	2.00 // The scrolling speed in pixels per second.
;7:                          // modify as appropriate for our credits
;8:// #define BACKGROUND_SHADER 
;9:// uncomment this to use a background shader, otherwise a solid color
;10:// defined in the vec4_t "color_background" is filled to the screen
;11:                            
;12:// STRUCTURES
;13:
;14:typedef struct {
;15:	menuframework_s	menu;
;16:} creditsmenu_t;
;17:
;18:static creditsmenu_t	s_credits;
;19:
;20:int starttime; // game time at which credits are started
;21:float mvolume; // records the original music volume level, as we will
;22:               // modify it for the credits
;23:
;24:// change this to change the background colour on credits
;25:vec4_t color_background	        = {0.00, 0.00, 0.00, 0.00};
;26:// these are just example colours that are used in credits[] 
;27:vec4_t color_headertext			= {0.52, 0.23, 0.08, 1.00};
;28:vec4_t color_maintext			= {1.00, 1.00, 1.00, 1.00};
;29:
;30:qhandle_t	BackgroundShader; // definition of the background shader pointer
;31:
;32:typedef struct
;33:{
;34:	char *string;
;35:	int style;
;36:	vec4_t *colour;
;37:} cr_line;
;38:
;39:cr_line credits[] = { // edit this as necessary for your credits
;40:	
;41:{ "Gallery Virtuality", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_headertext },
;42:{ "Designed by Bret C. Sheppard", UI_CENTER|UI_SMALLFONT, &color_headertext },
;43:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;44:{ "Special Thanks To:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;45:{ "Andre Miripolsky", UI_CENTER|UI_SMALLFONT, &color_maintext },
;46:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;47:{ "Code 3 Arena", UI_CENTER|UI_SMALLFONT, &color_maintext },
;48:{ "Justin Thyme: Clean Quake 3 project", UI_CENTER|UI_SMALLFONT, &color_maintext },
;49:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;50:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;51:{ "Programming:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;52:{ "Bret C. Sheppard", UI_CENTER|UI_SMALLFONT, &color_maintext },
;53:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;54:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;55:{ "Art:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;56:{ "You,Me, Everyone", UI_CENTER|UI_SMALLFONT, &color_maintext },
;57:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;58:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;59:{ "3D Designer:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;60:{ "Bret C. Sheppard", UI_CENTER|UI_SMALLFONT, &color_maintext },
;61:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;62:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;63:{ "Director of Community Development:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;64:{ "Karen Christine Patrick", UI_CENTER|UI_SMALLFONT, &color_maintext },
;65:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;66:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;67:{ "Credits Music By", UI_CENTER|UI_SMALLFONT, &color_headertext },
;68:{ "James Sanger", UI_CENTER|UI_SMALLFONT, &color_maintext },
;69:{ "What if We Become", UI_CENTER|UI_SMALLFONT, &color_maintext },
;70:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;71:{ "10dens: Michael Geelen & Jurriën Voetberg", UI_CENTER|UI_SMALLFONT, &color_maintext },
;72:{ "Alone on the Moon", UI_CENTER|UI_SMALLFONT, &color_headertext },
;73:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;74:{ "Karen Christine Patrick", UI_CENTER|UI_SMALLFONT, &color_maintext },
;75:{ "Classical Brick", UI_CENTER|UI_SMALLFONT, &color_maintext },
;76:
;77:  {NULL}
;78:};
;79:/*
;80:=================
;81:UI_CreditMenu_Key
;82:=================
;83:*/
;84:static sfxHandle_t UI_CreditMenu_Key( int key ) {
line 85
;85:	if( key & K_CHAR_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $90
line 86
;86:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $89
JUMPV
LABELV $90
line 92
;87:	}
;88:
;89:	// pressing the escape key or clicking the mouse will exit
;90:	// we also reset the music volume to the user's original
;91:	// choice here,  by setting s_musicvolume to the stored var
;92:	trap_Cmd_ExecuteText( EXEC_APPEND, 
ADDRGP4 $92
ARGP4
ADDRGP4 mvolume
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 94
;93:                         va("s_musicvolume %f; quit\n", mvolume));
;94:	return 0;
CNSTI4 0
RETI4
LABELV $89
endproc UI_CreditMenu_Key 4 8
lit
align 4
LABELV $94
byte 4 0
byte 4 0
byte 4 0
byte 4 0
code
proc ScrollingCredits_Draw 48 20
line 105
;95:}
;96:
;97:/*
;98:=================
;99:ScrollingCredits_Draw
;100:This is the main drawing function for the credits. 
;101:Most of the code is self-explanatory.
;102:=================
;103:*/
;104:static void ScrollingCredits_Draw(void)
;105:{
line 106
;106:  int x = 320, y, n, ysize = 0, fadetime = 0;
ADDRLP4 12
CNSTI4 320
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 107
;107:  vec4_t fadecolour = { 0.00, 0.00, 0.00, 0.00 };
ADDRLP4 20
ADDRGP4 $94
INDIRB
ASGNB 16
line 112
;108:
;109:  // ysize is used to determine the entire length 
;110:  // of the credits in pixels. 
;111:  // We can then use this in further calculations
;112:  if(!ysize) // ysize not calculated, so calculate it dammit!
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $95
line 113
;113:  {
line 115
;114:    // loop through entire credits array
;115:    for(n = 0; n <= sizeof(credits) - 1; n++) 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $100
JUMPV
LABELV $97
line 116
;116:    {
line 118
;117:      // it is a small character
;118:      if(credits[n].style & UI_SMALLFONT) 
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits+4
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $101
line 119
;119:      {
line 121
;120:        // add small character height
;121:        ysize += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 124
;122:        
;123:      // it is a big character
;124:      }else if(credits[n].style & UI_BIGFONT) 
ADDRGP4 $102
JUMPV
LABELV $101
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits+4
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $104
line 125
;125:      {
line 127
;126:        // add big character size
;127:        ysize += PROP_HEIGHT;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 130
;128:        
;129:      // it is a huge character
;130:      }else if(credits[n].style & UI_GIANTFONT) 
ADDRGP4 $105
JUMPV
LABELV $104
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits+4
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $107
line 131
;131:      {
line 133
;132:        // add giant character size.
;133:        ysize += PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE); 
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1108344832
ADDF4
CVFI4 4
ASGNI4
line 134
;134:      }
LABELV $107
LABELV $105
LABELV $102
line 135
;135:    }
LABELV $98
line 115
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $100
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 431
LEU4 $97
line 136
;136:  }
LABELV $95
line 145
;137:
;138:  // first, fill the background with the specified colour/shader
;139:  // we are drawing a shader
;140:#ifdef BACKGROUND_SHADER 
;141:    UI_DrawHandlePic(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, BackgroundShader);
;142:  
;143:  // we are just filling a color
;144:#else 
;145:    UI_FillRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, color_background);
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
CNSTF4 1142947840
ARGF4
CNSTF4 1139802112
ARGF4
ADDRGP4 color_background
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 150
;146:#endif
;147:
;148:  // let's draw the stuff
;149:  // set initial y location
;150:  y = 480 - SCROLLSPEED * (float)(uis.realtime - starttime) / 100;
ADDRLP4 4
CNSTF4 1139802112
CNSTF4 1073741824
ADDRGP4 uis+4
INDIRI4
ADDRGP4 starttime
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1120403456
DIVF4
SUBF4
CVFI4 4
ASGNI4
line 153
;151:  
;152:  // loop through the entire credits sequence
;153:  for(n = 0; n <= sizeof(credits) - 1; n++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $114
JUMPV
LABELV $111
line 154
;154:  {
line 156
;155:    // this NULL string marks the end of the credits struct
;156:    if(credits[n].string == NULL) 
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $115
line 157
;157:    {
line 158
;158:      if(y < -16) // credits sequence is completely off screen
ADDRLP4 4
INDIRI4
CNSTI4 -16
GEI4 $113
line 159
;159:      {
line 160
;160:        trap_Cmd_ExecuteText( EXEC_APPEND, 
ADDRGP4 $92
ARGP4
ADDRGP4 mvolume
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 162
;161:                         va("s_musicvolume %f; quit\n", mvolume));
;162:        break; // end of credits
ADDRGP4 $113
JUMPV
line 164
;163:      }
;164:      break;
LABELV $115
line 167
;165:    }
;166:		
;167:    if( strlen(credits[n].string) == 1) // spacer string, no need to draw
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
NEI4 $119
line 168
;168:      continue;
ADDRGP4 $112
JUMPV
LABELV $119
line 170
;169:
;170:    if( y > -(PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE))) 
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 3255828480
LEF4 $121
line 172
;171:      // the line is within the visible range of the screen
;172:      UI_DrawProportionalString(x, y, credits[n].string, 
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 44
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 credits
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
INDIRI4
ADDRGP4 credits+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ADDRGP4 credits+8
ADDP4
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
LABELV $121
line 176
;173:                                credits[n].style, *credits[n].colour );
;174:		
;175:    // re-adjust y for next line
;176:    if(credits[n].style & UI_SMALLFONT)
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits+4
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $125
line 177
;177:    {
line 178
;178:      y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 179
;179:    }else if(credits[n].style & UI_BIGFONT)
ADDRGP4 $126
JUMPV
LABELV $125
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits+4
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $128
line 180
;180:    {
line 181
;181:      y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 182
;182:    }else if(credits[n].style & UI_GIANTFONT)
ADDRGP4 $129
JUMPV
LABELV $128
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits+4
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $131
line 183
;183:    {
line 184
;184:      y += PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE);
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1108344832
ADDF4
CVFI4 4
ASGNI4
line 185
;185:    }
LABELV $131
LABELV $129
LABELV $126
line 188
;186:
;187:    // if y is off the screen, break out of loop
;188:    if (y > 480)
ADDRLP4 4
INDIRI4
CNSTI4 480
LEI4 $134
line 189
;189:    break;
ADDRGP4 $113
JUMPV
LABELV $134
line 190
;190:  }
LABELV $112
line 153
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $114
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 431
LEU4 $111
LABELV $113
line 191
;191:}
LABELV $93
endproc ScrollingCredits_Draw 48 20
export UI_CreditMenu
proc UI_CreditMenu 4 12
line 198
;192:
;193:/*
;194:===============
;195:UI_CreditMenu
;196:===============
;197:*/
;198:void UI_CreditMenu( void ) {
line 199
;199:	memset( &s_credits, 0 ,sizeof(s_credits) );
ADDRGP4 s_credits
ARGP4
CNSTI4 0
ARGI4
CNSTI4 288
ARGI4
ADDRGP4 memset
CALLP4
pop
line 201
;200:
;201:	s_credits.menu.draw = ScrollingCredits_Draw;
ADDRGP4 s_credits+268
ADDRGP4 ScrollingCredits_Draw
ASGNP4
line 202
;202:	s_credits.menu.key = UI_CreditMenu_Key;
ADDRGP4 s_credits+272
ADDRGP4 UI_CreditMenu_Key
ASGNP4
line 203
;203:	s_credits.menu.fullscreen = qtrue;
ADDRGP4 s_credits+280
CNSTI4 1
ASGNI4
line 204
;204:	UI_PushMenu ( &s_credits.menu );
ADDRGP4 s_credits
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 206
;205:
;206:	starttime = uis.realtime; // record start time for credits to scroll properly
ADDRGP4 starttime
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 207
;207:	mvolume = trap_Cvar_VariableValue( "s_musicvolume" );
ADDRGP4 $141
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 mvolume
ADDRLP4 0
INDIRF4
ASGNF4
line 208
;208:	if(mvolume < 0.5)
ADDRGP4 mvolume
INDIRF4
CNSTF4 1056964608
GEF4 $142
line 209
;209:		trap_Cmd_ExecuteText( EXEC_APPEND, "s_musicvolume 0.5\n" );
CNSTI4 2
ARGI4
ADDRGP4 $144
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
LABELV $142
line 210
;210:	trap_Cmd_ExecuteText( EXEC_APPEND, "music music/james\n" );
CNSTI4 2
ARGI4
ADDRGP4 $145
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 217
;211:
;212:	// load the background shader
;213:#ifdef BACKGROUND_SHADER
;214:	BackgroundShader = 
;215:	  trap_R_RegisterShaderNoMip("*YOURSHADER_HERE*");
;216:#endif
;217:}
LABELV $136
endproc UI_CreditMenu 4 12
bss
export BackgroundShader
align 4
LABELV BackgroundShader
skip 4
export mvolume
align 4
LABELV mvolume
skip 4
export starttime
align 4
LABELV starttime
skip 4
align 4
LABELV s_credits
skip 288
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
LABELV $145
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 106
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $144
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
byte 1 32
byte 1 48
byte 1 46
byte 1 53
byte 1 10
byte 1 0
align 1
LABELV $141
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
LABELV $92
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
byte 1 32
byte 1 37
byte 1 102
byte 1 59
byte 1 32
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $88
byte 1 67
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 66
byte 1 114
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $87
byte 1 65
byte 1 108
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 77
byte 1 111
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $86
byte 1 49
byte 1 48
byte 1 100
byte 1 101
byte 1 110
byte 1 115
byte 1 58
byte 1 32
byte 1 77
byte 1 105
byte 1 99
byte 1 104
byte 1 97
byte 1 101
byte 1 108
byte 1 32
byte 1 71
byte 1 101
byte 1 101
byte 1 108
byte 1 101
byte 1 110
byte 1 32
byte 1 38
byte 1 32
byte 1 74
byte 1 117
byte 1 114
byte 1 114
byte 1 105
byte 1 235
byte 1 110
byte 1 32
byte 1 86
byte 1 111
byte 1 101
byte 1 116
byte 1 98
byte 1 101
byte 1 114
byte 1 103
byte 1 0
align 1
LABELV $85
byte 1 87
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 87
byte 1 101
byte 1 32
byte 1 66
byte 1 101
byte 1 99
byte 1 111
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $84
byte 1 74
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 83
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $83
byte 1 67
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 77
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 66
byte 1 121
byte 1 0
align 1
LABELV $82
byte 1 75
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 32
byte 1 67
byte 1 104
byte 1 114
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 80
byte 1 97
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $81
byte 1 68
byte 1 105
byte 1 114
byte 1 101
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 68
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $80
byte 1 51
byte 1 68
byte 1 32
byte 1 68
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $79
byte 1 89
byte 1 111
byte 1 117
byte 1 44
byte 1 77
byte 1 101
byte 1 44
byte 1 32
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
LABELV $78
byte 1 65
byte 1 114
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $77
byte 1 66
byte 1 114
byte 1 101
byte 1 116
byte 1 32
byte 1 67
byte 1 46
byte 1 32
byte 1 83
byte 1 104
byte 1 101
byte 1 112
byte 1 112
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $76
byte 1 80
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 97
byte 1 109
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $75
byte 1 74
byte 1 117
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 32
byte 1 84
byte 1 104
byte 1 121
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 67
byte 1 108
byte 1 101
byte 1 97
byte 1 110
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 51
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $74
byte 1 67
byte 1 111
byte 1 100
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
LABELV $73
byte 1 65
byte 1 110
byte 1 100
byte 1 114
byte 1 101
byte 1 32
byte 1 77
byte 1 105
byte 1 114
byte 1 105
byte 1 112
byte 1 111
byte 1 108
byte 1 115
byte 1 107
byte 1 121
byte 1 0
align 1
LABELV $72
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 32
byte 1 84
byte 1 104
byte 1 97
byte 1 110
byte 1 107
byte 1 115
byte 1 32
byte 1 84
byte 1 111
byte 1 58
byte 1 0
align 1
LABELV $71
byte 1 0
align 1
LABELV $70
byte 1 68
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 66
byte 1 114
byte 1 101
byte 1 116
byte 1 32
byte 1 67
byte 1 46
byte 1 32
byte 1 83
byte 1 104
byte 1 101
byte 1 112
byte 1 112
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $69
byte 1 71
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 86
byte 1 105
byte 1 114
byte 1 116
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
