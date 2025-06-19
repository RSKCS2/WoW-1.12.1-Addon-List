--	///////////////////////////////////////////////////////////////////////////////////////////
--
--
--	v2.25.11100 (Fans Update Version)
--
--
--	//////////////  DISCLAIMER / APOLOGY / CREDIT ///////////////////////////////
--
--	ALL Credit for the original version 1 of this AddOn should go to Jeremy Walsh
--
--	I took over version 1 purely as a last resort to enable
--	BattleGrounds support and allow full compatibility with PartySpotter
--	within BattleGrounds
--
--	Telic :)
--	telic@hotmail.co.uk
--
--	Full Credits : Jeremy Walsh, Telic, Alchemys Indomane
--
--	/////////////////////////////////////////////////////////////////////////////
--
--
--
--	AlphaMap: A worldmap frame that is transparent and allows character manipulation
--		copyright 2004-2005 by Jeromy Walsh ( DragonWalsh@yahoo.com )
--
--	Official Site: AlphaMap has popped up on a number of related websites. This is great news!! But for the
--          latest and greatest version, check the following URL: http://www.curse-gaming.com/mod.php?addid=190
--
--	Contributions: Part of the code for this is adapted from WorldMapFrame.xml and OpacitySliderFrame.xml
--		of the original Blizzard(tm) Entertainment distribution.
--
--	3rd Party Components: Part of the code is taken from MapNotes, MapNotes Gathering, and Gatherer.  This
--		is done to provide optional support for those addons.
--
-- 	Other Contributors: I'd like to thank "Ska Demon" of the Curse Gaming forums for helping me make v1.3
--		as good as it is.  Ska provided the base code for the slash commands to set various parameters,
--		as well as provided the base code to save variables between WoW sessions.  Finally, Ska
--		provided the code to scale the AlphaMap via a slash command.
--
--	Special Thanks: Special thanks to Ska Demon for keeping AlphaMap alive during my busy schedule.
--		Also thanks to my wife Lindsey Walsh, for putting up with me during the midnight coding sessions.
--
--	License: You are hereby authorized to freely modify and/or distribute all files of this add-on, in whole or in part,
--		providing that this header stays intact, and that you do not claim ownership of this Add-on.
--
--		Additionally, the original owner wishes to be notified by email if you make any improvements to this add-on.
--		Any positive alterations will be added to a future release, and any contributing authors will be
--		identified in the section above.
--
--	SEE NOTES.TXT FOR LATEST PATCH NOTES
--
--	Features:
--	   v1.03.11000
--		  - toc Update for v1.10 of WoW
--	   v1.03.1900
-- 		  - Centered the AlphaMap, and made sure Slider appears on the map when using /am reset
-- 		  - Completely discarded the Old Saved Variables method which may have been causing some conflicts
--         v1.02.1900 (Fans Update Version)
--                - Moved strings to localization.lua (others are welcome to provide translations!)
--                - Added some functions for colored feedback.
--                - Added /am reset, /am enable, /am disable slash commands
--	   v1.01.1900 (Fans Update Version)
--		  - Updated toc
-- 		  - Adjusted the Map Scaling Function that was preventing the map from displaying
--	   v1.01.1800 (Fans Update Version)
--      	  - Fixed the Corpse icon (Thanks to Xtro)
--         v1.00.1800 (Fans Update Version)
--		  - All team mates of your faction are now visible in BattleGrounds, whether or not they are in your Party/Raid
--		  - Improved the Units Tooltips code, to display a list of player names under the mouse as per the tooltips on other maps
--		  - Added BattleGround Flag/Objective statuses
--		  - Has full support for the PartySpotter AddOn
--         v1.3.1 - Removed all references to the worldmap POI's - some other addon was conflicting
--         v1.3.0 - A large number of slash commands, usable via /AlphaMap or /am
--                - Every slash command setting is stored between WoW usage
--                - Raid Pins Shown ( togglable via /am raid )
--                - Optional Tooltips on Pins ( Party/Raid, MapNotes, Gatherer, and MapNotes Gathering )
--                - Tooltips Togglable via /am ptips, /am mntips, /am gtips, /am mngtips
--                - Slider is moveable and lockable via /am moveslider
--                - Optionally Show Slider via /am slider
--                - Optional Support for Gatherer 1.9.12 (1300) via /am gatherer
--                - Optional Support for MapNotes 0.5.4 (4196)  via /am mapnotes
--                - Optional Support for MapNotes Gathering 0.5.6 (4150) via /am gathering
--                - Optionally Close AlphaMap when entering combat via /am combat
--                - Optionally Close Alphamap when world map closes via /am wmclose
--                - Moveable AlphaMap; move by dragging along the top border - lockable via /lock
--                - Scaleable AlphaMap via /am scale <value>
--                - AlphaMap togglable via /am tog
--                - AlphaMap alpha settable through /am alpha <value>
--                - Alpha value is saved between sessions
--                - Fixed a bug allowing you to set a scale < 0
--                - Fixed a bug allowing you to set alpha < 0 or > 1
--                - Fixed a bug caused by 1300 where GetMapLandmarkInfo returned an extra parameter
--         v1.2.1 - Fixed a bug causing AlphaMap to be closely tied to MapNotes
--         v1.2.0 - Automatic update of AlphaMap on zone change
--                - Now displays "Point of Interest" flags, such as set by guards
--                - Now displays "MapNotes" pins, until they change something with MapNotes that breaks AlphaMap
--                - Player pin is now shown as an arrow, indicating direction
--                - Added Hotkey assignment to Increment/Decrement map alpha by 10%
--                - Added player's coordinates near the top right of the AlphaMap. (Under the minimap in standard resolutions)
--         v1.1.0 - Fixed a bug with markers not becoming transparent when alpha is set to 0
--                - Player Corpse is now shown on AlphaMap
--         v1.0.0 - Displays a slider in the lower left corner that can be used to set window opacity
--         v0.9.0 - Displays the worldmap in a large, semi-transparent, non-movable window
--
--	///////////////////////////////////////////////////////////////////////////////////////////

local AM_UPDATE_INTERVAL_SMAX = 0.66;
local AM_UPDATE_INTERVAL_PMAX = 0.08;
local AM_Update_Timer_S = 0;
local AM_Update_Timer_P = 0;

NUM_ALPHAMAP_DETAIL_TILES	= 12;
NUM_ALPHAMAP_OVERLAYS		= 40;
NUM_ALPHAMAP_POIS		= 50;

ALPHAMAP_POI_TEXTURE_WIDTH	= 128;
NUM_ALPHAMAP_POI_COLUMNS	= 8;
NUM_ALPHAMAP_MAPNOTE_POIS	= 100;
NUM_ALPHAMAP_GATHERNOTE_POIS  	= 200;

ALPHAMAP_INCREMENT		= 0.1;

AM_DEFAULT_ALPHA		= 0.3;
AM_DEFAULT_SCALE		= 0.8;
AM_DEFAULT_MINIMAP_ANGLE	= 270;
AM_DEFAULT_MINIMAP_RADIUS	= 80;

AM_DEGREE			= "\194\176";

AM_ROTATIONAL_ADJUSTMENT 	= math.pi * 0.75;

AM_MAX_AMNOTES			= 60;
AM_MAX_MULT_COORDS		= 8;
AM_INSTANCE_SCALING_FACTOR	= 5.12;
AM_KEY_DEFAULT_GAP		= 2.0;
AM_KEY_LEAVE_GAP		= 16.0;
AM_DEFAULT_COLOUR		= { r = 0.0, g = 0.0, b = 0.0, a = 1.0 };

AM_SCALE_MIN			= 0.4;
AM_SCALE_MAX			= 1.0;

local AM_FLASH_TIMER 		= 0.3;

local MOFFSET_X = 0.0022;
local MOFFSET_Y = 0.0;

local AM_GOLD_ICON = "Interface\AddOns\AlphaMap\Artwork\Gold";
local AM_SILV_ICON = "Interface\AddOns\AlphaMap\Artwork\Silver";

local AM_DefaultSliderX = 24;
local AM_DefaultSliderY = 450;

AlphaMapTooltipData = {};
AM_ZoomScalingFactor = 1.0;

local amPlayer;
local AM_AutoClosed = nil;
local amPlayersModel = nil;
local amAlphaMapMap = nil;
local amSelectedMap = nil;
local iNote = 0;
local rScale = 1;
local amNotePage = 1;
local amNotesPerPage = 32;
local lastTab = nil;
local amContType = AM_TYP_WM;
local amMapType = AM_TYP_WM;
local sortedMapList = {};
local sortedMapListIndex = 0;
local amSortBy = "Alpha";
local amAnchorPoint = AM_ANCHOR_POINT;
local amUnitScale;
local amInstanceIndex;
local amBGIndex;
local amRaidIndex;
local am_MaxGNotes = 500;
local amBGPOIs = {};
amBGPOIs.counter = 0;
local prvMapFileName = nil;
local amMapNeedsRefresh = nil;
local amRcMenus = { POI = false, Flag = false, Highlight = false, NuN = false };
local amACarrier = nil;
local amHCarrier = nil;
local pFaction, basesRequired;
local amH = {};
local hTimer = 0;
local lastLootId = nil;
local amPrevAlphaMap = nil;
local amPrevBases = 0;
local AM_WorldMapSelected = nil;
local AM_ManualMapChange = nil;
local amUnitsRefresh = nil;
local inTheMiddleofNoWhere = nil;
local bringMeBack = nil;
local texturePath = "textures\\Minimap\\";
local currentArea = nil;
local updatingPaused = nil;
local updateRequested = nil;
local amForceUpdate = nil;
local justEnteredWorld = nil;
local amBGToggled = nil;
local AlphaMapDetailFrame_Backdrop = nil;
local amWorldMapOpenStatus = false;
local AM_HotSpotToggled = false;
local AM_ValidMaps = {};
local AM_ValidTypes = {};
local AM_ChangingOriWorldMap = false;
local AM_SkipWorldMapRepos = nil;


--Saved Variables
AlphaMapConfig = {};
AlphaMapConfigurations = {};


-- Hooked Functions
local amOri_Gatherer_ChangeMap;
local amOri_NuNGNote_WriteNote;
local amOri_NuNGNote_Delete;
local amOri_GuildMap_IsWorldMapOpen;
local amOri_ToggleWorldMap;

-- Unhooker Function
local amOri_WorldMapFrame_OnKeyDown;

-- Temporary Hooks (hopefully)
local amOri_AtlasLootSetButton_OnClick;

-- This makes it so you can close the AlphaMap by hitting the ESC key
-- But if used, the world map will not open with AlphaMap open
-- UIPanelWindows["AlphaMapFrame"] = { area = "center", pushable = 0 };

-- Called whenever AlphaMap is loaded
function AlphaMapFrame_OnLoad()
	SlashCmdList["ALPHAMAPSLASH"] = AlphaMap_Main_ChatCommandHandler;

	this:RegisterEvent( "WORLD_MAP_UPDATE" );
	this:RegisterEvent( "ZONE_CHANGED_NEW_AREA" );
	this:RegisterEvent( "VARIABLES_LOADED" );
	this:RegisterEvent( "PLAYER_REGEN_DISABLED" );
	this:RegisterEvent( "PLAYER_REGEN_ENABLED" );
	this:RegisterEvent( "CHAT_MSG_BG_SYSTEM_ALLIANCE" );
	this:RegisterEvent( "CHAT_MSG_BG_SYSTEM_HORDE" );
	this:RegisterEvent( "PLAYER_ENTERING_WORLD" );
	this:RegisterEvent( "PLAYER_LEAVING_WORLD" );

	AlphaMap_Print(ALPHA_MAP_LOAD_CONFIRM);

	amOri_Gatherer_ChangeMap = Gatherer_ChangeMap;
	Gatherer_ChangeMap = amNew_Gatherer_ChangeMap;
	amOri_NuNGNote_WriteNote = NuNGNote_WriteNote;
	NuNGNote_WriteNote = amNew_NuNGNote_WriteNote;
	amOri_NuNGNote_Delete = NuNGNote_Delete;
	NuNGNote_Delete = amNew_NuNGNote_Delete;
	amOri_GuildMap_IsWorldMapOpen = GuildMap_IsWorldMapOpen;
	GuildMap_IsWorldMapOpen = amNew_GuildMap_IsWorldMapOpen;
	amOri_ToggleWorldMap = ToggleWorldMap;
	ToggleWorldMap = amNew_ToggleWorldMap;
	amOri_AtlasLootSetButton_OnClick = AtlasLootSetButton_OnClick;
	AtlasLootSetButton_OnClick = amNew_AtlasLootSetButton_OnClick;

	amOri_WorldMapFrame_OnKeyDown = WorldMapFrame:GetScript("OnKeyDown");

end


-- Called whenever AlphaMap is sent an event notification
function AlphaMapFrame_OnEvent()

	if ( event == "WORLD_MAP_UPDATE" ) then
		if ( justEnteredWorld ) then
			justEnteredWorld = nil;
			if ( ( not AlphaMapFrame:IsVisible() ) and ( MiniMapBattlefieldFrame.status == "active" ) ) then
				local zoneName = GetRealZoneText();
				local am = AlphaMap_GetMap(zoneName);
				if ( ( am ) and ( am.type == AM_TYP_BG ) ) then
					local settings = AlphaMapConfigurations[am.filename];
					if ( settings.amInBG ) then
						amBGToggled = true;
						ToggleAlphaMap();
					end
				end
			elseif ( ( AlphaMapFrame:IsVisible() ) and ( MiniMapBattlefieldFrame.status ~= "active" ) ) then
				if ( amBGToggled ) then
					amBGToggled = nil;
					ToggleAlphaMap();
				end
			end
		end

		if ( inTheMiddleofNoWhere ) then
			bringMeBack = true;
			return;
		end

		AM_Update_Timer_S = AM_UPDATE_INTERVAL_SMAX + 1;
		AM_Update_Timer_P = AM_UPDATE_INTERVAL_PMAX + 1;

		local inBG = nil;
		if ( GetCurrentMapContinent() == -1 ) then
			inBG = true;
		end

		-- Suppress DropDown box refresh unless we have actually changed World Maps
		local newMapFileName = GetMapInfo();
		if ( ( inBG ) or ( newMapFileName ~= prvMapFileName ) ) then
			if ( not inBG ) then
				AM_ClearHighlights();
			end
			prvMapFileName = newMapFileName;
			if ( not AM_WorldMapSelected ) then
				currentArea = newMapFileName;
			end
			if ( ( updatingPaused ) and ( not AM_WorldMapSelected ) and ( not amForceUpdate ) ) then

			elseif ( AlphaMapZoneDropDown:IsVisible() ) then
				AlphaMapContinentsDropDown_OnLoad();
				AlphaMap_UpdateContinentDropDownText();
				AlphaMapZoneDropDown_OnLoad();
				AlphaMap_UpdateZoneDropDownText();
			end
		end

		-- Battlegrounds processing
		if ( inBG ) then

			-- Suppress map refreshes while the Options frame is open in BG, but flag we need one when Options close
			if ( AM_OptionsFrame:IsVisible() ) then
				amMapNeedsRefresh = true;
				return;
			end

			-- AB point calculations can be here if needed (I think)
		end

		if ( ( updatingPaused ) and ( not AM_WorldMapSelected ) and ( not amForceUpdate ) ) then
			updateRequested = true;
			return;
		end

		AlphaMapFrame_Update();

	elseif ( event == "PLAYER_LEAVING_WORLD" ) then
		inTheMiddleofNoWhere = true;

	elseif ( event == "PLAYER_ENTERING_WORLD" ) then
		justEnteredWorld = true;
		inTheMiddleofNoWhere = nil;
		if ( ( bringMeBack ) or ( updatingPaused ) ) then
			AlphaMapContinentsDropDown_OnLoad();
			AlphaMap_UpdateContinentDropDownText();
			AlphaMapZoneDropDown_OnLoad();
			AlphaMap_UpdateZoneDropDownText();

			AM_Update_Timer_S = AM_UPDATE_INTERVAL_SMAX + 1;
			AM_Update_Timer_P = AM_UPDATE_INTERVAL_PMAX + 1;

			AlphaMapFrame_Update();

			bringMeBack = nil;
		end

	elseif( event == "ZONE_CHANGED_NEW_AREA" ) then
		SetMapToCurrentZone();
		if ( ( UnitOnTaxi("player") ) and ( updatingPaused ) ) then
		else
			amForceUpdate = true;
		end

	elseif ( event == "PLAYER_REGEN_DISABLED" and AlphaMapConfig.combat == true ) then
		if ( AlphaMapFrame:IsVisible() ) then
			HideUIPanel(AlphaMapFrame);
			AM_AutoClosed = "true";
		end

	elseif ( ( event == "PLAYER_REGEN_ENABLED" ) and ( AlphaMapConfig.reopen == true ) and ( AM_AutoClosed == "true" ) ) then
		AM_AutoClosed = nil;
		ShowUIPanel( AlphaMapFrame );

	elseif ( ( event == "CHAT_MSG_BG_SYSTEM_ALLIANCE" ) or ( event == "CHAT_MSG_BG_SYSTEM_HORDE" ) ) then
		AM_GetFlagCarrier(arg1);

	elseif( event == "VARIABLES_LOADED") then

		AM_MinimapFrame:Hide();
		AM_OptionsFrame.AlphaMapConfig = {};

		AlphaMap_OptionsTabFrameTab1.controlledFrame = AM_OptionsFrameGeneral;
		AlphaMap_OptionsTabFrameTab2.controlledFrame = AM_OptionsFrameDungeon;
		AlphaMap_OptionsTabFrameTab3.controlledFrame = AM_OptionsFrameMaps;
		AlphaMap_OptionsTabFrameTab4.controlledFrame = AM_OptionsFrameBG;
		AlphaMap_OptionsTabFrameTab5.controlledFrame = AM_OptionsFrameMisc;

		AM_ANCHOR_OPTIONS		= AM_OptionsDDDockIt:GetID();
		AM_ANCHOR_FREE			= AM_OptionsDDFreeIt:GetID();
		AM_ANCHOR_ALPHAMAP		= AM_OptionsDDMapIt:GetID();
		AM_ANCHOR_DEFAULT		= AM_ANCHOR_FREE;

		if ( AlphaMapConfigurations.wm ) then
			AM_CopySettings(AlphaMapConfigurations.wm, AlphaMapConfig)
		end

		if( AlphaMapConfig.enabled == nil) then
			AlphaMapConfig.enabled = true;
		end

		if( not AlphaMapConfig.alpha ) then
			AlphaMapConfig.alpha = AM_DEFAULT_ALPHA;
		end

		if( not AlphaMapConfig.scale ) then
			AlphaMapConfig.scale = AM_DEFAULT_SCALE;
		end

		if( AlphaMapConfig.lock == nil ) then
			AlphaMapConfig.lock = false;
			AlphaMapMovementFrameTop:Show();
			AlphaMapMovementFrameBottom:Show();
		end

		if( AlphaMapConfig.combat  == nil ) then
			AlphaMapConfig.combat = false;
		end

		if ( AlphaMapConfig.reopen == nil ) then
			AlphaMapConfig.reopen = false;
		end

		if( AlphaMapConfig.ptips  == nil ) then
			AlphaMapConfig.ptips = true;
		end

		if( AlphaMapConfig.gtips  == nil ) then
			AlphaMapConfig.gtips = true;
		end

		if( AlphaMapConfig.mntips  == nil ) then
			AlphaMapConfig.mntips = true;
		end

		if( AlphaMapConfig.mngtips  == nil ) then
			AlphaMapConfig.mngtips = false;
		end

		if( AlphaMapConfig.wmclose  == nil ) then
			AlphaMapConfig.wmclose = false;
		end

		if( AlphaMapConfig.gathering  == nil ) then
			AlphaMapConfig.gathering = false;
		end

		if( AlphaMapConfig.gatherer  == nil ) then
			AlphaMapConfig.gatherer = true;
		end

		if( AlphaMapConfig.mapnotes  == nil ) then
			AlphaMapConfig.mapnotes = true;
		end

		if( AlphaMapConfig.raid  == nil ) then
			AlphaMapConfig.raid = true;
		end

		if( AlphaMapConfig.sliderlock  == nil ) then
			AlphaMapConfig.sliderlock = true;
		end
		if ( AlphaMapConfig.sliderlock ) then
			AlphaMapSliderMovementFrame:Hide();
		else
			AlphaMapSliderMovementFrame:Show();
		end

		if( AlphaMapConfig.slider == nil ) then
			AlphaMapConfig.slider = false;
		end
		if( AlphaMapConfig.slider == false ) then
			HideUIPanel( AlphaMapSliderFrame );
		end

		SetAlphaMapOpacity( AlphaMapConfig.alpha );

		if (AlphaMapConfig.enabled == false) then
			AlphaMap_Print(ALPHA_MAP_DISABLED_HINT);
		end
		if ( AlphaMapConfig.angle  == nil ) then
			AlphaMapConfig.angle = AM_DEFAULT_MINIMAP_ANGLE;
		end
		if ( AlphaMapConfig.radius  == nil ) then
			AlphaMapConfig.radius = AM_DEFAULT_MINIMAP_RADIUS;
		end
		if ( AlphaMapConfig.minimap  == nil ) then
			AlphaMapConfig.minimap = true;
		end
		AM_UpdateMinimapButton();

		if ( AlphaMapConfig.legacy  == nil ) then
			AlphaMapConfig.legacy = false;
		end

		if ( AlphaMapConfig.dmNotes  == nil ) then
			AlphaMapConfig.dmNotes = true;
		end

		if ( AlphaMapConfig.dmNotesTooltips  == nil ) then
			AlphaMapConfig.dmNotesTooltips = true;
		end

		if ( AlphaMapConfig.dmNotesBg  == nil ) then
			AlphaMapConfig.dmNotesBg = true;
		end

		if ( AlphaMapConfig.dmMapBg == nil ) then
			AlphaMapConfig.dmMapBg = false;
		end

		if ( AlphaMapConfig.dmHeader  == nil ) then
			AlphaMapConfig.dmHeader = true;
		end

		if ( AlphaMapConfig.dmExtra  == nil ) then
			AlphaMapConfig.dmExtra = true;
		end

		if ( AlphaMapConfig.dmKey  == nil ) then
			AlphaMapConfig.dmKey = true;
		end

		if ( AlphaMapConfig.dmKeyTooltips  == nil ) then
			AlphaMapConfig.dmKeyTooltips = true;
		end

		amPlayer = UnitName("player");

		if ( AlphaMapConfig.ddAnchorFrom == nil ) then
			AlphaMapConfig.ddAnchorFrom = 1;
		end
		UIDropDownMenu_SetSelectedID(AlphaMapDDPoint, AlphaMapConfig.ddAnchorFrom);
		UIDropDownMenu_SetText(amAnchorPoint[AlphaMapConfig.ddAnchorFrom].Display, AlphaMapDDPoint);

		if ( AlphaMapConfig.ddAnchorTo == nil ) then
			AlphaMapConfig.ddAnchorTo = 1;
		end
		UIDropDownMenu_SetSelectedID(AlphaMapDDrelativePoint, AlphaMapConfig.ddAnchorTo);
		UIDropDownMenu_SetText(amAnchorPoint[AlphaMapConfig.ddAnchorTo].Display, AlphaMapDDrelativePoint);

		if ( AlphaMapConfig.ddP == nil ) then
			AlphaMapConfig.ddP = AM_ANCHOR_DEFAULT;
		end

		if ( AlphaMapConfig.freeLocked == nil ) then
			AlphaMapConfig.freeLocked = false;
		end

		if ( AlphaMapConfig.ddP == AM_ANCHOR_FREE ) then
			AlphaMapPlaceDDs();
			AM_MapSelector.locked = nil;
		elseif ( AlphaMapConfig.ddP == AM_ANCHOR_ALPHAMAP ) then
			AM_MapSelector:SetParent( AlphaMapFrame );
			AM_MapSelector.locked = true;
			AlphaMapConfig.freeLocked = true;
		else
			AM_MapSelector.locked = true;
			AlphaMapConfig.freeLocked = true;
		end

		AM_SetLock();

		if ( AlphaMapConfig.HotSpot == nil ) then
			AlphaMapConfig.HotSpot = true;
		end

		if ( AlphaMapConfig.hsOpen == nil ) then
			AlphaMapConfig.hsOpen = true;
		end

		if ( AlphaMapConfig.hsOpacity == nil ) then
			AlphaMapConfig.hsOpacity = true;
		end

		if ( AlphaMapConfig.hsWmIcons == nil ) then
			AlphaMapConfig.hsWmIcons = false;
		end

		if ( AlphaMapConfig.hsDmIcons == nil ) then
			AlphaMapConfig.hsDmIcons = false;
		end

		if ( AlphaMapConfig.hsNBg == nil ) then
			AlphaMapConfig.hsNBg = false;
		end

		if ( AlphaMapConfig.hsMBg == nil ) then
			AlphaMapConfig.hsMBg = false;
		end

		if ( AlphaMapConfig.hsMinimap == nil ) then
			AlphaMapConfig.hsMinimap = false;
		end

		if ( AlphaMapConfig.hsInfo == nil ) then
			AlphaMapConfig.hsInfo = false;
		end

		if ( AlphaMapConfig.nBgColour == nil ) then
			 AlphaMapConfig.nBgColour = AM_DEFAULT_COLOUR;
		end
		AM_UpdateColours("Notes", AlphaMapConfig.nBgColour.r, AlphaMapConfig.nBgColour.g, AlphaMapConfig.nBgColour.b, AlphaMapConfig.nBgColour.a, true);


		if ( AlphaMapConfig.mBgColour == nil ) then
			AlphaMapConfig.mBgColour = AM_DEFAULT_COLOUR;
		end
		AM_UpdateColours("Map", AlphaMapConfig.mBgColour.r, AlphaMapConfig.mBgColour.g, AlphaMapConfig.mBgColour.b, AlphaMapConfig.mBgColour.a );

		if ( AlphaMapConfig.amInBG == nil ) then
			AlphaMapConfig.amInBG = true;
		end

		if ( AlphaMapConfig.dmAll == nil ) then
			AlphaMapConfig.dmAll = true;
		end

		if ( AlphaMapConfig.bgAll == nil ) then
			AlphaMapConfig.bgAll = true;
		end

		if ( AlphaMapConfig.amClearView == nil ) then
			AlphaMapConfig.amClearView = false;
		end

		if ( AlphaMapConfig.posX == nil ) then
			AlphaMapConfig.posX = 512;
		end

		if ( AlphaMapConfig.posX == nil ) then
			AlphaMapConfig.posY = 383;
		end

		if ( AlphaMapConfig.bgMsgType == nil ) then
			AlphaMapConfig.bgMsgType = "Default";
		end

		if ( AlphaMapConfig.NuNFormatted == nil ) then
			AlphaMapConfig.NuNFormatted = false;
		end

		if ( AlphaMapConfig.NuNSendTo == nil ) then
			AlphaMapConfig.NuNSendTo = "Default";
		end

		if ( AlphaMapConfig.wmMode == nil ) then
			AlphaMapConfig.wmMode = AM_OPTIONS_WMAP_SMODE;
		end

		if ( AlphaMapConfig.Escape == nil ) then
			AlphaMapConfig.Escape = false;
			AM_DisableEscapeMode();
		elseif ( AlphaMapConfig.Escape == true ) then
			AM_EnableEscapeMode();
		else
			AM_DisableEscapeMode();
		end

		if ( AlphaMapConfig.Mouse == nil ) then
			AlphaMapConfig.Mouse = false;
		end

		if ( not AlphaMapConfig.sliderLocX ) then
			AlphaMapConfig.sliderLocX = AM_DefaultSliderX;
		end
		if ( not AlphaMapConfig.sliderLocY ) then
			AlphaMapConfig.sliderLocY = AM_DefaultSliderY;
		end
		if ( not AlphaMapSliderFrame:IsUserPlaced() ) then
			AM_SetSliderPos();
		end

		AM_AM_LOOT_POINT = { "TOPLEFT", AlphaMapAlphaMapFrame, "TOPLEFT", 0, 0 };
		AM_UI_LOOT_POINT = { "CENTER", UIParent, "CENTER", 0, 0 };

		if ( AlphaMapConfig.mute == nil ) then
			AlphaMapConfig.mute = false;
		end

		if ( AlphaMapConfig.gmap == nil ) then
			AlphaMapConfig.gmap = false;
		end

		if ( not AlphaMapConfigurations.wm ) then
			AlphaMapConfigurations.wm = {};
			AM_CopySettings(AlphaMapConfig, AlphaMapConfigurations.wm);
		end

		if ( not AlphaMapConfigurations.gm ) then
			AlphaMapConfigurations.gm = {};
			AM_CopySettings(AlphaMapConfig, AlphaMapConfigurations.gm);
		end

		AM_InitialiseTypes();
		AM_SaveGlobals();

		if ( AlphaMapConfig.gmap == true ) then
			AM_SetupGameMap();
		end

		if ( AtlasLootItemsFrame ) then
			AM_CloseLoot:SetParent(AtlasLootItemsFrame);
			AM_CloseLoot:SetPoint("TOPRIGHT", "AtlasLootItemsFrame", "TOPRIGHT", 0, 0);
			AM_AtlasLoot_Options:Show();
			AM_AtlasLoot_Sets:Show();
		end

		AlphaMapDetailFrame_Backdrop = AlphaMapDetailFrame:GetBackdrop();

		if ( AlphaMapFrame:IsVisible() ) then
			ToggleAlphaMap();
		end

		AM_ValidateMaps();

		if ( MapNotesNewMenuFrame ) then
			AM_MapNotesNewMenuFrame_Control:SetParent(MapNotesNewMenuFrame);
		end

		if ( MapNotesPOIMenuFrame ) then
			AM_MapNotesPOIMenuFrame_Control:SetParent(MapNotesPOIMenuFrame);
		end

		if ( MapNotesSpecialActionMenuFrame ) then
			AM_MapNotesSpecialActionMenuFrame_Control:SetParent(MapNotesSpecialActionMenuFrame);
		end
	end
end


-- Helper function to compute UV coords to draw pins
function AlphaMap_GetPOITextureCoords( index, alphaMapIconDimension )
	local xCoord1, xCoord2, yCoord1, yCoord2;
	local coordIncrement = alphaMapIconDimension / ALPHAMAP_POI_TEXTURE_WIDTH;

	xCoord1 = mod(index , NUM_ALPHAMAP_POI_COLUMNS) * coordIncrement;
	xCoord2 = xCoord1 + coordIncrement;
	yCoord1 = floor(index / NUM_ALPHAMAP_POI_COLUMNS) * coordIncrement;
	yCoord2 = yCoord1 + coordIncrement;

	return xCoord1, xCoord2, yCoord1, yCoord2;
end



function AlphaMap_GetMap(mapData)
	if ( ( mapData ) and ( type(mapData) == "string" ) ) then
		for i=1, getn(AM_ALPHAMAP_LIST), 1 do
			if ( AM_ALPHAMAP_LIST[i].name == mapData ) then
				local map = AM_ALPHAMAP_LIST[i].filename;
				if ( AM_ValidMaps[map] ) then
					return AM_ALPHAMAP_LIST[i], i;
				end
			end
		end
	elseif ( ( mapData ) and ( type(mapData) == "number" ) ) then
		if ( AM_ALPHAMAP_LIST[mapData] ) then
			local map = AM_ALPHAMAP_LIST[mapData].filename;
			if ( AM_ValidMaps[map] ) then
				return AM_ALPHAMAP_LIST[mapData].Display, AM_ALPHAMAP_LIST[mapData].type;
			end
		end
	end

	return nil;
