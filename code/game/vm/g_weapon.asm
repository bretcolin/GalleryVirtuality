export G_BounceProjectile
code
proc G_BounceProjectile 64 4
file "../g_weapon.c"
line 19
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_weapon.c 
;4:// perform the server side effects of a weapon firing
;5:
;6:#include "g_local.h"
;7:
;8:static	float	s_quadFactor;
;9:static	vec3_t	forward, right, up;
;10:static	vec3_t	muzzle;
;11:
;12:#define NUM_NAILSHOTS 15
;13:
;14:/*
;15:================
;16:G_BounceProjectile
;17:================
;18:*/
;19:void G_BounceProjectile( vec3_t start, vec3_t impact, vec3_t dir, vec3_t endout ) {
line 23
;20:	vec3_t v, newv;
;21:	float dot;
;22:
;23:	VectorSubtract( impact, start, v );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 24
;24:	dot = DotProduct( v, dir );
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 25
;25:	VectorMA( v, -2*dot, dir, newv );
ADDRLP4 48
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 52
CNSTF4 3221225472
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 24
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 27
;26:
;27:	VectorNormalize(newv);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 28
;28:	VectorMA(impact, 8192, newv, endout);
ADDRFP4 12
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
CNSTF4 1174405120
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 56
CNSTI4 4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
CNSTF4 1174405120
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
CNSTF4 1174405120
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 29
;29:}
LABELV $52
endproc G_BounceProjectile 64 4
export Weapon_Gauntlet
proc Weapon_Gauntlet 0 0
line 40
;30:
;31:
;32:/*
;33:======================================================================
;34:
;35:GAUNTLET
;36:
;37:======================================================================
;38:*/
;39:
;40:void Weapon_Gauntlet( gentity_t *ent ) {
line 42
;41:
;42:}
LABELV $63
endproc Weapon_Gauntlet 0 0
export CheckGauntletAttack
proc CheckGauntletAttack 104 32
line 49
;43:
;44:/*
;45:===============
;46:CheckGauntletAttack
;47:===============
;48:*/
;49:qboolean CheckGauntletAttack( gentity_t *ent ) {
line 57
;50:	trace_t		tr;
;51:	vec3_t		end;
;52:	gentity_t	*tent;
;53:	gentity_t	*traceEnt;
;54:	int			damage;
;55:
;56:	// set aiming directions
;57:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 59
;58:
;59:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 61
;60:
;61:	VectorMA (muzzle, 32, forward, end);
ADDRLP4 80
CNSTF4 1107296256
ASGNF4
ADDRLP4 60
ADDRGP4 muzzle
INDIRF4
ADDRLP4 80
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 80
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 1107296256
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 63
;62:
;63:	trap_Trace (&tr, muzzle, NULL, NULL, end, ent->s.number, MASK_SHOT);
ADDRLP4 4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 84
CNSTP4 0
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 60
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 64
;64:	if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $71
line 65
;65:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $64
JUMPV
LABELV $71
line 68
;66:	}
;67:
;68:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 0
CNSTI4 808
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 71
;69:
;70:	// send blood impact
;71:	if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $75
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $75
line 72
;72:		tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 92
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 92
INDIRP4
ASGNP4
line 73
;73:		tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 74
;74:		tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 96
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 75
;75:		tent->s.weapon = ent->s.weapon;
ADDRLP4 100
CNSTI4 192
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 76
;76:	}
LABELV $75
line 78
;77:
;78:	if ( !traceEnt->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $79
line 79
;79:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $64
JUMPV
LABELV $79
line 82
;80:	}
;81:
;82:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $81
line 83
;83:		G_AddEvent( ent, EV_POWERUP_QUAD, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 61
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 84
;84:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 85
;85:	} else {
ADDRGP4 $82
JUMPV
LABELV $81
line 86
;86:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 87
;87:	}
LABELV $82
line 94
;88:#ifdef MISSIONPACK
;89:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;90:		s_quadFactor *= 2;
;91:	}
;92:#endif
;93:
;94:	damage = 50 * s_quadFactor;
ADDRLP4 76
CNSTF4 1112014848
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 95
;95:	G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 98
;96:		damage, 0, MOD_GAUNTLET );
;97:
;98:	return qtrue;
CNSTI4 1
RETI4
LABELV $64
endproc CheckGauntletAttack 104 32
export SnapVectorTowards
proc SnapVectorTowards 12 0
line 120
;99:}
;100:
;101:
;102:/*
;103:======================================================================
;104:
;105:MACHINEGUN
;106:
;107:======================================================================
;108:*/
;109:
;110:/*
;111:======================
;112:SnapVectorTowards
;113:
;114:Round a vector to integers for more efficient network
;115:transmission, but make sure that it rounds towards a given point
;116:rather than blindly truncating.  This prevents it from truncating 
;117:into a wall.
;118:======================
;119:*/
;120:void SnapVectorTowards( vec3_t v, vec3_t to ) {
line 123
;121:	int		i;
;122:
;123:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $86
line 124
;124:		if ( to[i] <= v[i] ) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
GTF4 $90
line 125
;125:			v[i] = (int)v[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 126
;126:		} else {
ADDRGP4 $91
JUMPV
LABELV $90
line 127
;127:			v[i] = (int)v[i] + 1;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CNSTI4 1
ADDI4
CVIF4 4
ASGNF4
line 128
;128:		}
LABELV $91
line 129
;129:	}
LABELV $87
line 123
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $86
line 130
;130:}
LABELV $85
endproc SnapVectorTowards 12 0
export Bullet_Fire
proc Bullet_Fire 144 32
line 139
;131:
;132:#ifdef MISSIONPACK
;133:#define CHAINGUN_SPREAD		600
;134:#endif
;135:#define MACHINEGUN_SPREAD	200
;136:#define	MACHINEGUN_DAMAGE	7
;137:#define	MACHINEGUN_TEAM_DAMAGE	5		// wimpier MG in teamplay
;138:
;139:void Bullet_Fire (gentity_t *ent, float spread, int damage ) {
line 151
;140:	trace_t		tr;
;141:	vec3_t		end;
;142:#ifdef MISSIONPACK
;143:	vec3_t		impactpoint, bouncedir;
;144:#endif
;145:	float		r;
;146:	float		u;
;147:	gentity_t	*tent;
;148:	gentity_t	*traceEnt;
;149:	int			i, passent;
;150:
;151:	damage *= s_quadFactor;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 153
;152:
;153:	r = random() * M_PI * 2.0f;
ADDRLP4 92
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 92
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
MULF4
ASGNF4
line 154
;154:	u = sin(r) * crandom() * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 96
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 100
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 88
CNSTF4 1098907648
ADDRLP4 96
INDIRF4
CNSTF4 1073741824
ADDRLP4 100
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
ADDRFP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 155
;155:	r = cos(r) * crandom() * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 104
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 108
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
CNSTF4 1098907648
ADDRLP4 104
INDIRF4
CNSTF4 1073741824
ADDRLP4 108
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
ADDRFP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 156
;156:	VectorMA (muzzle, 8192*16, forward, end);
ADDRLP4 112
CNSTF4 1207959552
ASGNF4
ADDRLP4 64
ADDRGP4 muzzle
INDIRF4
ADDRLP4 112
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 112
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 1207959552
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 157
;157:	VectorMA (end, r, right, end);
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 right
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 right+4
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 right+8
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
line 158
;158:	VectorMA (end, u, up, end);
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 up
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 up+4
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 up+8
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
line 160
;159:
;160:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 161
;161:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $111
line 163
;162:
;163:		trap_Trace (&tr, muzzle, NULL, NULL, end, passent, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 124
CNSTP4 0
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 164
;164:		if ( tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $115
line 165
;165:			return;
ADDRGP4 $92
JUMPV
LABELV $115
line 168
;166:		}
;167:
;168:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 808
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 171
;169:
;170:		// snap the endpos to integers, but nudged towards the line
;171:		SnapVectorTowards( tr.endpos, muzzle );
ADDRLP4 0+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 174
;172:
;173:		// send bullet impact
;174:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $120
ADDRLP4 56
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $120
line 175
;175:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_FLESH );
ADDRLP4 0+12
ARGP4
CNSTI4 48
ARGI4
ADDRLP4 132
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 132
INDIRP4
ASGNP4
line 176
;176:			tent->s.eventParm = traceEnt->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 177
;177:			if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $121
line 178
;178:				ent->client->accuracy_hits++;
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 179
;179:			}
line 180
;180:		} else {
ADDRGP4 $121
JUMPV
LABELV $120
line 181
;181:			tent = G_TempEntity( tr.endpos, EV_BULLET_HIT_WALL );
ADDRLP4 0+12
ARGP4
CNSTI4 49
ARGI4
ADDRLP4 132
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 132
INDIRP4
ASGNP4
line 182
;182:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 136
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 136
INDIRI4
ASGNI4
line 183
;183:		}
LABELV $121
line 184
;184:		tent->s.otherEntityNum = ent->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 186
;185:
;186:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $113
line 203
;187:#ifdef MISSIONPACK
;188:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;189:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;190:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;191:					VectorCopy( impactpoint, muzzle );
;192:					// the player can hit him/herself with the bounced rail
;193:					passent = ENTITYNUM_NONE;
;194:				}
;195:				else {
;196:					VectorCopy( tr.endpos, muzzle );
;197:					passent = traceEnt->s.number;
;198:				}
;199:				continue;
;200:			}
;201:			else {
;202:#endif
;203:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 208
;204:					damage, 0, MOD_MACHINEGUN);
;205:#ifdef MISSIONPACK
;206:			}
;207:#endif
;208:		}
line 209
;209:		break;
ADDRGP4 $113
JUMPV
LABELV $112
line 161
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $111
LABELV $113
line 211
;210:	}
;211:}
LABELV $92
endproc Bullet_Fire 144 32
export BFG_Fire
proc BFG_Fire 16 12
line 222
;212:
;213:
;214:/*
;215:======================================================================
;216:
;217:BFG
;218:
;219:======================================================================
;220:*/
;221:
;222:void BFG_Fire ( gentity_t *ent ) {
line 225
;223:	gentity_t	*m;
;224:
;225:	m = fire_bfg (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_bfg
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 226
;226:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 227
;227:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 230
;228:
;229://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;230:}
LABELV $130
endproc BFG_Fire 16 12
export ShotgunPellet
proc ShotgunPellet 108 32
line 245
;231:
;232:
;233:/*
;234:======================================================================
;235:
;236:SHOTGUN
;237:
;238:======================================================================
;239:*/
;240:
;241:// DEFAULT_SHOTGUN_SPREAD and DEFAULT_SHOTGUN_COUNT	are in bg_public.h, because
;242:// client predicts same spreads
;243:#define	DEFAULT_SHOTGUN_DAMAGE	10
;244:
;245:qboolean ShotgunPellet( vec3_t start, vec3_t end, gentity_t *ent ) {
line 254
;246:	trace_t		tr;
;247:	int			damage, i, passent;
;248:	gentity_t	*traceEnt;
;249:#ifdef MISSIONPACK
;250:	vec3_t		impactpoint, bouncedir;
;251:#endif
;252:	vec3_t		tr_start, tr_end;
;253:
;254:	passent = ent->s.number;
ADDRLP4 64
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 255
;255:	VectorCopy( start, tr_start );
ADDRLP4 68
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 256
;256:	VectorCopy( end, tr_end );
ADDRLP4 80
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 257
;257:	for (i = 0; i < 10; i++) {
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $132
line 258
;258:		trap_Trace (&tr, tr_start, NULL, NULL, tr_end, passent, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 96
CNSTP4 0
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 64
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 259
;259:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 808
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 262
;260:
;261:		// send bullet impact
;262:		if (  tr.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $137
line 263
;263:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $137
line 266
;264:		}
;265:
;266:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $140
line 267
;267:			damage = DEFAULT_SHOTGUN_DAMAGE * s_quadFactor;
ADDRLP4 92
CNSTF4 1092616192
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 290
;268:#ifdef MISSIONPACK
;269:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;270:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;271:					G_BounceProjectile( tr_start, impactpoint, bouncedir, tr_end );
;272:					VectorCopy( impactpoint, tr_start );
;273:					// the player can hit him/herself with the bounced rail
;274:					passent = ENTITYNUM_NONE;
;275:				}
;276:				else {
;277:					VectorCopy( tr.endpos, tr_start );
;278:					passent = traceEnt->s.number;
;279:				}
;280:				continue;
;281:			}
;282:			else {
;283:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
;284:					damage, 0, MOD_SHOTGUN);
;285:				if( LogAccuracyHit( traceEnt, ent ) ) {
;286:					return qtrue;
;287:				}
;288:			}
;289:#else
;290:			G_Damage( traceEnt, ent, ent, forward, tr.endpos,	damage, 0, MOD_SHOTGUN);
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 100
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 92
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 291
;291:				if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $143
line 292
;292:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $131
JUMPV
LABELV $143
line 295
;293:				}
;294:#endif
;295:		}
LABELV $140
line 296
;296:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $133
line 257
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 10
LTI4 $132
line 298
;297:	}
;298:	return qfalse;
CNSTI4 0
RETI4
LABELV $131
endproc ShotgunPellet 108 32
export ShotgunPattern
proc ShotgunPattern 104 12
line 302
;299:}
;300:
;301:// this should match CG_ShotgunPattern
;302:void ShotgunPattern( vec3_t origin, vec3_t origin2, int seed, gentity_t *ent ) {
line 308
;303:	int			i;
;304:	float		r, u;
;305:	vec3_t		end;
;306:	vec3_t		forward, right, up;
;307:	int			oldScore;
;308:	qboolean	hitClient = qfalse;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 312
;309:
;310:	// derive the right and up vectors from the forward vector, because
;311:	// the client won't have any other information
;312:	VectorNormalize2( origin2, forward );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 313
;313:	PerpendicularVector( right, forward );
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 314
;314:	CrossProduct( forward, right, up );
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 316
;315:
;316:	oldScore = ent->client->ps.persistant[PERS_SCORE];
ADDRLP4 64
ADDRFP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 319
;317:
;318:	// generate the "random" spread pattern
;319:	for ( i = 0 ; i < DEFAULT_SHOTGUN_COUNT ; i++ ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $146
line 320
;320:		r = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 68
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 12
CNSTF4 1098907648
CNSTF4 1143930880
ADDRLP4 68
INDIRF4
MULF4
MULF4
ASGNF4
line 321
;321:		u = Q_crandom( &seed ) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 72
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 16
CNSTF4 1098907648
CNSTF4 1143930880
ADDRLP4 72
INDIRF4
MULF4
MULF4
ASGNF4
line 322
;322:		VectorMA( origin, 8192 * 16, forward, end);
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
CNSTF4 1207959552
ASGNF4
ADDRLP4 0
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 80
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 80
INDIRF4
ADDRLP4 20+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1207959552
ADDRLP4 20+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 323
;323:		VectorMA (end, r, right, end);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 32+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 32+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 324
;324:		VectorMA (end, u, up, end);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 325
;325:		if( ShotgunPellet( origin, end, ent ) && !hitClient ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 ShotgunPellet
CALLI4
ASGNI4
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRI4
ADDRLP4 96
INDIRI4
EQI4 $166
ADDRLP4 60
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $166
line 326
;326:			hitClient = qtrue;
ADDRLP4 60
CNSTI4 1
ASGNI4
line 327
;327:			ent->client->accuracy_hits++;
ADDRLP4 100
ADDRFP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 328
;328:		}
LABELV $166
line 329
;329:	}
LABELV $147
line 319
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 11
LTI4 $146
line 330
;330:}
LABELV $145
endproc ShotgunPattern 104 12
export weapon_supershotgun_fire
proc weapon_supershotgun_fire 20 16
line 333
;331:
;332:
;333:void weapon_supershotgun_fire (gentity_t *ent) {
line 337
;334:	gentity_t		*tent;
;335:
;336:	// send shotgun blast
;337:	tent = G_TempEntity( muzzle, EV_SHOTGUN );
ADDRGP4 muzzle
ARGP4
CNSTI4 54
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 338
;338:	VectorScale( forward, 4096, tent->s.origin2 );
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
CNSTF4 1166016512
ADDRGP4 forward
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
CNSTF4 1166016512
ADDRGP4 forward+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTF4 1166016512
ADDRGP4 forward+8
INDIRF4
MULF4
ASGNF4
line 339
;339:	SnapVector( tent->s.origin2 );
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 340
;340:	tent->s.eventParm = rand() & 255;		// seed for spread pattern
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 341
;341:	tent->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 343
;342:
;343:	ShotgunPattern( tent->s.pos.trBase, tent->s.origin2, tent->s.eventParm, ent );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ShotgunPattern
CALLV
pop
line 344
;344:}
LABELV $168
endproc weapon_supershotgun_fire 20 16
export weapon_grenadelauncher_fire
proc weapon_grenadelauncher_fire 20 12
line 355
;345:
;346:
;347:/*
;348:======================================================================
;349:
;350:GRENADE LAUNCHER
;351:
;352:======================================================================
;353:*/
;354:
;355:void weapon_grenadelauncher_fire (gentity_t *ent) {
line 359
;356:	gentity_t	*m;
;357:
;358:	// extra vertical velocity
;359:	forward[2] += 0.2f;
ADDRLP4 4
ADDRGP4 forward+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 360
;360:	VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 362
;361:
;362:	m = fire_grenade (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
ADDRGP4 fire_grenade
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 363
;363:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 364
;364:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 367
;365:
;366://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;367:}
LABELV $171
endproc weapon_grenadelauncher_fire 20 12
export Weapon_RocketLauncher_Fire
proc Weapon_RocketLauncher_Fire 16 12
line 377
;368:
;369:/*
;370:======================================================================
;371:
;372:ROCKET
;373:
;374:======================================================================
;375:*/
;376:
;377:void Weapon_RocketLauncher_Fire (gentity_t *ent) {
line 380
;378:	gentity_t	*m;
;379:
;380:	m = fire_rocket (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_rocket
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 381
;381:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 382
;382:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 385
;383:
;384://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;385:}
LABELV $173
endproc Weapon_RocketLauncher_Fire 16 12
export Weapon_Plasmagun_Fire
proc Weapon_Plasmagun_Fire 16 12
line 396
;386:
;387:
;388:/*
;389:======================================================================
;390:
;391:PLASMA GUN
;392:
;393:======================================================================
;394:*/
;395:
;396:void Weapon_Plasmagun_Fire (gentity_t *ent) {
line 399
;397:	gentity_t	*m;
;398:
;399:	m = fire_plasma (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_plasma
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 400
;400:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 401
;401:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 404
;402:
;403://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;404:}
LABELV $174
endproc Weapon_Plasmagun_Fire 16 12
export weapon_railgun_fire
proc weapon_railgun_fire 172 32
line 421
;405:
;406:/*
;407:======================================================================
;408:
;409:RAILGUN
;410:
;411:======================================================================
;412:*/
;413:
;414:
;415:/*
;416:=================
;417:weapon_railgun_fire
;418:=================
;419:*/
;420:#define	MAX_RAIL_HITS	4
;421:void weapon_railgun_fire (gentity_t *ent) {
line 436
;422:	vec3_t		end;
;423:#ifdef MISSIONPACK
;424:	vec3_t impactpoint, bouncedir;
;425:#endif
;426:	trace_t		trace;
;427:	gentity_t	*tent;
;428:	gentity_t	*traceEnt;
;429:	int			damage;
;430:	int			i;
;431:	int			hits;
;432:	int			unlinked;
;433:	int			passent;
;434:	gentity_t	*unlinkedEntities[MAX_RAIL_HITS];
;435:
;436:	damage = 100 * s_quadFactor;
ADDRLP4 104
CNSTF4 1120403456
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 438
;437:
;438:	VectorMA (muzzle, 8192, forward, end);
ADDRLP4 112
CNSTF4 1174405120
ASGNF4
ADDRLP4 88
ADDRGP4 muzzle
INDIRF4
ADDRLP4 112
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 112
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 1174405120
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 441
;439:
;440:	// trace only against the solids, so the railgun will go through people
;441:	unlinked = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 442
;442:	hits = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 443
;443:	passent = ent->s.number;
ADDRLP4 100
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $182
line 444
;444:	do {
line 445
;445:		trap_Trace (&trace, muzzle, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 116
CNSTP4 0
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 446
;446:		if ( trace.entityNum >= ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 4+52
INDIRI4
CNSTI4 1022
LTI4 $185
line 447
;447:			break;
ADDRGP4 $184
JUMPV
LABELV $185
line 449
;448:		}
;449:		traceEnt = &g_entities[ trace.entityNum ];
ADDRLP4 0
CNSTI4 808
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 450
;450:		if ( traceEnt->takedamage ) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $189
line 479
;451:#ifdef MISSIONPACK
;452:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;453:				if ( G_InvulnerabilityEffect( traceEnt, forward, trace.endpos, impactpoint, bouncedir ) ) {
;454:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;455:					// snap the endpos to integers to save net bandwidth, but nudged towards the line
;456:					SnapVectorTowards( trace.endpos, muzzle );
;457:					// send railgun beam effect
;458:					tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
;459:					// set player number for custom colors on the railtrail
;460:					tent->s.clientNum = ent->s.clientNum;
;461:					VectorCopy( muzzle, tent->s.origin2 );
;462:					// move origin a bit to come closer to the drawn gun muzzle
;463:					VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
;464:					VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
;465:					tent->s.eventParm = 255;	// don't make the explosion at the end
;466:					//
;467:					VectorCopy( impactpoint, muzzle );
;468:					// the player can hit him/herself with the bounced rail
;469:					passent = ENTITYNUM_NONE;
;470:				}
;471:			}
;472:			else {
;473:				if( LogAccuracyHit( traceEnt, ent ) ) {
;474:					hits++;
;475:				}
;476:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
;477:			}
;478:#else
;479:				if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $191
line 480
;480:					hits++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 481
;481:				}
LABELV $191
line 482
;482:				G_Damage (traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 484
;483:#endif
;484:		}
LABELV $189
line 485
;485:		if ( trace.contents & CONTENTS_SOLID ) {
ADDRLP4 4+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $194
line 486
;486:			break;		// we hit something solid enough to stop the beam
ADDRGP4 $184
JUMPV
LABELV $194
line 489
;487:		}
;488:		// unlink this entity, so the next trace will go past it
;489:		trap_UnlinkEntity( traceEnt );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 490
;490:		unlinkedEntities[unlinked] = traceEnt;
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 491
;491:		unlinked++;
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 492
;492:	} while ( unlinked < MAX_RAIL_HITS );
LABELV $183
ADDRLP4 60
INDIRI4
CNSTI4 4
LTI4 $182
LABELV $184
line 495
;493:
;494:	// link back in any entities we unlinked
;495:	for ( i = 0 ; i < unlinked ; i++ ) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $200
JUMPV
LABELV $197
line 496
;496:		trap_LinkEntity( unlinkedEntities[i] );
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 497
;497:	}
LABELV $198
line 495
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $200
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $197
line 502
;498:
;499:	// the final trace endpos will be the terminal point of the rail trail
;500:
;501:	// snap the endpos to integers to save net bandwidth, but nudged towards the line
;502:	SnapVectorTowards( trace.endpos, muzzle );
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 505
;503:
;504:	// send railgun beam effect
;505:	tent = G_TempEntity( trace.endpos, EV_RAILTRAIL );
ADDRLP4 4+12
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 116
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 116
INDIRP4
ASGNP4
line 508
;506:
;507:	// set player number for custom colors on the railtrail
;508:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 120
CNSTI4 168
ASGNI4
ADDRLP4 84
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 510
;509:
;510:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 512
;511:	// move origin a bit to come closer to the drawn gun muzzle
;512:	VectorMA( tent->s.origin2, 4, right, tent->s.origin2 );
ADDRLP4 124
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 128
ADDRLP4 84
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 132
ADDRLP4 84
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 513
;513:	VectorMA( tent->s.origin2, -1, up, tent->s.origin2 );
ADDRLP4 136
ADDRLP4 84
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 140
ADDRLP4 84
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 144
ADDRLP4 84
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
CNSTF4 3212836864
ADDRGP4 up+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 516
;514:
;515:	// no explosion at end if SURF_NOIMPACT, but still make the trail
;516:	if ( trace.surfaceFlags & SURF_NOIMPACT ) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $207
line 517
;517:		tent->s.eventParm = 255;	// don't make the explosion at the end
ADDRLP4 84
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 255
ASGNI4
line 518
;518:	} else {
ADDRGP4 $208
JUMPV
LABELV $207
line 519
;519:		tent->s.eventParm = DirToByte( trace.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 148
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 520
;520:	}
LABELV $208
line 521
;521:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 148
CNSTI4 168
ASGNI4
ADDRLP4 84
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 524
;522:
;523:	// give the shooter a reward sound if they have made two railgun hits in a row
;524:	if ( hits == 0 ) {
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $211
line 526
;525:		// complete miss
;526:		ent->client->accurateCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 0
ASGNI4
line 527
;527:	} else {
ADDRGP4 $212
JUMPV
LABELV $211
line 529
;528:		// check for "impressive" reward sound
;529:		ent->client->accurateCount += hits;
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 708
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
ADDRLP4 108
INDIRI4
ADDI4
ASGNI4
line 530
;530:		if ( ent->client->accurateCount >= 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 708
ADDP4
INDIRI4
CNSTI4 2
LTI4 $213
line 531
;531:			ent->client->accurateCount -= 2;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 708
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 532
;532:			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 534
;533:			// add the sprite over the player's head
;534:			ent->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 535
;535:			ent->client->ps.eFlags |= EF_AWARD_IMPRESSIVE;
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 536
;536:			ent->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 537
;537:		}
LABELV $213
line 538
;538:		ent->client->accuracy_hits++;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 539
;539:	}
LABELV $212
line 541
;540:
;541:}
LABELV $175
endproc weapon_railgun_fire 172 32
export Weapon_GrapplingHook_Fire
proc Weapon_GrapplingHook_Fire 4 12
line 553
;542:
;543:
;544:/*
;545:======================================================================
;546:
;547:GRAPPLING HOOK
;548:
;549:======================================================================
;550:*/
;551:
;552:void Weapon_GrapplingHook_Fire (gentity_t *ent)
;553:{
line 554
;554:	if (!ent->client->fireHeld && !ent->client->hook)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
CNSTI4 0
NEI4 $217
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $217
line 555
;555:		fire_grapple (ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 fire_grapple
CALLP4
pop
LABELV $217
line 557
;556:
;557:	ent->client->fireHeld = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 1
ASGNI4
line 558
;558:}
LABELV $216
endproc Weapon_GrapplingHook_Fire 4 12
export Weapon_HookFree
proc Weapon_HookFree 4 4
line 561
;559:
;560:void Weapon_HookFree (gentity_t *ent)
;561:{
line 562
;562:	ent->parent->client->hook = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 760
ADDP4
CNSTP4 0
ASGNP4
line 563
;563:	ent->parent->client->ps.pm_flags &= ~PMF_GRAPPLE_PULL;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 564
;564:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 565
;565:}
LABELV $219
endproc Weapon_HookFree 4 4
export Weapon_HookThink
proc Weapon_HookThink 36 8
line 568
;566:
;567:void Weapon_HookThink (gentity_t *ent)
;568:{
line 569
;569:	if (ent->enemy) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $221
line 572
;570:		vec3_t v, oldorigin;
;571:
;572:		VectorCopy(ent->r.currentOrigin, oldorigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 573
;573:		v[0] = ent->enemy->r.currentOrigin[0] + (ent->enemy->r.mins[0] + ent->enemy->r.maxs[0]) * 0.5;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 24
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 574
;574:		v[1] = ent->enemy->r.currentOrigin[1] + (ent->enemy->r.mins[1] + ent->enemy->r.maxs[1]) * 0.5;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 28
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 575
;575:		v[2] = ent->enemy->r.currentOrigin[2] + (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 32
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 32
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 576
;576:		SnapVectorTowards( v, oldorigin );	// save net bandwidth
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 578
;577:
;578:		G_SetOrigin( ent, v );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 579
;579:	}
LABELV $221
line 581
;580:
;581:	VectorCopy( ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 582
;582:}
LABELV $220
endproc Weapon_HookThink 36 8
export Weapon_LightningFire
proc Weapon_LightningFire 120 32
line 592
;583:
;584:/*
;585:======================================================================
;586:
;587:LIGHTNING GUN
;588:
;589:======================================================================
;590:*/
;591:
;592:void Weapon_LightningFire( gentity_t *ent ) {
line 601
;593:	trace_t		tr;
;594:	vec3_t		end;
;595:#ifdef MISSIONPACK
;596:	vec3_t impactpoint, bouncedir;
;597:#endif
;598:	gentity_t	*traceEnt, *tent;
;599:	int			damage, i, passent;
;600:
;601:	damage = 8 * s_quadFactor;
ADDRLP4 84
CNSTF4 1090519040
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 603
;602:
;603:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 604
;604:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $226
line 605
;605:		VectorMA( muzzle, LIGHTNING_RANGE, forward, end );
ADDRLP4 88
CNSTF4 1145044992
ASGNF4
ADDRLP4 60
ADDRGP4 muzzle
INDIRF4
ADDRLP4 88
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 88
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 1145044992
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 607
;606:
;607:		trap_Trace( &tr, muzzle, NULL, NULL, end, passent, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 92
CNSTP4 0
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 621
;608:
;609:#ifdef MISSIONPACK
;610:		// if not the first trace (the lightning bounced of an invulnerability sphere)
;611:		if (i) {
;612:			// add bounced off lightning bolt temp entity
;613:			// the first lightning bolt is a cgame only visual
;614:			//
;615:			tent = G_TempEntity( muzzle, EV_LIGHTNINGBOLT );
;616:			VectorCopy( tr.endpos, end );
;617:			SnapVector( end );
;618:			VectorCopy( end, tent->s.origin2 );
;619:		}
;620:#endif
;621:		if ( tr.entityNum == ENTITYNUM_NONE ) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
NEI4 $236
line 622
;622:			return;
ADDRGP4 $225
JUMPV
LABELV $236
line 625
;623:		}
;624:
;625:		traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 56
CNSTI4 808
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 627
;626:
;627:		if ( traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $240
line 649
;628:#ifdef MISSIONPACK
;629:			if ( traceEnt->client && traceEnt->client->invulnerabilityTime > level.time ) {
;630:				if (G_InvulnerabilityEffect( traceEnt, forward, tr.endpos, impactpoint, bouncedir )) {
;631:					G_BounceProjectile( muzzle, impactpoint, bouncedir, end );
;632:					VectorCopy( impactpoint, muzzle );
;633:					VectorSubtract( end, impactpoint, forward );
;634:					VectorNormalize(forward);
;635:					// the player can hit him/herself with the bounced lightning
;636:					passent = ENTITYNUM_NONE;
;637:				}
;638:				else {
;639:					VectorCopy( tr.endpos, muzzle );
;640:					passent = traceEnt->s.number;
;641:				}
;642:				continue;
;643:			}
;644:			else {
;645:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
;646:					damage, 0, MOD_LIGHTNING);
;647:			}
;648:#else
;649:				G_Damage( traceEnt, ent, ent, forward, tr.endpos,
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 84
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 652
;650:					damage, 0, MOD_LIGHTNING);
;651:#endif
;652:		}
LABELV $240
line 654
;653:
;654:		if ( traceEnt->takedamage && traceEnt->client ) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $243
ADDRLP4 56
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $243
line 655
;655:			tent = G_TempEntity( tr.endpos, EV_MISSILE_HIT );
ADDRLP4 0+12
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 100
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 100
INDIRP4
ASGNP4
line 656
;656:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 657
;657:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 104
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 658
;658:			tent->s.weapon = ent->s.weapon;
ADDRLP4 108
CNSTI4 192
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 659
;659:			if( LogAccuracyHit( traceEnt, ent ) ) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $228
line 660
;660:				ent->client->accuracy_hits++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 661
;661:			}
line 662
;662:		} else if ( !( tr.surfaceFlags & SURF_NOIMPACT ) ) {
ADDRGP4 $228
JUMPV
LABELV $243
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $228
line 663
;663:			tent = G_TempEntity( tr.endpos, EV_MISSILE_MISS );
ADDRLP4 0+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 100
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 100
INDIRP4
ASGNP4
line 664
;664:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 0+24
ARGP4
ADDRLP4 104
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 665
;665:		}
line 667
;666:
;667:		break;
ADDRGP4 $228
JUMPV
LABELV $227
line 604
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $226
LABELV $228
line 669
;668:	}
;669:}
LABELV $225
endproc Weapon_LightningFire 120 32
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 726
;670:
;671:#ifdef MISSIONPACK
;672:/*
;673:======================================================================
;674:
;675:NAILGUN
;676:
;677:======================================================================
;678:*/
;679:
;680:void Weapon_Nailgun_Fire (gentity_t *ent) {
;681:	gentity_t	*m;
;682:	int			count;
;683:
;684:	for( count = 0; count < NUM_NAILSHOTS; count++ ) {
;685:		m = fire_nail (ent, muzzle, forward, right, up );
;686:		m->damage *= s_quadFactor;
;687:		m->splashDamage *= s_quadFactor;
;688:	}
;689:
;690://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;691:}
;692:
;693:
;694:/*
;695:======================================================================
;696:
;697:PROXIMITY MINE LAUNCHER
;698:
;699:======================================================================
;700:*/
;701:
;702:void weapon_proxlauncher_fire (gentity_t *ent) {
;703:	gentity_t	*m;
;704:
;705:	// extra vertical velocity
;706:	forward[2] += 0.2f;
;707:	VectorNormalize( forward );
;708:
;709:	m = fire_prox (ent, muzzle, forward);
;710:	m->damage *= s_quadFactor;
;711:	m->splashDamage *= s_quadFactor;
;712:
;713://	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;714:}
;715:
;716:#endif
;717:
;718://======================================================================
;719:
;720:
;721:/*
;722:===============
;723:LogAccuracyHit
;724:===============
;725:*/
;726:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 727
;727:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $255
line 728
;728:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $254
JUMPV
LABELV $255
line 731
;729:	}
;730:
;731:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $257
line 732
;732:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $254
JUMPV
LABELV $257
line 735
;733:	}
;734:
;735:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $259
line 736
;736:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $254
JUMPV
LABELV $259
line 739
;737:	}
;738:
;739:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $261
line 740
;740:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $254
JUMPV
LABELV $261
line 743
;741:	}
;742:
;743:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $263
line 744
;744:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $254
JUMPV
LABELV $263
line 747
;745:	}
;746:
;747:	if ( OnSameTeam( target, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $265
line 748
;748:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $254
JUMPV
LABELV $265
line 751
;749:	}
;750:
;751:	return qtrue;
CNSTI4 1
RETI4
LABELV $254
endproc LogAccuracyHit 4 8
export CalcMuzzlePoint
proc CalcMuzzlePoint 36 0
line 762
;752:}
;753:
;754:
;755:/*
;756:===============
;757:CalcMuzzlePoint
;758:
;759:set muzzle location relative to pivoting eye
;760:===============
;761:*/
;762:void CalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 763
;763:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 764
;764:	muzzlePoint[2] += ent->client->ps.viewheight;
ADDRLP4 0
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 765
;765:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
ADDRLP4 4
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
ADDRFP4 16
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 20
ADDRFP4 16
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 767
;766:	// snap to integer coordinates for more efficient network bandwidth usage
;767:	SnapVector( muzzlePoint );
ADDRLP4 24
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 32
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 768
;768:}
LABELV $267
endproc CalcMuzzlePoint 36 0
export CalcMuzzlePointOrigin
proc CalcMuzzlePointOrigin 36 0
line 777
;769:
;770:/*
;771:===============
;772:CalcMuzzlePointOrigin
;773:
;774:set muzzle location relative to pivoting eye
;775:===============
;776:*/
;777:void CalcMuzzlePointOrigin ( gentity_t *ent, vec3_t origin, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 778
;778:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 779
;779:	muzzlePoint[2] += ent->client->ps.viewheight;
ADDRLP4 0
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 780
;780:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
ADDRLP4 4
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
ADDRFP4 20
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 20
ADDRFP4 20
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 782
;781:	// snap to integer coordinates for more efficient network bandwidth usage
;782:	SnapVector( muzzlePoint );
ADDRLP4 24
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 32
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 783
;783:}
LABELV $268
endproc CalcMuzzlePointOrigin 36 0
export FireWeapon
proc FireWeapon 16 24
line 792
;784:
;785:
;786:
;787:/*
;788:===============
;789:FireWeapon
;790:===============
;791:*/
;792:void FireWeapon( gentity_t *ent ) {
line 793
;793:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $270
line 794
;794:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 795
;795:	} else {
ADDRGP4 $271
JUMPV
LABELV $270
line 796
;796:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 797
;797:	}
LABELV $271
line 805
;798:#ifdef MISSIONPACK
;799:	if( ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER ) {
;800:		s_quadFactor *= 2;
;801:	}
;802:#endif
;803:
;804:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;805:	if( ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $273
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $273
line 813
;806:#ifdef MISSIONPACK
;807:		if( ent->s.weapon == WP_NAILGUN ) {
;808:			ent->client->accuracy_shots += NUM_NAILSHOTS;
;809:		} else {
;810:			ent->client->accuracy_shots++;
;811:		}
;812:#else
;813:		ent->client->accuracy_shots++;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 712
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 815
;814:#endif
;815:	}
LABELV $273
line 818
;816:
;817:	// set aiming directions
;818:	AngleVectors (ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 820
;819:
;820:	CalcMuzzlePointOrigin ( ent, ent->client->oldOrigin, forward, right, up, muzzle );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 668
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePointOrigin
CALLV
pop
line 823
;821:
;822:	// fire the specific weapon
;823:	switch( ent->s.weapon ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $276
ADDRLP4 8
INDIRI4
CNSTI4 10
GTI4 $276
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $291-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $291
address $278
address $281
address $280
address $285
address $286
address $279
address $288
address $287
address $289
address $290
code
LABELV $278
line 825
;824:	case WP_GAUNTLET:
;825:		Weapon_Gauntlet( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 826
;826:		break;
ADDRGP4 $276
JUMPV
LABELV $279
line 828
;827:	case WP_LIGHTNING:
;828:		Weapon_LightningFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_LightningFire
CALLV
pop
line 829
;829:		break;
ADDRGP4 $276
JUMPV
LABELV $280
line 831
;830:	case WP_SHOTGUN:
;831:		weapon_supershotgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 832
;832:		break;
ADDRGP4 $276
JUMPV
LABELV $281
line 834
;833:	case WP_MACHINEGUN:
;834:		if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $282
line 835
;835:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1128792064
ARGF4
CNSTI4 7
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 836
;836:		} else {
ADDRGP4 $276
JUMPV
LABELV $282
line 837
;837:			Bullet_Fire( ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1128792064
ARGF4
CNSTI4 5
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 838
;838:		}
line 839
;839:		break;
ADDRGP4 $276
JUMPV
LABELV $285
line 841
;840:	case WP_GRENADE_LAUNCHER:
;841:		weapon_grenadelauncher_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_grenadelauncher_fire
CALLV
pop
line 842
;842:		break;
ADDRGP4 $276
JUMPV
LABELV $286
line 844
;843:	case WP_ROCKET_LAUNCHER:
;844:		Weapon_RocketLauncher_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_Fire
CALLV
pop
line 845
;845:		break;
ADDRGP4 $276
JUMPV
LABELV $287
line 847
;846:	case WP_PLASMAGUN:
;847:		Weapon_Plasmagun_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 848
;848:		break;
ADDRGP4 $276
JUMPV
LABELV $288
line 850
;849:	case WP_RAILGUN:
;850:		weapon_railgun_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_railgun_fire
CALLV
pop
line 851
;851:		break;
ADDRGP4 $276
JUMPV
LABELV $289
line 853
;852:	case WP_BFG:
;853:		BFG_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BFG_Fire
CALLV
pop
line 854
;854:		break;
ADDRGP4 $276
JUMPV
LABELV $290
line 856
;855:	case WP_GRAPPLING_HOOK:
;856:		Weapon_GrapplingHook_Fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 857
;857:		break;
line 871
;858:#ifdef MISSIONPACK
;859:	case WP_NAILGUN:
;860:		Weapon_Nailgun_Fire( ent );
;861:		break;
;862:	case WP_PROX_LAUNCHER:
;863:		weapon_proxlauncher_fire( ent );
;864:		break;
;865:	case WP_CHAINGUN:
;866:		Bullet_Fire( ent, CHAINGUN_SPREAD, MACHINEGUN_DAMAGE );
;867:		break;
;868:#endif
;869:	default:
;870:// FIXME		G_Error( "Bad ent->s.weapon" );
;871:		break;
LABELV $276
line 873
;872:	}
;873:}
LABELV $269
endproc FireWeapon 16 24
export Info_Gen
proc Info_Gen 12 4
line 1134
;874:
;875:
;876:#ifdef MISSIONPACK
;877:
;878:/*
;879:===============
;880:KamikazeRadiusDamage
;881:===============
;882:*/
;883:static void KamikazeRadiusDamage( vec3_t origin, gentity_t *attacker, float damage, float radius ) {
;884:	float		dist;
;885:	gentity_t	*ent;
;886:	int			entityList[MAX_GENTITIES];
;887:	int			numListedEntities;
;888:	vec3_t		mins, maxs;
;889:	vec3_t		v;
;890:	vec3_t		dir;
;891:	int			i, e;
;892:
;893:	if ( radius < 1 ) {
;894:		radius = 1;
;895:	}
;896:
;897:	for ( i = 0 ; i < 3 ; i++ ) {
;898:		mins[i] = origin[i] - radius;
;899:		maxs[i] = origin[i] + radius;
;900:	}
;901:
;902:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
;903:
;904:	for ( e = 0 ; e < numListedEntities ; e++ ) {
;905:		ent = &g_entities[entityList[ e ]];
;906:
;907:		if (!ent->takedamage) {
;908:			continue;
;909:		}
;910:
;911:		// dont hit things we have already hit
;912:		if( ent->kamikazeTime > level.time ) {
;913:			continue;
;914:		}
;915:
;916:		// find the distance from the edge of the bounding box
;917:		for ( i = 0 ; i < 3 ; i++ ) {
;918:			if ( origin[i] < ent->r.absmin[i] ) {
;919:				v[i] = ent->r.absmin[i] - origin[i];
;920:			} else if ( origin[i] > ent->r.absmax[i] ) {
;921:				v[i] = origin[i] - ent->r.absmax[i];
;922:			} else {
;923:				v[i] = 0;
;924:			}
;925:		}
;926:
;927:		dist = VectorLength( v );
;928:		if ( dist >= radius ) {
;929:			continue;
;930:		}
;931:
;932://		if( CanDamage (ent, origin) ) {
;933:			VectorSubtract (ent->r.currentOrigin, origin, dir);
;934:			// push the center of mass higher than the origin so players
;935:			// get knocked into the air more
;936:			dir[2] += 24;
;937:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
;938:			ent->kamikazeTime = level.time + 3000;
;939://		}
;940:	}
;941:}
;942:
;943:/*
;944:===============
;945:KamikazeShockWave
;946:===============
;947:*/
;948:static void KamikazeShockWave( vec3_t origin, gentity_t *attacker, float damage, float push, float radius ) {
;949:	float		dist;
;950:	gentity_t	*ent;
;951:	int			entityList[MAX_GENTITIES];
;952:	int			numListedEntities;
;953:	vec3_t		mins, maxs;
;954:	vec3_t		v;
;955:	vec3_t		dir;
;956:	int			i, e;
;957:
;958:	if ( radius < 1 )
;959:		radius = 1;
;960:
;961:	for ( i = 0 ; i < 3 ; i++ ) {
;962:		mins[i] = origin[i] - radius;
;963:		maxs[i] = origin[i] + radius;
;964:	}
;965:
;966:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
;967:
;968:	for ( e = 0 ; e < numListedEntities ; e++ ) {
;969:		ent = &g_entities[entityList[ e ]];
;970:
;971:		// dont hit things we have already hit
;972:		if( ent->kamikazeShockTime > level.time ) {
;973:			continue;
;974:		}
;975:
;976:		// find the distance from the edge of the bounding box
;977:		for ( i = 0 ; i < 3 ; i++ ) {
;978:			if ( origin[i] < ent->r.absmin[i] ) {
;979:				v[i] = ent->r.absmin[i] - origin[i];
;980:			} else if ( origin[i] > ent->r.absmax[i] ) {
;981:				v[i] = origin[i] - ent->r.absmax[i];
;982:			} else {
;983:				v[i] = 0;
;984:			}
;985:		}
;986:
;987:		dist = VectorLength( v );
;988:		if ( dist >= radius ) {
;989:			continue;
;990:		}
;991:
;992://		if( CanDamage (ent, origin) ) {
;993:			VectorSubtract (ent->r.currentOrigin, origin, dir);
;994:			dir[2] += 24;
;995:			G_Damage( ent, NULL, attacker, dir, origin, damage, DAMAGE_RADIUS|DAMAGE_NO_TEAM_PROTECTION, MOD_KAMIKAZE );
;996:			//
;997:			dir[2] = 0;
;998:			VectorNormalize(dir);
;999:			if ( ent->client ) {
;1000:				ent->client->ps.velocity[0] = dir[0] * push;
;1001:				ent->client->ps.velocity[1] = dir[1] * push;
;1002:				ent->client->ps.velocity[2] = 100;
;1003:			}
;1004:			ent->kamikazeShockTime = level.time + 3000;
;1005://		}
;1006:	}
;1007:}
;1008:
;1009:/*
;1010:===============
;1011:KamikazeDamage
;1012:===============
;1013:*/
;1014:static void KamikazeDamage( gentity_t *self ) {
;1015:	int i;
;1016:	float t;
;1017:	gentity_t *ent;
;1018:	vec3_t newangles;
;1019:
;1020:	self->count += 100;
;1021:
;1022:	if (self->count >= KAMI_SHOCKWAVE_STARTTIME) {
;1023:		// shockwave push back
;1024:		t = self->count - KAMI_SHOCKWAVE_STARTTIME;
;1025:		KamikazeShockWave(self->s.pos.trBase, self->activator, 25, 400,	(int) (float) t * KAMI_SHOCKWAVE_MAXRADIUS / (KAMI_SHOCKWAVE_ENDTIME - KAMI_SHOCKWAVE_STARTTIME) );
;1026:	}
;1027:	//
;1028:	if (self->count >= KAMI_EXPLODE_STARTTIME) {
;1029:		// do our damage
;1030:		t = self->count - KAMI_EXPLODE_STARTTIME;
;1031:		KamikazeRadiusDamage( self->s.pos.trBase, self->activator, 400,	(int) (float) t * KAMI_BOOMSPHERE_MAXRADIUS / (KAMI_IMPLODE_STARTTIME - KAMI_EXPLODE_STARTTIME) );
;1032:	}
;1033:
;1034:	// either cycle or kill self
;1035:	if( self->count >= KAMI_SHOCKWAVE_ENDTIME ) {
;1036:		G_FreeEntity( self );
;1037:		return;
;1038:	}
;1039:	self->nextthink = level.time + 100;
;1040:
;1041:	// add earth quake effect
;1042:	newangles[0] = crandom() * 2;
;1043:	newangles[1] = crandom() * 2;
;1044:	newangles[2] = 0;
;1045:	for (i = 0; i < MAX_CLIENTS; i++)
;1046:	{
;1047:		ent = &g_entities[i];
;1048:		if (!ent->inuse)
;1049:			continue;
;1050:		if (!ent->client)
;1051:			continue;
;1052:
;1053:		if (ent->client->ps.groundEntityNum != ENTITYNUM_NONE) {
;1054:			ent->client->ps.velocity[0] += crandom() * 120;
;1055:			ent->client->ps.velocity[1] += crandom() * 120;
;1056:			ent->client->ps.velocity[2] = 30 + random() * 25;
;1057:		}
;1058:
;1059:		ent->client->ps.delta_angles[0] += ANGLE2SHORT(newangles[0] - self->movedir[0]);
;1060:		ent->client->ps.delta_angles[1] += ANGLE2SHORT(newangles[1] - self->movedir[1]);
;1061:		ent->client->ps.delta_angles[2] += ANGLE2SHORT(newangles[2] - self->movedir[2]);
;1062:	}
;1063:	VectorCopy(newangles, self->movedir);
;1064:}
;1065:
;1066:/*
;1067:===============
;1068:G_StartKamikaze
;1069:===============
;1070:*/
;1071:void G_StartKamikaze( gentity_t *ent ) {
;1072:	gentity_t	*explosion;
;1073:	gentity_t	*te;
;1074:	vec3_t		snapped;
;1075:
;1076:	// start up the explosion logic
;1077:	explosion = G_Spawn();
;1078:
;1079:	explosion->s.eType = ET_EVENTS + EV_KAMIKAZE;
;1080:	explosion->eventTime = level.time;
;1081:
;1082:	if ( ent->client ) {
;1083:		VectorCopy( ent->s.pos.trBase, snapped );
;1084:	}
;1085:	else {
;1086:		VectorCopy( ent->activator->s.pos.trBase, snapped );
;1087:	}
;1088:	SnapVector( snapped );		// save network bandwidth
;1089:	G_SetOrigin( explosion, snapped );
;1090:
;1091:	explosion->classname = "kamikaze";
;1092:	explosion->s.pos.trType = TR_STATIONARY;
;1093:
;1094:	explosion->kamikazeTime = level.time;
;1095:
;1096:	explosion->think = KamikazeDamage;
;1097:	explosion->nextthink = level.time + 100;
;1098:	explosion->count = 0;
;1099:	VectorClear(explosion->movedir);
;1100:
;1101:	trap_LinkEntity( explosion );
;1102:
;1103:	if (ent->client) {
;1104:		//
;1105:		explosion->activator = ent;
;1106:		//
;1107:		ent->s.eFlags &= ~EF_KAMIKAZE;
;1108:		// nuke the guy that used it
;1109:		G_Damage( ent, ent, ent, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_KAMIKAZE );
;1110:	}
;1111:	else {
;1112:		if ( !strcmp(ent->activator->classname, "bodyque") ) {
;1113:			explosion->activator = &g_entities[ent->activator->r.ownerNum];
;1114:		}
;1115:		else {
;1116:			explosion->activator = ent->activator;
;1117:		}
;1118:	}
;1119:
;1120:	// play global sound at all clients
;1121:	te = G_TempEntity(snapped, EV_GLOBAL_TEAM_SOUND );
;1122:	te->r.svFlags |= SVF_BROADCAST;
;1123:	te->s.eventParm = GTS_KAMIKAZE;
;1124:}
;1125:#endif
;1126:/*
;1127:============
;1128:Info Sight Stuff
;1129:
;1130:	Info Sight / Flash Light Functions
;1131:============
;1132:*/
;1133:
;1134:void Info_Gen( gentity_t *ent, int type )	{
line 1139
;1135:	gentity_t	*las;
;1136:	int oldtype;
;1137:
;1138:	//Get rid of you?
;1139:	if ( ent->client->infosight) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 764
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $294
line 1140
;1140:		  oldtype = ent->client->infosight->s.eventParm;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 764
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1141
;1141:		  G_FreeEntity( ent->client->infosight );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 764
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1142
;1142:		  ent->client->infosight = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 764
ADDP4
CNSTP4 0
ASGNP4
line 1143
;1143:		  if (oldtype == type)
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $296
line 1144
;1144:			  return;
ADDRGP4 $293
JUMPV
LABELV $296
line 1145
;1145:	}
LABELV $294
line 1147
;1146:
;1147:	las = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1149
;1148:
;1149:	las->nextthink = level.time + 10;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1150
;1150:	las->think = Info_Think;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Info_Think
ASGNP4
line 1151
;1151:	las->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1152
;1152:	las->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1153
;1153:	las->s.eType = ET_INFO;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 1156
;1154:
;1155:	//Lets tell it if flashlight or info
;1156:	if (type == 2)	{
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $299
line 1157
;1157:		las->s.eventParm = 2; //tells CG that it is a flashlight
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 2
ASGNI4
line 1158
;1158:		las->classname = "flashlight";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $301
ASGNP4
line 1159
;1159:	}
ADDRGP4 $300
JUMPV
LABELV $299
line 1160
;1160:	else {
line 1161
;1161:		las->s.eventParm = 1; //tells CG that it is a info sight
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 1
ASGNI4
line 1162
;1162:		las->classname = "infosight";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $302
ASGNP4
line 1163
;1163:	}
LABELV $300
line 1165
;1164:
;1165:	ent->client->infosight = las;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 764
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1166
;1166:}
LABELV $293
endproc Info_Gen 12 4
export Info_Think
proc Info_Think 116 28
line 1168
;1167:
;1168:void Info_Think( gentity_t *self )	{
line 1173
;1169:	vec3_t		end, start, forward, up;
;1170:	trace_t		tr;
;1171:
;1172:	//If Player Dies, You Die -> now thanks to Camouflage!
;1173:	if (self->parent->client->ps.pm_type == PM_DEAD)  {
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $304
line 1174
;1174:		G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1175
;1175:		return;
ADDRGP4 $303
JUMPV
LABELV $304
line 1179
;1176:	}
;1177:
;1178:	//Set Aiming Directions
;1179:	AngleVectors(self->parent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRGP4 right
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1180
;1180:	CalcMuzzlePoint(self->parent, forward, right, up, start);
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
ADDRGP4 right
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1181
;1181:	VectorMA (start, 8192, forward, end);
ADDRLP4 104
CNSTF4 1174405120
ASGNF4
ADDRLP4 80
ADDRLP4 68
INDIRF4
ADDRLP4 104
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 68+4
INDIRF4
ADDRLP4 104
INDIRF4
ADDRLP4 56+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80+8
ADDRLP4 68+8
INDIRF4
CNSTF4 1174405120
ADDRLP4 56+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1184
;1182:
;1183:	//Trace Position
;1184:	trap_Trace (&tr, start, NULL, NULL, end, self->parent->s.number, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 108
CNSTP4 0
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1187
;1185:
;1186:	//Did you not hit anything?
;1187:	if (tr.surfaceFlags & SURF_NOIMPACT || tr.surfaceFlags & SURF_SKY)	{
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 112
INDIRI4
NEI4 $316
ADDRLP4 0+44
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 112
INDIRI4
EQI4 $312
LABELV $316
line 1188
;1188:		self->nextthink = level.time + 10;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1189
;1189:		trap_UnlinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1190
;1190:		return;
ADDRGP4 $303
JUMPV
LABELV $312
line 1194
;1191:	}
;1192:
;1193:	//Move you forward to keep you visible
;1194:	if (tr.fraction != 1)	VectorMA(tr.endpos,-4,forward,tr.endpos);
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $318
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
CNSTF4 3229614080
ADDRLP4 56
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+4
ADDRLP4 0+12+4
INDIRF4
CNSTF4 3229614080
ADDRLP4 56+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+8
ADDRLP4 0+12+8
INDIRF4
CNSTF4 3229614080
ADDRLP4 56+8
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $318
line 1197
;1195:
;1196:	//Set Your position
;1197:	VectorCopy( tr.endpos, self->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1198
;1198:	VectorCopy( tr.endpos, self->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1200
;1199:
;1200:	vectoangles(tr.plane.normal, self->s.angles);
ADDRLP4 0+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1202
;1201:
;1202:	trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1205
;1203:
;1204:	//Prep next move
;1205:	self->nextthink = level.time + 10;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1206
;1206:}
LABELV $303
endproc Info_Think 116 28
export Laser_Gen
proc Laser_Gen 12 4
line 1215
;1207:/*
;1208:============
;1209:Laser Sight Stuff
;1210:
;1211:	Laser Sight Functions
;1212:============
;1213:*/
;1214:
;1215:void Laser_Gen( gentity_t *ent, int type )	{
line 1220
;1216:	gentity_t	*las;
;1217:	int oldtype;
;1218:
;1219:	//Get rid of you?
;1220:	if ( ent->client->lasersight) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $338
line 1221
;1221:		  oldtype = ent->client->lasersight->s.eventParm;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1222
;1222:		  G_FreeEntity( ent->client->lasersight );
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1223
;1223:		  ent->client->lasersight = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
CNSTP4 0
ASGNP4
line 1224
;1224:		  if (oldtype == type)
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $340
line 1225
;1225:			  return;
ADDRGP4 $337
JUMPV
LABELV $340
line 1226
;1226:	}
LABELV $338
line 1228
;1227:
;1228:	las = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1230
;1229:
;1230:	las->nextthink = level.time + 10;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1231
;1231:	las->think = Laser_Think;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Laser_Think
ASGNP4
line 1232
;1232:	las->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1233
;1233:	las->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1234
;1234:	las->s.eType = ET_LASER;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 1237
;1235:
;1236:	//Lets tell it if flashlight or laser
;1237:	if (type == 1)	{
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $343
line 1238
;1238:		las->s.eventParm = 1; //tells CG that it is a lasersight
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 1
ASGNI4
line 1239
;1239:		las->classname = "lasersight";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $345
ASGNP4
line 1240
;1240:	}
LABELV $343
line 1242
;1241:
;1242:	ent->client->lasersight = las;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1243
;1243:}
LABELV $337
endproc Laser_Gen 12 4
export Laser_Think
proc Laser_Think 116 28
line 1245
;1244:
;1245:void Laser_Think( gentity_t *self )	{
line 1250
;1246:	vec3_t		end, start, forward, up;
;1247:	trace_t		tr;
;1248:
;1249:	//If Player Dies, You Die -> now thanks to Camouflage!
;1250:	if (self->parent->client->ps.pm_type == PM_DEAD)  {
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $347
line 1251
;1251:		G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1252
;1252:		return;
ADDRGP4 $346
JUMPV
LABELV $347
line 1256
;1253:	}
;1254:
;1255:	//Set Aiming Directions
;1256:	AngleVectors(self->parent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRGP4 right
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1257
;1257:	CalcMuzzlePoint(self->parent, forward, right, up, start);
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ARGP4
ADDRGP4 right
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 1258
;1258:	VectorMA (start, 8192, forward, end);
ADDRLP4 104
CNSTF4 1174405120
ASGNF4
ADDRLP4 80
ADDRLP4 68
INDIRF4
ADDRLP4 104
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 68+4
INDIRF4
ADDRLP4 104
INDIRF4
ADDRLP4 56+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80+8
ADDRLP4 68+8
INDIRF4
CNSTF4 1174405120
ADDRLP4 56+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1261
;1259:
;1260:	//Trace Position
;1261:	trap_Trace (&tr, start, NULL, NULL, end, self->parent->s.number, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 108
CNSTP4 0
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1264
;1262:
;1263:	//Did you not hit anything?
;1264:	if (tr.surfaceFlags & SURF_NOIMPACT || tr.surfaceFlags & SURF_SKY)	{
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 112
INDIRI4
NEI4 $359
ADDRLP4 0+44
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 112
INDIRI4
EQI4 $355
LABELV $359
line 1265
;1265:		self->nextthink = level.time + 10;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1266
;1266:		trap_UnlinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1267
;1267:		return;
ADDRGP4 $346
JUMPV
LABELV $355
line 1271
;1268:	}
;1269:
;1270:	//Move you forward to keep you visible
;1271:	if (tr.fraction != 1)	VectorMA(tr.endpos,-4,forward,tr.endpos);
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $361
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
CNSTF4 3229614080
ADDRLP4 56
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+4
ADDRLP4 0+12+4
INDIRF4
CNSTF4 3229614080
ADDRLP4 56+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+8
ADDRLP4 0+12+8
INDIRF4
CNSTF4 3229614080
ADDRLP4 56+8
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $361
line 1274
;1272:
;1273:	//Set Your position
;1274:	VectorCopy( tr.endpos, self->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1275
;1275:	VectorCopy( tr.endpos, self->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1277
;1276:
;1277:	vectoangles(tr.plane.normal, self->s.angles);
ADDRLP4 0+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1279
;1278:
;1279:	trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1282
;1280:
;1281:	//Prep next move
;1282:	self->nextthink = level.time + 10;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 1283
;1283:}
LABELV $346
endproc Laser_Think 116 28
bss
align 4
LABELV muzzle
skip 12
align 4
LABELV up
skip 12
align 4
LABELV right
skip 12
align 4
LABELV forward
skip 12
align 4
LABELV s_quadFactor
skip 4
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
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
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
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
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
LABELV $345
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $302
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $301
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
