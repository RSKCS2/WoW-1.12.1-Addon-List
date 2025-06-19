
-- LVOnyxia
LVBM_ONYXIA_NAME			= "Onyxia";
LVBM_ONYXIA_INFO			= "Displays a warning when Onyxia does her deep breath ability during phase two.";
LVBM_ONYXIA_BREATH_EMOTE 		= "%s takes in a deep breath...";
LVBM_ONYXIA_BREATH_ANNOUNCE		= "*** Deep Breath ***"
LVBM_ONYXIA_PHASE2_YELL			= "This meaningless exertion bores me. I'll incinerate you all from above!";
LVBM_ONYXIA_PHASE2_ANNOUNCE		= "*** Phase 2 ***"
LVBM_ONYXIA_PHASE3_YELL			= "It seems you'll need another lesson, mortals!";
LVBM_ONYXIA_PHASE3_ANNOUNCE		= "*** Phase 3 ***"

-- LVLordKazzak
LVBM_KAZZAK_NAME			= "Lord Kazzak";
LVBM_KAZZAK_INFO			= "Announces Lord Kazzak's Supreme Mode and returns the time needed to kill him";
LVBM_KAZZAK_START_YELL			= "For the Legion! For Kil'Jaeden!";
LVBM_KAZZAK_NAME			= "Lord Kazzak";
LVBM_KAZZAK_BAR_TEXT			= "Supreme Mode";
LVBM_KAZZAK_DIES			= "Lord Kazzak dies.";
LVBM_KAZZAK_ANNOUNCE_START		= "*** 3 min until Supreme Mode ***";
LVBM_KAZZAK_ANNOUNCE_TIMENEEDED 	= "*** Killed Lord Kazzak in %d seconds ***";
LVBM_KAZZAK_ANNOUNCE_SEC		= "*** %d sec until Supreme Mode ***";

-- LVAzuregos
LVBM_AZUREGOS_NAME			= "Azuregos";
LVBM_AZUREGOS_INFO			= "Announces Azuregos' Teleport and Magic Shield abilities.";
LVBM_AZUREGOS_SHIELDUP_EXPR		= "Azuregos gains Reflection.";
LVBM_AZUREGOS_SHIELDUP_ANNOUNCE		= "*** Magic Reflection - stop casts against him ***";
LVBM_AZUREGOS_SHIELDDOWN_EXPR 		= "Reflection fades from Azuregos.";
LVBM_AZUREGOS_SHIELDDOWN_ANNOUNCE	= "*** Magic Reflection faded ***";
LVBM_AZUREGOS_PORT_EXPR 		= "Come, little ones. Face me!"
LVBM_AZUREGOS_PORT_ANNOUNCE		= "*** Teleport ***";