end



function AlphaMapFrame_Update(map)
	local numOverlays = 0;

	if ( AM_ChangingOriWorldMap ) then
		amMapNeedsRefresh = true;
		return;
	end

	amAlphaMapMap = nil;

	local zoneName = GetRealZoneText();
	local mapFileName, textureHeight = GetMapInfo();
	local playerX, playerY = GetPlayerMapPosition("player");

	if ( AM_ManualMapChange ) then
		AM_ManualMapChange = nil;
		amNotePage = 1;
		AM_CloseLoot_OnClick();
	end

	if ( amForceUpdate ) then
		amForceUpdate = nil;
		amUnitsRefresh = true;
	end

	if ( map ) then
		amAlphaMapMap = map;
	elseif ( AM_WorldMapSelected ) then
		AM_WorldMapSelected = nil;
		amUnitsRefresh = true;
	else
		if ( playerX > 0 ) then
			local zoneNameExt = zoneName..AM_EXTERIOR;
			amAlphaMapMap = AlphaMap_GetMap(zoneNameExt);
		else
			-- trigger a second test for 1 second later... ?
		end

		if ( not amAlphaMapMap ) then
			amAlphaMapMap = AlphaMap_GetMap(zoneName);
		end

		if ( ( amAlphaMapMap ) and ( mapFileName ) ) then
			local settings = AlphaMapConfigurations[amAlphaMapMap.filename];
			if ( ( amAlphaMapMap.type == AM_TYP_BG ) and ( not settings.amInBG ) ) then
				amAlphaMapMap = nil;
			end
		end
	end

	if ( ( not amAlphaMapMap ) or ( amAlphaMapMap.filename ~= amPrevAlphaMap ) ) then
		AMPopup:Hide();
	end

	if ( amAlphaMapMap ) then
		AM_SetOptions();

		AM_ClearNotes();

		amMapType = amAlphaMapMap.type;

		for i=1, NUM_ALPHAMAP_POIS, 1 do
			getglobal( "AlphaMapPOI"..i ):Hide();
		end
		for i=1, NUM_ALPHAMAP_OVERLAYS, 1 do
			getglobal("AlphaMapOverlay"..i):Hide();
		end
		AlphaMapDetailFrame:Hide();

		local xi, yi = 1, 1;
		local txture = getglobal("AlphaMapAlphaMapFrame_T"..(xi)..(yi));
		while ( txture ) do
			while ( txture ) do
				txture:Hide();
				yi = yi + 1;
				txture = getglobal("AlphaMapAlphaMapFrame_T"..(xi)..(yi));
			end
			yi = 1;
			xi = xi + 1;
			txture = getglobal("AlphaMapAlphaMapFrame_T"..(xi)..(yi));
		end

		if ( AM_Minimap_Data[ amAlphaMapMap.filename ] ) then
			AlphaMapAlphaMapTexture:Hide();
			AM_BuildMap( AM_Minimap_Data[ amAlphaMapMap.filename ], AlphaMapAlphaMapFrame );
		else
			AlphaMapAlphaMapTexture:SetTexture("Interface\\AddOns\\AlphaMap\\Maps\\"..amAlphaMapMap.filename);
			AlphaMapAlphaMapTexture:Show();
		end


		if ( AlphaMapConfig.dmMapBg ) then
			AlphaMapAlphaMapBgTexture:Show();
			AM_UpdateColours("Map", AlphaMapConfig.mBgColour.r, AlphaMapConfig.mBgColour.g, AlphaMapConfig.mBgColour.b, AlphaMapConfig.mBgColour.a );
		else
			AlphaMapAlphaMapBgTexture:Hide();
		end

		if ( ( amAlphaMapMap.displayname ) and ( amAlphaMapMap.displayname ~= "" ) ) then
			if ( ( amAlphaMapMap.displayshort ) and ( amAlphaMapMap.displayshort ~= "" ) ) then
				AlphaMapAlphaMapName:SetText(amAlphaMapMap.displayname.."     -"..amAlphaMapMap.displayshort);
			else
				AlphaMapAlphaMapName:SetText(amAlphaMapMap.displayname);
			end
		else
			AlphaMapAlphaMapName:SetText(zoneName);
		end
		if ( amAlphaMapMap.location ) then
			AlphaMapAlphaMapLocation:SetText(": "..amAlphaMapMap.location);
		else
			AlphaMapAlphaMapLocation:SetText("???");
		end
		if ( amAlphaMapMap.levels ) then
			AlphaMapAlphaMapLevels:SetText(": "..amAlphaMapMap.levels);
		else
			AlphaMapAlphaMapLevels:SetText("???");
		end
		if ( amAlphaMapMap.players ) then
			AlphaMapAlphaMapPlayers:SetText(": "..amAlphaMapMap.players);
		else
			AlphaMapAlphaMapPlayers:SetText("???");
		end

		if ( ( amAlphaMapMap.prereq ) and ( amAlphaMapMap.prereq ~= "" ) ) then
			AlphaMapAlphaMapPreReq1:SetText(AM_INSTANCE_PREREQS..amAlphaMapMap.prereq);
			AlphaMapAlphaMapPreReq1:Show();
		else
			AlphaMapAlphaMapPreReq1:Hide();
		end

		if ( ( amAlphaMapMap.general ) and ( amAlphaMapMap.general ~= "" ) ) then
			AlphaMapAlphaMapGeneral:SetText(AM_INSTANCE_GENERAL..amAlphaMapMap.general);
			AlphaMapAlphaMapGeneral:Show();
		else
			AlphaMapAlphaMapGeneral:Hide();
		end

		if ( AlphaMapConfig.scale ) then
			AlphaMapFrame:SetScale( AlphaMapConfig.scale );
			SetAlphaMapOpacity( AlphaMapConfig.alpha );
		end

		AM_Notes(amAlphaMapMap);

		AlphaMapAlphaMapFrame:Show();
		if ( AlphaMapConfig.dmHeader == true ) then
			AlphaMapAlphaMapTitleFrame:Show();
		else
			AlphaMapAlphaMapTitleFrame:Hide();
		end
		if ( AlphaMapConfig.dmKey ) then
			AlphaMapAlphaMapDetailsFrame:Show();
		else
			AlphaMapAlphaMapDetailsFrame:Hide();
			for n=1, amNotesPerPage, 1 do
				getglobal("AlphaMapAlphaMapButtonDtl"..n):Hide();
			end
		end
		if ( AlphaMapConfig.dmExtra == true ) then
			AlphaMapAlphaMapPreReqFrame:Show();
		else
			AlphaMapAlphaMapPreReqFrame:Hide();
		end

		amPrevAlphaMap = amAlphaMapMap.filename;

	else
		amAlphaMapMap = nil;

		AM_SetOptions();

		AM_Update_Timer_S = AM_UPDATE_INTERVAL_SMAX + 1;
		AM_Update_Timer_P = AM_UPDATE_INTERVAL_PMAX + 1;
		AlphaMapAlphaMapFrame:Hide();
		AlphaMapAlphaMapTitleFrame:Hide();
		AlphaMapAlphaMapDetailsFrame:Hide();
		AlphaMapAlphaMapPreReqFrame:Hide();

		if ( ( AlphaMapConfig ) and ( AlphaMapConfig.scale ) ) then
			AlphaMapFrame:SetScale( AlphaMapConfig.scale );
		end
		AM_Notes();

		if ( not mapFileName ) then
			mapFileName = "World";
		end

		amMapType = AM_TYP_WM;

		if ( Mozz_GetNumMapOverlays ) then
			numOverlays = Mozz_GetNumMapOverlays();
		else
			numOverlays = GetNumMapOverlays();
		end

		if ( ( AlphaMapConfig.wmMode == AM_OPTIONS_WMAP_SMODE ) or ( numOverlays < 1 ) ) then
			AlphaMapDetailFrame:SetBackdrop(AlphaMapDetailFrame_Backdrop);
			for i=1, NUM_ALPHAMAP_DETAIL_TILES, 1 do
				getglobal("AlphaMapDetailTile"..i):SetTexture("Interface\\WorldMap\\"..mapFileName.."\\"..mapFileName..i);
				getglobal("AlphaMapDetailTile"..i):Show();
			end
		else
			AlphaMapDetailFrame:SetBackdrop(nil);
			for i=1, NUM_ALPHAMAP_DETAIL_TILES, 1 do
				getglobal("AlphaMapDetailTile"..i):Hide();
			end
		end

		AM_SetupPOIs("AlphaMapPOI", "Texture", AlphaMapUnits);

		-- Overlay stuff
		if ( ( ( Mozz_GetNumMapOverlays ) and ( worldMapFrame_UpdateOverlays ) )  or  ( ( MetaFWM_OnEvent ) and ( worldMapFrame_UpdateOverlays ) ) ) then
			worldMapFrame_UpdateOverlays("AlphaMapDetailFrame", "AlphaMapOverlay");
		else
			local textureName, textureWidth, textureHeight, offsetX, offsetY, mapPointX, mapPointY;
			local textureCount = 1;
			local texture;
			local texturePixelWidth, textureFileWidth, texturePixelHeight, textureFileHeight;
			local numTexturesWide, numTexturesTall;

			for i=1, numOverlays do
				textureName, textureWidth, textureHeight, offsetX, offsetY, mapPointX, mapPointY = GetMapOverlayInfo(i);
				numTexturesWide = ceil(textureWidth/256);
				numTexturesTall = ceil(textureHeight/256);

				for j=1, numTexturesTall do
					if ( j < numTexturesTall ) then
						texturePixelHeight = 256;
						textureFileHeight = 256;
					else
						texturePixelHeight = mod(textureHeight, 256);
						if ( texturePixelHeight == 0 ) then
							texturePixelHeight = 256;
						end
						textureFileHeight = 16;
						while(textureFileHeight < texturePixelHeight) do
							textureFileHeight = textureFileHeight * 2;
						end
					end
					for k=1, numTexturesWide do
						if ( textureCount > NUM_ALPHAMAP_OVERLAYS ) then
							message("Too many worldmap overlays!");
							return;
						end
						texture = getglobal("AlphaMapOverlay"..textureCount);
						if ( k < numTexturesWide ) then
							texturePixelWidth = 256;
							textureFileWidth = 256;
						else
							texturePixelWidth = mod(textureWidth, 256);
							if ( texturePixelWidth == 0 ) then
								texturePixelWidth = 256;
							end
							textureFileWidth = 16;
							while(textureFileWidth < texturePixelWidth) do
								textureFileWidth = textureFileWidth * 2;
							end
						end
						texture:SetWidth(texturePixelWidth);
						texture:SetHeight(texturePixelHeight);
						texture:SetTexCoord(0, texturePixelWidth/textureFileWidth, 0, texturePixelHeight/textureFileHeight);
						texture:ClearAllPoints();
						texture:SetPoint("TOPLEFT", "AlphaMapDetailFrame", "TOPLEFT", offsetX + (256 * (k-1)), -(offsetY + (256 * (j - 1))));
						texture:SetTexture(textureName..(((j - 1) * numTexturesWide) + k));
						texture:Show();
						textureCount = textureCount +1;
					end
				end
			end
			for i=textureCount, NUM_ALPHAMAP_OVERLAYS do
				getglobal("AlphaMapOverlay"..i):Hide();
			end
		end
		AlphaMapDetailFrame:Show();
	end

	AM_PlaceMap(AlphaMapConfig.posX, AlphaMapConfig.posY);
	AM_SetSliderPos();
end


function AM_Notes(amAlphaMapMap)
	local counter = 0;
	local i = 1;
	local kIndex = 1 + ( (amNotePage-1) * amNotesPerPage );
	local kIndexMax = kIndex + amNotesPerPage;
	local var = "dtl"..i;
	local leaveGap = nil;
	local noteFrame;
	local dfltScale = 0.8;

	if ( ( amAlphaMapMap ) and ( amAlphaMapMap.notescale ) ) then
		dfltScale = amAlphaMapMap.notescale;
	end

	amUnitScale = AlphaMap_GetUnitScale(0.4, 0.6, dfltScale);

	if ( ( amAlphaMapMap ) and ( ( amAlphaMapMap.type == AM_TYP_INSTANCE ) or ( amAlphaMapMap.type == AM_TYP_BG ) or ( amAlphaMapMap.type == AM_TYP_RAID ) ) ) then
		noteFrame = AlphaMapAlphaMapFrame;
	else
		noteFrame = AlphaMapDetailFrame;
	end

	amBGPOIs = {};
	amBGPOIs.counter = 0;
	if ( ( amAlphaMapMap ) and ( amAlphaMapMap.type == AM_TYP_BG ) ) then
		AM_FetchBGPOIs();
	end

	if ( ( amAlphaMapMap ) and ( amAlphaMapMap.filename == "ArathiBasin" ) ) then
		pFaction, basesRequired = AM_GetABScores();
		if ( ( basesRequired ) and ( basesRequired ~= amPrevBases ) ) then
			amPrevBases = basesRequired;
			AM_NotifyBasesRequiredChange(basesRequired);
		end
	end

	AMFlags.aNote = nil;
	AMFlags.hNote = nil;
	AMAText:Hide();
	AMHText:Hide();
	AMBases:Hide();

	-- Hide keys
	for n=counter+1, amNotesPerPage, 1 do
		getglobal("AlphaMapAlphaMapDetail"..n.."Symbol"):SetText(" ");
		getglobal("AlphaMapAlphaMapDetail"..n):Hide();
		getglobal("AlphaMapAlphaMapButtonDtl"..n):Hide();
		getglobal("AlphaMapAlphaMapDetail"..n.."Special"):Hide();
		getglobal("AlphaMapAlphaMapDetail"..n.."LootTexture"):Hide();
		getglobal("AlphaMapAlphaMapDetail"..n.."NoteTexture"):Hide();
	end

	iNote = 0;
	while ( ( amAlphaMapMap ) and ( amAlphaMapMap[var] ) ) do
		counter = i;

		local index, key, keyText, keySpecial;
		local showKey = nil;
		local data = amAlphaMapMap[var];
		local bttn = math.ceil( i/amNotesPerPage );
		if ( ( data.colour ) and ( data.colour ~= "" ) ) then
			colour = data.colour;
		else
			colour = AM_RED;
		end
		if ( i == kIndex ) then
			index = math.mod( i, amNotesPerPage );
			keySpecial = getglobal("AlphaMapAlphaMapDetail"..index.."Special");
			key = getglobal("AlphaMapAlphaMapDetail"..index.."Symbol");
			keyText = getglobal("AlphaMapAlphaMapDetail"..index);
			local bttnTmp = getglobal("AlphaMapAlphaMapButtonDtl"..index);
			if ( bttnTmp ) then
				bttn = bttnTmp
				bttn.txt = data.text;
				if ( data.tooltiptxt ) then
					bttn.tttxt = data.tooltiptxt;
				else
					bttn.tttxt = "";
				end
				showKey = true;
				if ( kIndex < ( kIndexMax - 1) ) then
					kIndex = kIndex + 1;
				end
			else
				-- 0 catcher at initialisation
			end
		end

		local symbol, abbreviation = AM_ProcessMultipleCoords(data, bttn, colour, i, noteFrame);

		if ( showKey ) then
			if ( abbreviation ) then
				symbol = abbreviation;
			end
			local previous = getglobal("AlphaMapAlphaMapDetail"..(index-1));
			if ( ( leaveGap ) and ( previous ) ) then
				keyText:ClearAllPoints();
				keyText:SetPoint("TOPLEFT", previous, "BOTTOMLEFT", 0, -(leaveGap * AM_KEY_LEAVE_GAP));
				leaveGap = nil;
			elseif ( previous ) then
				keyText:ClearAllPoints();
				keyText:SetPoint("TOPLEFT", previous, "BOTTOMLEFT", 0, -AM_KEY_DEFAULT_GAP);
			end
			keyText:SetText(data.text);
			keyText:Show();
			if ( symbol == " " ) then
				symbol = AM_BLANK_KEY_SYMBOL;
			end
			if ( ( symbol == nil ) or ( symbol == "" ) or ( symbol == " " ) ) then
				key:SetText( " " );
			else
				key:SetText( colour..symbol.."|r" );
			end
			key:Show();
			if ( data.special ) then
				keySpecial:SetText(data.special);
				keySpecial:Show();
			end
			if ( data.toMap ) then
				bttn.toMap = data.toMap;
			else
				bttn.toMap = nil;
			end

			local lootT = getglobal("AlphaMapAlphaMapDetail"..index.."LootTexture");
			if ( data.lootid ) then
				bttn.lootid = data.lootid;
			else
				bttn.lootid = nil;
			end
			if  ( ( data.lootid ) and ( AtlasLoot_ShowBossLoot ) ) then
				lootT:SetTexture("Interface\AddOns\AlphaMap\Artwork\Gold");
				lootT:Show();
			else
				lootT:Hide();
			end

			local noteT = getglobal("AlphaMapAlphaMapDetail"..index.."NoteTexture");
			if ( ( NuN_GNoteExists) and ( NuN_GNoteExists(data.text) ) ) then
				noteT:Show();
			else
				noteT:Hide();
			end

			if ( data.bgPOI ) then
				bttn.bgPOI = true;
			else
				bttn.bgPOI = false;
			end
			if ( AlphaMapConfig.dmKey ) then
				bttn:Show();
			end
		end

		if ( data.leaveGap ) then
			leaveGap = data.leaveGap;
		else
			leaveGap = nil;
		end
		i = i + 1;
		var = "dtl"..i;
	end

	-- Have we needed multiple pages to display all the notes
	if ( counter > amNotesPerPage ) then
		AM_BrowsePrevPageButton:Show();
		AM_BrowseNextPageButton:Show();
		AM_PageText:SetText(amNotePage);
		AM_PageText:Show();
		local lastPage = math.ceil( counter/amNotesPerPage );

		-- Determine if we are on the first or last page of notes
		if ( amNotePage < 2 ) then
			AM_BrowsePrevPageButton:Disable();
			AM_BrowseNextPageButton:Enable();
			AM_PrevText:Hide();
			AM_NextText:Show();
		elseif ( amNotePage == lastPage ) then
			AM_BrowsePrevPageButton:Enable();
			AM_BrowseNextPageButton:Disable();
			AM_PrevText:Show();
			AM_NextText:Hide();
		else
			AM_BrowsePrevPageButton:Enable();
			AM_BrowseNextPageButton:Enable();
			AM_PrevText:Show();
			AM_NextText:Show();
		end

	else
		AM_BrowsePrevPageButton:Hide();
		AM_BrowseNextPageButton:Hide();
		AM_PageText:Hide();
	end

	-- Hide remaining notes
	i = 1;
	local amNote = getglobal("AlphaMapAlphaMapNote"..(iNote+i));
	while ( amNote ) do
		amNote:Hide();
		i = i + 1;
		amNote = getglobal("AlphaMapAlphaMapNote"..(iNote+i));
	end

end


function AM_ProcessMultipleCoords(data, control, colour, numericSymbol, noteFrame)
	local symbol = nil;
	local abbreviated = nil;
	local baseLvl = noteFrame:GetFrameLevel();

	for i=1, AM_MAX_MULT_COORDS, 1 do
		if ( data.coords[i] ) then
			local x = data.coords[i][1] * AM_INSTANCE_SCALING_FACTOR * AM_ZoomScalingFactor;
			local y = data.coords[i][2] * AM_INSTANCE_SCALING_FACTOR * AM_ZoomScalingFactor;
			if ( ( data.symbol[i] ) and ( data.symbol[i] ~= "" ) ) then
				if ( ( numericSymbol ) and ( data.symbol[i] == "0" ) ) then
					symbol = numericSymbol.."";
				else
					symbol = data.symbol[i];
					if ( i > 1 ) then
						abbreviated = string.sub(symbol, 1, 1) .. AM_ABBREVIATED;
					end
				end
			elseif ( not symbol ) then
				symbol = AM_DFLT_SYMBOL;
			end
			if ( ( x == 0 ) and ( y == 0 ) ) then

			else
				iNote = iNote + 1;
				if ( AlphaMapConfig.dmNotesBg ) then
					AM_UpdateNoteBgColour(iNote);
					getglobal("AlphaMapAlphaMapNote"..iNote.."Background"):Show();
				else
					getglobal("AlphaMapAlphaMapNote"..iNote.."Background"):Hide();
				end
				local note = getglobal("AlphaMapAlphaMapNote"..iNote);
				local noteBttn = getglobal("AlphaMapAlphaMapNote"..iNote.."Button");
				if ( ( symbol == "" ) or ( symbol == " " ) ) then
					getglobal("AlphaMapAlphaMapNote"..iNote.."Text"):SetText( " " );
					noteBttn:Hide();
					note:SetFrameLevel( baseLvl );
				else
					getglobal("AlphaMapAlphaMapNote"..iNote.."Text"):SetText( colour..symbol.."|r" );
					noteBttn:Show();
					note:SetFrameLevel( baseLvl + 1 );
				end
				note:SetAlpha( 1 );
				note.control = control;
				note.txt = data.text;
				if ( data.tooltiptxt ) then
					note.tttxt = data.tooltiptxt;
				else
					note.tttxt = "";
				end
				if ( data.special ) then
					note.special = data.special;
				else
					note.special = nil;
				end
				if ( data.toMap ) then
					note.toMap = data.toMap;
				else
					note.toMap = nil;
				end
				if ( data.lootid ) then
					note.lootid = data.lootid;
				else
					note.lootid = nil;
				end
				note:ClearAllPoints();
				note:SetScale(amUnitScale);
				note:SetPoint("CENTER", noteFrame, "TOPLEFT", x/amUnitScale, -y/amUnitScale);
				if ( AlphaMapConfig.dmNotes ) then
					note:Show();
				else
					note:Hide();
				end

				if ( data.bgPOI ) then
					getglobal("AlphaMapAlphaMapNote"..iNote.."Background"):Hide();
					getglobal("AlphaMapAlphaMapNote"..iNote.."Text"):SetText( "" );
					if ( amBGPOIs[data.text] ) then
						note:SetFrameLevel( baseLvl + 2 );
						getglobal("AlphaMapAlphaMapNote"..iNote.."POI"):SetTexCoord( amBGPOIs[data.text].x1, amBGPOIs[data.text].x2, amBGPOIs[data.text].y1, amBGPOIs[data.text].y2 );
						getglobal("AlphaMapAlphaMapNote"..iNote.."POI"):Show();
					end
					note.bgPOI = true;
					note:Show();
				else
					note.bgPOI = nil;
					getglobal("AlphaMapAlphaMapNote"..iNote.."POI"):Hide();
				end

				if ( data.bgFlag ) then
					getglobal("AlphaMapAlphaMapNote"..iNote.."Background"):Hide();
					getglobal("AlphaMapAlphaMapNote"..iNote.."Text"):SetText( "" );
					AMFlags:SetScale(amUnitScale);
					if ( data.bgFlag == "A" ) then
						getglobal("AlphaMapAlphaMapNote"..iNote.."AFlag"):Show();
						getglobal("AlphaMapAlphaMapNote"..iNote.."HFlag"):Hide();
						AMAText:ClearAllPoints();
						AMAText:SetPoint("LEFT", note, "RIGHT", 1, 0);
						AMAText:Show();
						AMFlags.aNote = iNote;
					else
						getglobal("AlphaMapAlphaMapNote"..iNote.."AFlag"):Hide();
						getglobal("AlphaMapAlphaMapNote"..iNote.."HFlag"):Show();
						AMHText:ClearAllPoints();
						AMHText:SetPoint("LEFT", note, "RIGHT", 1, 0);
						AMHText:Show();
						AMFlags.hNote = iNote;
					end
					note.bgFlag = data.bgFlag;
					note:Show();
				else
					note.bgFlag = nil;
					getglobal("AlphaMapAlphaMapNote"..iNote.."AFlag"):Hide();
					getglobal("AlphaMapAlphaMapNote"..iNote.."HFlag"):Hide();
				end
				if ( data.bgBase ) then
					note.bgBase = data.bgBase;
					AMFlags:SetScale(amUnitScale);
					if ( pFaction == data.bgBase) then
						AMBases:SetText(basesRequired);
						AMBases:ClearAllPoints();
						AMBases:SetPoint("LEFT", note, "RIGHT", 1, 0);
						AMBases:Show();
					end
					note:Show();
				else
					note.bgBase = nil;
				end
			end
		end
	end
	return symbol, abbreviated;
end

function AM_TurnDetailPage(direction)
	if ( not AlphaMapConfig.mute ) then
		PlaySound("igQuestLogOpen");
	end
	amNotePage = amNotePage + direction;
	AM_Notes(amAlphaMapMap);
end



-- Called to toggle visibility of the AlphaMap
function ToggleAlphaMap()
	AM_AutoClosed = nil;
	if ( AlphaMapFrame:IsVisible() ) then
		AlphaMapFrame.UserHidden = true;
		HideUIPanel( AlphaMapFrame );
	else
		if (AlphaMapConfig.enabled) then
			ShowUIPanel( AlphaMapFrame );
		end
	end
end

function ToggleSlider()
	if ( AlphaMapSliderFrame:IsVisible() ) then
		HideUIPanel( AlphaMapSliderFrame );
		AlphaMapConfig.slider = false;
	else
		ShowUIPanel( AlphaMapSliderFrame );
		AlphaMapConfig.slider = true;
	end
	AM_SaveConfig();
end

-- Helper function to increment the opacity by .10
function IncrementAlphaMap(increment)

	-- Determine the transparency from the alpha slider
	local alpha = 1.0 - AlphaMapSliderFrame:GetValue();

	-- Increment the opacity
	alpha = alpha + increment;

	-- Clamp the opacity between 0.0 & 1.0
	if( alpha > 1.1 ) then
		alpha = 1.0;
	end
	if( alpha < 0.0 ) then
		alpha = 0.0;
	end

	SetAlphaMapOpacity( alpha );

end



function AlphaMapUnits_OnUpdate()
	AlphaMapUnits_Update(arg1);
end



