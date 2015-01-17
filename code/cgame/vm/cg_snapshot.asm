code
proc CG_ResetEntity 8 4
file "../cg_snapshot.c"
line 15
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_snapshot.c -- things that happen on snapshot transition,
;4:// not necessarily every single rendered frame
;5:
;6:#include "cg_local.h"
;7:
;8:
;9:
;10:/*
;11:==================
;12:CG_ResetEntity
;13:==================
;14:*/
;15:static void CG_ResetEntity( centity_t *cent ) {
line 18
;16:	// if the previous snapshot this entity was updated in is at least
;17:	// an event window back in time then we can reset the previous event
;18:	if ( cent->snapShotTime < cg.time - EVENT_VALID_MSEC ) {
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 300
SUBI4
GEI4 $71
line 19
;19:		cent->previousEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 0
ASGNI4
line 20
;20:	}
LABELV $71
line 22
;21:
;22:	cent->trailTime = cg.snap->serverTime;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 24
;23:
;24:	VectorCopy (cent->currentState.origin, cent->lerpOrigin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 25
;25:	VectorCopy (cent->currentState.angles, cent->lerpAngles);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 26
;26:	if ( cent->currentState.eType == ET_PLAYER ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $75
line 27
;27:		CG_ResetPlayerEntity( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 28
;28:	}
LABELV $75
line 29
;29:}
LABELV $70
endproc CG_ResetEntity 8 4
proc CG_TransitionEntity 4 4
line 38
;30:
;31:/*
;32:===============
;33:CG_TransitionEntity
;34:
;35:cent->nextState is moved to cent->currentState and events are fired
;36:===============
;37:*/
;38:static void CG_TransitionEntity( centity_t *cent ) {
line 39
;39:	cent->currentState = cent->nextState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRB
ASGNB 208
line 40
;40:	cent->currentValid = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 1
ASGNI4
line 43
;41:
;42:	// reset if the entity wasn't in the last frame or was teleported
;43:	if ( !cent->interpolate ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
NEI4 $78
line 44
;44:		CG_ResetEntity( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetEntity
CALLV
pop
line 45
;45:	}
LABELV $78
line 48
;46:
;47:	// clear the next state.  if will be set by the next CG_SetNextSnap
;48:	cent->interpolate = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 51
;49:
;50:	// check for events
;51:	CG_CheckEvents( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CheckEvents
CALLV
pop
line 52
;52:}
LABELV $77
endproc CG_TransitionEntity 4 4
export CG_SetInitialSnapshot
proc CG_SetInitialSnapshot 16 12
line 66
;53:
;54:
;55:/*
;56:==================
;57:CG_SetInitialSnapshot
;58:
;59:This will only happen on the very first snapshot, or
;60:on tourney restarts.  All other times will use 
;61:CG_TransitionSnapshot instead.
;62:
;63:FIXME: Also called by map_restart?
;64:==================
;65:*/
;66:void CG_SetInitialSnapshot( snapshot_t *snap ) {
line 71
;67:	int				i;
;68:	centity_t		*cent;
;69:	entityState_t	*state;
;70:
;71:	cg.snap = snap;
ADDRGP4 cg+36
ADDRFP4 0
INDIRP4
ASGNP4
line 73
;72:
;73:	BG_PlayerStateToEntityState( &snap->ps, &cg_entities[ snap->ps.clientNum ].currentState, qfalse );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
ARGP4
CNSTI4 728
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 76
;74:
;75:	// sort out solid entities
;76:	CG_BuildSolidList();
ADDRGP4 CG_BuildSolidList
CALLV
pop
line 78
;77:
;78:	CG_ExecuteNewServerCommands( snap->serverCommandSequence );
ADDRFP4 0
INDIRP4
CNSTI4 53768
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ExecuteNewServerCommands
CALLV
pop
line 82
;79:
;80:	// set our local weapon selection pointer to
;81:	// what the server has indicated the current weapon is
;82:	CG_Respawn();
ADDRGP4 CG_Respawn
CALLV
pop
line 84
;83:
;84:	for ( i = 0 ; i < cg.snap->numEntities ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $82
line 85
;85:		state = &cg.snap->entities[ i ];
ADDRLP4 8
CNSTI4 208
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
ASGNP4
line 86
;86:		cent = &cg_entities[ state->number ];
ADDRLP4 0
CNSTI4 728
ADDRLP4 8
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 88
;87:
;88:		memcpy(&cent->currentState, state, sizeof(entityState_t));
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 208
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 90
;89:		//cent->currentState = *state;
;90:		cent->interpolate = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 91
;91:		cent->currentValid = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 1
ASGNI4
line 93
;92:
;93:		CG_ResetEntity( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetEntity
CALLV
pop
line 96
;94:
;95:		// check for events
;96:		CG_CheckEvents( cent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CheckEvents
CALLV
pop
line 97
;97:	}
LABELV $83
line 84
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $85
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $82
line 98
;98:}
LABELV $80
endproc CG_SetInitialSnapshot 16 12
proc CG_TransitionSnapshot 28 12
line 108
;99:
;100:
;101:/*
;102:===================
;103:CG_TransitionSnapshot
;104:
;105:The transition point from snap to nextSnap has passed
;106:===================
;107:*/
;108:static void CG_TransitionSnapshot( void ) {
line 113
;109:	centity_t			*cent;
;110:	snapshot_t			*oldFrame;
;111:	int					i;
;112:
;113:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $89
line 114
;114:		CG_Error( "CG_TransitionSnapshot: NULL cg.snap" );
ADDRGP4 $92
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 115
;115:	}
LABELV $89
line 116
;116:	if ( !cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $93
line 117
;117:		CG_Error( "CG_TransitionSnapshot: NULL cg.nextSnap" );
ADDRGP4 $96
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 118
;118:	}
LABELV $93
line 121
;119:
;120:	// execute any server string commands before transitioning entities
;121:	CG_ExecuteNewServerCommands( cg.nextSnap->serverCommandSequence );
ADDRGP4 cg+40
INDIRP4
CNSTI4 53768
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ExecuteNewServerCommands
CALLV
pop
line 124
;122:
;123:	// if we had a map_restart, set everthing with initial
;124:	if ( !cg.snap ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $98
line 125
;125:	}
LABELV $98
line 128
;126:
;127:	// clear the currentValid flag for all entities in the existing snapshot
;128:	for ( i = 0 ; i < cg.snap->numEntities ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $104
JUMPV
LABELV $101
line 129
;129:		cent = &cg_entities[ cg.snap->entities[ i ].number ];
ADDRLP4 4
CNSTI4 728
CNSTI4 208
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 130
;130:		cent->currentValid = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 0
ASGNI4
line 131
;131:	}
LABELV $102
line 128
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $104
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $101
line 134
;132:
;133:	// move nextSnap to snap and do the transitions
;134:	oldFrame = cg.snap;
ADDRLP4 8
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 135
;135:	cg.snap = cg.nextSnap;
ADDRGP4 cg+36
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 137
;136:
;137:	BG_PlayerStateToEntityState( &cg.snap->ps, &cg_entities[ cg.snap->ps.clientNum ].currentState, qfalse );
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ARGP4
CNSTI4 728
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 138
;138:	cg_entities[ cg.snap->ps.clientNum ].interpolate = qfalse;
CNSTI4 728
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+416
ADDP4
CNSTI4 0
ASGNI4
line 140
;139:
;140:	for ( i = 0 ; i < cg.snap->numEntities ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $114
line 141
;141:		cent = &cg_entities[ cg.snap->entities[ i ].number ];
ADDRLP4 4
CNSTI4 728
CNSTI4 208
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 142
;142:		CG_TransitionEntity( cent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_TransitionEntity
CALLV
pop
line 145
;143:
;144:		// remember time of snapshot this entity was last updated in
;145:		cent->snapShotTime = cg.snap->serverTime;
ADDRLP4 4
INDIRP4
CNSTI4 448
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 146
;146:	}
LABELV $115
line 140
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $117
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $114
line 148
;147:
;148:	cg.nextSnap = NULL;
ADDRGP4 cg+40
CNSTP4 0
ASGNP4
line 151
;149:
;150:	// check for playerstate transition events
;151:	if ( oldFrame ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $122
line 154
;152:		playerState_t	*ops, *ps;
;153:
;154:		ops = &oldFrame->ps;
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 155
;155:		ps = &cg.snap->ps;
ADDRLP4 16
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 157
;156:		// teleporting checks are irrespective of prediction
;157:		if ( ( ps->eFlags ^ ops->eFlags ) & EF_TELEPORT_BIT ) {
ADDRLP4 20
CNSTI4 104
ASGNI4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $125
line 158
;158:			cg.thisFrameTeleport = qtrue;	// will be cleared by prediction code
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
line 159
;159:		}
LABELV $125
line 163
;160:
;161:		// if we are not doing client side movement prediction for any
;162:		// reason, then the client events and view changes will be issued now
;163:		if ( cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW)
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 cg+8
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $136
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $136
ADDRGP4 cg_nopredict+12
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $136
ADDRGP4 cg_synchronousClients+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $128
LABELV $136
line 164
;164:			|| cg_nopredict.integer || cg_synchronousClients.integer ) {
line 165
;165:			CG_TransitionPlayerState( ps, ops );
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 CG_TransitionPlayerState
CALLV
pop
line 166
;166:		}
LABELV $128
line 167
;167:	}
LABELV $122
line 169
;168:
;169:}
LABELV $88
endproc CG_TransitionSnapshot 28 12
proc CG_SetNextSnap 32 12
line 179
;170:
;171:
;172:/*
;173:===================
;174:CG_SetNextSnap
;175:
;176:A new snapshot has just been read in from the client system.
;177:===================
;178:*/
;179:static void CG_SetNextSnap( snapshot_t *snap ) {
line 184
;180:	int					num;
;181:	entityState_t		*es;
;182:	centity_t			*cent;
;183:
;184:	cg.nextSnap = snap;
ADDRGP4 cg+40
ADDRFP4 0
INDIRP4
ASGNP4
line 186
;185:
;186:	BG_PlayerStateToEntityState( &snap->ps, &cg_entities[ snap->ps.clientNum ].nextState, qfalse );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
ARGP4
CNSTI4 728
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+208
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 187
;187:	cg_entities[ cg.snap->ps.clientNum ].interpolate = qtrue;
CNSTI4 728
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_entities+416
ADDP4
CNSTI4 1
ASGNI4
line 190
;188:
;189:	// check for extrapolation errors
;190:	for ( num = 0 ; num < snap->numEntities ; num++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $145
JUMPV
LABELV $142
line 191
;191:		es = &snap->entities[num];
ADDRLP4 4
CNSTI4 208
ADDRLP4 8
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDP4
ASGNP4
line 192
;192:		cent = &cg_entities[ es->number ];
ADDRLP4 0
CNSTI4 728
ADDRLP4 4
INDIRP4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 194
;193:
;194:		memcpy(&cent->nextState, es, sizeof(entityState_t));
ADDRLP4 16
CNSTI4 208
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 199
;195:		//cent->nextState = *es;
;196:
;197:		// if this frame is a teleport, or the entity wasn't in the
;198:		// previous frame, don't interpolate
;199:		if ( !cent->currentValid || ( ( cent->currentState.eFlags ^ es->eFlags ) & EF_TELEPORT_BIT )  ) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $148
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $146
LABELV $148
line 200
;200:			cent->interpolate = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 201
;201:		} else {
ADDRGP4 $147
JUMPV
LABELV $146
line 202
;202:			cent->interpolate = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 1
ASGNI4
line 203
;203:		}
LABELV $147
line 204
;204:	}
LABELV $143
line 190
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $145
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $142
line 208
;205:
;206:	// if the next frame is a teleport for the playerstate, we
;207:	// can't interpolate during demos
;208:	if ( cg.snap && ( ( snap->ps.eFlags ^ cg.snap->ps.eFlags ) & EF_TELEPORT_BIT ) ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $149
ADDRLP4 16
CNSTI4 148
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $149
line 209
;209:		cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
line 210
;210:	} else {
ADDRGP4 $150
JUMPV
LABELV $149
line 211
;211:		cg.nextFrameTeleport = qfalse;
ADDRGP4 cg+107596
CNSTI4 0
ASGNI4
line 212
;212:	}
LABELV $150
line 215
;213:
;214:	// if changing follow mode, don't interpolate
;215:	if ( cg.nextSnap->ps.clientNum != cg.snap->ps.clientNum ) {
ADDRLP4 20
CNSTI4 184
ASGNI4
ADDRGP4 cg+40
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $155
line 216
;216:		cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
line 217
;217:	}
LABELV $155
line 220
;218:
;219:	// if changing server restarts, don't interpolate
;220:	if ( ( cg.nextSnap->snapFlags ^ cg.snap->snapFlags ) & SNAPFLAG_SERVERCOUNT ) {
ADDRGP4 cg+40
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $160
line 221
;221:		cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
line 222
;222:	}
LABELV $160
line 225
;223:
;224:	// sort out solid entities
;225:	CG_BuildSolidList();
ADDRGP4 CG_BuildSolidList
CALLV
pop
line 226
;226:}
LABELV $137
endproc CG_SetNextSnap 32 12
proc CG_ReadNextSnapshot 20 12
line 239
;227:
;228:
;229:/*
;230:========================
;231:CG_ReadNextSnapshot
;232:
;233:This is the only place new snapshots are requested
;234:This may increment cgs.processedSnapshotNum multiple
;235:times if the client system fails to return a
;236:valid snapshot.
;237:========================
;238:*/
;239:static snapshot_t *CG_ReadNextSnapshot( void ) {
line 243
;240:	qboolean	r;
;241:	snapshot_t	*dest;
;242:
;243:	if ( cg.latestSnapshotNum > cgs.processedSnapshotNum + 1000 ) {
ADDRGP4 cg+28
INDIRI4
ADDRGP4 cgs+31448
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $174
line 244
;244:		CG_Printf( "WARNING: CG_ReadNextSnapshot: way out of range, %i > %i", 
ADDRGP4 $170
ARGP4
ADDRGP4 cg+28
INDIRI4
ARGI4
ADDRGP4 cgs+31448
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 246
;245:			cg.latestSnapshotNum, cgs.processedSnapshotNum );
;246:	}
ADDRGP4 $174
JUMPV
LABELV $173
line 248
;247:
;248:	while ( cgs.processedSnapshotNum < cg.latestSnapshotNum ) {
line 250
;249:		// decide which of the two slots to load it into
;250:		if ( cg.snap == &cg.activeSnapshots[0] ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
ADDRGP4 cg+44
CVPU4 4
NEU4 $178
line 251
;251:			dest = &cg.activeSnapshots[1];
ADDRLP4 0
ADDRGP4 cg+44+53772
ASGNP4
line 252
;252:		} else {
ADDRGP4 $179
JUMPV
LABELV $178
line 253
;253:			dest = &cg.activeSnapshots[0];
ADDRLP4 0
ADDRGP4 cg+44
ASGNP4
line 254
;254:		}
LABELV $179
line 257
;255:
;256:		// try to read the snapshot from the client system
;257:		cgs.processedSnapshotNum++;
ADDRLP4 8
ADDRGP4 cgs+31448
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 258
;258:		r = trap_GetSnapshot( cgs.processedSnapshotNum, dest );
ADDRGP4 cgs+31448
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_GetSnapshot
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 261
;259:
;260:		// FIXME: why would trap_GetSnapshot return a snapshot with the same server time
;261:		if ( cg.snap && r && dest->serverTime == cg.snap->serverTime ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $187
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $187
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
NEI4 $187
line 263
;262:			//continue;
;263:		}
LABELV $187
line 266
;264:
;265:		// if it succeeded, return
;266:		if ( r ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $191
line 267
;267:			CG_AddLagometerSnapshotInfo( dest );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddLagometerSnapshotInfo
CALLV
pop
line 268
;268:			return dest;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $165
JUMPV
LABELV $191
line 277
;269:		}
;270:
;271:		// a GetSnapshot will return failure if the snapshot
;272:		// never arrived, or  is so old that its entities
;273:		// have been shoved off the end of the circular
;274:		// buffer in the client system.
;275:
;276:		// record as a dropped packet
;277:		CG_AddLagometerSnapshotInfo( NULL );
CNSTP4 0
ARGP4
ADDRGP4 CG_AddLagometerSnapshotInfo
CALLV
pop
line 281
;278:
;279:		// If there are additional snapshots, continue trying to
;280:		// read them.
;281:	}
LABELV $174
line 248
ADDRGP4 cgs+31448
INDIRI4
ADDRGP4 cg+28
INDIRI4
LTI4 $173
line 284
;282:
;283:	// nothing left to read
;284:	return NULL;
CNSTP4 0
RETP4
LABELV $165
endproc CG_ReadNextSnapshot 20 12
export CG_ProcessSnapshots
proc CG_ProcessSnapshots 16 8
line 307
;285:}
;286:
;287:
;288:/*
;289:============
;290:CG_ProcessSnapshots
;291:
;292:We are trying to set up a renderable view, so determine
;293:what the simulated time is, and try to get snapshots
;294:both before and after that time if available.
;295:
;296:If we don't have a valid cg.snap after exiting this function,
;297:then a 3D game view cannot be rendered.  This should only happen
;298:right after the initial connection.  After cg.snap has been valid
;299:once, it will never turn invalid.
;300:
;301:Even if cg.snap is valid, cg.nextSnap may not be, if the snapshot
;302:hasn't arrived yet (it becomes an extrapolating situation instead
;303:of an interpolating one)
;304:
;305:============
;306:*/
;307:void CG_ProcessSnapshots( void ) {
line 312
;308:	snapshot_t		*snap;
;309:	int				n;
;310:
;311:	// see what the latest snapshot the client system has is
;312:	trap_GetCurrentSnapshotNumber( &n, &cg.latestSnapshotTime );
ADDRLP4 4
ARGP4
ADDRGP4 cg+32
ARGP4
ADDRGP4 trap_GetCurrentSnapshotNumber
CALLV
pop
line 313
;313:	if ( n != cg.latestSnapshotNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+28
INDIRI4
EQI4 $204
line 314
;314:		if ( n < cg.latestSnapshotNum ) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+28
INDIRI4
GEI4 $198
line 316
;315:			// this should never happen
;316:			CG_Error( "CG_ProcessSnapshots: n < cg.latestSnapshotNum" );
ADDRGP4 $201
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 317
;317:		}
LABELV $198
line 318
;318:		cg.latestSnapshotNum = n;
ADDRGP4 cg+28
ADDRLP4 4
INDIRI4
ASGNI4
line 319
;319:	}
ADDRGP4 $204
JUMPV
LABELV $203
line 324
;320:
;321:	// If we have yet to receive a snapshot, check for it.
;322:	// Once we have gotten the first snapshot, cg.snap will
;323:	// always have valid data for the rest of the game
;324:	while ( !cg.snap ) {
line 325
;325:		snap = CG_ReadNextSnapshot();
ADDRLP4 8
ADDRGP4 CG_ReadNextSnapshot
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 326
;326:		if ( !snap ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $207
line 328
;327:			// we can't continue until we get a snapshot
;328:			return;
ADDRGP4 $193
JUMPV
LABELV $207
line 333
;329:		}
;330:
;331:		// set our weapon selection to what
;332:		// the playerstate is currently using
;333:		if ( !( snap->snapFlags & SNAPFLAG_NOT_ACTIVE ) ) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $209
line 334
;334:			CG_SetInitialSnapshot( snap );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetInitialSnapshot
CALLV
pop
line 335
;335:		}
LABELV $209
line 336
;336:	}
LABELV $204
line 324
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $203
LABELV $211
line 341
;337:
;338:	// loop until we either have a valid nextSnap with a serverTime
;339:	// greater than cg.time to interpolate towards, or we run
;340:	// out of available snapshots
;341:	do {
line 343
;342:		// if we don't have a nextframe, try and read a new one in
;343:		if ( !cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $214
line 344
;344:			snap = CG_ReadNextSnapshot();
ADDRLP4 8
ADDRGP4 CG_ReadNextSnapshot
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 348
;345:
;346:			// if we still don't have a nextframe, we will just have to
;347:			// extrapolate
;348:			if ( !snap ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $217
line 349
;349:				break;
ADDRGP4 $213
JUMPV
LABELV $217
line 352
;350:			}
;351:
;352:			CG_SetNextSnap( snap );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetNextSnap
CALLV
pop
line 356
;353:
;354:
;355:			// if time went backwards, we have a level restart
;356:			if ( cg.nextSnap->serverTime < cg.snap->serverTime ) {
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRGP4 cg+40
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
GEI4 $219
line 357
;357:				CG_Error( "CG_ProcessSnapshots: Server time went backwards" );
ADDRGP4 $223
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 358
;358:			}
LABELV $219
line 359
;359:		}
LABELV $214
line 362
;360:
;361:		// if our time is < nextFrame's, we have a nice interpolating state
;362:		if ( cg.time >= cg.snap->serverTime && cg.time < cg.nextSnap->serverTime ) {
ADDRLP4 8
CNSTI4 8
ASGNI4
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
LTI4 $224
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+40
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
GEI4 $224
line 363
;363:			break;
ADDRGP4 $213
JUMPV
LABELV $224
line 367
;364:		}
;365:
;366:		// we have passed the transition from nextFrame to frame
;367:		CG_TransitionSnapshot();
ADDRGP4 CG_TransitionSnapshot
CALLV
pop
line 368
;368:	} while ( 1 );
LABELV $212
ADDRGP4 $211
JUMPV
LABELV $213
line 371
;369:
;370:	// assert our valid conditions upon exiting
;371:	if ( cg.snap == NULL ) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $230
line 372
;372:		CG_Error( "CG_ProcessSnapshots: cg.snap == NULL" );
ADDRGP4 $233
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 373
;373:	}
LABELV $230
line 374
;374:	if ( cg.time < cg.snap->serverTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GEI4 $234
line 376
;375:		// this can happen right after a vid_restart
;376:		cg.time = cg.snap->serverTime;
ADDRGP4 cg+107604
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 377
;377:	}
LABELV $234
line 378
;378:	if ( cg.nextSnap != NULL && cg.nextSnap->serverTime <= cg.time ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $240
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GTI4 $240
line 379
;379:		CG_Error( "CG_ProcessSnapshots: cg.nextSnap->serverTime <= cg.time" );
ADDRGP4 $245
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 380
;380:	}
LABELV $240
line 382
;381:
;382:}
LABELV $193
endproc CG_ProcessSnapshots 16 8
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
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
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
LABELV $245
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 45
byte 1 62
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 60
byte 1 61
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $233
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 32
byte 1 61
byte 1 61
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $223
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 119
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $201
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 32
byte 1 60
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 78
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $170
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 97
byte 1 100
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $96
byte 1 67
byte 1 71
byte 1 95
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $92
byte 1 67
byte 1 71
byte 1 95
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 0
