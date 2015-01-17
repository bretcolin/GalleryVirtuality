data
align 4
LABELV playerMins
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV playerMaxs
byte 4 1097859072
byte 4 1097859072
byte 4 1107296256
export SP_info_player_deathmatch
code
proc SP_info_player_deathmatch 8 12
file "../g_client.c"
line 17
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:// g_client.c -- client functions that don't happen every frame
;6:
;7:static vec3_t	playerMins = {-15, -15, -24};
;8:static vec3_t	playerMaxs = {15, 15, 32};
;9:
;10:/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
;11:potential spawning position for deathmatch games.
;12:The first time a player enters the game, they will be at an 'initial' spot.
;13:Targets will be fired when someone spawns in on them.
;14:"nobots" will prevent bots from using this spot.
;15:"nohumans" will prevent non-bots from using this spot.
;16:*/
;17:void SP_info_player_deathmatch( gentity_t *ent ) {
line 20
;18:	int		i;
;19:
;20:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $53
ARGP4
ADDRGP4 $54
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 21
;21:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $55
line 22
;22:		ent->flags |= FL_NO_BOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 23
;23:	}
LABELV $55
line 24
;24:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $57
ARGP4
ADDRGP4 $54
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 25
;25:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $58
line 26
;26:		ent->flags |= FL_NO_HUMANS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 27
;27:	}
LABELV $58
line 28
;28:}
LABELV $52
endproc SP_info_player_deathmatch 8 12
export SP_info_player_start
proc SP_info_player_start 0 4
line 33
;29:
;30:/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
;31:equivelant to info_player_deathmatch
;32:*/
;33:void SP_info_player_start(gentity_t *ent) {
line 34
;34:	ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $61
ASGNP4
line 35
;35:	SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 36
;36:}
LABELV $60
endproc SP_info_player_start 0 4
export SP_info_player_intermission
proc SP_info_player_intermission 0 0
line 41
;37:
;38:/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;39:The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;40:*/
;41:void SP_info_player_intermission( gentity_t *ent ) {
line 43
;42:
;43:}
LABELV $62
endproc SP_info_player_intermission 0 0
export SpotWouldTelefrag
proc SpotWouldTelefrag 4144 16
line 61
;44:
;45:
;46:
;47:/*
;48:=======================================================================
;49:
;50:  SelectSpawnPoint
;51:
;52:=======================================================================
;53:*/
;54:
;55:/*
;56:================
;57:SpotWouldTelefrag
;58:
;59:================
;60:*/
;61:qboolean SpotWouldTelefrag( gentity_t *spot ) {
line 67
;62:	int			i, num;
;63:	int			touch[MAX_GENTITIES];
;64:	gentity_t	*hit;
;65:	vec3_t		mins, maxs;
;66:
;67:	VectorAdd( spot->s.origin, playerMins, mins );
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4132
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMins
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4132
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMins+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMins+8
INDIRF4
ADDF4
ASGNF4
line 68
;68:	VectorAdd( spot->s.origin, playerMaxs, maxs );
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4136
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMaxs
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4136
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMaxs+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMaxs+8
INDIRF4
ADDF4
ASGNF4
line 69
;69:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4140
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4140
INDIRI4
ASGNI4
line 71
;70:
;71:	for (i=0 ; i<num ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $75
JUMPV
LABELV $72
line 72
;72:		hit = &g_entities[touch[i]];
ADDRLP4 4
CNSTI4 808
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 74
;73:		//if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
;74:		if ( hit->client) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $76
line 75
;75:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $63
JUMPV
LABELV $76
line 78
;76:		}
;77:
;78:	}
LABELV $73
line 71
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $75
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $72
line 80
;79:
;80:	return qfalse;
CNSTI4 0
RETI4
LABELV $63
endproc SpotWouldTelefrag 4144 16
export SelectNearestDeathmatchSpawnPoint
proc SelectNearestDeathmatchSpawnPoint 40 12
line 91
;81:}
;82:
;83:/*
;84:================
;85:SelectNearestDeathmatchSpawnPoint
;86:
;87:Find the spot that we DON'T want to use
;88:================
;89:*/
;90:#define	MAX_SPAWN_POINTS	128
;91:gentity_t *SelectNearestDeathmatchSpawnPoint( vec3_t from ) {
line 97
;92:	gentity_t	*spot;
;93:	vec3_t		delta;
;94:	float		dist, nearestDist;
;95:	gentity_t	*nearestSpot;
;96:
;97:	nearestDist = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 98
;98:	nearestSpot = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 99
;99:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $80
JUMPV
LABELV $79
line 101
;100:
;101:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 103
;102:
;103:		VectorSubtract( spot->s.origin, from, delta );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 104
;104:		dist = VectorLength( delta );
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 36
INDIRF4
ASGNF4
line 105
;105:		if ( dist < nearestDist ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $84
line 106
;106:			nearestDist = dist;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 107
;107:			nearestSpot = spot;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 108
;108:		}
LABELV $84
line 109
;109:	}
LABELV $80
line 101
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $61
ARGP4
ADDRLP4 28
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $79
line 111
;110:
;111:	return nearestSpot;
ADDRLP4 24
INDIRP4
RETP4
LABELV $78
endproc SelectNearestDeathmatchSpawnPoint 40 12
export SelectRandomDeathmatchSpawnPoint
proc SelectRandomDeathmatchSpawnPoint 532 12
line 123
;112:}
;113:
;114:
;115:/*
;116:================
;117:SelectRandomDeathmatchSpawnPoint
;118:
;119:go to a random point that doesn't telefrag
;120:================
;121:*/
;122:#define	MAX_SPAWN_POINTS	128
;123:gentity_t *SelectRandomDeathmatchSpawnPoint( void ) {
line 129
;124:	gentity_t	*spot;
;125:	int			count;
;126:	int			selection;
;127:	gentity_t	*spots[MAX_SPAWN_POINTS];
;128:
;129:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 130
;130:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $88
JUMPV
LABELV $87
line 132
;131:
;132:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 133
;133:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
CNSTI4 0
EQI4 $90
line 134
;134:			continue;
ADDRGP4 $88
JUMPV
LABELV $90
line 136
;135:		}
;136:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 137
;137:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 138
;138:	}
LABELV $88
line 132
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $61
ARGP4
ADDRLP4 524
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 524
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $87
line 140
;139:
;140:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $92
line 141
;141:		return G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $61
ARGP4
ADDRLP4 528
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $86
JUMPV
LABELV $92
line 144
;142:	}
;143:
;144:	selection = rand() % count;
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 520
ADDRLP4 528
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 145
;145:	return spots[ selection ];
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $86
endproc SelectRandomDeathmatchSpawnPoint 532 12
export SelectRandomFurthestSpawnPoint
proc SelectRandomFurthestSpawnPoint 572 12
line 155
;146:}
;147:
;148:/*
;149:===========
;150:SelectRandomFurthestSpawnPoint
;151:
;152:Chooses a player start, deathmatch start, etc
;153:============
;154:*/
;155:gentity_t *SelectRandomFurthestSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 163
;156:	gentity_t	*spot;
;157:	vec3_t		delta;
;158:	float		dist;
;159:	float		list_dist[64];
;160:	gentity_t	*list_spot[64];
;161:	int			numSpots, rnd, i, j;
;162:
;163:	numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 164
;164:	spot = NULL;
ADDRLP4 528
CNSTP4 0
ASGNP4
ADDRGP4 $96
JUMPV
LABELV $95
line 166
;165:
;166:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 167
;167:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 548
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $98
line 168
;168:			continue;
ADDRGP4 $96
JUMPV
LABELV $98
line 170
;169:		}
;170:		VectorSubtract( spot->s.origin, avoidPoint, delta );
ADDRLP4 556
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 556
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 171
;171:		dist = VectorLength( delta );
ADDRLP4 532
ARGP4
ADDRLP4 560
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 560
INDIRF4
ASGNF4
line 172
;172:		for (i = 0; i < numSpots; i++) {
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $105
JUMPV
LABELV $102
line 173
;173:			if ( dist > list_dist[i] ) {
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $106
line 174
;174:				if ( numSpots >= 64 )
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $108
line 175
;175:					numSpots = 64-1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $108
line 176
;176:				for (j = numSpots; j > i; j--) {
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $113
JUMPV
LABELV $110
line 177
;177:					list_dist[j] = list_dist[j-1];
ADDRLP4 564
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 564
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 564
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 178
;178:					list_spot[j] = list_spot[j-1];
ADDRLP4 568
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 568
INDIRI4
ADDRLP4 260
ADDP4
ADDRLP4 568
INDIRI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 179
;179:				}
LABELV $111
line 176
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $113
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $110
line 180
;180:				list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 181
;181:				list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 182
;182:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 183
;183:				if (numSpots > 64)
ADDRLP4 520
INDIRI4
CNSTI4 64
LEI4 $104
line 184
;184:					numSpots = 64;
ADDRLP4 520
CNSTI4 64
ASGNI4
line 185
;185:				break;
ADDRGP4 $104
JUMPV
LABELV $106
line 187
;186:			}
;187:		}
LABELV $103
line 172
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $105
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $102
LABELV $104
line 188
;188:		if (i >= numSpots && numSpots < 64) {
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $118
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $118
line 189
;189:			list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 190
;190:			list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 191
;191:			numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 192
;192:		}
LABELV $118
line 193
;193:	}
LABELV $96
line 166
ADDRLP4 528
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $61
ARGP4
ADDRLP4 548
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 548
INDIRP4
ASGNP4
ADDRLP4 548
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $95
line 194
;194:	if (!numSpots) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $120
line 195
;195:		spot = G_Find( NULL, FOFS(classname), "info_player_deathmatch");
CNSTP4 0
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $61
ARGP4
ADDRLP4 552
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 552
INDIRP4
ASGNP4
line 196
;196:		if (!spot)
ADDRLP4 528
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $122
line 197
;197:			G_Error( "Couldn't find a spawn point" );
ADDRGP4 $124
ARGP4
ADDRGP4 G_Error
CALLV
pop
LABELV $122
line 198
;198:		VectorCopy (spot->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 199
;199:		origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 200
;200:		VectorCopy (spot->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 201
;201:		return spot;
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $94
JUMPV
LABELV $120
line 205
;202:	}
;203:
;204:	// select a random spot from the spawn points furthest away
;205:	rnd = random() * (numSpots / 2);
ADDRLP4 552
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 544
ADDRLP4 552
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 520
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 207
;206:
;207:	VectorCopy (list_spot[rnd]->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 208
;208:	origin[2] += 9;
ADDRLP4 556
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 556
INDIRP4
ADDRLP4 556
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 209
;209:	VectorCopy (list_spot[rnd]->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 211
;210:
;211:	return list_spot[rnd];
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
RETP4
LABELV $94
endproc SelectRandomFurthestSpawnPoint 572 12
export SelectSpawnPoint
proc SelectSpawnPoint 4 12
line 221
;212:}
;213:
;214:/*
;215:===========
;216:SelectSpawnPoint
;217:
;218:Chooses a player start, deathmatch start, etc
;219:============
;220:*/
;221:gentity_t *SelectSpawnPoint ( vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 222
;222:	return SelectRandomFurthestSpawnPoint( avoidPoint, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 SelectRandomFurthestSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $125
endproc SelectSpawnPoint 4 12
export SelectInitialSpawnPoint
proc SelectInitialSpawnPoint 20 12
line 261
;223:
;224:	/*
;225:	gentity_t	*spot;
;226:	gentity_t	*nearestSpot;
;227:
;228:	nearestSpot = SelectNearestDeathmatchSpawnPoint( avoidPoint );
;229:
;230:	spot = SelectRandomDeathmatchSpawnPoint ( );
;231:	if ( spot == nearestSpot ) {
;232:		// roll again if it would be real close to point of death
;233:		spot = SelectRandomDeathmatchSpawnPoint ( );
;234:		if ( spot == nearestSpot ) {
;235:			// last try
;236:			spot = SelectRandomDeathmatchSpawnPoint ( );
;237:		}		
;238:	}
;239:
;240:	// find a single player start spot
;241:	if (!spot) {
;242:		G_Error( "Couldn't find a spawn point" );
;243:	}
;244:
;245:	VectorCopy (spot->s.origin, origin);
;246:	origin[2] += 9;
;247:	VectorCopy (spot->s.angles, angles);
;248:
;249:	return spot;
;250:	*/
;251:}
;252:
;253:/*
;254:===========
;255:SelectInitialSpawnPoint
;256:
;257:Try to find a spawn point marked 'initial', otherwise
;258:use normal spawn selection.
;259:============
;260:*/
;261:gentity_t *SelectInitialSpawnPoint( vec3_t origin, vec3_t angles ) {
line 264
;262:	gentity_t	*spot;
;263:
;264:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $128
JUMPV
LABELV $127
line 265
;265:	while ((spot = G_Find (spot, FOFS(classname), "info_player_deathmatch")) != NULL) {
line 266
;266:		if ( spot->spawnflags & 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $130
line 267
;267:			break;
ADDRGP4 $129
JUMPV
LABELV $130
line 269
;268:		}
;269:	}
LABELV $128
line 265
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRGP4 $61
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $127
LABELV $129
line 271
;270:
;271:	if ( !spot || SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $134
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $132
LABELV $134
line 272
;272:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $126
JUMPV
LABELV $132
line 275
;273:	}
;274:
;275:	VectorCopy (spot->s.origin, origin);
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 276
;276:	origin[2] += 9;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 277
;277:	VectorCopy (spot->s.angles, angles);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 279
;278:
;279:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $126
endproc SelectInitialSpawnPoint 20 12
export SelectSpectatorSpawnPoint
proc SelectSpectatorSpawnPoint 0 0
line 288
;280:}
;281:
;282:/*
;283:===========
;284:SelectSpectatorSpawnPoint
;285:
;286:============
;287:*/
;288:gentity_t *SelectSpectatorSpawnPoint( vec3_t origin, vec3_t angles ) {
line 289
;289:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 291
;290:
;291:	VectorCopy( level.intermission_origin, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 level+9144
INDIRB
ASGNB 12
line 292
;292:	VectorCopy( level.intermission_angle, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 level+9156
INDIRB
ASGNB 12
line 294
;293:
;294:	return NULL;
CNSTP4 0
RETP4
LABELV $135
endproc SelectSpectatorSpawnPoint 0 0
export InitBodyQue
proc InitBodyQue 12 0
line 310
;295:}
;296:
;297:/*
;298:=======================================================================
;299:
;300:BODYQUE
;301:
;302:=======================================================================
;303:*/
;304:
;305:/*
;306:===============
;307:InitBodyQue
;308:===============
;309:*/
;310:void InitBodyQue (void) {
line 314
;311:	int		i;
;312:	gentity_t	*ent;
;313:
;314:	level.bodyQueIndex = 0;
ADDRGP4 level+9176
CNSTI4 0
ASGNI4
line 315
;315:	for (i=0; i<BODY_QUEUE_SIZE ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $140
line 316
;316:		ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 317
;317:		ent->classname = "bodyque";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $144
ASGNP4
line 318
;318:		ent->neverFree = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 1
ASGNI4
line 319
;319:		level.bodyQue[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9180
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 320
;320:	}
LABELV $141
line 315
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $140
line 321
;321:}
LABELV $138
endproc InitBodyQue 12 0
export BodySink
proc BodySink 4 4
line 330
;322:
;323:/*
;324:=============
;325:BodySink
;326:
;327:After sitting around for five seconds, fall into the ground and dissapear
;328:=============
;329:*/
;330:void BodySink( gentity_t *ent ) {
line 331
;331:	if ( level.time - ent->timestamp > 6500 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
SUBI4
CNSTI4 6500
LEI4 $147
line 333
;332:		// the body ques are never actually freed, they are just unlinked
;333:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 334
;334:		ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 0
ASGNI4
line 335
;335:		return;	
ADDRGP4 $146
JUMPV
LABELV $147
line 337
;336:	}
;337:	ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 338
;338:	ent->s.pos.trBase[2] -= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 339
;339:}
LABELV $146
endproc BodySink 4 4
export CopyToBodyQue
proc CopyToBodyQue 48 8
line 349
;340:
;341:/*
;342:=============
;343:CopyToBodyQue
;344:
;345:A player is respawning, so make an entity that looks
;346:just like the existing corpse to leave behind.
;347:=============
;348:*/
;349:void CopyToBodyQue( gentity_t *ent ) {
line 357
;350:#ifdef MISSIONPACK
;351:	gentity_t	*e;
;352:	int i;
;353:#endif
;354:	gentity_t		*body;
;355:	int			contents;
;356:
;357:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 360
;358:
;359:	// if client is in a nodrop area, don't leave the body
;360:	contents = trap_PointContents( ent->s.origin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 8
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 361
;361:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $152
line 362
;362:		return;
ADDRGP4 $151
JUMPV
LABELV $152
line 366
;363:	}
;364:
;365:	// grab a body que and cycle to the next one
;366:	body = level.bodyQue[ level.bodyQueIndex ];
ADDRLP4 0
ADDRGP4 level+9176
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9180
ADDP4
INDIRP4
ASGNP4
line 367
;367:	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+9176
ADDRGP4 level+9176
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 8
MODI4
ASGNI4
line 369
;368:
;369:	trap_UnlinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 371
;370:
;371:	body->s = ent->s;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 208
line 372
;372:	body->s.eFlags = EF_DEAD;		// clear EF_TALK, etc
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 391
;373:#ifdef MISSIONPACK
;374:	if ( ent->s.eFlags & EF_KAMIKAZE ) {
;375:		body->s.eFlags |= EF_KAMIKAZE;
;376:
;377:		// check if there is a kamikaze timer around for this owner
;378:		for (i = 0; i < MAX_GENTITIES; i++) {
;379:			e = &g_entities[i];
;380:			if (!e->inuse)
;381:				continue;
;382:			if (e->activator != ent)
;383:				continue;
;384:			if (strcmp(e->classname, "kamikaze timer"))
;385:				continue;
;386:			e->activator = body;
;387:			break;
;388:		}
;389:	}
;390:#endif
;391:	body->s.powerups = 0;	// clear powerups
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 392
;392:	body->s.loopSound = 0;	// clear lava burning
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 393
;393:	body->s.number = body - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 808
DIVI4
ASGNI4
line 394
;394:	body->timestamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 395
;395:	body->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 396
;396:	body->physicsBounce = 0;		// don't bounce
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTF4 0
ASGNF4
line 397
;397:	if ( body->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $159
line 398
;398:		body->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 399
;399:		body->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 400
;400:		VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 401
;401:	} else {
ADDRGP4 $160
JUMPV
LABELV $159
line 402
;402:		body->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 403
;403:	}
LABELV $160
line 404
;404:	body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 408
;405:
;406:	// change the animation to the last-frame only, so the sequence
;407:	// doesn't repeat anew for the body
;408:	switch ( body->s.legsAnim & ~ANIM_TOGGLEBIT ) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $162
ADDRLP4 16
INDIRI4
CNSTI4 5
GTI4 $162
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $168
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $168
address $165
address $165
address $166
address $166
address $167
address $167
code
LABELV $165
line 411
;409:	case BOTH_DEATH1:
;410:	case BOTH_DEAD1:
;411:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD1;
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 412
;412:		break;
ADDRGP4 $163
JUMPV
LABELV $166
line 415
;413:	case BOTH_DEATH2:
;414:	case BOTH_DEAD2:
;415:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD2;
ADDRLP4 36
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 416
;416:		break;
ADDRGP4 $163
JUMPV
LABELV $167
LABELV $162
line 420
;417:	case BOTH_DEATH3:
;418:	case BOTH_DEAD3:
;419:	default:
;420:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD3;
ADDRLP4 44
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 421
;421:		break;
LABELV $163
line 424
;422:	}
;423:
;424:	body->r.svFlags = ent->r.svFlags;
ADDRLP4 24
CNSTI4 424
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 425
;425:	VectorCopy (ent->r.mins, body->r.mins);
ADDRLP4 28
CNSTI4 436
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 426
;426:	VectorCopy (ent->r.maxs, body->r.maxs);
ADDRLP4 32
CNSTI4 448
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 427
;427:	VectorCopy (ent->r.absmin, body->r.absmin);
ADDRLP4 36
CNSTI4 464
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 428
;428:	VectorCopy (ent->r.absmax, body->r.absmax);
ADDRLP4 40
CNSTI4 476
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 430
;429:
;430:	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 65537
ASGNI4
line 431
;431:	body->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 67108864
ASGNI4
line 432
;432:	body->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 434
;433:
;434:	body->nextthink = level.time + 5000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 435
;435:	body->think = BodySink;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 BodySink
ASGNP4
line 437
;436:
;437:	body->die = body_die;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 body_die
ASGNP4
line 440
;438:
;439:	// don't take more damage if already gibbed
;440:	if ( ent->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $170
line 441
;441:		body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 442
;442:	} else {
ADDRGP4 $171
JUMPV
LABELV $170
line 443
;443:		body->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 444
;444:	}
LABELV $171
line 447
;445:
;446:
;447:	VectorCopy ( body->s.pos.trBase, body->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 448
;448:	trap_LinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 449
;449:}
LABELV $151
endproc CopyToBodyQue 48 8
export SetClientViewAngle
proc SetClientViewAngle 16 0
line 460
;450:
;451://======================================================================
;452:
;453:
;454:/*
;455:==================
;456:SetClientViewAngle
;457:
;458:==================
;459:*/
;460:void SetClientViewAngle( gentity_t *ent, vec3_t angle ) {
line 464
;461:	int			i;
;462:
;463:	// set the delta angle
;464:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $173
line 467
;465:		int		cmdAngle;
;466:
;467:		cmdAngle = ANGLE2SHORT(angle[i]);
ADDRLP4 4
CNSTF4 1199570944
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 468
;468:		ent->client->ps.delta_angles[i] = cmdAngle - ent->client->pers.cmd.angles[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 56
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 469
;469:	}
LABELV $174
line 464
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $173
line 470
;470:	VectorCopy( angle, ent->s.angles );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 471
;471:	VectorCopy (ent->s.angles, ent->client->ps.viewangles);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 472
;472:}
LABELV $172
endproc SetClientViewAngle 16 0
export respawn
proc respawn 12 8
line 479
;473:
;474:/*
;475:================
;476:respawn
;477:================
;478:*/
;479:void respawn( gentity_t *ent ) {
line 483
;480:#ifndef SINGLEPLAYER
;481:	     gentity_t	*tent;
;482:#endif
;483:  CopyToBodyQue (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 484
;484:  ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 487
;485:#ifndef SINGLEPLAYER // remove effect when respawning
;486:  // add a teleportation effect
;487:  tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 488
;488:  tent->s.clientNum = ent->s.clientNum;
ADDRLP4 8
CNSTI4 168
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 490
;489:#endif
;490:}
LABELV $177
endproc respawn 12 8
export TeamCount
proc TeamCount 8 0
line 499
;491:
;492:/*
;493:================
;494:TeamCount
;495:
;496:Returns number of players on a team
;497:================
;498:*/
;499:team_t TeamCount( int ignoreClientNum, int team ) {
line 501
;500:	int		i;
;501:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 503
;502:
;503:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $182
JUMPV
LABELV $179
line 504
;504:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $184
line 505
;505:			continue;
ADDRGP4 $180
JUMPV
LABELV $184
line 507
;506:		}
;507:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 784
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $186
line 508
;508:			continue;
ADDRGP4 $180
JUMPV
LABELV $186
line 510
;509:		}
;510:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 784
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 616
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $188
line 511
;511:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 512
;512:		}
LABELV $188
line 513
;513:	}
LABELV $180
line 503
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $182
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $179
line 515
;514:
;515:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $178
endproc TeamCount 8 0
export TeamLeader
proc TeamLeader 4 0
line 525
;516:}
;517:
;518:/*
;519:================
;520:TeamLeader
;521:
;522:Returns the client number of the team leader
;523:================
;524:*/
;525:int TeamLeader( int team ) {
line 528
;526:	int		i;
;527:
;528:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $194
JUMPV
LABELV $191
line 529
;529:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 784
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $196
line 530
;530:			continue;
ADDRGP4 $192
JUMPV
LABELV $196
line 532
;531:		}
;532:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 784
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 616
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $198
line 533
;533:			if ( level.clients[i].sess.teamLeader )
CNSTI4 784
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $200
line 534
;534:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $190
JUMPV
LABELV $200
line 535
;535:		}
LABELV $198
line 536
;536:	}
LABELV $192
line 528
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $194
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $191
line 538
;537:
;538:	return -1;
CNSTI4 -1
RETI4
LABELV $190
endproc TeamLeader 4 0
export PickTeam
proc PickTeam 24 8
line 548
;539:}
;540:
;541:
;542:/*
;543:================
;544:PickTeam
;545:
;546:================
;547:*/
;548:team_t PickTeam( int ignoreClientNum ) {
line 551
;549:	int		counts[TEAM_NUM_TEAMS];
;550:
;551:	counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
ASGNI4
line 552
;552:	counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
ASGNI4
line 554
;553:
;554:	if ( counts[TEAM_BLUE] > counts[TEAM_RED] ) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $205
line 555
;555:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $202
JUMPV
LABELV $205
line 557
;556:	}
;557:	if ( counts[TEAM_RED] > counts[TEAM_BLUE] ) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $209
line 558
;558:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $202
JUMPV
LABELV $209
line 561
;559:	}
;560:	// equal team count, so join the team with the lowest score
;561:	if ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) {
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 level+44+4
INDIRI4
LEI4 $213
line 562
;562:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $202
JUMPV
LABELV $213
line 564
;563:	}
;564:	return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $202
endproc PickTeam 24 8
proc ClientCleanName 40 12
line 592
;565:}
;566:
;567:/*
;568:===========
;569:ForceClientSkin
;570:
;571:Forces a client's skin (for teamplay)
;572:===========
;573:*/
;574:/*
;575:static void ForceClientSkin( gclient_t *client, char *model, const char *skin ) {
;576:	char *p;
;577:
;578:	if ((p = Q_strrchr(model, '/')) != 0) {
;579:		*p = 0;
;580:	}
;581:
;582:	Q_strcat(model, MAX_QPATH, "/");
;583:	Q_strcat(model, MAX_QPATH, skin);
;584:}
;585:*/
;586:
;587:/*
;588:===========
;589:ClientCheckName
;590:============
;591:*/
;592:static void ClientCleanName( const char *in, char *out, int outSize ) {
line 599
;593:	int		len, colorlessLen;
;594:	char	ch;
;595:	char	*p;
;596:	int		spaces;
;597:
;598:	//save room for trailing null byte
;599:	outSize--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 601
;600:
;601:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 602
;602:	colorlessLen = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 603
;603:	p = out;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
line 604
;604:	*p = 0;
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
line 605
;605:	spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $220
line 607
;606:
;607:	while( 1 ) {
line 608
;608:		ch = *in++;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
INDIRI1
ASGNI1
line 609
;609:		if( !ch ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $223
line 610
;610:			break;
ADDRGP4 $222
JUMPV
LABELV $223
line 614
;611:		}
;612:
;613:		// don't allow leading spaces
;614:		if( !*p && ch == ' ' ) {
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $225
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $225
line 615
;615:			continue;
ADDRGP4 $221
JUMPV
LABELV $225
line 619
;616:		}
;617:
;618:		// check colors
;619:		if( ch == Q_COLOR_ESCAPE ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $227
line 621
;620:			// solo trailing carat is not a color prefix
;621:			if( !*in ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $229
line 622
;622:				break;
ADDRGP4 $222
JUMPV
LABELV $229
line 626
;623:			}
;624:
;625:			// don't allow black in a name, period
;626:			if( ColorIndex(*in) == 0 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 0
NEI4 $231
line 627
;627:				in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 628
;628:				continue;
ADDRGP4 $221
JUMPV
LABELV $231
line 632
;629:			}
;630:
;631:			// make sure room in dest for both chars
;632:			if( len > outSize - 2 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 2
SUBI4
LEI4 $233
line 633
;633:				break;
ADDRGP4 $222
JUMPV
LABELV $233
line 636
;634:			}
;635:
;636:			*out++ = ch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 637
;637:			*out++ = *in++;
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI1
ASGNI1
line 638
;638:			len += 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 639
;639:			continue;
ADDRGP4 $221
JUMPV
LABELV $227
line 643
;640:		}
;641:
;642:		// don't allow too many consecutive spaces
;643:		if( ch == ' ' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $235
line 644
;644:			spaces++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 645
;645:			if( spaces > 3 ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LEI4 $236
line 646
;646:				continue;
ADDRGP4 $221
JUMPV
line 648
;647:			}
;648:		}
LABELV $235
line 649
;649:		else {
line 650
;650:			spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 651
;651:		}
LABELV $236
line 653
;652:
;653:		if( len > outSize - 1 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
LEI4 $239
line 654
;654:			break;
ADDRGP4 $222
JUMPV
LABELV $239
line 657
;655:		}
;656:
;657:		*out++ = ch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 658
;658:		colorlessLen++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 659
;659:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 660
;660:	}
LABELV $221
line 607
ADDRGP4 $220
JUMPV
LABELV $222
line 661
;661:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 664
;662:
;663:	// don't allow empty names
;664:	if( *p == 0 || colorlessLen == 0 ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
EQI4 $243
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $241
LABELV $243
line 665
;665:		Q_strncpyz( p, "UnnamedPlayer", outSize );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $244
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 666
;666:	}
LABELV $241
line 667
;667:}
LABELV $219
endproc ClientCleanName 40 12
export ClientUserinfoChanged
proc ClientUserinfoChanged 6388 56
line 681
;668:
;669:
;670:/*
;671:===========
;672:ClientUserInfoChanged
;673:
;674:Called from ClientConnect when the player first connects and
;675:directly by the server system when the player updates a userinfo variable.
;676:
;677:The game can override any of the settings and call trap_SetUserinfo
;678:if desired.
;679:============
;680:*/
;681:void ClientUserinfoChanged( int clientNum ) {
line 695
;682:	gentity_t *ent;
;683:	int		teamTask, teamLeader, team, health;
;684:	char	*s;
;685:	char	model[MAX_QPATH];
;686:	char	headModel[MAX_QPATH];
;687:	char	oldname[MAX_STRING_CHARS];
;688:	gclient_t	*client;
;689:	char	c1[MAX_INFO_STRING];
;690:	char	c2[MAX_INFO_STRING];
;691:	char	redTeam[MAX_INFO_STRING];
;692:	char	blueTeam[MAX_INFO_STRING];
;693:	char	userinfo[MAX_INFO_STRING];
;694:
;695:	ent = g_entities + clientNum;
ADDRLP4 1032
CNSTI4 808
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 696
;696:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 698
;697:
;698:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 701
;699:
;700:	// check for malformed or illegal info strings
;701:	if ( !Info_Validate(userinfo) ) {
ADDRLP4 4
ARGP4
ADDRLP4 6300
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 6300
INDIRI4
CNSTI4 0
NEI4 $246
line 702
;702:		strcpy (userinfo, "\\name\\badinfo");
ADDRLP4 4
ARGP4
ADDRGP4 $248
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 703
;703:	}
LABELV $246
line 706
;704:
;705:	// check for local client
;706:	s = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 4
ARGP4
ADDRGP4 $249
ARGP4
ADDRLP4 6304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6304
INDIRP4
ASGNP4
line 707
;707:	if ( !strcmp( s, "localhost" ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $252
ARGP4
ADDRLP4 6308
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6308
INDIRI4
CNSTI4 0
NEI4 $250
line 708
;708:		client->pers.localClient = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 1
ASGNI4
line 709
;709:	}
LABELV $250
line 712
;710:
;711:	// check the item prediction
;712:	s = Info_ValueForKey( userinfo, "cg_predictItems" );
ADDRLP4 4
ARGP4
ADDRGP4 $253
ARGP4
ADDRLP4 6312
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6312
INDIRP4
ASGNP4
line 713
;713:	if ( !atoi( s ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 6316
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6316
INDIRI4
CNSTI4 0
NEI4 $254
line 714
;714:		client->pers.predictItemPickup = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 715
;715:	} else {
ADDRGP4 $255
JUMPV
LABELV $254
line 716
;716:		client->pers.predictItemPickup = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 717
;717:	}
LABELV $255
line 720
;718:
;719:	// set name
;720:	Q_strncpyz ( oldname, client->pers.netname, sizeof( oldname ) );
ADDRLP4 1164
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 721
;721:	s = Info_ValueForKey (userinfo, "name");
ADDRLP4 4
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 6320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6320
INDIRP4
ASGNP4
line 722
;722:	ClientCleanName( s, client->pers.netname, sizeof(client->pers.netname) );
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientCleanName
CALLV
pop
line 724
;723:
;724:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 3
NEI4 $257
line 725
;725:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $259
line 726
;726:			Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRGP4 $261
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 727
;727:		}
LABELV $259
line 728
;728:	}
LABELV $257
line 730
;729:
;730:	if ( client->pers.connected == CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $262
line 731
;731:		if ( strcmp( oldname, client->pers.netname ) ) {
ADDRLP4 1164
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 6324
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6324
INDIRI4
CNSTI4 0
EQI4 $264
line 732
;732:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " renamed to %s\n\"", oldname, 
ADDRGP4 $266
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 6328
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 6328
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 734
;733:				client->pers.netname) );
;734:		}
LABELV $264
line 735
;735:	}
LABELV $262
line 749
;736:
;737:	// set max health
;738:#ifdef MISSIONPACK
;739:	if (client->ps.powerups[PW_GUARD]) {
;740:		client->pers.maxHealth = 200;
;741:	} else {
;742:		health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
;743:		client->pers.maxHealth = health;
;744:		if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
;745:			client->pers.maxHealth = 100;
;746:		}
;747:	}
;748:#else
;749:	health = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 4
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 6324
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 6324
INDIRP4
ARGP4
ADDRLP4 6328
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2196
ADDRLP4 6328
INDIRI4
ASGNI4
line 750
;750:	client->pers.maxHealth = health;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 2196
INDIRI4
ASGNI4
line 751
;751:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 6332
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
ADDRLP4 6332
INDIRI4
CNSTI4 1
LTI4 $270
ADDRLP4 6332
INDIRI4
CNSTI4 100
LEI4 $268
LABELV $270
line 752
;752:		client->pers.maxHealth = 100;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
CNSTI4 100
ASGNI4
line 753
;753:	}
LABELV $268
line 755
;754:#endif
;755:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
line 758
;756:
;757:	// set model
;758:	if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $271
line 759
;759:		Q_strncpyz( model, Info_ValueForKey (userinfo, "team_model"), sizeof( model ) );
ADDRLP4 4
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 6340
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 6340
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 760
;760:		Q_strncpyz( headModel, Info_ValueForKey (userinfo, "team_headmodel"), sizeof( headModel ) );
ADDRLP4 4
ARGP4
ADDRGP4 $275
ARGP4
ADDRLP4 6344
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1100
ARGP4
ADDRLP4 6344
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 761
;761:	} else {
ADDRGP4 $272
JUMPV
LABELV $271
line 762
;762:		Q_strncpyz( model, Info_ValueForKey (userinfo, "model"), sizeof( model ) );
ADDRLP4 4
ARGP4
ADDRGP4 $276
ARGP4
ADDRLP4 6340
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 6340
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 763
;763:		Q_strncpyz( headModel, Info_ValueForKey (userinfo, "headmodel"), sizeof( headModel ) );
ADDRLP4 4
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 6344
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1100
ARGP4
ADDRLP4 6344
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 764
;764:	}
LABELV $272
line 767
;765:
;766:	// bots set their team a few frames later
;767:	if (g_gametype.integer >= GT_TEAM && g_entities[clientNum].r.svFlags & SVF_BOT) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $278
CNSTI4 808
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $278
line 768
;768:		s = Info_ValueForKey( userinfo, "team" );
ADDRLP4 4
ARGP4
ADDRGP4 $283
ARGP4
ADDRLP4 6340
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6340
INDIRP4
ASGNP4
line 769
;769:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $286
ARGP4
ADDRLP4 6344
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6344
INDIRI4
CNSTI4 0
EQI4 $288
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $287
ARGP4
ADDRLP4 6348
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6348
INDIRI4
CNSTI4 0
NEI4 $284
LABELV $288
line 770
;770:			team = TEAM_RED;
ADDRLP4 4248
CNSTI4 1
ASGNI4
line 771
;771:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $279
JUMPV
LABELV $284
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $291
ARGP4
ADDRLP4 6352
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6352
INDIRI4
CNSTI4 0
EQI4 $293
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $292
ARGP4
ADDRLP4 6356
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6356
INDIRI4
CNSTI4 0
NEI4 $289
LABELV $293
line 772
;772:			team = TEAM_BLUE;
ADDRLP4 4248
CNSTI4 2
ASGNI4
line 773
;773:		} else {
ADDRGP4 $279
JUMPV
LABELV $289
line 775
;774:			// pick the team with the least number of players
;775:			team = PickTeam( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 6360
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4248
ADDRLP4 6360
INDIRI4
ASGNI4
line 776
;776:		}
line 777
;777:	}
ADDRGP4 $279
JUMPV
LABELV $278
line 778
;778:	else {
line 779
;779:		team = client->sess.sessionTeam;
ADDRLP4 4248
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
line 780
;780:	}
LABELV $279
line 816
;781:
;782:/*	NOTE: all client side now
;783:
;784:	// team
;785:	switch( team ) {
;786:	case TEAM_RED:
;787:		ForceClientSkin(client, model, "red");
;788://		ForceClientSkin(client, headModel, "red");
;789:		break;
;790:	case TEAM_BLUE:
;791:		ForceClientSkin(client, model, "blue");
;792://		ForceClientSkin(client, headModel, "blue");
;793:		break;
;794:	}
;795:	// don't ever use a default skin in teamplay, it would just waste memory
;796:	// however bots will always join a team but they spawn in as spectator
;797:	if ( g_gametype.integer >= GT_TEAM && team == TEAM_SPECTATOR) {
;798:		ForceClientSkin(client, model, "red");
;799://		ForceClientSkin(client, headModel, "red");
;800:	}
;801:*/
;802:
;803:#ifdef MISSIONPACK
;804:	if (g_gametype.integer >= GT_TEAM) {
;805:		client->pers.teamInfo = qtrue;
;806:	} else {
;807:		s = Info_ValueForKey( userinfo, "teamoverlay" );
;808:		if ( ! *s || atoi( s ) != 0 ) {
;809:			client->pers.teamInfo = qtrue;
;810:		} else {
;811:			client->pers.teamInfo = qfalse;
;812:		}
;813:	}
;814:#else
;815:	// teamInfo
;816:	s = Info_ValueForKey( userinfo, "teamoverlay" );
ADDRLP4 4
ARGP4
ADDRGP4 $294
ARGP4
ADDRLP4 6340
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6340
INDIRP4
ASGNP4
line 817
;817:	if ( ! *s || atoi( s ) != 0 ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $297
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 6348
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6348
INDIRI4
CNSTI4 0
EQI4 $295
LABELV $297
line 818
;818:		client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 819
;819:	} else {
ADDRGP4 $296
JUMPV
LABELV $295
line 820
;820:		client->pers.teamInfo = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 821
;821:	}
LABELV $296
line 834
;822:#endif
;823:	/*
;824:	s = Info_ValueForKey( userinfo, "cg_pmove_fixed" );
;825:	if ( !*s || atoi( s ) == 0 ) {
;826:		client->pers.pmoveFixed = qfalse;
;827:	}
;828:	else {
;829:		client->pers.pmoveFixed = qtrue;
;830:	}
;831:	*/
;832:
;833:	// team task (0 = none, 1 = offence, 2 = defence)
;834:	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 4
ARGP4
ADDRGP4 $298
ARGP4
ADDRLP4 6352
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 6352
INDIRP4
ARGP4
ADDRLP4 6356
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2188
ADDRLP4 6356
INDIRI4
ASGNI4
line 836
;835:	// team Leader (1 = leader, 0 is normal player)
;836:	teamLeader = client->sess.teamLeader;
ADDRLP4 2192
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ASGNI4
line 839
;837:
;838:	// colors
;839:	strcpy(c1, Info_ValueForKey( userinfo, "color1" ));
ADDRLP4 4
ARGP4
ADDRGP4 $299
ARGP4
ADDRLP4 6360
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2200
ARGP4
ADDRLP4 6360
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 840
;840:	strcpy(c2, Info_ValueForKey( userinfo, "color2" ));
ADDRLP4 4
ARGP4
ADDRGP4 $300
ARGP4
ADDRLP4 6364
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3224
ARGP4
ADDRLP4 6364
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 842
;841:
;842:	strcpy(redTeam, Info_ValueForKey( userinfo, "g_redteam" ));
ADDRLP4 4
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 6368
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4252
ARGP4
ADDRLP4 6368
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 843
;843:	strcpy(blueTeam, Info_ValueForKey( userinfo, "g_blueteam" ));
ADDRLP4 4
ARGP4
ADDRGP4 $302
ARGP4
ADDRLP4 6372
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 5276
ARGP4
ADDRLP4 6372
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 847
;844:
;845:	// send over a subset of the userinfo keys so other clients can
;846:	// print scoreboards, display models, and play custom sounds
;847:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1032
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $303
line 848
;848:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d",
ADDRLP4 4
ARGP4
ADDRGP4 $306
ARGP4
ADDRLP4 6376
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $305
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4248
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 2200
ARGP4
ADDRLP4 3224
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ARGI4
ADDRLP4 6376
INDIRP4
ARGP4
ADDRLP4 2188
INDIRI4
ARGI4
ADDRLP4 2192
INDIRI4
ARGI4
ADDRLP4 6384
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6384
INDIRP4
ASGNP4
line 852
;849:			client->pers.netname, team, model, headModel, c1, c2, 
;850:			client->pers.maxHealth, client->sess.wins, client->sess.losses,
;851:			Info_ValueForKey( userinfo, "skill" ), teamTask, teamLeader );
;852:	} else {
ADDRGP4 $304
JUMPV
LABELV $303
line 853
;853:		s = va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\g_redteam\\%s\\g_blueteam\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d",
ADDRGP4 $307
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 4252
ARGP4
ADDRLP4 5276
ARGP4
ADDRLP4 2200
ARGP4
ADDRLP4 3224
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ARGI4
ADDRLP4 2188
INDIRI4
ARGI4
ADDRLP4 2192
INDIRI4
ARGI4
ADDRLP4 6380
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 6380
INDIRP4
ASGNP4
line 856
;854:			client->pers.netname, client->sess.sessionTeam, model, headModel, redTeam, blueTeam, c1, c2, 
;855:			client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader);
;856:	}
LABELV $304
line 858
;857:
;858:	trap_SetConfigstring( CS_PLAYERS+clientNum, s );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 861
;859:
;860:	// this is not the userinfo, more like the configstring actually
;861:	G_LogPrintf( "ClientUserinfoChanged: %i %s\n", clientNum, s );
ADDRGP4 $308
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 862
;862:}
LABELV $245
endproc ClientUserinfoChanged 6388 56
export ClientConnect
proc ClientConnect 1064 12
line 885
;863:
;864:
;865:/*
;866:===========
;867:ClientConnect
;868:
;869:Called when a player begins connecting to the server.
;870:Called again for every map change or tournement restart.
;871:
;872:The session information will be valid after exit.
;873:
;874:Return NULL if the client should be allowed, otherwise return
;875:a string with the reason for denial.
;876:
;877:Otherwise, the client will be sent the current gamestate
;878:and will eventually get to ClientBegin.
;879:
;880:firstTime will be qtrue the very first time a client connects
;881:to the server machine, but qfalse on map changes and tournement
;882:restarts.
;883:============
;884:*/
;885:char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
line 892
;886:	char		*value;
;887://	char		*areabits;
;888:	gclient_t	*client;
;889:	char		userinfo[MAX_INFO_STRING];
;890:	gentity_t	*ent;
;891:
;892:	ent = &g_entities[ clientNum ];
ADDRLP4 4
CNSTI4 808
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 894
;893:
;894:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 900
;895:
;896: 	// IP filtering
;897: 	// https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=500
;898: 	// recommanding PB based IP / GUID banning, the builtin system is pretty limited
;899: 	// check to see if they are on the banned IP list
;900:	value = Info_ValueForKey (userinfo, "ip");
ADDRLP4 12
ARGP4
ADDRGP4 $249
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1036
INDIRP4
ASGNP4
line 901
;901:	if ( G_FilterPacket( value ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 G_FilterPacket
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $310
line 902
;902:		return "You are banned from this server.";
ADDRGP4 $312
RETP4
ADDRGP4 $309
JUMPV
LABELV $310
line 908
;903:	}
;904:
;905:  // we don't check password for bots and local client
;906:  // NOTE: local client <-> "ip" "localhost"
;907:  //   this means this client is not running in our current process
;908:	if ( !( ent->r.svFlags & SVF_BOT ) && (strcmp(value, "localhost") != 0)) {
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $313
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $252
ARGP4
ADDRLP4 1044
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $313
line 910
;909:		// check for a password
;910:		value = Info_ValueForKey (userinfo, "password");
ADDRLP4 12
ARGP4
ADDRGP4 $315
ARGP4
ADDRLP4 1048
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1048
INDIRP4
ASGNP4
line 911
;911:		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) &&
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $316
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $320
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $316
ADDRGP4 g_password+16
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $316
line 912
;912:			strcmp( g_password.string, value) != 0) {
line 913
;913:			return "Invalid password";
ADDRGP4 $322
RETP4
ADDRGP4 $309
JUMPV
LABELV $316
line 915
;914:		}
;915:	}
LABELV $313
line 918
;916:
;917:	// they can connect
;918:	ent->client = level.clients + clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 784
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 919
;919:	client = ent->client;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 923
;920:
;921://	areabits = client->areabits;
;922:
;923:	memset( client, 0, sizeof(*client) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 784
ARGI4
ADDRGP4 memset
CALLP4
pop
line 925
;924:
;925:	client->pers.connected = CON_CONNECTING;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 928
;926:
;927:	// read or initialize the session data
;928:	if ( firstTime || level.newSession ) {
ADDRLP4 1048
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 1048
INDIRI4
NEI4 $326
ADDRGP4 level+64
INDIRI4
ADDRLP4 1048
INDIRI4
EQI4 $323
LABELV $326
line 929
;929:		G_InitSessionData( client, userinfo );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_InitSessionData
CALLV
pop
line 930
;930:	}
LABELV $323
line 931
;931:	G_ReadSessionData( client );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 933
;932:#ifndef SINGLEPLAYER // stop Bots from entering game
;933:	if( isBot ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $327
line 934
;934:		ent->r.svFlags |= SVF_BOT;
ADDRLP4 1052
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 935
;935:		ent->inuse = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 936
;936:		if( !G_BotConnect( clientNum, !firstTime ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $332
ADDRLP4 1056
CNSTI4 1
ASGNI4
ADDRGP4 $333
JUMPV
LABELV $332
ADDRLP4 1056
CNSTI4 0
ASGNI4
LABELV $333
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 G_BotConnect
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $329
line 937
;937:			return "BotConnectfailed";
ADDRGP4 $334
RETP4
ADDRGP4 $309
JUMPV
LABELV $329
line 939
;938:		}
;939:	}
LABELV $327
line 943
;940:#endif
;941:
;942:	// get and distribute relevent paramters
;943:	G_LogPrintf( "ClientConnect: %i\n", clientNum );
ADDRGP4 $335
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 944
;944:	ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 948
;945:#ifndef SINGLEPLAYER // no connection messages
;946:
;947:	// don't do the "xxx connected" messages if they were caried over from previous level
;948:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $336
line 949
;949:		trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " connected\n\"", client->pers.netname) );
ADDRGP4 $338
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 950
;950:	}
LABELV $336
line 952
;951:
;952:	if ( g_gametype.integer >= GT_TEAM &&
ADDRLP4 1052
CNSTI4 3
ASGNI4
ADDRGP4 g_gametype+12
INDIRI4
ADDRLP4 1052
INDIRI4
LTI4 $339
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRLP4 1052
INDIRI4
EQI4 $339
line 953
;953:		client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 954
;954:		BroadcastTeamChange( client, -1 );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 955
;955:	}
LABELV $339
line 959
;956:#endif
;957:
;958:	// count current clients and rank for scoreboard
;959:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 966
;960:
;961:	// for statistics
;962://	client->areabits = areabits;
;963://	if ( !client->areabits )
;964://		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;965:
;966:	return NULL;
CNSTP4 0
RETP4
LABELV $309
endproc ClientConnect 1064 12
export ClientBegin
proc ClientBegin 28 12
line 978
;967:}
;968:
;969:/*
;970:===========
;971:ClientBegin
;972:
;973:called when a client has finished connecting, and is ready
;974:to be placed into the level.  This will happen every level load,
;975:and on transition between teams, but doesn't happen on respawns
;976:============
;977:*/
;978:void ClientBegin( int clientNum ) {
line 986
;979:	gentity_t	*ent;
;980:	gclient_t	*client;
;981:#ifndef SINGLEPLAYER
;982:	gentity_t	*tent;
;983:#endif
;984:	int			flags;
;985:
;986:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 808
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 988
;987:
;988:	client = level.clients + clientNum;
ADDRLP4 0
CNSTI4 784
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 990
;989:
;990:	if ( ent->r.linked ) {
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $343
line 991
;991:		trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 992
;992:	}
LABELV $343
line 993
;993:	G_InitGentity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 994
;994:	ent->touch = 0;
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
CNSTP4 0
ASGNP4
line 995
;995:	ent->pain = 0;
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
CNSTP4 0
ASGNP4
line 996
;996:	ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 998
;997:
;998:	client->pers.connected = CON_CONNECTED;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 2
ASGNI4
line 999
;999:	client->pers.enterTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1000
;1000:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 0
ASGNI4
line 1007
;1001:
;1002:	// save eflags around this, because changing teams will
;1003:	// cause this to happen with a valid entity, and we
;1004:	// want to make sure the teleport bit is set right
;1005:	// so the viewpoint doesn't interpolate through the
;1006:	// world to the new position
;1007:	flags = client->ps.eFlags;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 1008
;1008:	memset( &client->ps, 0, sizeof( client->ps ) );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 468
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1009
;1009:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1012
;1010:
;1011:	// locate ent at a spawn point
;1012:	ClientSpawn( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 1015
;1013:#ifndef SINGLEPLAYER // remove teleport effect and enter message
;1014:
;1015:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 3
EQI4 $346
line 1017
;1016:		// send event
;1017:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 1018
;1018:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 20
CNSTI4 168
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 1020
;1019:
;1020:		if ( g_gametype.integer != GT_TOURNAMENT  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $348
line 1021
;1021:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " entered the game\n\"", client->pers.netname) );
ADDRGP4 $351
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1022
;1022:		}
LABELV $348
line 1023
;1023:	}
LABELV $346
line 1024
;1024:	G_LogPrintf( "ClientBegin: %i\n", clientNum );
ADDRGP4 $352
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1027
;1025:
;1026:	// count current clients and rank for scoreboard
;1027:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1029
;1028:#endif
;1029:}
LABELV $342
endproc ClientBegin 28 12
export ClientSpawn
proc ClientSpawn 1376 16
line 1040
;1030:
;1031:/*
;1032:===========
;1033:ClientSpawn
;1034:
;1035:Called every time a client is placed fresh in the world:
;1036:after the first ClientBegin, and after each respawn
;1037:Initializes all non-persistant parts of playerState
;1038:============
;1039:*/
;1040:void ClientSpawn(gentity_t *ent) {
line 1059
;1041:	int		index;
;1042:	vec3_t	spawn_origin, spawn_angles;
;1043:	gclient_t	*client;
;1044:	int		i;
;1045:	clientPersistant_t	saved;
;1046:	clientSession_t		savedSess;
;1047:	int		persistant[MAX_PERSISTANT];
;1048:	gentity_t	*spawnPoint;
;1049:	int		flags;
;1050:	int		savedPing;
;1051://	char	*savedAreaBits;
;1052:	int		accuracy_hits, accuracy_shots;
;1053:	int		eventSequence;
;1054:	char	userinfo[MAX_INFO_STRING];
;1055:#ifdef SINGLEPLAYER
;1056:	int save_loading;
;1057:#endif
;1058:
;1059:	index = ent - g_entities;
ADDRLP4 100
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 808
DIVI4
ASGNI4
line 1060
;1060:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1065
;1061:
;1062:	// find a spawn point
;1063:	// do it before setting health back up, so farthest
;1064:	// ranging doesn't count this client
;1065:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 3
NEI4 $354
line 1066
;1066:		spawnPoint = SelectSpectatorSpawnPoint ( 
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1324
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1324
INDIRP4
ASGNP4
line 1068
;1067:						spawn_origin, spawn_angles);
;1068:	} else if (g_gametype.integer >= GT_CTF ) {
ADDRGP4 $355
JUMPV
LABELV $354
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $356
line 1070
;1069:		// all base oriented team games use the CTF spawn points
;1070:		spawnPoint = SelectCTFSpawnPoint ( 
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1328
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1328
INDIRP4
ASGNP4
line 1074
;1071:						client->sess.sessionTeam, 
;1072:						client->pers.teamState.state, 
;1073:						spawn_origin, spawn_angles);
;1074:	} else {
ADDRGP4 $357
JUMPV
LABELV $356
LABELV $359
line 1075
;1075:		do {
line 1077
;1076:			// the first spawn should be at a good looking spot
;1077:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 1328
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ADDRLP4 1328
INDIRI4
NEI4 $362
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 1328
INDIRI4
EQI4 $362
line 1078
;1078:				client->pers.initialSpawn = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 1079
;1079:				spawnPoint = SelectInitialSpawnPoint( spawn_origin, spawn_angles );
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1332
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1332
INDIRP4
ASGNP4
line 1080
;1080:			} else {
ADDRGP4 $363
JUMPV
LABELV $362
line 1082
;1081:				// don't spawn near existing origin if possible
;1082:				spawnPoint = SelectSpawnPoint ( 
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1332
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1332
INDIRP4
ASGNP4
line 1085
;1083:					client->ps.origin, 
;1084:					spawn_origin, spawn_angles);
;1085:			}
LABELV $363
line 1089
;1086:
;1087:			// Tim needs to prevent bots from spawning at the initial point
;1088:			// on q3dm0...
;1089:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 1332
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 1332
INDIRI4
EQI4 $364
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 1332
INDIRI4
EQI4 $364
line 1090
;1090:				continue;	// try again
ADDRGP4 $360
JUMPV
LABELV $364
line 1093
;1091:			}
;1092:			// just to be symetric, we have a nohumans option...
;1093:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 1336
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 1336
INDIRI4
EQI4 $361
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 1336
INDIRI4
NEI4 $361
line 1094
;1094:				continue;	// try again
line 1097
;1095:			}
;1096:
;1097:			break;
LABELV $360
line 1099
;1098:
;1099:		} while ( 1 );
ADDRGP4 $359
JUMPV
LABELV $361
line 1100
;1100:	}
LABELV $357
LABELV $355
line 1101
;1101:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 1104
;1102:
;1103:	// always clear the kamikaze flag
;1104:	ent->s.eFlags &= ~EF_KAMIKAZE;
ADDRLP4 1324
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 1324
INDIRP4
ADDRLP4 1324
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 1108
;1105:
;1106:	// toggle the teleport bit so the client knows to not lerp
;1107:	// and never clear the voted flag
;1108:	flags = ent->client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 1109
;1109:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 104
ADDRLP4 104
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 1113
;1110:
;1111:	// clear everything but the persistant data
;1112:
;1113:	saved = client->pers;
ADDRLP4 1132
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRB
ASGNB 148
line 1114
;1114:	savedSess = client->sess;
ADDRLP4 1280
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRB
ASGNB 28
line 1115
;1115:	savedPing = client->ps.ping;
ADDRLP4 1308
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1117
;1116://	savedAreaBits = client->areabits;
;1117:	accuracy_hits = client->accuracy_hits;
ADDRLP4 1312
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 1118
;1118:	accuracy_shots = client->accuracy_shots;
ADDRLP4 1316
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 1119
;1119:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $368
line 1120
;1120:		persistant[i] = client->ps.persistant[i];
ADDRLP4 1328
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1328
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 1328
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1121
;1121:	}
LABELV $369
line 1119
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $368
line 1122
;1122:	eventSequence = client->ps.eventSequence;
ADDRLP4 1320
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1124
;1123:
;1124:	memset (client, 0, sizeof(*client)); // bk FIXME: Com_Memset?
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 784
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1126
;1125:
;1126:	client->pers = saved;
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
ADDRLP4 1132
INDIRB
ASGNB 148
line 1127
;1127:	client->sess = savedSess;
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
ADDRLP4 1280
INDIRB
ASGNB 28
line 1128
;1128:	client->ps.ping = savedPing;
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 1308
INDIRI4
ASGNI4
line 1130
;1129://	client->areabits = savedAreaBits;
;1130:	client->accuracy_hits = accuracy_hits;
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 1312
INDIRI4
ASGNI4
line 1131
;1131:	client->accuracy_shots = accuracy_shots;
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 1316
INDIRI4
ASGNI4
line 1132
;1132:	client->lastkilled_client = -1;
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 -1
ASGNI4
line 1134
;1133:
;1134:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $372
line 1135
;1135:		client->ps.persistant[i] = persistant[i];
ADDRLP4 1328
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1328
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
ADDRLP4 1328
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 1136
;1136:	}
LABELV $373
line 1134
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $372
line 1137
;1137:	client->ps.eventSequence = eventSequence;
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 1320
INDIRI4
ASGNI4
line 1139
;1138:	// increment the spawncount so the client will detect the respawn
;1139:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 1328
ADDRLP4 4
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
ADDRLP4 1328
INDIRP4
ADDRLP4 1328
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1140
;1140:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
line 1142
;1141:
;1142:	client->airOutTime = level.time + 12000;
ADDRLP4 4
INDIRP4
CNSTI4 748
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1144
;1143:
;1144:	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
ADDRLP4 100
INDIRI4
ARGI4
ADDRLP4 108
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1146
;1145:	// set max health
;1146:	client->pers.maxHealth = atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 108
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 1336
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1336
INDIRP4
ARGP4
ADDRLP4 1340
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 1340
INDIRI4
ASGNI4
line 1147
;1147:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 1344
ADDRLP4 4
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1344
INDIRI4
CNSTI4 1
LTI4 $379
ADDRLP4 1344
INDIRI4
CNSTI4 100
LEI4 $377
LABELV $379
line 1148
;1148:		client->pers.maxHealth = 100;
ADDRLP4 4
INDIRP4
CNSTI4 548
ADDP4
CNSTI4 100
ASGNI4
line 1149
;1149:	}
LABELV $377
line 1151
;1150:	// clear entity values
;1151:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ASGNI4
line 1152
;1152:	client->ps.eFlags = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1154
;1153:
;1154:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1023
ASGNI4
line 1155
;1155:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 784
ADDRLP4 100
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1156
;1156:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 1157
;1157:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1158
;1158:	ent->classname = "player";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $380
ASGNP4
line 1159
;1159:	ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 33554432
ASGNI4
line 1160
;1160:	ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 33619969
ASGNI4
line 1161
;1161:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 player_die
ASGNP4
line 1162
;1162:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
CNSTI4 0
ASGNI4
line 1163
;1163:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 1164
;1164:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 0
ASGNI4
line 1166
;1165:	
;1166:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 1167
;1167:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 1169
;1168:
;1169:	client->ps.clientNum = index;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 1172
;1170:#ifndef SINGLEPLAYER // give player no weapons to start with
;1171:
;1172:	client->ps.stats[STAT_WEAPONS] = ( 1 << WP_MACHINEGUN );
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1173
;1173:	if ( g_gametype.integer == GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $381
line 1174
;1174:		client->ps.ammo[WP_MACHINEGUN] = 50;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 50
ASGNI4
line 1175
;1175:	} else {
ADDRGP4 $382
JUMPV
LABELV $381
line 1176
;1176:		client->ps.ammo[WP_MACHINEGUN] = 100;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 100
ASGNI4
line 1177
;1177:	}
LABELV $382
line 1179
;1178:
;1179:	client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_GAUNTLET );
ADDRLP4 1352
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 1352
INDIRP4
ADDRLP4 1352
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1180
;1180:	client->ps.ammo[WP_GAUNTLET] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 -1
ASGNI4
line 1184
;1181:#else
;1182:	client->ps.stats[STAT_WEAPONS] = 0;
;1183:#endif
;1184:	client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 -1
ASGNI4
line 1188
;1185:
;1186:	// health will count down towards max_health
;1187:#ifndef SINGLEPLAYER // no health countdown
;1188:	ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 1360
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 1360
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 1360
INDIRI4
ASGNI4
line 1193
;1189:#else
;1190:	ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH];
;1191:#endif
;1192:
;1193:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1194
;1194:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 76
INDIRB
ASGNB 12
line 1197
;1195:
;1196:	// the respawned flag will be cleared after the attack and jump keys come up
;1197:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 1364
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1364
INDIRP4
ADDRLP4 1364
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1199
;1198:
;1199:	trap_GetUsercmd( client - level.clients, &ent->client->pers.cmd );
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 784
DIVI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1200
;1200:	SetClientViewAngle( ent, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1202
;1201:
;1202:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 3
NEI4 $384
line 1204
;1203:
;1204:	} else {
ADDRGP4 $385
JUMPV
LABELV $384
line 1205
;1205:		G_KillBox( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 1206
;1206:		trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1210
;1207:
;1208:		// force the base weapon up
;1209:#ifndef SINGLEPLAYER // no ready weapon at start
;1210:		client->ps.weapon = WP_MACHINEGUN;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 1211
;1211:		client->ps.weaponstate = WEAPON_READY;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1217
;1212:#else
;1213:		client->ps.weapon = WP_NONE;
;1214:		client->ps.weaponstate = WEAPON_READY;
;1215:#endif
;1216:
;1217:	}
LABELV $385
line 1220
;1218:
;1219:	// don't allow full run speed for a bit
;1220:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 1368
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1368
INDIRP4
ADDRLP4 1368
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1221
;1221:	client->ps.pm_time = 100;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 1223
;1222:
;1223:	client->respawnTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1224
;1224:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 4
INDIRP4
CNSTI4 736
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 1225
;1225:	client->latched_buttons = 0;
ADDRLP4 4
INDIRP4
CNSTI4 664
ADDP4
CNSTI4 0
ASGNI4
line 1228
;1226:
;1227:	// set default animations
;1228:	client->ps.torsoAnim = TORSO_STAND;
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 11
ASGNI4
line 1229
;1229:	client->ps.legsAnim = LEGS_IDLE;
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 22
ASGNI4
line 1231
;1230:
;1231:	if ( level.intermissiontime ) {
ADDRGP4 level+9128
INDIRI4
CNSTI4 0
EQI4 $389
line 1232
;1232:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1233
;1233:	} else {
ADDRGP4 $390
JUMPV
LABELV $389
line 1235
;1234:		// fire the targets of the spawn point
;1235:		G_UseTargets( spawnPoint, ent );
ADDRLP4 72
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1240
;1236:
;1237:		// select the highest weapon number available, after any
;1238:		// spawn given items have fired
;1239:#ifndef SINGLEPLAYER // don't select any weapon after spawning
;1240:		client->ps.weapon = 1;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 1241
;1241:		for ( i = WP_NUM_WEAPONS - 1 ; i > 0 ; i-- ) {
ADDRLP4 0
CNSTI4 10
ASGNI4
LABELV $392
line 1242
;1242:			if ( client->ps.stats[STAT_WEAPONS] & ( 1 << i ) ) {
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $396
line 1243
;1243:				client->ps.weapon = i;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1244
;1244:				break;
ADDRGP4 $394
JUMPV
LABELV $396
line 1246
;1245:			}
;1246:		}
LABELV $393
line 1241
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $392
LABELV $394
line 1248
;1247:#endif
;1248:	}
LABELV $390
line 1263
;1249:#ifdef SINGLEPLAYER // load persistant data after level change or respawn
;1250:	//
;1251:	// Load persistant data here
;1252:	//
;1253:	save_loading = trap_Cvar_VariableIntegerValue( "Save_Loading" );
;1254:	if(save_loading == 2 || save_loading == 3) // level change or restart
;1255:	{
;1256:		G_LoadPersistant(); // get data
;1257:		trap_Cvar_Set("Save_Loading","0"); // set to no loading
;1258:	} 
;1259:#endif
;1260:
;1261:	// run a client frame to drop exactly to the floor,
;1262:	// initialize animations and other things
;1263:	client->ps.commandTime = level.time - 100;
ADDRLP4 4
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 1264
;1264:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1265
;1265:	ClientThink( ent-g_entities );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 808
DIVI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 1268
;1266:
;1267:	// positively link the client, even if the command times are weird
;1268:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 3
EQI4 $400
line 1269
;1269:		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1270
;1270:		VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 1372
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1372
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 1372
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1271
;1271:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1272
;1272:	}
LABELV $400
line 1275
;1273:
;1274:	// run the presend to set anything else
;1275:	ClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1278
;1276:
;1277:	// clear entity state values
;1278:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1279
;1279:}
LABELV $353
endproc ClientSpawn 1376 16
export ClientDisconnect
proc ClientDisconnect 24 8
line 1294
;1280:
;1281:
;1282:/*
;1283:===========
;1284:ClientDisconnect
;1285:
;1286:Called when a player drops from the server.
;1287:Will not be called between levels.
;1288:
;1289:This should NOT be called directly by any game logic,
;1290:call trap_DropClient(), which will call this and do
;1291:server system housekeeping.
;1292:============
;1293:*/
;1294:void ClientDisconnect( int clientNum ) {
line 1302
;1295:	gentity_t	*ent;
;1296:	gentity_t	*tent;
;1297:	int			i;
;1298:
;1299:	// cleanup if we are kicking a bot that
;1300:	// hasn't spawned yet
;1301:#ifndef SINGLEPLAYER // ignore bot stuff
;1302:	G_RemoveQueuedBotBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 1305
;1303:#endif
;1304:
;1305:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 808
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1306
;1306:	if ( !ent->client ) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $403
line 1307
;1307:		return;
ADDRGP4 $402
JUMPV
LABELV $403
line 1311
;1308:	}
;1309:
;1310:	// stop any following clients
;1311:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $408
JUMPV
LABELV $405
line 1312
;1312:		if ( level.clients[i].sess.sessionTeam == TEAM_SPECTATOR
ADDRLP4 12
CNSTI4 784
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 3
NEI4 $410
ADDRLP4 12
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $410
ADDRLP4 12
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $410
line 1314
;1313:			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
;1314:			&& level.clients[i].sess.spectatorClient == clientNum ) {
line 1315
;1315:			StopFollowing( &g_entities[i] );
CNSTI4 808
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 1316
;1316:		}
LABELV $410
line 1317
;1317:	}
LABELV $406
line 1311
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $408
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $405
line 1320
;1318:
;1319:	// send effect if they were completely connected
;1320:	if ( ent->client->pers.connected == CON_CONNECTED 
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $412
ADDRLP4 12
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 3
EQI4 $412
line 1321
;1321:		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 1322
;1322:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 43
ARGI4
ADDRLP4 16
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 1323
;1323:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 20
CNSTI4 168
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 1327
;1324:
;1325:		// They don't get to take powerups with them!
;1326:		// Especially important for stuff like CTF flags
;1327:		TossClientItems( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 1335
;1328:#ifdef MISSIONPACK
;1329:		TossClientPersistantPowerups( ent );
;1330:		if( g_gametype.integer == GT_HARVESTER ) {
;1331:			TossClientCubes( ent );
;1332:		}
;1333:#endif
;1334:
;1335:	}
LABELV $412
line 1337
;1336:
;1337:	G_LogPrintf( "ClientDisconnect: %i\n", clientNum );
ADDRGP4 $414
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1340
;1338:
;1339:	// if we are playing in tourney mode and losing, give a win to the other player
;1340:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $415
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 level+9128
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $415
ADDRGP4 level+16
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $415
ADDRGP4 level+84+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $415
line 1342
;1341:		&& !level.intermissiontime
;1342:		&& !level.warmupTime && level.sortedClients[1] == clientNum ) {
line 1343
;1343:		level.clients[ level.sortedClients[0] ].sess.wins++;
ADDRLP4 20
CNSTI4 784
ADDRGP4 level+84
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 632
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
line 1344
;1344:		ClientUserinfoChanged( level.sortedClients[0] );
ADDRGP4 level+84
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1345
;1345:	}
LABELV $415
line 1347
;1346:
;1347:	if( g_gametype.integer == GT_TOURNAMENT &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $424
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $424
ADDRGP4 level+9128
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $424
line 1349
;1348:		ent->client->sess.sessionTeam == TEAM_FREE &&
;1349:		level.intermissiontime ) {
line 1351
;1350:
;1351:		trap_SendConsoleCommand( EXEC_APPEND, "map_restart 0\n" );
CNSTI4 2
ARGI4
ADDRGP4 $428
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1352
;1352:		level.restarted = qtrue;
ADDRGP4 level+68
CNSTI4 1
ASGNI4
line 1353
;1353:		level.changemap = NULL;
ADDRGP4 level+9132
CNSTP4 0
ASGNP4
line 1354
;1354:		level.intermissiontime = 0;
ADDRGP4 level+9128
CNSTI4 0
ASGNI4
line 1355
;1355:	}
LABELV $424
line 1357
;1356:
;1357:	trap_UnlinkEntity (ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1358
;1358:	ent->s.modelindex = 0;
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 1359
;1359:	ent->inuse = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1360
;1360:	ent->classname = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $432
ASGNP4
line 1361
;1361:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 1362
;1362:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 0
ASGNI4
line 1363
;1363:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1365
;1364:
;1365:	trap_SetConfigstring( CS_PLAYERS + clientNum, "");
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRGP4 $433
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1367
;1366:
;1367:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1370
;1368:#ifndef SINGLEPLAYER // ignore bots
;1369:
;1370:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $434
line 1371
;1371:		BotAIShutdownClient( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 1372
;1372:	}
LABELV $434
line 1374
;1373:#endif
;1374:}
LABELV $402
endproc ClientDisconnect 24 8
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import CalculateRanks
import AddScore
import player_die
import InitClientResp
import InitClientPersistant
import BeginIntermission
import Laser_Think
import Laser_Gen
import Info_Think
import Info_Gen
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
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
LABELV $433
byte 1 0
align 1
LABELV $432
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
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $428
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
align 1
LABELV $414
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 68
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $380
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $352
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 66
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $351
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $338
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $335
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $334
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $322
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $320
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $315
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $312
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $308
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $307
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $306
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $305
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $302
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $301
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $300
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $299
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $298
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $294
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $292
byte 1 98
byte 1 0
align 1
LABELV $291
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $287
byte 1 114
byte 1 0
align 1
LABELV $286
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $283
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $277
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $276
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $275
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $274
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $267
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $266
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $261
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $256
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $253
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $252
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $249
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $248
byte 1 92
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 92
byte 1 98
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $244
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $144
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $124
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $61
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $57
byte 1 110
byte 1 111
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $54
byte 1 48
byte 1 0
align 1
LABELV $53
byte 1 110
byte 1 111
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