-- Called every frame to update the pin overlays on the AlphaMap
function AlphaMapUnits_Update(time)
	if ( ( AlphaMapFrame:IsVisible() ) and ( MouseIsOver(Minimap) ) ) then
		AlphaMapMinimap:Hide();
	end

	amUnitScale = AlphaMap_GetUnitScale();

	AM_Update_Timer_P = AM_Update_Timer_P + time;

	local playerFrame = nil;
	local showingInstanceStyleMapwithPlayers = nil;
	local playerX, playerY = GetPlayerMapPosition("player");

	if ( amMapType == AM_TYP_INSTANCE ) then
		playerX, playerY = 0, 0;
	elseif ( ( amAlphaMapMap ) and ( ( amMapType == AM_TYP_BG ) or ( amMapType == AM_TYP_RAID ) ) ) then
		local zoneName = GetRealZoneText();
		if ( not currentArea ) then
			currentArea = GetMapInfo();		-- best guess
		end
		if ( ( amAlphaMapMap.name == zoneName ) and ( amAlphaMapMap.wmData ) ) then
			showingInstanceStyleMapwithPlayers = true;
			playerFrame = AlphaMapAlphaMapFrame;
		elseif ( ( amAlphaMapMap.name == (zoneName..AM_EXTERIOR) ) and ( amAlphaMapMap.wmData ) ) then
			showingInstanceStyleMapwithPlayers = true;
			playerFrame = AlphaMapAlphaMapFrame;
		elseif ( ( amAlphaMapMap.area ) and ( amAlphaMapMap.area == currentArea ) and ( amAlphaMapMap.wmData ) ) then
			showingInstanceStyleMapwithPlayers = true;
			playerFrame = AlphaMapAlphaMapFrame;
		else
			playerX, playerY = 0, 0;
		end
	else
		playerFrame = AlphaMapDetailFrame;
	end

	--Position player
	AlphaMapLocationText:SetText("");
	if ( ( playerX == 0 and playerY == 0 ) ) then
		AlphaMapMinimap:Hide();
		AlphaMapPing:Hide();
		AlphaMapPlayer:Hide();
	elseif ( playerFrame ) then
		AlphaMapLocationText:SetText( format( "%d, %d", playerX * 100.0, playerY * 100.0) );

		if ( showingInstanceStyleMapwithPlayers ) then
			playerX, playerY = AM_OffsetInstanceCoords(playerX, playerY);
		end

		playerX = playerX *  playerFrame:GetWidth();
		playerY = -playerY * playerFrame:GetHeight();
		if ( AlphaMapConfig.legacy ) then
			AlphaMapPlayer:Hide();
			AlphaMapMinimap:SetScale(amUnitScale);
			AlphaMapMinimap:SetPoint("CENTER", playerFrame, "TOPLEFT", playerX/amUnitScale, playerY/amUnitScale);
			if ( not MouseIsOver(Minimap) ) then
					AlphaMapMinimap:Show();
			end
		else
			AlphaMapMinimap:Hide();
			if ( not amPlayersModel ) then
				amPlayersModel = AM_GetPlayerModelRef();
			end
			AlphaMapPlayer:SetScale(amUnitScale);
			AlphaMapPlayer:SetPoint("CENTER", playerFrame, "TOPLEFT", playerX/amUnitScale, playerY/amUnitScale);
			local amFacing = ( amPlayersModel:GetFacing() + AM_ROTATIONAL_ADJUSTMENT );
			local amSin = math.sin(amFacing);
			local amCos = math.cos(amFacing);
			AM_pArrow:SetTexCoord(	0.5-amSin, 0.5+amCos,
						0.5+amCos, 0.5+amSin,
						0.5-amCos, 0.5-amSin,
						0.5+amSin, 0.5-amCos);
			AlphaMapPlayer:Show();
		end

		-- Position player ping if its shown
		if ( AlphaMapPing:IsVisible() ) then
			AlphaMapPing:SetScale(amUnitScale);
			AlphaMapPing:SetPoint("CENTER", playerFrame, "TOPLEFT", (playerX-7)/amUnitScale, (playerY-9)/amUnitScale);
			-- If ping has a timer greater than 0 count it down, otherwise fade it out
			if ( AlphaMapPing.timer > 0 ) then
				AlphaMapPing.timer = AlphaMapPing.timer - ( time );
				if ( AlphaMapPing.timer <= 0 ) then
					AlphaMapPing.fadeOut = 1;
					AlphaMapPing.fadeOutTimer = MINIMAPPING_FADE_TIMER;
				end
			elseif ( AlphaMapPing.fadeOut ) then
				AlphaMapPing.fadeOutTimer = AlphaMapPing.fadeOutTimer - ( time );
				if ( AlphaMapPing.fadeOutTimer > 0 ) then
					AlphaMapPing:SetAlpha(255 * (AlphaMapPing.fadeOutTimer/MINIMAPPING_FADE_TIMER))
				else
					AlphaMapPing.fadeOut = nil;
					AlphaMapPing:Hide();
				end
			end
		end
	end

	if ( AM_Update_Timer_P > AM_UPDATE_INTERVAL_PMAX ) then
		local countShown = 0;
		AM_Update_Timer_P = 0;

		--Position groupmates
		local partyX, partyY, partyMemberFrame;
		local raidMax = GetNumRaidMembers();
		if( raidMax > 0 and AlphaMapConfig.raid == true ) then
			for i=1, MAX_PARTY_MEMBERS do
				getglobal("AlphaMapParty"..i):Hide();
			end
			if ( playerFrame ) then
				for i=1, raidMax, 1 do
					partyX, partyY = GetPlayerMapPosition( "raid"..i );
					partyMemberFrame = getglobal( "AlphaMapRaid"..i );
					if ( ( ( partyX == 0 ) and ( partyY == 0 ) ) or ( UnitIsUnit( "raid"..i, "player" ) ) ) then
						partyMemberFrame:Hide();
					else
						if ( showingInstanceStyleMapwithPlayers ) then
							partyX, partyY = AM_OffsetInstanceCoords(partyX, partyY);
						end

						partyX =  partyX * playerFrame:GetWidth();
						partyY = -partyY * playerFrame:GetHeight();
						partyMemberFrame.name = nil;
						partyMemberFrame:SetScale(amUnitScale);
						partyMemberFrame:SetPoint( "CENTER", playerFrame, "TOPLEFT", partyX/amUnitScale, partyY/amUnitScale);
						partyMemberFrame:Show();
					end
					countShown = i;
				end
			end
			for i=countShown+1, MAX_RAID_MEMBERS do
				getglobal("AlphaMapRaid"..i):Hide();
			end
		else
			if ( playerFrame ) then
				local max = GetNumPartyMembers();
				for i=1, max, 1 do
					partyX, partyY = GetPlayerMapPosition("party"..i);
					partyMemberFrame = getglobal("AlphaMapParty"..i);
					if ( partyX == 0 and partyY == 0 ) then
						partyMemberFrame:Hide();
					else
						if ( showingInstanceStyleMapwithPlayers ) then
							partyX, partyY = AM_OffsetInstanceCoords(partyX, partyY);
						end

						partyX =  partyX * playerFrame:GetWidth();
						partyY = -partyY * playerFrame:GetHeight();
						partyMemberFrame:SetScale(amUnitScale);
						partyMemberFrame:SetPoint("CENTER", playerFrame, "TOPLEFT", partyX/amUnitScale, partyY/amUnitScale);
						partyMemberFrame:Show();
					end
					countShown = i;
				end
			end
			for i=countShown+1, MAX_PARTY_MEMBERS do
				getglobal("AlphaMapParty"..i):Hide();
			end
			for i=1, MAX_RAID_MEMBERS do
				getglobal("AlphaMapRaid"..i):Hide();
			end
		end

		-- Position Team Members
		if ( AlphaMapConfig.raid ) then
			local playerCount = GetNumRaidMembers();
			if ( not playerCount ) then
				playerCount = 0;
			end
			countShown = playerCount;
			if ( playerFrame ) then
				for i=playerCount+1, MAX_RAID_MEMBERS do
					local teamX, teamY, name = GetBattlefieldPosition(i - playerCount);
					local teamMemberFrame = getglobal("AlphaMapRaid"..i);
					if ( teamX == 0 and teamY == 0 ) then
						teamMemberFrame:Hide();
					else
						if ( showingInstanceStyleMapwithPlayers ) then
							teamX, teamY = AM_OffsetInstanceCoords(teamX, teamY);
						end

						teamX =  teamX * playerFrame:GetWidth();
						teamY = -teamY * playerFrame:GetHeight();
						teamMemberFrame:SetScale(amUnitScale);
						teamMemberFrame:SetPoint("CENTER", playerFrame, "TOPLEFT", teamX/amUnitScale, teamY/amUnitScale);
						teamMemberFrame.name = name;
						teamMemberFrame:Show();
					end
					countShown = i;
				end
			end
			for i=countShown+1, MAX_RAID_MEMBERS, 1 do
				getglobal("AlphaMapRaid"..i):Hide();
			end
		end

		-- Position flags
		local flagX, flagY, flagToken, flagFrame, flagTexture;
		local numFlags = 0;
		if ( playerFrame ) then
			numFlags = GetNumBattlefieldFlagPositions();
			for i=1, numFlags do
				flagX, flagY, flagToken = GetBattlefieldFlagPosition(i);
				flagFrame = getglobal("AlphaMapFlag"..i);
				flagTexture = getglobal("AlphaMapFlag"..i.."Texture");
				if ( flagX == 0 and flagY == 0 ) then
					flagFrame:Hide();
				else
					if ( showingInstanceStyleMapwithPlayers ) then
						flagX, flagY = AM_OffsetInstanceCoords(flagX, flagY);
					end

					flagX =  flagX * playerFrame:GetWidth();
					flagY = -flagY * playerFrame:GetHeight();
					flagFrame:SetScale(amUnitScale);
					flagFrame:SetPoint("CENTER", playerFrame, "TOPLEFT", flagX/amUnitScale, flagY/amUnitScale);
					flagTexture:SetTexture("Interface\\WorldStateFrame\\"..flagToken);
					flagFrame:Show();
				end
			end
		end
		for i=numFlags+1, NUM_WORLDMAP_FLAGS do
			flagFrame = getglobal("AlphaMapFlag"..i);
			flagFrame:Hide();
		end


		--Position corpse
		local corpseX, corpseY = GetCorpseMapPosition();
		if ( ( corpseX == 0 and corpseY == 0 ) or ( not playerFrame ) ) then
			AlphaMapCorpse:Hide();
		else
			if ( showingInstanceStyleMapwithPlayers ) then
				corpseX, corpseY = AM_OffsetInstanceCoords(corpseX, corpseY);
			end

			corpseX =  corpseX * AlphaMapDetailFrame:GetWidth();
			corpseY = -corpseY * AlphaMapDetailFrame:GetHeight();

			AlphaMapCorpse:SetScale(amUnitScale);
			AlphaMapCorpse:SetPoint("CENTER", "AlphaMapDetailFrame", "TOPLEFT", corpseX/amUnitScale, corpseY/amUnitScale);
			AlphaMapCorpse:Show();
		end
	end



	AM_Update_Timer_S = AM_Update_Timer_S + time;

	if ( ( updatingPaused ) and ( not amUnitsRefresh ) ) then
		return;
	end

	if ( ( amMapType == AM_TYP_WM ) and ( AM_Update_Timer_S > AM_UPDATE_INTERVAL_SMAX ) ) then
		AM_Update_Timer_S = 0;

		-- Get Zone/Continent Info
		local zone	= GetCurrentMapZone();
		local continent = GetCurrentMapContinent();

		-- /////////////////////////////////////////////////////////////////
		-- MapNotes 0.5.3 Pins
		-- ////////////////////////////////////////////////////////////////

		local MapNote_DataSet = nil;
		local MapNote_OptionsSet = nil;
		local MapNote_Texture = nil;
		if ( ( MetaMapNotes_Data ) and ( MetaMapNotes_Data[continent] ) and ( MetaMapNotes_Data[continent][zone] ) ) then
			MapNote_DataSet = MetaMapNotes_Data[continent][zone];
			MapNote_OptionsSet = MetaMapNotes_Options;
			MapNote_Texture = "Interface\\AddOns\\MetaMap\\Icons\\Icon";
		elseif ( ( MapNotes_Data ) and ( MapNotes_Data[continent] ) and ( MapNotes_Data[continent][zone] ) ) then
			MapNote_DataSet = MapNotes_Data[continent][zone];
			MapNote_OptionsSet = MapNotes_Options;
			MapNote_Texture = "Interface\\AddOns\\MapNotes\\POIIcons\\Icon";
		end

		-- Check if we're in a valid zone and MapNotes is active
		if ( ( not AlphaMapConfig.amClearView) and ( not amAlphaMapMap ) and ( MapNote_DataSet and AlphaMapConfig.mapnotes == true ) ) then
			local n = 1;

			-- Iterate through the saved MapNotes
			for i, value in MapNote_DataSet do

				local temp = getglobal( "AlphaMapNotesPOI"..i );
				temp:SetScale(amUnitScale);
				temp:SetPoint("CENTER", "AlphaMapDetailFrame", "TOPLEFT", ((MapNote_DataSet[i].xPos)*AlphaMapDetailFrame:GetWidth()/amUnitScale), -((MapNote_DataSet[i].yPos)*AlphaMapDetailFrame:GetHeight()/amUnitScale) );

				local myTexture = getglobal( "AlphaMapNotesPOI"..i.."Texture" );
				myTexture:SetTexture( MapNote_Texture..MapNote_DataSet[i].icon );

				if ( not MapNote_OptionsSet ) then
					temp:Show();
				else
					if( MapNote_OptionsSet[ MapNote_DataSet[i].icon ] ~= "off" and ((MapNote_OptionsSet[10] ~= "off" and MapNote_DataSet[i].creator == amPlayer) or (MapNote_OptionsSet[11] ~= "off" and MapNote_DataSet[i].creator ~= amPlayer))) then
						temp:Show();
					else
						temp:Hide();
					end
				end

				n = n + 1;
			end

			-- Hide all the others
			for i=n, NUM_ALPHAMAP_MAPNOTE_POIS, 1 do
				getglobal( "AlphaMapNotesPOI"..i ):Hide();
			end
		else
			for i=1, NUM_ALPHAMAP_MAPNOTE_POIS, 1 do
				getglobal("AlphaMapNotesPOI"..i):Hide();
			end
		end

		-- ////////////////////////////////////////////////////////////////
		-- CTMapMod Notes
		-- ////////////////////////////////////////////////////////////////

		if ( ( CT_UserMap_Notes ) and ( CT_MapMod_GetZoneName ) ) then
			AM_DrawCTMapNotes(continent, zone);
		end

		-- ////////////////////////////////////////////////////////////////
		-- Zone FlightMap Icons
		--/////////////////////////////////////////////////////////////////

		if ( FlightMapUtil ) then
			AM_DrawFlightMasters(continent, zone);
		end

		-- ////////////////////////////////////////////////////////////////
		-- MapNotes Gathering 0.5.6 Pins
		-- ////////////////////////////////////////////////////////////////

		if ( ( not AlphaMapConfig.amClearView) and ( not amAlphaMapMap ) and ( zone ~= 0 and MapNotesGathering_Data and AlphaMapConfig.gathering == true ) ) then
			for i=1, getn( MapNotesGathering_Data[continent][zone] ), 1 do

				local temp = getglobal( "AlphaMapGatheringPOI"..i );
				local icon = MapNotesGathering_Data[continent][zone][i].icon;

				if (icon ~= nil and icon ~= 0) then --workaround for the bug in the first version...
					if ((MapNotes_Options.showherbs and icon > 9 and icon <= 38 and
					    MapNotes_Options["Gathering"][icon] ~= "off") or
					    (MapNotes_Options.showveins and icon <= 9 and
					    MapNotes_Options["Gathering"][icon] ~= "off") or
					    (MapNotes_Options.showchests and icon >= 39)) then
						temp:SetScale(amUnitScale);
						temp:SetPoint("CENTER", "AlphaMapDetailFrame", "TOPLEFT", ((MapNotesGathering_Data[continent][zone][i].xPos)*AlphaMapDetailFrame:GetWidth()/amUnitScale), -((MapNotesGathering_Data[continent][zone][i].yPos)*AlphaMapDetailFrame:GetHeight()/amUnitScale));
						getglobal("AlphaMapGatheringPOI"..i.."Texture"):SetTexture("Interface\\AddOns\\MapNotesGathering\\POIIcons\\Icon"..icon);
						temp:Show();
					else
						temp:Hide();
					end
				else
					temp:Hide();
				end
			end
			for i=(getn( MapNotesGathering_Data[continent][zone])+1 ), NUM_ALPHAMAP_GATHERNOTE_POIS, 1 do
				getglobal("AlphaMapGatheringPOI"..i):Hide();
			end
		else
			for i=1, NUM_ALPHAMAP_GATHERNOTE_POIS, 1 do
				getglobal("AlphaMapGatheringPOI"..i):Hide();
			end
		end

		-- ////////////////////////////////////////////////////////////////
		-- Gatherer 1.9.12 Pins
		-- ////////////////////////////////////////////////////////////////

		DrawAlphaMapGatherer();

		amUnitsRefresh = nil;
	end

end


function AM_DrawCTMapNotes(continent, zone)
	local zName = CT_MapMod_GetZoneName(zone, GetMapZones(continent));
	local y = 1;

	if ( ( not AlphaMapConfig.amClearView) and ( not amAlphaMapMap ) and ( CT_UserMap_Notes[zName] ) and ( AlphaMapConfig.mapnotes == true ) ) then
		for i, var in CT_UserMap_Notes[zName] do
			if ( y > CT_NUM_USERMAP_NOTES ) then
				break;
			end
			if ( not CT_MapMod_Options[amPlayer.."@"..GetCVar("realmName")].hideGroups[CT_MAPMOD_SETS[(var.set or 1)]] and ( not CT_MapMod_Filter or string.find(strlower(var.name), strlower(CT_MapMod_Filter)) or string.find(strlower(var.descript), strlower(CT_MapMod_Filter)) ) ) then
				local note = getglobal("AMCT_UserMap_Note"..y);
				local iconTexture = getglobal("AMCT_UserMap_Note"..y.."Icon");

				if ( ( var.set == 7 ) or ( var.set == 8 ) ) then
					local offset = 0;
					if ( var.set == 8 ) then
						offset = 29;
					end
					if ( CT_UserMap_HerbIcons[var.icon+offset] ) then
						iconTexture:SetTexture("Interface\\AddOns\\CT_MapMod\\Resource\\"..CT_UserMap_HerbIcons[var.icon+offset]);
					else
						iconTexture:SetTexture("Interface\\AddOns\\CT_MapMod\\Resource\\Herb_Bruiseweed");
					end
				else
					iconTexture:SetTexture("Interface\\AddOns\\CT_MapMod\\Skin\\"..CT_UserMap_Icons[var.set]);
				end
				note:SetScale(amUnitScale);
				note:SetPoint("CENTER", "AlphaMapDetailFrame", "TOPLEFT", (var.x*AlphaMapDetailFrame:GetWidth()/amUnitScale), -(var.y*AlphaMapDetailFrame:GetHeight()/amUnitScale));
				note:Show();

				if ( not var.name ) then
					var.name = "";
				end
				if ( ( not var.set ) or ( not CT_MAPMOD_SETS[var.set] ) ) then
					var.set = 1;
				end
				if ( not var.descript ) then
					var.descript = "";
				end

				note.name = var.name;
				note.set = CT_MAPMOD_SETS[var.set];
				note.descript = var.descript;
				y = y + 1;
			end
		end
	end

	for i = y, CT_NUM_USERMAP_NOTES, 1 do
		getglobal("AMCT_UserMap_Note"..i):Hide();
	end
end


function AM_DrawFlightMasters(continent, zone)
	local POI = 1;

	if ( ( zone ~= 0 ) and ( not AlphaMapConfig.amClearView) and ( not amAlphaMapMap ) and ( AlphaMapConfig.mapnotes == true ) and ( FlightMapUtil.getZoneName )  ) then
		local zoneName = FlightMapUtil.getZoneName();
		local nodes = FlightMapUtil.getNodesInZone(zoneName, false);
		for node, data in nodes do
			if ( AM_ShowFlightNode(node, data, POI) ) then
				POI = POI + 1;
			end
		end
	end

	for i = POI, FLIGHTMAP_MAX_POIS, 1 do
		getglobal("AM_FlightMapPOI"..i):Hide();
	end
end


function AM_ShowFlightNode(node, data, num)
	if ( not data.Location.Zone ) then
		return nil;
	end

	if ( num > FLIGHTMAP_MAX_POIS ) then
		return nil;
	end

	local x = data.Location.Zone.x * AlphaMapDetailFrame:GetWidth();
	local y = data.Location.Zone.y * AlphaMapDetailFrame:GetHeight();

	if ( AM_FlightCheck_CloseToExistingPOI(x, y) ) then
		return nil;
	end

	local name = FlightMapUtil.getNameAndZone(data.Name);
	local button = getglobal("AM_FlightMapPOI"..num);
	local bTexture = getglobal("AM_FlightMapPOI"..num.."Texture");

	if ( not FlightMapUtil.knownNode(node) ) then
		if ( not FlightMap.Opts.showAllInfo ) then
			return nil;
		end
		bTexture:SetTexture(FLIGHTMAP_POI_OTHER);
	else
		bTexture:SetTexture(FLIGHTMAP_POI_KNOWN);
	end

	button.name = name;
	button.data = data;
	button.node = node;
	button:SetScale(amUnitScale);
	button:SetPoint("CENTER", "AlphaMapDetailFrame", "TOPLEFT", x/amUnitScale, -y/amUnitScale);
	button:Show();

	return true;
end

function AM_FlightCheck_CloseToExistingPOI(x, y)
    for i = 1, NUM_ALPHAMAP_POIS, 1 do
        local button = getglobal("AlphaMapPOI" .. i);
        if button:IsVisible() then
            local _, _, index, _, _ = GetMapLandmarkInfo(i);
            -- Index 15 is an invisible POI
            if index ~= 15 then
                local px, py = button:GetCenter();
                if ( ( px ) and ( py ) ) then
	                px = px - AlphaMapDetailFrame:GetLeft();
	                py = py - AlphaMapDetailFrame:GetBottom();
	                if abs(px - x) < FLIGHTMAP_CLOSE and
	                abs(py - y) < FLIGHTMAP_CLOSE then
	                    return true;
	                end
		end                
            end
        end
    end
    return false;
end



-- Helper function to set the opacity of the AlphaMap
function SetAlphaMapOpacity(alpha)

	-- Determine the transparency
	if ( not alpha ) then
		alpha = 1.0 - AlphaMapSliderFrame:GetValue();
	else
		AlphaMapSliderFrame:SetValue( 1.0 - alpha );
	end
	local txtAlpha = alpha/2 + 0.4;

	if ( AM_ChangingOriWorldMap ) then
		WorldMapFrame:SetAlpha( alpha );
	else
		if ( amAlphaMapMap ) then
			AlphaMapAlphaMapFrame:SetAlpha( alpha );
			if ( alpha == 0 ) then
				txtAlpha = 0;
			end
			AlphaMapAlphaMapTitleFrame:SetAlpha( txtAlpha );
			AlphaMapAlphaMapPreReqFrame:SetAlpha( txtAlpha );
			AlphaMapAlphaMapDetailsFrame:SetAlpha( txtAlpha );
		else
			AlphaMapDetailFrame:SetAlpha( alpha );
			if ( alpha == 0.0 ) then
				AlphaMapUnits:Hide();
			else
				AlphaMapUnits:Show();
			end
		end

		if ( AlphaMapSliderFrame ) then
			AlphaMapSliderFrame:SetAlpha( txtAlpha );
		end
	end

	AlphaMapConfig.alpha = alpha;
end

-- Function to extract the next param from the command line
function AlphaMap_Extract_NextParameter(msg)
	local params = msg;
	local command = params;
	local index = strfind(command, " ");
	if ( index ) then
		command = strsub(command, 1, index-1);
		params = strsub(params, index+1);
	else
		params = "";
	end
	return command, params;
end

-- Function to handle slash commands
function AlphaMap_Main_ChatCommandHandler(msg)

	local commandName, params = AlphaMap_Extract_NextParameter(msg);
	if ((commandName) and (strlen(commandName) > 0)) then
		commandName = string.lower(commandName);
	else
		commandName = "";
	end

    -- Enable via slash command
	if( strfind( commandName, "enable" ) ) then
	        AlphaMap_ReEnable();
	        return;
	end

    -- If we are disabled, ignore all other commands
    if (not AlphaMapConfig.enabled) or (AlphaMapConfig.enabled == false) then
        AlphaMap_Print(ALPHA_MAP_DISABLED_HINT);
        return;
    end

	-- Check if we should toggle disable AlphaMap
	if( strfind( commandName, "disable" ) ) then
        	AlphaMap_Disable();

	-- Check if we should toggle on/off the AlphaMap
	elseif ( ( strfind( commandName, "tog" ) ) or ( strfind(commandName, "show") ) or ( strfind(commandName, "display") ) ) then
		ToggleAlphaMap();

	-- Check if we should lock the UI
	elseif( strfind( commandName, "lock" ) ) then
        	AlphaMap_Lock_Toggle();

	-- Check if we should reset config options to the defaults
	elseif (strfind(commandName, "reset")) then
		 AlphaMap_ResetAll();

	-- Check if we should scale the window
	elseif( strfind( commandName, "scale" ) ) then
		local scale = tonumber(params);

		if ( ( not scale ) or ( scale < 0.0 ) ) then
			scale = 1.0;
		end

		AlphaMapConfig.scale = scale;

		AlphaMapFrame:SetScale( scale );


	-- Check if we should allow movement of the slider
	-- NOTE: This must be checked BEFORE "slider"
	elseif( strfind(commandName, "moveslider" ) ) then
		AlphaMapConfig.sliderlock = not AlphaMapConfig.sliderlock;

		if( AlphaMapConfig.sliderlock == false ) then
			AlphaMap_Print( ALPHA_MAP_CONFIG_SLIDER_STATE..ALPHA_MAP_GREEN_ENABLED );
			AlphaMapSliderMovementFrame:Show();
		else
			AlphaMap_Print( ALPHA_MAP_CONFIG_SLIDER_STATE..ALPHA_MAP_RED_DISABLED );
			AlphaMapSliderMovementFrame:Hide();
		end

	-- Check if we should Toggle on/off display of the slider
	elseif (strfind(commandName, "slider")) then
		 ToggleSlider();

	--  Check if we should autoclose AM on combat
	elseif (strfind(commandName, "combat")) then
		 AlphaMapConfig.combat = not AlphaMapConfig.combat;
		AM_AutoClosed = nil;

		 if( AlphaMapConfig.combat == true ) then
			AlphaMap_Print( ALPHA_MAP_CONFIG_COMBAT_STATE..ALPHA_MAP_GREEN_ENABLED );
		 else
			AlphaMap_Print( ALPHA_MAP_CONFIG_COMBAT_STATE..ALPHA_MAP_RED_DISABLED );
		 end

	elseif ( ( strfind(commandName, "reopen") ) or ( strfind(commandName, "re-open") ) ) then
		AlphaMapConfig.reopen = not AlphaMapConfig.reopen;
		AM_AutoClosed = nil;

		if ( AlphaMapConfig.reopen == true ) then
			AlphaMap_Print( ALPHA_MAP_CONFIG_REOPEN_STATE..ALPHA_MAP_GREEN_ENABLED );
		else
			AlphaMap_Print( ALPHA_MAP_CONFIG_REOPEN_STATE..ALPHA_MAP_RED_DISABLED );
		end

	--  Check if we should show raid pins
	elseif (strfind(commandName, "raid")) then
		 AlphaMapConfig.raid = not AlphaMapConfig.raid;

		 if( AlphaMapConfig.raid == true ) then
			AlphaMap_Print( ALPHA_MAP_CONFIG_RAID_STATE..ALPHA_MAP_GREEN_ENABLED );
		 else
			AlphaMap_Print( ALPHA_MAP_CONFIG_RAID_STATE..ALPHA_MAP_RED_DISABLED );
		 end

	-- check if we should display party/raid tooltips
	elseif (strfind(commandName, "ptips")) then
		AlphaMapConfig.ptips = not AlphaMapConfig.ptips;

		if( AlphaMapConfig.ptips == true ) then
			AlphaMap_Print( ALPHA_MAP_CONFIG_PTIPS_STATE..ALPHA_MAP_GREEN_ENABLED );
		 else
			AlphaMap_Print( ALPHA_MAP_CONFIG_PTIPS_STATE..ALPHA_MAP_RED_DISABLED );
		end

	-- check if we should display Gatherer tooltips
	elseif( strfind( commandName, "mntips" ) ) then
		AlphaMapConfig.mntips = not AlphaMapConfig.mntips;

		if( AlphaMapConfig.mntips == true ) then
			AlphaMap_Print( ALPHA_MAP_CONFIG_MNTIPS_STATE..ALPHA_MAP_GREEN_ENABLED );
		 else
			AlphaMap_Print( ALPHA_MAP_CONFIG_MNTIPS_STATE..ALPHA_MAP_RED_DISABLED );
		end

	-- check if we should display Gatherer tooltips
	elseif( strfind( commandName, "mngtips" ) ) then
		AlphaMapConfig.mngtips = not AlphaMapConfig.mngtips;

		if( AlphaMapConfig.mngtips == true ) then
			AlphaMap_Print( ALPHA_MAP_CONFIG_MNGTIPS_STATE..ALPHA_MAP_GREEN_ENABLED );
		 else
			AlphaMap_Print( ALPHA_MAP_CONFIG_MNGTIPS_STATE..ALPHA_MAP_RED_DISABLED );
		end

	-- check if we should display Gatherer tooltips
	elseif (strfind(commandName, "gtips")) then
		AlphaMapConfig.gtips = not AlphaMapConfig.gtips;

		if( AlphaMapConfig.gtips == true ) then
			AlphaMap_Print( ALPHA_MAP_CONFIG_GTIPS_STATE..ALPHA_MAP_GREEN_ENABLED );
		 else
			AlphaMap_Print( ALPHA_MAP_CONFIG_GTIPS_STATE..ALPHA_MAP_RED_DISABLED );
		end

	-- Check if we should set the alpha
	elseif (strfind(commandName, "alpha")) then
		local alpha = tonumber(params);

		if ( ( not alpha ) or ( alpha < 0 ) ) then
			alpha = 0.0;
		end

		if ( alpha > 1.0 ) then
			alpha = 1.0;
		end

		SetAlphaMapOpacity( alpha );


	-- Check if we should close AlphaMap when the World Map Closes
	elseif (strfind(commandName, "wmclose")) then
		AlphaMapConfig.wmclose = not AlphaMapConfig.wmclose;

		if( AlphaMapConfig.wmclose == true ) then
			AlphaMap_Print( ALPHA_MAP_CONFIG_WMCLOSE_STATE..ALPHA_MAP_GREEN_ENABLED );
		 else
			AlphaMap_Print( ALPHA_MAP_CONFIG_WMCLOSE_STATE..ALPHA_MAP_RED_DISABLED );
		end

	-- Check if we should show MapNotes Gathering Pins
	elseif (strfind(commandName, "gathering")) then
		AlphaMapConfig.gathering = not AlphaMapConfig.gathering;

		if( AlphaMapConfig.gathering == true ) then
			AlphaMap_Print( ALPHA_MAP_CONFIG_GATHERING_STATE..ALPHA_MAP_GREEN_ENABLED );
		 else
			AlphaMap_Print( ALPHA_MAP_CONFIG_GATHERING_STATE..ALPHA_MAP_RED_DISABLED );
		end

	-- Check if we should show Gatherer Pins
	elseif (strfind(commandName, "gatherer")) then
		AlphaMapConfig.gatherer = not AlphaMapConfig.gatherer;

		if( AlphaMapConfig.gatherer == true ) then
			AlphaMap_Print( ALPHA_MAP_CONFIG_GATHERER_STATE..ALPHA_MAP_GREEN_ENABLED );
		 else
			AlphaMap_Print( ALPHA_MAP_CONFIG_GATHERER_STATE..ALPHA_MAP_RED_DISABLED );
		end

	-- Check if we should show MapNotes Pins
	elseif (strfind(commandName, "mapnotes")) then
		AlphaMapConfig.mapnotes = not AlphaMapConfig.mapnotes;

		if( AlphaMapConfig.mapnotes == true ) then
			AlphaMap_Print( ALPHA_MAP_CONFIG_MAPNOTES_STATE..ALPHA_MAP_GREEN_ENABLED );
		 else
			AlphaMap_Print( ALPHA_MAP_CONFIG_MAPNOTES_STATE..ALPHA_MAP_RED_DISABLED );
		end

	elseif ( strfind(commandName, "minimap") ) then
		AlphaMapConfig.minimap = not AlphaMapConfig.minimap;

		if ( AM_MinimapFrame:IsVisible() ) then
			AM_MinimapFrame:Hide();
		else
			AM_MinimapFrame:Show();
		end
		AM_UpdateMinimapButton();

	elseif ( strfind(commandName, "legacy") ) then
		AlphaMapConfig.legacy = not AlphaMapConfig.legacy;

	elseif ( ( strfind(commandName, "help") ) or ( strfind(commandName, "?") ) ) then
		ShowSlashCommands();

	else
		-- If all else fails, output the help info
--        	ShowSlashCommands();
        	if ( AM_OptionsFrame:IsVisible() ) then
        		AM_OptionsFrame:Hide();
        	else
        		AM_OptionsFrame:Show();
        	end
	end
	if ( AM_OptionsFrame:IsVisible() ) then
		AM_OptionsFrame:Hide();
		AM_OptionsFrame:Show();
	end
end

function DrawAlphaMapGatherer()

	local i = 1;

	if ( ( not AlphaMapConfig.amClearView) and ( not amAlphaMapMap ) and ( GatherConfig and GatherConfig.useMainmap and AlphaMapConfig.gatherer == true ) ) then

		-- Get Current Conteninent and Zone
		local mapContinent  	= GetCurrentMapContinent();
		local mapZone		= GetCurrentMapZone();
		local userConfig	= GatherConfig.users[amPlayer];
		local oreSkill;
		local herbSkill;
		if ( userConfig ) then
			oreSkill 	= userConfig.minSetOreSkill;
			herbSkill	= userConfig.minSetHerbSkill;
		end
		if ( not oreSkill ) then
			oreSkill = -99;
		end
		if ( not herbSkill ) then
			herbSkill = -99;
		end

		if ((mapContinent ~= 0) and (mapZone ~= 0) and ( GatherItems[mapContinent] ) and
				( GatherItems[mapContinent][mapZone] )) then

			local interested = {};

			if ( ( userConfig ) and ( userConfig.interested ) ) then
				for index, value in userConfig.interested do
					interested[index] = {};
					for index2, value2 in value do
						interested[index][index2] = true;
						if ( not interested[index].entries ) then
							interested[index].entries = true;
						end
					end
				end
			end

			-- Iterate through all the pins in the current zone
			for gatherName, gatherData in GatherItems[mapContinent][mapZone] do

				local gatherType   = "Default";
				local numGatherType = -1;
				local minSkillLvl = -99;
				local specificType = "";
				local allowed      = true;

				-- Check for specific types
				specificType = Gatherer_FindOreType(gatherName);
				if (specificType) then
					numGatherType = 2;
					gatherType = "Ore";
					allowed = Gatherer_GetFilter("mining");
					minSkillLvl = oreSkill;
				else
					specificType = Gatherer_FindTreasureType(gatherName);
					if (specificType) then
						numGatherType = 0;
						gatherType = "Treasure";
						allowed = Gatherer_GetFilter("treasure");
					else
						specificType = gatherName;
						numGatherType = 1;
						gatherType = "Herb";
						allowed = Gatherer_GetFilter("herbs");
						minSkillLvl = herbSkill;
					end
				end

				if( not specificType ) then
					specificType = "default";
				end

				if ( ( interested[numGatherType] ) and ( interested[numGatherType].entries ) ) then
					if ( not interested[numGatherType][specificType] ) then
						allowed = nil;
					end
				end

				if ( allowed ) then
					local itemLvl = Gather_SkillLevel[specificType];
					local rareItemLvl = Gather_SkillLevel[Gather_RareMatch[specificType]];

					if ( ( itemLvl ) and ( minSkillLvl > itemLvl ) ) then
						allowed = nil;
					elseif ( ( rareItemLvl ) and ( GatherConfig.rareOre == 1 ) and ( minSkillLvl > rareItemLvl ) ) then
						allowed = nil;
					end
				end

				if ( allowed ) then
					for hPos, gatherInfo in gatherData do
						if ((gatherInfo.x)   and (gatherInfo.y) and (gatherInfo.x>0) and
						    (gatherInfo.y>0) and ( i <= am_MaxGNotes)) then

							-- Get the frame
							local mainNote = getglobal( "AlphaMapGathererPOI"..i );

							-- Determine coordinates for note
							local mnX,mnY;
							mnX =  gatherInfo.x / 100 * AlphaMapDetailFrame:GetWidth();
							mnY = -gatherInfo.y / 100 * AlphaMapDetailFrame:GetHeight();

							-- Set note properties
							--mainNote:SetAlpha(AM_DEFAULT_SCALE);
							mainNote:SetScale(amUnitScale);
							mainNote:SetPoint( "CENTER", "AlphaMapDetailFrame", "TOPLEFT", mnX/amUnitScale, mnY/amUnitScale );
							mainNote:SetFrameLevel( this:GetFrameLevel() + 1 );
							mainNote.toolTip = Gatherer_TitleCase(specificType);

							if( not Gather_IconSet["iconic"][gatherType] ) then
								gatherType = "Default";
							end

							local texture = Gather_IconSet["iconic"][gatherType][specificType];
							if( not texture ) then
								texture = Gather_IconSet["iconic"][gatherType]["default"];
							end

							local gathererTexture = getglobal( "AlphaMapGathererPOI"..i.."Texture" );
							gathererTexture:SetTexture( texture );

							mainNote:Show();

							i = i + 1;
						end
					end
				end
			end
		end
	end
	for j=i, am_MaxGNotes, 1 do
		local mainNote = getglobal( "AlphaMapGathererPOI"..j );
		mainNote:Hide();
	end
