--------------------------------------------------------------------------
-- localization.lua
--------------------------------------------------------------------------

SLASH_ALPHAMAPSLASH1 = "/AlphaMap";
SLASH_ALPHAMAPSLASH2 = "/am";

AM_SLASH_LOAD_HELP_USAGE    = "Alpha Map"
ALPHA_MAP_VERSION 			= "1.60.11000";

BINDING_HEADER_ALPHAMAP        = "AlphaMap Key Bindings";
BINDING_NAME_TOGGLEALPHAMAP    = "Toggle AlphaMap";
BINDING_NAME_INCREMENTALPHAMAP = "Increase AlphaMap Opacity";
BINDING_NAME_DECREMENTALPHAMAP = "Decrease AlphaMap Opacity";

--Colored State values
ALPHA_MAP_GREEN_ENABLED = "|c0000FF00Enabled|r";
ALPHA_MAP_RED_DISABLED = "|c00FF0000Disabled|r";

--Slash Help
AM_SLASH_HELP_USAGE         = "AlphaMap Usage: /alphamap or /am:";
AM_SLASH_HELP_ENABLE        = "/am enable - enable / re-enable AlphaMap";
AM_SLASH_HELP_DISABLE       = "/am disable - disable AlphaMap";
AM_SLASH_HELP_RESET         = "/am reset - reset AlphaMap options to default.";
AM_SLASH_HELP_RAID          = "/am raid - show Raid Pins";
AM_SLASH_HELP_PTIPS         = "/am ptips - show party tooltips";
AM_SLASH_HELP_MNTIPS        = "/am mntips - show MapNotes tips";
AM_SLASH_HELP_GTIPS         = "/am gtips - show Gatherer tips";
AM_SLASH_HELP_MNGTIPS       = "/am mngtips - show MapNotes Gathering tips";
AM_SLASH_HELP_MOVESLIDER    = "/am moveslider - toggle movement of the slider";
AM_SLASH_HELP_SLIDER        = "/am slider - toggle display of slider";
AM_SLASH_HELP_GATHERER      = "/am gatherer - toggle support for Gatherer";
AM_SLASH_HELP_MAPNOTES      = "/am mapnotes - toggle support for MapNotes";
AM_SLASH_HELP_GATHERING     = "/am gathering - toggle support for MapNotes Gathering";
AM_SLASH_HELP_AUTOCLOSE     = "/am combat - toggle Autoclose on Combat";
AM_SLASH_HELP_AUTOOPEN	    = "/am reopen - toggle Re-Open after Combat";
AM_SLASH_HELP_WMCLOSE       = "/am wmclose - toggle Autoclose on WorldMap close";
AM_SLASH_HELP_LOCK          = "/am lock - toggle movement of the AlphaMap";
AM_SLASH_HELP_SCALE         = "/am scale |c0000AA00<value>|r - set the alphamap window scale (Range 0.0 - 1.0)";
AM_SLASH_HELP_TOG           = "|c00FF0000/am tog  - toggle display of alphamap|r";
AM_SLASH_HELP_ALPHA         = "/am alpha |c0000AA00<value>|r - set the transparency of alphamap (Range 0.0 - 1.0)";
AM_SLASH_HELP_MINIMAP	    = "/am minimap - toggle the display of the Minimap button";
AM_SLASH_HELP_HELP	    = "/am help  <OR>  /am ?  - lists the AlphaMap slash commands";

ALPHA_MAP_LOAD_CONFIRM = "|c0000BFFFAlphaMap |c0000FF00v."..ALPHA_MAP_VERSION.."|c0000BFFF is Loaded - Type "..SLASH_ALPHAMAPSLASH1.." or "..SLASH_ALPHAMAPSLASH2.." for options|r";

ALPHA_MAP_ENABLED = "|c0000BFFFAlphaMap is now "..ALPHA_MAP_GREEN_ENABLED;
ALPHA_MAP_DISABLED = "|c0000BFFFAlphaMap is now "..ALPHA_MAP_RED_DISABLED;