-- LVBattleGrounds
LVBM_BGMOD_LANG = {
		-- MIX
	["NAME"] 		= "Battlegrounds",
	["INFO"] 		= "Shows timer bars for Alterac Valley and Arathi Basin flag captures. "
				.."Shows the Warsong Flag Carrier and allow auto turn-in's for Alterac Valley.",
	["THANKS"] 		= "Thanks for using La Vendetta BossMods, happy PvP",
	["WINS"]		= "The (%w+) wins",
	["BEGINS"]		= "Game starts in",	-- BAR
	["ALLIANCE"]		= "Alliance",
	["HORDE"]		= "Horde",
	["ALLI_TAKE_ANNOUNCE"] 	= "*** Alliance has taken the %s ***",
	["HORDE_TAKE_ANNOUNCE"]	= "*** Horde has taken the %s ***",

		-- AV
	["AV_ZONE"] 		= "Alterac Valley",
	["AV_START60SEC"]	= "1 minute until the battle for Alterac Valley begins.",
	["AV_START30SEC"]	= "30 seconds until the battle for Alterac Valley begins.",
	["AV_TURNININFO"] 	= "Auto turn-in reputation items",
	["AV_NPC"] = {
		["SMITHREGZAR"] 		= "Smith Regzar",			-- armor
		["PRIMALISTTHURLOGA"] 		= "Primalist Thurloga",			-- icelord
		["WINGCOMMANDERJEZTOR"] 	= "Wing Commander Jeztor",		
		["WINGCOMMANDERGUSE"] 		= "Wing Commander Guse",
		["WINGCOMMANDERMULVERICK"] 	= "Wing Commander Mulverick",
		["MURGOTDEEPFORGE"] 		= "Murgot Deepforge",			-- armor
		["ARCHDRUIDRENFERAL"] 		= "Arch Druid Renferal",		-- forestlord
		["WINGCOMMANDERVIPORE"] 	= "Wing Commander Vipore",
		["WINDCOMMANDERSLIDORE"] 	= "Wing Commander Slidore",
		["WINGCOMMANDERICHMAN"] 	= "Wing Commander Ichman",
		["STORMPIKERAMRIDERCOMMANDER"]	= "Stormpike Ram Rider Commander",
		["FROSTWOLFWOLFRIDERCOMMANDER"]	= "Frostwolf Wolf Rider Commander",
	},
	["AV_ITEM"] = {
		["ARMORSCRAPS"] = "Armor Scraps",
		["SOLDIERSBLOOD"] = "Stormpike Soldier's Blood",
		["LIEUTENANTSFLESH"] = "Stormpike Lieutenant's Flesh",
		["SOLDIERSFLESH"] = "Stormpike Soldier's Flesh",
		["COMMANDERSFLESH"] = "Stormpike Commander's Flesh",
		["STORMCRYSTAL"] = "Storm Crystal",
		["LIEUTENANTSMEDAL"] = "Frostwolf Lieutenant's Medal",
		["SOLDIERSMEDAL"] = "Frostwolf Soldier's Medal",
		["COMMANDERSMEDAL"] = "Frostwolf Commander's Medal",
		["FROSTWOLFHIDE"] = "Frostwolf Hide",
		["ALTERACRAMHIDE"] = "Alterac Ram Hide",
	},
	["AV_TARGETS"] = {
		"Stormpike Aid Station",
		"Dun Baldar North Bunker",
		"Dun Baldar South Bunker",
		"Stormpike Graveyard",
		"Icewing Bunker",
		"Stonehearth Graveyard",
		"Stonehearth Bunker",
		"Snowfall Graveyard",
		"Iceblood Tower",
		"Iceblood Graveyard",
		"Tower Point",
		"Frostwolf Graveyard",
		"West Frostwolf Tower",
		"East Frostwolf Tower",
		"Frostwolf Relief Hut"
	},
	["AV_UNDERATTACK"]	= "(.+) is under attack!  If left unchecked, the (%w+) will (%w+) it!",	-- Graveyard // Tower
	["AV_WASTAKENBY"]	= "(.+) was taken by the (%w+)!",
	["AV_WASDESTROYED"]	= "(.+) was destroyed by the (%w+)!",
	["AV_IVUS"]		= "Wicked, Wicked, Mortals! The forest weeps",
	["AV_ICEY"]		= "WHO DARES SUMMON LOKHOLAR",


		-- AB
	["AB_ZONE"] 		= "Arathi Basin",
	["AB_START60SEC"]	= "The Battle for Arathi Basin will begin in 1 minute.",
	["AB_START30SEC"]	= "The Battle for Arathi Basin will begin in 30 seconds.",
	["AB_CLAIMSTHE"]	= "(.+) claims the (%w+)!  If left unchallenged, the (%w+) will control it in 1 minute!",
	["AB_HASTAKENTHE"]	= "The (%w+) has taken the (%w+)!",
	["AB_HASDEFENDEDTHE"]	= "The (%w+) has defended the (%w+)!",
	["AB_HASASSAULTED"]	= "has assaulted",
	["AB_SCOREEXP"] 	= "Bases: (%d+)  Resources: (%d+)/2000",
	["AB_WINALLY"] 		= "Alliance wins in:",
	["AB_WINHORDE"] 	= "Horde wins in:",
	["AB_TARGETS"] 		= {
		"farm",
		"lumber mill",
		"blacksmith",
		"mine",
		"stables"
	},

		-- WSG
	["WSG_ZONE"] 		= "Warsong Gulch",
	["WSG_START60SEC"]	= "The battle for Warsong Gulch begins in 1 minute.",
	["WSG_START30SEC"]	= "The battle for Warsong Gulch begins in 30 seconds. Prepare yourselves!",
	["WSG_INFOFRAME_INFO"]	= "Show Flag Capture Window in Warsong Gulch",
	["WSG_FLAG_PICKUP"] 	= "The (%w+) .lag was picked up by (.+)!",			-- . because the F is not allways large char 
	["WSG_FLAG_RETURN"]	= "The (%w+) .lag was returned to its base by (.+)!",
	["WSG_ALLYFLAG"]	= "Alliance Flag: ",
	["WSG_HORDEFLAG"]	= "Horde Flag: ",
	["WSG_FLAG_BASE"]	= "Base",
	["WSG_HASCAPTURED"]	= "(.+) captured the (%w+) flag!",
}