end

function AlphaMapNotes_OnEnter( id, noteFrame )
	local MapNote_DataSet = nil;
	local MapNote_ZShift = nil;
	local MapNote_Clrs = nil;
	local createdBy = "";

	AlphaMapTooltipData.frame = noteFrame;

	if ( ( MetaMapNotes_Data ) and ( MetaMapNotes_Data ) ) then
		MapNote_DataSet = MetaMapNotes_Data;
		MapNote_ZShift = MetaMapNotes_ZoneShift;
		MapNote_Clrs = MetaMapNotes_Colors;
		MapNote_Opts = MetaMapOptions;
		createdBy = METAMAPNOTES_CREATEDBY;
	elseif ( ( MapNotes_Data ) and ( MapNotes_Data ) ) then
		MapNote_DataSet = MapNotes_Data;
		MapNote_ZShift = MapNotes_ZoneShift;
		MapNote_Clrs = MapNotes_Colors;
		MapNote_Opts = {};
		MapNote_Opts.TooltipWrap = nil;
		createdBy = MAPNOTES_CREATEDBY;
	end

	if( MapNote_DataSet and AlphaMapConfig.mntips == true ) then
		local x, y = GetCursorPosition();
		if ( x > 500 ) then
			GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT");
		else
			GameTooltip:SetOwner(this, "ANCHOR_TOPLEFT");
		end

		local zone		= MapNote_ZShift[GetCurrentMapContinent()][GetCurrentMapZone()];
		local continent 	= GetCurrentMapContinent();
		local cNr;

		if ( ( MapNote_DataSet[continent] ) and ( MapNote_DataSet[continent][zone] ) and ( MapNote_DataSet[continent][zone][id] ) ) then
			MapNote_DataSet = MapNote_DataSet[continent][zone][id];
			if ( MapNote_DataSet.ncol ) then
				cNr = MapNote_DataSet.ncol;
			else
				cNr = 0;
			end
		else
			return;
		end

		GameTooltip:SetText( MapNote_DataSet.name, MapNote_Clrs[cNr].r, MapNote_Clrs[cNr].g, MapNote_Clrs[cNr].b, MapNote_Opts.TooltipWrap);

		if ((MapNote_DataSet.inf1 ~= nil) and (MapNote_DataSet.inf1 ~= "")) then
			cNr = MapNote_DataSet.in1c;
			if ( not cNr ) then
				cNr = 0;
			end
			GameTooltip:AddLine(MapNote_DataSet.inf1, MapNote_Clrs[cNr].r, MapNote_Clrs[cNr].g, MapNote_Clrs[cNr].b, MapNote_Opts.TooltipWrap);
		end
		if ((MapNote_DataSet.inf2 ~= nil) and (MapNote_DataSet.inf2 ~= "")) then
			cNr = MapNote_DataSet.in2c;
			if ( not cNr ) then
				cNr = 0;
			end
			GameTooltip:AddLine(MapNote_DataSet.inf2, MapNote_Clrs[cNr].r, MapNote_Clrs[cNr].g, MapNote_Clrs[cNr].b, MapNote_Opts.TooltipWrap);
		end

		GameTooltip:AddDoubleLine( createdBy, MapNote_DataSet.creator, 0.49, 0.39, 0.0, 0.49, 0.39, 0.0 );
		AlphaMap_ShowTooltip();
	end
end


function AlphaCTMapNotes_OnEnter( id )
	if ( ( CT_UserMap_Notes ) and ( AlphaMapConfig.mntips == true ) ) then
		local x, y = GetCursorPosition();
		if ( x > 500 ) then
			GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT");
		else
			GameTooltip:SetOwner(this, "ANCHOR_TOPLEFT");
		end

		GameTooltip:ClearLines();

		GameTooltip:AddDoubleLine(this.name, this.set, 0, 1, 0, 0.6, 0.6, 0.6);
		if ( this.descript ) then
			GameTooltip:AddLine(this.descript, nil, nil, nil, 1);
		end
		AlphaMap_ShowTooltip();
	end
end

function AlphaMapGatherer_OnEnter(icon)
	if( AlphaMapConfig.gtips == true ) then
		local x, y = GetCursorPosition();
		if ( x > 500 ) then
			GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT");
		else
			GameTooltip:SetOwner(this, "ANCHOR_TOPLEFT");
		end
		GameTooltip:ClearLines();
		GameTooltip:AddLine(icon.toolTip, 1, 0.7, 0);
		AlphaMap_ShowTooltip();
	end
end

function AlphaMapNotes_OnLeave( id )
	AlphaMap_HideTooltip();
end

function AlphaNotesGathering_OnEnter(id)

	if( MapNotesGathering_Data and AlphaMapConfig.gathering == true ) then

		local x, y = GetCursorPosition();
		if ( x > 500 ) then
			GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT");
		else
			GameTooltip:SetOwner(this, "ANCHOR_TOPLEFT");
		end

		local zone	= GetCurrentMapZone();
		local continent = GetCurrentMapContinent();

		GameTooltip:SetText(MapNotesGathering_Names[MapNotesGathering_Data[continent][zone][id].icon][MapNotesGathering_Data[continent][zone][id].subname], MapNotes_Colors[0].r, MapNotes_Colors[0].g, MapNotes_Colors[0].b);

		local xPos = MapNotesGathering_Data[continent][zone][id].xPos;
		local yPos = MapNotesGathering_Data[continent][zone][id].yPos;

		for i=1, getn(MapNotesGathering_Data[continent][zone]), 1 do
			if (i ~= id and abs(MapNotesGathering_Data[continent][zone][i].xPos - xPos) <= 0.0009765625 * MapNotes_MinDiff and abs(MapNotesGathering_Data[continent][zone][i].yPos - yPos) <= 0.0013020833 * MapNotes_MinDiff) then
				local icon = MapNotesGathering_Data[continent][zone][i].icon;

				if ((MapNotes_Options.showherbs and icon > 9 and icon <= 38 and MapNotes_Options["Gathering"][icon] ~= "off") or (MapNotes_Options.showveins and icon <= 9 and MapNotes_Options["Gathering"][icon] ~= "off") or (MapNotes_Options.showchests and icon == 39)) then
					GameTooltip:AddLine(MapNotesGathering_Names[icon][MapNotesGathering_Data[continent][zone][i].subname], MapNotes_Colors[0].r, MapNotes_Colors[0].g, MapNotes_Colors[0].b);
				end
			end
		end
		AlphaMap_ShowTooltip();
	end
end

function AlphaNotesGathering_OnLeave(id)
	AlphaMap_HideTooltip();
end

function AM_FlightMapPOIButton_OnEnter(thePOI)
	if ( AlphaMapConfig.mntips == true ) then
		local x, y = thePOI:GetCenter();
		local parentX, parentY = AlphaMapDetailFrame:GetCenter();
		if (x > parentX) then
			GameTooltip:SetOwner(thePOI, "ANCHOR_LEFT");
		else
			GameTooltip:SetOwner(thePOI, "ANCHOR_RIGHT");
		end

		FlightMapUtil.addFlightsForNode(GameTooltip, thePOI.node, "");
		AlphaMap_ShowTooltip();
	end
end

function AlphaMapUnit_OnEnter(unit)
	if ( AlphaMapConfig.ptips ) then
		local unitPin;
		local newLine = "";
		local ttText = "";
		local x, y = unit:GetCenter();
		local parentX, parentY = unit:GetParent():GetCenter();
		if ( x > parentX ) then
			GameTooltip:SetOwner(unit, "ANCHOR_LEFT");
		else
			GameTooltip:SetOwner(unit, "ANCHOR_RIGHT");
		end

		if ( MouseIsOver(AlphaMapPlayer) ) then
			ttText = ttText..amPlayer;
			newLine = "\n";
		end

		-- Check party
		for i=1, MAX_PARTY_MEMBERS do
			unitPin = getglobal("AlphaMapParty"..i);
			if ( unitPin:IsVisible() and MouseIsOver(unitPin) ) then
				ttText = ttText..newLine..UnitName(unitPin.unit);
				newLine = "\n";
			end
		end

		--Check Raid
		for i=1, MAX_RAID_MEMBERS do
			unitPin = getglobal("AlphaMapRaid"..i);
			if ( unitPin:IsVisible() and MouseIsOver(unitPin) ) then
				-- Handle players not in your raid or party, but on your team
				if ( unitPin.name ) then
					ttText = ttText..newLine..unitPin.name;
				elseif ( unitPin.unit ) then
					ttText = ttText..newLine..UnitName(unitPin.unit);
				end
				newLine = "\n";
			end
		end

		GameTooltip:SetText(ttText);
		AlphaMap_ShowTooltip();
	end
end


-- <= == == == == == == == == == == == == =>
-- => New utility functions
-- <= == == == == == == == == == == == == =>

function ShowSlashCommands()
    AlphaMap_Print(AM_SLASH_HELP_USAGE);
    AlphaMap_Print(AM_SLASH_HELP_TOG);
    AlphaMap_Print(AM_SLASH_HELP_HELP);
    AlphaMap_Print(AM_SLASH_HELP_ALPHA);
    AlphaMap_Print(AM_SLASH_HELP_AUTOCLOSE);
    AlphaMap_Print(AM_SLASH_HELP_AUTOOPEN);
    AlphaMap_Print(AM_SLASH_HELP_ENABLE);
    AlphaMap_Print(AM_SLASH_HELP_DISABLE);
    AlphaMap_Print(AM_SLASH_HELP_GATHERER);
    AlphaMap_Print(AM_SLASH_HELP_GATHERING);
    AlphaMap_Print(AM_SLASH_HELP_GTIPS);
    AlphaMap_Print(AM_SLASH_HELP_LOCK);
    AlphaMap_Print(AM_SLASH_HELP_MAPNOTES);
    AlphaMap_Print(AM_SLASH_HELP_MNGTIPS);
    AlphaMap_Print(AM_SLASH_HELP_MNTIPS);
    AlphaMap_Print(AM_SLASH_HELP_MOVESLIDER);
    AlphaMap_Print(AM_SLASH_HELP_PTIPS);
    AlphaMap_Print(AM_SLASH_HELP_RAID);
    AlphaMap_Print(AM_SLASH_HELP_RESET);
    AlphaMap_Print(AM_SLASH_HELP_SCALE);
    AlphaMap_Print(AM_SLASH_HELP_SLIDER);
    AlphaMap_Print(AM_SLASH_HELP_WMCLOSE);
    AlphaMap_Print(AM_SLASH_HELP_MINIMAP);
end

-- Stolen without shame from DefendYourself
function AlphaMap_Print(msg,r,g,b,frame,id)
	if ( Print ) then
		Print(msg, r, g, b, frame, id);
		return;
	end

	if (not r) then r = 1.0; end
	if (not g) then g = 1.0; end
	if (not b) then b = 0.0; end
	if ( frame ) then
		frame:AddMessage(msg,r,g,b,id);
	else
		if ( DEFAULT_CHAT_FRAME ) then
			DEFAULT_CHAT_FRAME:AddMessage(msg, r, g, b,id);
		end
	end
end

function AlphaMap_Disable()
	if (AlphaMapConfig.enabled == false) then
		return;
	end
	AlphaMapConfig.enabled = false;

	if ( AlphaMapFrame:IsVisible() ) then
		AlphaMapFrame.UserHidden = true;
		HideUIPanel( AlphaMapFrame );
	end

	AlphaMap_Print(ALPHA_MAP_DISABLED);
end

function AlphaMap_ReEnable()
	if (AlphaMapConfig.enabled == true) then
		return;
	end
	AlphaMapConfig.enabled = true;
	AlphaMap_Print(ALPHA_MAP_ENABLED);
end

function AlphaMap_Lock_Toggle()
    AlphaMap_Lock_Set(not AlphaMapConfig.lock, true);
end

function AlphaMap_Lock_Set(state, showState)
    if (state) then
		if (showState) then
		    AlphaMap_Print( ALPHA_MAP_UI_LOCKED );
		end
        AlphaMapConfig.lock = true;
        AlphaMapMovementFrameTop:Hide();
        AlphaMapMovementFrameBottom:Hide();
    else
		if (showState) then
		    AlphaMap_Print( ALPHA_MAP_UI_UNLOCKED );
		end
        AlphaMapConfig.lock = false;
        AlphaMapMovementFrameTop:Show();
        AlphaMapMovementFrameBottom:Show();
    end
end

function AlphaMap_ResetAll()
    AlphaMapConfig.enabled      	= true;
    AlphaMapConfig.alpha        	= AM_DEFAULT_ALPHA;
    AlphaMapConfig.scale        	= AM_DEFAULT_SCALE;
    AlphaMapConfig.lock         	= false;
    AlphaMapConfig.combat       	= false;
    AlphaMapConfig.ptips        	= true;
    AlphaMapConfig.gtips        	= true;
    AlphaMapConfig.mntips       	= true;
    AlphaMapConfig.mngtips      	= false;
    AlphaMapConfig.wmclose      	= false;
    AlphaMapConfig.gathering    	= false;
    AlphaMapConfig.gatherer     	= true;
    AlphaMapConfig.mapnotes     	= true;
    AlphaMapConfig.raid         	= true;
    AlphaMapConfig.sliderlock   	= true;
    AlphaMapSliderMovementFrame:Hide();
    AlphaMapConfig.slider       	= false;
    AlphaMapConfig.minimap		= true;
    AlphaMapConfig.legacy		= false;
    AlphaMapConfig.angle		= AM_DEFAULT_MINIMAP_ANGLE;
    AlphaMapConfig.radius		= AM_DEFAULT_MINIMAP_RADIUS;
    AlphaMapConfig.dmNotes		= true;
    AlphaMapConfig.dmNotesBg		= true;
    AlphaMapConfig.dmMapBg		= false;
    AlphaMapConfig.dmNotesTooltips 	= true;
    AlphaMapConfig.dmHeader		= true;
    AlphaMapConfig.dmExtra		= true;
    AlphaMapConfig.dmKey		= true;
    AlphaMapConfig.dmKeyTooltips 	= true;
    AlphaMapConfig.ddP			= AM_ANCHOR_DEFAULT;
    	AM_MapSelector.locked		= true;
    AlphaMapConfig.ddAnchorFrom		= 1;
	UIDropDownMenu_SetSelectedID(AlphaMapDDPoint, AlphaMapConfig.ddAnchorFrom);
	UIDropDownMenu_SetText(amAnchorPoint[AlphaMapConfig.ddAnchorFrom].Display, AlphaMapDDPoint);
    AlphaMapConfig.ddAnchorTo		= 1;
	UIDropDownMenu_SetSelectedID(AlphaMapDDrelativePoint, AlphaMapConfig.ddAnchorTo);
	UIDropDownMenu_SetText(amAnchorPoint[AlphaMapConfig.ddAnchorTo].Display, AlphaMapDDrelativePoint);
    AlphaMapConfig.HotSpot		= true;
    AlphaMapConfig.hsOpen		= true;
    AlphaMapConfig.hsOpacity		= true;
    AlphaMapConfig.hsWmIcons		= false;
    AlphaMapConfig.hsDmIcons		= false;
    AlphaMapConfig.hsNBg		= false;
    AlphaMapConfig.hsMBg		= false;
    AlphaMapConfig.hsMinimap		= false;
    AlphaMapConfig.hsInfo		= false;
    AlphaMapConfig.amInBG		= true;
    AlphaMapConfig.dmAll		= true;
    AlphaMapConfig.bgAll		= true;
    AlphaMapConfig.bgMsgType		= "Default";
    AlphaMapConfig.NuNFormatted		= false;
    AlphaMapConfig.NuNSendTo		= "Default";
    AlphaMapConfig.wmMode		= AM_OPTIONS_WMAP_SMODE;
    AlphaMapConfig.Escape 		= false;
    AM_DisableEscapeMode();
    AlphaMapConfig.Mouse		= false;
    AlphaMapConfig.mute			= false;
    AlphaMapConfig.gmap 		= false;

    AlphaMapConfig.sliderLocX = AM_DefaultSliderX;
    AlphaMapConfig.sliderLocY = AM_DefaultSliderY;
    AM_SetSliderPos();

    AlphaMapConfig.amClearView		= false;

    AlphaMapConfig.reopen		= false;
    AlphaMapConfig.nBgColour		= AM_DEFAULT_COLOUR;
    AlphaMapConfig.mBgColour		= AM_DEFAULT_COLOUR;
    AlphaMapConfig.freeLocked		= false;

    SetAlphaMapOpacity( AlphaMapConfig.alpha );

    AM_UpdateMinimapButton();
    AlphaMapPlaceDDs();

    AlphaMapFrame:ClearAllPoints();
    AlphaMapSliderFrame:ClearAllPoints();
--    AlphaMap_ResetSlider();
    AlphaMapFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0);
    AlphaMapFrame:SetUserPlaced(0);
    AlphaMapSliderFrame:SetUserPlaced(0);
    ShowUIPanel( AlphaMapSliderFrame );
    HideUIPanel( AlphaMapSliderFrame );

    AlphaMapConfig.posX 		= 512;
    AlphaMapConfig.posY			= 383;

    if ( AlphaMapFrame:IsVisible() ) then
    	ToggleAlphaMap();
    	ToggleAlphaMap();
    end

end



function AM_UpdateMinimapButton()
	AM_MinimapFrame:SetPoint("TOPLEFT", "Minimap", "TOPLEFT", 56 - (AlphaMapConfig.radius * cos(AlphaMapConfig.angle)), (AlphaMapConfig.radius * sin(AlphaMapConfig.angle)) - 58);
	if ( AlphaMapConfig.minimap == true ) then
		AM_MinimapFrame:Show();
	else
		AM_MinimapFrame:Hide();
	end
end


function AM_MinimapButtonOnEnter()
	GameTooltip:SetOwner(this, "ANCHOR_LEFT");
	GameTooltip:SetText(ALPHA_MAP_MINIMAP_TOOLTIP);
	GameTooltip:Show();
	if ( AlphaMapConfig.hsMinimap ) then
		AM_HotSpot_OnEnter();
	end
end

function AM_MinimapButtonOnLeave()
	GameTooltip:Hide();
	if ( AlphaMapConfig.hsMinimap ) then
		AM_HotSpot_OnLeave();
	end
end

function AM_MinimapButtonOnClick(mBttn, minimapButton)
	if ( mBttn == "LeftButton" ) then
		if ( AM_DDHotSpot.toggled == true ) then
			AM_DDHotSpot.toggled = false;
			if ( ( minimapButton ) and ( AlphaMapConfig.hsMinimap ) ) then
				return;
			end
		end
		ToggleAlphaMap();
	elseif ( mBttn == "RightButton" ) then
		if ( AM_OptionsFrame:IsVisible() ) then
			AM_OptionsFrame:Hide();
		else
			AM_OptionsFrame:Show();
		end
	end
end

function AM_SetOptions()
	AM_EnableStandardOptions();

	if ( AM_HotSpotToggled ) then
		AM_HotSpot_OnLeave();
	end

	if ( amAlphaMapMap ) then
		AM_CopySettings(AlphaMapConfigurations[amAlphaMapMap.filename], AlphaMapConfig);
		local settingLabel = amAlphaMapMap.displayname;
		if ( ( amAlphaMapMap.type == AM_TYP_INSTANCE ) and ( AlphaMapConfig.dmAll ) ) then
			settingLabel = AM_TYP_INSTANCE;
		elseif ( ( amAlphaMapMap.type == AM_TYP_BG ) and ( AlphaMapConfig.bgAll ) ) then
			settingLabel = AM_TYP_BG;
		end
		AM_OptionsLabel:SetText(settingLabel);

	elseif ( GetCurrentMapContinent() == -1 ) then
		local mapFileName = GetMapInfo();
		local amMap = AlphaMap_GetMap(mapFileName);
		if ( amMap ) then
			AM_CopySettings(AlphaMapConfigurations[amMap.filename], AlphaMapConfig);
			local settingLabel = amMap.displayname;
			if ( ( amMap.type == AM_TYP_INSTANCE ) and ( AlphaMapConfig.dmAll ) ) then
				settingLabel = AM_TYP_INSTANCE;
			elseif ( ( amMap.type == AM_TYP_BG ) and ( AlphaMapConfig.bgAll ) ) then
				settingLabel = AM_TYP_BG;
			end
			AM_OptionsLabel:SetText(settingLabel);
		else
			AM_OptionsLabel:SetText(AM_TYP_WM);
			AM_CopySettings(AlphaMapConfigurations.wm, AlphaMapConfig);
		end

	else
		AM_OptionsLabel:SetText(AM_TYP_WM);
		AM_CopySettings(AlphaMapConfigurations.wm, AlphaMapConfig);
	end

	AM_CopySettings(AlphaMapConfig, AM_OptionsFrame.AlphaMapConfig);
	AM_OptionsFrame.label = AM_OptionsLabel:GetText();

	AM_SetOptionsCheckBoxes();
	AM_SetOptionsSliders();
end

function AM_Options_OnClose()
	AM_OptionsGM_Change:SetChecked(0);
	AM_ChangingOriWorldMap = false;
	if ( amMapNeedsRefresh ) then
		local amMap = nil;
		local mapFileName = GetMapInfo();
		if ( mapFileName ) then
			local amMap = AlphaMap_GetMap(mapFileName);
		end
		AlphaMapFrame_Update(amMap);
		amMapNeedsRefresh = nil;
	end
end

function AM_SetOptionsSliders()
	AM_Alpha:SetValue(AlphaMapConfig.alpha);
	AM_CurrentAlpha:SetText(math.floor(AlphaMapConfig.alpha * 100).."%");
	AM_Scale:SetValue(AlphaMapConfig.scale);
	AM_CurrentScale:SetText(math.floor( AlphaMapConfig.scale * 100 ).."%");
	AM_ButtonAngle:SetValue(AlphaMapConfig.angle);
	AM_CurrentButtonAngle:SetText(AlphaMapConfig.angle..AM_DEGREE);
	AM_ButtonRadius:SetValue(AlphaMapConfig.radius);
	AM_CurrentButtonRadius:SetText(AlphaMapConfig.radius);
end



