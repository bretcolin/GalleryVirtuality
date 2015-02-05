Gallery Virtuality
by Bret C. Sheppard
bretcolin@gmail.com            
						
based on Quake 3:Arena source 			
by id Software				        
						
							
-----------------------------				
Overview						
-----------------------------				  


With the release of the Quake 3 Arena engine source code, id Software has continued it's tradition of releasing source code to their legacy games.

The sole purpose of this project is to remove weapons in the code base which others may use as a starting point for their own projects.  As such, there will be major changes other than what is essential in fixing existing bugs.  Additionally, any non-essential files have been removed from this engine/game code distribution, such as LCC, Q3ASM and Splines.  These aren't likely to see a lot of modification.

The utility source code will be maintained and distributed seperately, but will continue to be fully compatible with GTK radiant versions. The source will be changed enough to be considered an entire rewrite since weapons are highly integrated normally - taking them out makes this a streamlined game engine with the intention focused on artists using this as a tool to craft their own 3d gallery or to use directly for elaborate illustration or space design.

This code base will be updated often and will be excellent for mod makers. I will not fix whats not broke and will utilize the rendering engine to the max. Improvements will be made that will not be processor intensive. Keeping this version lightweight is important because of how much rendering will normally be done in maps and BSP files.

This package includes both source code and binarys, with the game code being DLL's.  If you desire to work with the QVM's, you can use the tools provided with the original game source code release by id Software to compile them.

Check the ToDo list and Known Bugs below for a list of planned features/changes and known issues.


-----------------------------
Contact Info
-----------------------------

Bret C. Sheppard, LEAD DESIGNER (bretcolin AT gmail DOT com)
bretcolin@gmail.com

Karen C. Patrick, COMMUNITY DEVELOPMENT (kcpatricktexas AT gmail DOT com)
kcpatricktexas@gmail.com

Development system:

Pentium RD CPU2 2.80ghz, nVidia GeForce9600 w/2568MB, 3.25GB RAM, WinXP, MSVC2003


-----------------------------
Copyright
-----------------------------

This program and its contents are and will be open source and free to use. All ID art, logos and functions will be replaced with ours.

-----------------------------
Disclaimer
-----------------------------

I accept no responsibility if this file or program in any way causes a cold, causes your wife/girlfriend to run off with your best friend, or blows up your computer.  There is no warranty expressed or implied.

This project does not require the registered version of Quake3. 

-----------------------------
Installation
-----------------------------

Extract this archive to your directory of choice and open Gallery Virtuality.vcproj.


-----------------------------				
Features						
-----------------------------			

- Includes debugged SDK game source by TTK-Bandit
- All releases are full rebuilds, not incremental
- Great starting point for those wishing to create their own games


-----------------------------
Controls/Configuration
-----------------------------

Joystick support has been removed.  
Any changes will be outline in this section.


-----------------------------
Known Bugs/Issues
-----------------------------

- Depends on how far strayed from it's intention.

-----------------------------
Version History
-----------------------------

Gallery Virtuality v0.1.0:

Clean Quake 3 v0.5.3: (Justin Thyme)

- Cleaned up main menu, removing unnecessary items.  Things like Demo's and Cinematics were removed from the menu, but can still be accessed via console
- "genericizing" menu system by removing menu art resources *ongoing*
- Changed executable to "GalleryVirtuality.exe" so that it could coexist with standard Q3 in 
the same directory

Clean Quake 3 v0.5.2: (Justin Thyme)

- Implemented SV_Kick_f fix from ensiform which fixes kicking bots
- Implemented misantropia's snaps fix
- Removed Team Arena option from main menu, still accessabile under MODS
- Implemented ensiform's ATi skybox fix
- Implemented Kaziganthe's TA menu fix that allows showing all gametypes 
in Skirmish menu

Clean Quake 3 v0.5.1: (Justin Thyme) 

- Fixed Dlights shining through walls
- Modified main menu to fix overlapping menu options due to allowing the
running of mods with the demo version
- Removed joystick support
- Fixed menu bug where it wouldn't show the Controls menu
- Slowed down how often FPS display is updated to make it more readable

Clean Quake 3 v0.5.0: (Justin Thyme)

- More QSG bug fixes
- Implemented bug fixes from Quake3World.Com
- Got source code to compile with 17 warnings, but no errors
- Add #pragma to silence warnings for now
- A couple of basic bug fixes
- Increased hunk to 128MB default, 64MB min
- Integrated TTK-Bandit's Clean game source
- Disabled the id logo cinematic at startup
- Removed restriction to allow running mods with demo pak
- Tweaked compile settings
- Added Pheonix's long server uptime bug fix
- Numerous small bug fixes as mentioned on QSG


-----------------------------
ToDo List
-----------------------------

- Resolve all compile warnings (17 of them) - *done v0.5.0*
- Increase hunk size - *done v0.5.0*
- Read up on all command line switches
- Replace strcat with Q_strcat in CL_rcon_f *NA*
- Remove CD Key check (done) bret sheppard
- Remove check with authentication server done bret
- Remove registration check (allow running mods with demo pak0.pk3) - *done v0.5.0*
- Remove unnecessary #IF's and #IFDEF's
- Add back lens flare for dlights
- Fix compile warning regarding /LTCG
- Look into bot chat and MOD stuff
- Look into bot AI
- Change FPS counter to only update once/sec for better readability - *done v0.5.1*
- Review max player limit
- Center main HUD elements
- Add generic Save/Load game functionality ?
- Continue implementing bug fixes as found - *ongoing*
- Add light blooms
- Change snaps cap to equal servers FPS setting - *done v0.5.2*
- Fix bots getting dropped in password protected game - *done v0.5.2*
- Remove Team Arena from main menu (still accessable under MODS) - *done v0.5.2*
- Make blood stain/impact decals not fade


-----------------------------
Special Thanks/Credits
-----------------------------

id Software - For not only releasing such a cutting edge program (of it's day), but also for releasing the source code so that the community can continue to make it flourish, long after the core game has gone past its prime. Spike, Echon, Entar, CheapHack and Tei - For patiently answering newbie programming questions on ww.quakeworld.nu and QuakeSrc.org. TTK-Bandit - For creating the original Clean Game Source for Quake 3. All the people at QuakeDev.com, QuakeSrc.org and Quake3World.com. Dairyman - For his work on the Team Arena scripted menu and HUD system for use
with regular Quake3.


-----------------------------
Working Notes
-----------------------------

- still working on weopon removal.
