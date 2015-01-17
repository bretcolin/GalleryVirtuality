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
} poemsmenu_t;

static poemsmenu_t	s_poems;

int starttime; // game time at which credits are started
float mvolume; // records the original music volume level, as we will
               // modify it for the credits

// change this to change the background colour on credits
vec4_t color_back	        = {0.00, 0.00, 0.00, 0.00};
// these are just example colours that are used in credits[] 
vec4_t color_htext			= {0.52, 0.23, 0.08, 1.00};
// 
vec4_t color_mtext			= {1.00, 1.00, 1.00, 1.00};

qhandle_t	BackgroundShader; // definition of the background shader pointer

typedef struct
{
	char *string;
	int style;
	vec4_t *colour;
} cr_line;

cr_line poems[] = { // edit this as necessary for your poems	

{ "The Place We Go", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "A place we meet", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "In the hour of sleep", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "A daytime dream", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "We see the world", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "and what we sold", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "Silver and gold", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "As we really are", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "Without a scar", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "without the tar", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "A place we go", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "When things are slow", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "Dancing in the snow", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "The place we go", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "is where we meet", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "deep in a daytime sleep", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_mtext },
{ "", UI_CENTER|UI_SMALLFONT, &color_blue },
{ "Poem by Bret C. Sheppard", UI_CENTER|UI_BIGFONT|UI_PULSE, &color_htext },
{ "Poems Music By", UI_CENTER|UI_SMALLFONT, &color_htext },
{ "James Sanger", UI_CENTER|UI_SMALLFONT, &color_mtext },

  {NULL}
};
/*
=================
UI_PoemsMenu_Key
=================
*/
static sfxHandle_t UI_PoemsMenu_Key( int key ) {
	menucommon_s	*item;

	item = Menu_ItemAtCursor( &s_poems.menu );

	return Menu_DefaultKey( &s_poems.menu, key );
}

/*
=================
Poems_Draw
This is the main drawing function for the credits. 
Most of the code is self-explanatory.
=================
*/
static void Poems_Draw(void)
{
  int x = 320, y, n, ysize = 0, fadetime = 0;
  vec4_t fadecolour = { 0.00, 0.00, 0.00, 0.00 };

  // ysize is used to determine the entire length 
  // of the credits in pixels. 
  // We can then use this in further calculations
  if(!ysize) // ysize not calculated, so calculate it dammit!
  {
    // loop through entire credits array
    for(n = 0; n <= sizeof(poems) - 1; n++) 
    {
      // it is a small character
      if(poems[n].style & UI_SMALLFONT) 
      {
        // add small character height
        ysize += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
        
      // it is a big character
      }else if(poems[n].style & UI_BIGFONT) 
      {
        // add big character size
        ysize += PROP_HEIGHT;
        
      // it is a huge character
      }else if(poems[n].style & UI_GIANTFONT) 
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
    UI_FillRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, color_back);
#endif

  // let's draw the stuff
  // set initial y location
  y = 480 - SCROLLSPEED * (float)(uis.realtime - starttime) / 100;
  
  // loop through the entire credits sequence
  for(n = 0; n <= sizeof(poems) - 1; n++)
  {
    // this NULL string marks the end of the credits struct
    if(poems[n].string == NULL) 
    {
      if(y < -16) // credits sequence is completely off screen
      {
        trap_Cmd_ExecuteText( EXEC_APPEND, 
                         va("s_musicvolume %f; quit\n", mvolume));
        break; // end of credits
      }
      break;
    }
		
    if( strlen(poems[n].string) == 1) // spacer string, no need to draw
      continue;

    if( y > -(PROP_HEIGHT * (1 / PROP_SMALL_SIZE_SCALE))) 
      // the line is within the visible range of the screen
      UI_DrawProportionalString(x, y, poems[n].string, 
                                poems[n].style, *poems[n].colour );
		
    // re-adjust y for next line
    if(poems[n].style & UI_SMALLFONT)
    {
      y += PROP_HEIGHT * PROP_SMALL_SIZE_SCALE;
    }else if(poems[n].style & UI_BIGFONT)
    {
      y += PROP_HEIGHT;
    }else if(poems[n].style & UI_GIANTFONT)
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
UI_PoemsMenu
===============
*/
void UI_PoemsMenu( void ) {
	memset( &s_poems, 0 ,sizeof(s_poems) );

	s_poems.menu.draw = Poems_Draw;
	s_poems.menu.key = UI_PoemsMenu_Key;
	s_poems.menu.fullscreen = qtrue;
	UI_PushMenu ( &s_poems.menu );

	starttime = uis.realtime; // record start time for credits to scroll properly
	mvolume = trap_Cvar_VariableValue( "s_musicvolume" );
	if(mvolume < 0.5)
		trap_Cmd_ExecuteText( EXEC_APPEND, "s_musicvolume 0.5\n" );
	trap_Cmd_ExecuteText( EXEC_APPEND, "music music/fla22k_02\n" );

	// load the background shader
#ifdef BACKGROUND_SHADER
	BackgroundShader = 
	  trap_R_RegisterShaderNoMip("*YOURSHADER_HERE*");
#endif
}