function AM_OptionsCheckBox_OnCheck(option)
	local notSavedYet = true;

	if ( option == AM_OptionsDisplayMapNotes ) then
		if ( AM_OptionsDisplayMapNotes:GetChecked() ) then
			AlphaMapConfig.mapnotes = true;
			AM_OptionsDisplayMapNotesTooltips:Show();
			if ( AlphaMapConfig.mntips == true ) then
				AM_OptionsDisplayMapNotesTooltips:SetChecked(1);
			else
				AM_OptionsDisplayMapNotesTooltips:SetChecked(0);
			end
		else
			AlphaMapConfig.mapnotes = false;
			AM_OptionsDisplayMapNotesTooltips:Hide();
		end

	elseif ( option == AM_OptionsDisplayMapNotesTooltips ) then
		if ( AM_OptionsDisplayMapNotesTooltips:GetChecked() ) then
			AlphaMapConfig.mntips = true;
		else
			AlphaMapConfig.mntips = false;
		end

	elseif ( option == AM_OptionsDisplayMapNotesGathering ) then
		if ( AM_OptionsDisplayMapNotesGathering:GetChecked() ) then
			AlphaMapConfig.gathering = true;
			AM_OptionsDisplayMapNotesGatheringTooltips:Show();
			if ( AlphaMapConfig.mngtips == true ) then
				AM_OptionsDisplayMapNotesGatheringTooltips:SetChecked(1);
			else
				AM_OptionsDisplayMapNotesGatheringTooltips:SetChecked(0);
			end
		else
			AlphaMapConfig.gathering = false;
			AM_OptionsDisplayMapNotesGatheringTooltips:Hide();
		end

	elseif ( option == AM_OptionsDisplayMapNotesGatheringTooltips ) then
		if ( AM_OptionsDisplayMapNotesGatheringTooltips:GetChecked() ) then
			AlphaMapConfig.mngtips = true;
		else
			AlphaMapConfig.mngtips = false;
		end

	elseif ( option == AM_OptionsDisplayGatherer ) then
		if ( AM_OptionsDisplayGatherer:GetChecked() ) then
			AlphaMapConfig.gatherer = true;
			AM_OptionsDisplayGathererTooltips:Show();
			if ( AlphaMapConfig.gtips == true ) then
				AM_OptionsDisplayGathererTooltips:SetChecked(1);
			else
				AM_OptionsDisplayGathererTooltips:SetChecked(0);
			end
		else
			AlphaMapConfig.gatherer = false;
			AM_OptionsDisplayGathererTooltips:Hide();
		end

	elseif ( option == AM_OptionsDisplayGathererTooltips ) then
		if ( AM_OptionsDisplayGathererTooltips:GetChecked() ) then
			AlphaMapConfig.gtips = true;
		else
			AlphaMapConfig.gtips = false;
		end

	elseif ( option == AM_OptionsDisplayRaid ) then
		if ( AM_OptionsDisplayRaid:GetChecked() ) then
			AlphaMapConfig.raid = true;
			AM_OptionsDisplayPartyTooltips:Show();
			if ( AlphaMapConfig.ptips == true ) then
				AM_OptionsDisplayPartyTooltips:SetChecked(1);
			else
				AM_OptionsDisplayPartyTooltips:SetChecked(0);
			end
		else
			AlphaMapConfig.raid = false;
			AM_OptionsDisplayPartyTooltips:Hide();
		end

	elseif ( option == AM_OptionsDisplayPartyTooltips ) then
		if ( AM_OptionsDisplayPartyTooltips:GetChecked() ) then
			AlphaMapConfig.ptips = true;
		else
			AlphaMapConfig.ptips = false;
		end

	elseif ( option == AM_OptionsDisplaySlider ) then
		if ( AM_OptionsDisplaySlider:GetChecked() ) then
			AlphaMapConfig.slider = true;
			AM_OptionsDisplayMSlider:Show();
			if ( AlphaMapConfig.sliderlock == true ) then
				AM_OptionsDisplayMSlider:SetChecked(0);
				AlphaMapSliderMovementFrame:Hide();
			else
				AM_OptionsDisplayMSlider:SetChecked(1);
				AlphaMapSliderMovementFrame:Show();
			end
			AlphaMapSliderFrame:Show();
		else
			AlphaMapConfig.slider = false;
			AM_OptionsDisplayMSlider:Hide();
			AlphaMapSliderFrame:Hide();
		end
		AM_SaveConfig();
		notSavedYet = nil;

	elseif ( option == AM_OptionsDisplayMSlider ) then
		if ( AM_OptionsDisplayMSlider:GetChecked() ) then
			AlphaMapConfig.sliderlock = false;
			AlphaMapSliderMovementFrame:Show();
		else
			AlphaMapConfig.sliderlock = true;
			AlphaMapSliderMovementFrame:Hide();
		end
		AM_SaveConfig();
		notSavedYet = nil;

	elseif ( option == AM_OptionsAutocloseC ) then
		AM_AutoClosed = nil;
		if ( AM_OptionsAutocloseC:GetChecked() ) then
			AlphaMapConfig.combat = true;
			AM_OptionsAutoReOpen:Show();
			if ( AM_OptionsAutoReOpen:GetChecked() ) then
				AlphaMapConfig.reopen = true;
			else
				AlphaMapConfig.reopen = false;
			end
		else
			AlphaMapConfig.combat = false;
			AM_OptionsAutoReOpen:Hide();
		end

	elseif ( option == AM_OptionsAutoReOpen ) then
		AM_AutoClosed = nil;
		if ( AM_OptionsAutoReOpen:GetChecked() ) then
			AlphaMapConfig.reopen = true;
		else
			AlphaMapConfig.reopen = false;
		end

	elseif ( option == AM_OptionsAutocloseW ) then
		if ( AM_OptionsAutocloseW:GetChecked() ) then
			AlphaMapConfig.wmclose = true;
		else
			AlphaMapConfig.wmclose = false;
		end

	elseif ( option == AM_OptionsMapLock ) then
		if ( AM_OptionsMapLock:GetChecked() ) then
			AlphaMapConfig.lock = true;
		        AlphaMapMovementFrameTop:Hide();
		        AlphaMapMovementFrameBottom:Hide();
		else
			AlphaMapConfig.lock = false;
		        AlphaMapMovementFrameTop:Show();
		        AlphaMapMovementFrameBottom:Show();
		end
		AM_SaveGlobals();
		notSavedYet = nil;

	elseif ( option == AM_OptionsMinimap ) then
		if ( AM_OptionsMinimap:GetChecked() ) then
			AlphaMapConfig.minimap = true;
		else
			AlphaMapConfig.minimap = false;
		end
		AM_UpdateMinimapButton();
		AM_SaveGlobals();
		notSavedYet = nil;

	elseif ( option == AM_OptionsClearView ) then
		AM_ClearView();

	elseif ( option == AM_OptionsLegacy ) then
		if ( AM_OptionsLegacy:GetChecked() ) then
			AlphaMapConfig.legacy = true;
		else
			AlphaMapConfig.legacy = false;
		end

	elseif ( option == AM_OptionsDisplayDMNotes ) then
		if ( AM_OptionsDisplayDMNotes:GetChecked() ) then
			AlphaMapConfig.dmNotes = true;
			AM_OptionsDisplayDMNotesTooltips:Show();
			AM_OptionsDisplayDMNoteBg:Show();
			if ( AM_OptionsDisplayDMNoteBg:GetChecked() ) then
				AM_OptionsFrameNBGSet:Show();
			else
				AM_OptionsFrameNBGSet:Hide();
			end
		else
			AlphaMapConfig.dmNotes = false;
			AM_OptionsDisplayDMNotesTooltips:Hide();
			AM_OptionsDisplayDMNoteBg:Hide();
			AM_OptionsFrameNBGSet:Hide();

		end
		AM_SaveConfig();
		notSavedYet = nil;
		if ( AlphaMapAlphaMapFrame:IsVisible() ) then
			AlphaMapFrame_Update(amAlphaMapMap);
		end

	elseif ( option == AM_OptionsDisplayDMNotesTooltips ) then
		if ( AM_OptionsDisplayDMNotesTooltips:GetChecked() ) then
			AlphaMapConfig.dmNotesTooltips = true;
		else
			AlphaMapConfig.dmNotesTooltips = false;
		end

	elseif ( option == AM_OptionsDisplayDMNoteBg ) then
		if ( AM_OptionsDisplayDMNoteBg:GetChecked() ) then
			AlphaMapConfig.dmNotesBg = true;
			AM_OptionsFrameNBGSet:Show();
		else
			AlphaMapConfig.dmNotesBg = false;
			AM_OptionsFrameNBGSet:Hide();
		end
		AM_SaveConfig();
		notSavedYet = nil;
		if ( AlphaMapAlphaMapFrame:IsVisible() ) then
			AlphaMapFrame_Update(amAlphaMapMap);
		end

	elseif ( option == AM_OptionsDisplayMapBg ) then
		if ( AM_OptionsDisplayMapBg:GetChecked() ) then
			AlphaMapConfig.dmMapBg = true;
			AM_OptionsFrameMBGSet:Show();
			AlphaMapAlphaMapBgTexture:Show();
			AM_UpdateColours("Map", AlphaMapConfig.mBgColour.r, AlphaMapConfig.mBgColour.g, AlphaMapConfig.mBgColour.b, AlphaMapConfig.mBgColour.a );
		else
			AlphaMapConfig.dmMapBg = false;
			AM_OptionsFrameMBGSet:Hide();
			AlphaMapAlphaMapBgTexture:Hide();
		end

	elseif ( option == AM_OptionsDisplayDMHeader ) then
		if ( AM_OptionsDisplayDMHeader:GetChecked() ) then
			AlphaMapConfig.dmHeader = true;
			if ( AlphaMapAlphaMapFrame:IsVisible() ) then
				AlphaMapAlphaMapTitleFrame:Show();
			end
		else
			AlphaMapConfig.dmHeader = false;
			AlphaMapAlphaMapTitleFrame:Hide();
		end

	elseif ( option == AM_OptionsDisplayDMExtra ) then
		if ( AM_OptionsDisplayDMExtra:GetChecked() ) then
			AlphaMapConfig.dmExtra = true;
			if ( AlphaMapAlphaMapFrame:IsVisible() ) then
				AlphaMapAlphaMapPreReqFrame:Show();
			end
		else
			AlphaMapConfig.dmExtra = false;
			AlphaMapAlphaMapPreReqFrame:Hide();
		end

	elseif ( option == AM_OptionsDisplayDMKey ) then
		if ( AM_OptionsDisplayDMKey:GetChecked() ) then
			AlphaMapConfig.dmKey = true;
			AM_OptionsDisplayDMKeyTooltips:Show();
		else
			AlphaMapConfig.dmKey = false;
			AM_OptionsDisplayDMKeyTooltips:Hide();
			AlphaMapAlphaMapDetailsFrame:Hide();
		end
		AM_SaveConfig();
		notSavedYet = nil;
		if ( AlphaMapAlphaMapFrame:IsVisible() ) then
			AlphaMapFrame_Update(amAlphaMapMap);
		end

	elseif ( option == AM_OptionsDisplayDMKeyTooltips ) then
		if ( AM_OptionsDisplayDMKeyTooltips:GetChecked() ) then
			AlphaMapConfig.dmKeyTooltips = true;
		else
			AlphaMapConfig.dmKeyTooltips = false;
		end

	elseif ( option == AM_OptionsDDDockIt ) then
		if ( AM_OptionsDDDockIt:GetChecked() ) then
			AM_OptionsDDFreeIt:SetChecked(0);
			AM_OptionsDDMapIt:SetChecked(0);
			AlphaMapConfig.ddP = option:GetID();
			AM_OptionsDMMapAttachLabel:Hide();
			AlphaMapDDPoint:Hide();
			AlphaMapDDrelativePoint:Hide();
			AM_MapSelector.locked = true;
		else
			AM_OptionsDDDockIt:SetChecked(1);
		end
		AM_SaveConfig();
		notSavedYet = nil;
		AlphaMapPlaceDDs();

	elseif ( option == AM_OptionsDDFreeIt ) then
		if ( AM_OptionsDDFreeIt:GetChecked() ) then
			AM_OptionsDDDockIt:SetChecked(0);
			AM_OptionsDDMapIt:SetChecked(0);
			AlphaMapConfig.ddP = option:GetID();
			AM_OptionsDMMapAttachLabel:Hide();
			AlphaMapDDPoint:Hide();
			AlphaMapDDrelativePoint:Hide();
			AM_DockingLabel:SetText(AM_OPTIONS_UNDOCKED..AM_OPTIONS_FREE);
			AM_MapSelector.locked = nil;
		else
			AM_OptionsDDFreeIt:SetChecked(1);
		end
		AlphaMapConfig.freeLocked = false;
		AM_SaveConfig();
		notSavedYet = nil;
		AM_SetLock();
		AlphaMapPlaceDDs();
		AM_OptionsFrame:Hide();

	elseif ( option == AM_OptionsDDMapIt ) then
		if ( AM_OptionsDDMapIt:GetChecked() ) then
			AM_OptionsDDDockIt:SetChecked(0);
			AM_OptionsDDFreeIt:SetChecked(0);
			AlphaMapConfig.ddP = option:GetID();
			AM_OptionsDMMapAttachLabel:Show();
			AlphaMapDDPoint:Show();
			AlphaMapDDrelativePoint:Show();
			AM_DockingLabel:SetText(AM_OPTIONS_UNDOCKED..AM_OPTIONS_MAPPED);
			AM_MapSelector.locked = true;
		else
			AM_OptionsDDMapIt:SetChecked(1);
		end
		AM_SaveConfig();
		notSavedYet = nil;
		if ( not AlphaMapFrame:IsVisible() ) then
			ToggleAlphaMap();
		end
		AlphaMapPlaceDDs(true);

	elseif ( option == AM_OptionHotSpotEnable ) then
		if ( AM_OptionHotSpotEnable:GetChecked() ) then
			AlphaMapConfig.HotSpot = true;
			AM_OptionHotSpotOpen:Show();
			AM_OptionHotSpotOpacity:Show();
			AM_OptionHotSpotWorldI:Show();
			AM_OptionHotSpotDungI:Show();
			AM_OptionHotSpotNBG:Show();
			AM_OptionHotSpotMBG:Show();
			AM_OptionHotSpotMinimap:Show();
			AM_OptionHotSpotInfoFrames:Show();
			AM_DDHotSpot:Show();
		else
			AlphaMapConfig.HotSpot = false;
			AM_OptionHotSpotOpen:Hide();
			AM_OptionHotSpotOpacity:Hide();
			AM_OptionHotSpotWorldI:Hide();
			AM_OptionHotSpotDungI:Hide();
			AM_OptionHotSpotNBG:Hide();
			AM_OptionHotSpotMBG:Hide();
			AM_OptionHotSpotMinimap:Hide();
			AM_OptionHotSpotInfoFrames:Hide();
			AM_DDHotSpot:Hide();
		end

	elseif ( option == AM_OptionHotSpotOpen ) then
		if ( AM_OptionHotSpotOpen:GetChecked() ) then
			AlphaMapConfig.hsOpen = true;
		else
			AlphaMapConfig.hsOpen = false;
		end

	elseif ( option == AM_OptionHotSpotOpacity ) then
		if ( AM_OptionHotSpotOpacity:GetChecked() ) then
			AlphaMapConfig.hsOpacity = true;

		else
			AlphaMapConfig.hsOpacity = false;

		end

	elseif ( option == AM_OptionHotSpotWorldI ) then
		if ( AM_OptionHotSpotWorldI:GetChecked() ) then
			AlphaMapConfig.hsWmIcons = true;

		else
			AlphaMapConfig.hsWmIcons = false;

		end

	elseif ( option == AM_OptionHotSpotDungI ) then
		if ( AM_OptionHotSpotDungI:GetChecked() ) then
			AlphaMapConfig.hsDmIcons = true;

		else
			AlphaMapConfig.hsDmIcons = false;

		end

	elseif ( option == AM_OptionHotSpotNBG ) then
		if ( AM_OptionHotSpotNBG:GetChecked() ) then
			AlphaMapConfig.hsNBg = true;
		else
			AlphaMapConfig.hsNBg = false;
		end

	elseif ( option == AM_OptionHotSpotMBG ) then
		if ( AM_OptionHotSpotMBG:GetChecked() ) then
			AlphaMapConfig.hsMBg = true;
		else
			AlphaMapConfig.hsMBg = false;
		end

	elseif ( option == AM_OptionHotSpotMinimap ) then
		if ( AM_OptionHotSpotMinimap:GetChecked() ) then
			AlphaMapConfig.hsMinimap = true;
		else
			AlphaMapConfig.hsMinimap = false;
		end

	elseif ( option == AM_OptionHotSpotInfoFrames ) then
		if ( AM_OptionHotSpotInfoFrames:GetChecked() ) then
			AlphaMapConfig.hsInfo = true;
		else
			AlphaMapConfig.hsInfo = false;
		end

	elseif ( option == AM_OptionsUseInstanceInBG ) then
		if ( AM_OptionsUseInstanceInBG:GetChecked() ) then
			AlphaMapConfig.amInBG = true;
		else
			AlphaMapConfig.amInBG = false;
		end
		AM_SaveConfig();
		notSavedYet = nil;
		if ( AlphaMapFrame:IsVisible() ) then
			AlphaMapFrame_Update(amAlphaMapMap);
		else
			AlphaMapFrame_Update();
		end

	elseif ( option == AM_OptionsDisplayDMAffectAll ) then
		if ( AM_OptionsDisplayDMAffectAll:GetChecked() ) then
			AlphaMapConfig.dmAll = true;
		else
			AlphaMapConfig.dmAll = false;
		end
		if ( ( amAlphaMapMap ) and ( amAlphaMapMap.type == AM_TYP_INSTANCE ) ) then
			if ( AlphaMapConfig.dmAll ) then
				AM_OptionsLabel:SetText(AM_TYP_INSTANCE);
			else
				AM_OptionsLabel:SetText(amAlphaMapMap.displayname);
			end
		end

	elseif ( option == AM_OptionsDisplayBGAffectAll ) then
		if ( AM_OptionsDisplayBGAffectAll:GetChecked() ) then
			AlphaMapConfig.bgAll = true;
		else
			AlphaMapConfig.bgAll = false;
		end
		if ( ( amAlphaMapMap ) and ( amAlphaMapMap.type == AM_TYP_BG ) ) then
			if ( AlphaMapConfig.bgAll ) then
				AM_OptionsLabel:SetText(AM_TYP_BG);
			else
				AM_OptionsLabel:SetText(amAlphaMapMap.displayname);
			end

		end

	elseif ( option == AM_OptionsBGMsgsDefault ) then
		if ( AM_OptionsBGMsgsDefault:GetChecked() ) then
			AlphaMapConfig.bgMsgType = "Default";
			AM_OptionsBGMsgsParty:SetChecked(0);
			AM_OptionsBGMsgsGeneral:SetChecked(0);
		else
			AM_OptionsBGMsgsDefault:SetChecked(1);
		end

	elseif ( option == AM_OptionsBGMsgsParty ) then
		if ( AM_OptionsBGMsgsParty:GetChecked() ) then
			AlphaMapConfig.bgMsgType = "Party";
			AM_OptionsBGMsgsDefault:SetChecked(0);
			AM_OptionsBGMsgsGeneral:SetChecked(0);
		else
			AM_OptionsBGMsgsParty:SetChecked(1);
		end

	elseif ( option == AM_OptionsBGMsgsGeneral ) then
		if ( AM_OptionsBGMsgsGeneral:GetChecked() ) then
			AlphaMapConfig.bgMsgType = "General";
			AM_OptionsBGMsgsDefault:SetChecked(0);
			AM_OptionsBGMsgsParty:SetChecked(0);
		else
			AM_OptionsBGMsgsGeneral:SetChecked(1);
		end

	elseif ( option == AM_OptionsNuNFormatted ) then
		if ( AM_OptionsNuNFormatted:GetChecked() ) then
			AlphaMapConfig.NuNFormatted = true;
		else
			AlphaMapConfig.NuNFormatted = false;
		end

	elseif ( option == AM_OptionsNuNDefault ) then
		if ( AM_OptionsNuNDefault:GetChecked() ) then
			AlphaMapConfig.NuNSendTo = "Default";
			AM_OptionsNuNParty:SetChecked(0);
			AM_OptionsNuNGuild:SetChecked(0);
		else
			AM_OptionsNuNDefault:SetChecked(1);
		end

	elseif ( option == AM_OptionsNuNParty ) then
		if ( AM_OptionsNuNParty:GetChecked() ) then
			AlphaMapConfig.NuNSendTo = "Party";
			AM_OptionsNuNDefault:SetChecked(0);
			AM_OptionsNuNGuild:SetChecked(0);
		else
			AM_OptionsNuNParty:SetChecked(1);
		end


	elseif ( option == AM_OptionsNuNGuild ) then
		if ( AM_OptionsNuNGuild:GetChecked() ) then
			AlphaMapConfig.NuNSendTo = "Guild";
			AM_OptionsNuNDefault:SetChecked(0);
			AM_OptionsNuNParty:SetChecked(0);
		else
			AM_OptionsNuNGuild:SetChecked(1);
		end

	elseif ( option == AM_OptionsWM_Standard ) then
		if ( AM_OptionsWM_Standard:GetChecked() ) then
			AlphaMapConfig.wmMode = AM_OPTIONS_WMAP_SMODE;
			AM_OptionsWM_ZMinimap:SetChecked(0);
			AM_OptionsWM_Minimap:SetChecked(0);
			AM_OptionsWM_Overlay:SetChecked(0);
		else
			AM_OptionsWM_Standard:SetChecked(1);
		end
		AM_SaveConfig();
		notSavedYet = nil;
		if ( AlphaMapDetailFrame:IsVisible() ) then
			AlphaMapFrame_Update();
		end

	elseif ( option == AM_OptionsWM_Overlay ) then
		if ( AM_OptionsWM_Overlay:GetChecked() ) then
			AlphaMapConfig.wmMode = AM_OPTIONS_WMAP_OMODE;
			AM_OptionsWM_ZMinimap:SetChecked(0);
			AM_OptionsWM_Minimap:SetChecked(0);
			AM_OptionsWM_Standard:SetChecked(0);
		else
			AM_OptionsWM_Overlay:SetChecked(1);
		end
		AM_SaveConfig();
		notSavedYet = nil;
		if ( AlphaMapDetailFrame:IsVisible() ) then
			AlphaMapFrame_Update();
		end

	elseif ( option == AM_OptionsWM_Minimap ) then				-- Future Development
		if ( AM_OptionsWM_Minimap:GetChecked() ) then
			AlphaMapConfig.wmMode = AM_OPTIONS_WMAP_MINIMODE;
			AM_OptionsWM_ZMinimap:SetChecked(0);
			AM_OptionsWM_Overlay:SetChecked(0);
			AM_OptionsWM_Standard:SetChecked(0);
		else
			AM_OptionsWM_Minimap:SetChecked(1);
		end
		AM_SaveConfig();
		notSavedYet = nil;
		if ( AlphaMapDetailFrame:IsVisible() ) then
			AlphaMapFrame_Update();
		end

	elseif ( option == AM_OptionsWM_ZMinimap ) then				-- Future Development
		if ( AM_OptionsWM_ZMinimap:GetChecked() ) then
			AlphaMapConfig.wmMode = AM_OPTIONS_WMAP_ZMINIMODE;
			AM_OptionsWM_Minimap:SetChecked(0);
			AM_OptionsWM_Overlay:SetChecked(0);
			AM_OptionsWM_Standard:SetChecked(0);
		else
			AM_OptionsWM_ZMinimap:SetChecked(1);
		end
		AM_SaveConfig();
		notSavedYet = nil;
		if ( AlphaMapDetailFrame:IsVisible() ) then
			AlphaMapFrame_Update();
		end

	elseif ( option == AM_OptionsWM_Escape ) then
		if ( AM_OptionsWM_Escape:GetChecked() ) then
			AlphaMapConfig.Escape = true;
			AM_EnableEscapeMode();
		else
			AlphaMapConfig.Escape = false;
			AM_DisableEscapeMode();
		end

	elseif ( option == AM_OptionsWM_Mouse ) then
		if ( AM_OptionsWM_Mouse:GetChecked() ) then
			AlphaMapConfig.Mouse = true;
		else
			AlphaMapConfig.Mouse = false;
		end

	elseif ( option == AM_Options_Mute ) then
		if ( AM_Options_Mute:GetChecked() ) then
			AlphaMapConfig.mute = true;
		else
			AlphaMapConfig.mute = false;
		end

	elseif ( option == AM_OptionsGM_Allow ) then
		if ( AM_OptionsGM_Allow:GetChecked() ) then
			AlphaMapConfig.gmap = true;
			AM_SaveGlobals();
			notSavedYet = nil;
			AM_OptionsGM_Change:Show();
			AM_SetupGameMap(true);
		else
			AlphaMapConfig.gmap = false;
			AM_SaveGlobals();
			notSavedYet = nil;
			AM_OptionsGM_Change:Hide();
			AM_ResetGameMap();
		end

	elseif ( option == AM_OptionsGM_Change ) then
		if ( AM_OptionsGM_Change:GetChecked() ) then
			if ( not WorldMapFrame:IsVisible() ) then
				ToggleWorldMap();
				AM_OptionsFrame:Show();
			end
			AM_ChangingOriWorldMap = true;
			AM_SkipWorldMapRepos = true;
			AM_CopySettings(AlphaMapConfigurations.gm, AlphaMapConfig);
			AM_OptionsLabel:SetText(AM_TYP_GM);
			AM_SetOptionsSliders();
			AM_DisableStandardOptions();
			AM_OptionsGM_Change:SetChecked(1);
		else
			AM_ChangingOriWorldMap = false;
			AM_CopySettings(AM_OptionsFrame.AlphaMapConfig, AlphaMapConfig);
			AM_OptionsLabel:SetText(AM_OptionsFrame.label);
			AM_EnableStandardOptions();
			AM_SetOptionsSliders();
		end
		notSavedYet = nil;

	end

	if ( notSavedYet ) then
		AM_SaveConfig();
	end
end



function AM_SetOptionsCheckBoxes()
	if ( AlphaMapConfig.mapnotes == true ) then
		AM_OptionsDisplayMapNotes:SetChecked(1);
		AM_OptionsDisplayMapNotesTooltips:Show();
	else
		AM_OptionsDisplayMapNotes:SetChecked(0);
		AM_OptionsDisplayMapNotesTooltips:Hide();
	end
	if ( AlphaMapConfig.mntips == true ) then
		AM_OptionsDisplayMapNotesTooltips:SetChecked(1);
	else
		AM_OptionsDisplayMapNotesTooltips:SetChecked(0);
	end
	if ( AlphaMapConfig.gathering == true ) then
		AM_OptionsDisplayMapNotesGathering:SetChecked(1);
		AM_OptionsDisplayMapNotesGatheringTooltips:Show();
	else
		AM_OptionsDisplayMapNotesGathering:SetChecked(0);
		AM_OptionsDisplayMapNotesGatheringTooltips:Hide();
	end
	if ( AlphaMapConfig.mngtips == true ) then
		AM_OptionsDisplayMapNotesGatheringTooltips:SetChecked(1);
	else
		AM_OptionsDisplayMapNotesGatheringTooltips:SetChecked(0);
	end
	if ( AlphaMapConfig.gatherer == true ) then
		AM_OptionsDisplayGatherer:SetChecked(1);
		AM_OptionsDisplayGathererTooltips:Show();
	else
		AM_OptionsDisplayGatherer:SetChecked(0);
		AM_OptionsDisplayGathererTooltips:Hide();
	end
	if ( AlphaMapConfig.gtips == true ) then
		AM_OptionsDisplayGathererTooltips:SetChecked(1);
	else
		AM_OptionsDisplayGathererTooltips:SetChecked(0);
	end
	if ( AlphaMapConfig.raid == true ) then
		AM_OptionsDisplayRaid:SetChecked(1);
		AM_OptionsDisplayPartyTooltips:Show();
	else
		AM_OptionsDisplayRaid:SetChecked(0);
		AM_OptionsDisplayPartyTooltips:Hide();
	end
	if ( AlphaMapConfig.ptips == true ) then
		AM_OptionsDisplayPartyTooltips:SetChecked(1);
	else
		AM_OptionsDisplayPartyTooltips:SetChecked(0);
	end
	if ( AlphaMapConfig.slider == true ) then
		AM_OptionsDisplaySlider:SetChecked(1);
		AM_OptionsDisplayMSlider:Show();
	else
		AM_OptionsDisplaySlider:SetChecked(0);
		AM_OptionsDisplayMSlider:Hide();
	end
	if ( AlphaMapConfig.sliderlock == true ) then
		AM_OptionsDisplayMSlider:SetChecked(0);
	else
		AM_OptionsDisplayMSlider:SetChecked(1);
	end
	if ( AlphaMapConfig.combat == true ) then
		AM_OptionsAutocloseC:SetChecked(1);
		AM_OptionsAutoReOpen:Show();
	else
		AM_OptionsAutocloseC:SetChecked(0);
		AM_OptionsAutoReOpen:Hide();
	end
	if ( AlphaMapConfig.reopen == true ) then
		AM_OptionsAutoReOpen:SetChecked(1);
	else
		AM_OptionsAutoReOpen:SetChecked(0);
	end
	if ( AlphaMapConfig.wmclose == true ) then
		AM_OptionsAutocloseW:SetChecked(1);
	else
		AM_OptionsAutocloseW:SetChecked(0);
	end
	if ( AlphaMapConfig.lock == true ) then
		AM_OptionsMapLock:SetChecked(1);
	else
		AM_OptionsMapLock:SetChecked(0);
	end
	if ( AlphaMapConfig.minimap == true ) then
		AM_OptionsMinimap:SetChecked(1);
	else
		AM_OptionsMinimap:SetChecked(0);
	end
	if ( AlphaMapConfig.legacy == true ) then
		AM_OptionsLegacy:SetChecked(1);
	else
		AM_OptionsLegacy:SetChecked(0);
	end
	if ( AlphaMapConfig.dmNotes == true ) then
		AM_OptionsDisplayDMNotes:SetChecked(1);
		AM_OptionsDisplayDMNotesTooltips:Show();
		AM_OptionsDisplayDMNoteBg:Show();
		if ( AM_OptionsDisplayDMNoteBg:GetChecked() ) then
			AM_OptionsFrameNBGSet:Show();
		else
			AM_OptionsFrameNBGSet:Hide();
		end
	else
		AM_OptionsDisplayDMNotes:SetChecked(0);
		AM_OptionsDisplayDMNotesTooltips:Hide();
		AM_OptionsDisplayDMNoteBg:Hide();
		AM_OptionsFrameNBGSet:Hide();
	end
	if ( AlphaMapConfig.dmNotesTooltips == true ) then
		AM_OptionsDisplayDMNotesTooltips:SetChecked(1);
	else
		AM_OptionsDisplayDMNotesTooltips:SetChecked(0);
	end
	if ( AlphaMapConfig.dmNotesBg == true ) then
		AM_OptionsDisplayDMNoteBg:SetChecked(1);
		AM_OptionsFrameNBGSet:Show();
	else
		AM_OptionsDisplayDMNoteBg:SetChecked(0);
		AM_OptionsFrameNBGSet:Hide();
	end
	if ( AlphaMapConfig.dmMapBg == true ) then
		AM_OptionsDisplayMapBg:SetChecked(1);
		AM_OptionsFrameMBGSet:Show();
		AlphaMapAlphaMapBgTexture:Show();
		AM_UpdateColours("Map", AlphaMapConfig.mBgColour.r, AlphaMapConfig.mBgColour.g, AlphaMapConfig.mBgColour.b, AlphaMapConfig.mBgColour.a );
	else
		AM_OptionsDisplayMapBg:SetChecked(0);
		AM_OptionsFrameMBGSet:Hide();
		AlphaMapAlphaMapBgTexture:Hide();
	end
	if ( AlphaMapConfig.dmHeader == true ) then
		AM_OptionsDisplayDMHeader:SetChecked(1);
	else
		AM_OptionsDisplayDMHeader:SetChecked(0);
	end
	if ( AlphaMapConfig.dmExtra == true ) then
		AM_OptionsDisplayDMExtra:SetChecked(1);
	else
		AM_OptionsDisplayDMExtra:SetChecked(0);
	end
	if ( AlphaMapConfig.dmKey == true ) then
		AM_OptionsDisplayDMKey:SetChecked(1);
		AM_OptionsDisplayDMKeyTooltips:Show();
	else
		AM_OptionsDisplayDMKey:SetChecked(0);
		AM_OptionsDisplayDMKeyTooltips:Hide();
	end
	if ( AlphaMapConfig.dmKeyTooltips == true ) then
		AM_OptionsDisplayDMKeyTooltips:SetChecked(1);

	else
		AM_OptionsDisplayDMKeyTooltips:SetChecked(0);
	end
	if ( AlphaMapConfig.ddP == AM_ANCHOR_OPTIONS ) then
		AM_OptionsDDDockIt:SetChecked(1);
		AM_OptionsDDFreeIt:SetChecked(0);
		AM_OptionsDDMapIt:SetChecked(0);
		AM_OptionsDMMapAttachLabel:Hide();
		AlphaMapDDPoint:Hide();
		AlphaMapDDrelativePoint:Hide();
	elseif ( AlphaMapConfig.ddP == AM_ANCHOR_FREE ) then
		AM_OptionsDDDockIt:SetChecked(0);
		AM_OptionsDDFreeIt:SetChecked(1);
		AM_OptionsDDMapIt:SetChecked(0);
		AM_OptionsDMMapAttachLabel:Hide();
		AlphaMapDDPoint:Hide();
		AlphaMapDDrelativePoint:Hide();
		AM_DockingLabel:SetText(AM_OPTIONS_UNDOCKED..AM_OPTIONS_FREE);
	elseif ( AlphaMapConfig.ddP == AM_ANCHOR_ALPHAMAP ) then
		AM_OptionsDDDockIt:SetChecked(0);
		AM_OptionsDDFreeIt:SetChecked(0);
		AM_OptionsDDMapIt:SetChecked(1);
		AM_OptionsDMMapAttachLabel:Show();
		AlphaMapDDPoint:Show();
		AlphaMapDDrelativePoint:Show();
		AM_DockingLabel:SetText(AM_OPTIONS_UNDOCKED..AM_OPTIONS_MAPPED);
	else
		AM_OptionsDDDockIt:SetChecked(1);
		AM_OptionsDDFreeIt:SetChecked(0);
		AM_OptionsDDMapIt:SetChecked(0);
		AM_OptionsDMMapAttachLabel:Hide();
		AlphaMapDDPoint:Hide();
		AlphaMapDDrelativePoint:Hide();
	end
	if ( AlphaMapConfig.HotSpot == true ) then
		AM_OptionHotSpotEnable:SetChecked(1);
		AM_OptionHotSpotOpen:Show();
		AM_OptionHotSpotOpacity:Show();
		AM_OptionHotSpotWorldI:Show();
		AM_OptionHotSpotDungI:Show();
		AM_OptionHotSpotNBG:Show();
		AM_OptionHotSpotMBG:Show();
		AM_OptionHotSpotMinimap:Show();
		AM_OptionHotSpotInfoFrames:Show();
		AM_DDHotSpot:Show();
	else
		AM_OptionHotSpotEnable:SetChecked(0);
		AM_OptionHotSpotOpen:Hide();
		AM_OptionHotSpotOpacity:Hide();
		AM_OptionHotSpotWorldI:Hide();
		AM_OptionHotSpotDungI:Hide();
		AM_OptionHotSpotNBG:Hide();
		AM_OptionHotSpotMBG:Hide();
		AM_OptionHotSpotMinimap:Hide();
		AM_OptionHotSpotInfoFrames:Hide();
		AM_DDHotSpot:Hide();
	end
	if ( AlphaMapConfig.hsOpen == true ) then
		AM_OptionHotSpotOpen:SetChecked(1);
	else
		AM_OptionHotSpotOpen:SetChecked(0);
	end
	if ( AlphaMapConfig.hsOpacity == true ) then
		AM_OptionHotSpotOpacity:SetChecked(1);
	else
		AM_OptionHotSpotOpacity:SetChecked(0);
	end
	if ( AlphaMapConfig.hsWmIcons == true ) then
		AM_OptionHotSpotWorldI:SetChecked(1);
	else
		AM_OptionHotSpotWorldI:SetChecked(0);
	end
	if ( AlphaMapConfig.hsDmIcons == true ) then
		AM_OptionHotSpotDungI:SetChecked(1);
	else
		AM_OptionHotSpotDungI:SetChecked(0);
	end
	if ( AlphaMapConfig.hsNBg == true ) then
		AM_OptionHotSpotNBG:SetChecked(1);
	else
		AM_OptionHotSpotNBG:SetChecked(0);
	end
	if ( AlphaMapConfig.hsMBg == true ) then
		AM_OptionHotSpotMBG:SetChecked(1);
	else
		AM_OptionHotSpotMBG:SetChecked(0);
	end
	if ( AlphaMapConfig.hsMinimap == true ) then
		AM_OptionHotSpotMinimap:SetChecked(1);
	else
		AM_OptionHotSpotMinimap:SetChecked(0);
	end
	if ( AlphaMapConfig.hsInfo == true ) then
		AM_OptionHotSpotInfoFrames:SetChecked(1);
	else
		AM_OptionHotSpotInfoFrames:SetChecked(0);
	end
	if ( AlphaMapConfig.amInBG == true ) then
		AM_OptionsUseInstanceInBG:SetChecked(1);
	else
		AM_OptionsUseInstanceInBG:SetChecked(0);
	end
	if ( AlphaMapConfig.dmAll == true ) then
		AM_OptionsDisplayDMAffectAll:SetChecked(1);
	else
		AM_OptionsDisplayDMAffectAll:SetChecked(0);
	end
	if ( AlphaMapConfig.bgAll == true ) then
		AM_OptionsDisplayBGAffectAll:SetChecked(1);
	else
		AM_OptionsDisplayBGAffectAll:SetChecked(0);
	end
	if ( AlphaMapConfig.amClearView == true ) then
		AM_OptionsClearView:SetChecked(1);
		AM_OptionsClearViewText:SetText(AM_OPTIONS_CLEARVIEW_ON);
	else
		AM_OptionsClearView:SetChecked(0);
		AM_OptionsClearViewText:SetText(AM_OPTIONS_CLEARVIEW_OFF);
	end
	if ( AlphaMapConfig.bgMsgType == "Default" ) then
		AM_OptionsBGMsgsDefault:SetChecked(1);
		AM_OptionsBGMsgsParty:SetChecked(0);
		AM_OptionsBGMsgsGeneral:SetChecked(0);
	elseif ( AlphaMapConfig.bgMsgType == "Party" ) then
		AM_OptionsBGMsgsDefault:SetChecked(0);
		AM_OptionsBGMsgsParty:SetChecked(1);
		AM_OptionsBGMsgsGeneral:SetChecked(0);
	elseif ( AlphaMapConfig.bgMsgType == "General" ) then
		AM_OptionsBGMsgsDefault:SetChecked(0);
		AM_OptionsBGMsgsParty:SetChecked(0);
		AM_OptionsBGMsgsGeneral:SetChecked(1);
	end
	if ( AlphaMapConfig.NuNFormatted == true ) then
		AM_OptionsNuNFormatted:SetChecked(1);
	else
		AM_OptionsNuNFormatted:SetChecked(0);
	end
	if ( AlphaMapConfig.NuNSendTo == "Default" ) then
		AM_OptionsNuNDefault:SetChecked(1);
		AM_OptionsNuNParty:SetChecked(0);
		AM_OptionsNuNGuild:SetChecked(0);
	elseif ( AlphaMapConfig.NuNSendTo == "Party" ) then
		AM_OptionsNuNDefault:SetChecked(0);
		AM_OptionsNuNParty:SetChecked(1);
		AM_OptionsNuNGuild:SetChecked(0);
	elseif ( AlphaMapConfig.NuNSendTo == "Guild" ) then
		AM_OptionsNuNDefault:SetChecked(0);
		AM_OptionsNuNParty:SetChecked(0);
		AM_OptionsNuNGuild:SetChecked(1);
	end
	if ( AlphaMapConfig.wmMode == AM_OPTIONS_WMAP_SMODE ) then
		AM_OptionsWM_Standard:SetChecked(1);
		AM_OptionsWM_Overlay:SetChecked(0);
		AM_OptionsWM_Minimap:SetChecked(0);
		AM_OptionsWM_ZMinimap:SetChecked(0);
	elseif ( AlphaMapConfig.wmMode == AM_OPTIONS_WMAP_OMODE ) then
		AM_OptionsWM_Standard:SetChecked(0);
		AM_OptionsWM_Overlay:SetChecked(1);
		AM_OptionsWM_Minimap:SetChecked(0);
		AM_OptionsWM_ZMinimap:SetChecked(0);
	elseif ( AlphaMapConfig.wmMode == AM_OPTIONS_WMAP_MINIMODE ) then
		AM_OptionsWM_Standard:SetChecked(0);
		AM_OptionsWM_Overlay:SetChecked(0);
		AM_OptionsWM_Minimap:SetChecked(1);
		AM_OptionsWM_ZMinimap:SetChecked(0);
	elseif ( AlphaMapConfig.wmMode == AM_OPTIONS_WMAP_ZMINIMODE ) then
		AM_OptionsWM_Standard:SetChecked(0);
		AM_OptionsWM_Overlay:SetChecked(0);
		AM_OptionsWM_Minimap:SetChecked(0);
		AM_OptionsWM_ZMinimap:SetChecked(1);
	end
	if ( AlphaMapConfig.Escape == true ) then
		AM_OptionsWM_Escape:SetChecked(1);
	else
		AM_OptionsWM_Escape:SetChecked(0);
	end
	if ( AlphaMapConfig.Mouse == true ) then
		AM_OptionsWM_Mouse:SetChecked(1);
	else
		AM_OptionsWM_Mouse:SetChecked(0);
	end
	if ( AlphaMapConfig.mute == true ) then
		AM_Options_Mute:SetChecked(1);
	else
		AM_Options_Mute:SetChecked(0);
	end
	if ( AlphaMapConfig.gmap == true ) then
		AM_OptionsGM_Allow:SetChecked(1);
		AM_OptionsGM_Change:Show();
	else
		AM_OptionsGM_Allow:SetChecked(0);
		AM_OptionsGM_Change:Hide();
	end
	AM_OptionsGM_Change:SetChecked(0);
	AM_ChangingOriWorldMap = false;
