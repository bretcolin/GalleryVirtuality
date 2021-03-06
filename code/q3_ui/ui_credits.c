// INCLUDE FILES
#include "ui_local.h"

// CONSTANT DEFINITIONS

#define SCROLLSPEED	2.00 // The scrolling speed in pixels per second.
                          // modify as appropriate for our credits
// #define BACKGROUND_SHADER 
// uncomment this to use a background shader, otherwise a solid color
// defined in the vec4_t "color_background" is filled to the screen
                            
// STRUCTURES

typedef struct {
	menuframework_s	menu;
} creditsmenu_t;

static creditsmenu_t	s_credits;

int starttime; // game time at which credits are started
float mvolume; // records the original music volume level, as we will
               // modify it for the credits

// change this to change the background colour on credits
vec4_t color_background	        = {0.00, 0.00, 0.00, 0.00};
// these are just example colours that are used in credits[] 
vec4_t color_headertext			= {0.52, 0.23, 0.08, 1.00};
vec4_t color_maintext			= {1.00, 1.00, 1.00, 1.00};

qhandle_t	BackgroundShader; // definition of the background shader pointer

typedef struct
{
	char *string;
	int style;
	vec4_t *colour;
} cr_line;

cr_line credits[] = { // edit this as necessary for your credits
	
{ "Gallery Virtuality", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_headertext },
{ "Designed by Bret C. Sheppard", UI_CENTER|UI_SMALLFONT, &color_headertext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "Special Thanks To:", UI_CENTER|UI_SMALLFONT, &color_headertext },
{ "Andre Miripolsky", UI_CENTER|UI_SMALLFONT, &color_maintext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "Code 3 Arena", UI_CENTER|UI_SMALLFONT, &color_maintext },
{ "Justin Thyme: Clean Quake 3 project", UI_CENTER|UI_SMALLFONT, &color_maintext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "Programming:", UI_CENTER|UI_SMALLFONT, &color_headertext },
{ "Bret C. Sheppard", UI_CENTER|UI_SMALLFONT, &color_maintext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "Art:", UI_CENTER|UI_SMALLFONT, &color_headertext },
{ "You,Me, Everyone", UI_CENTER|UI_SMALLFONT, &color_maintext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "3D Designer:", UI_CENTER|UI_SMALLFONT, &color_headertext },
{ "Bret C. Sheppard", UI_CENTER|UI_SMALLFONT, &color_maintext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "Director of Community Development:", UI_CENTER|UI_SMALLFONT, &color_headertext },
{ "Karen Christine Patrick", UI_CENTER|UI_SMALLFONT, &color_maintext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "Credits Music By", UI_CENTER|UI_SMALLFONT, &color_headertext },
{ "James Sanger", UI_CENTER|UI_SMALLFONT, &color_maintext },
{ "What if We Become", UI_CENTER|UI_SMALLFONT, &color_maintext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "10dens: Michael Geelen & Jurri�n Voetberg", UI_CENTER|UI_SMALLFONT, &color_maintext },
{ "Alone on the Moon", UI_CENTER|UI_SMALLFONT, &color_headertext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "Karen Christine Patrick", UI_CENTER|UI_SMALLFONT, &color_maintext },
{ "Classical Brick", UI_CENTER|UI_SMALLFONT, &color_maintext },

  {NULL}
};
/*
=================
UI_CreditMenu_Key
=================
*/
static sfxHandle_t UI_CreditMenu_Key( int key ) {
	if( key & K_CHAR_FLAG ) {
		return 0;
	}

	// pressing the escape key or clicking the mouse will exit
	// we also reset the music volume to the user's original
	// choice here,  by setting s_musicvolume to the stored var
	trap_Cmd_ExecuteText( EXEC_APPEND, 
                         va("s_musicvolume %f; quit\n", mvolume));
	return 0;
}

/*
=================
ScrollingCredits_Draw
This is the main drawing function for the credits. 
Most of the code is self-explanatory.
=================
*/
static void ScrollingCredits_Draw(void)
{
  int x = 320, y, n, ysize = 0, fadetime = 0;
  vec4_t fadecolour = { 0.00, 0.00, 0.00, 0.00 };

  // ysize is used to determine the entire length 
  // of the credits in pixels. 
  // We can then use this in further calculations
  if(!ysize) // ysize not calculated, so calculate it dammit!
  {
    // loop through entire credits array
    for(n = 0; n <= sizeof(credits) - 1; n++) 
    {
      // it is a small character
      if(credits[n].style & UI_SMALLFONT) 
      {
        // add small character height
        ysize += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
        
      // it is a big character
      }else if(credits[n].style & UI_BIGFONT) 
      {
        // add big character size
        ysize += PROP_HEIGHT;
        
      // it is a huge character
      }else if(credits[n].style & UI_GIANTFONT) 
      {
        // add giant character size.
        ysize += PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE); 
      }
    }
  }

  // first, fill the background with the specified colour/shader
  // we are drawing a shader
#ifdef BACKGROUND_SHADER 
    UI_DrawHandlePic(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, BackgroundShader);
  
  // we are just filling a color
#else 
    UI_FillRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, color_background);
#endif

  // let's draw the stuff
  // set initial y location
  y = 480 - SCROLLSPEED * (float)(uis.realtime - starttime) / 100;
  
  // loop through the entire credits sequence
  for(n = 0; n <= sizeof(credits) - 1; n++)
  {
    // this NULL string marks the end of the credits struct
    if(credits[n].string == NULL) 
    {
      if(y < -16) // credits sequence is completely off screen
      {
        trap_Cmd_ExecuteText( EXEC_APPEND, 
                         va("s_musicvolume %f; quit\n", mvolume));
        break; // end of credits
      }
      break;
    }
		
    if( strlen(credits[n].string) == 1) // spacer string, no need to draw
      continue;

    if( y > -(PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE))) 
      // the line is within the visible range of the screen
      UI_DrawProportionalString(x, y, credits[n].string, 
                                credits[n].style, *credits[n].colour );
		
    // re-adjust y for next line
    if(credits[n].style & UI_SMALLFONT)
    {
      y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
    }else if(credits[n].style & UI_BIGFONT)
    {
      y += PROP_HEIGHT;
    }else if(credits[n].style & UI_GIANTFONT)
    {
      y += PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE);
    }

    // if y is off the screen, break out of loop
    if (y > 480)
    break;
  }
}

/*
===============
UI_CreditMenu
===============
*/
void UI_CreditMenu( void ) {
	memset( &s_credits, 0 ,sizeof(s_credits) );

	s_credits.menu.draw = ScrollingCredits_Draw;
	s_credits.menu.key = UI_CreditMenu_Key;
	s_credits.menu.fullscreen = qtrue;
	UI_PushMenu ( &s_credits.menu );

	starttime = uis.realtime; // record start time for credits to scroll properly
	mvolume = trap_Cvar_VariableValue( "s_musicvolume" );
	if(mvolume < 0.5)
		trap_Cmd_ExecuteText( EXEC_APPEND, "s_musicvolume 0.5\n" );
	trap_Cmd_ExecuteText( EXEC_APPEND, "music music/james\n" );

	// load the background shader
#ifdef BACKGROUND_SHADER
	BackgroundShader = 
	  trap_R_RegisterShaderNoMip("*YOURSHADER_HERE*");
#endif
}
