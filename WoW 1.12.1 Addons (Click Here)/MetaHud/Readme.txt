This addon adds a HUD to your UI, showing all the information normally displayed by the Player and Target frames and more. 
Always thought it was a shame that Drathal's HUD was given up on the way it was so, I have taken the core of that code and MetaMorphed it. :p
Added some features which I thought were pretty useful, and removed some of the excess stuff. Decided to release it, as no doubt there are others who enjoyed this as much as me.
Full credit to the original author of course, for the initial code.

Features:
=========
Health/Mana Bars colour levels.
All Bars are animated.
Shows Level, Name, Class and Elite/Boss, Pet, NPC.
4 Alpha Settings for: Combat/Target selected/No Target/Player is regging.
4 Displaymodes for Health/Mana.
Many positioning and Scaling Options.
Hide Blizzard Player/Targetframe.
Target Menu with Leftclick on Targetname.
Player Menu with Rightclick on Playername.
Castingbar with Cast-time.
Option to hide Petbars.
Option to hide Targetbars/Text.
Load-on-Demand configuration display.
Target's Target display - click to switch to that target.
Aggro alert - audible and visual warnings.
Target PvP status.
Self PvP status.
Status icons for Rested, Combat, Raid leader, and Loot Master.
Target distance display.
Support for Mobhealth, Mobinfo2, and Mobhealth2.
FlightMap support.
myAddons Support.
FuBar Support.

SLASH COMMANDS
==============
/MetaHud - Info
/MetaHud Menu - Display Options
/MetaHud Hud - Display HUD

CLICKY BITS
===========
Minimap icon:
	LeftClick: Display Hud with self targeted.
	RightClick: Display main options.
	
Hud target text:
	LeftClick: Target menu.
	RightClick: Player/Raid menu
	CTRL+Click: QuickMenu with quick options.
	
Hud target's target text:
	LeftClick: Switch to target's target.
	
Hud FlightTimer text:
	LeftClick to insert flight details into open message box.

PROFILES
========
To set and save a profile, set up the Hud to your preferences. Type in the name you want the profile saved as, and click on Save.
The profile will be immediately available from the Profile dropdown menu. Profiles can be selected at any time from the dropdown.

To edit an existing profile, load the profile, make any adjustments needed, type the profile name into the edit box, and then Save.
Note: The names are case sensitive so, ensure that the name you type into the edit box matches the profile name exactly.

A profile is deleted by selecting the profile name from the dropdown, and then pressing Delete.
The 'Default' profile is fixed, and cannot be deleted or edited.

VERSION HISTORY
===============
27 August 2006 - v11200-1
	Initial Release

28 August 2006 - v11200-2
	Fixed error when selecting out of range party member.
	Range frame no longer takes mouse clicks.
	ToT frame no longer takes mouse clicks when inactive.
	Hud now correctly displays creature type when required.

02 September 2006 - v11200-3
	MetaHud is now based on the later Dhud Beta code, giving more functionality and options.
	Reworked Guild display to show seperately below the target name.
	Added options to toggle Raid Leader and MasterLooter displays.
	Added option to toggle between Elite text or symbol output.
	Added health bar to Target's Target display.
	Added option to toggle the Aggro alert sound.
	Added sound selection option. Select from four default sounds, or custom user sound.
	Added German and French localisation files. Just needs someone to translate them.
	NOTE: Recommend fresh install to remove any unwanted files.

05 September 2006 - v11200-4
	Guild display option now updates instantly when toggled.
	Fixed DruidBar text values not updating when shape-shifted.
	Reworked Target's target display and health bar for reliability.
	Status icons now display on left when 'Player on left' layout is selected.
	Added font selection option. Select from four default fonts, or custom user font.
	Added FlightMap support. Option to display timer in HUD or standard display.
	Flight display allows click to insert flight details into message edit box.

06 September 2006 - v11200-5
	Made slight change to FlightTimer display. Counter would sometimes be hidden with larger text.
	Finally pinned down the ToT health bar problem. Due to expired timer not resetting the display.
	Reworked party/raid routines to work correctly for all events.
	Added a QuickMenu to the Hud. CTRL-Click on target name to display quick options.
	Updated the Readme.
	Wanted to get these bits out quick, as the further planned changes will take a bit of time.

10 September 2006 - v11200-6
	Reset Elite icon to original position.
	Corrected a few errors in initial code.
	Icon for Rare mobs will now display correctly.
	Main Options display can now also be reached via the Hud QuickMenu.
	Reworked layouts and routines to give better overall efficiency.
	All text displays and icons will now respond to specific alpha settings.
	Added texture selection option. Select from five different bar textures.

14 September 2006 - v11200-7
	Fixed error when selecting Rare MoB.
	Fixed overlapping of status icons on rare occasions.
	...(Most likely due to some events not being flagged in this patch. Mainly BG exits).
	Fixed FlightMap's timer bar appearing as a column on certain flights.
	Hud is now fully available when in ghost form.
	Added full alpha text option. Set this to show full text alpha, regardless of Hud alpha.
	Added Profiles to MetaHud Options. 'Default' profile replaces the old Reset functions.
	...(See the Readme for usage).

15 September 2006 - v11200-8
	Fixed error when FlightMap addon wasn't installed.
	Fixed startup error on new install. Put changed variable checking routine in a little too early.
	...Always the simple things that are overlooked sometimes :(