LVBM_BGMOD_EN_TARGET_AV = LVBM_BGMOD_LANG.AV_TARGETS;
LVBM_BGMOD_EN_TARGET_AB = LVBM_BGMOD_LANG.AB_TARGETS;

-- LVBM_SBT["Alliance: Lumber mill"] = "Alliance: Lumber Mill";
-- LVBM_SBT["Horde: Lumber mill"] = "Horde: Lumber Mill";
-- LVBM_SBT["Flag respawn"] = "";
-- LVBM_SBT["Ivus spawn"] = "";
-- LVBM_SBT["Ice spawn"] = "";
LVBM_SBT["Begins"] = LVBM_BGMOD_LANG["BEGINS"];
LVBM_SBT["AB_WINHORDE"] = LVBM_BGMOD_LANG.AB_WINHORDE;
LVBM_SBT["AB_WINALLY"] = LVBM_BGMOD_LANG.AB_WINALLY;


--Outdoor Dragons
LVBM_OUTDOOR_NAME		= "Lethon, Taerar, Emeriss and Ysondre";
LVBM_OUTDOOR_DESCRIPTION	= "Announces Noxious Breath and Emeriss' Volatile Infection.";
LVBM_OUTDOOR_YSONDRE		= "Ysondre";
LVBM_OUTDOOR_EMERISS		= "Emeriss";
LVBM_OUTDOOR_TAERAR		= "Taerar";
LVBM_OUTDOOR_LETHON		= "Lethon";

LVBM_OUTDOOR_BREATH_NOW		= "*** Noxious Breath - next in 30 sec ***";
LVBM_OUTDOOR_BREATH_WARNING	= "*** Noxious Breath in %s sec ***";
LVBM_OUTDOOR_INFECT_WARN	= "*** %s is afflicted by Volatile Infection ***";
LVBM_OUTDOOR_INFECT_SPECIAL	= "You are afflicted by Volatile Infection!";

LVBM_OUTDOOR_NOX_BREATH		= "([^%s]+) (%w+) afflicted by Noxious Breath";
LVBM_OUTDOOR_NOX_RESIST		= "([^%s]+) Noxious Breath was resisted by ([^%s]+)";
LVBM_OUTDOOR_INFECTION		= "([^%s]+) (%w+) afflicted by Volatile Infection.";

LVBM_OUTDOOR_LOCATION_1		= LVBM_DUSKWOOD;
LVBM_OUTDOOR_LOCATION_2		= LVBM_ASHENVALE;
LVBM_OUTDOOR_LOCATION_3		= LVBM_FERALAS;
LVBM_OUTDOOR_LOCATION_4		= LVBM_HINTERLANDS;
