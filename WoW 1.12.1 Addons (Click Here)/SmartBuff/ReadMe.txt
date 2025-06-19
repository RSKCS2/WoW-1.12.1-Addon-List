SmartBuff
Created by Aeldra (EU-Proudmoore)


***********************************************************************


Smart Buff is a buff addon, to cast buffs ease and quickly. All classes are supported. Bind a key (or create a macro '/sb') and it checks if you, a party/raid member, also hunter and warlock pets, needs your buff and cast it. Use the options menu to configure it you like, as example: buffs, raid subgroups, pets, etc.

Run the mod when ever you wish, if nothing is buffed, there is no penalty or cool down.

Features:
- Supports all classes
- Supports EN/DE/FR clients
- Checks buffs and rebuff you, raid/party members, raid/party pets
- Supports group buffs 'Gift of the Wild'/'Arcane Brilliance'/'Prayer of Fortitude'/'Prayer of Spirit', incl. group size and reagence check
- Supports self buffs
- Supports character level based buffs
- Supports tracking abilities
- Advance rules (e.g. Thorns or units without mana)
- Reminder if a buff is missing (Splash/chat/sound)
- Only one key is needed
- Fast and easy to use

Usage:
Type /sbm for options menu in game
Type /sb [command] or /smartbuff [command] in game
- cast buff
toggle - Toggles Smart Buff On/Off
menu - Show/hide options menu
target - buffs the current target

Please send me a mail or write a comment if you discover Bugs or have Suggestions.

Contact:
aeldra@sonnenkinder.org


***********************************************************************


Beschreibung:
Smart Buff ist ein Buff Addon, dass das (Re)Buffen so einfach und schnell wie möglich von statten geht. Es werden alle Klassen unterstützt. Auf Knopfdruck (Bind oder Macro erstelle ein Macro '/sb') wird der Spieler/Gruppe/Raid Sub-Gruppe, auch die Hexer/Jäger Pets, überprüft und wenn nötig gebufft. Über das Optionen Menü kann alles nötige eingestellt werden, wie z.B. Buffs, die zu buffenden Raid Sub-Gruppen, Buffen der Pets, etc.

Features:
- Unterstützt alle Klassen
- Unterstützt EN/DE/FR Clients
- Überprüft die Buffs und bufft dich, Raid/Party Mitglieder, Raid/Party Pets
- Unterstützt Gruppen-Buffs 'Gabe der Wildnis'/'Arkane Brillanz'/'Gebet der Seelenstärke'/'Gebet der Willenskraft', inkl. Gruppengrösse und Reagenzien Check
- Unterstützt eigen Buffs
- Unterstützt vom Charakter-Level abhängige Buffs
- Unterstützt die Suche nach Kräutern, Erzen, etc.
- Erweiterte Regeln (z.B. Dornen oder Ziele ohne Mana)
- Erinnerung, falls bei jemandem ein Buff fehlt (Splash/Chat/Ton)
- Nur ein Knopfdruck :)
- Schnell und einfach

Gebrauch:
Tippt /sbm für das Option-Menü in game
Tippt /sb [command] oder /smartbuff [command] in game
- um zu buffen
toggle - Toggles Smart Buff An/Aus
menu - Öffnet/versteckt das Options-Menü
target - bufft das anvisierte Zeil

Bei Fehler oder Verbesserungsvörschläge meldet euch hier oder schickt mir eine Email.

Kontakt:
aeldra@sonnenkinder.org


***********************************************************************


Changes: 
Rev     Date        Description
------  ----------  -----------------------
1.10d   2006/04/08  ReBuff timer added (starts at the first buff you cast. Time left of buffs you/party/raid already had, when you logged in or changed group can not detected)
                    Added new buffs: Priest (Prayer of Shadow Protection), Hunter (Rapid Fire)
                    Added new option: Rebuff timer, reminds you (0 - 300sec. 0 = timer disabled) before a buff is running out
                    Added new option: Hide minimap button
                    Added new option: Buff only yourself
                    Fixed Shaman weapon buffs
                    Fixed french localization
                    Fixed when options frame open, keyboard is not locked

1.10c   2006/04/04  Added new buffs: Druid (Barkskin), Priest (Power Word: Shield, but only as self cast), Warlock (Soul Link)
                    Added Shaman support (Lightning Shield, Rockbiter/Frostbrand/Flametongue/Windfury Weapon, Water Breathing)
                    Added basic Warrior support (Battle Shout, Berserker Rage, Bloodrage)
                    Added basic Rogue support (Detect Traps, Blade Flurry, Evasion)
                    Added basic Paladin support (Righteous Fury, Holy Shield, all Auras)
                    Added option: Disable messages (normal/warning/error)
                    Right click the minimap button disable/enable SmartBuff
                    Improved cooldown handling
                    Fixed french localization
                    Fixed Minimap bug
                    Fixed tracking bug for druids in cat form
                    
1.10b   2006/04/01  Added new buffs: Mage (Dampen Magic, Amplify Magic)
                    Added new tracking abilities (all)
                    Added Minimap button
                    French localization (Big thanks to Sasmira)
                    New options menu

1.10a   2006/03/30  Added new buffs: Priest (Touch of Weakness, Prayer of Spirit), Warlock (all Detect ... Invisibility)
                    Options frame close on ESC key press
                    Improved buff detection

1.10    2006/03/29  Fixes for patch 1.10

1.10    2006/03/27  Added reagence check for all group buffs
beta4

1.10    2006/03/21  Added advance rules checkbox in the option frame (does not cast: Thorns on Mages/Priests/Warlocks, Arcane Intellect/Divine Spirit on units without Mana) 
beta3               Bugfix for resting check, while you are resting (in capital cities or taverns) the reminder is disabled, except you are pvp flagged
                    Bugfix for Warlock spell "Unending Breath"

1.10b   2006/03/15  Added support for Hunters and Warlocks
beta2               Added new buffs: Priest (race buffs), Mages (all armors)
                    Added mana check
                    While you are resting (in capital cities or taverns) the reminder is disabled

1.10    2006/03/10  REMOVED Autobuff option, during restriction from blizzard in patch 1.10
beta                Added Reminder if a buff is missing, displays a chat/splash message or plays a sound
                    Added character level based casting, it casts the highst possible rank for lower characters
                    Added basic line of sight check (buff needs to be on an actionbar), includes a blacklist
                    Added group buff check, if 4 or more in a group and 4 or more have not the buff, it casts "Gift of the Wild"/"Arcane Brilliance"/"Prayer of Fortitude"
                    Added new keybind/commmand to buff the current target (keybindings changed, please rebind keys)
                    Added new buffs: Priest "Divine Spirit", Druid "Omen of Clarity"
                    Druid buff "Thorns" is no longer casted on Priests/Mages/Warlocks
                    Added tooltips
                    Movable option menu
                    Save variables per character
                    Improved buff detection 
                    Bugfix for Druids in Shapeshift (Travelforms)

1.4     2006/02/21  Bugfix for Druids in Shapeshift

1.3     2006/02/01  Bugfix for messages in autobuff mode
                    check method improved
                    new buffs added (mage/priest)

1.2     2006/01/25  Bugfix druid thorns buff

1.1     2006/01/17  Autobuff (on movement) option added
                    Autobuff timer added
                    Improved buff detection

1.0     2005/11/25  Initial version of SmartBuff
