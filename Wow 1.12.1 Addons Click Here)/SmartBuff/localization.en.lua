-------------------------------------------------------------------------------
-- Globals
-------------------------------------------------------------------------------

SMARTBUFF_TTC_R = 1;
SMARTBUFF_TTC_G = 1;
SMARTBUFF_TTC_B = 1;
SMARTBUFF_TTC_A = 1;

SMARTBUFF_CONST_AUTOSOUND = "Deathbind Sound";
--SMARTBUFF_CONST_AUTOSOUND = "TaxiNodeDiscovered";
--SMARTBUFF_CONST_AUTOSOUND = "GLUECREATECHARACTERBUTTON";

SMARTBUFF_CONST_GROUP = "GROUP";
SMARTBUFF_CONST_SELF  = "SELF";
SMARTBUFF_CONST_TRACK = "TRACK";
SMARTBUFF_CONST_WEAPON = "WEAPON";
SMARTBUFF_CONST_INV = "INVENTORY";

SMARTBUFF_BUFFTEXT = " Test";
 
-------------------------------------------------------------------------------
-- English localization (Default)
-------------------------------------------------------------------------------

-- Bindings
BINDING_NAME_SMARTBUFF_BIND_TRIGGER = "Trigger";
BINDING_NAME_SMARTBUFF_BIND_TARGET  = "Target";
BINDING_NAME_SMARTBUFF_BIND_OPTIONS = "Option menu";