end



function AM_Alpha_OnUpdate()
	AM_Alpha:SetValue(AlphaMapConfig.alpha);
end



function AlphaMapFrame_PingPlayerPosition()
	AlphaMapPing:SetAlpha(255);
	AlphaMapPing:Show();
	AlphaMapPing.timer = 1;
end

function AM_ClearView()
	AM_Update_Timer_S = AM_UPDATE_INTERVAL_SMAX + 1;
	if ( AlphaMapConfig.amClearView ) then
		AlphaMapConfig.amClearView = false;
		AM_OptionsClearView:SetChecked(0);
		AM_OptionsClearViewText:SetText(AM_OPTIONS_CLEARVIEW_OFF);
	else
		AlphaMapConfig.amClearView = true;
		AM_OptionsClearView:SetChecked(1);
		AM_OptionsClearViewText:SetText(AM_OPTIONS_CLEARVIEW_ON);
	end
end

function AM_GetPlayerModelRef()
	local isModel = {Minimap:GetChildren()};

	for yes=getn(isModel), 1, -1 do
		if ( ( isModel[yes]:IsObjectType("Model") ) and ( not isModel[yes]:GetName() ) ) then
			return isModel[yes];
		end
	end
end


function AlphaMap_ShowTooltip()
	local lScale = AlphaMapFrame:GetScale();

	rScale = GameTooltip:GetScale();
	if ( lScale < 0.64 ) then
		GameTooltip:SetScale(0.64);
	elseif ( lScale > 1.1 ) then
		GameTooltip:SetScale(1.1);
	else
		GameTooltip:SetScale(lScale);
	end
	GameTooltip:Show();
end

function AlphaMap_ShowPopup()
	local lScale = AlphaMapFrame:GetScale();

	if ( lScale < 0.64 ) then
		AMPopup:SetScale(0.64);
	elseif ( lScale > 1.1 ) then
		AMPopup:SetScale(1.1);
	else
		AMPopup:SetScale(lScale);
	end
	AMPopup:Show();
end

function AlphaMap_GetUnitScale(min, max, dflt)
	local gScale = UIParent:GetScale();
	local lScale = AlphaMapFrame:GetScale();
	local eScale = AlphaMapFrame:GetEffectiveScale();

	if ( not min ) then
		min = AM_SCALE_MIN;
	end
	if ( not max ) then
		max = AM_SCALE_MAX;
	end
	if ( not dflt ) then
		dflt = 1;
	end

	eScale = eScale * dflt;

	if ( eScale < min ) then
		return ( ( min / gScale ) / lScale );
	elseif ( eScale > max ) then
		return ( ( max / gScale ) / lScale );
	end

	return dflt;
end

function AlphaMap_HideTooltip()
	GameTooltip:Hide();
	if ( rScale ) and ( rScale ~= 0 ) then
		GameTooltip:SetScale(rScale);
	else
		GameTooltip:SetScale(1.0);
	end
end



function AlphaMapAlphaMapKey_OnEnter(bttn)
	local highLvl;
	local parent = bttn:GetParent();
	local bttnName = parent:GetName();
	local bttnID = parent:GetID();
	local tstText = getglobal("AlphaMapAlphaMapDetail"..bttnID.."Symbol"):GetText();

	if ( ( amAlphaMapMap ) and ( amAlphaMapMap.type == AM_TYP_INSTANCE ) ) then
		highLvl = AlphaMapAlphaMapFrame:GetFrameLevel() + 2;
	else
		highLvl = AlphaMapDetailFrame:GetFrameLevel() + 2;
	end

	getglobal(bttnName.."Highlight"):Show();
	for i=1, iNote, 1 do
		local note = getglobal("AlphaMapAlphaMapNote"..i);
		if ( note.control == parent ) then
			note:Show();
			if ( ( tstText ~= "" ) and ( tstText ~= " " ) ) then
				note:SetFrameLevel( highLvl );
			end
			getglobal("AlphaMapAlphaMapNote"..i.."Highlight"):Show();
			local amIndex = tostring(i);
			if ( not amH[amIndex] ) then
				amH[amIndex] = "Temp";
			end
		end
	end

	if ( AlphaMapConfig.dmKeyTooltips ) then
		local x, y = GetCursorPosition();
		if ( x > 500 ) then
			GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT");
		else
			GameTooltip:SetOwner(this, "ANCHOR_TOPLEFT");
		end
		GameTooltip:ClearLines();
		GameTooltip:SetText( parent.txt );
		if ( ( parent.tttxt ) and ( parent.tttxt ~= "" ) ) then
			GameTooltip:AddLine( AM_GREEN..parent.tttxt.."|r" );
		end
		AlphaMap_ShowTooltip();
	end
end


function AlphaMapAlphaMapKey_OnLeave(bttn)
	local baseLvl;
	local parent = bttn:GetParent();
	local bttnName = parent:GetName();
	getglobal(bttnName.."Highlight"):Hide();

	if ( ( amAlphaMapMap ) and ( amAlphaMapMap.type == AM_TYP_INSTANCE ) ) then
		baseLvl = AlphaMapAlphaMapFrame:GetFrameLevel() + 1;
	else
		baseLvl = AlphaMapDetailFrame:GetFrameLevel() + 1;
	end

	for i=1, iNote, 1 do
		if ( not AlphaMapConfig.dmNotes ) then
			local note = getglobal("AlphaMapAlphaMapNote"..i);
			if ( ( not note.bgPOI ) and ( not note.bgFlag ) ) then
				note:Hide();
			end
		end
		getglobal("AlphaMapAlphaMapNote"..i):SetFrameLevel( baseLvl );
		getglobal("AlphaMapAlphaMapNote"..i.."Highlight"):Hide();
		local amIndex = tostring(i);
		if ( ( amH[amIndex] ) and ( amH[amIndex] == "Temp" ) ) then
			amH[amIndex] = nil;
		end
	end
	AlphaMap_HideTooltip();
end


function AlphaMapAlphaMapKey_OnClick(mBttn, bttn)
	local parent = bttn:GetParent();
	local keyID = parent:GetID();
	if ( mBttn == "LeftButton" ) then
		if ( parent.toMap ) then
			local bttnName = parent:GetName();				-- ??? Should this be before the ...Frame_Update(...
			getglobal(bttnName.."Highlight"):Hide();			-- ???
			AlphaMapFrame_Update( AlphaMap_GetMap(parent.toMap) );
		elseif ( ( parent.lootid ) and ( parent.lootid ~= "" ) and ( AtlasLoot_ShowBossLoot ) ) then
			local boss = getglobal("AlphaMapAlphaMapDetail"..keyID):GetText();
			AtlasLoot_ShowBossLoot(parent.lootid, boss, AM_AM_LOOT_POINT);
			AtlasLootItemsFrame:SetAlpha(1);
			-- Temporary hack until AtlasLoot can be updated (Fingers crossed)
--			if ( AtlasLootItemsFrame_Druid:IsVisible() ) then
--				AM_Temp_AtlasLootButtons();
--			end
		end

	elseif ( mBttn == "RightButton" ) then
		if ( AMPopup:IsVisible() ) then
			AM_HidePopup();
		else
			amRcMenus.bttnText = parent.txt;
			if ( parent.bgPOI ) then
				amRcMenus.POI = true;
				amRcMenus.bgFlag = false;
			else
				amRcMenus.POI = false;
			end
			if ( parent.bgFlag ) then
				amRcMenus.bgFlag = parent.bgFlag;
				amRcMenus.Flag = true;
				amRcMenus.POI = false;
			else
				amRcMenus.Flag = false;
			end
			if ( ( NuN_GNoteExists) and ( NuN_GNoteExists(amRcMenus.bttnText) ) ) then
				amRcMenus.NuN = true;
			else
				amRcMenus.NuN = nil;
			end
			AM_rcMenu_Initialise(bttn, ("Dtl"..keyID));
		end
	end
end



function AlphaMapAlphaMapNote_OnEnter(note)
	local highLvl;
	local parent = note:GetParent();
	local noteName = parent:GetName();
	getglobal(noteName.."Highlight"):Show();
	local controlType = type(parent.control);
	if ( controlType == "number" ) then
		amNotePage = parent.control;
		AM_Notes(amAlphaMapMap);
	end
	local controlName = parent.control:GetName();
	getglobal(controlName.."Highlight"):Show();

	if ( parent.bgFlag ) then
		if ( ( parent.bgFlag == "A" ) and ( amACarrier ) ) then
			parent.tttxt = amACarrier;
		elseif ( ( parent.bgFlag == "H" ) and ( amHCarrier ) ) then
			parent.tttxt = amHCarrier;
		end
	end

	if ( ( amAlphaMapMap ) and ( amAlphaMapMap.type == AM_TYP_INSTANCE ) ) then
		highLvl = AlphaMapAlphaMapFrame:GetFrameLevel() + 2;
	else
		highLvl = AlphaMapDetailFrame:GetFrameLevel() + 2;
	end

	for i=1, iNote, 1 do
		local otherNote = getglobal("AlphaMapAlphaMapNote"..i);
		if ( otherNote.control == parent.control ) then
			otherNote:SetFrameLevel( highLvl );
			getglobal("AlphaMapAlphaMapNote"..i.."Highlight"):Show();
			local amIndex = tostring(i);
			if ( not amH[amIndex] ) then
				amH[amIndex] = "Temp";
			end
		end
	end

	if ( AlphaMapConfig.dmNotesTooltips ) then
		local x, y = GetCursorPosition();
		if ( x > 500 ) then
			GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT");
		else
			GameTooltip:SetOwner(this, "ANCHOR_TOPLEFT");
		end
		GameTooltip:ClearLines();
		GameTooltip:SetText( parent.txt );
		if ( ( parent.special ) and ( parent.special ~= "" ) ) then
			GameTooltip:AddLine( AM_BLUE..parent.special.."|r" );
		end
		if ( ( parent.tttxt ) and ( parent.tttxt ~= "" ) ) then
			GameTooltip:AddLine( AM_GREEN..parent.tttxt.."|r" );
		end
		AlphaMap_ShowTooltip();
	end
end

function AlphaMapAlphaMapNote_OnLeave(note)
	local baseLvl;
	local parent = note:GetParent();
	local controlName = parent.control:GetName();

	if ( ( amAlphaMapMap ) and ( amAlphaMapMap.type == AM_TYP_INSTANCE ) ) then
		baseLvl = AlphaMapAlphaMapFrame:GetFrameLevel() + 1;
	else
		baseLvl = AlphaMapDetailFrame:GetFrameLevel() + 1;
	end

	getglobal(controlName.."Highlight"):Hide();
	for i=1, iNote, 1 do
		getglobal("AlphaMapAlphaMapNote"..i):SetFrameLevel( baseLvl );
		getglobal("AlphaMapAlphaMapNote"..i.."Highlight"):Hide();
		local amIndex = tostring(i);
		if ( ( amH[amIndex] ) and ( amH[amIndex] == "Temp" ) ) then
			amH[amIndex] = nil;
		end
	end
	AlphaMap_HideTooltip();
end

function AlphaMapAlphaMapNote_OnClick(mBttn, note)
	local parent = note:GetParent();
	local keyID = parent.control:GetID();
	if ( mBttn == "LeftButton" ) then
		if ( parent.toMap ) then
			for n=1, amNotesPerPage, 1 do
				getglobal("AlphaMapAlphaMapButtonDtl"..n.."Highlight"):Hide();
			end
			AlphaMapFrame_Update( AlphaMap_GetMap(parent.toMap) );

		elseif ( ( parent.lootid ) and ( AtlasLoot_ShowBossLoot ) ) then
			local boss = getglobal("AlphaMapAlphaMapDetail"..keyID):GetText();
			AtlasLoot_ShowBossLoot(parent.lootid, boss, AM_AM_LOOT_POINT);
			AtlasLootItemsFrame:SetAlpha(1);

		elseif ( parent.bgFlag ) then
			if ( ( parent.bgFlag == "A" ) and ( amACarrier ) ) then
				TargetByName(amACarrier, true);
			elseif ( ( parent.bgFlag == "H" ) and ( amHCarrier ) ) then
				TargetByName(amHCarrier, true);
			end
		end

	elseif ( mBttn == "RightButton" ) then
		if ( AMPopup:IsVisible() ) then
			AM_HidePopup();
		else
			amRcMenus.bttnText = parent.txt;
			if ( parent.bgPOI ) then
				amRcMenus.POI = true;
				amRcMenus.bgFlag = false;
			else
				amRcMenus.POI = false;
			end
			if ( parent.bgFlag ) then
				amRcMenus.bgFlag = parent.bgFlag;
				amRcMenus.Flag = true;
				amRcMenus.POI = false;
			else
				amRcMenus.Flag = false;
			end
			if ( ( NuN_GNoteExists) and ( NuN_GNoteExists(amRcMenus.bttnText) ) ) then
				amRcMenus.NuN = true;
			else
				amRcMenus.NuN = nil;
			end
			AM_rcMenu_Initialise(note, parent:GetID());
		end
	end
end




function AlphaMap_OptionsTabFrame_OnShow()
	if ( lastTab ) then
		PanelTemplates_SetTab(this, lastTab.id);
		AlphaMap_TabSelect(lastTab);
	else
		PanelTemplates_SetTab(this, 1);
		AlphaMap_TabSelect(AlphaMap_OptionsTabFrameTab1);
	end
end

function AlphaMap_TabSelect(subFrame)
	lastTab = subFrame;
	AM_OptionsFrameGeneral:Hide();
	AM_OptionsFrameDungeon:Hide();
	AM_OptionsFrameMaps:Hide();
	AM_OptionsFrameBG:Hide();
	AM_OptionsFrameMisc:Hide();
	subFrame.controlledFrame:Show();
end



function AM_ScaleSliderChanged()
	local scale = AM_Scale:GetValue();
	AM_CurrentScale:SetText( math.floor( scale * 100 ).."%" );
	if ( AM_ChangingOriWorldMap ) then
		WorldMapFrame:SetScale( scale );
		if ( AM_SkipWorldMapRepos ) then
			AM_SkipWorldMapRepos = nil;
		else
			WorldMapFrame:ClearAllPoints();
			WorldMapFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0);
		end
	else
		AlphaMapFrame:SetScale( scale );
		AlphaMapUnits_Update(100);
		if ( ( AlphaMapAlphaMapFrame:IsVisible() ) and ( amAlphaMapMap ) ) then
			AM_Notes(amAlphaMapMap);
		end
		AM_CheckDDScale();
		AM_CheckTheScale();
	end
	AlphaMapConfig.scale = scale;
end



function AM_MarkPosition(overRide)
	local x, y = AlphaMapFrame:GetCenter();
	local lScale = AlphaMapFrame:GetEffectiveScale();
	x = x * lScale;
	y = y * lScale;
	AlphaMapConfig.posX = x;
	AlphaMapConfig.posY = y;
	AM_SaveConfig();
end


function AM_PlaceMap(x, y)
	if ( ( x ) and ( y ) and ( not AlphaMapFrame.isMoving ) ) then
		local lScale = AlphaMapFrame:GetEffectiveScale();
		x = x / lScale;
		y = y / lScale;
		AlphaMapFrame:ClearAllPoints();
		AlphaMapFrame:SetPoint("CENTER", "UIParent", "BOTTOMLEFT", x, y);
	end
end




function AlphaMapContinentsDropDown_OnLoad()
	UIDropDownMenu_Initialize(AlphaMapContinentDropDown, AlphaMapContinentsDropDown_Initialize);
	UIDropDownMenu_SetWidth(150, AlphaMapContinentDropDown);
end

function AlphaMapContinentsDropDown_Initialize()
	AlphaMapFrame_LoadContinents(GetMapContinents());
end

function AlphaMapFrame_LoadContinents(...)
	local info;
	local ddIndex = 0;

	for i=1, arg.n, 1 do
		info = {};
		info.text = arg[i];
		info.func = AlphaMapContinentButton_OnClick;
		UIDropDownMenu_AddButton(info);
		ddIndex = ddIndex + 1;
	end

	if ( AM_ValidTypes[AM_TYP_INSTANCE] ) then
		ddIndex = ddIndex + 1;
		amInstanceIndex = ddIndex;
		info = {};
		info.text = AM_TYP_INSTANCE;
		info.func = AlphaMapContinentButton_OnClick;
		UIDropDownMenu_AddButton(info);
	end

	if ( AM_ValidTypes[AM_TYP_BG] ) then
		ddIndex = ddIndex + 1;
		amBGIndex = ddIndex;
		info = {};
		info.text = AM_TYP_BG;
		info.func = AlphaMapContinentButton_OnClick;
		UIDropDownMenu_AddButton(info);
	end

	if ( AM_ValidTypes[AM_TYP_RAID] ) then
		ddIndex = ddIndex + 1;
		amRaidIndex = ddIndex;
		info = {};
		info.text = AM_TYP_RAID;
		info.func = AlphaMapContinentButton_OnClick;
		UIDropDownMenu_AddButton(info);
	end
end

function AlphaMapZoneDropDown_OnLoad()
	UIDropDownMenu_Initialize(AlphaMapZoneDropDown, AlphaMapZoneDropDown_Initialize);
	UIDropDownMenu_SetWidth(150, AlphaMapZoneDropDown);
end

function AlphaMapZoneDropDown_Initialize()
	if ( amContType == AM_TYP_WM ) then
		AlphaMapFrame_LoadZones( GetMapZones( GetCurrentMapContinent() ) );
	else
		AM_LoadSortedMapList(amContType);
		AlphaMapFrame_LoadInstances();
	end
end

function AlphaMapFrame_LoadZones(...)
	local info;
	for i=1, arg.n, 1 do
		info = {};
		info.text = arg[i];
		info.func = AlphaMapZoneButton_OnClick;
		UIDropDownMenu_AddButton(info);
	end
end

function AlphaMapFrame_LoadInstances()
	local info;
	for i=1, getn(sortedMapList), 1 do
		info = {};
		info.text = sortedMapList[i].displayname;
		info.func = AlphaMapZoneButton_OnClick;
		UIDropDownMenu_AddButton(info);
	end
end

function AlphaMapContinentButton_OnClick()
	local foc = GetMouseFocus();
	if ( foc ) then
		foc = foc:GetName();
		if ( ( foc ) and ( string.find(foc, "DropDownList") ) ) then
		else
			foc = nil;
		end
	end
	local selected = this:GetID();
	UIDropDownMenu_SetSelectedID(AlphaMapContinentDropDown, selected);
	if ( selected == amInstanceIndex ) then
		amContType = AM_TYP_INSTANCE;
		UIDropDownMenu_ClearAll(AlphaMapZoneDropDown);
		AlphaMapZoneDropDown:Hide();
		AlphaMapZoneDropDown_OnLoad();
		AlphaMapZoneDropDown:Show();
	elseif ( selected == amBGIndex ) then
		amContType = AM_TYP_BG;
		UIDropDownMenu_ClearAll(AlphaMapZoneDropDown);
		AlphaMapZoneDropDown:Hide();
		AlphaMapZoneDropDown_OnLoad();
		AlphaMapZoneDropDown:Show();
	elseif ( selected == amRaidIndex ) then
		amContType = AM_TYP_RAID;
		UIDropDownMenu_ClearAll(AlphaMapZoneDropDown);
		AlphaMapZoneDropDown:Hide();
		AlphaMapZoneDropDown_OnLoad();
		AlphaMapZoneDropDown:Show();
	else
		AM_WorldMapSelected = true;
		AM_ManualMapChange = true;
		AM_ClearHighlights();
		if ( ( foc ) and ( not AlphaMapFrame:IsVisible() ) ) then
			ToggleAlphaMap();
		end
		amContType = AM_TYP_WM;
		SetMapZoom(this:GetID());
	end
end

function AlphaMapZoneButton_OnClick()
	local foc = GetMouseFocus();
	if ( foc ) then
		foc = foc:GetName();
		if ( ( foc ) and ( string.find(foc, "DropDownList") ) ) then
		else
			foc = nil;
		end
	end
	local selected = this:GetID();
	UIDropDownMenu_SetSelectedID(AlphaMapZoneDropDown, selected);
	AM_ClearHighlights();
	AM_ManualMapChange = true;
	if ( amContType == AM_TYP_WM ) then
		AM_WorldMapSelected = true;
		if ( ( foc ) and ( not AlphaMapFrame:IsVisible() ) ) then
			ToggleAlphaMap();
		end
		amMapType = AM_TYP_WM;
		SetMapZoom(GetCurrentMapContinent(), this:GetID());
	else
		if ( ( foc ) and ( not AlphaMapFrame:IsVisible() ) ) then
			ToggleAlphaMap();
		end
		amAlphaMapMap = AlphaMap_GetMap( sortedMapList[selected].name );
		AlphaMapUnits_Update(100);
		AlphaMapFrame_Update( amAlphaMapMap );
	end
end



function AlphaMap_UpdateContinentDropDownText()
	if ( GetCurrentMapContinent() == 0 ) then
		UIDropDownMenu_ClearAll(AlphaMapContinentDropDown);
	else
		UIDropDownMenu_SetSelectedID(AlphaMapContinentDropDown,GetCurrentMapContinent());
		amContType = AM_TYP_WM;
	end
end

function AlphaMap_UpdateZoneDropDownText()
	if ( GetCurrentMapZone() == 0 ) then
		UIDropDownMenu_ClearAll(AlphaMapZoneDropDown);
	else
		UIDropDownMenu_SetSelectedID(AlphaMapZoneDropDown, GetCurrentMapZone());
		amMapType = AM_TYP_WM;
	end
end






function AM_Selector_OnUpdate()
	if ( ( AM_MapSelector:IsVisible() ) and ( MouseIsOver(AM_MapSelector) ) and ( not AM_MapSelector.locked ) ) then
		AlphaMapSelectorMovementFrame:Show();
	else
		AlphaMapSelectorMovementFrame:Hide();
	end
end



function AM_rcMenu_Initialise(notePoint, highlight)
	local bttnIndex = 0;
	local info;
	local width, maxWidth = 0, 40;
	local normalText = nil;
	local bttns = {};
	local scaleValue = notePoint:GetScale();

	for i = 1, 18, 1 do
		bttns[i] = getglobal("AMPopupButton"..i);
		bttns[i]:Enable();
		bttns[i]:UnlockHighlight();
		bttns[i]:Hide();
	end

	if ( amRcMenus.POI ) then
		bttnIndex = bttnIndex + 1;
		bttns[bttnIndex]:SetText(AM_TYP_BG);
		width = bttns[bttnIndex]:GetTextWidth() + 40;
		if ( width > maxWidth ) then
			maxWidth = width;
		end
		bttns[bttnIndex]:LockHighlight();
		bttns[bttnIndex]:Disable();

		for i = 1, 6, 1 do
			bttnIndex = bttnIndex + 1;
			local n = i;
			if ( n > 5 ) then
				n = AM_RCMENU_ZERG;
			end
			bttns[bttnIndex]:SetText(n..AM_RCMENU_INC..amRcMenus.bttnText);
			bttns[bttnIndex].func = AM_BroadcastMsg;
			bttns[bttnIndex].arg1 = (n..AM_RCMENU_INC..amRcMenus.bttnText);
			width = bttns[bttnIndex]:GetTextWidth() + 40;
			if ( width > maxWidth ) then
				maxWidth = width;
			end
		end

		bttnIndex = bttnIndex + 1;
		bttns[bttnIndex]:SetText(amRcMenus.bttnText.." "..AM_OK);
		bttns[bttnIndex].func = AM_BroadcastMsg;
		bttns[bttnIndex].arg1 = (amRcMenus.bttnText.." "..AM_OK);
		width = bttns[bttnIndex]:GetTextWidth() + 40;
		if ( width > maxWidth ) then
			maxWidth = width;
		end

	elseif ( amRcMenus.Flag ) then
		bttnIndex = bttnIndex + 1;
		bttns[bttnIndex]:SetText(AM_TYP_BG);
		width = bttns[bttnIndex]:GetTextWidth() + 40;
		if ( width > maxWidth ) then
			maxWidth = width;
		end
		bttns[bttnIndex]:LockHighlight();
		bttns[bttnIndex]:Disable();

		local flgText = AM_RCMENU_HFLAG;
		if ( amRcMenus.bgFlag == "A" ) then
			flgText = AM_RCMENU_AFLAG;
		end
		for i = 1, getn(AM_RCMENU_FLAGLOC), 1 do
			bttnIndex = bttnIndex + 1;
			bttns[bttnIndex]:SetText(flgText..AM_RCMENU_FLAGLOC[i]);
			bttns[bttnIndex].func = AM_BroadcastMsg;
			bttns[bttnIndex].arg1 = flgText..AM_RCMENU_FLAGLOC[i];
			width = bttns[bttnIndex]:GetTextWidth() + 40;
			if ( width > maxWidth ) then
				maxWidth = width;
			end
		end
	end

	if ( NuN_GNoteExists) then
		bttnIndex = bttnIndex + 1;
		bttns[bttnIndex]:SetText(AM_NUN);
		width = bttns[bttnIndex]:GetTextWidth() + 40;
		if ( width > maxWidth ) then
			maxWidth = width;
		end
		bttns[bttnIndex]:LockHighlight();
		bttns[bttnIndex]:Disable();

		bttnIndex = bttnIndex + 1;
		bttns[bttnIndex]:SetText(AM_RCMENU_NUN_OPEN);
		bttns[bttnIndex].func = AM_OpenNuNNote;
		bttns[bttnIndex].arg1 = amRcMenus.bttnText;
		width = bttns[bttnIndex]:GetTextWidth() + 40;
		if ( width > maxWidth ) then
			maxWidth = width;
		end

		if ( amRcMenus.NuN ) then
			bttnIndex = bttnIndex + 1;
			bttns[bttnIndex]:SetText(AM_RCMENU_NUN_AUTO);
			bttns[bttnIndex].func = AM_SendNuNNote;
			bttns[bttnIndex].arg1 = "Auto";
			width = bttns[bttnIndex]:GetTextWidth() + 40;
			if ( width > maxWidth ) then
				maxWidth = width;
			end

			bttnIndex = bttnIndex + 1;
			bttns[bttnIndex]:SetText(AM_RCMENU_NUN_MAN);
			bttns[bttnIndex].func = AM_SendNuNNote;
			bttns[bttnIndex].arg1 = "Manual";
			width = bttns[bttnIndex]:GetTextWidth() + 40;
			if ( width > maxWidth ) then
				maxWidth = width;
			end
		end
	end

	if ( highlight ) then
		bttnIndex = bttnIndex + 1;
		bttns[bttnIndex]:SetText(AM_OPTIONS);
		width = bttns[bttnIndex]:GetTextWidth() + 40;
		if ( width > maxWidth ) then
			maxWidth = width;
		end
		bttns[bttnIndex]:LockHighlight();
		bttns[bttnIndex]:Disable();

		bttnIndex = bttnIndex + 1;
		bttns[bttnIndex]:SetText(AM_RCMENU_HIGHLIGHT);
		bttns[bttnIndex].func = AM_Highlight;
		bttns[bttnIndex].arg1 = highlight;
		width = bttns[bttnIndex]:GetTextWidth() + 40;
		if ( width > maxWidth ) then
			maxWidth = width;
		end
	end

	if ( bttnIndex > 0 ) then
		if ( not highlight ) then
			bttnIndex = bttnIndex + 1;
			bttns[bttnIndex]:SetText(AM_OPTIONS);
			width = bttns[bttnIndex]:GetTextWidth() + 40;
			if ( width > maxWidth ) then
				maxWidth = width;
			end
			bttns[bttnIndex]:LockHighlight();
			bttns[bttnIndex]:Disable();
		end

		bttnIndex = bttnIndex + 1;
		bttns[bttnIndex]:SetText(AM_CANCEL);
		bttns[bttnIndex].func = AM_HidePopup;
		width = bttns[bttnIndex]:GetTextWidth() + 40;
		if ( width > maxWidth ) then
			maxWidth = width;
		end
	end

	if ( bttnIndex > 0 ) then
		local singleHeight = AMPopupButton1:GetHeight() + 1;
		local heightBuffer = 24;
		local maxHeight = bttnIndex * singleHeight + heightBuffer;
		AMPopup:SetHeight(maxHeight);
		AMPopup:SetWidth(maxWidth);
		for i=1, bttnIndex, 1 do
			bttns[i]:SetWidth(maxWidth - 2);
			bttns[i]:Show();
		end
		AMPopup:SetScale(scaleValue);
		AMPopup:ClearAllPoints();
		local x, y = GetCursorPosition();
		if ( y > 300 ) then
			if ( x > 500 ) then
				AMPopup:SetPoint("TOPRIGHT", notePoint, "BOTTOMRIGHT", 0, 0);
			else
				AMPopup:SetPoint("TOPLEFT", notePoint, "BOTTOMLEFT", 0, 0);
			end
		else
			if ( x > 500 ) then
				AMPopup:SetPoint("BOTTOMRIGHT", notePoint, "TOPRIGHT", 0, 0);
			else
				AMPopup:SetPoint("BOTTOMLEFT", notePoint, "TOPLEFT", 0, 0);
			end
		end
		AlphaMap_ShowPopup();

	else
		AM_HidePopup();
	end
