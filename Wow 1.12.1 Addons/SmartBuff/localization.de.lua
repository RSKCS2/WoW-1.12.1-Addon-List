-------------------------------------------------------------------------------
-- German localization
-------------------------------------------------------------------------------

if (GetLocale() == "deDE") then
	
-- Bindings
BINDING_NAME_SMARTBUFF_BIND_TRIGGER = "Trigger";
BINDING_NAME_SMARTBUFF_BIND_TARGET  = "Ziel";
BINDING_NAME_SMARTBUFF_BIND_OPTIONS = "Optionen";

-- Druid
SMARTBUFF_DRUID = { };
SMARTBUFF_DRUID[1] = {"Mal der Wildnis", 30, SMARTBUFF_CONST_GROUP, {1,10,20,30,40,50,60}, nil, "Gabe der Wildnis", 60, {50,60}, {"Wilde Beeren","Wilder Dornwurz"}};
SMARTBUFF_DRUID[2] = {"Dornen", 10, SMARTBUFF_CONST_GROUP, {6,14,24,34,44,54}, "MAGE;PRIEST;WARLOCK"};
SMARTBUFF_DRUID[3] = {"Omen der Klarsicht", 5, SMARTBUFF_CONST_SELF};
SMARTBUFF_DRUID[4] = {"Baumrinde", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_DRUID_CAT = "Katzengestalt";
SMARTBUFF_DRUID_TRACK = "Humanoide aufsp\195\188ren";

-- Mage
SMARTBUFF_MAGE = { };
SMARTBUFF_MAGE[1] = {"Arkane Intelligenz", 30, SMARTBUFF_CONST_GROUP, {1,14,28,42,56}, "#NOMANA#", "Arkane Brillanz", 60, {56}, {"Arkanes Pulver"}};
SMARTBUFF_MAGE[2] = {"Eisr\195\188stung", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[3] = {"Frostr\195\188stung", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[4] = {"Magische R\195\188stung", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_MAGE[5] = {"Magied\195\164mpfer", 10, SMARTBUFF_CONST_GROUP, {12,24,36,48,60}};
SMARTBUFF_MAGE[6] = {"Magie verst\195\164rken", 10, SMARTBUFF_CONST_GROUP, {18,30,42,54}};
SMARTBUFF_MAGE_PATTERN = {"r\195\188stung$"};

-- Priest
SMARTBUFF_PRIEST = { };
SMARTBUFF_PRIEST[1] = {"Machtwort: Seelenst\195\164rke", 30, SMARTBUFF_CONST_GROUP, {1,12,24,36,48,60}, nil, "Gebet der Seelenst\195\164rke", 60, {48,60}, {"Heilige Kerze","Hochheilige Kerze"}};
SMARTBUFF_PRIEST[2] = {"Schattenschutz", 10, SMARTBUFF_CONST_GROUP, {30,42,56}, nil, "Gebet des Schattenschutzes", 20, {56}, {"Hochheilige Kerze"}};
SMARTBUFF_PRIEST[3] = {"Inneres Feuer", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[4] = {"G\195\182ttlicher Willen", 30, SMARTBUFF_CONST_GROUP, {40,42,54,60}, "#NOMANA#", "Gebet der Willenskraft", 60, {60}, {"Hochheilige Kerze"}};
SMARTBUFF_PRIEST[5] = {"Machtwort: Schild", 0.5, SMARTBUFF_CONST_SELF, {6,12,18,24,30,36,42,48,54,60}};
SMARTBUFF_PRIEST[6] = {"Furcht-Zauberschutz", 10, SMARTBUFF_CONST_GROUP, {20}};
SMARTBUFF_PRIEST[7] = {"Elunes Anmut", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[8] = {"R\195\188ckkopplung", 0.25, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[9] = {"Schattenwache", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_PRIEST[10] = {"Ber\195\188hrung der Schw\195\164che", 10, SMARTBUFF_CONST_SELF};

-- Warlock
SMARTBUFF_WARLOCK = { };
SMARTBUFF_WARLOCK[1] = {"D\195\164monenr\195\188stung", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[2] = {"D\195\164monenhaut", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK[3] = {"Unendlicher Atem", 10, SMARTBUFF_CONST_GROUP, {16}};
SMARTBUFF_WARLOCK[4] = {"Gro\195\159e Unsichtbarkeit entdecken", 10, SMARTBUFF_CONST_GROUP, {50}};
SMARTBUFF_WARLOCK[5] = {"Unsichtbarkeit entdecken", 10, SMARTBUFF_CONST_GROUP, {38}};
SMARTBUFF_WARLOCK[6] = {"Geringe Unsichtbarkeit entdecken", 10, SMARTBUFF_CONST_GROUP, {26}};
SMARTBUFF_WARLOCK[7] = {"Seelenverbindung", 0, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARLOCK_PATTERN = {"^D\195\164monen%a+", "Unsichtbarkeit entdecken$"};

-- Hunter
SMARTBUFF_HUNTER = { };
SMARTBUFF_HUNTER[1] = {"Aura des Volltreffers", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[2] = {"Schnellfeuer", 0.2, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[3] = {"Aspekt des Falken", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[4] = {"Aspekt des Affen", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[5] = {"Aspekt der Wildnis", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER[6] = {"Aspekt des Wildtiers", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_HUNTER_PATTERN = {"^Aspekt de%a %a+"};

-- Shaman
SMARTBUFF_SHAMAN = { };
SMARTBUFF_SHAMAN[1] = {"Blitzschlagschild", 10, SMARTBUFF_CONST_SELF};
SMARTBUFF_SHAMAN[2] = {"Felsbei\195\159erwaffe", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[3] = {"Waffe des Frostbrands", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[4] = {"Waffe der Flammenzunge", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[5] = {"Waffe des Windfurors", 5, SMARTBUFF_CONST_WEAPON};
SMARTBUFF_SHAMAN[6] = {"Wasseratmung", 10, SMARTBUFF_CONST_GROUP, {22}};

-- Warrior
SMARTBUFF_WARRIOR = { };
SMARTBUFF_WARRIOR[1] = {"Schlachtruf", 2, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[2] = {"Berserkerwut", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_WARRIOR[3] = {"Blutrausch", 0.165, SMARTBUFF_CONST_SELF};

-- Rogue
SMARTBUFF_ROGUE = { };
SMARTBUFF_ROGUE[1] = {"Fallen entdecken", 3, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[2] = {"Klingenwirbel", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_ROGUE[3] = {"Entrinnen", 0.2, SMARTBUFF_CONST_SELF};
--SMARTBUFF_ROGUE[4] = {"Sofort wirkendes Gift", 30, SMARTBUFF_CONST_INV};


-- Paladin
SMARTBUFF_PALADIN = { };
SMARTBUFF_PALADIN[1] = {"Zorn der Gerechtigkeit", 30, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[2] = {"Heiliger Schild", 0.165, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[3] = {"Aura der Hingabe", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[4] = {"Aura der Vergeltung", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[5] = {"Aura der Konzentration", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[6] = {"Aura des Schattenwiderstands", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[7] = {"Aura des Frostwiderstands", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[8] = {"Aura des Feuerwiderstands", -1, SMARTBUFF_CONST_SELF};
SMARTBUFF_PALADIN[9] = {"Aura der Heiligkeit", -1, SMARTBUFF_CONST_SELF};


-- Tracking
SMARTBUFF_TRACKING = { };
SMARTBUFF_TRACKING[1]  = {"Mineraliensuche", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[2]  = {"Kr\195\164utersuche", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[3]  = {"Schatzsucher", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[4]  = {"Humanoide aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[5]  = {"Wildtiere aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[6]  = {"Untote aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[7]  = {"Verborgenes aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[8]  = {"Elementare aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[9]  = {"D\195\164monen aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[10] = {"Riesen aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[11] = {"Drachkin aufsp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[12] = {"D\195\164monen Sp\195\188ren", -1, SMARTBUFF_CONST_TRACK};
SMARTBUFF_TRACKING[13] = {"Untote Sp\195\188ren", -1, SMARTBUFF_CONST_TRACK};

-- Creature type
SMARTBUFF_HUMANOID  = "Humanoid";
SMARTBUFF_DEMON     = "D\195\164mon";
SMARTBUFF_BEAST     = "Wildtier";
SMARTBUFF_DEMONTYPE = "Wichtel";

-- Mount
SMARTBUFF_MOUNT = "Erh\195\182ht Tempo um (%d+)%%.";

-- Options Frame Text
SMARTBUFF_OFT                = "Smart Buff An/Aus";
SMARTBUFF_OFT_MENU           = "Zeige/verberge das Optionen-Men\195\188";
SMARTBUFF_OFT_AUTO           = "Erinnerung";
SMARTBUFF_OFT_AUTOTIMER      = "Check Timer";
SMARTBUFF_OFT_AUTOCOMBAT     = "im Kampf";
SMARTBUFF_OFT_AUTOCHAT       = "Chat";
SMARTBUFF_OFT_AUTOSPLASH     = "Splash";
SMARTBUFF_OFT_AUTOSOUND      = "Ton";
SMARTBUFF_OFT_AUTOREST       = "Unterdr\195\188ckt in St\195\164dten";
SMARTBUFF_OFT_HUNTERPETS     = "J\195\164ger Pets buffen";
SMARTBUFF_OFT_WARLOCKPETS    = "Hexer Pets buffen";
SMARTBUFF_OFT_ARULES         = "Zus\195\164tzliche Regeln";
SMARTBUFF_OFT_GRP            = "Raid Sub-Gruppen zum Buffen";
SMARTBUFF_OFT_SUBGRPCHANGED  = "\195\150ffnet automatisch das Men\195\188\nbei Sub-Gruppen wechsel";
SMARTBUFF_OFT_BUFFS          = "Buffs";
SMARTBUFF_OFT_TARGET         = "Bufft das anvisierte Ziel";
SMARTBUFF_OFT_DONE           = "Fertig";
SMARTBUFF_OFT_APPLY          = "\195\156bernehmen";
SMARTBUFF_OFT_GRPBUFFSIZE    = "Gruppengr\195\182sse";
SMARTBUFF_OFT_MESSAGES       = "Unterdr\195\188cke Meldungen";
SMARTBUFF_OFT_MSGNORMAL      = "Normal";
SMARTBUFF_OFT_MSGWARNING     = "Warnung";
SMARTBUFF_OFT_MSGERROR       = "Fehler";
SMARTBUFF_OFT_HIDEMMBUTTON   = "Verberge Minimap-Knopf";
SMARTBUFF_OFT_REBUFFTIMER    = "Rebuff Timer";
SMARTBUFF_OFT_SELFONLY       = "Nur mich";

-- Options Frame Tooltip Text
SMARTBUFF_OFTT               = "Schaltet SmartBuff An/Aus";
SMARTBUFF_OFTT_AUTO          = "Schaltet die Erinnerung an fehlende Buffs An/Aus";
SMARTBUFF_OFTT_AUTOTIMER     = "Verz\195\182gerung in Sekunden zwischen zwei Checks.";
SMARTBUFF_OFTT_AUTOCOMBAT    = "Check auch w\195\164hrend dem Kampf durchf\195\188hren.";
SMARTBUFF_OFTT_AUTOCHAT      = "Zeigt fehlende Buffs als Chat-Meldung an.";
SMARTBUFF_OFTT_AUTOSPLASH    = "Zeigt fehlende Buffs als Splash-Meldung\nin der mitte des Bildschirms an.";
SMARTBUFF_OFTT_AUTOSOUND     = "Bei fehlende Buffs erklingt ein Ton.";
SMARTBUFF_OFTT_AUTOREST      = "Erinnerung wird in den\nHauptst\195\164dten unterdr\195\188ckt.";
SMARTBUFF_OFTT_HUNTERPETS    = "Bufft die J\195\164ger Pets auch.";
SMARTBUFF_OFTT_WARLOCKPETS   = "Bufft die Hexer Pets auch,\nausser den " .. SMARTBUFF_DEMONTYPE .. ".";
SMARTBUFF_OFTT_ARULES        = "Bufft nicht:\n- Dornen auf Magier, Priester und Hexer\n- Arkane Intelligenz auf Klassen ohne Mana\n- G\195\182ttlicher Willen auf Klassen ohne Mana";
SMARTBUFF_OFTT_SUBGRPCHANGED = "\195\150ffnet automatisch das SmartBuff Men\195\188,\nwenn du die Sub-Gruppe gewechselt hast.";
SMARTBUFF_OFTT_GRPBUFFSIZE   = "Anzahl Spieler die in der Gruppe sein m\195\188ssen\nund den Gruppen-Buff nicht haben,\ndamit der Gruppen-Buff verwendet wird.";
SMARTBUFF_OFTT_HIDEMMBUTTON  = "Verbirgt den SmartBuff Minimap-Knopf.";
SMARTBUFF_OFTT_REBUFFTIMER   = "Wieviele Sekunden vor Ablauf der Buffs,\nsoll daran erinnert werden.\n0 = Deaktivert";
SMARTBUFF_OFTT_SELFONLY      = "Bufft nur den eigenen Charakter,\negal ob in einer Party oder im Raid.";

-- Messages
SMARTBUFF_MSG_LOADED         = "geladen";
SMARTBUFF_MSG_NOTLOADED      = "nicht geladen: Spieler ist kein Druide/Magier/Priester/Hexenmeister/J\195\164ger";
SMARTBUFF_MSG_DISABLED       = "Smart Buff ist deaktiviert";
SMARTBUFF_MSG_SUBGROUP       = "Du hast die Subgruppe gewechselt, bitte \195\188berpr\195\188fe die Einstellungen";
SMARTBUFF_MSG_NOTHINGTODO    = "Nichts zu buffen";
SMARTBUFF_MSG_BUFFED         = "gebuffed";
SMARTBUFF_MSG_OOR            = "ist ausser Reichweite zum Buffen";
SMARTBUFF_MSG_CD             = "hat noch Cooldown";
SMARTBUFF_MSG_CHAT           = "nicht m\195\182glich \195\188ber Chat-Befehl";
SMARTBUFF_MSG_SHAPESHIFT     = "In Verwandlung kann nicht gebufft werden";
SMARTBUFF_MSG_NOACTIONSLOT   = "muss in einem Slot auf der Aktionsleiste sein, dass es funktioniert!";
SMARTBUFF_MSG_GROUP          = "Gruppe";
SMARTBUFF_MSG_NEEDS          = "ben\195\182tigt";
SMARTBUFF_MSG_OOM            = "Zuwenig Mana/Wut/Energie!";
SMARTBUFF_MSG_STOCK          = "Aktueller Bestand";
SMARTBUFF_MSG_NOREAGENT      = "Zuwenig";
SMARTBUFF_MSG_DEACTIVATED    = "deaktiviert!";
SMARTBUFF_MSG_REBUFF         = "ReBuff";
SMARTBUFF_MSG_LEFT           = "\195\188brig";

end