ALPHA_MAP_UI_LOCKED = "AlphaMap: User Interface |c00FF0000Locked|r.";
ALPHA_MAP_UI_UNLOCKED = "AlphaMap: User Interface |c0000FF00Unlocked|r.";
ALPHA_MAP_UI_LOCK_HELP = "If this option is checked, the AlphaMap will be locked into place and can't be moved.";

ALPHA_MAP_DISABLED_HINT = "Hint: AlphaMap is "..ALPHA_MAP_RED_DISABLED..".  Type |C0000AA00'/am Enable'|R to re-enable.";

ALPHA_MAP_CONFIG_SLIDER_STATE       = "AlphaMap: Slider Movement ";
ALPHA_MAP_CONFIG_COMBAT_STATE       = "AlphaMap: AutoClose on Combat ";
ALPHA_MAP_CONFIG_REOPEN_STATE	    = "AlphaMap: Re-Open after Combat ";
ALPHA_MAP_CONFIG_RAID_STATE         = "AlphaMap: Raid Pins ";
ALPHA_MAP_CONFIG_PTIPS_STATE        = "AlphaMap: Party/Raid ToolTips ";
ALPHA_MAP_CONFIG_MNTIPS_STATE       = "AlphaMap: MapNotes ToolTips ";
ALPHA_MAP_CONFIG_MNGTIPS_STATE      = "AlphaMap: MapNotes Gathering ToolTips ";
ALPHA_MAP_CONFIG_GTIPS_STATE        = "AlphaMap: Gatherer ToolTips ";
ALPHA_MAP_CONFIG_WMCLOSE_STATE      = "AlphaMap: Close on WorldMap Close ";
ALPHA_MAP_CONFIG_GATHERING_STATE    = "AlphaMap: MapNotes Gathering Support ";
ALPHA_MAP_CONFIG_GATHERER_STATE     = "AlphaMap: Gatherer Support ";
ALPHA_MAP_CONFIG_MAPNOTES_STATE     = "AlphaMap: MapNotes Support ";

ALPHA_MAP_MINIMAP_TOOLTIP	= "Alpha Map\nLeft Click 	   Toggles AlphaMap\nRight Click      Toggles Options";
AM_OPTIONS_TITLE		= "AlphaMap Options";
AM_OPTIONS_RESET		= "Reset";
AM_OPTIONS_CLOSE		= "Close";
AM_OPTIONS_MAPNOTES		= "Display Map Notes";
AM_OPTIONS_MAPNOTES_TOOLTIPS	= "Display Map Notes Tooltips";
AM_OPTIONS_MAPNOTESG		= "Display MapNotes Gathering Icons";
AM_OPTIONS_MAPNOTESG_TOOLTIPS 	= "Display MapNotes Gathering Tooltips";
AM_OPTIONS_GATHERER		= "Display Gatherer Icons";
AM_OPTIONS_GATHERER_TOOLTIPS	= "Display Gatherer Tooltips";
AM_OPTIONS_PARTY_TOOLTIPS	= "Display Group Tooltips";
AM_OPTIONS_RAID_PINS		= "Display Group Pins";
AM_OPTIONS_SLIDER		= "Display Alpha Slider on Map";
AM_OPTIONS_SLIDER_MOVE		= "Allow Movement of Alpha Slider";
AM_OPTIONS_AUTOCLOSE_COMBAT	= "Close Map when Combat starts";
AM_OPTIONS_AUTOOPEN_COMBAT	= "Re-Open Map after Combat ends";
AM_OPTIONS_AUTOCLOSE_WORLDMAP	= "Close Map when World Map closes";
AM_OPTIONS_ANGLESLIDER		= "Minimap Angle  : ";
AM_OPTIONS_RADIUSLIDER		= "Minimap Radius : ";
AM_OPTIONS_ALPHASLIDER		= "Map Opacity : ";
AM_OPTIONS_SCALESLIDER		= " Map Scale  : ";
AM_OPTIONS_MAP_LOCK		= "Lock AlphaMap Position";
AM_OPTIONS_MINIMAP		= "Display Minimap Button";









