data
export bg_itemlist
align 4
LABELV bg_itemlist
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $40
address $40
address $41
address $42
address $43
address $44
byte 4 0
byte 4 0
address $45
address $46
byte 4 5
byte 4 3
byte 4 0
address $40
address $40
address $47
address $48
address $49
byte 4 0
byte 4 0
byte 4 0
address $50
address $51
byte 4 50
byte 4 3
byte 4 0
address $40
address $40
address $52
address $48
address $53
byte 4 0
byte 4 0
byte 4 0
address $54
address $55
byte 4 100
byte 4 3
byte 4 0
address $40
address $40
address $56
address $57
address $58
address $59
byte 4 0
byte 4 0
address $60
address $61
byte 4 5
byte 4 4
byte 4 0
address $40
address $40
address $62
address $63
address $64
address $65
byte 4 0
byte 4 0
address $66
address $67
byte 4 25
byte 4 4
byte 4 0
address $40
address $40
address $68
address $69
address $70
address $71
byte 4 0
byte 4 0
address $72
address $73
byte 4 50
byte 4 4
byte 4 0
address $40
address $40
address $74
address $75
address $76
address $77
byte 4 0
byte 4 0
address $78
address $79
byte 4 100
byte 4 4
byte 4 0
address $40
address $40
address $80
address $81
address $82
byte 4 0
byte 4 0
byte 4 0
address $83
address $84
byte 4 0
byte 4 1
byte 4 1
address $40
address $40
address $85
address $86
address $87
byte 4 0
byte 4 0
byte 4 0
address $88
address $89
byte 4 60
byte 4 6
byte 4 1
address $40
skip 4
address $90
address $86
address $91
address $92
byte 4 0
byte 4 0
address $93
address $94
byte 4 60
byte 4 6
byte 4 2
address $40
address $95
address $96
address $97
address $98
address $99
byte 4 0
byte 4 0
address $100
address $101
byte 4 30
byte 4 5
byte 4 1
address $40
address $102
address $103
address $104
address $105
address $106
byte 4 0
byte 4 0
address $107
address $108
byte 4 30
byte 4 5
byte 4 2
address $40
address $109
address $110
address $111
address $112
address $113
byte 4 0
byte 4 0
address $114
address $115
byte 4 30
byte 4 5
byte 4 3
address $40
address $40
address $116
address $117
address $118
address $119
byte 4 0
byte 4 0
address $120
address $121
byte 4 30
byte 4 5
byte 4 4
address $40
address $40
address $122
address $123
address $124
address $125
byte 4 0
byte 4 0
address $126
address $127
byte 4 30
byte 4 5
byte 4 5
address $40
address $128
address $129
address $130
address $131
address $132
byte 4 0
byte 4 0
address $133
address $134
byte 4 60
byte 4 5
byte 4 6
address $40
address $130
address $135
byte 4 0
address $136
byte 4 0
byte 4 0
byte 4 0
address $137
address $138
byte 4 0
byte 4 8
byte 4 7
address $40
address $40
address $139
byte 4 0
address $140
byte 4 0
byte 4 0
byte 4 0
address $141
address $142
byte 4 0
byte 4 8
byte 4 8
address $40
address $40
byte 4 0
skip 48
export bg_numItems
align 4
LABELV bg_numItems
byte 4 19
export BG_FindItemForPowerup
code
proc BG_FindItemForPowerup 8 0
file "../bg_misc.c"
line 637
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_misc.c -- both games misc functions, all completely stateless
;4:
;5:#include "q_shared.h"
;6:#include "bg_public.h"
;7:
;8:/*QUAKED item_***** ( 0 0 0 ) (-16 -16 -16) (16 16 16) suspended
;9:DO NOT USE THIS CLASS, IT JUST HOLDS GENERAL INFORMATION.
;10:The suspended flag will allow items to hang in the air, otherwise they are dropped to the next surface.
;11:
;12:If an item is the target of another entity, it will not spawn in until fired.
;13:
;14:An item fires all of its targets when it is picked up.  If the toucher can't carry it, the targets won't be fired.
;15:
;16:"notfree" if set to 1, don't spawn in free for all games
;17:"notteam" if set to 1, don't spawn in team games
;18:"notsingle" if set to 1, don't spawn in single player games
;19:"wait"	override the default wait before respawning.  -1 = never respawn automatically, which can be used with targeted spawning.
;20:"random" random number of plus or minus seconds varied from the respawn time
;21:"count" override quantity or duration on most items.
;22:*/
;23:
;24:gitem_t	bg_itemlist[] = 
;25:{
;26:	{
;27:		NULL,
;28:		NULL,
;29:		{ NULL,
;30:		NULL,
;31:		0, 0} ,
;32:/* icon */		NULL,
;33:/* pickup */	NULL,
;34:		0,
;35:		0,
;36:		0,
;37:/* precache */ "",
;38:/* sounds */ ""
;39:	},	// leave index 0 alone
;40:
;41:	//
;42:	// ARMOR
;43:	//
;44:
;45:/*QUAKED item_armor_shard (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;46:*/
;47:	{
;48:		"item_armor_shard", 
;49:		"sound/misc/ar1_pkup.wav",
;50:		{ "models/powerups/armor/shard.md3", 
;51:		"models/powerups/armor/shard_sphere.md3",
;52:		0, 0} ,
;53:/* icon */		"icons/iconr_shard",
;54:/* pickup */	"Armor Shard",
;55:		5,
;56:		IT_ARMOR,
;57:		0,
;58:/* precache */ "",
;59:/* sounds */ ""
;60:	},
;61:
;62:/*QUAKED item_armor_combat (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;63:*/
;64:	{
;65:		"item_armor_combat", 
;66:		"sound/misc/ar2_pkup.wav",
;67:        { "models/powerups/armor/armor_yel.md3",
;68:		0, 0, 0},
;69:/* icon */		"icons/iconr_yellow",
;70:/* pickup */	"Armor",
;71:		50,
;72:		IT_ARMOR,
;73:		0,
;74:/* precache */ "",
;75:/* sounds */ ""
;76:	},
;77:
;78:/*QUAKED item_armor_body (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;79:*/
;80:	{
;81:		"item_armor_body", 
;82:		"sound/misc/ar2_pkup.wav",
;83:        { "models/powerups/armor/armor_red.md3",
;84:		0, 0, 0},
;85:/* icon */		"icons/iconr_red",
;86:/* pickup */	"Heavy Armor",
;87:		100,
;88:		IT_ARMOR,
;89:		0,
;90:/* precache */ "",
;91:/* sounds */ ""
;92:	},
;93:
;94:	//
;95:	// health
;96:	//
;97:/*QUAKED item_health_small (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;98:*/
;99:	{
;100:		"item_health_small",
;101:		"sound/items/s_health.wav",
;102:        { "models/powerups/health/small_cross.md3", 
;103:		"models/powerups/health/small_sphere.md3", 
;104:		0, 0 },
;105:/* icon */		"icons/iconh_green",
;106:/* pickup */	"5 Health",
;107:		5,
;108:		IT_HEALTH,
;109:		0,
;110:/* precache */ "",
;111:/* sounds */ ""
;112:	},
;113:
;114:/*QUAKED item_health (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;115:*/
;116:	{
;117:		"item_health",
;118:		"sound/items/n_health.wav",
;119:        { "models/powerups/health/medium_cross.md3", 
;120:		"models/powerups/health/medium_sphere.md3", 
;121:		0, 0 },
;122:/* icon */		"icons/iconh_yellow",
;123:/* pickup */	"25 Health",
;124:		25,
;125:		IT_HEALTH,
;126:		0,
;127:/* precache */ "",
;128:/* sounds */ ""
;129:	},
;130:
;131:/*QUAKED item_health_large (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;132:*/
;133:	{
;134:		"item_health_large",
;135:		"sound/items/l_health.wav",
;136:        { "models/powerups/health/large_cross.md3", 
;137:		"models/powerups/health/large_sphere.md3", 
;138:		0, 0 },
;139:/* icon */		"icons/iconh_red",
;140:/* pickup */	"50 Health",
;141:		50,
;142:		IT_HEALTH,
;143:		0,
;144:/* precache */ "",
;145:/* sounds */ ""
;146:	},
;147:
;148:/*QUAKED item_health_mega (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;149:*/
;150:	{
;151:		"item_health_mega",
;152:		"sound/items/m_health.wav",
;153:        { "models/powerups/health/mega_cross.md3", 
;154:		"models/powerups/health/mega_sphere.md3", 
;155:		0, 0 },
;156:/* icon */		"icons/iconh_mega",
;157:/* pickup */	"Mega Health",
;158:		100,
;159:		IT_HEALTH,
;160:		0,
;161:/* precache */ "",
;162:/* sounds */ ""
;163:	},
;164:
;165:
;166:	//
;167:	// WEAPONS 
;168:	//
;169:
;170:/*QUAKED weapon_hand (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;171:*/
;172:	{
;173:		"weapon_hand",
;174:		"sound/misc/w_pkup.wav",
;175:        { "models/weapons2/hand/hand.md3", 
;176:		0, 0, 0},
;177:/* icon */		"icons/iconw_hand",
;178:/* pickup */	"Hand",
;179:		0,
;180:		IT_WEAPON,
;181:		WP_HAND,
;182:/* precache */ "",
;183:/* sounds */ ""
;184:	},
;185:
;186:	//
;187:	// AMMO ITEMS
;188:	//
;189:	//
;190:	// HOLDABLE ITEMS
;191:	//
;192:/*QUAKED holdable_teleporter (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;193:*/
;194:	{
;195:		"holdable_teleporter", 
;196:		"sound/items/holdable.wav",
;197:        { "models/powerups/holdable/teleporter.md3", 
;198:		0, 0, 0},
;199:/* icon */		"icons/teleporter",
;200:/* pickup */	"Personal Teleporter",
;201:		60,
;202:		IT_HOLDABLE,
;203:		HI_TELEPORTER,
;204:/* sounds */ ""
;205:	},
;206:/*QUAKED holdable_medkit (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;207:*/
;208:	{
;209:		"holdable_medkit", 
;210:		"sound/items/holdable.wav",
;211:        { 
;212:		"models/powerups/holdable/medkit.md3", 
;213:		"models/powerups/holdable/medkit_sphere.md3",
;214:		0, 0},
;215:/* icon */		"icons/medkit",
;216:/* pickup */	"Medkit",
;217:		60,
;218:		IT_HOLDABLE,
;219:		HI_MEDKIT,
;220:/* precache */ "",
;221:/* sounds */ "sound/items/use_medkit.wav"
;222:	},
;223:
;224:	//
;225:	// POWERUP ITEMS
;226:	//
;227:/*QUAKED item_quad (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;228:*/
;229:	{
;230:		"item_quad", 
;231:		"sound/items/quaddamage.wav",
;232:        { "models/powerups/instant/quad.md3", 
;233:        "models/powerups/instant/quad_ring.md3",
;234:		0, 0 },
;235:/* icon */		"icons/quad",
;236:/* pickup */	"Quad Damage",
;237:		30,
;238:		IT_POWERUP,
;239:		PW_QUAD,
;240:/* precache */ "",
;241:/* sounds */ "sound/items/damage2.wav sound/items/damage3.wav"
;242:	},
;243:
;244:/*QUAKED item_enviro (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;245:*/
;246:	{
;247:		"item_enviro",
;248:		"sound/items/protect.wav",
;249:        { "models/powerups/instant/enviro.md3", 
;250:		"models/powerups/instant/enviro_ring.md3", 
;251:		0, 0 },
;252:/* icon */		"icons/envirosuit",
;253:/* pickup */	"Battle Suit",
;254:		30,
;255:		IT_POWERUP,
;256:		PW_BATTLESUIT,
;257:/* precache */ "",
;258:/* sounds */ "sound/items/airout.wav sound/items/protect3.wav"
;259:	},
;260:
;261:/*QUAKED item_haste (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;262:*/
;263:	{
;264:		"item_haste",
;265:		"sound/items/haste.wav",
;266:        { "models/powerups/instant/haste.md3", 
;267:		"models/powerups/instant/haste_ring.md3", 
;268:		0, 0 },
;269:/* icon */		"icons/haste",
;270:/* pickup */	"Speed",
;271:		30,
;272:		IT_POWERUP,
;273:		PW_HASTE,
;274:/* precache */ "",
;275:/* sounds */ ""
;276:	},
;277:
;278:/*QUAKED item_invis (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;279:*/
;280:	{
;281:		"item_invis",
;282:		"sound/items/invisibility.wav",
;283:        { "models/powerups/instant/invis.md3", 
;284:		"models/powerups/instant/invis_ring.md3", 
;285:		0, 0 },
;286:/* icon */		"icons/invis",
;287:/* pickup */	"Invisibility",
;288:		30,
;289:		IT_POWERUP,
;290:		PW_INVIS,
;291:/* precache */ "",
;292:/* sounds */ ""
;293:	},
;294:
;295:/*QUAKED item_regen (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;296:*/
;297:	{
;298:		"item_regen",
;299:		"sound/items/regeneration.wav",
;300:        { "models/powerups/instant/regen.md3", 
;301:		"models/powerups/instant/regen_ring.md3", 
;302:		0, 0 },
;303:/* icon */		"icons/regen",
;304:/* pickup */	"Regeneration",
;305:		30,
;306:		IT_POWERUP,
;307:		PW_REGEN,
;308:/* precache */ "",
;309:/* sounds */ "sound/items/regen.wav"
;310:	},
;311:
;312:/*QUAKED item_flight (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;313:*/
;314:	{
;315:		"item_flight",
;316:		"sound/items/flight.wav",
;317:        { "models/powerups/instant/flight.md3", 
;318:		"models/powerups/instant/flight_ring.md3", 
;319:		0, 0 },
;320:/* icon */		"icons/flight",
;321:/* pickup */	"Flight",
;322:		60,
;323:		IT_POWERUP,
;324:		PW_FLIGHT,
;325:/* precache */ "",
;326:/* sounds */ "sound/items/flight.wav"
;327:	},
;328:
;329:/*QUAKED team_CTF_redflag (1 0 0) (-16 -16 -16) (16 16 16)
;330:Only in CTF games
;331:*/
;332:	{
;333:		"team_CTF_redflag",
;334:		NULL,
;335:        { "models/flags/r_flag.md3",
;336:		0, 0, 0 },
;337:/* icon */		"icons/iconf_red1",
;338:/* pickup */	"Red Flag",
;339:		0,
;340:		IT_TEAM,
;341:		PW_REDFLAG,
;342:/* precache */ "",
;343:/* sounds */ ""
;344:	},
;345:
;346:/*QUAKED team_CTF_blueflag (0 0 1) (-16 -16 -16) (16 16 16)
;347:Only in CTF games
;348:*/
;349:	{
;350:		"team_CTF_blueflag",
;351:		NULL,
;352:        { "models/flags/b_flag.md3",
;353:		0, 0, 0 },
;354:/* icon */		"icons/iconf_blu1",
;355:/* pickup */	"Blue Flag",
;356:		0,
;357:		IT_TEAM,
;358:		PW_BLUEFLAG,
;359:/* precache */ "",
;360:/* sounds */ ""
;361:	},
;362:
;363:#ifdef MISSIONPACK
;364:/*QUAKED holdable_kamikaze (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;365:*/
;366:	{
;367:		"holdable_kamikaze", 
;368:		"sound/items/holdable.wav",
;369:        { "models/powerups/kamikazi.md3", 
;370:		0, 0, 0},
;371:/* icon */		"icons/kamikaze",
;372:/* pickup */	"Kamikaze",
;373:		60,
;374:		IT_HOLDABLE,
;375:		HI_KAMIKAZE,
;376:/* precache */ "",
;377:/* sounds */ "sound/items/kamikazerespawn.wav"
;378:	},
;379:
;380:/*QUAKED holdable_portal (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;381:*/
;382:	{
;383:		"holdable_portal", 
;384:		"sound/items/holdable.wav",
;385:        { "models/powerups/holdable/porter.md3",
;386:		0, 0, 0},
;387:/* icon */		"icons/portal",
;388:/* pickup */	"Portal",
;389:		60,
;390:		IT_HOLDABLE,
;391:		HI_PORTAL,
;392:/* precache */ "",
;393:/* sounds */ ""
;394:	},
;395:
;396:/*QUAKED holdable_invulnerability (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;397:*/
;398:	{
;399:		"holdable_invulnerability", 
;400:		"sound/items/holdable.wav",
;401:        { "models/powerups/holdable/invulnerability.md3", 
;402:		0, 0, 0},
;403:/* icon */		"icons/invulnerability",
;404:/* pickup */	"Invulnerability",
;405:		60,
;406:		IT_HOLDABLE,
;407:		HI_INVULNERABILITY,
;408:/* precache */ "",
;409:/* sounds */ ""
;410:	},
;411:
;412:/*QUAKED ammo_nails (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;413:*/
;414:	{
;415:		"ammo_nails",
;416:		"sound/misc/am_pkup.wav",
;417:        { "models/powerups/ammo/nailgunam.md3", 
;418:		0, 0, 0},
;419:/* icon */		"icons/icona_nailgun",
;420:/* pickup */	"Nails",
;421:		20,
;422:		IT_AMMO,
;423:		WP_NAILGUN,
;424:/* precache */ "",
;425:/* sounds */ ""
;426:	},
;427:
;428:/*QUAKED ammo_mines (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;429:*/
;430:	{
;431:		"ammo_mines",
;432:		"sound/misc/am_pkup.wav",
;433:        { "models/powerups/ammo/proxmineam.md3", 
;434:		0, 0, 0},
;435:/* icon */		"icons/icona_proxlauncher",
;436:/* pickup */	"Proximity Mines",
;437:		10,
;438:		IT_AMMO,
;439:		WP_PROX_LAUNCHER,
;440:/* precache */ "",
;441:/* sounds */ ""
;442:	},
;443:
;444:/*QUAKED ammo_belt (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;445:*/
;446:	{
;447:		"ammo_belt",
;448:		"sound/misc/am_pkup.wav",
;449:        { "models/powerups/ammo/chaingunam.md3", 
;450:		0, 0, 0},
;451:/* icon */		"icons/icona_chaingun",
;452:/* pickup */	"Chaingun Belt",
;453:		100,
;454:		IT_AMMO,
;455:		WP_CHAINGUN,
;456:/* precache */ "",
;457:/* sounds */ ""
;458:	},
;459:
;460:	//
;461:	// PERSISTANT POWERUP ITEMS
;462:	//
;463:/*QUAKED item_scout (.3 .3 1) (-16 -16 -16) (16 16 16) suspended redTeam blueTeam
;464:*/
;465:	{
;466:		"item_scout",
;467:		"sound/items/scout.wav",
;468:        { "models/powerups/scout.md3", 
;469:		0, 0, 0 },
;470:/* icon */		"icons/scout",
;471:/* pickup */	"Scout",
;472:		30,
;473:		IT_PERSISTANT_POWERUP,
;474:		PW_SCOUT,
;475:/* precache */ "",
;476:/* sounds */ ""
;477:	},
;478:
;479:/*QUAKED item_guard (.3 .3 1) (-16 -16 -16) (16 16 16) suspended redTeam blueTeam
;480:*/
;481:	{
;482:		"item_guard",
;483:		"sound/items/guard.wav",
;484:        { "models/powerups/guard.md3", 
;485:		0, 0, 0 },
;486:/* icon */		"icons/guard",
;487:/* pickup */	"Guard",
;488:		30,
;489:		IT_PERSISTANT_POWERUP,
;490:		PW_GUARD,
;491:/* precache */ "",
;492:/* sounds */ ""
;493:	},
;494:
;495:/*QUAKED item_doubler (.3 .3 1) (-16 -16 -16) (16 16 16) suspended redTeam blueTeam
;496:*/
;497:	{
;498:		"item_doubler",
;499:		"sound/items/doubler.wav",
;500:        { "models/powerups/doubler.md3", 
;501:		0, 0, 0 },
;502:/* icon */		"icons/doubler",
;503:/* pickup */	"Doubler",
;504:		30,
;505:		IT_PERSISTANT_POWERUP,
;506:		PW_DOUBLER,
;507:/* precache */ "",
;508:/* sounds */ ""
;509:	},
;510:
;511:/*QUAKED item_doubler (.3 .3 1) (-16 -16 -16) (16 16 16) suspended redTeam blueTeam
;512:*/
;513:	{
;514:		"item_ammoregen",
;515:		"sound/items/ammoregen.wav",
;516:        { "models/powerups/ammo.md3",
;517:		0, 0, 0 },
;518:/* icon */		"icons/ammo_regen",
;519:/* pickup */	"Ammo Regen",
;520:		30,
;521:		IT_PERSISTANT_POWERUP,
;522:		PW_AMMOREGEN,
;523:/* precache */ "",
;524:/* sounds */ ""
;525:	},
;526:
;527:	/*QUAKED team_CTF_neutralflag (0 0 1) (-16 -16 -16) (16 16 16)
;528:Only in One Flag CTF games
;529:*/
;530:	{
;531:		"team_CTF_neutralflag",
;532:		NULL,
;533:        { "models/flags/n_flag.md3",
;534:		0, 0, 0 },
;535:/* icon */		"icons/iconf_neutral1",
;536:/* pickup */	"Neutral Flag",
;537:		0,
;538:		IT_TEAM,
;539:		PW_NEUTRALFLAG,
;540:/* precache */ "",
;541:/* sounds */ ""
;542:	},
;543:
;544:	{
;545:		"item_redcube",
;546:		"sound/misc/am_pkup.wav",
;547:        { "models/powerups/orb/r_orb.md3",
;548:		0, 0, 0 },
;549:/* icon */		"icons/iconh_rorb",
;550:/* pickup */	"Red Cube",
;551:		0,
;552:		IT_TEAM,
;553:		0,
;554:/* precache */ "",
;555:/* sounds */ ""
;556:	},
;557:
;558:	{
;559:		"item_bluecube",
;560:		"sound/misc/am_pkup.wav",
;561:        { "models/powerups/orb/b_orb.md3",
;562:		0, 0, 0 },
;563:/* icon */		"icons/iconh_borb",
;564:/* pickup */	"Blue Cube",
;565:		0,
;566:		IT_TEAM,
;567:		0,
;568:/* precache */ "",
;569:/* sounds */ ""
;570:	},
;571:/*QUAKED weapon_nailgun (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;572:*/
;573:	{
;574:		"weapon_nailgun", 
;575:		"sound/misc/w_pkup.wav",
;576:        { "models/weapons/nailgun/nailgun.md3", 
;577:		0, 0, 0},
;578:/* icon */		"icons/iconw_nailgun",
;579:/* pickup */	"Nailgun",
;580:		10,
;581:		IT_WEAPON,
;582:		WP_NAILGUN,
;583:/* precache */ "",
;584:/* sounds */ ""
;585:	},
;586:
;587:/*QUAKED weapon_prox_launcher (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;588:*/
;589:	{
;590:		"weapon_prox_launcher", 
;591:		"sound/misc/w_pkup.wav",
;592:        { "models/weapons/proxmine/proxmine.md3", 
;593:		0, 0, 0},
;594:/* icon */		"icons/iconw_proxlauncher",
;595:/* pickup */	"Prox Launcher",
;596:		5,
;597:		IT_WEAPON,
;598:		WP_PROX_LAUNCHER,
;599:/* precache */ "",
;600:/* sounds */ "sound/weapons/proxmine/wstbtick.wav "
;601:			"sound/weapons/proxmine/wstbactv.wav "
;602:			"sound/weapons/proxmine/wstbimpl.wav "
;603:			"sound/weapons/proxmine/wstbimpm.wav "
;604:			"sound/weapons/proxmine/wstbimpd.wav "
;605:			"sound/weapons/proxmine/wstbactv.wav"
;606:	},
;607:
;608:/*QUAKED weapon_chaingun (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;609:*/
;610:	{
;611:		"weapon_chaingun", 
;612:		"sound/misc/w_pkup.wav",
;613:        { "models/weapons/vulcan/vulcan.md3", 
;614:		0, 0, 0},
;615:/* icon */		"icons/iconw_chaingun",
;616:/* pickup */	"Chaingun",
;617:		80,
;618:		IT_WEAPON,
;619:		WP_CHAINGUN,
;620:/* precache */ "",
;621:/* sounds */ "sound/weapons/vulcan/wvulwind.wav"
;622:	},
;623:#endif
;624:
;625:	// end of list marker
;626:	{NULL}
;627:};
;628:
;629:int		bg_numItems = sizeof(bg_itemlist) / sizeof(bg_itemlist[0]) - 1;
;630:
;631:
;632:/*
;633:==============
;634:BG_FindItemForPowerup
;635:==============
;636:*/
;637:gitem_t	*BG_FindItemForPowerup( powerup_t pw ) {
line 640
;638:	int		i;
;639:
;640:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $147
JUMPV
LABELV $144
line 641
;641:		if ( (bg_itemlist[i].giType == IT_POWERUP || 
ADDRLP4 4
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 5
EQI4 $155
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 8
EQI4 $155
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $148
LABELV $155
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $148
line 644
;642:					bg_itemlist[i].giType == IT_TEAM ||
;643:					bg_itemlist[i].giType == IT_PERSISTANT_POWERUP) && 
;644:			bg_itemlist[i].giTag == pw ) {
line 645
;645:			return &bg_itemlist[i];
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
RETP4
ADDRGP4 $143
JUMPV
LABELV $148
line 647
;646:		}
;647:	}
LABELV $145
line 640
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $147
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $144
line 649
;648:
;649:	return NULL;
CNSTP4 0
RETP4
LABELV $143
endproc BG_FindItemForPowerup 8 0
export BG_FindItemForHoldable
proc BG_FindItemForHoldable 8 8
line 658
;650:}
;651:
;652:
;653:/*
;654:==============
;655:BG_FindItemForHoldable
;656:==============
;657:*/
;658:gitem_t	*BG_FindItemForHoldable( holdable_t pw ) {
line 661
;659:	int		i;
;660:
;661:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $160
JUMPV
LABELV $157
line 662
;662:		if ( bg_itemlist[i].giType == IT_HOLDABLE && bg_itemlist[i].giTag == pw ) {
ADDRLP4 4
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $161
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $161
line 663
;663:			return &bg_itemlist[i];
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
RETP4
ADDRGP4 $156
JUMPV
LABELV $161
line 665
;664:		}
;665:	}
LABELV $158
line 661
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $160
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $157
line 667
;666:
;667:	Com_Error( ERR_DROP, "HoldableItem not found" );
CNSTI4 1
ARGI4
ADDRGP4 $165
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 669
;668:
;669:	return NULL;
CNSTP4 0
RETP4
LABELV $156
endproc BG_FindItemForHoldable 8 8
export BG_FindItemForWeapon
proc BG_FindItemForWeapon 8 12
line 679
;670:}
;671:
;672:
;673:/*
;674:===============
;675:BG_FindItemForWeapon
;676:
;677:===============
;678:*/
;679:gitem_t	*BG_FindItemForWeapon( weapon_t weapon ) {
line 682
;680:	gitem_t	*it;
;681:	
;682:	for ( it = bg_itemlist + 1 ; it->classname ; it++) {
ADDRLP4 0
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $170
JUMPV
LABELV $167
line 683
;683:		if ( it->giType == IT_WEAPON && it->giTag == weapon ) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $172
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $172
line 684
;684:			return it;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $166
JUMPV
LABELV $172
line 686
;685:		}
;686:	}
LABELV $168
line 682
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $170
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $167
line 688
;687:
;688:	Com_Error( ERR_DROP, "Couldn't find item for weapon %i", weapon);
CNSTI4 1
ARGI4
ADDRGP4 $174
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 689
;689:	return NULL;
CNSTP4 0
RETP4
LABELV $166
endproc BG_FindItemForWeapon 8 12
export BG_FindItem
proc BG_FindItem 8 8
line 698
;690:}
;691:
;692:/*
;693:===============
;694:BG_FindItem
;695:
;696:===============
;697:*/
;698:gitem_t	*BG_FindItem( const char *pickupName ) {
line 701
;699:	gitem_t	*it;
;700:	
;701:	for ( it = bg_itemlist + 1 ; it->classname ; it++ ) {
ADDRLP4 0
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $179
JUMPV
LABELV $176
line 702
;702:		if ( !Q_stricmp( it->pickup_name, pickupName ) )
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $181
line 703
;703:			return it;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $175
JUMPV
LABELV $181
line 704
;704:	}
LABELV $177
line 701
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $179
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $176
line 706
;705:
;706:	return NULL;
CNSTP4 0
RETP4
LABELV $175
endproc BG_FindItem 8 8
export BG_PlayerTouchesItem
proc BG_PlayerTouchesItem 36 12
line 717
;707:}
;708:
;709:/*
;710:============
;711:BG_PlayerTouchesItem
;712:
;713:Items can be picked up without actually touching their physical bounds to make
;714:grabbing them easier
;715:============
;716:*/
;717:qboolean	BG_PlayerTouchesItem( playerState_t *ps, entityState_t *item, int atTime ) {
line 720
;718:	vec3_t		origin;
;719:
;720:	BG_EvaluateTrajectory( &item->pos, atTime, origin );
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 723
;721:
;722:	// we are ignoring ducked differences here
;723:	if ( ps->origin[0] - origin[0] > 44
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 1110441984
GTF4 $194
ADDRLP4 16
INDIRF4
CNSTF4 3259498496
LTF4 $194
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
CNSTF4 1108344832
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ADDRLP4 24
INDIRF4
GTF4 $194
ADDRLP4 28
CNSTF4 3255828480
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ADDRLP4 28
INDIRF4
LTF4 $194
ADDRLP4 32
ADDRLP4 12
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ADDRLP4 24
INDIRF4
GTF4 $194
ADDRLP4 32
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ADDRLP4 28
INDIRF4
GEF4 $184
LABELV $194
line 728
;724:		|| ps->origin[0] - origin[0] < -50
;725:		|| ps->origin[1] - origin[1] > 36
;726:		|| ps->origin[1] - origin[1] < -36
;727:		|| ps->origin[2] - origin[2] > 36
;728:		|| ps->origin[2] - origin[2] < -36 ) {
line 729
;729:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $183
JUMPV
LABELV $184
line 732
;730:	}
;731:
;732:	return qtrue;
CNSTI4 1
RETI4
LABELV $183
endproc BG_PlayerTouchesItem 36 12
export BG_CanItemBeGrabbed
proc BG_CanItemBeGrabbed 32 8
line 745
;733:}
;734:
;735:
;736:
;737:/*
;738:================
;739:BG_CanItemBeGrabbed
;740:
;741:Returns false if the item should not be picked up.
;742:This needs to be the same for client side prediction and server use.
;743:================
;744:*/
;745:qboolean BG_CanItemBeGrabbed( int gametype, const entityState_t *ent, const playerState_t *ps ) {
line 751
;746:	gitem_t	*item;
;747:#ifdef MISSIONPACK
;748:	int		upperBound;
;749:#endif
;750:
;751:	if ( ent->modelindex < 1 || ent->modelindex >= bg_numItems ) {
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $198
ADDRLP4 4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $196
LABELV $198
line 752
;752:		Com_Error( ERR_DROP, "BG_CanItemBeGrabbed: index out of range" );
CNSTI4 1
ARGI4
ADDRGP4 $199
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 753
;753:	}
LABELV $196
line 755
;754:
;755:	item = &bg_itemlist[ent->modelindex];
ADDRLP4 0
CNSTI4 52
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 757
;756:
;757:	switch( item->giType ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $201
ADDRLP4 8
INDIRI4
CNSTI4 8
GTI4 $201
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $241
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $241
address $239
address $203
address $204
address $207
address $210
address $218
address $236
address $201
address $219
code
LABELV $203
line 759
;758:	case IT_WEAPON:
;759:		return qtrue;	// weapons are always picked up
CNSTI4 1
RETI4
ADDRGP4 $195
JUMPV
LABELV $204
line 762
;760:
;761:	case IT_AMMO:
;762:		if ( ps->ammo[ item->giTag ] >= 200 ) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 200
LTI4 $205
line 763
;763:			return qfalse;		// can't hold any more
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $205
line 765
;764:		}
;765:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $195
JUMPV
LABELV $207
line 785
;766:
;767:	case IT_ARMOR:
;768:#ifdef MISSIONPACK
;769:		if( bg_itemlist[ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT ) {
;770:			return qfalse;
;771:		}
;772:
;773:		// we also clamp armor to the maxhealth for handicapping
;774:		if( bg_itemlist[ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;775:			upperBound = ps->stats[STAT_MAX_HEALTH];
;776:		}
;777:		else {
;778:			upperBound = ps->stats[STAT_MAX_HEALTH] * 2;
;779:		}
;780:
;781:		if ( ps->stats[STAT_ARMOR] >= upperBound ) {
;782:			return qfalse;
;783:		}
;784:#else
;785:		if ( ps->stats[STAT_ARMOR] >= ps->stats[STAT_MAX_HEALTH] * 2 ) {
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LTI4 $208
line 786
;786:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $208
line 789
;787:		}
;788:#endif
;789:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $195
JUMPV
LABELV $210
line 800
;790:
;791:	case IT_HEALTH:
;792:		// small and mega healths will go over the max, otherwise
;793:		// don't pick up if already at max
;794:#ifdef MISSIONPACK
;795:		if( bg_itemlist[ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD ) {
;796:			upperBound = ps->stats[STAT_MAX_HEALTH];
;797:		}
;798:		else
;799:#endif
;800:		if ( item->quantity == 5 || item->quantity == 100 ) {
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $213
ADDRLP4 20
INDIRI4
CNSTI4 100
NEI4 $211
LABELV $213
line 801
;801:			if ( ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH] * 2 ) {
ADDRLP4 24
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LTI4 $214
line 802
;802:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $214
line 804
;803:			}
;804:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $195
JUMPV
LABELV $211
line 807
;805:		}
;806:
;807:		if ( ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH] ) {
ADDRLP4 24
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LTI4 $216
line 808
;808:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $216
line 810
;809:		}
;810:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $195
JUMPV
LABELV $218
line 813
;811:
;812:	case IT_POWERUP:
;813:		return qtrue;	// powerups are always picked up
CNSTI4 1
RETI4
ADDRGP4 $195
JUMPV
LABELV $219
line 851
;814:
;815:#ifdef MISSIONPACK
;816:	case IT_PERSISTANT_POWERUP:
;817:		// can only hold one item at a time
;818:		if ( ps->stats[STAT_PERSISTANT_POWERUP] ) {
;819:			return qfalse;
;820:		}
;821:
;822:		// check team only
;823:		if( ( ent->generic1 & 2 ) && ( ps->persistant[PERS_TEAM] != TEAM_RED ) ) {
;824:			return qfalse;
;825:		}
;826:		if( ( ent->generic1 & 4 ) && ( ps->persistant[PERS_TEAM] != TEAM_BLUE ) ) {
;827:			return qfalse;
;828:		}
;829:
;830:		return qtrue;
;831:#endif
;832:
;833:	case IT_TEAM: // team items, such as flags
;834:#ifdef MISSIONPACK		
;835:		if( gametype == GT_1FCTF ) {
;836:			// neutral flag can always be picked up
;837:			if( item->giTag == PW_NEUTRALFLAG ) {
;838:				return qtrue;
;839:			}
;840:			if (ps->persistant[PERS_TEAM] == TEAM_RED) {
;841:				if (item->giTag == PW_BLUEFLAG  && ps->powerups[PW_NEUTRALFLAG] ) {
;842:					return qtrue;
;843:				}
;844:			} else if (ps->persistant[PERS_TEAM] == TEAM_BLUE) {
;845:				if (item->giTag == PW_REDFLAG  && ps->powerups[PW_NEUTRALFLAG] ) {
;846:					return qtrue;
;847:				}
;848:			}
;849:		}
;850:#endif
;851:		if( gametype == GT_CTF ) {
ADDRFP4 0
INDIRI4
CNSTI4 4
NEI4 $220
line 855
;852:			// ent->modelindex2 is non-zero on items if they are dropped
;853:			// we need to know this because we can pick up our dropped flag (and return it)
;854:			// but we can't pick up our flag at base
;855:			if (ps->persistant[PERS_TEAM] == TEAM_RED) {
ADDRFP4 8
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
NEI4 $222
line 856
;856:				if (item->giTag == PW_BLUEFLAG ||
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 8
EQI4 $227
ADDRLP4 28
INDIRI4
CNSTI4 7
NEI4 $228
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
NEI4 $227
LABELV $228
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $223
ADDRFP4 8
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $223
LABELV $227
line 859
;857:					(item->giTag == PW_REDFLAG && ent->modelindex2) ||
;858:					(item->giTag == PW_REDFLAG && ps->powerups[PW_BLUEFLAG]) )
;859:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $195
JUMPV
line 860
;860:			} else if (ps->persistant[PERS_TEAM] == TEAM_BLUE) {
LABELV $222
ADDRFP4 8
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
NEI4 $229
line 861
;861:				if (item->giTag == PW_REDFLAG ||
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 7
EQI4 $234
ADDRLP4 28
INDIRI4
CNSTI4 8
NEI4 $235
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
NEI4 $234
LABELV $235
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $231
ADDRFP4 8
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $231
LABELV $234
line 864
;862:					(item->giTag == PW_BLUEFLAG && ent->modelindex2) ||
;863:					(item->giTag == PW_BLUEFLAG && ps->powerups[PW_REDFLAG]) )
;864:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $195
JUMPV
LABELV $231
line 865
;865:			}
LABELV $229
LABELV $223
line 866
;866:		}
LABELV $220
line 873
;867:
;868:#ifdef MISSIONPACK
;869:		if( gametype == GT_HARVESTER ) {
;870:			return qtrue;
;871:		}
;872:#endif
;873:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $236
line 877
;874:
;875:	case IT_HOLDABLE:
;876:		// can only hold one item at a time
;877:		if ( ps->stats[STAT_HOLDABLE_ITEM] ) {
ADDRFP4 8
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 0
EQI4 $237
line 878
;878:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $195
JUMPV
LABELV $237
line 880
;879:		}
;880:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $195
JUMPV
LABELV $239
line 883
;881:
;882:        case IT_BAD:
;883:            Com_Error( ERR_DROP, "BG_CanItemBeGrabbed: IT_BAD" );
CNSTI4 1
ARGI4
ADDRGP4 $240
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 890
;884:        default:
;885:#ifndef Q3_VM
;886:#ifndef NDEBUG // bk0001204
;887:          Com_Printf("BG_CanItemBeGrabbed: unknown enum %d\n", item->giType );
;888:#endif
;889:#endif
;890:         break;
LABELV $201
line 893
;891:	}
;892:
;893:	return qfalse;
CNSTI4 0
RETI4
LABELV $195
endproc BG_CanItemBeGrabbed 32 8
export BG_EvaluateTrajectory
proc BG_EvaluateTrajectory 104 12
line 904
;894:}
;895:
;896://======================================================================
;897:
;898:/*
;899:================
;900:BG_EvaluateTrajectory
;901:
;902:================
;903:*/
;904:void BG_EvaluateTrajectory( const trajectory_t *tr, int atTime, vec3_t result ) {
line 908
;905:	float		deltaTime;
;906:	float		phase;
;907:
;908:	switch( tr->trType ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $243
ADDRLP4 8
INDIRI4
CNSTI4 6
GTI4 $243
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $257
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $257
address $246
address $246
address $247
address $249
address $248
address $254
address $255
code
LABELV $246
line 911
;909:	case TR_STATIONARY:
;910:	case TR_INTERPOLATE:
;911:		VectorCopy( tr->trBase, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 912
;912:		break;
ADDRGP4 $244
JUMPV
LABELV $247
line 914
;913:	case TR_LINEAR:
;914:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 915
;915:		VectorMA( tr->trBase, deltaTime, tr->trDelta, result );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 916
;916:		break;
ADDRGP4 $244
JUMPV
LABELV $248
line 918
;917:	case TR_SINE:
;918:		deltaTime = ( atTime - tr->trTime ) / (float) tr->trDuration;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 919
;919:		phase = sin( deltaTime * M_PI * 2 );
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 0
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
ASGNF4
line 920
;920:		VectorMA( tr->trBase, phase, tr->trDelta, result );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 921
;921:		break;
ADDRGP4 $244
JUMPV
LABELV $249
line 923
;922:	case TR_LINEAR_STOP:
;923:		if ( atTime > tr->trTime + tr->trDuration ) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
LEI4 $250
line 924
;924:			atTime = tr->trTime + tr->trDuration;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
ASGNI4
line 925
;925:		}
LABELV $250
line 926
;926:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 927
;927:		if ( deltaTime < 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $252
line 928
;928:			deltaTime = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 929
;929:		}
LABELV $252
line 930
;930:		VectorMA( tr->trBase, deltaTime, tr->trDelta, result );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 931
;931:		break;
ADDRGP4 $244
JUMPV
LABELV $254
line 933
;932:	case TR_GRAVITY:
;933:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 934
;934:		VectorMA( tr->trBase, deltaTime, tr->trDelta, result );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 64
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 935
;935:		result[2] -= 0.5 * DEFAULT_GRAVITY * deltaTime * deltaTime;		// FIXME: local gravity...
ADDRLP4 76
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 80
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTF4 1137180672
ADDRLP4 80
INDIRF4
MULF4
ADDRLP4 80
INDIRF4
MULF4
SUBF4
ASGNF4
line 936
;936:		break;
ADDRGP4 $244
JUMPV
LABELV $255
line 938
;937:	case TR_HALFGRAVITY:
;938:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 939
;939:		VectorMA( tr->trBase, deltaTime, tr->trDelta, result );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 84
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 940
;940:		result[2] -= 0.1 * DEFAULT_GRAVITY * deltaTime * deltaTime;		// FIXME: local gravity...
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 100
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
CNSTF4 1117782016
ADDRLP4 100
INDIRF4
MULF4
ADDRLP4 100
INDIRF4
MULF4
SUBF4
ASGNF4
line 941
;941:		break;
ADDRGP4 $244
JUMPV
LABELV $243
line 943
;942:	default:
;943:		Com_Error( ERR_DROP, "BG_EvaluateTrajectory: unknown trType: %i", tr->trTime );
CNSTI4 1
ARGI4
ADDRGP4 $256
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 944
;944:		break;
LABELV $244
line 946
;945:	}
;946:}
LABELV $242
endproc BG_EvaluateTrajectory 104 12
export BG_EvaluateTrajectoryDelta
proc BG_EvaluateTrajectoryDelta 44 12
line 955
;947:
;948:/*
;949:================
;950:BG_EvaluateTrajectoryDelta
;951:
;952:For determining velocity at a given time
;953:================
;954:*/
;955:void BG_EvaluateTrajectoryDelta( const trajectory_t *tr, int atTime, vec3_t result ) {
line 959
;956:	float	deltaTime;
;957:	float	phase;
;958:
;959:	switch( tr->trType ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $259
ADDRLP4 8
INDIRI4
CNSTI4 6
GTI4 $259
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $271
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $271
address $262
address $262
address $263
address $265
address $264
address $268
address $269
code
LABELV $262
line 962
;960:	case TR_STATIONARY:
;961:	case TR_INTERPOLATE:
;962:		VectorClear( result );
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
line 963
;963:		break;
ADDRGP4 $260
JUMPV
LABELV $263
line 965
;964:	case TR_LINEAR:
;965:		VectorCopy( tr->trDelta, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 966
;966:		break;
ADDRGP4 $260
JUMPV
LABELV $264
line 968
;967:	case TR_SINE:
;968:		deltaTime = ( atTime - tr->trTime ) / (float) tr->trDuration;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 969
;969:		phase = cos( deltaTime * M_PI * 2 );	// derivative of sin = cos
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 0
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 28
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
line 970
;970:		phase *= 0.5;
ADDRLP4 4
CNSTF4 1056964608
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 971
;971:		VectorScale( tr->trDelta, phase, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 972
;972:		break;
ADDRGP4 $260
JUMPV
LABELV $265
line 974
;973:	case TR_LINEAR_STOP:
;974:		if ( atTime > tr->trTime + tr->trDuration ) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
LEI4 $266
line 975
;975:			VectorClear( result );
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRF4
ASGNF4
line 976
;976:			return;
ADDRGP4 $258
JUMPV
LABELV $266
line 978
;977:		}
;978:		VectorCopy( tr->trDelta, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 979
;979:		break;
ADDRGP4 $260
JUMPV
LABELV $268
line 981
;980:	case TR_GRAVITY:
;981:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 982
;982:		VectorCopy( tr->trDelta, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 983
;983:		result[2] -= DEFAULT_GRAVITY * deltaTime;		// FIXME: local gravity...
ADDRLP4 36
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1145569280
ADDRLP4 0
INDIRF4
MULF4
SUBF4
ASGNF4
line 984
;984:		break;
ADDRGP4 $260
JUMPV
LABELV $269
line 986
;985:	case TR_HALFGRAVITY:
;986:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 987
;987:		VectorCopy( tr->trDelta, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 988
;988:		result[2] -= DEFAULT_GRAVITY * deltaTime;		// FIXME: local gravity...
ADDRLP4 40
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1145569280
ADDRLP4 0
INDIRF4
MULF4
SUBF4
ASGNF4
line 989
;989:		break;
ADDRGP4 $260
JUMPV
LABELV $259
line 991
;990:	default:
;991:		Com_Error( ERR_DROP, "BG_EvaluateTrajectoryDelta: unknown trType: %i", tr->trTime );
CNSTI4 1
ARGI4
ADDRGP4 $270
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 992
;992:		break;
LABELV $260
line 994
;993:	}
;994:}
LABELV $258
endproc BG_EvaluateTrajectoryDelta 44 12
data
export eventnames
align 4
LABELV eventnames
address $272
address $273
address $274
address $275
address $276
address $277
address $278
address $279
address $280
address $281
address $282
address $283
address $284
address $285
address $286
address $287
address $288
address $289
address $290
address $291
address $292
address $293
address $294
address $295
address $296
address $297
address $298
address $299
address $300
address $301
address $302
address $303
address $304
address $305
address $306
address $307
address $308
address $309
address $310
address $311
address $312
address $313
address $314
address $315
address $316
address $317
address $318
address $319
address $320
address $321
address $322
address $323
address $324
address $325
address $326
address $327
address $328
address $329
address $330
address $331
address $332
address $333
address $334
address $335
address $336
address $337
address $338
address $339
address $340
export BG_AddPredictableEventToPlayerstate
code
proc BG_AddPredictableEventToPlayerstate 12 0
line 1106
;995:
;996:char *eventnames[] = {
;997:	"EV_NONE",
;998:
;999:	"EV_FOOTSTEP",
;1000:	"EV_FOOTSTEP_METAL",
;1001:	"EV_FOOTSPLASH",
;1002:	"EV_FOOTWADE",
;1003:	"EV_SWIM",
;1004:
;1005:	"EV_STEP_4",
;1006:	"EV_STEP_8",
;1007:	"EV_STEP_12",
;1008:	"EV_STEP_16",
;1009:
;1010:	"EV_FALL_SHORT",
;1011:	"EV_FALL_MEDIUM",
;1012:	"EV_FALL_FAR",
;1013:
;1014:	"EV_JUMP_PAD",			// boing sound at origin", jump sound on player
;1015:
;1016:	"EV_JUMP",
;1017:	"EV_WATER_TOUCH",	// foot touches
;1018:	"EV_WATER_LEAVE",	// foot leaves
;1019:	"EV_WATER_UNDER",	// head touches
;1020:	"EV_WATER_CLEAR",	// head leaves
;1021:
;1022:	"EV_ITEM_PICKUP",			// normal item pickups are predictable
;1023:	"EV_GLOBAL_ITEM_PICKUP",	// powerup / team sounds are broadcast to everyone
;1024:
;1025:	"EV_NOAMMO",
;1026:	"EV_CHANGE_WEAPON",
;1027:	"EV_FIRE_WEAPON",
;1028:
;1029:	"EV_USE_ITEM0",
;1030:	"EV_USE_ITEM1",
;1031:	"EV_USE_ITEM2",
;1032:	"EV_USE_ITEM3",
;1033:	"EV_USE_ITEM4",
;1034:	"EV_USE_ITEM5",
;1035:	"EV_USE_ITEM6",
;1036:	"EV_USE_ITEM7",
;1037:	"EV_USE_ITEM8",
;1038:	"EV_USE_ITEM9",
;1039:	"EV_USE_ITEM10",
;1040:	"EV_USE_ITEM11",
;1041:	"EV_USE_ITEM12",
;1042:	"EV_USE_ITEM13",
;1043:	"EV_USE_ITEM14",
;1044:	"EV_USE_ITEM15",
;1045:
;1046:	"EV_ITEM_RESPAWN",
;1047:	"EV_ITEM_POP",
;1048:	"EV_PLAYER_TELEPORT_IN",
;1049:	"EV_PLAYER_TELEPORT_OUT",
;1050:
;1051:	"EV_GRENADE_BOUNCE",		// eventParm will be the soundindex
;1052:
;1053:	"EV_GENERAL_SOUND",
;1054:	"EV_GLOBAL_SOUND",		// no attenuation
;1055:	"EV_GLOBAL_TEAM_SOUND",
;1056:
;1057:	"EV_BULLET_HIT_FLESH",
;1058:	"EV_BULLET_HIT_WALL",
;1059:
;1060:	"EV_MISSILE_HIT",
;1061:	"EV_MISSILE_MISS",
;1062:	"EV_MISSILE_MISS_METAL",
;1063:	"EV_RAILTRAIL",
;1064:	"EV_SHOTGUN",
;1065:	"EV_BULLET",				// otherEntity is the shooter
;1066:
;1067:	"EV_PAIN",
;1068:	"EV_DEATH1",
;1069:	"EV_DEATH2",
;1070:	"EV_DEATH3",
;1071:	"EV_OBITUARY",
;1072:
;1073:	"EV_POWERUP_QUAD",
;1074:	"EV_POWERUP_BATTLESUIT",
;1075:	"EV_POWERUP_REGEN",
;1076:
;1077:	"EV_GIB_PLAYER",			// gib a previously living player
;1078:	"EV_SCOREPLUM",			// score plum
;1079:
;1080:#ifdef MISSIONPACK
;1081://	"EV_PROXIMITY_MINE_STICK",
;1082://	"EV_PROXIMITY_MINE_TRIGGER",
;1083:	"EV_KAMIKAZE",			// kamikaze explodes
;1084://	"EV_OBELISKEXPLODE",		// obelisk explodes
;1085://	"EV_INVUL_IMPACT",		// invulnerability sphere impact
;1086://	"EV_JUICED",				// invulnerability juiced effect
;1087://	"EV_LIGHTNINGBOLT",		// lightning bolt bounced of invulnerability sphere
;1088:#endif
;1089:
;1090:	"EV_DEBUG_LINE",
;1091:	"EV_STOPLOOPINGSOUND",
;1092:	"EV_TAUNT"
;1093:
;1094:};
;1095:
;1096:/*
;1097:===============
;1098:BG_AddPredictableEventToPlayerstate
;1099:
;1100:Handles the sequence numbers
;1101:===============
;1102:*/
;1103:
;1104:void	trap_Cvar_VariableStringBuffer( const char *var_name, char *buffer, int bufsize );
;1105:
;1106:void BG_AddPredictableEventToPlayerstate( int newEvent, int eventParm, playerState_t *ps ) {
line 1121
;1107:
;1108:#ifdef _DEBUG
;1109:	{
;1110:		char buf[256];
;1111:		trap_Cvar_VariableStringBuffer("showevents", buf, sizeof(buf));
;1112:		if ( atof(buf) != 0 ) {
;1113:#ifdef QAGAME
;1114:			Com_Printf(" game event svt %5d -> %5d: num = %20s parm %d\n", ps->pmove_framecount/*ps->commandTime*/, ps->eventSequence, eventnames[newEvent], eventParm);
;1115:#else
;1116:			Com_Printf("Cgame event svt %5d -> %5d: num = %20s parm %d\n", ps->pmove_framecount/*ps->commandTime*/, ps->eventSequence, eventnames[newEvent], eventParm);
;1117:#endif
;1118:		}
;1119:	}
;1120:#endif
;1121:	ps->events[ps->eventSequence & (MAX_PS_EVENTS-1)] = newEvent;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1122
;1122:	ps->eventParms[ps->eventSequence & (MAX_PS_EVENTS-1)] = eventParm;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1123
;1123:	ps->eventSequence++;
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1124
;1124:}
LABELV $341
endproc BG_AddPredictableEventToPlayerstate 12 0
export BG_TouchJumpPad
proc BG_TouchJumpPad 28 12
line 1131
;1125:
;1126:/*
;1127:========================
;1128:BG_TouchJumpPad
;1129:========================
;1130:*/
;1131:void BG_TouchJumpPad( playerState_t *ps, entityState_t *jumppad ) {
line 1137
;1132:	vec3_t	angles;
;1133:	float p;
;1134:	int effectNum;
;1135:
;1136:	// spectators don't use jump pads
;1137:	if ( ps->pm_type != PM_NORMAL ) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $343
line 1138
;1138:		return;
ADDRGP4 $342
JUMPV
LABELV $343
line 1142
;1139:	}
;1140:
;1141:	// flying characters don't hit bounce pads
;1142:	if ( ps->powerups[PW_FLIGHT] ) {
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $345
line 1143
;1143:		return;
ADDRGP4 $342
JUMPV
LABELV $345
line 1148
;1144:	}
;1145:
;1146:	// if we didn't hit this same jumppad the previous frame
;1147:	// then don't play the event sound again if we are in a fat trigger
;1148:	if ( ps->jumppad_ent != jumppad->number ) {
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $347
line 1150
;1149:
;1150:		vectoangles( jumppad->origin2, angles);
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1151
;1151:		p = fabs( AngleNormalize180( angles[PITCH] ) );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 1152
;1152:		if( p < 45 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1110704128
GEF4 $349
line 1153
;1153:			effectNum = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1154
;1154:		} else {
ADDRGP4 $350
JUMPV
LABELV $349
line 1155
;1155:			effectNum = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 1156
;1156:		}
LABELV $350
line 1157
;1157:		BG_AddPredictableEventToPlayerstate( EV_JUMP_PAD, effectNum, ps );
CNSTI4 13
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 1158
;1158:	}
LABELV $347
line 1160
;1159:	// remember hitting this jumppad this frame
;1160:	ps->jumppad_ent = jumppad->number;
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1161
;1161:	ps->jumppad_frame = ps->pmove_framecount;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 460
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ASGNI4
line 1163
;1162:	// give the player the velocity from the jumppad
;1163:	VectorCopy( jumppad->origin2, ps->velocity );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1164
;1164:}
LABELV $342
endproc BG_TouchJumpPad 28 12
export BG_PlayerStateToEntityState
proc BG_PlayerStateToEntityState 28 0
line 1174
;1165:
;1166:/*
;1167:========================
;1168:BG_PlayerStateToEntityState
;1169:
;1170:This is done after each set of usercmd_t on the server,
;1171:and after local prediction on the client
;1172:========================
;1173:*/
;1174:void BG_PlayerStateToEntityState( playerState_t *ps, entityState_t *s, qboolean snap ) {
line 1177
;1175:	int		i;
;1176:
;1177:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPECTATOR ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
EQI4 $354
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $352
LABELV $354
line 1178
;1178:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 1179
;1179:	} else if ( ps->stats[STAT_HEALTH] <= GIB_HEALTH ) {
ADDRGP4 $353
JUMPV
LABELV $352
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $355
line 1180
;1180:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 1181
;1181:	} else {
ADDRGP4 $356
JUMPV
LABELV $355
line 1182
;1182:		s->eType = ET_PLAYER;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 1183
;1183:	}
LABELV $356
LABELV $353
line 1185
;1184:
;1185:	s->number = ps->clientNum;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1187
;1186:
;1187:	s->pos.trType = TR_INTERPOLATE;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 1188
;1188:	VectorCopy( ps->origin, s->pos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1189
;1189:	if ( snap ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $357
line 1190
;1190:		SnapVector( s->pos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 24
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
ADDRFP4 4
INDIRP4
CNSTI4 28
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
ADDRFP4 4
INDIRP4
CNSTI4 32
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
line 1191
;1191:	}
LABELV $357
line 1193
;1192:	// set the trDelta for flag direction
;1193:	VectorCopy( ps->velocity, s->pos.trDelta );
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 1195
;1194:
;1195:	s->apos.trType = TR_INTERPOLATE;
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 1196
;1196:	VectorCopy( ps->viewangles, s->apos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 1197
;1197:	if ( snap ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $359
line 1198
;1198:		SnapVector( s->apos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 60
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
ADDRFP4 4
INDIRP4
CNSTI4 64
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
ADDRFP4 4
INDIRP4
CNSTI4 68
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
line 1199
;1199:	}
LABELV $359
line 1201
;1200:
;1201:	s->angles2[YAW] = ps->movementDir;
ADDRFP4 4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1202
;1202:	s->legsAnim = ps->legsAnim;
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 1203
;1203:	s->torsoAnim = ps->torsoAnim;
ADDRFP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 1204
;1204:	s->clientNum = ps->clientNum;		// ET_PLAYER looks here instead of at number
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1206
;1205:										// so corpses can also reference the proper config
;1206:	s->eFlags = ps->eFlags;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 1207
;1207:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $361
line 1208
;1208:		s->eFlags |= EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1209
;1209:	} else {
ADDRGP4 $362
JUMPV
LABELV $361
line 1210
;1210:		s->eFlags &= ~EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1211
;1211:	}
LABELV $362
line 1213
;1212:
;1213:	if ( ps->externalEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CNSTI4 0
EQI4 $363
line 1214
;1214:		s->event = ps->externalEvent;
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 1215
;1215:		s->eventParm = ps->externalEventParm;
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 1216
;1216:	} else if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRGP4 $364
JUMPV
LABELV $363
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
GEI4 $365
line 1219
;1217:		int		seq;
;1218:
;1219:		if ( ps->entityEventSequence < ps->eventSequence - MAX_PS_EVENTS) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $367
line 1220
;1220:			ps->entityEventSequence = ps->eventSequence - MAX_PS_EVENTS;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 464
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1221
;1221:		}
LABELV $367
line 1222
;1222:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 1223
;1223:		s->event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 1224
;1224:		s->eventParm = ps->eventParms[ seq ];
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1225
;1225:		ps->entityEventSequence++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1226
;1226:	}
LABELV $365
LABELV $364
line 1228
;1227:
;1228:	s->weapon = ps->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 1229
;1229:	s->groundEntityNum = ps->groundEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 1231
;1230:
;1231:	s->powerups = 0;
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 1232
;1232:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $369
line 1233
;1233:		if ( ps->powerups[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $373
line 1234
;1234:			s->powerups |= 1 << i;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 1235
;1235:		}
LABELV $373
line 1236
;1236:	}
LABELV $370
line 1232
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $369
line 1238
;1237:
;1238:	s->loopSound = ps->loopSound;
ADDRFP4 4
INDIRP4
CNSTI4 156
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ASGNI4
line 1239
;1239:	s->generic1 = ps->generic1;
ADDRFP4 4
INDIRP4
CNSTI4 204
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 1240
;1240:}
LABELV $351
endproc BG_PlayerStateToEntityState 28 0
export BG_PlayerStateToEntityStateExtraPolate
proc BG_PlayerStateToEntityStateExtraPolate 28 0
line 1250
;1241:
;1242:/*
;1243:========================
;1244:BG_PlayerStateToEntityStateExtraPolate
;1245:
;1246:This is done after each set of usercmd_t on the server,
;1247:and after local prediction on the client
;1248:========================
;1249:*/
;1250:void BG_PlayerStateToEntityStateExtraPolate( playerState_t *ps, entityState_t *s, int time, qboolean snap ) {
line 1253
;1251:	int		i;
;1252:
;1253:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPECTATOR ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
EQI4 $378
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $376
LABELV $378
line 1254
;1254:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 1255
;1255:	} else if ( ps->stats[STAT_HEALTH] <= GIB_HEALTH ) {
ADDRGP4 $377
JUMPV
LABELV $376
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $379
line 1256
;1256:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 1257
;1257:	} else {
ADDRGP4 $380
JUMPV
LABELV $379
line 1258
;1258:		s->eType = ET_PLAYER;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 1259
;1259:	}
LABELV $380
LABELV $377
line 1261
;1260:
;1261:	s->number = ps->clientNum;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1263
;1262:
;1263:	s->pos.trType = TR_LINEAR_STOP;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 1264
;1264:	VectorCopy( ps->origin, s->pos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1265
;1265:	if ( snap ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $381
line 1266
;1266:		SnapVector( s->pos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 24
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
ADDRFP4 4
INDIRP4
CNSTI4 28
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
ADDRFP4 4
INDIRP4
CNSTI4 32
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
line 1267
;1267:	}
LABELV $381
line 1269
;1268:	// set the trDelta for flag direction and linear prediction
;1269:	VectorCopy( ps->velocity, s->pos.trDelta );
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 1271
;1270:	// set the time for linear prediction
;1271:	s->pos.trTime = time;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1273
;1272:	// set maximum extra polation time
;1273:	s->pos.trDuration = 50; // 1000 / sv_fps (default = 20)
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 50
ASGNI4
line 1275
;1274:
;1275:	s->apos.trType = TR_INTERPOLATE;
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 1276
;1276:	VectorCopy( ps->viewangles, s->apos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 1277
;1277:	if ( snap ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $383
line 1278
;1278:		SnapVector( s->apos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 60
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
ADDRFP4 4
INDIRP4
CNSTI4 64
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
ADDRFP4 4
INDIRP4
CNSTI4 68
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
line 1279
;1279:	}
LABELV $383
line 1281
;1280:
;1281:	s->angles2[YAW] = ps->movementDir;
ADDRFP4 4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1282
;1282:	s->legsAnim = ps->legsAnim;
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ASGNI4
line 1283
;1283:	s->torsoAnim = ps->torsoAnim;
ADDRFP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 1284
;1284:	s->clientNum = ps->clientNum;		// ET_PLAYER looks here instead of at number
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1286
;1285:										// so corpses can also reference the proper config
;1286:	s->eFlags = ps->eFlags;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 1287
;1287:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $385
line 1288
;1288:		s->eFlags |= EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1289
;1289:	} else {
ADDRGP4 $386
JUMPV
LABELV $385
line 1290
;1290:		s->eFlags &= ~EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1291
;1291:	}
LABELV $386
line 1293
;1292:
;1293:	if ( ps->externalEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CNSTI4 0
EQI4 $387
line 1294
;1294:		s->event = ps->externalEvent;
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 1295
;1295:		s->eventParm = ps->externalEventParm;
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 1296
;1296:	} else if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRGP4 $388
JUMPV
LABELV $387
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
GEI4 $389
line 1299
;1297:		int		seq;
;1298:
;1299:		if ( ps->entityEventSequence < ps->eventSequence - MAX_PS_EVENTS) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $391
line 1300
;1300:			ps->entityEventSequence = ps->eventSequence - MAX_PS_EVENTS;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 464
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1301
;1301:		}
LABELV $391
line 1302
;1302:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 1303
;1303:		s->event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 1304
;1304:		s->eventParm = ps->eventParms[ seq ];
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1305
;1305:		ps->entityEventSequence++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1306
;1306:	}
LABELV $389
LABELV $388
line 1308
;1307:
;1308:	s->weapon = ps->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 1309
;1309:	s->groundEntityNum = ps->groundEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 1311
;1310:
;1311:	s->powerups = 0;
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 1312
;1312:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $393
line 1313
;1313:		if ( ps->powerups[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $397
line 1314
;1314:			s->powerups |= 1 << i;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 1315
;1315:		}
LABELV $397
line 1316
;1316:	}
LABELV $394
line 1312
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $393
line 1318
;1317:
;1318:	s->loopSound = ps->loopSound;
ADDRFP4 4
INDIRP4
CNSTI4 156
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ASGNI4
line 1319
;1319:	s->generic1 = ps->generic1;
ADDRFP4 4
INDIRP4
CNSTI4 204
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 1320
;1320:}
LABELV $375
endproc BG_PlayerStateToEntityStateExtraPolate 28 0
import trap_Cvar_VariableStringBuffer
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
LABELV $340
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 0
align 1
LABELV $339
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 79
byte 1 80
byte 1 76
byte 1 79
byte 1 79
byte 1 80
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $338
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 85
byte 1 71
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 0
align 1
LABELV $337
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 67
byte 1 79
byte 1 82
byte 1 69
byte 1 80
byte 1 76
byte 1 85
byte 1 77
byte 1 0
align 1
LABELV $336
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 73
byte 1 66
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $335
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 82
byte 1 69
byte 1 71
byte 1 69
byte 1 78
byte 1 0
align 1
LABELV $334
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 66
byte 1 65
byte 1 84
byte 1 84
byte 1 76
byte 1 69
byte 1 83
byte 1 85
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $333
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 81
byte 1 85
byte 1 65
byte 1 68
byte 1 0
align 1
LABELV $332
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 66
byte 1 73
byte 1 84
byte 1 85
byte 1 65
byte 1 82
byte 1 89
byte 1 0
align 1
LABELV $331
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 51
byte 1 0
align 1
LABELV $330
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 50
byte 1 0
align 1
LABELV $329
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 49
byte 1 0
align 1
LABELV $328
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 65
byte 1 73
byte 1 78
byte 1 0
align 1
LABELV $327
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $326
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $325
byte 1 69
byte 1 86
byte 1 95
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 84
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 0
align 1
LABELV $324
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $323
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 0
align 1
LABELV $322
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $321
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 87
byte 1 65
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $320
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 95
byte 1 70
byte 1 76
byte 1 69
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $319
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $318
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $317
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $316
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 95
byte 1 66
byte 1 79
byte 1 85
byte 1 78
byte 1 67
byte 1 69
byte 1 0
align 1
LABELV $315
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 79
byte 1 85
byte 1 84
byte 1 0
align 1
LABELV $314
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 0
align 1
LABELV $313
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 79
byte 1 80
byte 1 0
align 1
LABELV $312
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 82
byte 1 69
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 0
align 1
LABELV $311
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $310
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 52
byte 1 0
align 1
LABELV $309
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $308
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $307
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $306
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $305
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 57
byte 1 0
align 1
LABELV $304
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 56
byte 1 0
align 1
LABELV $303
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 55
byte 1 0
align 1
LABELV $302
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 54
byte 1 0
align 1
LABELV $301
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 53
byte 1 0
align 1
LABELV $300
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 52
byte 1 0
align 1
LABELV $299
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 51
byte 1 0
align 1
LABELV $298
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 50
byte 1 0
align 1
LABELV $297
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 0
align 1
LABELV $296
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 48
byte 1 0
align 1
LABELV $295
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 0
align 1
LABELV $294
byte 1 69
byte 1 86
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 78
byte 1 71
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 0
align 1
LABELV $293
byte 1 69
byte 1 86
byte 1 95
byte 1 78
byte 1 79
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 0
align 1
LABELV $292
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $291
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $290
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 67
byte 1 76
byte 1 69
byte 1 65
byte 1 82
byte 1 0
align 1
LABELV $289
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 85
byte 1 78
byte 1 68
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $288
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 76
byte 1 69
byte 1 65
byte 1 86
byte 1 69
byte 1 0
align 1
LABELV $287
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 79
byte 1 85
byte 1 67
byte 1 72
byte 1 0
align 1
LABELV $286
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 0
align 1
LABELV $285
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 95
byte 1 80
byte 1 65
byte 1 68
byte 1 0
align 1
LABELV $284
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 70
byte 1 65
byte 1 82
byte 1 0
align 1
LABELV $283
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 77
byte 1 69
byte 1 68
byte 1 73
byte 1 85
byte 1 77
byte 1 0
align 1
LABELV $282
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 82
byte 1 84
byte 1 0
align 1
LABELV $281
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $280
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $279
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 56
byte 1 0
align 1
LABELV $278
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 52
byte 1 0
align 1
LABELV $277
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 87
byte 1 73
byte 1 77
byte 1 0
align 1
LABELV $276
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 87
byte 1 65
byte 1 68
byte 1 69
byte 1 0
align 1
LABELV $275
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $274
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $273
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 0
align 1
LABELV $272
byte 1 69
byte 1 86
byte 1 95
byte 1 78
byte 1 79
byte 1 78
byte 1 69
byte 1 0
align 1
LABELV $270
byte 1 66
byte 1 71
byte 1 95
byte 1 69
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 97
byte 1 116
byte 1 101
byte 1 84
byte 1 114
byte 1 97
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 68
byte 1 101
byte 1 108
byte 1 116
byte 1 97
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 114
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $256
byte 1 66
byte 1 71
byte 1 95
byte 1 69
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 97
byte 1 116
byte 1 101
byte 1 84
byte 1 114
byte 1 97
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 114
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $240
byte 1 66
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 66
byte 1 101
byte 1 71
byte 1 114
byte 1 97
byte 1 98
byte 1 98
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 73
byte 1 84
byte 1 95
byte 1 66
byte 1 65
byte 1 68
byte 1 0
align 1
LABELV $199
byte 1 66
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 66
byte 1 101
byte 1 71
byte 1 114
byte 1 97
byte 1 98
byte 1 98
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
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
byte 1 0
align 1
LABELV $174
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
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $165
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $142
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $141
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 49
byte 1 0
align 1
LABELV $140
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 98
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $139
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $138
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $137
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $136
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 114
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $135
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $134
byte 1 70
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $133
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $132
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 47
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $131
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 47
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $130
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $129
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $128
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $127
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $126
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $125
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 95
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $124
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $123
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $122
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $121
byte 1 73
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $120
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $119
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 95
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $118
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $117
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $116
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $115
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $114
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $113
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 47
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 95
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $112
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 47
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $111
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $110
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $109
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 97
byte 1 105
byte 1 114
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $108
byte 1 66
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $107
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 115
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $106
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 47
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 95
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $105
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 47
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $104
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $103
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 101
byte 1 110
byte 1 118
byte 1 105
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $102
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $101
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 32
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $100
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $99
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 95
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $98
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $97
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $96
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $95
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 117
byte 1 115
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $94
byte 1 77
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $93
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 95
byte 1 115
byte 1 112
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $91
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $90
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $89
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $88
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $87
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $86
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $85
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $84
byte 1 72
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $83
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 119
byte 1 95
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $82
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 47
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $81
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 119
byte 1 95
byte 1 112
byte 1 107
byte 1 117
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $80
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $79
byte 1 77
byte 1 101
byte 1 103
byte 1 97
byte 1 32
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $78
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 104
byte 1 95
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $77
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 47
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 95
byte 1 115
byte 1 112
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $76
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 47
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $75
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $74
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $73
byte 1 53
byte 1 48
byte 1 32
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $72
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 104
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $71
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 47
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 95
byte 1 115
byte 1 112
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $70
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 47
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $69
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 108
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $68
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $67
byte 1 50
byte 1 53
byte 1 32
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $66
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 104
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $65
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $64
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $63
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 110
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $62
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $61
byte 1 53
byte 1 32
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $60
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 104
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $59
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 47
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 95
byte 1 115
byte 1 112
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $58
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 47
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $57
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 115
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $56
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $55
byte 1 72
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $54
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 114
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $53
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $52
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 0
align 1
LABELV $51
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $50
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $49
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $48
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 97
byte 1 114
byte 1 50
byte 1 95
byte 1 112
byte 1 107
byte 1 117
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 98
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $46
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $45
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 114
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $44
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 47
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 95
byte 1 115
byte 1 112
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $43
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 47
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $42
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 97
byte 1 114
byte 1 49
byte 1 95
byte 1 112
byte 1 107
byte 1 117
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $41
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $40
byte 1 0