end

function AMPopup_OnClick(mBttn, Bttn)
	local func = Bttn.func;
	if ( func ) then
		func(Bttn.arg1);
	end
	(Bttn:GetParent()):Hide();
end


function AM_BroadcastMsg(msg)
--if ( msg ) then msg = string.upper(msg); else return; end
	if ( ( AlphaMapConfig.bgMsgType == "Default" ) and ( UnitInRaid("player") ) ) then
		SendChatMessage(msg, "RAID");
	elseif ( ( GetNumPartyMembers() > 0 ) and ( AlphaMapConfig.bgMsgType ~= "General" ) ) then
		SendChatMessage(msg, "PARTY");
	else
		local cIndex, cName = GetChannelName(1);
		if ( ( cIndex ~= 0 ) and ( cName ~= nil ) ) then
			SendChatMessage(msg, "CHANNEL", nil, cIndex);
		end
	end
	AM_HidePopup();
end


function AlphaMapDDPoint_OnLoad()
	UIDropDownMenu_Initialize(AlphaMapDDPoint, AlphaMapDDPoint_Initialise);
	UIDropDownMenu_SetWidth(110);
end

function AlphaMapDDPoint_Initialise()
	local info;
	for i=1, getn(amAnchorPoint), 1 do
		info = {};
		info.text = amAnchorPoint[i].Display;
		info.func = AlphaMapDDPoint_OnClick;
		UIDropDownMenu_AddButton(info);
	end
end

function AlphaMapDDPoint_OnClick()
	UIDropDownMenu_SetSelectedID(AlphaMapDDPoint, this:GetID());
	AlphaMapConfig.ddAnchorFrom = this:GetID();
	AM_SaveConfig();
	AlphaMapPlaceDDs();
end



function AlphaMapDDrelativePoint_OnLoad()
	UIDropDownMenu_Initialize(AlphaMapDDrelativePoint, AlphaMapDDrelativePoint_Initialise);
	UIDropDownMenu_SetWidth(110);
end

function AlphaMapDDrelativePoint_Initialise()
	local info;
	for i=1, getn(amAnchorPoint), 1 do
		info = {};
		info.text = amAnchorPoint[i].Display;
		info.func = AlphaMapDDrelativePoint_OnClick;
		UIDropDownMenu_AddButton(info);
	end
end

function AlphaMapDDrelativePoint_OnClick()
	UIDropDownMenu_SetSelectedID(AlphaMapDDrelativePoint, this:GetID());
	AlphaMapConfig.ddAnchorTo = this:GetID();
	AM_SaveConfig();
	AlphaMapPlaceDDs();
end





function AlphaMapPlaceDDs(showMap)
	if ( AlphaMapConfig.ddP == AM_ANCHOR_FREE ) then
		if ( AM_MapSelector:IsUserPlaced() ) then
			AM_MapSelector:SetParent(UIParent);
			AM_MapSelector:Show();
		else
			AM_MapSelector:ClearAllPoints();
			AM_MapSelector:SetParent(UIParent);
			AM_MapSelector:SetPoint("TOP", "UIParent", "TOP", 0, -75);
			AM_MapSelector:SetUserPlaced(1);
			AM_MapSelector:Show();
		end

	elseif ( AlphaMapConfig.ddP == AM_ANCHOR_ALPHAMAP ) then
		if ( ( not AlphaMapFrame:IsVisible() ) and ( showMap ) ) then
			ShowUIPanel( AlphaMapFrame );
		end
		AM_MapSelector:ClearAllPoints();
		AM_MapSelector:SetUserPlaced(0);
		AM_MapSelector:SetParent(AlphaMapFrame);
		local from = amAnchorPoint[AlphaMapConfig.ddAnchorFrom].Command;
		local to   = amAnchorPoint[AlphaMapConfig.ddAnchorTo].Command;
		AM_MapSelector:SetPoint(from, "AlphaMapFrame", to, -8, 8);
		AM_MapSelector:Show();
		AM_MapSelector:SetUserPlaced(0);

	else
		AM_MapSelector:ClearAllPoints();
		AM_MapSelector:SetUserPlaced(0);
		AM_MapSelector:SetParent(AM_OptionsFrameMaps);
		AM_MapSelector:SetPoint("CENTER", "AlphaMapDockingFrame", "CENTER", 0, 0);
		AM_MapSelector:Show();

	end
end



function AM_Selector_OnShow()
	if ( AlphaMapConfig.HotSpot ) then
		AM_DDHotSpot:Show();
	else
		AM_DDHotSpot:Hide();
	end
	local parent = this:GetParent();
	if ( parent == UIParent ) then
		AM_DDLockButton:Show();
		AM_SetLock();
	else
		AM_DDLockButton:Hide();
	end
	AM_CheckDDScale();
end


function AM_CheckDDScale()
	local parent = AM_MapSelector:GetParent();
	if ( parent == AlphaMapFrame ) then
		local eScale = AlphaMapFrame:GetEffectiveScale();
		if ( eScale < 0.5 ) then
			eScale = 0.5 / eScale;
			AM_MapSelector:SetScale(eScale);
			AlphaMapPlaceDDs();
		elseif ( eScale > 1 ) then
			eScale = 1 / eScale;
			AM_MapSelector:SetScale(eScale);
			AlphaMapPlaceDDs();
		end
	else
		AM_MapSelector:SetScale(1);
	end
end

function AM_CheckTheScale()
	local eScale = AlphaMapFrame:GetEffectiveScale();
	local x = 10;
	local y = -190;
	if ( eScale < 0.6 ) then
		x = x*eScale;
		y = y*eScale;
		eScale = (0.6 / eScale);
		AM_Coordinates:SetScale(eScale);
	elseif ( eScale > 1.1 ) then
		x = x*eScale;
		y = y*eScale;
		eScale = (1 / eScale);
		AM_Coordinates:SetScale(eScale);
	end
	AM_Coordinates:ClearAllPoints()
	AM_Coordinates:SetPoint("TOPLEFT", "AlphaMapFrame", "TOPLEFT", x, y);
end

function AM_ToggleHotSpot()
	if ( AM_OptionsFrame:IsVisible() ) then
		return;
	end

	if ( AM_HotSpotToggled ) then
		AM_HotSpot_OnLeave();
	else
		AM_HotSpot_OnEnter();
	end
end

function AM_HotSpot_OnEnter()
	if ( AM_HotSpotToggled == true ) then
		return;
	end

	if ( not AlphaMapFrame:IsVisible() ) then
		if ( AlphaMapConfig.hsOpen ) then
			ToggleAlphaMap();
			AM_DDHotSpot.toggled = true;
		else
			return;
		end
	end

	if ( AlphaMapConfig.hsOpacity ) then
		if ( AlphaMapAlphaMapFrame:IsVisible() ) then
			AM_DDHotSpot.alpha = AlphaMapAlphaMapFrame:GetAlpha();
			AlphaMapAlphaMapFrame:SetAlpha(1);
			AlphaMapAlphaMapTitleFrame:SetAlpha(1);
			AlphaMapAlphaMapPreReqFrame:SetAlpha(1);
			AlphaMapAlphaMapDetailsFrame:SetAlpha(1);
		elseif ( AlphaMapDetailFrame:IsVisible() ) then
			AM_DDHotSpot.alpha = AlphaMapDetailFrame:GetAlpha();
			AlphaMapDetailFrame:SetAlpha(1);
		end
	end

	if ( AlphaMapConfig.hsWmIcons ) then
		AlphaMapConfig.amClearView = not AlphaMapConfig.amClearView;
	end

	if ( AlphaMapConfig.hsDmIcons ) then
		if ( AlphaMapConfig.dmNotes ) then
			for i=1, iNote, 1 do
				getglobal("AlphaMapAlphaMapNote"..i):Hide();
			end
		else
			for i=1, iNote, 1 do
				getglobal("AlphaMapAlphaMapNote"..i):Show();
			end
		end
	end

	if ( AlphaMapConfig.hsNBg ) then
		if ( AlphaMapConfig.dmNotesBg ) then
			for i=1, iNote, 1 do
				getglobal("AlphaMapAlphaMapNote"..i.."Background"):Hide();
			end
		else
			for i=1, iNote, 1 do
				getglobal("AlphaMapAlphaMapNote"..i.."Background"):Show();
			end
		end
	end

	if ( AlphaMapConfig.hsMBg ) then
		if ( AlphaMapAlphaMapBgTexture:IsVisible() ) then
			AlphaMapAlphaMapBgTexture:Hide();
		else
			AlphaMapAlphaMapBgTexture:Show();
			AM_UpdateColours("Map", AlphaMapConfig.mBgColour.r, AlphaMapConfig.mBgColour.g, AlphaMapConfig.mBgColour.b, AlphaMapConfig.mBgColour.a );
		end
	end

	if ( ( AlphaMapConfig.hsInfo ) and ( AlphaMapAlphaMapFrame:IsVisible() ) ) then
		if ( AlphaMapAlphaMapDetailsFrame:IsVisible() ) then
			AlphaMapAlphaMapDetailsFrame:Hide();
		else
			AlphaMapAlphaMapDetailsFrame:Show();
		end
		if ( AlphaMapAlphaMapTitleFrame:IsVisible() ) then
			AlphaMapAlphaMapTitleFrame:Hide();
		else
			AlphaMapAlphaMapTitleFrame:Show();
		end
		if ( AlphaMapAlphaMapPreReqFrame:IsVisible() ) then
			AlphaMapAlphaMapPreReqFrame:Hide();
		else
			AlphaMapAlphaMapPreReqFrame:Show();
		end
	end

	AlphaMapFrame_PingPlayerPosition();

	AM_Update_Timer_S = AM_UPDATE_INTERVAL_SMAX + 1;
	AM_Update_Timer_P = AM_UPDATE_INTERVAL_PMAX + 1;

	AM_HotSpotToggled = true;
end

function AM_HotSpot_OnLeave()
	if ( AM_HotSpotToggled == false ) then
		return;
	end

	if ( AlphaMapConfig.hsOpacity ) then
		if ( AlphaMapAlphaMapFrame:IsVisible() ) then
			AlphaMapAlphaMapFrame:SetAlpha(AM_DDHotSpot.alpha);
			AlphaMapAlphaMapTitleFrame:SetAlpha(AM_DDHotSpot.alpha);
			AlphaMapAlphaMapPreReqFrame:SetAlpha(AM_DDHotSpot.alpha);
			AlphaMapAlphaMapDetailsFrame:SetAlpha(AM_DDHotSpot.alpha);
			if ( AtlasLootItemsFrame ) then
				AtlasLootItemsFrame:SetAlpha(1);
			end
		elseif ( AlphaMapDetailFrame:IsVisible() ) then
			AlphaMapDetailFrame:SetAlpha(AM_DDHotSpot.alpha);
		end
	end

	if ( AlphaMapConfig.hsWmIcons ) then
		AlphaMapConfig.amClearView = not AlphaMapConfig.amClearView;
	end

	if ( AlphaMapConfig.hsDmIcons ) then
		if ( AlphaMapConfig.dmNotes ) then
			for i=1, iNote, 1 do
				getglobal("AlphaMapAlphaMapNote"..i):Show();
			end
		else
			for i=1, iNote, 1 do
				getglobal("AlphaMapAlphaMapNote"..i):Hide();
			end
		end
	end

	if ( AlphaMapConfig.hsNBg ) then
		if ( AlphaMapConfig.dmNotesBg ) then
			for i=1, iNote, 1 do
				getglobal("AlphaMapAlphaMapNote"..i.."Background"):Show();
			end
		else
			for i=1, iNote, 1 do
				getglobal("AlphaMapAlphaMapNote"..i.."Background"):Hide();
			end
		end
	end

	if ( AlphaMapConfig.hsMBg ) then
		if ( AlphaMapAlphaMapBgTexture:IsVisible() ) then
			AlphaMapAlphaMapBgTexture:Hide();
		else
			AlphaMapAlphaMapBgTexture:Show();
			AM_UpdateColours("Map", AlphaMapConfig.mBgColour.r, AlphaMapConfig.mBgColour.g, AlphaMapConfig.mBgColour.b, AlphaMapConfig.mBgColour.a );
		end
	end

	if ( ( AlphaMapConfig.hsInfo ) and ( AlphaMapAlphaMapFrame:IsVisible() ) ) then
		if ( AlphaMapAlphaMapDetailsFrame:IsVisible() ) then
			AlphaMapAlphaMapDetailsFrame:Hide();
		else
			AlphaMapAlphaMapDetailsFrame:Show();
		end
		if ( AlphaMapAlphaMapTitleFrame:IsVisible() ) then
			AlphaMapAlphaMapTitleFrame:Hide();
		else
			AlphaMapAlphaMapTitleFrame:Show();
		end
		if ( AlphaMapAlphaMapPreReqFrame:IsVisible() ) then
			AlphaMapAlphaMapPreReqFrame:Hide();
		else
			AlphaMapAlphaMapPreReqFrame:Show();
		end
	end

	if ( AM_DDHotSpot.toggled ) then
		ToggleAlphaMap();
	end

	AM_DDHotSpot.toggled = nil;
	AM_DDHotSpot.alpha = nil;

	AlphaMapPing:Hide();

	AM_Update_Timer_S = AM_UPDATE_INTERVAL_SMAX + 1;
	AM_Update_Timer_P = AM_UPDATE_INTERVAL_PMAX + 1;

	AM_HotSpotToggled = false;
end



function AM_OptionsNoteBG_Set()
	AM_SetUpColourPicker(AlphaMapConfig.nBgColour, "Notes");
end

function AM_OptionsMapBG_Set()
	AM_SetUpColourPicker(AlphaMapConfig.mBgColour, "Map");
end

function AM_SetUpColourPicker(colour, txture)
	ColorPickerFrame.hasOpacity = true;
	ColorPickerFrame.amTexture = txture;
	ColorPickerFrame.amAlpha = colour.a;
	ColorPickerFrame.func = AM_AcceptColour;
	ColorPickerFrame.opacityFunc = AM_AcceptColour;
	ColorPickerFrame.cancelFunc = AM_CancelColourPicker;
	ColorPickerFrame.previousValues = {colour.r, colour.g, colour.b};
	ColorPickerFrame:SetFrameStrata("FULLSCREEN");
	ColorPickerFrame.opacity = colour.a;
	ColorPickerFrame:SetColorRGB(colour.r, colour.g, colour.b);
	ColorPickerFrame:Show();
end

function AM_AcceptColour()
	local red, green, blue = ColorPickerFrame:GetColorRGB();
	local opacity = OpacitySliderFrame:GetValue();
	AM_UpdateColours(ColorPickerFrame.amTexture, red, green, blue, opacity);
end

function AM_CancelColourPicker(prevColors)
	local red, green, blue = unpack(prevColors);
	local opacity = ColorPickerFrame.amAlpha;
	AM_UpdateColours(ColorPickerFrame.amTexture, red, green, blue, opacity);

	ColorPickerFrame.amTexture = nil;
	ColorPickerFrame.amAlpha = nil;
end



function AM_UpdateColours(txture, red, green, blue, opacity, allNotes)
	if ( txture == "Map" ) then
		AlphaMapConfig.mBgColour.r = red;
		AlphaMapConfig.mBgColour.g = green;
		AlphaMapConfig.mBgColour.b = blue;
		AlphaMapConfig.mBgColour.a = opacity;
		AlphaMapAlphaMapBgTexture:SetVertexColor(red, green, blue);
		AlphaMapAlphaMapBgTexture:SetAlpha(opacity);
		AM_SaveConfig();

	elseif ( txture == "Notes" ) then
		local upTo = 60;
		if ( not allNotes ) then
			upTo = iNote;
		end
		AlphaMapConfig.nBgColour.r = red;
		AlphaMapConfig.nBgColour.g = green;
		AlphaMapConfig.nBgColour.b = blue;
		AlphaMapConfig.nBgColour.a = opacity;
		for i=1, upTo, 1 do
			AM_UpdateNoteBgColour(i);
		end
		AM_SaveConfig();
	end
end

function AM_UpdateNoteBgColour(i)
	local bg = getglobal("AlphaMapAlphaMapNote"..i.."Background");
	bg:SetVertexColor(AlphaMapConfig.nBgColour.r, AlphaMapConfig.nBgColour.g, AlphaMapConfig.nBgColour.b);
	bg:SetAlpha(AlphaMapConfig.nBgColour.a);
end


function AM_LoadSortedMapList(type)
	sortedMapList = {};
	sortedMapList.type = type;
	sortedMapListIndex = 0;
	for index, value in AM_ALPHAMAP_LIST do
		local map = AM_ALPHAMAP_LIST[index].filename;
		if ( ( AM_ValidMaps[map] ) and ( AM_ALPHAMAP_LIST[index].type == type ) ) then
			sortedMapListIndex = sortedMapListIndex + 1;
			sortedMapList[sortedMapListIndex] = 	{	name = AM_ALPHAMAP_LIST[index].name,
									displayname = AM_ALPHAMAP_LIST[index].displayname,
									filename = AM_ALPHAMAP_LIST[index].filename,
									levels = AM_ALPHAMAP_LIST[index].levels,
									players = AM_ALPHAMAP_LIST[index].players
								};
		end
	end
	amSortBy = "displayAlpha";
	table.sort(sortedMapList, AM_SortMapList);
end

function AM_SortMapList(ele1, ele2)
	if ( amSortBy == "displayAlpha" ) then
		if ( ele1.displayname < ele2.displayname ) then
			return true;
		end
	end
	return nil;
end



function AM_SelectorLockToggle()
	AlphaMapConfig.freeLocked = ( not AlphaMapConfig.freeLocked );
	AM_SetLock();
	AM_SaveGlobals();
end

function AM_SetLock()
	if ( AlphaMapConfig.freeLocked ) then
		AM_MapSelector.locked = true;
		AM_DDUnLockedButtonTexture:Hide();
		AM_DDLockedButtonTexture:Show();
	else
		AM_MapSelector.locked = false;
		AM_DDLockedButtonTexture:Hide();
		AM_DDUnLockedButtonTexture:Show();
	end
end



function AM_OffsetInstanceCoords(pX, pY)
	local wmData = amAlphaMapMap.wmData;
	local amData = amAlphaMapMap.amData;
	local negX, negY = nil, nil;
	local wmDimension, wmOffset, relativeOffset, amDimension, amOffset;

	if ( pX < 0 ) then
		negX = true;
		pX = -(pX);
	end

	if ( pY < 0 ) then
		negY = true;
		pY = -(pY);
	end

	if ( pX < wmData.minX ) then
		pX = amData.minX;
	elseif ( pX > wmData.maxX ) then
		pX = amData.maxX;
	else
		wmDimension = wmData.maxX - wmData.minX;
		wmOffset = pX - wmData.minX;
		relativeOffset = wmOffset/wmDimension;
		amDimension = amData.maxX - amData.minX;
		amOffset = amDimension * relativeOffset;
		pX = amData.minX + amOffset;
	end

	if ( pY < wmData.minY ) then
		pY = amData.minY;
	elseif ( pY > wmData.maxY ) then
		pY = amData.maxY;
	else
		local wmDimension = wmData.maxY - wmData.minY;
		local wmOffset = pY - wmData.minY;
		local relativeOffset = wmOffset/wmDimension;
		local amDimension = amData.maxY - amData.minY;
		local amOffset = amDimension * relativeOffset;
		pY = amData.minY + amOffset;
	end

	if ( negX ) then
		pX = -(pX);
	end
	if ( negY ) then
		pY = -(pY);
	end

	return pX, pY;
end




function AM_ClearNotes()
	if ( ( MetaMapNotes_Data ) or ( MapNotes_Data ) ) then
		for i=1, NUM_ALPHAMAP_MAPNOTE_POIS, 1 do
			getglobal("AlphaMapNotesPOI"..i):Hide();
		end
	end

	if ( MapNotes_Data ) then
		for i=1, NUM_ALPHAMAP_GATHERNOTE_POIS, 1 do
			getglobal("AlphaMapGatheringPOI"..i):Hide();
		end
	end

	if ( CT_NUM_USERMAP_NOTES ) then
		for i = 1, CT_NUM_USERMAP_NOTES, 1 do
			getglobal("AMCT_UserMap_Note"..i):Hide();
		end
	end

	if ( FLIGHTMAP_MAX_POIS ) then
		for i = 1, FLIGHTMAP_MAX_POIS, 1 do
			getglobal("AM_FlightMapPOI"..i):Hide();
		end
	end

	if ( MapNotesGathering_Data ) then
		for j=1, am_MaxGNotes, 1 do
			local mainNote = getglobal( "AlphaMapGathererPOI"..j );
			mainNote:Hide();
		end
	end

	if ( GatherConfig ) then
		for j=1, am_MaxGNotes, 1 do
			local mainNote = getglobal( "AlphaMapGathererPOI"..j );
			mainNote:Hide();
		end
	end
end



function AM_SaveConfig(map)
	if ( map ) then
		amAlphaMapMap = map;
	end

	if ( AM_ChangingOriWorldMap ) then
		AM_CopySettings(AlphaMapConfig, AlphaMapConfigurations.gm);
	else
		if ( amAlphaMapMap ) then
			if ( ( amAlphaMapMap.type == AM_TYP_INSTANCE ) and ( AlphaMapConfig.dmAll ) ) then
				AM_SaveInstances_OnClick();
			elseif ( ( amAlphaMapMap.type == AM_TYP_BG ) and ( AlphaMapConfig.bgAll ) ) then
				AM_SaveBGs_OnClick();
			else
				AM_CopySettings(AlphaMapConfig, AlphaMapConfigurations[amAlphaMapMap.filename])
			end
		elseif ( GetCurrentMapContinent() == -1 ) then
			local mapFileName = GetMapInfo();
			local amMap = AlphaMap_GetMap(mapFileName);
			if ( amMap ) then
				if ( ( amMap.type == AM_TYP_INSTANCE ) and ( AlphaMapConfig.dmAll ) ) then
					AM_SaveInstances_OnClick();
				elseif ( ( amMap.type == AM_TYP_BG ) and ( AlphaMapConfig.bgAll ) ) then
					AM_SaveBGs_OnClick();
				else
					AM_CopySettings(AlphaMapConfig, AlphaMapConfigurations[amMap.filename])
				end
			else
				AM_CopySettings(AlphaMapConfig, AlphaMapConfigurations.wm);
			end
		else
			AM_CopySettings(AlphaMapConfig, AlphaMapConfigurations.wm);
		end
		AM_CopySettings(AlphaMapConfig, AM_OptionsFrame.AlphaMapConfig);
	end

	AM_SaveGlobals();

	return true;
end

function AM_ReportChange()
	AM_SaveConfig();
end

function AM_SaveGlobals()
	for configuration, configurations in AlphaMapConfigurations do

		AlphaMapConfigurations[ configuration ].enabled		= AlphaMapConfig.enabled;
		AlphaMapConfigurations[ configuration ].dmAll		= AlphaMapConfig.dmAll;
		AlphaMapConfigurations[ configuration ].bgAll		= AlphaMapConfig.bgAll;

		AlphaMapConfigurations[ configuration ].lock		= AlphaMapConfig.lock;

		AlphaMapConfigurations[ configuration ].legacy		= AlphaMapConfig.legacy;

		AlphaMapConfigurations[ configuration ].ddP		= AlphaMapConfig.ddP;
		AlphaMapConfigurations[ configuration ].ddAnchorTo	= AlphaMapConfig.ddAnchorTo;
		AlphaMapConfigurations[ configuration ].ddAnchorFrom	= AlphaMapConfig.ddAnchorFrom;
		AlphaMapConfigurations[ configuration ].freeLocked	= AlphaMapConfig.freeLocked;

--		AlphaMapConfigurations[ configuration ].slider		= AlphaMapConfig.slider;
--		AlphaMapConfigurations[ configuration ].sliderlock	= AlphaMapConfig.sliderlock;

		AlphaMapConfigurations[ configuration ].minimap		= AlphaMapConfig.minimap;
		AlphaMapConfigurations[ configuration ].angle		= AlphaMapConfig.angle;
		AlphaMapConfigurations[ configuration ].radius		= AlphaMapConfig.radius;

		AlphaMapConfigurations[ configuration ].wmMode		= AlphaMapConfig.wmMode;

		AlphaMapConfigurations[ configuration ].Escape		= AlphaMapConfig.Escape;
		AlphaMapConfigurations[ configuration ].Mouse		= AlphaMapConfig.Mouse;

--		AlphaMapConfigurations[ configuration ].sliderLocX	= AlphaMapConfig.sliderLocX;
--		AlphaMapConfigurations[ configuration ].sliderLocY	= AlphaMapConfig.sliderLocY;

		AlphaMapConfigurations[ configuration ].mute		= AlphaMapConfig.mute;

		AlphaMapConfigurations[ configuration ].gmap		= AlphaMapConfig.gmap;

	end
end

function AM_SaveInstances_OnClick()
	AM_SaveTypes(AM_TYP_INSTANCE);
end

function AM_SaveBGs_OnClick()
	AM_SaveTypes(AM_TYP_BG);
end

function AM_SaveTypes(amTyp)
	for map, maps in AM_ALPHAMAP_LIST do
		if ( AM_ALPHAMAP_LIST[map].type == amTyp ) then
			if ( not AlphaMapConfigurations[AM_ALPHAMAP_LIST[map].filename] ) then
				AlphaMapConfigurations[AM_ALPHAMAP_LIST[map].filename] = {};
			end
			AM_CopySettings(AlphaMapConfig, AlphaMapConfigurations[AM_ALPHAMAP_LIST[map].filename]);
		end
	end
end

function AM_InitialiseTypes()
	for map, maps in AM_ALPHAMAP_LIST do
		if ( not AlphaMapConfigurations[AM_ALPHAMAP_LIST[map].filename] ) then
			AlphaMapConfigurations[AM_ALPHAMAP_LIST[map].filename] = {};
			AM_CopySettings(AlphaMapConfig, AlphaMapConfigurations[AM_ALPHAMAP_LIST[map].filename]);
		else
			AM_CheckSettings(AlphaMapConfig, AlphaMapConfigurations[AM_ALPHAMAP_LIST[map].filename]);
		end
	end
end

function AM_CopySettings(sttngsF, sttngsT)
	if ( ( sttngsF ) and ( sttngsT ) ) then
		for value1, values1 in sttngsF do
			if ( type(sttngsF[value1]) == "table" ) then
				if ( not sttngsT[value1] ) then
					sttngsT[value1] = {};
				end
				for value2, values2 in sttngsF[value1] do
					sttngsT[value1][value2] = sttngsF[value1][value2];
				end
			else
				sttngsT[value1] = sttngsF[value1];
			end
		end
	end
end

function AM_CheckSettings(sttngsF, sttngsT)
	if ( ( sttngsF ) and ( sttngsT ) ) then
		for value1, values1 in sttngsF do
			if ( type(sttngsF[value1]) == "table" ) then
				if ( not sttngsT[value1] ) then
					sttngsT[value1] = {};
				end
				for value2, values2 in sttngsF[value1] do
					if ( sttngsT[value1][value2] == nil ) then
						sttngsT[value1][value2] = sttngsF[value1][value2];
					end
				end
			else
				if ( sttngsT[value1] == nil ) then
					sttngsT[value1] = sttngsF[value1];
				end
			end
		end
	end
end




function AM_SetupPOIs(amPrfx, amPstfx, amFrame)
	-- Setup the POI's
	-- This should be moved out of here
	local numPOIs = GetNumMapLandmarks();
	local name, description, textureIndex, x, y;
	local alphaMapPOI;
	local x1, x2, y1, y2;

	-- Iterate through each of the Points of interest
	for i=1, NUM_ALPHAMAP_POIS, 1 do

		-- Get the current point of interest
		alphaMapPOI = getglobal( amPrfx..i );
		alphaMapPOITexture = getglobal( amPrfx..i..amPstfx );

		-- Check if the current POI is a valid POI
		if ( i <= numPOIs ) then
			name, description, textureIndex, x, y = GetMapLandmarkInfo( i );
			x1, x2, y1, y2 = AlphaMap_GetPOITextureCoords( textureIndex, (alphaMapPOITexture:GetWidth()) );
			-- Set the texture coordinates
			getglobal( alphaMapPOI:GetName()..amPstfx ):SetTexCoord( x1, x2, y1, y2 );
			x =  x * amFrame:GetWidth();
			y = -y * amFrame:GetHeight();

			alphaMapPOI:SetPoint( "CENTER", amFrame, "TOPLEFT", x, y );

			alphaMapPOI.name = name;
			alphaMapPOI.description = description;
			alphaMapPOI:Show();
		else
			alphaMapPOI:Hide();
		end
	end
end


function AM_FetchBGPOIs()
	local numPOIs = GetNumMapLandmarks();
	local name, description, textureIndex, x, y;
	local x1, x2, y1, y2;
	local alphaMapIconDimension = AlphaMapAlphaMapNote1POI:GetWidth();

	for i=1, NUM_ALPHAMAP_POIS, 1 do
		name, description, textureIndex, x, y = GetMapLandmarkInfo( i );
		if ( ( name ) and ( not amBGPOIs[name] ) ) then
			amBGPOIs[name] = {};
			amBGPOIs[name].x1, amBGPOIs[name].x2, amBGPOIs[name].y1, amBGPOIs[name].y2 = AlphaMap_GetPOITextureCoords( textureIndex, alphaMapIconDimension );
		end
	end
end



function AM_GetFlagCarrier(arg1)
	if ( ( amAlphaMapMap ) and ( amAlphaMapMap.filename == "WarsongGulch" ) ) then
		if ( string.find(arg1, AM_PICKED.word) ) then
			local sStart = 1;
			local sEnd = string.find(arg1, " ") - 1;
			if ( AM_PICKED.posWord ) then
				sStart = string.find(arg1, AM_PICKED.posWord) + string.len(AM_PICKED.posWord);
				sEnd = string.len(arg1) - AM_PICKED.extraChars;
			end
			local player = string.sub(arg1, sStart, sEnd);
			if ( string.find(arg1, AM_HORDE) ) then
				amHCarrier = player;
				AMHText:SetText(player);
				local amIndex = tostring(AMFlags.hNote);
				if ( ( not amH[amIndex] ) or ( amH[amIndex] == "Temp" ) ) then
					amH[amIndex] = "Fixed";
				end
			else
				amACarrier = player;
				AMAText:SetText(player);
				local amIndex = tostring(AMFlags.aNote);
				if ( ( not amH[amIndex] ) or ( amH[amIndex] == "Temp" ) ) then
					amH[amIndex] = "Fixed";
				end
			end
		else
			if ( string.find(arg1, AM_HORDE) ) then
				amHCarrier = nil;
				AMHText:SetText(" ");
				local amIndex = tostring(AMFlags.hNote);
				if ( amH[amIndex] ) then
					amH[amIndex] = nil;
				end
			else
				amACarrier = nil;
				AMAText:SetText(" ");
				local amIndex = tostring(AMFlags.aNote);
				if ( amH[amIndex] ) then
					amH[amIndex] = nil;
				end
			end
		end
	end
end