-- Druid
SMARTBUFF_DRUID = { };
SMARTBUFF_DRUID[1] = {"Mark of the Wild", 30, SMARTBUFF_CONST_GROUP, {1,10,20,30,40,50,60}, nil, "Gift of the Wild", 60, {50,60}, {"Wild Berries","Wild Thornroot"}};
SMARTBUFF_DRUID[2] = {"Thorns", 10, SMARTBUFF_CONST_GROUP, {6,14,24,34,44,54}, "MAGE;PRIEST;WARLOCK"};
SMARTBUFF_DRUID[3] = {"Omen of Clarity", 5, SMARTBUFF_CONST_SELF};
SMARTBUFF_DRUID[4] = {"Barkskin", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_DRUID_CAT = "Cat Form";
SMARTBUFF_DRUID_TRACK = "Track Humanoids";

-- Mage
SMARTBUFF_MAGE = { };
SMARTBUFF_MAGE[1] = {"Arcane Intellect", 30, SMARTBUFF_CONST_GROUP, {1,14,28,42,56}, "#NOMANA#", "Arcane Brilliance", 60, {56}, {"Arcane Powder"}};
SMARTBUFF_MAGE[2] = {"Ice Armor", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[3] = {"Frost Armor", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[4] = {"Mage Armor", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[5] = {"Dampen Magic", 10, SMARTBUFF_CONST_GROUP, {12,24,36,48,60}};
SMARTBUFF_MAGE[6] = {"Amplify Magic", 10, SMARTBUFF_CONST_GROUP, {18,30,42,54}};
SMARTBUFF_MAGE_PATTERN = {"%a+ Armor$"};

-- Priest
SMARTBUFF_PRIEST = { };
SMARTBUFF_PRIEST[1] = {"Power Word: Fortitude", 30, SMARTBUFF_CONST_GROUP, {1,12,24,36,48,60}, nil, "Prayer of Fortitude", 60, {48,60}, {"Holy Candle","Sacred Candle"}};
SMARTBUFF_PRIEST[2] = {"Shadow Protection", 10, SMARTBUFF_CONST_GROUP, {30,42,56}, nil, "Prayer of Shadow Protection", 20, {56}, {"Sacred Candle"}};
SMARTBUFF_PRIEST[3] = {"Inner Fire", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[4] = {"Divine Spirit", 30, SMARTBUFF_CONST_GROUP, {40,42,54,60}, "#NOMANA#", "Prayer of Spirit", 60, {60}, {"Sacred Candle"}};
SMARTBUFF_PRIEST[5] = {"Power Word: Shield", 0.5, SMARTBUFF_CONST_SELF, {6,12,18,24,30,36,42,48,54,60}};
SMARTBUFF_PRIEST[6] = {"Fear Ward", 10, SMARTBUFF_CONST_GROUP, {20}};
SMARTBUFF_PRIEST[7] = {"Elune's Grace", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[8] = {"Feedback", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[9] = {"Shadowguard", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[10] = {"Touch of Weakness", 10, SMARTBUFF_CONST_SELF};

-- Warlock
SMARTBUFF_WARLOCK = { };
SMARTBUFF_WARLOCK[1] = {"Demon Armor", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[2] = {"Demon Skin", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[3] = {"Unending Breath", 10, SMARTBUFF_CONST_GROUP, {16}};
SMARTBUFF_WARLOCK[4] = {"Detect Greater Invisibility", 10, SMARTBUFF_CONST_GROUP, {50}};
SMARTBUFF_WARLOCK[5] = {"Detect Invisibility", 10, SMARTBUFF_CONST_GROUP, {38}};
SMARTBUFF_WARLOCK[6] = {"Detect Lesser Invisibility", 10, SMARTBUFF_CONST_GROUP, {26}};
SMARTBUFF_WARLOCK[7] = {"Soul Link", 0, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK_PATTERN = {"^Demon %a+", "^Detect %a+ Invisibility$"};

-- Hunter
SMARTBUFF_HUNTER = { };
SMARTBUFF_HUNTER[1] = {"Trueshot Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[2] = {"Rapid Fire", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[3] = {"Aspect of the Hawk", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[4] = {"Aspect of the Monkey", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[5] = {"Aspect of the Wild", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[6] = {"Aspect of the Beast", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER_PATTERN = {"^Aspect of"};

-- Shaman
SMARTBUFF_SHAMAN = { };
SMARTBUFF_SHAMAN[1] = {"Lightning Shield", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[2] = {"Rockbiter Weapon", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[3] = {"Frostbrand Weapon", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[4] = {"Flametongue Weapon", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[5] = {"Windfury Weapon", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[6] = {"Water Breathing", 10, SMARTBUFF_CONST_GROUP, {22}};

-- Warrior
SMARTBUFF_WARRIOR = { };
SMARTBUFF_WARRIOR[1] = {"Battle Shout", 2, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[2] = {"Berserker Rage", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[3] = {"Bloodrage", 0.165, SMARTBUFF_CONST_SELF};

-- Rogue
SMARTBUFF_ROGUE = { };
SMARTBUFF_ROGUE[1] = {"Detect Traps", 3, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[2] = {"Blade Flurry", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[3] = {"Evasion", 0.2, SMARTBUFF_CONST_SELF};

-- Paladin
SMARTBUFF_PALADIN = { };
SMARTBUFF_PALADIN[1] = {"Righteous Fury", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[2] = {"Holy Shield", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[3] = {"Devotion Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[4] = {"Retribution Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[5] = {"Concentration Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[6] = {"Shadow Resistance Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[7] = {"Frost Resistance Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[8] = {"Fire Resistance Aura", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[9] = {"Sanctity Aura", -1, SMARTBUFF_CONST_SELF};


-- Tracking
SMARTBUFF_TRACKING = { };
SMARTBUFF_TRACKING[1]  = {"Find Minerals", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[2]  = {"Find Herbs", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[3]  = {"Find Treasure", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[4]  = {"Track Humanoids", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[5]  = {"Track Beasts", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[6]  = {"Track Undead", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[7]  = {"Track Hidden", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[8]  = {"Track Elementals", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[9]  = {"Track Demons", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[10] = {"Track Giants", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[11] = {"Track Dragonkin", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[12] = {"Sense Demons", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[13] = {"Sense Undead", -1, SMARTBUFF_CONST_TRACK};

-- Creature type
SMARTBUFF_HUMANOID  = "Humanoid";
SMARTBUFF_DEMON     = "Demon";
SMARTBUFF_BEAST     = "Beast";
SMARTBUFF_DEMONTYPE = "Imp";

-- Mount
SMARTBUFF_MOUNT = "Increases speed by (%d+)%%.";

-- Options Frame Text
SMARTBUFF_OFT                = "SmartBuff On/Off";
SMARTBUFF_OFT_MENU           = "Show/Hide options menu";
SMARTBUFF_OFT_TARGET         = "Buffs the selected target";
SMARTBUFF_OFT_AUTO           = "Reminder";
SMARTBUFF_OFT_AUTOTIMER      = "Check timer";
SMARTBUFF_OFT_AUTOCOMBAT     = "in combat";
SMARTBUFF_OFT_AUTOCHAT       = "Chat";
SMARTBUFF_OFT_AUTOSPLASH     = "Splash";
SMARTBUFF_OFT_AUTOSOUND      = "Sound";
SMARTBUFF_OFT_AUTOREST       = "Disable in cities";
SMARTBUFF_OFT_HUNTERPETS     = "Buff Hunter pets";
SMARTBUFF_OFT_WARLOCKPETS    = "Buff Warlock pets";
SMARTBUFF_OFT_ARULES         = "Advance rules";
SMARTBUFF_OFT_GRP            = "Raid Subgroups to buff";
SMARTBUFF_OFT_SUBGRPCHANGED  = "Open options menu, when\nsubgroup has changed";
SMARTBUFF_OFT_BUFFS          = "Buffs";
SMARTBUFF_OFT_TARGET         = "Buffs the selected target";
SMARTBUFF_OFT_DONE           = "Done";
SMARTBUFF_OFT_APPLY          = "Apply";
SMARTBUFF_OFT_GRPBUFFSIZE    = "Group size";
SMARTBUFF_OFT_MESSAGES       = "Disable messages";
SMARTBUFF_OFT_MSGNORMAL      = "normal";
SMARTBUFF_OFT_MSGWARNING     = "warning";
SMARTBUFF_OFT_MSGERROR       = "error";
SMARTBUFF_OFT_HIDEMMBUTTON   = "Hide minimap-button";
SMARTBUFF_OFT_REBUFFTIMER    = "Rebuff Timer";
SMARTBUFF_OFT_SELFONLY       = "Self only";

-- Options Frame Tooltip Text
SMARTBUFF_OFTT               = "Toggles SmartBuff On/Off";
SMARTBUFF_OFTT_AUTO          = "Toggles the buff reminder On/Off";
SMARTBUFF_OFTT_AUTOTIMER     = "Delay in seconds between two checks.";
SMARTBUFF_OFTT_AUTOCOMBAT    = "Run the check also in combat.";
SMARTBUFF_OFTT_AUTOCHAT      = "Displays missing buffs as chat message.";
SMARTBUFF_OFTT_AUTOSPLASH    = "Displays missing buffs as splash message\nin the middle of the screen.";
SMARTBUFF_OFTT_AUTOSOUND     = "Plays a sound if buffs are missing.";
SMARTBUFF_OFTT_AUTOREST      = "Disable reminder in capital cities";
SMARTBUFF_OFTT_HUNTERPETS    = "Buff the Hunter pets as well.";
SMARTBUFF_OFTT_WARLOCKPETS   = "Buff the Warlock pets as well, except the " .. SMARTBUFF_DEMONTYPE .. ".";
SMARTBUFF_OFTT_ARULES        = "Does not cast:\n- Thorns on Mages, Priests and Warlocks\n- Arcane Intellect on units without Mana\n- Divine Spirit on units without Mana";
SMARTBUFF_OFTT_SUBGRPCHANGED = "Automatically opens the SmartBuff options menu,\nwhen you have changed the subgroup.";
SMARTBUFF_OFTT_GRPBUFFSIZE   = "How many players missing the groupbuff and have to be in\nthe group, that the groupbuff will casted.";
SMARTBUFF_OFTT_HIDEMMBUTTON  = "Hides the SmartBuff minimap-button.";
SMARTBUFF_OFTT_REBUFFTIMER   = "How many seconds before a buff expires,\nthe reminder should alert you.\n0 = Deactivated";
SMARTBUFF_OFTT_SELFONLY      = "Buffs only your character.\nIt does not matter if you are in\na party or raid, it buffs only you.";

-- Messages
SMARTBUFF_MSG_LOADED         = "loaded";
SMARTBUFF_MSG_NOTLOADED      = "not loaded: Player is not a Druid/Mage/Priest/Warlock/Hunter";
SMARTBUFF_MSG_DISABLED       = "Smart Buff is disabled!";
SMARTBUFF_MSG_SUBGROUP       = "You've joined a new subgroup, please check the options!";
SMARTBUFF_MSG_NOTHINGTODO    = "Nothing to do";
SMARTBUFF_MSG_BUFFED         = "buffed";
SMARTBUFF_MSG_OOR            = "is out of range to buff!";
SMARTBUFF_MSG_CD             = "has cooldown!";
SMARTBUFF_MSG_CHAT           = "not possible in chat mode!";
SMARTBUFF_MSG_SHAPESHIFT     = "Casting is not allowed in shapeshift form!";
SMARTBUFF_MSG_NOACTIONSLOT   = "needs a slot in an actionbar to working properly!";
SMARTBUFF_MSG_GROUP          = "Group";
SMARTBUFF_MSG_NEEDS          = "needs";
SMARTBUFF_MSG_OOM            = "Not enough mana/rage/energy!";
SMARTBUFF_MSG_STOCK          = "Actual stock of";
SMARTBUFF_MSG_NOREAGENT      = "Out of reagent:";
SMARTBUFF_MSG_DEACTIVATED    = "deactivated!";
SMARTBUFF_MSG_REBUFF         = "Rebuff";
SMARTBUFF_MSG_LEFT           = "left";
