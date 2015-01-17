export CG_PositionEntityOnTag
code
proc CG_PositionEntityOnTag 84 24
file "../cg_ents.c"
line 18
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_ents.c -- present snapshot entities, happens every single frame
;4:
;5:#include "cg_local.h"
;6:
;7:static void CG_InfoSight( centity_t *cent );
;8:static void CG_LaserSight( centity_t *cent );
;9:/*
;10:======================
;11:CG_PositionEntityOnTag
;12:
;13:Modifies the entities position and axis by the given
;14:tag location
;15:======================
;16:*/
;17:void CG_PositionEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;18:							qhandle_t parentModel, char *tagName ) {
line 23
;19:	int				i;
;20:	orientation_t	lerped;
;21:	
;22:	// lerp the tag
;23:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 52
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 27
;24:		1.0 - parent->backlerp, tagName );
;25:
;26:	// FIXME: allow origin offsets along tag?
;27:	VectorCopy( parent->origin, entity->origin );
ADDRLP4 56
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 28
;28:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $71
line 29
;29:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 30
;30:	}
LABELV $72
line 28
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $71
line 33
;31:
;32:	// had to cast away the const to avoid compiler problems...
;33:	MatrixMultiply( lerped.axis, ((refEntity_t *)parent)->axis, entity->axis );
ADDRLP4 4+12
ARGP4
ADDRLP4 60
CNSTI4 28
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 34
;34:	entity->backlerp = parent->backlerp;
ADDRLP4 64
CNSTI4 100
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ASGNF4
line 35
;35:}
LABELV $70
endproc CG_PositionEntityOnTag 84 24
export CG_PositionRotatedEntityOnTag
proc CG_PositionRotatedEntityOnTag 120 24
line 47
;36:
;37:
;38:/*
;39:======================
;40:CG_PositionRotatedEntityOnTag
;41:
;42:Modifies the entities position and axis by the given
;43:tag location
;44:======================
;45:*/
;46:void CG_PositionRotatedEntityOnTag( refEntity_t *entity, const refEntity_t *parent, 
;47:							qhandle_t parentModel, char *tagName ) {
line 54
;48:	int				i;
;49:	orientation_t	lerped;
;50:	vec3_t			tempAxis[3];
;51:
;52://AxisClear( entity->axis );
;53:	// lerp the tag
;54:	trap_R_LerpTag( &lerped, parentModel, parent->oldframe, parent->frame,
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 88
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 58
;55:		1.0 - parent->backlerp, tagName );
;56:
;57:	// FIXME: allow origin offsets along tag?
;58:	VectorCopy( parent->origin, entity->origin );
ADDRLP4 92
CNSTI4 68
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 59
;59:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $77
line 60
;60:		VectorMA( entity->origin, lerped.origin[i], parent->axis[i], entity->origin );
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 61
;61:	}
LABELV $78
line 59
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $77
line 64
;62:
;63:	// had to cast away the const to avoid compiler problems...
;64:	MatrixMultiply( entity->axis, lerped.axis, tempAxis );
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 52
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 65
;65:	MatrixMultiply( tempAxis, ((refEntity_t *)parent)->axis, entity->axis );
ADDRLP4 52
ARGP4
ADDRLP4 96
CNSTI4 28
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 66
;66:}
LABELV $76
endproc CG_PositionRotatedEntityOnTag 120 24
export CG_SetEntitySoundPosition
proc CG_SetEntitySoundPosition 24 8
line 85
;67:
;68:
;69:
;70:/*
;71:==========================================================================
;72:
;73:FUNCTIONS CALLED EACH FRAME
;74:
;75:==========================================================================
;76:*/
;77:
;78:/*
;79:======================
;80:CG_SetEntitySoundPosition
;81:
;82:Also called by event processing code
;83:======================
;84:*/
;85:void CG_SetEntitySoundPosition( centity_t *cent ) {
line 86
;86:	if ( cent->currentState.solid == SOLID_BMODEL ) {
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $83
line 90
;87:		vec3_t	origin;
;88:		float	*v;
;89:
;90:		v = cgs.inlineModelMidpoints[ cent->currentState.modelindex ];
ADDRLP4 12
CNSTI4 12
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cgs+37900
ADDP4
ASGNP4
line 91
;91:		VectorAdd( cent->lerpOrigin, v, origin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 704
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRP4
CNSTI4 708
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 92
;92:		trap_S_UpdateEntityPosition( cent->currentState.number, origin );
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 93
;93:	} else {
ADDRGP4 $84
JUMPV
LABELV $83
line 94
;94:		trap_S_UpdateEntityPosition( cent->currentState.number, cent->lerpOrigin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 95
;95:	}
LABELV $84
line 96
;96:}
LABELV $82
endproc CG_SetEntitySoundPosition 24 8
proc CG_EntityEffects 20 20
line 105
;97:
;98:/*
;99:==================
;100:CG_EntityEffects
;101:
;102:Add continuous entity effects, like local entity emission and lighting
;103:==================
;104:*/
;105:static void CG_EntityEffects( centity_t *cent ) {
line 108
;106:
;107:	// update sound origins
;108:	CG_SetEntitySoundPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 111
;109:
;110:	// add loop sound
;111:	if ( cent->currentState.loopSound ) {
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $89
line 112
;112:		if (cent->currentState.eType != ET_SPEAKER) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 7
EQI4 $91
line 113
;113:			trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 115
;114:				cgs.gameSounds[ cent->currentState.loopSound ] );
;115:		} else {
ADDRGP4 $92
JUMPV
LABELV $91
line 116
;116:			trap_S_AddRealLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, 
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddRealLoopingSound
CALLV
pop
line 118
;117:				cgs.gameSounds[ cent->currentState.loopSound ] );
;118:		}
LABELV $92
line 119
;119:	}
LABELV $89
line 123
;120:
;121:
;122:	// constant light glow
;123:	if ( cent->currentState.constantLight ) {
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
EQI4 $95
line 127
;124:		int		cl;
;125:		int		i, r, g, b;
;126:
;127:		cl = cent->currentState.constantLight;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 128
;128:		r = cl & 255;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 129
;129:		g = ( cl >> 8 ) & 255;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 130
;130:		b = ( cl >> 16 ) & 255;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 131
;131:		i = ( ( cl >> 24 ) & 255 ) * 4;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CNSTI4 2
LSHI4
ASGNI4
line 132
;132:		trap_R_AddLightToScene( cent->lerpOrigin, i, r, g, b );
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 133
;133:	}
LABELV $95
line 135
;134:
;135:}
LABELV $88
endproc CG_EntityEffects 20 20
proc CG_General 144 12
line 143
;136:
;137:
;138:/*
;139:==================
;140:CG_General
;141:==================
;142:*/
;143:static void CG_General( centity_t *cent ) {
line 147
;144:	refEntity_t			ent;
;145:	entityState_t		*s1;
;146:
;147:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 150
;148:
;149:	// if set to invisible, skip
;150:	if (!s1->modelindex) {
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 0
NEI4 $98
line 151
;151:		return;
ADDRGP4 $97
JUMPV
LABELV $98
line 154
;152:	}
;153:
;154:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 158
;155:
;156:	// set frame
;157:
;158:	ent.frame = s1->frame;
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 159
;159:	ent.oldframe = ent.frame;
ADDRLP4 0+96
ADDRLP4 0+80
INDIRI4
ASGNI4
line 160
;160:	ent.backlerp = 0;
ADDRLP4 0+100
CNSTF4 0
ASGNF4
line 162
;161:
;162:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 163
;163:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 165
;164:
;165:	ent.hModel = cgs.gameModels[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34824
ADDP4
INDIRI4
ASGNI4
line 168
;166:
;167:	// player model
;168:	if (s1->number == cg.snap->ps.clientNum) {
ADDRLP4 140
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $108
line 169
;169:		ent.renderfx |= RF_THIRD_PERSON;	// only draw from mirrors
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 170
;170:	}
LABELV $108
line 173
;171:
;172:	// convert angles to axis
;173:	AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 176
;174:
;175:	// add to refresh list
;176:	trap_R_AddRefEntityToScene (&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 177
;177:}
LABELV $97
endproc CG_General 144 12
proc CG_Speaker 16 16
line 186
;178:
;179:/*
;180:==================
;181:CG_Speaker
;182:
;183:Speaker entities can automatically play sounds
;184:==================
;185:*/
;186:static void CG_Speaker( centity_t *cent ) {
line 187
;187:	if ( ! cent->currentState.clientNum ) {	// FIXME: use something other than clientNum...
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $114
line 188
;188:		return;		// not auto triggering
ADDRGP4 $113
JUMPV
LABELV $114
line 191
;189:	}
;190:
;191:	if ( cg.time < cent->miscTime ) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
GEI4 $116
line 192
;192:		return;
ADDRGP4 $113
JUMPV
LABELV $116
line 195
;193:	}
;194:
;195:	trap_S_StartSound (NULL, cent->currentState.number, CHAN_ITEM, cgs.gameSounds[cent->currentState.eventParm] );
CNSTP4 0
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35848
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 199
;196:
;197:	//	ent->s.frame = ent->wait * 10;
;198:	//	ent->s.clientNum = ent->random * 10;
;199:	cent->miscTime = cg.time + cent->currentState.frame * 100 + cent->currentState.clientNum * 100 * crandom();
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 100
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
MULI4
ADDI4
CVIF4 4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
MULI4
CVIF4 4
CNSTF4 1073741824
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 200
;200:}
LABELV $113
endproc CG_Speaker 16 16
proc CG_Item 212 12
line 207
;201:
;202:/*
;203:==================
;204:CG_Item
;205:==================
;206:*/
;207:static void CG_Item( centity_t *cent ) {
line 216
;208:	refEntity_t		ent;
;209:	entityState_t	*es;
;210:	gitem_t			*item;
;211:	int				msec;
;212:	float			frac;
;213:	float			scale;
;214:	weaponInfo_t	*wi;
;215:
;216:	es = &cent->currentState;
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
line 217
;217:	if ( es->modelindex >= bg_numItems ) {
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $122
line 218
;218:		CG_Error( "Bad item index %i on entity", es->modelindex );
ADDRGP4 $124
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 219
;219:	}
LABELV $122
line 222
;220:
;221:	// if set to invisible, skip
;222:	if ( !es->modelindex || ( es->eFlags & EF_NODRAW ) ) {
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
EQI4 $127
ADDRLP4 144
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 168
INDIRI4
EQI4 $125
LABELV $127
line 223
;223:		return;
ADDRGP4 $121
JUMPV
LABELV $125
line 226
;224:	}
;225:
;226:	item = &bg_itemlist[ es->modelindex ];
ADDRLP4 140
CNSTI4 52
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 227
;227:	if ( cg_simpleItems.integer && item->giType != IT_TEAM ) {
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
EQI4 $128
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
EQI4 $128
line 228
;228:		memset( &ent, 0, sizeof( ent ) );
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 229
;229:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 230
;230:		VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 231
;231:		ent.radius = 14;
ADDRLP4 0+132
CNSTF4 1096810496
ASGNF4
line 232
;232:		ent.customShader = cg_items[es->modelindex].icon;
ADDRLP4 0+112
CNSTI4 24
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ASGNI4
line 233
;233:		ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 234
;234:		ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 235
;235:		ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 236
;236:		ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 237
;237:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 238
;238:		return;
ADDRGP4 $121
JUMPV
LABELV $128
line 242
;239:	}
;240:
;241:	// items bob up and down continuously
;242:	scale = 0.005 + cent->currentState.number * 0.00001;
ADDRLP4 160
CNSTF4 925353388
ADDRFP4 0
INDIRP4
INDIRI4
CVIF4 4
MULF4
CNSTF4 1000593162
ADDF4
ASGNF4
line 243
;243:	cent->lerpOrigin[2] += 4 + cos( ( cg.time + 1000 ) *  scale ) * 4;
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ADDRLP4 160
INDIRF4
MULF4
ARGF4
ADDRLP4 172
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 172
INDIRF4
MULF4
CNSTF4 1082130432
ADDF4
ADDF4
ASGNF4
line 245
;244:
;245:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 248
;246:
;247:	// autorotate at one of two speeds
;248:	if ( item->giType == IT_HEALTH ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 4
NEI4 $143
line 249
;249:		VectorCopy( cg.autoAnglesFast, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 cg+108996
INDIRB
ASGNB 12
line 250
;250:		AxisCopy( cg.autoAxisFast, ent.axis );
ADDRGP4 cg+109008
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 251
;251:	} else {
ADDRGP4 $144
JUMPV
LABELV $143
line 252
;252:		VectorCopy( cg.autoAngles, cent->lerpAngles );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 cg+108948
INDIRB
ASGNB 12
line 253
;253:		AxisCopy( cg.autoAxis, ent.axis );
ADDRGP4 cg+108960
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 254
;254:	}
LABELV $144
line 256
;255:
;256:	wi = NULL;
ADDRLP4 152
CNSTP4 0
ASGNP4
line 260
;257:	// the weapons have their origin where they attatch to player
;258:	// models, so we need to offset them or they will rotate
;259:	// eccentricly
;260:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $151
line 261
;261:		wi = &cg_weapons[item->giTag];
ADDRLP4 152
CNSTI4 136
ADDRLP4 140
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 262
;262:		cent->lerpOrigin[0] -= 
ADDRLP4 180
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0+28
INDIRF4
MULF4
ADDRLP4 152
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+28+12
INDIRF4
MULF4
ADDF4
ADDRLP4 152
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+28+24
INDIRF4
MULF4
ADDF4
SUBF4
ASGNF4
line 266
;263:			wi->weaponMidpoint[0] * ent.axis[0][0] +
;264:			wi->weaponMidpoint[1] * ent.axis[1][0] +
;265:			wi->weaponMidpoint[2] * ent.axis[2][0];
;266:		cent->lerpOrigin[1] -= 
ADDRLP4 188
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0+28+4
INDIRF4
MULF4
ADDRLP4 152
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+28+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 152
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+28+24+4
INDIRF4
MULF4
ADDF4
SUBF4
ASGNF4
line 270
;267:			wi->weaponMidpoint[0] * ent.axis[0][1] +
;268:			wi->weaponMidpoint[1] * ent.axis[1][1] +
;269:			wi->weaponMidpoint[2] * ent.axis[2][1];
;270:		cent->lerpOrigin[2] -= 
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0+28+8
INDIRF4
MULF4
ADDRLP4 152
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+28+12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 152
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+28+24+8
INDIRF4
MULF4
ADDF4
SUBF4
ASGNF4
line 275
;271:			wi->weaponMidpoint[0] * ent.axis[0][2] +
;272:			wi->weaponMidpoint[1] * ent.axis[1][2] +
;273:			wi->weaponMidpoint[2] * ent.axis[2][2];
;274:
;275:		cent->lerpOrigin[2] += 8;	// an extra height boost
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ASGNP4
ADDRLP4 204
INDIRP4
ADDRLP4 204
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 276
;276:	}
LABELV $151
line 278
;277:
;278:	ent.hModel = cg_items[es->modelindex].models[0];
ADDRLP4 0+8
CNSTI4 24
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+4
ADDP4
INDIRI4
ASGNI4
line 280
;279:
;280:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 281
;281:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 283
;282:
;283:	ent.nonNormalizedAxes = qfalse;
ADDRLP4 0+64
CNSTI4 0
ASGNI4
line 286
;284:
;285:	// if just respawned, slowly scale up
;286:	msec = cg.time - cent->miscTime;
ADDRLP4 156
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
SUBI4
ASGNI4
line 287
;287:	if ( msec >= 0 && msec < ITEM_SCALEUP_TIME ) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $180
ADDRLP4 156
INDIRI4
CNSTI4 1000
GEI4 $180
line 288
;288:		frac = (float)msec / ITEM_SCALEUP_TIME;
ADDRLP4 148
ADDRLP4 156
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ASGNF4
line 289
;289:		VectorScale( ent.axis[0], frac, ent.axis[0] );
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 290
;290:		VectorScale( ent.axis[1], frac, ent.axis[1] );
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 291
;291:		VectorScale( ent.axis[2], frac, ent.axis[2] );
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 292
;292:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 293
;293:	} else {
ADDRGP4 $181
JUMPV
LABELV $180
line 294
;294:		frac = 1.0;
ADDRLP4 148
CNSTF4 1065353216
ASGNF4
line 295
;295:	}
LABELV $181
line 299
;296:
;297:	// items without glow textures need to keep a minimum light value
;298:	// so they are always visible
;299:	if ( ( item->giType == IT_WEAPON ) ||
ADDRLP4 184
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 1
EQI4 $227
ADDRLP4 184
INDIRI4
CNSTI4 3
NEI4 $225
LABELV $227
line 300
;300:		 ( item->giType == IT_ARMOR ) ) {
line 301
;301:		ent.renderfx |= RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 302
;302:	}
LABELV $225
line 305
;303:
;304:	// increase the size of the weapons when they are presented as items
;305:	if ( item->giType == IT_WEAPON ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $229
line 306
;306:		VectorScale( ent.axis[0], 1.5, ent.axis[0] );
ADDRLP4 0+28
CNSTF4 1069547520
ADDRLP4 0+28
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
CNSTF4 1069547520
ADDRLP4 0+28+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
CNSTF4 1069547520
ADDRLP4 0+28+8
INDIRF4
MULF4
ASGNF4
line 307
;307:		VectorScale( ent.axis[1], 1.5, ent.axis[1] );
ADDRLP4 0+28+12
CNSTF4 1069547520
ADDRLP4 0+28+12
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
CNSTF4 1069547520
ADDRLP4 0+28+12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
CNSTF4 1069547520
ADDRLP4 0+28+12+8
INDIRF4
MULF4
ASGNF4
line 308
;308:		VectorScale( ent.axis[2], 1.5, ent.axis[2] );
ADDRLP4 0+28+24
CNSTF4 1069547520
ADDRLP4 0+28+24
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
CNSTF4 1069547520
ADDRLP4 0+28+24+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
CNSTF4 1069547520
ADDRLP4 0+28+24+8
INDIRF4
MULF4
ASGNF4
line 309
;309:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 313
;310:#ifdef MISSIONPACK
;311:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.weaponHoverSound );
;312:#endif
;313:	}
LABELV $229
line 325
;314:
;315:#ifdef MISSIONPACK
;316:	if ( item->giType == IT_HOLDABLE && item->giTag == HI_KAMIKAZE ) {
;317:		VectorScale( ent.axis[0], 2, ent.axis[0] );
;318:		VectorScale( ent.axis[1], 2, ent.axis[1] );
;319:		VectorScale( ent.axis[2], 2, ent.axis[2] );
;320:		ent.nonNormalizedAxes = qtrue;
;321:	}
;322:#endif
;323:
;324:	// add to refresh list
;325:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 349
;326:
;327:#ifdef MISSIONPACK
;328:	if ( item->giType == IT_WEAPON && wi->barrelModel ) {
;329:		refEntity_t	barrel;
;330:
;331:		memset( &barrel, 0, sizeof( barrel ) );
;332:
;333:		barrel.hModel = wi->barrelModel;
;334:
;335:		VectorCopy( ent.lightingOrigin, barrel.lightingOrigin );
;336:		barrel.shadowPlane = ent.shadowPlane;
;337:		barrel.renderfx = ent.renderfx;
;338:
;339:		CG_PositionRotatedEntityOnTag( &barrel, &ent, wi->weaponModel, "tag_barrel" );
;340:
;341:		AxisCopy( ent.axis, barrel.axis );
;342:		barrel.nonNormalizedAxes = ent.nonNormalizedAxes;
;343:
;344:		trap_R_AddRefEntityToScene( &barrel );
;345:	}
;346:#endif
;347:
;348:	// accompanying rings / spheres for powerups
;349:	if ( !cg_simpleItems.integer ) 
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
NEI4 $274
line 350
;350:	{
line 353
;351:		vec3_t spinAngles;
;352:
;353:		VectorClear( spinAngles );
ADDRLP4 200
CNSTF4 0
ASGNF4
ADDRLP4 188+8
ADDRLP4 200
INDIRF4
ASGNF4
ADDRLP4 188+4
ADDRLP4 200
INDIRF4
ASGNF4
ADDRLP4 188
ADDRLP4 200
INDIRF4
ASGNF4
line 355
;354:
;355:		if ( item->giType == IT_HEALTH || item->giType == IT_POWERUP )
ADDRLP4 204
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 4
EQI4 $281
ADDRLP4 204
INDIRI4
CNSTI4 5
NEI4 $279
LABELV $281
line 356
;356:		{
line 357
;357:			if ( ( ent.hModel = cg_items[es->modelindex].models[1] ) != 0 )
ADDRLP4 208
CNSTI4 24
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_items+4+4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 208
INDIRI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $282
line 358
;358:			{
line 359
;359:				if ( item->giType == IT_POWERUP )
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $287
line 360
;360:				{
line 361
;361:					ent.origin[2] += 12;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 362
;362:					spinAngles[1] = ( cg.time & 1023 ) * 360 / -1024.0f;
ADDRLP4 188+4
CNSTI4 360
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1023
BANDI4
MULI4
CVIF4 4
CNSTF4 3296722944
DIVF4
ASGNF4
line 363
;363:				}
LABELV $287
line 364
;364:				AnglesToAxis( spinAngles, ent.axis );
ADDRLP4 188
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 367
;365:				
;366:				// scale up if respawning
;367:				if ( frac != 1.0 ) {
ADDRLP4 148
INDIRF4
CNSTF4 1065353216
EQF4 $294
line 368
;368:					VectorScale( ent.axis[0], frac, ent.axis[0] );
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 369
;369:					VectorScale( ent.axis[1], frac, ent.axis[1] );
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 370
;370:					VectorScale( ent.axis[2], frac, ent.axis[2] );
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 371
;371:					ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 372
;372:				}
LABELV $294
line 373
;373:				trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 374
;374:			}
LABELV $282
line 375
;375:		}
LABELV $279
line 376
;376:	}
LABELV $274
line 377
;377:}
LABELV $121
endproc CG_Item 212 12
proc CG_Missile 164 20
line 386
;378:
;379://============================================================================
;380:
;381:/*
;382:===============
;383:CG_Missile
;384:===============
;385:*/
;386:static void CG_Missile( centity_t *cent ) {
line 392
;387:	refEntity_t			ent;
;388:	entityState_t		*s1;
;389:	const weaponInfo_t		*weapon;
;390://	int	col;
;391:
;392:	s1 = &cent->currentState;
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
line 393
;393:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 11
LEI4 $340
line 394
;394:		s1->weapon = 0;
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 395
;395:	}
LABELV $340
line 396
;396:	weapon = &cg_weapons[s1->weapon];
ADDRLP4 140
CNSTI4 136
ADDRLP4 144
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 399
;397:
;398:	// calculate the axis
;399:	VectorCopy( s1->angles, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 144
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 402
;400:
;401:	// add trails
;402:	if ( weapon->missileTrailFunc ) 
ADDRLP4 140
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $342
line 403
;403:	{
line 404
;404:		weapon->missileTrailFunc( cent, weapon );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 405
;405:	}
LABELV $342
line 424
;406:/*
;407:	if ( cent->currentState.modelindex == TEAM_RED ) {
;408:		col = 1;
;409:	}
;410:	else if ( cent->currentState.modelindex == TEAM_BLUE ) {
;411:		col = 2;
;412:	}
;413:	else {
;414:		col = 0;
;415:	}
;416:
;417:	// add dynamic light
;418:	if ( weapon->missileDlight ) {
;419:		trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
;420:			weapon->missileDlightColor[col][0], weapon->missileDlightColor[col][1], weapon->missileDlightColor[col][2] );
;421:	}
;422:*/
;423:	// add dynamic light
;424:	if ( weapon->missileDlight ) {
ADDRLP4 140
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
CNSTF4 0
EQF4 $344
line 425
;425:		trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight, 
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ARGF4
ADDRLP4 140
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ARGF4
ADDRLP4 140
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ARGF4
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 427
;426:			weapon->missileDlightColor[0], weapon->missileDlightColor[1], weapon->missileDlightColor[2] );
;427:	}
LABELV $344
line 430
;428:
;429:	// add missile sound
;430:	if ( weapon->missileSound ) {
ADDRLP4 140
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 0
EQI4 $346
line 433
;431:		vec3_t	velocity;
;432:
;433:		BG_EvaluateTrajectoryDelta( &cent->currentState.pos, cg.time, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 148
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 435
;434:
;435:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, velocity, weapon->missileSound );
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
INDIRI4
ARGI4
ADDRLP4 160
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRLP4 148
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 436
;436:	}
LABELV $346
line 439
;437:
;438:	// create the render entity
;439:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 440
;440:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 441
;441:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 443
;442:
;443:	if ( cent->currentState.weapon == WP_PLASMAGUN ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 8
NEI4 $351
line 444
;444:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 445
;445:		ent.radius = 16;
ADDRLP4 0+132
CNSTF4 1098907648
ASGNF4
line 446
;446:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 447
;447:		ent.customShader = cgs.media.plasmaBallShader;
ADDRLP4 0+112
ADDRGP4 cgs+152340+296
INDIRI4
ASGNI4
line 448
;448:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 449
;449:		return;
ADDRGP4 $339
JUMPV
LABELV $351
line 453
;450:	}
;451:
;452:	// flicker between two skins
;453:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 454
;454:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 455
;455:	ent.renderfx = weapon->missileRenderfx | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 140
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 466
;456:
;457:#ifdef MISSIONPACK
;458:	if ( cent->currentState.weapon == WP_PROX_LAUNCHER ) {
;459:		if (s1->generic1 == TEAM_BLUE) {
;460:			ent.hModel = cgs.media.blueProxMine;
;461:		}
;462:	}
;463:#endif
;464:
;465:	// convert direction of travel into axis
;466:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
ADDRLP4 144
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 148
ADDRGP4 VectorNormalize2
CALLF4
ASGNF4
ADDRLP4 148
INDIRF4
CNSTF4 0
NEF4 $361
line 467
;467:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 468
;468:	}
LABELV $361
line 471
;469:
;470:	// spin as it moves
;471:	if ( s1->pos.trType != TR_STATIONARY ) {
ADDRLP4 144
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $366
line 472
;472:		RotateAroundDirection( ent.axis, cg.time / 4 );
ADDRLP4 0+28
ARGP4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 4
DIVI4
CVIF4 4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 473
;473:	} else {
ADDRGP4 $367
JUMPV
LABELV $366
line 480
;474:#ifdef MISSIONPACK
;475:		if ( s1->weapon == WP_PROX_LAUNCHER ) {
;476:			AnglesToAxis( cent->lerpAngles, ent.axis );
;477:		}
;478:		else
;479:#endif
;480:		{
line 481
;481:			RotateAroundDirection( ent.axis, s1->time );
ADDRLP4 0+28
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 482
;482:		}
line 483
;483:	}
LABELV $367
line 486
;484:
;485:	// add to refresh list, possibly with quad glow
;486:	CG_AddRefEntityWithPowerups( &ent, s1, TEAM_FREE );
ADDRLP4 0
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 487
;487:}
LABELV $339
endproc CG_Missile 164 20
proc CG_Grapple 152 12
line 496
;488:
;489:/*
;490:===============
;491:CG_Grapple
;492:
;493:This is called when the grapple is sitting up against the wall
;494:===============
;495:*/
;496:static void CG_Grapple( centity_t *cent ) {
line 501
;497:	refEntity_t			ent;
;498:	entityState_t		*s1;
;499:	const weaponInfo_t		*weapon;
;500:
;501:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 502
;502:	if ( s1->weapon > WP_NUM_WEAPONS ) {
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 11
LEI4 $372
line 503
;503:		s1->weapon = 0;
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 504
;504:	}
LABELV $372
line 505
;505:	weapon = &cg_weapons[s1->weapon];
ADDRLP4 144
CNSTI4 136
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 508
;506:
;507:	// calculate the axis
;508:	VectorCopy( s1->angles, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 140
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 518
;509:
;510:#if 0 // FIXME add grapple pull sound here..?
;511:	// add missile sound
;512:	if ( weapon->missileSound ) {
;513:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->missileSound );
;514:	}
;515:#endif
;516:
;517:	// Will draw cable if needed
;518:	CG_GrappleTrail ( cent, weapon );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 CG_GrappleTrail
CALLV
pop
line 521
;519:
;520:	// create the render entity
;521:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 522
;522:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 523
;523:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 526
;524:
;525:	// flicker between two skins
;526:	ent.skinNum = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 527
;527:	ent.hModel = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 144
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 528
;528:	ent.renderfx = weapon->missileRenderfx | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 144
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 531
;529:
;530:	// convert direction of travel into axis
;531:	if ( VectorNormalize2( s1->pos.trDelta, ent.axis[0] ) == 0 ) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 148
ADDRGP4 VectorNormalize2
CALLF4
ASGNF4
ADDRLP4 148
INDIRF4
CNSTF4 0
NEF4 $379
line 532
;532:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 533
;533:	}
LABELV $379
line 535
;534:
;535:	trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 536
;536:}
LABELV $371
endproc CG_Grapple 152 12
proc CG_Mover 144 12
line 543
;537:
;538:/*
;539:===============
;540:CG_Mover
;541:===============
;542:*/
;543:static void CG_Mover( centity_t *cent ) {
line 547
;544:	refEntity_t			ent;
;545:	entityState_t		*s1;
;546:
;547:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 550
;548:
;549:	// create the render entity
;550:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 551
;551:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 552
;552:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 553
;553:	AnglesToAxis( cent->lerpAngles, ent.axis );
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 555
;554:
;555:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 558
;556:
;557:	// flicker between two skins (FIXME?)
;558:	ent.skinNum = ( cg.time >> 6 ) & 1;
ADDRLP4 0+104
ADDRGP4 cg+107604
INDIRI4
CNSTI4 6
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 561
;559:
;560:	// get the model, either as a bmodel or a modelindex
;561:	if ( s1->solid == SOLID_BMODEL ) {
ADDRLP4 140
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $391
line 562
;562:		ent.hModel = cgs.inlineDrawModel[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36876
ADDP4
INDIRI4
ASGNI4
line 563
;563:	} else {
ADDRGP4 $392
JUMPV
LABELV $391
line 564
;564:		ent.hModel = cgs.gameModels[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34824
ADDP4
INDIRI4
ASGNI4
line 565
;565:	}
LABELV $392
line 568
;566:
;567:	// add to refresh list
;568:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 571
;569:
;570:	// add the secondary model
;571:	if ( s1->modelindex2 ) {
ADDRLP4 140
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
EQI4 $397
line 572
;572:		ent.skinNum = 0;
ADDRLP4 0+104
CNSTI4 0
ASGNI4
line 573
;573:		ent.hModel = cgs.gameModels[s1->modelindex2];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34824
ADDP4
INDIRI4
ASGNI4
line 574
;574:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 575
;575:	}
LABELV $397
line 577
;576:
;577:}
LABELV $384
endproc CG_Mover 144 12
export CG_Beam
proc CG_Beam 144 12
line 586
;578:
;579:/*
;580:===============
;581:CG_Beam
;582:
;583:Also called as an event
;584:===============
;585:*/
;586:void CG_Beam( centity_t *cent ) {
line 590
;587:	refEntity_t			ent;
;588:	entityState_t		*s1;
;589:
;590:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 593
;591:
;592:	// create the render entity
;593:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 594
;594:	VectorCopy( s1->pos.trBase, ent.origin );
ADDRLP4 0+68
ADDRLP4 140
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 595
;595:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 596
;596:	AxisClear( ent.axis );
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 597
;597:	ent.reType = RT_BEAM;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 599
;598:
;599:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 602
;600:
;601:	// add to refresh list
;602:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 603
;603:}
LABELV $402
endproc CG_Beam 144 12
proc CG_Portal 144 12
line 611
;604:
;605:
;606:/*
;607:===============
;608:CG_Portal
;609:===============
;610:*/
;611:static void CG_Portal( centity_t *cent ) {
line 615
;612:	refEntity_t			ent;
;613:	entityState_t		*s1;
;614:
;615:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 618
;616:
;617:	// create the render entity
;618:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 619
;619:	VectorCopy( cent->lerpOrigin, ent.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 620
;620:	VectorCopy( s1->origin2, ent.oldorigin );
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 621
;621:	ByteToDir( s1->eventParm, ent.axis[0] );
ADDRLP4 140
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 0+28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 622
;622:	PerpendicularVector( ent.axis[1], ent.axis[0] );
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 626
;623:
;624:	// negating this tends to get the directions like they want
;625:	// we really should have a camera roll value
;626:	VectorSubtract( vec3_origin, ent.axis[1], ent.axis[1] );
ADDRLP4 0+28+12
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0+28+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+28+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+28+12+8
INDIRF4
SUBF4
ASGNF4
line 628
;627:
;628:	CrossProduct( ent.axis[0], ent.axis[1], ent.axis[2] );
ADDRLP4 0+28
ARGP4
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28+24
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 629
;629:	ent.reType = RT_PORTALSURFACE;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 630
;630:	ent.oldframe = s1->powerups;
ADDRLP4 0+96
ADDRLP4 140
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 631
;631:	ent.frame = s1->frame;		// rotation speed
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 632
;632:	ent.skinNum = s1->clientNum/256.0 * 360;	// roll offset
ADDRLP4 0+104
CNSTF4 1135869952
ADDRLP4 140
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1132462080
DIVF4
MULF4
CVFI4 4
ASGNI4
line 635
;633:
;634:	// add to refresh list
;635:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 636
;636:}
LABELV $407
endproc CG_Portal 144 12
export CG_AdjustPositionForMover
proc CG_AdjustPositionForMover 92 12
line 646
;637:
;638:
;639:/*
;640:=========================
;641:CG_AdjustPositionForMover
;642:
;643:Also called by client movement prediction code
;644:=========================
;645:*/
;646:void CG_AdjustPositionForMover( const vec3_t in, int moverNum, int fromTime, int toTime, vec3_t out ) {
line 651
;647:	centity_t	*cent;
;648:	vec3_t	oldOrigin, origin, deltaOrigin;
;649:	vec3_t	oldAngles, angles, deltaAngles;
;650:
;651:	if ( moverNum <= 0 || moverNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 76
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
LEI4 $443
ADDRLP4 76
INDIRI4
CNSTI4 1022
LTI4 $441
LABELV $443
line 652
;652:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 653
;653:		return;
ADDRGP4 $440
JUMPV
LABELV $441
line 656
;654:	}
;655:
;656:	cent = &cg_entities[ moverNum ];
ADDRLP4 0
CNSTI4 728
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 657
;657:	if ( cent->currentState.eType != ET_MOVER ) {
ADDRLP4 80
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $444
line 658
;658:		VectorCopy( in, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 659
;659:		return;
ADDRGP4 $440
JUMPV
LABELV $444
line 662
;660:	}
;661:
;662:	BG_EvaluateTrajectory( &cent->currentState.pos, fromTime, oldOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 663
;663:	BG_EvaluateTrajectory( &cent->currentState.apos, fromTime, oldAngles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 665
;664:
;665:	BG_EvaluateTrajectory( &cent->currentState.pos, toTime, origin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 666
;666:	BG_EvaluateTrajectory( &cent->currentState.apos, toTime, angles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 668
;667:
;668:	VectorSubtract( origin, oldOrigin, deltaOrigin );
ADDRLP4 4
ADDRLP4 28
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 28+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 669
;669:	VectorSubtract( angles, oldAngles, deltaAngles );
ADDRLP4 64
ADDRLP4 52
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 52+4
INDIRF4
ADDRLP4 40+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 52+8
INDIRF4
ADDRLP4 40+8
INDIRF4
SUBF4
ASGNF4
line 671
;670:
;671:	VectorAdd( in, deltaOrigin, out );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 88
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDF4
ASGNF4
line 674
;672:
;673:	// FIXME: origin change when on a rotating object
;674:}
LABELV $440
endproc CG_AdjustPositionForMover 92 12
proc CG_InterpolateEntityPosition 44 12
line 682
;675:
;676:
;677:/*
;678:=============================
;679:CG_InterpolateEntityPosition
;680:=============================
;681:*/
;682:static void CG_InterpolateEntityPosition( centity_t *cent ) {
line 688
;683:	vec3_t		current, next;
;684:	float		f;
;685:
;686:	// it would be an internal error to find an entity that interpolates without
;687:	// a snapshot ahead of the current one
;688:	if ( cg.nextSnap == NULL ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $461
line 689
;689:		CG_Error( "CG_InterpoateEntityPosition: cg.nextSnap == NULL" );
ADDRGP4 $464
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 690
;690:	}
LABELV $461
line 692
;691:
;692:	f = cg.frameInterpolation;
ADDRLP4 24
ADDRGP4 cg+107588
INDIRF4
ASGNF4
line 696
;693:
;694:	// this will linearize a sine or parabolic curve, but it is important
;695:	// to not extrapolate player positions if more recent data is available
;696:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.snap->serverTime, current );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 697
;697:	BG_EvaluateTrajectory( &cent->nextState.pos, cg.nextSnap->serverTime, next );
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 699
;698:
;699:	cent->lerpOrigin[0] = current[0] + f * ( next[0] - current[0] );
ADDRLP4 28
ADDRLP4 0
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 700
;700:	cent->lerpOrigin[1] = current[1] + f * ( next[1] - current[1] );
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 701
;701:	cent->lerpOrigin[2] = current[2] + f * ( next[2] - current[2] );
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 703
;702:
;703:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.snap->serverTime, current );
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 704
;704:	BG_EvaluateTrajectory( &cent->nextState.apos, cg.nextSnap->serverTime, next );
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 706
;705:
;706:	cent->lerpAngles[0] = LerpAngle( current[0], next[0], f );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 707
;707:	cent->lerpAngles[1] = LerpAngle( current[1], next[1], f );
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
line 708
;708:	cent->lerpAngles[2] = LerpAngle( current[2], next[2], f );
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
line 710
;709:
;710:}
LABELV $460
endproc CG_InterpolateEntityPosition 44 12
proc CG_CalcEntityLerpPositions 24 20
line 718
;711:
;712:/*
;713:===============
;714:CG_CalcEntityLerpPositions
;715:
;716:===============
;717:*/
;718:static void CG_CalcEntityLerpPositions( centity_t *cent ) {
line 721
;719:
;720:	// if this player does not want to see extrapolated players
;721:	if ( !cg_smoothClients.integer ) {
ADDRGP4 cg_smoothClients+12
INDIRI4
CNSTI4 0
NEI4 $481
line 723
;722:		// make sure the clients use TR_INTERPOLATE
;723:		if ( cent->currentState.number < MAX_CLIENTS ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $484
line 724
;724:			cent->currentState.pos.trType = TR_INTERPOLATE;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 725
;725:			cent->nextState.pos.trType = TR_INTERPOLATE;
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 1
ASGNI4
line 726
;726:		}
LABELV $484
line 727
;727:	}
LABELV $481
line 729
;728:
;729:	if ( cent->interpolate && cent->currentState.pos.trType == TR_INTERPOLATE ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $486
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
NEI4 $486
line 730
;730:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 731
;731:		return;
ADDRGP4 $480
JUMPV
LABELV $486
line 736
;732:	}
;733:
;734:	// first see if we can interpolate between two snaps for
;735:	// linear extrapolated clients
;736:	if ( cent->interpolate && cent->currentState.pos.trType == TR_LINEAR_STOP &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $488
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $488
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $488
line 737
;737:											cent->currentState.number < MAX_CLIENTS) {
line 738
;738:		CG_InterpolateEntityPosition( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 739
;739:		return;
ADDRGP4 $480
JUMPV
LABELV $488
line 743
;740:	}
;741:
;742:	// just use the current frame and evaluate as best we can
;743:	BG_EvaluateTrajectory( &cent->currentState.pos, cg.time, cent->lerpOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 744
;744:	BG_EvaluateTrajectory( &cent->currentState.apos, cg.time, cent->lerpAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 748
;745:
;746:	// adjust for riding a mover if it wasn't rolled into the predicted
;747:	// player state
;748:	if ( cent != &cg.predictedPlayerEntity ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cg+108104
CVPU4 4
EQU4 $492
line 749
;749:		CG_AdjustPositionForMover( cent->lerpOrigin, cent->currentState.groundEntityNum, 
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 704
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 751
;750:		cg.snap->serverTime, cg.time, cent->lerpOrigin );
;751:	}
LABELV $492
line 752
;752:}
LABELV $480
endproc CG_CalcEntityLerpPositions 24 20
proc CG_TeamBase 140 12
line 759
;753:
;754:/*
;755:===============
;756:CG_TeamBase
;757:===============
;758:*/
;759:static void CG_TeamBase( centity_t *cent ) {
line 768
;760:	refEntity_t model;
;761:#ifdef MISSIONPACK
;762:	vec3_t angles;
;763:	int t, h;
;764:	float c;
;765:
;766:	if ( cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF ) {
;767:#else
;768:	if ( cgs.gametype == GT_CTF) {
ADDRGP4 cgs+31456
INDIRI4
CNSTI4 4
NEI4 $498
line 771
;769:#endif
;770:		// show the flag base
;771:		memset(&model, 0, sizeof(model));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 772
;772:		model.reType = RT_MODEL;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 773
;773:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 774
;774:		VectorCopy( cent->lerpOrigin, model.origin );
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 775
;775:		AnglesToAxis( cent->currentState.angles, model.axis );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 776
;776:		if ( cent->currentState.modelindex == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $504
line 777
;777:			model.hModel = cgs.media.redFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+152340+108
INDIRI4
ASGNI4
line 778
;778:		}
ADDRGP4 $505
JUMPV
LABELV $504
line 779
;779:		else if ( cent->currentState.modelindex == TEAM_BLUE ) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
NEI4 $509
line 780
;780:			model.hModel = cgs.media.blueFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+152340+112
INDIRI4
ASGNI4
line 781
;781:		}
ADDRGP4 $510
JUMPV
LABELV $509
line 782
;782:		else {
line 783
;783:			model.hModel = cgs.media.neutralFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+152340+116
INDIRI4
ASGNI4
line 784
;784:		}
LABELV $510
LABELV $505
line 785
;785:		trap_R_AddRefEntityToScene( &model );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 786
;786:	}
LABELV $498
line 905
;787:#ifdef MISSIONPACK
;788:	else if ( cgs.gametype == GT_OBELISK ) {
;789:		// show the obelisk
;790:		memset(&model, 0, sizeof(model));
;791:		model.reType = RT_MODEL;
;792:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
;793:		VectorCopy( cent->lerpOrigin, model.origin );
;794:		AnglesToAxis( cent->currentState.angles, model.axis );
;795:
;796:		model.hModel = cgs.media.overloadBaseModel;
;797:		trap_R_AddRefEntityToScene( &model );
;798:		// if hit
;799:		if ( cent->currentState.frame == 1) {
;800:			// show hit model
;801:			// modelindex2 is the health value of the obelisk
;802:			c = cent->currentState.modelindex2;
;803:			model.shaderRGBA[0] = 0xff;
;804:			model.shaderRGBA[1] = c;
;805:			model.shaderRGBA[2] = c;
;806:			model.shaderRGBA[3] = 0xff;
;807:			//
;808:			model.hModel = cgs.media.overloadEnergyModel;
;809:			trap_R_AddRefEntityToScene( &model );
;810:		}
;811:		// if respawning
;812:		if ( cent->currentState.frame == 2) {
;813:			if ( !cent->miscTime ) {
;814:				cent->miscTime = cg.time;
;815:			}
;816:			t = cg.time - cent->miscTime;
;817:			h = (cg_obeliskRespawnDelay.integer - 5) * 1000;
;818:			//
;819:			if (t > h) {
;820:				c = (float) (t - h) / h;
;821:				if (c > 1)
;822:					c = 1;
;823:			}
;824:			else {
;825:				c = 0;
;826:			}
;827:			// show the lights
;828:			AnglesToAxis( cent->currentState.angles, model.axis );
;829:			//
;830:			model.shaderRGBA[0] = c * 0xff;
;831:			model.shaderRGBA[1] = c * 0xff;
;832:			model.shaderRGBA[2] = c * 0xff;
;833:			model.shaderRGBA[3] = c * 0xff;
;834:
;835:			model.hModel = cgs.media.overloadLightsModel;
;836:			trap_R_AddRefEntityToScene( &model );
;837:			// show the target
;838:			if (t > h) {
;839:				if ( !cent->muzzleFlashTime ) {
;840:					trap_S_StartSound (cent->lerpOrigin, ENTITYNUM_NONE, CHAN_BODY,  cgs.media.obeliskRespawnSound);
;841:					cent->muzzleFlashTime = 1;
;842:				}
;843:				VectorCopy(cent->currentState.angles, angles);
;844:				angles[YAW] += (float) 16 * acos(1-c) * 180 / M_PI;
;845:				AnglesToAxis( angles, model.axis );
;846:
;847:				VectorScale( model.axis[0], c, model.axis[0]);
;848:				VectorScale( model.axis[1], c, model.axis[1]);
;849:				VectorScale( model.axis[2], c, model.axis[2]);
;850:
;851:				model.shaderRGBA[0] = 0xff;
;852:				model.shaderRGBA[1] = 0xff;
;853:				model.shaderRGBA[2] = 0xff;
;854:				model.shaderRGBA[3] = 0xff;
;855:				//
;856:				model.origin[2] += 56;
;857:				model.hModel = cgs.media.overloadTargetModel;
;858:				trap_R_AddRefEntityToScene( &model );
;859:			}
;860:			else {
;861:				//FIXME: show animated smoke
;862:			}
;863:		}
;864:		else {
;865:			cent->miscTime = 0;
;866:			cent->muzzleFlashTime = 0;
;867:			// modelindex2 is the health value of the obelisk
;868:			c = cent->currentState.modelindex2;
;869:			model.shaderRGBA[0] = 0xff;
;870:			model.shaderRGBA[1] = c;
;871:			model.shaderRGBA[2] = c;
;872:			model.shaderRGBA[3] = 0xff;
;873:			// show the lights
;874:			model.hModel = cgs.media.overloadLightsModel;
;875:			trap_R_AddRefEntityToScene( &model );
;876:			// show the target
;877:			model.origin[2] += 56;
;878:			model.hModel = cgs.media.overloadTargetModel;
;879:			trap_R_AddRefEntityToScene( &model );
;880:		}
;881:	}
;882:	else if ( cgs.gametype == GT_HARVESTER ) {
;883:		// show harvester model
;884:		memset(&model, 0, sizeof(model));
;885:		model.reType = RT_MODEL;
;886:		VectorCopy( cent->lerpOrigin, model.lightingOrigin );
;887:		VectorCopy( cent->lerpOrigin, model.origin );
;888:		AnglesToAxis( cent->currentState.angles, model.axis );
;889:
;890:		if ( cent->currentState.modelindex == TEAM_RED ) {
;891:			model.hModel = cgs.media.harvesterModel;
;892:			model.customSkin = cgs.media.harvesterRedSkin;
;893:		}
;894:		else if ( cent->currentState.modelindex == TEAM_BLUE ) {
;895:			model.hModel = cgs.media.harvesterModel;
;896:			model.customSkin = cgs.media.harvesterBlueSkin;
;897:		}
;898:		else {
;899:			model.hModel = cgs.media.harvesterNeutralModel;
;900:			model.customSkin = 0;
;901:		}
;902:		trap_R_AddRefEntityToScene( &model );
;903:	}
;904:#endif
;905:}
LABELV $497
endproc CG_TeamBase 140 12
proc CG_AddCEntity 8 8
line 913
;906:
;907:/*
;908:===============
;909:CG_AddCEntity
;910:
;911:===============
;912:*/
;913:static void CG_AddCEntity( centity_t *cent ) {
line 915
;914:	// event-only entities will have been dealt with already
;915:	if ( cent->currentState.eType >= ET_EVENTS ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 15
LTI4 $518
line 916
;916:		return;
ADDRGP4 $517
JUMPV
LABELV $518
line 920
;917:	}
;918:
;919:	// calculate the current origin
;920:	CG_CalcEntityLerpPositions( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 923
;921:
;922:	// add automatic effects
;923:	CG_EntityEffects( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_EntityEffects
CALLV
pop
line 925
;924:
;925:	switch ( cent->currentState.eType ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $520
ADDRLP4 0
INDIRI4
CNSTI4 14
GTI4 $520
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $537
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $537
address $525
address $526
address $527
address $528
address $529
address $530
address $531
address $532
address $521
address $521
address $521
address $533
address $534
address $535
address $536
code
LABELV $520
line 927
;926:	default:
;927:		CG_Error( "Bad entity type: %i\n", cent->currentState.eType );
ADDRGP4 $523
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 928
;928:		break;
ADDRGP4 $521
JUMPV
line 932
;929:	case ET_INVISIBLE:
;930:	case ET_PUSH_TRIGGER:
;931:	case ET_TELEPORT_TRIGGER:
;932:		break;
LABELV $525
line 934
;933:	case ET_GENERAL:
;934:		CG_General( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_General
CALLV
pop
line 935
;935:		break;
ADDRGP4 $521
JUMPV
LABELV $526
line 937
;936:	case ET_PLAYER:
;937:		CG_Player( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Player
CALLV
pop
line 938
;938:		break;
ADDRGP4 $521
JUMPV
LABELV $527
line 940
;939:	case ET_ITEM:
;940:		CG_Item( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Item
CALLV
pop
line 941
;941:		break;
ADDRGP4 $521
JUMPV
LABELV $528
line 943
;942:	case ET_MISSILE:
;943:		CG_Missile( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Missile
CALLV
pop
line 944
;944:		break;
ADDRGP4 $521
JUMPV
LABELV $529
line 946
;945:	case ET_MOVER:
;946:		CG_Mover( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Mover
CALLV
pop
line 947
;947:		break;
ADDRGP4 $521
JUMPV
LABELV $530
line 949
;948:	case ET_BEAM:
;949:		CG_Beam( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 950
;950:		break;
ADDRGP4 $521
JUMPV
LABELV $531
line 952
;951:	case ET_PORTAL:
;952:		CG_Portal( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Portal
CALLV
pop
line 953
;953:		break;
ADDRGP4 $521
JUMPV
LABELV $532
line 955
;954:	case ET_SPEAKER:
;955:		CG_Speaker( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Speaker
CALLV
pop
line 956
;956:		break;
ADDRGP4 $521
JUMPV
LABELV $533
line 958
;957:	case ET_GRAPPLE:
;958:		CG_Grapple( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Grapple
CALLV
pop
line 959
;959:		break;
ADDRGP4 $521
JUMPV
LABELV $534
line 961
;960:	case ET_INFO:
;961:		CG_InfoSight( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InfoSight
CALLV
pop
line 962
;962:		break;
ADDRGP4 $521
JUMPV
LABELV $535
line 964
;963:	case ET_LASER:
;964:		CG_LaserSight( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LaserSight
CALLV
pop
line 965
;965:		break;
ADDRGP4 $521
JUMPV
LABELV $536
line 967
;966:	case ET_TEAM:
;967:		CG_TeamBase( cent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TeamBase
CALLV
pop
line 968
;968:		break;
LABELV $521
line 970
;969:	}
;970:}
LABELV $517
endproc CG_AddCEntity 8 8
export CG_AddPacketEntities
proc CG_AddPacketEntities 20 12
line 978
;971:
;972:/*
;973:===============
;974:CG_AddPacketEntities
;975:
;976:===============
;977:*/
;978:void CG_AddPacketEntities( void ) {
line 984
;979:	int					num;
;980:	centity_t			*cent;
;981:	playerState_t		*ps;
;982:
;983:	// set cg.frameInterpolation
;984:	if ( cg.nextSnap ) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $539
line 987
;985:		int		delta;
;986:
;987:		delta = (cg.nextSnap->serverTime - cg.snap->serverTime);
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 12
ADDRGP4 cg+40
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
SUBI4
ASGNI4
line 988
;988:		if ( delta == 0 ) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $544
line 989
;989:			cg.frameInterpolation = 0;
ADDRGP4 cg+107588
CNSTF4 0
ASGNF4
line 990
;990:		} else {
ADDRGP4 $540
JUMPV
LABELV $544
line 991
;991:			cg.frameInterpolation = (float)( cg.time - cg.snap->serverTime ) / delta;
ADDRGP4 cg+107588
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 12
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 992
;992:		}
line 993
;993:	} else {
ADDRGP4 $540
JUMPV
LABELV $539
line 994
;994:		cg.frameInterpolation = 0;	// actually, it should never be used, because 
ADDRGP4 cg+107588
CNSTF4 0
ASGNF4
line 996
;995:									// no entities should be marked as interpolating
;996:	}
LABELV $540
line 999
;997:
;998:	// the auto-rotating items will all have the same axis
;999:	cg.autoAngles[0] = 0;
ADDRGP4 cg+108948
CNSTF4 0
ASGNF4
line 1000
;1000:	cg.autoAngles[1] = ( cg.time & 2047 ) * 360 / 2048.0;
ADDRGP4 cg+108948+4
CNSTI4 360
ADDRGP4 cg+107604
INDIRI4
CNSTI4 2047
BANDI4
MULI4
CVIF4 4
CNSTF4 1157627904
DIVF4
ASGNF4
line 1001
;1001:	cg.autoAngles[2] = 0;
ADDRGP4 cg+108948+8
CNSTF4 0
ASGNF4
line 1003
;1002:
;1003:	cg.autoAnglesFast[0] = 0;
ADDRGP4 cg+108996
CNSTF4 0
ASGNF4
line 1004
;1004:	cg.autoAnglesFast[1] = ( cg.time & 1023 ) * 360 / 1024.0f;
ADDRGP4 cg+108996+4
CNSTI4 360
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1023
BANDI4
MULI4
CVIF4 4
CNSTF4 1149239296
DIVF4
ASGNF4
line 1005
;1005:	cg.autoAnglesFast[2] = 0;
ADDRGP4 cg+108996+8
CNSTF4 0
ASGNF4
line 1007
;1006:
;1007:	AnglesToAxis( cg.autoAngles, cg.autoAxis );
ADDRGP4 cg+108948
ARGP4
ADDRGP4 cg+108960
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1008
;1008:	AnglesToAxis( cg.autoAnglesFast, cg.autoAxisFast );
ADDRGP4 cg+108996
ARGP4
ADDRGP4 cg+109008
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1011
;1009:
;1010:	// generate and add the entity from the playerstate
;1011:	ps = &cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+107636
ASGNP4
line 1012
;1012:	BG_PlayerStateToEntityState( ps, &cg.predictedPlayerEntity.currentState, qfalse );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 cg+108104
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1013
;1013:	CG_AddCEntity( &cg.predictedPlayerEntity );
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1016
;1014:
;1015:	// lerp the non-predicted value for lightning gun origins
;1016:	CG_CalcEntityLerpPositions( &cg_entities[ cg.snap->ps.clientNum ] );
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
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 1019
;1017:
;1018:	// add each entity sent over by the server
;1019:	for ( num = 0 ; num < cg.snap->numEntities ; num++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $574
JUMPV
LABELV $571
line 1020
;1020:		cent = &cg_entities[ cg.snap->entities[ num ].number ];
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
line 1021
;1021:		CG_AddCEntity( cent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1022
;1022:	}
LABELV $572
line 1019
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $574
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $571
line 1023
;1023:}
LABELV $538
endproc CG_AddPacketEntities 20 12
proc CG_InfoSight 144 20
line 1032
;1024:
;1025:/*
;1026:==================
;1027:CG_InfoSight
;1028:  Creates the info
;1029:==================
;1030:*/
;1031:
;1032:static void CG_InfoSight( centity_t *cent )  {
line 1037
;1033:	refEntity_t			ent;
;1034:
;1035:
;1036:	// create the render entity
;1037:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1038
;1038:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 1039
;1039:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 1041
;1040:
;1041:	if (cent->currentState.eventParm == 1)
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1
NEI4 $580
line 1042
;1042:	{
line 1043
;1043:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1044
;1044:		ent.radius = 60;
ADDRLP4 0+132
CNSTF4 1114636288
ASGNF4
line 1045
;1045:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 1046
;1046:		ent.customShader = cgs.media.infoShader;
ADDRLP4 0+112
ADDRGP4 cgs+152340+264
INDIRI4
ASGNI4
line 1047
;1047:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1048
;1048:	}
ADDRGP4 $581
JUMPV
LABELV $580
line 1049
;1049:	else	{
line 1050
;1050:		trap_R_AddLightToScene(ent.origin, 200, 1, 1, 1);
ADDRLP4 0+68
ARGP4
CNSTF4 1128792064
ARGF4
ADDRLP4 140
CNSTF4 1065353216
ASGNF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1051
;1051:	}
LABELV $581
line 1054
;1052:
;1053:	
;1054:}
LABELV $577
endproc CG_InfoSight 144 20
proc CG_LaserSight 144 20
line 1062
;1055:/*
;1056:==================
;1057:CG_LaserSight
;1058:  Creates the laser
;1059:==================
;1060:*/
;1061:
;1062:static void CG_LaserSight( centity_t *cent )  {
line 1067
;1063:	refEntity_t			ent;
;1064:
;1065:
;1066:	// create the render entity
;1067:	memset (&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1068
;1068:	VectorCopy( cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 1069
;1069:	VectorCopy( cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRB
ASGNB 12
line 1071
;1070:
;1071:	if (cent->currentState.eventParm == 1)
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1
NEI4 $591
line 1072
;1072:	{
line 1073
;1073:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1074
;1074:		ent.radius = 2;
ADDRLP4 0+132
CNSTF4 1073741824
ASGNF4
line 1075
;1075:		ent.rotation = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 1076
;1076:		ent.customShader = cgs.media.laserShader;
ADDRLP4 0+112
ADDRGP4 cgs+152340+268
INDIRI4
ASGNI4
line 1077
;1077:		trap_R_AddRefEntityToScene( &ent );
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1078
;1078:	}
ADDRGP4 $592
JUMPV
LABELV $591
line 1079
;1079:	else	{
line 1080
;1080:		trap_R_AddLightToScene(ent.origin, 200, 1, 1, 1);
ADDRLP4 0+68
ARGP4
CNSTF4 1128792064
ARGF4
ADDRLP4 140
CNSTF4 1065353216
ASGNF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRLP4 140
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 1081
;1081:	}
LABELV $592
line 1084
;1082:
;1083:	
;1084:}CG_InfoSight( centity_t *cent )  {
LABELV $588
endproc CG_LaserSight 144 20
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
LABELV $523
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $464
byte 1 67
byte 1 71
byte 1 95
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 112
byte 1 111
byte 1 97
byte 1 116
byte 1 101
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 80
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
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
LABELV $124
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