function AM_GetABScores()
	if ( amAlphaMapMap.filename == "ArathiBasin" ) then
		local AlliScore, HordeScore = 0, 0;
		local AlliText  = GetWorldStateUIInfo(1);
		local HordeText = GetWorldStateUIInfo(2);
		if ( ( AlliText ) and ( HordeText ) ) then
			local first = string.find(AlliText, ":");
			if ( first ) then
				first = string.find(AlliText, ":", first+1);
				local sep = string.find(AlliText, "/");
				AlliScore  = string.sub(AlliText,  first+2, sep-1);
				first = string.find(HordeText, ":");
				first = string.find(HordeText, ":", first+1);
				sep = string.find(HordeText, "/");
				HordeScore = tonumber( string.sub(HordeText, first+2, sep-1) );
		 		local pFaction = UnitFactionGroup("player");
				if ( ( AlliScore ) and ( HordeScore ) ) then
			 		if ( pFaction == "Horde" ) then
			 			return string.sub(pFaction, 1, 1), AM_CalcRequiredBases(HordeScore, AlliScore);
			 		else
			 			return string.sub(pFaction, 1, 1), AM_CalcRequiredBases(AlliScore, HordeScore);
			 		end
			 	end
			 end
	 	end
	end

	return nil;
end


function AM_CalcRequiredBases(faction1, faction2)
	faction1 = 2000 - faction1;
	faction2 = 2000 - faction2;

	if ( faction2 == 0 ) then
		return 5;
	end

	local scoreRatio = faction1 / faction2;

	if ( scoreRatio < 1/4 ) then
		return 1;
	elseif ( scoreRatio < 2/3 ) then
		return 2;
	elseif ( scoreRatio < 3/2 ) then
		return 3
	elseif ( scoreRatio < 4 ) then
		return 4;
	else
		return 5;
	end
end


function AlphaMapAlphaMap_OnUpdate(arg1)
	if ( MouseIsOver(AlphaMapAlphaMapFrame) ) then
	        local centerX, centerY = AlphaMapAlphaMapFrame:GetCenter();
	        local width = AlphaMapAlphaMapFrame:GetWidth();
	        local height = AlphaMapAlphaMapFrame:GetHeight();
	        local x, y = GetCursorPosition();
	        x = x / AlphaMapAlphaMapFrame:GetEffectiveScale();
	        y = y / AlphaMapAlphaMapFrame:GetEffectiveScale();
	        local adjustedY = (centerY + height/2 - y) / height;
	        local adjustedX = (x - (centerX - width/2)) / width;
	        x = 100 * ( adjustedX + MOFFSET_X );
	        y = 100 * ( adjustedY + MOFFSET_Y );
	        AlphaMapAlphaMapCursorLoc:SetText(format("%d, %d", x, y));
	end

	hTimer = hTimer + arg1;
	if ( hTimer > AM_FLASH_TIMER ) then
		for index, value in amH do
			local h = getglobal("AlphaMapAlphaMapNote"..index.."Highlight");
			if ( h:IsVisible() ) then
				h:Hide();
			else
				h:Show();
			end
		end
		hTimer = 0;
	end
end

function AM_Highlight(parm1)
	if ( type(parm1) == "string" ) then
		local key = getglobal("AlphaMapAlphaMapButton"..parm1);
		for i=1, iNote, 1 do
			local note = getglobal("AlphaMapAlphaMapNote"..i);
			if ( ( note.control ) and ( note.control == key ) ) then
				AM_HighlightNote(i);
			end
		end
	elseif ( type(parm1) == "number" ) then
		AM_HighlightNote(parm1);
	end
end

function AM_HighlightNote(id)
	local index = tostring(id);
	if ( not amH[index] ) then
		amH[index] = "Fixed";
	elseif ( amH[index] == "Fixed" ) then
		amH[index] = nil;
		getglobal("AlphaMapAlphaMapNote"..id.."Highlight"):Hide();
	else
		amH[index] = "Fixed";
	end
end

function AM_ClearHighlights()
	for i=1, iNote, 1 do
		getglobal("AlphaMapAlphaMapNote"..i.."Highlight"):Hide();
		local amIndex = tostring(i);
		if ( amH[amIndex] ) then
			amH[amIndex] = nil;
		end
	end
end



function AM_SendNuNNote(mode)
	local bttn;
	local tmpThis = this;

	if ( NuNFrame:IsVisible() ) then
		HideUIPanel(NuNFrame);
	end
	if ( NuNGNoteFrame:IsVisible() ) then
		HideUIPanel(NuNGNoteFrame);
	end
	NuNGNoteFrame.fromQuest = nil;
	NuN_ShowSavedGNote();
	UIDropDownMenu_ClearAll(NuNChatDropDown);
	UIDropDownMenu_Initialize(NuNChatDropDown, NuNChatDropDown_Initialise);
	UIDropDownMenu_SetWidth(110, NuNChatDropDown);

	if ( ( AlphaMapConfig.NuNSendTo == "Default" ) and ( UnitInRaid("player") ) ) then
		bttn = AM_GetCommandID(NUN_TRANSMITTO, "RAID");
	elseif ( ( GetNumPartyMembers() > 0 ) and ( AlphaMapConfig.NuNSendTo ~= "Guild" ) ) then
		bttn = AM_GetCommandID(NUN_TRANSMITTO, "PARTY");
	elseif ( AlphaMapConfig.NuNSendTo == "Guild" ) then
		bttn = AM_GetCommandID(NUN_TRANSMITTO, "GUILD");
	else
		bttn = AM_GetCommandID(NUN_TRANSMITTO, "SAY");
		mode = "Manual";
	end

	this = getglobal("DropDownList1Button"..bttn);
	this.func();

	if ( AlphaMapConfig.NuNFormatted ) then
		NuN_ChatFormatCheckBox:SetChecked(1);
	else
		NuN_ChatFormatCheckBox:SetChecked(0);
	end

	NuN_OpenChat("General");

	if ( mode == "Auto" ) then
		NuN_Transmit();
		HideUIPanel(NuNGNoteFrame);
	end

	this = tmpThis;

	return;
end

function AM_OpenNuNNote(note)
	NuN_CmdLine("-g", note);
end


function AM_GetCommandID(tab, val)
	for i = 1, getn(tab), 1 do
		if ( tab[i].Command == val ) then
			return i, tab[i].Display;
		end
	end
	return nil;
end


function AM_HidePopup()
	AMPopup:Hide();
end



function AM_Showing()
	SetMapToCurrentZone();
	if ( not AlphaMapConfig.mute ) then
		PlaySound("igQuestLogOpen");
	end
	AlphaMapFrame_PingPlayerPosition();
	if ( ( AlphaMapConfig.ddP ) and ( AlphaMapConfig.ddP == AM_OptionsDDMapIt:GetID() ) ) then
		AlphaMapPlaceDDs();
	end
	AM_CheckTheScale();
end

function AM_Hiding()
	if ( not AlphaMapConfig.mute ) then
		PlaySound("igQuestLogClose");
	end
	if( AlphaMapFrame.UserHidden == false and AlphaMapConfig.wmclose ) then
		HideUIPanel( this );
	else
		AlphaMapFrame.UserHidden = false;
	end
end


function AM_NotifyBasesRequiredChange(numBases)
	local basesText  = AM_BG_BASES;
	local textColour = { r=0.9, g=0.8, b=0.0 };		-- yellow/gold

	if ( numBases == 1 ) then
		basesText = AM_BG_BASE;
	end

	if ( numBases < 3 ) then
		textColour = { r=0.0, g=1.0, b=0.0 };		-- green :)
	elseif ( numBases > 3 ) then
		textColour = { r=1.0, g=0.0, b=0.0 };		-- red :'(
	end

	local msgText = numBases.." "..basesText.." "..AM_BG_REQUIRED;

	if ( numBases > 4 ) then
		basesText = string.upper(msgText);
	end

	if DEFAULT_CHAT_FRAME then
		DEFAULT_CHAT_FRAME:AddMessage(msgText, textColour.r, textColour.g, textColour.b);
	end

	if ( SCT_Display_Message ) then
		SCT_Display_Message(msgText, textColour);
	end

end


function AM_BuildMap(mapData, mFrame)
	local xi = 1;
	local bT = mFrame:GetName().."_T";
	local mZoom = amAlphaMapMap.minimapZoom;
	local xOffset = 0;
	local yOffset = 0;

	if ( amAlphaMapMap.minimapXOffset ) then
		xOffset = amAlphaMapMap.minimapXOffset;
	end

	if ( amAlphaMapMap.minimapYOffset ) then
		yOffset = amAlphaMapMap.minimapYOffset;
	end

	if ( not mZoom ) then
		mZoom = 1;
	end

	while ( mapData[xi] ) do
		local yi = 1;

		while ( mapData[xi][yi] ) do
			local mapTexture = getglobal(bT..(xi)..(yi));
			if ( not mapTexture ) then
				mFrame:CreateTexture( bT..(xi)..(yi), "ARTWORK" );
				mapTexture = getglobal(bT..(xi)..(yi));
			end

			local anchorPoint, anchorTo;

			if ( ( xi == 1 ) and ( yi == 1 ) ) then
				anchorPoint = "TOPLEFT";
				anchorTo = mFrame;
			elseif ( yi == 1 ) then
				anchorPoint = "TOPRIGHT";
				anchorTo = getglobal(bT..(xi-1)..(yi));
			else
				anchorPoint = "BOTTOMLEFT";
				anchorTo = getglobal(bT..(xi)..(yi-1));
			end

			local tWidth  = mapData[xi][yi].width * ( mapData[xi][yi].texcoordinates[2] - mapData[xi][yi].texcoordinates[1] ) * mZoom;
			local tHeight = mapData[xi][yi].height * ( mapData[xi][yi].texcoordinates[4] - mapData[xi][yi].texcoordinates[3] ) * mZoom;

			mapTexture:SetWidth(tWidth);
			mapTexture:SetHeight(tHeight);
			mapTexture:SetTexture( texturePath..mapData[xi][yi].filename );
			mapTexture:SetTexCoord(mapData[xi][yi].texcoordinates[1], mapData[xi][yi].texcoordinates[2], mapData[xi][yi].texcoordinates[3], mapData[xi][yi].texcoordinates[4]);
			mapTexture:ClearAllPoints();
			mapTexture:SetPoint("TOPLEFT", anchorTo, anchorPoint, xOffset, yOffset);
			mapTexture:Show();

			xOffset = 0;
			yOffset = 0;
			yi = yi + 1;
		end
		xi = xi + 1;
	end

end


function AM_CloseLoot_OnClick()
	if ( AtlasLootItemsFrame ) then
		local location = AtlasLootItemsFrame:GetParent();
		if ( location == AtlasFrame ) then
			AtlasLoot_ShowBossLoot();
		elseif ( AtlasLootItemsFrame.externalBoss ) then
			AtlasLoot_ShowBossLoot(AtlasLootItemsFrame.externalBoss);
		else
			AtlasLootItemsFrame:Hide();
		end
	end
end

function AM_CloseLoot_OnShow()
	local pere = AM_CloseLoot:GetParent();
	if ( pere ) then
		AM_CloseLoot:SetFrameLevel( pere:GetFrameLevel() + 2 );
	end
end

function AM_PauseButtonOnClick(mBttn)
	if ( updatingPaused ) then
		updatingPaused = nil;
		AM_DDPauseButtonTexture:SetTexture("Interface\\AddOns\\AlphaMap\\Artwork\\Pause");
		AM_DDPauseButton:UnlockHighlight();
		if ( updateRequested ) then
			AlphaMapFrame_Update();
		end
	else
		updatingPaused = true;
		AM_DDPauseButtonTexture:SetTexture("Interface\\AddOns\\AlphaMap\\Artwork\\Play");
		AM_DDPauseButton:LockHighlight();
	end
end



function AM_CycleWMMode()
	if ( AlphaMapConfig.wmMode == AM_OPTIONS_WMAP_SMODE ) then
		AlphaMapConfig.wmMode = AM_OPTIONS_WMAP_OMODE;
	elseif ( AlphaMapConfig.wmMode == AM_OPTIONS_WMAP_OMODE ) then
		AlphaMapConfig.wmMode =  AM_OPTIONS_WMAP_SMODE;
	end

	AM_SaveConfig();

	if ( AlphaMapDetailFrame:IsVisible() ) then
		AlphaMapFrame_Update();
	end
end



function AM_EnableEscapeMode()
	local entry = AM_GetTabID(UISpecialFrames, "AlphaMapFrame");

	if ( not entry ) then
		table.insert(UISpecialFrames, "AlphaMapFrame");
	end
end

function AM_DisableEscapeMode()
	local entry = AM_GetTabID(UISpecialFrames, "AlphaMapFrame");

	if ( entry ) then
		table.remove(UISpecialFrames, entry);
	end
end



function AM_GetTabID(tab, ent)
	for i=1, getn(tab), 1 do
		if ( tab[i] == ent ) then
			return i;
		end
	end

	return nil;
end



function AlphaMapButton_OnClick(mouseButton, button)
	CloseDropDownMenus();
	if ( AlphaMapAlphaMapFrame:IsVisible() ) then

	else
		AM_WorldMapSelected = true;
		AM_ManualMapChange = true;
		if ( mouseButton == "LeftButton" ) then
			if ( not button ) then
				button = this;
			end
			local x, y = GetCursorPosition();
			x = x / button:GetEffectiveScale();
			y = y / button:GetEffectiveScale();

			local centerX, centerY = button:GetCenter();
			local width = button:GetWidth();
			local height = button:GetHeight();
			local adjustedY = (centerY + (height/2) - y) / height;
			local adjustedX = (x - (centerX - (width/2))) / width;
			ProcessMapClick( adjustedX, adjustedY);
		else
			WorldMapZoomOutButton_OnClick();
		end
	end
end


function AM_Main_OnUpdate(arg1)
	if ( AlphaMapConfig.Mouse == true ) then
		if ( IsControlKeyDown() ) then
			if ( not AlphaMapButton:IsVisible() ) then
				AlphaMapButton:Show();
				AlphaMapSliderMovementFrame:Show();
				for i=1, NUM_ALPHAMAP_POIS, 1 do
					local POI = getglobal("AlphaMapPOI"..i);
					if ( ( POI ) and ( POI:IsVisible() ) ) then
						local bttn = getglobal("AlphaMapPOI"..i.."Button");
						if ( bttn ) then
							bttn:Show();
						end
					else
						break;
					end
				end
			end
		else
			if ( AlphaMapButton:IsVisible() ) then
				AlphaMapButton:Hide();
				AlphaMapSliderMovementFrame:Hide();
				for i=1, NUM_ALPHAMAP_POIS, 1 do
					local bttn = getglobal("AlphaMapPOI"..i.."Button");
					if ( ( bttn ) and ( bttn:IsVisible() ) ) then
						bttn:Hide();
					else
						break;
					end
				end
			end
		end
	end
end


function AM_POI_OnEnter()
	local pere = this:GetParent();
	AlphaMapFrame.poiHighlight = 1;
	if ( pere.description and strlen(pere.description) > 0 ) then
		AlphaMapFrameAreaLabel:SetText(pere.name);
		AlphaMapFrameAreaDescription:SetText(pere.description);
	else
		AlphaMapFrameAreaLabel:SetText(pere.name);
		AlphaMapFrameAreaDescription:SetText("");
	end
end

function AM_POI_OnLeave()
	AlphaMapFrame.poiHighlight = nil;
	AlphaMapFrameAreaLabel:SetText(AlphaMapFrame.areaName);
	AlphaMapFrameAreaDescription:SetText("");
end

function AM_POI_OnClick()
	AlphaMapButton_OnClick(arg1, AlphaMapButton);
end

function AlphaMapButton_OnUpdate(elapsed)
	if ( ( amMapType == AM_TYP_WM ) and ( MouseIsOver(AlphaMapFrame) ) ) then
		local x, y = GetCursorPosition();
		x = x / this:GetEffectiveScale();
		y = y / this:GetEffectiveScale();

		local centerX, centerY = this:GetCenter();
		local width = this:GetWidth();
		local height = this:GetHeight();
		local adjustedX = (x - (centerX - (width/2))) / width;
		local adjustedY = (centerY + (height/2) - y ) / height;
		local name, fileName, texPercentageX, texPercentageY, textureX, textureY, scrollChildX, scrollChildY = UpdateMapHighlight( adjustedX, adjustedY );

		AlphaMapFrame.areaName = name;
		if ( not AlphaMapFrame.poiHighlight ) then
			AlphaMapFrameAreaLabel:SetText(name);
		end
		if ( fileName ) then
			AlphaMapHighlight:SetTexCoord(0, texPercentageX, 0, texPercentageY);
			AlphaMapHighlight:SetTexture("Interface\\WorldMap\\"..fileName.."\\"..fileName.."Highlight");
			textureX = textureX * width;
			textureY = textureY * height;
			scrollChildX = scrollChildX * width;
			scrollChildY = -scrollChildY * height;
			if ( (textureX > 0) and (textureY > 0) ) then
				AlphaMapHighlight:SetWidth(textureX);
				AlphaMapHighlight:SetHeight(textureY);
				AlphaMapHighlight:SetPoint("TOPLEFT", "AlphaMapDetailFrame", "TOPLEFT", scrollChildX, scrollChildY);
				AlphaMapHighlight:Show();
			end

		else
			AlphaMapHighlight:Hide();
		end
	end
end

function AlphaMapButton_OnHide()
	AlphaMapFrame.poiHighlight = nil;
	AlphaMapFrameAreaLabel:SetText("");
	AlphaMapFrameAreaDescription:SetText("");
	AlphaMapHighlight:Hide();
end


function AM_RememberSliderPos()
	AlphaMapSliderFrame.Adopt = nil;
	if ( MouseIsOver(AlphaMapFrame) ) then
		local x, y = GetCursorPosition();
		x = x / (AlphaMapFrame:GetEffectiveScale());
		y = y / (AlphaMapFrame:GetEffectiveScale());

		local centerX, centerY = AlphaMapFrame:GetCenter();
		local width = AlphaMapFrame:GetWidth();
		local height = AlphaMapFrame:GetHeight();
		local adjustedX = (x - (centerX - (width/2))) / width;
		local adjustedY = (centerY + (height/2) - y ) / height;
		AlphaMapConfig.sliderLocX = math.floor( width*adjustedX );
		AlphaMapConfig.sliderLocY = math.floor( height - (height*adjustedY) );
		AlphaMapSliderFrame.Adopt = true;
	else
		AlphaMapConfig.sliderLocX = AM_DefaultSliderX;
		AlphaMapConfig.sliderLocY = AM_DefaultSliderY;
	end
	AM_SaveConfig();
end

function AM_SetSliderPos()
	local x, y = AlphaMapConfig.sliderLocX, AlphaMapConfig.sliderLocY;

	AlphaMapSliderFrame:ClearAllPoints();
	AlphaMapSliderFrame:SetUserPlaced(0);
	AlphaMapSliderFrame:SetParent(AlphaMapFrame);
	AlphaMapSliderFrame:SetPoint("CENTER", "AlphaMapFrame", "BOTTOMLEFT", x, y);
	AlphaMapSliderFrame:SetFrameLevel( AlphaMapFrame:GetFrameLevel() + 3);
	AlphaMapSliderFrame:Show();
	if ( not AlphaMapConfig.slider ) then
		AlphaMapSliderFrame:Hide();
	end
end



function AM_ValidateMaps()
	AM_ValidMaps = {};
	AM_ValidTypes = {};

	for index, value in AM_ALPHAMAP_LIST do
		local map = AM_ALPHAMAP_LIST[index].filename;
		local typ = AM_ALPHAMAP_LIST[index].type;
		if ( AM_Minimap_Data[map] ) then
			AM_ValidMaps[map] = true;
		else
			AlphaMapAlphaMapTexture:SetTexture("");
			AlphaMapAlphaMapTexture:SetTexture("Interface\\AddOns\\AlphaMap\\Maps\\"..map);
			local texture = AlphaMapAlphaMapTexture:GetTexture();
			if ( texture ) then
				AM_ValidMaps[map] = true;
			end
		end
		if ( ( AM_ValidMaps[map] ) and ( not AM_ValidTypes[typ] ) ) then
			AM_ValidTypes[typ] = true;
		end
	end
end


function AM_SetupGameMap(showMap)
	UIPanelWindows["WorldMapFrame"] = { area="center", pushable=0 };
	WorldMapFrame:SetFrameStrata("LOW");
	WorldMapFrame:SetMovable(true);
	WorldMapFrame:SetResizable(true);
	WorldMapFrame:SetAlpha(AlphaMapConfigurations.gm.alpha);
	WorldMapFrame:SetScale(AlphaMapConfigurations.gm.scale);
	AM_WorldMapMovementFrame:Show();
	WorldMapFrame:SetScript("OnKeyDown", nil);
	WorldMapFrame:StartMoving();
	WorldMapFrame.isMoving = true;
	WorldMapFrame:StopMovingOrSizing();
	WorldMapFrame.isMoving = false;
	WorldMapFrame:ClearAllPoints();
	WorldMapFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0);
	if ( ( not WorldMapFrame:IsVisible() ) and ( showMap ) ) then
		ToggleWorldMap();
		AM_OptionsFrame:Show();
	end
end

function AM_ResetGameMap()
	ReloadUI();
end

function AM_WorldMapMovementFrame_OnShow()

end

function AM_WorldMapMovementFrame_OnHide()

end

function AM_DisableStandardOptions()
	AM_OptionsNuNFormatted:Disable();
	AM_OptionsNuNDefault:Disable();
	AM_OptionsNuNParty:Disable();
	AM_OptionsNuNGuild:Disable();
	AM_OptionsWM_Standard:Disable();
	AM_OptionsWM_Overlay:Disable();
	AM_OptionsWM_Minimap:Disable();
	AM_OptionsWM_ZMinimap:Disable();
	AM_OptionsWM_Escape:Disable();
	AM_OptionsWM_Mouse:Disable();
	AM_Options_Mute:Disable();
	AM_ButtonAngle:Hide();
	AM_ButtonRadius:Hide();
	AlphaMap_OptionsTabFrameTab1:Disable();
	AlphaMap_OptionsTabFrameTab2:Disable();
	AlphaMap_OptionsTabFrameTab3:Disable();
	AlphaMap_OptionsTabFrameTab4:Disable();
end

function AM_EnableStandardOptions()
	AM_OptionsNuNFormatted:Enable();
	AM_OptionsNuNDefault:Enable();
	AM_OptionsNuNParty:Enable();
	AM_OptionsNuNGuild:Enable();
	AM_OptionsWM_Standard:Enable();
	AM_OptionsWM_Overlay:Enable();
	AM_OptionsWM_Minimap:Enable();
	AM_OptionsWM_ZMinimap:Enable();
	AM_OptionsWM_Escape:Enable();
	AM_OptionsWM_Mouse:Enable();
	AM_Options_Mute:Enable();
	AM_ButtonAngle:Show();
	AM_ButtonRadius:Show();
	AlphaMap_OptionsTabFrameTab1:Enable();
	AlphaMap_OptionsTabFrameTab2:Enable();
	AlphaMap_OptionsTabFrameTab3:Enable();
	AlphaMap_OptionsTabFrameTab4:Enable();
end


function AM_MapNotesNewMenuFrame_ControlOnShow()
	if ( AlphaMapConfig.gmap ) then
		local adjustedX, adjustedY = AM_GetAdjustedMapXY();
		if ( ( adjustedX ) and ( adjustedY ) ) then
			MapNotesNewMenuFrame:ClearAllPoints();
			MapNotesNewMenuFrame:SetPoint("CENTER", "WorldMapButton", "TOPLEFT", adjustedX, adjustedY);
		end
	end
end

function AM_MapNotesPOIMenuFrame_ControlOnShow()
	if ( AlphaMapConfig.gmap ) then
		local adjustedX, adjustedY = AM_GetAdjustedMapXY();
		if ( ( adjustedX ) and ( adjustedY ) ) then
			MapNotesPOIMenuFrame:ClearAllPoints();
			MapNotesPOIMenuFrame:SetPoint("CENTER", "WorldMapButton", "TOPLEFT", adjustedX, adjustedY);
			AM_MapNotesSpecialActionMenuFrame_Control.x = adjustedX;
			AM_MapNotesSpecialActionMenuFrame_Control.y = adjustedY;
		else
			AM_MapNotesSpecialActionMenuFrame_Control.x = nil;
			AM_MapNotesSpecialActionMenuFrame_Control.y = nil;
		end
	end
end

function AM_MapNotesSpecialActionMenuFrame_ControlOnShow()
	if ( ( AlphaMapConfig.gmap ) and ( AM_MapNotesSpecialActionMenuFrame_Control.x ) and ( AM_MapNotesSpecialActionMenuFrame_Control.y ) ) then
		MapNotesSpecialActionMenuFrame:ClearAllPoints();
		MapNotesSpecialActionMenuFrame:SetPoint("CENTER", "WorldMapButton", "TOPLEFT", AM_MapNotesSpecialActionMenuFrame_Control.x, AM_MapNotesSpecialActionMenuFrame_Control.y);
	end
end

function AM_GetAdjustedMapXY()
	local x, y = GetCursorPosition();
	x = x / (WorldMapButton:GetEffectiveScale());
	y = y / (WorldMapButton:GetEffectiveScale());
	local centerX, centerY = WorldMapButton:GetCenter();
	local width = WorldMapButton:GetWidth();
	local height = WorldMapButton:GetHeight();
	local adjustedX = (x - (centerX - (width/2))) / width;
	local adjustedY = (centerY + (height/2) - y ) / height;

	local xOff, yOff;
	if ( adjustedX < 0.5 ) then
		xOff = 125;
	else
		xOff = -125;
	end
	if ( adjustedY < 0.5 ) then
		yOff = -60;
	else
		yOff = 60;
	end

	adjustedX = math.floor( width*adjustedX ) + xOff;
	adjustedY = -(height - math.floor( height - (height*adjustedY))) + yOff;

	return adjustedX, adjustedY;
end


function AM_AtlasLootSetMenu()
	for i = 1, 30, 1 do
		getglobal("AtlasLootItem_"..i):Hide();
	end
	AtlasLootItemsFrame_BACK:Hide();
	AtlasLootItemsFrame_Druid:Hide();
	AtlasLootItemsFrame_Hunter:Hide();
	AtlasLootItemsFrame_Mage:Hide();
	AtlasLootItemsFrame_Paladin:Hide();
	AtlasLootItemsFrame_Priest:Hide();
	AtlasLootItemsFrame_Rogue:Hide();
	AtlasLootItemsFrame_Shaman:Hide();
	AtlasLootItemsFrame_Warlock:Hide();
	AtlasLootItemsFrame_Warrior:Hide();
	AtlasLootItemsFrame_Weapons:Hide();
	AtlasLootItemsFrame_NEXT:Hide();
	AtlasLootItemsFrame_PREV:Hide();
	AtlasLoot_BossName:SetText("|cffFFFFFF"..ATLASLOOT_PANEL_BUTTON_SETS);
 	if ( AlphaMapAlphaMapFrame:IsVisible() ) then
 		AtlasLoot_AnchorFrame = AM_AM_LOOT_POINT;
 	else
 		AtlasLoot_AnchorFrame = AM_UI_LOOT_POINT;
 	end
	AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
	AtlasLoot_Tier0Button:Show();
	AtlasLoot_Tier0Button:SetFrameLevel(AtlasLootItemsFrame:GetFrameLevel() + 1);
	AtlasLoot_Tier1Button:Show();
	AtlasLoot_Tier1Button:SetFrameLevel(AtlasLootItemsFrame:GetFrameLevel() + 1);
	AtlasLoot_Tier2Button:Show();
	AtlasLoot_Tier2Button:SetFrameLevel(AtlasLootItemsFrame:GetFrameLevel() + 1);
	AtlasLoot_Tier3Button:Show();
	AtlasLoot_Tier3Button:SetFrameLevel(AtlasLootItemsFrame:GetFrameLevel() + 1);
	AtlasLoot_ZGButton:Show();
	AtlasLoot_ZGButton:SetFrameLevel(AtlasLootItemsFrame:GetFrameLevel() + 1);
	AtlasLoot_AQ20Button:Show();
	AtlasLoot_AQ20Button:SetFrameLevel(AtlasLootItemsFrame:GetFrameLevel() + 1);
	AtlasLoot_AQ40Button:Show();
	AtlasLoot_AQ40Button:SetFrameLevel(AtlasLootItemsFrame:GetFrameLevel() + 1);
 	AtlasLoot_PVPButton:Show();
 	AtlasLoot_PVPButton:SetFrameLevel(AtlasLootItemsFrame:GetFrameLevel() + 1);
end


-------------------------------------------------------------------------------
-- Hooked functions
-------------------------------------------------------------------------------

function amNew_Gatherer_ChangeMap()
	local tmpF = WorldMapFrame.IsVisible;
	local px, py = GetPlayerMapPosition("player");

	if ( ( AlphaMapFrame:IsVisible() ) and ( px == 0 ) and ( py == 0 ) ) then
		WorldMapFrame.IsVisible = amDummyTrue;
	end

	amOri_Gatherer_ChangeMap();
	WorldMapFrame.IsVisible = tmpF;
end

function amDummyTrue()
	return true;
end


function amNew_NuNGNote_WriteNote()
	amOri_NuNGNote_WriteNote();
	if ( amAlphaMapMap ) then
		AM_Notes(amAlphaMapMap);
	end
	amOri_NuNGNote_WriteNote();		-- second call required to reset NuN global variable c_note to the note name
end

function amNew_NuNGNote_Delete(param1)
	amOri_NuNGNote_Delete(param1);
	if ( amAlphaMapMap ) then
		AM_Notes(amAlphaMapMap);
	end
end


function amNew_GuildMap_IsWorldMapOpen()
	if ( ( updatingPaused ) and ( AlphaMapFrame:IsVisible() ) ) then
		return true;
	else
		return amOri_GuildMap_IsWorldMapOpen();
	end
end


function amNew_ToggleWorldMap()
	if ( ( AlphaMapFrame:IsVisible() ) and ( not WorldMapFrame:IsVisible() ) ) then
		amWorldMapOpenStatus = true;
	end

	if ( WorldMapFrame:IsVisible() ) then
		if ( AM_OptionsFrame:IsVisible() ) and ( AM_OptionsGM_Change:GetChecked() ) then
			AM_OptionsFrame:Hide();
		end
		AM_OptionsGM_Change:SetChecked(0);
		AM_ChangingOriWorldMap = false;
	end

	amOri_ToggleWorldMap();

	if ( ( not WorldMapFrame:IsVisible() ) and ( amWorldMapOpenStatus == true ) ) then
		amWorldMapOpenStatus = false;
		if ( ( AlphaMapConfig.Escape == true ) and ( AlphaMapConfig.wmclose == false ) ) then
			ShowUIPanel( AlphaMapFrame );
		end
	end

	if ( AlphaMapConfig.gmap ) then
		WorldMapFrame:SetScale(AlphaMapConfigurations.gm.scale);
		WorldMapFrame:SetAlpha(AlphaMapConfigurations.gm.alpha);
		BlackoutWorld:Hide();
		WorldMapTooltip:SetFrameLevel( WorldMapFrame:GetFrameLevel() + 2 );
	end

	if ( ( MapNotesLines_1 ) and ( MapNotesLines_1:IsVisible() ) ) then
		local texture = MapNotesLines_1:GetTexture();
		if ( texture == "Solid Texture" ) then
			MapNotesLines_1:Hide();
		end
	end
end


-------------------------------------------------------------------------------
-- Temporary Hooks
-------------------------------------------------------------------------------

function amNew_AtlasLootSetButton_OnClick(dataSet)
	amOri_AtlasLootSetButton_OnClick(dataSet);
	AtlasLoot_ShowItemsFrame(dataSet, AtlasLootItems, "Sets", AtlasLoot_AnchorFrame);
end

-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------