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
byte 4 0
skip 8
code
proc UI_CreditMenu_Key 4 8
file "../ui_credits.c"
line 76
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
;45:{ "ID Software", UI_CENTER|UI_SMALLFONT, &color_maintext },
;46:{ "Code 3 Arena", UI_CENTER|UI_SMALLFONT, &color_maintext },
;47:{ "Justin Thyme: Clean Quake 3 project", UI_CENTER|UI_SMALLFONT, &color_maintext },
;48:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;49:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;50:{ "Programming:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;51:{ "Bret C. Sheppard", UI_CENTER|UI_SMALLFONT, &color_maintext },
;52:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;53:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;54:{ "Art:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;55:{ "You,Me, Everyone", UI_CENTER|UI_SMALLFONT, &color_maintext },
;56:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;57:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;58:{ "3D Designer:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;59:{ "Bret C. Sheppard", UI_CENTER|UI_SMALLFONT, &color_maintext },
;60:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;61:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;62:{ "Director of Community Development:", UI_CENTER|UI_SMALLFONT, &color_headertext },
;63:{ "Karen Christine Patrick", UI_CENTER|UI_SMALLFONT, &color_maintext },
;64:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;65:{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
;66:{ "Credits Music By", UI_CENTER|UI_SMALLFONT, &color_headertext },
;67:{ "James Sanger", UI_CENTER|UI_SMALLFONT, &color_maintext },
;68:
;69:  {NULL}
;70:};
;71:/*
;72:=================
;73:UI_CreditMenu_Key
;74:=================
;75:*/
;76:static sfxHandle_t UI_CreditMenu_Key( int key ) {
line 77
;77:	if( key & K_CHAR_FLAG ) {
ADDRFP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $86
line 78
;78:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $85
JUMPV
LABELV $86
line 84
;79:	}
;80:
;81:	// pressing the escape key or clicking the mouse will exit
;82:	// we also reset the music volume to the user's original
;83:	// choice here,  by setting s_musicvolume to the stored var
;84:	trap_Cmd_ExecuteText( EXEC_APPEND, 
ADDRGP4 $88
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
line 86
;85:                         va("s_musicvolume %f; quit\n", mvolume));
;86:	return 0;
CNSTI4 0
RETI4
LABELV $85
endproc UI_CreditMenu_Key 4 8
lit
align 4
LABELV $90
byte 4 0
byte 4 0
byte 4 0
byte 4 0
code
proc ScrollingCredits_Draw 48 20
line 97
;87:}
;88:
;89:/*
;90:=================
;91:ScrollingCredits_Draw
;92:This is the main drawing function for the credits. 
;93:Most of the code is self-explanatory.
;94:=================
;95:*/
;96:static void ScrollingCredits_Draw(void)
;97:{
line 98
;98:  int x = 320, y, n, ysize = 0, fadetime = 0;
ADDRLP4 12
CNSTI4 320
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 99
;99:  vec4_t fadecolour = { 0.00, 0.00, 0.00, 0.00 };
ADDRLP4 20
ADDRGP4 $90
INDIRB
ASGNB 16
line 104
;100:
;101:  // ysize is used to determine the entire length 
;102:  // of the credits in pixels. 
;103:  // We can then use this in further calculations
;104:  if(!ysize) // ysize not calculated, so calculate it dammit!
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $91
line 105
;105:  {
line 107
;106:    // loop through entire credits array
;107:    for(n = 0; n <= sizeof(credits) - 1; n++) 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $96
JUMPV
LABELV $93
line 108
;108:    {
line 110
;109:      // it is a small character
;110:      if(credits[n].style & UI_SMALLFONT) 
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
EQI4 $97
line 111
;111:      {
line 113
;112:        // add small character height
;113:        ysize += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 116
;114:        
;115:      // it is a big character
;116:      }else if(credits[n].style & UI_BIGFONT) 
ADDRGP4 $98
JUMPV
LABELV $97
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
EQI4 $100
line 117
;117:      {
line 119
;118:        // add big character size
;119:        ysize += PROP_HEIGHT;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 122
;120:        
;121:      // it is a huge character
;122:      }else if(credits[n].style & UI_GIANTFONT) 
ADDRGP4 $101
JUMPV
LABELV $100
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
EQI4 $103
line 123
;123:      {
line 125
;124:        // add giant character size.
;125:        ysize += PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE); 
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1108344832
ADDF4
CVFI4 4
ASGNI4
line 126
;126:      }
LABELV $103
LABELV $101
LABELV $98
line 127
;127:    }
LABELV $94
line 107
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $96
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 335
LEU4 $93
line 128
;128:  }
LABELV $91
line 137
;129:
;130:  // first, fill the background with the specified colour/shader
;131:  // we are drawing a shader
;132:#ifdef BACKGROUND_SHADER 
;133:    UI_DrawHandlePic(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, BackgroundShader);
;134:  
;135:  // we are just filling a color
;136:#else 
;137:    UI_FillRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, color_background);
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
line 142
;138:#endif
;139:
;140:  // let's draw the stuff
;141:  // set initial y location
;142:  y = 480 - SCROLLSPEED * (float)(uis.realtime - starttime) / 100;
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
line 145
;143:  
;144:  // loop through the entire credits sequence
;145:  for(n = 0; n <= sizeof(credits) - 1; n++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $110
JUMPV
LABELV $107
line 146
;146:  {
line 148
;147:    // this NULL string marks the end of the credits struct
;148:    if(credits[n].string == NULL) 
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 credits
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $111
line 149
;149:    {
line 150
;150:      if(y < -16) // credits sequence is completely off screen
ADDRLP4 4
INDIRI4
CNSTI4 -16
GEI4 $109
line 151
;151:      {
line 152
;152:        trap_Cmd_ExecuteText( EXEC_APPEND, 
ADDRGP4 $88
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
line 154
;153:                         va("s_musicvolume %f; quit\n", mvolume));
;154:        break; // end of credits
ADDRGP4 $109
JUMPV
line 156
;155:      }
;156:      break;
LABELV $111
line 159
;157:    }
;158:		
;159:    if( strlen(credits[n].string) == 1) // spacer string, no need to draw
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
NEI4 $115
line 160
;160:      continue;
ADDRGP4 $108
JUMPV
LABELV $115
line 162
;161:
;162:    if( y > -(PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE))) 
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 3255828480
LEF4 $117
line 164
;163:      // the line is within the visible range of the screen
;164:      UI_DrawProportionalString(x, y, credits[n].string, 
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
LABELV $117
line 168
;165:                                credits[n].style, *credits[n].colour );
;166:		
;167:    // re-adjust y for next line
;168:    if(credits[n].style & UI_SMALLFONT)
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
EQI4 $121
line 169
;169:    {
line 170
;170:      y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1101135872
ADDF4
CVFI4 4
ASGNI4
line 171
;171:    }else if(credits[n].style & UI_BIGFONT)
ADDRGP4 $122
JUMPV
LABELV $121
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
EQI4 $124
line 172
;172:    {
line 173
;173:      y += PROP_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 174
;174:    }else if(credits[n].style & UI_GIANTFONT)
ADDRGP4 $125
JUMPV
LABELV $124
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
EQI4 $127
line 175
;175:    {
line 176
;176:      y += PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE);
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1108344832
ADDF4
CVFI4 4
ASGNI4
line 177
;177:    }
LABELV $127
LABELV $125
LABELV $122
line 180
;178:
;179:    // if y is off the screen, break out of loop
;180:    if (y > 480)
ADDRLP4 4
INDIRI4
CNSTI4 480
LEI4 $130
line 181
;181:    break;
ADDRGP4 $109
JUMPV
LABELV $130
line 182
;182:  }
LABELV $108
line 145
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $110
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 335
LEU4 $107
LABELV $109
line 183
;183:}
LABELV $89
endproc ScrollingCredits_Draw 48 20
export UI_CreditMenu
proc UI_CreditMenu 4 12
line 190
;184:
;185:/*
;186:===============
;187:UI_CreditMenu
;188:===============
;189:*/
;190:void UI_CreditMenu( void ) {
line 191
;191:	memset( &s_credits, 0 ,sizeof(s_credits) );
ADDRGP4 s_credits
ARGP4
CNSTI4 0
ARGI4
CNSTI4 288
ARGI4
ADDRGP4 memset
CALLP4
pop
line 193
;192:
;193:	s_credits.menu.draw = ScrollingCredits_Draw;
ADDRGP4 s_credits+268
ADDRGP4 ScrollingCredits_Draw
ASGNP4
line 194
;194:	s_credits.menu.key = UI_CreditMenu_Key;
ADDRGP4 s_credits+272
ADDRGP4 UI_CreditMenu_Key
ASGNP4
line 195
;195:	s_credits.menu.fullscreen = qtrue;
ADDRGP4 s_credits+280
CNSTI4 1
ASGNI4
line 196
;196:	UI_PushMenu ( &s_credits.menu );
ADDRGP4 s_credits
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 198
;197:
;198:	starttime = uis.realtime; // record start time for credits to scroll properly
ADDRGP4 starttime
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 199
;199:	mvolume = trap_Cvar_VariableValue( "s_musicvolume" );
ADDRGP4 $137
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 mvolume
ADDRLP4 0
INDIRF4
ASGNF4
line 200
;200:	if(mvolume < 0.5)
ADDRGP4 mvolume
INDIRF4
CNSTF4 1056964608
GEF4 $138
line 201
;201:		trap_Cmd_ExecuteText( EXEC_APPEND, "s_musicvolume 0.5\n" );
CNSTI4 2
ARGI4
ADDRGP4 $140
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
LABELV $138
line 202
;202:	trap_Cmd_ExecuteText( EXEC_APPEND, "music music/fla22k_02\n" );
CNSTI4 2
ARGI4
ADDRGP4 $141
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 209
;203:
;204:	// load the background shader
;205:#ifdef BACKGROUND_SHADER
;206:	BackgroundShader = 
;207:	  trap_R_RegisterShaderNoMip("*YOURSHADER_HERE*");
;208:#endif
;209:}様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様
LABELV $132
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
LABELV $141
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
byte 1 102
byte 1 108
byte 1 97
byte 1 50
byte 1 50
byte 1 107
byte 1 95
byte 1 48
byte 1 50
byte 1 10
byte 1 0
align 1
LABELV $140
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
LABELV $137
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
LABELV $88
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
byte 1 73
byte 1 68
byte 1 32
byte 1 83
byte 1 111
byte 1 102
byte 1 116
byte 1 119
byte 1 97
byte 1 114
byte 1 101
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
