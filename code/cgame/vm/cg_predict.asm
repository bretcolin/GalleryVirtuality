export CG_BuildSolidList
code
proc CG_BuildSolidList 28 0
file "../cg_predict.c"
line 26
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_predict.c -- this file generates cg.predictedPlayerState by either
;4:// interpolating between snapshots from the server or locally predicting
;5:// ahead the client's movement.
;6:// It also handles local physics interaction, like fragments bouncing off walls
;7:
;8:#include "cg_local.h"
;9:
;10:static	pmove_t		cg_pmove;
;11:
;12:static	int			cg_numSolidEntities;
;13:static	centity_t	*cg_solidEntities[MAX_ENTITIES_IN_SNAPSHOT];
;14:static	int			cg_numTriggerEntities;
;15:static	centity_t	*cg_triggerEntities[MAX_ENTITIES_IN_SNAPSHOT];
;16:
;17:/*
;18:====================
;19:CG_BuildSolidList
;20:
;21:When a new cg.snap has been set, this function builds a sublist
;22:of the entities that are actually solid, to make for more
;23:efficient collision detection
;24:====================
;25:*/
;26:void CG_BuildSolidList( void ) {
line 32
;27:	int			i;
;28:	centity_t	*cent;
;29:	snapshot_t	*snap;
;30:	entityState_t	*ent;
;31:
;32:	cg_numSolidEntities = 0;
ADDRGP4 cg_numSolidEntities
CNSTI4 0
ASGNI4
line 33
;33:	cg_numTriggerEntities = 0;
ADDRGP4 cg_numTriggerEntities
CNSTI4 0
ASGNI4
line 35
;34:
;35:	if ( cg.nextSnap && !cg.nextFrameTeleport && !cg.thisFrameTeleport ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $71
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 cg+107596
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $71
ADDRGP4 cg+107592
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $71
line 36
;36:		snap = cg.nextSnap;
ADDRLP4 12
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 37
;37:	} else {
ADDRGP4 $72
JUMPV
LABELV $71
line 38
;38:		snap = cg.snap;
ADDRLP4 12
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 39
;39:	}
LABELV $72
line 41
;40:
;41:	for ( i = 0 ; i < snap->numEntities ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $81
JUMPV
LABELV $78
line 42
;42:		cent = &cg_entities[ snap->entities[ i ].number ];
ADDRLP4 0
CNSTI4 728
CNSTI4 208
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 43
;43:		ent = &cent->currentState;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 45
;44:
;45:		if ( ent->eType == ET_ITEM || ent->eType == ET_PUSH_TRIGGER || ent->eType == ET_TELEPORT_TRIGGER ) {
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $85
ADDRLP4 20
INDIRI4
CNSTI4 8
EQI4 $85
ADDRLP4 20
INDIRI4
CNSTI4 9
NEI4 $82
LABELV $85
line 46
;46:			cg_triggerEntities[cg_numTriggerEntities] = cent;
ADDRGP4 cg_numTriggerEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 47
;47:			cg_numTriggerEntities++;
ADDRLP4 24
ADDRGP4 cg_numTriggerEntities
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 48
;48:			continue;
ADDRGP4 $79
JUMPV
LABELV $82
line 51
;49:		}
;50:
;51:		if ( cent->nextState.solid ) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $86
line 52
;52:			cg_solidEntities[cg_numSolidEntities] = cent;
ADDRGP4 cg_numSolidEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 53
;53:			cg_numSolidEntities++;
ADDRLP4 24
ADDRGP4 cg_numSolidEntities
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 54
;54:			continue;
LABELV $86
line 56
;55:		}
;56:	}
LABELV $79
line 41
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $81
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $78
line 57
;57:}
LABELV $70
endproc CG_BuildSolidList 28 0
proc CG_ClipMoveToEntities 144 36
line 66
;58:
;59:/*
;60:====================
;61:CG_ClipMoveToEntities
;62:
;63:====================
;64:*/
;65:static void CG_ClipMoveToEntities ( const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end,
;66:							int skipNumber, int mask, trace_t *tr ) {
line 75
;67:	int			i, x, zd, zu;
;68:	trace_t		trace;
;69:	entityState_t	*ent;
;70:	clipHandle_t 	cmodel;
;71:	vec3_t		bmins, bmaxs;
;72:	vec3_t		origin, angles;
;73:	centity_t	*cent;
;74:
;75:	for ( i = 0 ; i < cg_numSolidEntities ; i++ ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $89
line 76
;76:		cent = cg_solidEntities[ i ];
ADDRLP4 60
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
line 77
;77:		ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
line 79
;78:
;79:		if ( ent->number == skipNumber ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 16
INDIRI4
NEI4 $93
line 80
;80:			continue;
ADDRGP4 $90
JUMPV
LABELV $93
line 83
;81:		}
;82:
;83:		if ( ent->solid == SOLID_BMODEL ) {
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $95
line 85
;84:			// special value for bmodel
;85:			cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 132
INDIRI4
ASGNI4
line 86
;86:			VectorCopy( cent->lerpAngles, angles );
ADDRLP4 108
ADDRLP4 60
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 87
;87:			BG_EvaluateTrajectory( &cent->currentState.pos, cg.physicsTime, origin );
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRLP4 96
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 88
;88:		} else {
ADDRGP4 $96
JUMPV
LABELV $95
line 90
;89:			// encoded bbox
;90:			x = (ent->solid & 255);
ADDRLP4 120
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 91
;91:			zd = ((ent->solid>>8) & 255);
ADDRLP4 124
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 92
;92:			zu = ((ent->solid>>16) & 255) - 32;
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CNSTI4 32
SUBI4
ASGNI4
line 94
;93:
;94:			bmins[0] = bmins[1] = -x;
ADDRLP4 132
ADDRLP4 120
INDIRI4
NEGI4
CVIF4 4
ASGNF4
ADDRLP4 72+4
ADDRLP4 132
INDIRF4
ASGNF4
ADDRLP4 72
ADDRLP4 132
INDIRF4
ASGNF4
line 95
;95:			bmaxs[0] = bmaxs[1] = x;
ADDRLP4 136
ADDRLP4 120
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 84+4
ADDRLP4 136
INDIRF4
ASGNF4
ADDRLP4 84
ADDRLP4 136
INDIRF4
ASGNF4
line 96
;96:			bmins[2] = -zd;
ADDRLP4 72+8
ADDRLP4 124
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 97
;97:			bmaxs[2] = zu;
ADDRLP4 84+8
ADDRLP4 128
INDIRI4
CVIF4 4
ASGNF4
line 99
;98:
;99:			cmodel = trap_CM_TempBoxModel( bmins, bmaxs );
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 140
ADDRGP4 trap_CM_TempBoxModel
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 140
INDIRI4
ASGNI4
line 100
;100:			VectorCopy( vec3_origin, angles );
ADDRLP4 108
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 101
;101:			VectorCopy( cent->lerpOrigin, origin );
ADDRLP4 96
ADDRLP4 60
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 102
;102:		}
LABELV $96
line 105
;103:
;104:
;105:		trap_CM_TransformedBoxTrace ( &trace, start, end,
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 trap_CM_TransformedBoxTrace
CALLV
pop
line 108
;106:			mins, maxs, cmodel,  mask, origin, angles);
;107:
;108:		if (trace.allsolid || trace.fraction < tr->fraction) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $105
ADDRLP4 4+8
INDIRF4
ADDRFP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
GEF4 $102
LABELV $105
line 109
;109:			trace.entityNum = ent->number;
ADDRLP4 4+52
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 110
;110:			*tr = trace;
ADDRFP4 24
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 56
line 111
;111:		} else if (trace.startsolid) {
ADDRGP4 $103
JUMPV
LABELV $102
ADDRLP4 4+4
INDIRI4
CNSTI4 0
EQI4 $107
line 112
;112:			tr->startsolid = qtrue;
ADDRFP4 24
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 113
;113:		}
LABELV $107
LABELV $103
line 114
;114:		if ( tr->allsolid ) {
ADDRFP4 24
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $110
line 115
;115:			return;
ADDRGP4 $88
JUMPV
LABELV $110
line 117
;116:		}
;117:	}
LABELV $90
line 75
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $92
ADDRLP4 64
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
LTI4 $89
line 118
;118:}
LABELV $88
endproc CG_ClipMoveToEntities 144 36
export CG_Trace
proc CG_Trace 60 28
line 126
;119:
;120:/*
;121:================
;122:CG_Trace
;123:================
;124:*/
;125:void	CG_Trace( trace_t *result, const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end, 
;126:					 int skipNumber, int mask ) {
line 129
;127:	trace_t	t;
;128:
;129:	trap_CM_BoxTrace ( &t, start, end, mins, maxs, 0, mask);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 130
;130:	t.entityNum = t.fraction != 1.0 ? ENTITYNUM_WORLD : ENTITYNUM_NONE;
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $116
ADDRLP4 56
CNSTI4 1022
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $116
ADDRLP4 56
CNSTI4 1023
ASGNI4
LABELV $117
ADDRLP4 0+52
ADDRLP4 56
INDIRI4
ASGNI4
line 132
;131:	// check all other solid models
;132:	CG_ClipMoveToEntities (start, mins, maxs, end, skipNumber, mask, &t);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 CG_ClipMoveToEntities
CALLV
pop
line 134
;133:
;134:	*result = t;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 56
line 135
;135:}
LABELV $112
endproc CG_Trace 60 28
export CG_PointContents
proc CG_PointContents 36 16
line 142
;136:
;137:/*
;138:================
;139:CG_PointContents
;140:================
;141:*/
;142:int		CG_PointContents( const vec3_t point, int passEntityNum ) {
line 149
;143:	int			i;
;144:	entityState_t	*ent;
;145:	centity_t	*cent;
;146:	clipHandle_t cmodel;
;147:	int			contents;
;148:
;149:	contents = trap_CM_PointContents (point, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 151
;150:
;151:	for ( i = 0 ; i < cg_numSolidEntities ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $122
JUMPV
LABELV $119
line 152
;152:		cent = cg_solidEntities[ i ];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
line 154
;153:
;154:		ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 156
;155:
;156:		if ( ent->number == passEntityNum ) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $123
line 157
;157:			continue;
ADDRGP4 $120
JUMPV
LABELV $123
line 160
;158:		}
;159:
;160:		if (ent->solid != SOLID_BMODEL) { // special value for bmodel
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $125
line 161
;161:			continue;
ADDRGP4 $120
JUMPV
LABELV $125
line 164
;162:		}
;163:
;164:		cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 165
;165:		if ( !cmodel ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $127
line 166
;166:			continue;
ADDRGP4 $120
JUMPV
LABELV $127
line 169
;167:		}
;168:
;169:		contents |= trap_CM_TransformedPointContents( point, cmodel, ent->origin, ent->angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_CM_TransformedPointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
line 170
;170:	}
LABELV $120
line 151
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $122
ADDRLP4 4
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
LTI4 $119
line 172
;171:
;172:	return contents;
ADDRLP4 16
INDIRI4
RETI4
LABELV $118
endproc CG_PointContents 36 16
proc CG_InterpolatePlayerState 64 12
line 184
;173:}
;174:
;175:
;176:/*
;177:========================
;178:CG_InterpolatePlayerState
;179:
;180:Generates cg.predictedPlayerState by interpolating between
;181:cg.snap->player_state and cg.nextFrame->player_state
;182:========================
;183:*/
;184:static void CG_InterpolatePlayerState( qboolean grabAngles ) {
line 190
;185:	float			f;
;186:	int				i;
;187:	playerState_t	*out;
;188:	snapshot_t		*prev, *next;
;189:
;190:	out = &cg.predictedPlayerState;
ADDRLP4 12
ADDRGP4 cg+107636
ASGNP4
line 191
;191:	prev = cg.snap;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 192
;192:	next = cg.nextSnap;
ADDRLP4 8
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 194
;193:
;194:	*out = cg.snap->ps;
ADDRLP4 12
INDIRP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 197
;195:
;196:	// if we are still allowing local input, short circuit the view angles
;197:	if ( grabAngles ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $134
line 201
;198:		usercmd_t	cmd;
;199:		int			cmdNum;
;200:
;201:		cmdNum = trap_GetCurrentCmdNumber();
ADDRLP4 48
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
line 202
;202:		trap_GetUserCmd( cmdNum, &cmd );
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 20
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 204
;203:
;204:		PM_UpdateViewAngles( out, &cmd );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 205
;205:	}
LABELV $134
line 208
;206:
;207:	// if the next frame is a teleport, we can't lerp to it
;208:	if ( cg.nextFrameTeleport ) {
ADDRGP4 cg+107596
INDIRI4
CNSTI4 0
EQI4 $136
line 209
;209:		return;
ADDRGP4 $129
JUMPV
LABELV $136
line 212
;210:	}
;211:
;212:	if ( !next || next->serverTime <= prev->serverTime ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $141
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
GTI4 $139
LABELV $141
line 213
;213:		return;
ADDRGP4 $129
JUMPV
LABELV $139
line 216
;214:	}
;215:
;216:	f = (float)( cg.time - prev->serverTime ) / ( next->serverTime - prev->serverTime );
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 32
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 218
;217:
;218:	i = next->ps.bobCycle;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 219
;219:	if ( i < prev->ps.bobCycle ) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
GEI4 $143
line 220
;220:		i += 256;		// handle wraparound
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
ASGNI4
line 221
;221:	}
LABELV $143
line 222
;222:	out->bobCycle = prev->ps.bobCycle + f * ( i - prev->ps.bobCycle );
ADDRLP4 36
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 224
;223:
;224:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $145
line 225
;225:		out->origin[i] = prev->ps.origin[i] + f * (next->ps.origin[i] - prev->ps.origin[i] );
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 44
CNSTI4 64
ASGNI4
ADDRLP4 48
ADDRLP4 40
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 40
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ADDRLP4 48
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 40
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 226
;226:		if ( !grabAngles ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $149
line 227
;227:			out->viewangles[i] = LerpAngle( 
ADDRLP4 52
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
CNSTI4 196
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRLP4 52
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 152
ADDP4
ADDP4
ADDRLP4 60
INDIRF4
ASGNF4
line 229
;228:				prev->ps.viewangles[i], next->ps.viewangles[i], f );
;229:		}
LABELV $149
line 230
;230:		out->velocity[i] = prev->ps.velocity[i] + 
ADDRLP4 52
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
CNSTI4 76
ASGNI4
ADDRLP4 60
ADDRLP4 52
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ADDRLP4 60
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 52
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDP4
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 232
;231:			f * (next->ps.velocity[i] - prev->ps.velocity[i] );
;232:	}
LABELV $146
line 224
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $145
line 234
;233:
;234:}
LABELV $129
endproc CG_InterpolatePlayerState 64 12
proc CG_TouchItem 20 12
line 241
;235:
;236:/*
;237:===================
;238:CG_TouchItem
;239:===================
;240:*/
;241:static void CG_TouchItem( centity_t *cent ) {
line 244
;242:	gitem_t		*item;
;243:
;244:	if ( !cg_predictItems.integer ) {
ADDRGP4 cg_predictItems+12
INDIRI4
CNSTI4 0
NEI4 $152
line 245
;245:		return;
ADDRGP4 $151
JUMPV
LABELV $152
line 247
;246:	}
;247:	if ( !BG_PlayerTouchesItem( &cg.predictedPlayerState, &cent->currentState, cg.time ) ) {
ADDRGP4 cg+107636
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_PlayerTouchesItem
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $155
line 248
;248:		return;
ADDRGP4 $151
JUMPV
LABELV $155
line 252
;249:	}
;250:
;251:	// never pick an item up twice in a prediction
;252:	if ( cent->miscTime == cg.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
NEI4 $159
line 253
;253:		return;
ADDRGP4 $151
JUMPV
LABELV $159
line 256
;254:	}
;255:
;256:	if ( !BG_CanItemBeGrabbed( cgs.gametype, &cent->currentState, &cg.predictedPlayerState ) ) {
ADDRGP4 cgs+31456
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cg+107636
ARGP4
ADDRLP4 8
ADDRGP4 BG_CanItemBeGrabbed
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $162
line 257
;257:		return;		// can't hold it
ADDRGP4 $151
JUMPV
LABELV $162
line 260
;258:	}
;259:
;260:	item = &bg_itemlist[ cent->currentState.modelindex ];
ADDRLP4 0
CNSTI4 52
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 272
;261:
;262:	// Special case for flags.  
;263:	// We don't predict touching our own flag
;264:#ifdef MISSIONPACK
;265:	if( cgs.gametype == GT_1FCTF ) {
;266:		if( item->giTag != PW_NEUTRALFLAG ) {
;267:			return;
;268:		}
;269:	}
;270:	if( cgs.gametype == GT_CTF || cgs.gametype == GT_HARVESTER ) {
;271:#else
;272:	if( cgs.gametype == GT_CTF ) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $166
line 274
;273:#endif
;274:		if (cg.predictedPlayerState.persistant[PERS_TEAM] == TEAM_RED &&
ADDRGP4 cg+107636+248+12
INDIRI4
CNSTI4 1
NEI4 $169
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $169
line 276
;275:			item->giTag == PW_REDFLAG)
;276:			return;
ADDRGP4 $151
JUMPV
LABELV $169
line 277
;277:		if (cg.predictedPlayerState.persistant[PERS_TEAM] == TEAM_BLUE &&
ADDRGP4 cg+107636+248+12
INDIRI4
CNSTI4 2
NEI4 $174
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $174
line 279
;278:			item->giTag == PW_BLUEFLAG)
;279:			return;
ADDRGP4 $151
JUMPV
LABELV $174
line 280
;280:	}
LABELV $166
line 283
;281:
;282:	// grab it
;283:	BG_AddPredictableEventToPlayerstate( EV_ITEM_PICKUP, cent->currentState.modelindex , &cg.predictedPlayerState);
CNSTI4 19
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+107636
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 286
;284:
;285:	// remove it from the frame so it won't be drawn
;286:	cent->currentState.eFlags |= EF_NODRAW;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 289
;287:
;288:	// don't touch it again this prediction
;289:	cent->miscTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 292
;290:
;291:	// if its a weapon, give them some predicted ammo so the autoswitch will work
;292:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $181
line 293
;293:		cg.predictedPlayerState.stats[ STAT_WEAPONS ] |= 1 << item->giTag;
ADDRLP4 16
ADDRGP4 cg+107636+184+8
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BORI4
ASGNI4
line 294
;294:		if ( !cg.predictedPlayerState.ammo[ item->giTag ] ) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
INDIRI4
CNSTI4 0
NEI4 $186
line 295
;295:			cg.predictedPlayerState.ammo[ item->giTag ] = 1;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
CNSTI4 1
ASGNI4
line 296
;296:		}
LABELV $186
line 297
;297:	}
LABELV $181
line 298
;298:}
LABELV $151
endproc CG_TouchItem 20 12
proc CG_TouchTriggerPrediction 88 28
line 308
;299:
;300:
;301:/*
;302:=========================
;303:CG_TouchTriggerPrediction
;304:
;305:Predict push triggers and items
;306:=========================
;307:*/
;308:static void CG_TouchTriggerPrediction( void ) {
line 317
;309:	int			i;
;310:	trace_t		trace;
;311:	entityState_t	*ent;
;312:	clipHandle_t cmodel;
;313:	centity_t	*cent;
;314:	qboolean	spectator;
;315:
;316:	// dead clients don't activate triggers
;317:	if ( cg.predictedPlayerState.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $193
line 318
;318:		return;
ADDRGP4 $192
JUMPV
LABELV $193
line 321
;319:	}
;320:
;321:	spectator = ( cg.predictedPlayerState.pm_type == PM_SPECTATOR );
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 2
NEI4 $200
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRGP4 $201
JUMPV
LABELV $200
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $201
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 323
;322:
;323:	if ( cg.predictedPlayerState.pm_type != PM_NORMAL && !spectator ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 cg+107636+4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $202
ADDRLP4 72
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $202
line 324
;324:		return;
ADDRGP4 $192
JUMPV
LABELV $202
line 327
;325:	}
;326:
;327:	for ( i = 0 ; i < cg_numTriggerEntities ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $209
JUMPV
LABELV $206
line 328
;328:		cent = cg_triggerEntities[ i ];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
INDIRP4
ASGNP4
line 329
;329:		ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 331
;330:
;331:		if ( ent->eType == ET_ITEM && !spectator ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $210
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $210
line 332
;332:			CG_TouchItem( cent );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 CG_TouchItem
CALLV
pop
line 333
;333:			continue;
ADDRGP4 $207
JUMPV
LABELV $210
line 336
;334:		}
;335:
;336:		if ( ent->solid != SOLID_BMODEL ) {
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $212
line 337
;337:			continue;
ADDRGP4 $207
JUMPV
LABELV $212
line 340
;338:		}
;339:
;340:		cmodel = trap_CM_InlineModel( ent->modelindex );
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 84
INDIRI4
ASGNI4
line 341
;341:		if ( !cmodel ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $214
line 342
;342:			continue;
ADDRGP4 $207
JUMPV
LABELV $214
line 345
;343:		}
;344:
;345:		trap_CM_BoxTrace( &trace, cg.predictedPlayerState.origin, cg.predictedPlayerState.origin, 
ADDRLP4 16
ARGP4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg_pmove+180
ARGP4
ADDRGP4 cg_pmove+192
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 348
;346:			cg_pmove.mins, cg_pmove.maxs, cmodel, -1 );
;347:
;348:		if ( !trace.startsolid ) {
ADDRLP4 16+4
INDIRI4
CNSTI4 0
NEI4 $222
line 349
;349:			continue;
ADDRGP4 $207
JUMPV
LABELV $222
line 352
;350:		}
;351:
;352:		if ( ent->eType == ET_TELEPORT_TRIGGER ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
NEI4 $225
line 353
;353:			cg.hyperspace = qtrue;
ADDRGP4 cg+107632
CNSTI4 1
ASGNI4
line 354
;354:		} else if ( ent->eType == ET_PUSH_TRIGGER ) {
ADDRGP4 $226
JUMPV
LABELV $225
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
NEI4 $228
line 355
;355:			BG_TouchJumpPad( &cg.predictedPlayerState, ent );
ADDRGP4 cg+107636
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BG_TouchJumpPad
CALLV
pop
line 356
;356:		}
LABELV $228
LABELV $226
line 357
;357:	}
LABELV $207
line 327
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $209
ADDRLP4 4
INDIRI4
ADDRGP4 cg_numTriggerEntities
INDIRI4
LTI4 $206
line 360
;358:
;359:	// if we didn't touch a jump pad this pmove frame
;360:	if ( cg.predictedPlayerState.jumppad_frame != cg.predictedPlayerState.pmove_framecount ) {
ADDRGP4 cg+107636+460
INDIRI4
ADDRGP4 cg+107636+456
INDIRI4
EQI4 $231
line 361
;361:		cg.predictedPlayerState.jumppad_frame = 0;
ADDRGP4 cg+107636+460
CNSTI4 0
ASGNI4
line 362
;362:		cg.predictedPlayerState.jumppad_ent = 0;
ADDRGP4 cg+107636+448
CNSTI4 0
ASGNI4
line 363
;363:	}
LABELV $231
line 364
;364:}
LABELV $192
endproc CG_TouchTriggerPrediction 88 28
export CG_PredictPlayerState
proc CG_PredictPlayerState 592 20
line 394
;365:
;366:
;367:
;368:/*
;369:=================
;370:CG_PredictPlayerState
;371:
;372:Generates cg.predictedPlayerState for the current cg.time
;373:cg.predictedPlayerState is guaranteed to be valid after exiting.
;374:
;375:For demo playback, this will be an interpolation between two valid
;376:playerState_t.
;377:
;378:For normal gameplay, it will be the result of predicted usercmd_t on
;379:top of the most recent playerState_t received from the server.
;380:
;381:Each new snapshot will usually have one or more new usercmd over the last,
;382:but we simulate all unacknowledged commands each time, not just the new ones.
;383:This means that on an internet connection, quite a few pmoves may be issued
;384:each frame.
;385:
;386:OPTIMIZE: don't re-simulate unless the newly arrived snapshot playerState_t
;387:differs from the predicted one.  Would require saving all intermediate
;388:playerState_t during prediction.
;389:
;390:We detect prediction errors and allow them to be decayed off over several frames
;391:to ease the jerk.
;392:=================
;393:*/
;394:void CG_PredictPlayerState( void ) {
line 401
;395:	int			cmdNum, current;
;396:	playerState_t	oldPlayerState;
;397:	qboolean	moved;
;398:	usercmd_t	oldestCmd;
;399:	usercmd_t	latestCmd;
;400:
;401:	cg.hyperspace = qfalse;	// will be set if touching a trigger_teleport
ADDRGP4 cg+107632
CNSTI4 0
ASGNI4
line 406
;402:
;403:	// if this is the first frame we must guarantee
;404:	// predictedPlayerState is valid even if there is some
;405:	// other error condition
;406:	if ( !cg.validPPS ) {
ADDRGP4 cg+108832
INDIRI4
CNSTI4 0
NEI4 $243
line 407
;407:		cg.validPPS = qtrue;
ADDRGP4 cg+108832
CNSTI4 1
ASGNI4
line 408
;408:		cg.predictedPlayerState = cg.snap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 409
;409:	}
LABELV $243
line 413
;410:
;411:
;412:	// demo playback just copies the moves
;413:	if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) ) {
ADDRLP4 528
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 528
INDIRI4
NEI4 $253
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 528
INDIRI4
EQI4 $249
LABELV $253
line 414
;414:		CG_InterpolatePlayerState( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
line 415
;415:		return;
ADDRGP4 $241
JUMPV
LABELV $249
line 419
;416:	}
;417:
;418:	// non-predicting local movement will grab the latest angles
;419:	if ( cg_nopredict.integer || cg_synchronousClients.integer ) {
ADDRLP4 532
CNSTI4 0
ASGNI4
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 532
INDIRI4
NEI4 $258
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 532
INDIRI4
EQI4 $254
LABELV $258
line 420
;420:		CG_InterpolatePlayerState( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
line 421
;421:		return;
ADDRGP4 $241
JUMPV
LABELV $254
line 425
;422:	}
;423:
;424:	// prepare for pmove
;425:	cg_pmove.ps = &cg.predictedPlayerState;
ADDRGP4 cg_pmove
ADDRGP4 cg+107636
ASGNP4
line 426
;426:	cg_pmove.trace = CG_Trace;
ADDRGP4 cg_pmove+224
ADDRGP4 CG_Trace
ASGNP4
line 427
;427:	cg_pmove.pointcontents = CG_PointContents;
ADDRGP4 cg_pmove+228
ADDRGP4 CG_PointContents
ASGNP4
line 428
;428:	if ( cg_pmove.ps->pm_type == PM_DEAD ) {
ADDRGP4 cg_pmove
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $262
line 429
;429:		cg_pmove.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRGP4 cg_pmove+28
CNSTI4 65537
ASGNI4
line 430
;430:	}
ADDRGP4 $263
JUMPV
LABELV $262
line 431
;431:	else {
line 432
;432:		cg_pmove.tracemask = MASK_PLAYERSOLID;
ADDRGP4 cg_pmove+28
CNSTI4 33619969
ASGNI4
line 433
;433:	}
LABELV $263
line 434
;434:	if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $266
line 435
;435:		cg_pmove.tracemask &= ~CONTENTS_BODY;	// spectators can fly through bodies
ADDRLP4 536
ADDRGP4 cg_pmove+28
ASGNP4
ADDRLP4 536
INDIRP4
ADDRLP4 536
INDIRP4
INDIRI4
CNSTI4 -33554433
BANDI4
ASGNI4
line 436
;436:	}
LABELV $266
line 437
;437:	cg_pmove.noFootsteps = ( cgs.dmflags & DF_NO_FOOTSTEPS ) > 0;
ADDRGP4 cgs+31460
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
LEI4 $273
ADDRLP4 536
CNSTI4 1
ASGNI4
ADDRGP4 $274
JUMPV
LABELV $273
ADDRLP4 536
CNSTI4 0
ASGNI4
LABELV $274
ADDRGP4 cg_pmove+36
ADDRLP4 536
INDIRI4
ASGNI4
line 440
;438:
;439:	// save the state before the pmove so we can detect transitions
;440:	oldPlayerState = cg.predictedPlayerState;
ADDRLP4 4
ADDRGP4 cg+107636
INDIRB
ASGNB 468
line 442
;441:
;442:	current = trap_GetCurrentCmdNumber();
ADDRLP4 540
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 472
ADDRLP4 540
INDIRI4
ASGNI4
line 447
;443:
;444:	// if we don't have the commands right after the snapshot, we
;445:	// can't accurately predict a current position, so just freeze at
;446:	// the last good position we had
;447:	cmdNum = current - CMD_BACKUP + 1;
ADDRLP4 0
ADDRLP4 472
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 448
;448:	trap_GetUserCmd( cmdNum, &oldestCmd );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 504
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 449
;449:	if ( oldestCmd.serverTime > cg.snap->ps.commandTime 
ADDRLP4 544
ADDRLP4 504
INDIRI4
ASGNI4
ADDRLP4 544
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $276
ADDRLP4 544
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $276
line 450
;450:		&& oldestCmd.serverTime < cg.time ) {	// special check for map_restart
line 451
;451:		if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $241
line 452
;452:			CG_Printf ("exceeded PACKET_BACKUP on commands\n");
ADDRGP4 $283
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 453
;453:		}
line 454
;454:		return;
ADDRGP4 $241
JUMPV
LABELV $276
line 458
;455:	}
;456:
;457:	// get the latest command so we can know which commands are from previous map_restarts
;458:	trap_GetUserCmd( current, &latestCmd );
ADDRLP4 472
INDIRI4
ARGI4
ADDRLP4 480
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 464
;459:
;460:	// get the most recent information we have, even if
;461:	// the server time is beyond our current cg.time,
;462:	// because predicted player positions are going to 
;463:	// be ahead of everything else anyway
;464:	if ( cg.nextSnap && !cg.nextFrameTeleport && !cg.thisFrameTeleport ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $284
ADDRLP4 548
CNSTI4 0
ASGNI4
ADDRGP4 cg+107596
INDIRI4
ADDRLP4 548
INDIRI4
NEI4 $284
ADDRGP4 cg+107592
INDIRI4
ADDRLP4 548
INDIRI4
NEI4 $284
line 465
;465:		cg.predictedPlayerState = cg.nextSnap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+40
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 466
;466:		cg.physicsTime = cg.nextSnap->serverTime;
ADDRGP4 cg+107612
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 467
;467:	} else {
ADDRGP4 $285
JUMPV
LABELV $284
line 468
;468:		cg.predictedPlayerState = cg.snap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 469
;469:		cg.physicsTime = cg.snap->serverTime;
ADDRGP4 cg+107612
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 470
;470:	}
LABELV $285
line 472
;471:
;472:	if ( pmove_msec.integer < 8 ) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $297
line 473
;473:		trap_Cvar_Set("pmove_msec", "8");
ADDRGP4 $300
ARGP4
ADDRGP4 $301
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 474
;474:	}
ADDRGP4 $298
JUMPV
LABELV $297
line 475
;475:	else if (pmove_msec.integer > 33) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $302
line 476
;476:		trap_Cvar_Set("pmove_msec", "33");
ADDRGP4 $300
ARGP4
ADDRGP4 $305
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 477
;477:	}
LABELV $302
LABELV $298
line 479
;478:
;479:	cg_pmove.pmove_fixed = pmove_fixed.integer;// | cg_pmove_fixed.integer;
ADDRGP4 cg_pmove+216
ADDRGP4 pmove_fixed+12
INDIRI4
ASGNI4
line 480
;480:	cg_pmove.pmove_msec = pmove_msec.integer;
ADDRGP4 cg_pmove+220
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 483
;481:
;482:	// run cmds
;483:	moved = qfalse;
ADDRLP4 476
CNSTI4 0
ASGNI4
line 484
;484:	for ( cmdNum = current - CMD_BACKUP + 1 ; cmdNum <= current ; cmdNum++ ) {
ADDRLP4 0
ADDRLP4 472
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $313
JUMPV
LABELV $310
line 486
;485:		// get the command
;486:		trap_GetUserCmd( cmdNum, &cg_pmove.cmd );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cg_pmove+4
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 488
;487:
;488:		if ( cg_pmove.pmove_fixed ) {
ADDRGP4 cg_pmove+216
INDIRI4
CNSTI4 0
EQI4 $315
line 489
;489:			PM_UpdateViewAngles( cg_pmove.ps, &cg_pmove.cmd );
ADDRGP4 cg_pmove
INDIRP4
ARGP4
ADDRGP4 cg_pmove+4
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 490
;490:		}
LABELV $315
line 493
;491:
;492:		// don't do anything if the time is before the snapshot player time
;493:		if ( cg_pmove.cmd.serverTime <= cg.predictedPlayerState.commandTime ) {
ADDRGP4 cg_pmove+4
INDIRI4
ADDRGP4 cg+107636
INDIRI4
GTI4 $319
line 494
;494:			continue;
ADDRGP4 $311
JUMPV
LABELV $319
line 498
;495:		}
;496:
;497:		// don't do anything if the command was from a previous map_restart
;498:		if ( cg_pmove.cmd.serverTime > latestCmd.serverTime ) {
ADDRGP4 cg_pmove+4
INDIRI4
ADDRLP4 480
INDIRI4
LEI4 $323
line 499
;499:			continue;
ADDRGP4 $311
JUMPV
LABELV $323
line 507
;500:		}
;501:
;502:		// check for a prediction error from last frame
;503:		// on a lan, this will often be the exact value
;504:		// from the snapshot, but on a wan we will have
;505:		// to predict several commands to get to the point
;506:		// we want to compare
;507:		if ( cg.predictedPlayerState.commandTime == oldPlayerState.commandTime ) {
ADDRGP4 cg+107636
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $326
line 511
;508:			vec3_t	delta;
;509:			float	len;
;510:
;511:			if ( cg.thisFrameTeleport ) {
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
EQI4 $329
line 513
;512:				// a teleport will not cause an error decay
;513:				VectorClear( cg.predictedError );
ADDRLP4 568
CNSTF4 0
ASGNF4
ADDRGP4 cg+108840+8
ADDRLP4 568
INDIRF4
ASGNF4
ADDRGP4 cg+108840+4
ADDRLP4 568
INDIRF4
ASGNF4
ADDRGP4 cg+108840
ADDRLP4 568
INDIRF4
ASGNF4
line 514
;514:				if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $337
line 515
;515:					CG_Printf( "PredictionTeleport\n" );
ADDRGP4 $340
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 516
;516:				}
LABELV $337
line 517
;517:				cg.thisFrameTeleport = qfalse;
ADDRGP4 cg+107592
CNSTI4 0
ASGNI4
line 518
;518:			} else {
ADDRGP4 $330
JUMPV
LABELV $329
line 520
;519:				vec3_t	adjusted;
;520:				CG_AdjustPositionForMover( cg.predictedPlayerState.origin, 
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+68
INDIRI4
ARGI4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRGP4 cg+107608
INDIRI4
ARGI4
ADDRLP4 568
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 523
;521:					cg.predictedPlayerState.groundEntityNum, cg.physicsTime, cg.oldTime, adjusted );
;522:
;523:				if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $348
line 524
;524:					if (!VectorCompare( oldPlayerState.origin, adjusted )) {
ADDRLP4 4+20
ARGP4
ADDRLP4 568
ARGP4
ADDRLP4 580
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 580
INDIRI4
CNSTI4 0
NEI4 $351
line 525
;525:						CG_Printf("prediction error\n");
ADDRGP4 $354
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 526
;526:					}
LABELV $351
line 527
;527:				}
LABELV $348
line 528
;528:				VectorSubtract( oldPlayerState.origin, adjusted, delta );
ADDRLP4 552
ADDRLP4 4+20
INDIRF4
ADDRLP4 568
INDIRF4
SUBF4
ASGNF4
ADDRLP4 552+4
ADDRLP4 4+20+4
INDIRF4
ADDRLP4 568+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 552+8
ADDRLP4 4+20+8
INDIRF4
ADDRLP4 568+8
INDIRF4
SUBF4
ASGNF4
line 529
;529:				len = VectorLength( delta );
ADDRLP4 552
ARGP4
ADDRLP4 580
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 564
ADDRLP4 580
INDIRF4
ASGNF4
line 530
;530:				if ( len > 0.1 ) {
ADDRLP4 564
INDIRF4
CNSTF4 1036831949
LEF4 $364
line 531
;531:					if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $366
line 532
;532:						CG_Printf("Prediction miss: %f\n", len);
ADDRGP4 $369
ARGP4
ADDRLP4 564
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 533
;533:					}
LABELV $366
line 534
;534:					if ( cg_errorDecay.integer ) {
ADDRGP4 cg_errorDecay+12
INDIRI4
CNSTI4 0
EQI4 $370
line 538
;535:						int		t;
;536:						float	f;
;537:
;538:						t = cg.time - cg.predictedErrorTime;
ADDRLP4 588
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108836
INDIRI4
SUBI4
ASGNI4
line 539
;539:						f = ( cg_errorDecay.value - t ) / cg_errorDecay.value;
ADDRLP4 584
ADDRGP4 cg_errorDecay+8
INDIRF4
ADDRLP4 588
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_errorDecay+8
INDIRF4
DIVF4
ASGNF4
line 540
;540:						if ( f < 0 ) {
ADDRLP4 584
INDIRF4
CNSTF4 0
GEF4 $377
line 541
;541:							f = 0;
ADDRLP4 584
CNSTF4 0
ASGNF4
line 542
;542:						}
LABELV $377
line 543
;543:						if ( f > 0 && cg_showmiss.integer ) {
ADDRLP4 584
INDIRF4
CNSTF4 0
LEF4 $379
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $379
line 544
;544:							CG_Printf("Double prediction decay: %f\n", f);
ADDRGP4 $382
ARGP4
ADDRLP4 584
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 545
;545:						}
LABELV $379
line 546
;546:						VectorScale( cg.predictedError, f, cg.predictedError );
ADDRGP4 cg+108840
ADDRGP4 cg+108840
INDIRF4
ADDRLP4 584
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+108840+4
ADDRGP4 cg+108840+4
INDIRF4
ADDRLP4 584
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+108840+8
ADDRGP4 cg+108840+8
INDIRF4
ADDRLP4 584
INDIRF4
MULF4
ASGNF4
line 547
;547:					} else {
ADDRGP4 $371
JUMPV
LABELV $370
line 548
;548:						VectorClear( cg.predictedError );
ADDRLP4 584
CNSTF4 0
ASGNF4
ADDRGP4 cg+108840+8
ADDRLP4 584
INDIRF4
ASGNF4
ADDRGP4 cg+108840+4
ADDRLP4 584
INDIRF4
ASGNF4
ADDRGP4 cg+108840
ADDRLP4 584
INDIRF4
ASGNF4
line 549
;549:					}
LABELV $371
line 550
;550:					VectorAdd( delta, cg.predictedError, cg.predictedError );
ADDRGP4 cg+108840
ADDRLP4 552
INDIRF4
ADDRGP4 cg+108840
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+108840+4
ADDRLP4 552+4
INDIRF4
ADDRGP4 cg+108840+4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+108840+8
ADDRLP4 552+8
INDIRF4
ADDRGP4 cg+108840+8
INDIRF4
ADDF4
ASGNF4
line 551
;551:					cg.predictedErrorTime = cg.oldTime;
ADDRGP4 cg+108836
ADDRGP4 cg+107608
INDIRI4
ASGNI4
line 552
;552:				}
LABELV $364
line 553
;553:			}
LABELV $330
line 554
;554:		}
LABELV $326
line 558
;555:
;556:		// don't predict gauntlet firing, which is only supposed to happen
;557:		// when it actually inflicts damage
;558:		cg_pmove.gauntletHit = qfalse;
ADDRGP4 cg_pmove+40
CNSTI4 0
ASGNI4
line 560
;559:
;560:		if ( cg_pmove.pmove_fixed ) {
ADDRGP4 cg_pmove+216
INDIRI4
CNSTI4 0
EQI4 $413
line 561
;561:			cg_pmove.cmd.serverTime = ((cg_pmove.cmd.serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer;
ADDRGP4 cg_pmove+4
ADDRGP4 cg_pmove+4
INDIRI4
ADDRGP4 pmove_msec+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 pmove_msec+12
INDIRI4
DIVI4
ADDRGP4 pmove_msec+12
INDIRI4
MULI4
ASGNI4
line 562
;562:		}
LABELV $413
line 564
;563:
;564:		Pmove (&cg_pmove);
ADDRGP4 cg_pmove
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 566
;565:
;566:		moved = qtrue;
ADDRLP4 476
CNSTI4 1
ASGNI4
line 569
;567:
;568:		// add push trigger movement effects
;569:		CG_TouchTriggerPrediction();
ADDRGP4 CG_TouchTriggerPrediction
CALLV
pop
line 573
;570:
;571:		// check for predictable events that changed from previous predictions
;572:		//CG_CheckChangedPredictableEvents(&cg.predictedPlayerState);
;573:	}
LABELV $311
line 484
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $313
ADDRLP4 0
INDIRI4
ADDRLP4 472
INDIRI4
LEI4 $310
line 575
;574:
;575:	if ( cg_showmiss.integer > 1 ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $421
line 576
;576:		CG_Printf( "[%i : %i] ", cg_pmove.cmd.serverTime, cg.time );
ADDRGP4 $424
ARGP4
ADDRGP4 cg_pmove+4
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 577
;577:	}
LABELV $421
line 579
;578:
;579:	if ( !moved ) {
ADDRLP4 476
INDIRI4
CNSTI4 0
NEI4 $427
line 580
;580:		if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $241
line 581
;581:			CG_Printf( "not moved\n" );
ADDRGP4 $432
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 582
;582:		}
line 583
;583:		return;
ADDRGP4 $241
JUMPV
LABELV $427
line 587
;584:	}
;585:
;586:	// adjust for the movement of the groundentity
;587:	CG_AdjustPositionForMover( cg.predictedPlayerState.origin, 
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+68
INDIRI4
ARGI4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 591
;588:		cg.predictedPlayerState.groundEntityNum, 
;589:		cg.physicsTime, cg.time, cg.predictedPlayerState.origin );
;590:
;591:	if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $441
line 592
;592:		if (cg.predictedPlayerState.eventSequence > oldPlayerState.eventSequence + MAX_PS_EVENTS) {
ADDRGP4 cg+107636+108
INDIRI4
ADDRLP4 4+108
INDIRI4
CNSTI4 2
ADDI4
LEI4 $444
line 593
;593:			CG_Printf("WARNING: dropped event\n");
ADDRGP4 $449
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 594
;594:		}
LABELV $444
line 595
;595:	}
LABELV $441
line 598
;596:
;597:	// fire events and other transition triggered things
;598:	CG_TransitionPlayerState( &cg.predictedPlayerState, &oldPlayerState );
ADDRGP4 cg+107636
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_TransitionPlayerState
CALLV
pop
line 600
;599:
;600:	if ( cg_showmiss.integer ) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $451
line 601
;601:		if (cg.eventSequence > cg.predictedPlayerState.eventSequence) {
ADDRGP4 cg+108852
INDIRI4
ADDRGP4 cg+107636+108
INDIRI4
LEI4 $454
line 602
;602:			CG_Printf("WARNING: double event\n");
ADDRGP4 $459
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 603
;603:			cg.eventSequence = cg.predictedPlayerState.eventSequence;
ADDRGP4 cg+108852
ADDRGP4 cg+107636+108
INDIRI4
ASGNI4
line 604
;604:		}
LABELV $454
line 605
;605:	}
LABELV $451
line 606
;606:}
LABELV $241
endproc CG_PredictPlayerState 592 20
bss
align 4
LABELV cg_triggerEntities
skip 1024
align 4
LABELV cg_numTriggerEntities
skip 4
align 4
LABELV cg_solidEntities
skip 1024
align 4
LABELV cg_numSolidEntities
skip 4
align 4
LABELV cg_pmove
skip 232
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedBoxTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_AddCommand
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_PlayBufferedVoiceChats
import CG_VoiceChatLocal
import CG_ShaderStateChanged
import CG_LoadVoiceChats
import CG_SetConfigValues
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_LoadDeferredPlayers
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawSmallStringColor
import CG_DrawSmallString
import CG_DrawBigStringColor
import CG_DrawBigString
import CG_DrawStringExt
import CG_DrawString
import CG_DrawPic
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_BuildSpectatorString
import CG_GetSelectedScore
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import pmove_msec
import pmove_fixed
import cg_smoothClients
import cg_scorePlum
import cg_noVoiceText
import cg_noVoiceChats
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_synchronousClients
import cg_drawAttacker
import cg_lagometer
import cg_stereoSeparation
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
LABELV $459
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $449
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $432
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $424
byte 1 91
byte 1 37
byte 1 105
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 0
align 1
LABELV $382
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $369
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $354
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $340
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $305
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $301
byte 1 56
byte 1 0
align 1
LABELV $300
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $283
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 80
byte 1 65
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 65
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
