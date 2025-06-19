--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005, 2006 Dan Gilbert
	Email me at loglow@gmail.com

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]

--Atlas, an instance map browser
-- Compiled by Bennylava
-- Bennylavaed@gmail.com
-- Last Update: 08/03/2013


ATLAS_VERSION = "1.1 |Emerald Dream|r";

local Atlas_Vars_Loaded = nil;
ATLAS_DROPDOWN_LIST_EK = {};
ATLAS_DROPDOWN_LIST_KA = {};
ATLAS_DROPDOWN_LIST_BG = {};
ATLAS_DROPDOWN_LIST_FP = {};
ATLAS_DROPDOWN_LIST_DL = {};
ATLAS_DROPDOWN_LIST_RE = {};
ATLAS_DROPDOWN_LIST_INTRO = {};
ATLAS_DROPDOWN_LIST_TLVL = {};
ATLAS_DROPDOWN_LIST_ULVL = {};
ATLAS_DROPDOWN_LIST_LVL = {};
ATLAS_DROPDOWN_LIST_LV = {};
ATLAS_DROPDOWN_LIST_LVE = {};
ATLAS_DROPDOWN_LIST_LVV = {};
ATLAS_DROPDOWN_LIST_LVX = {};
ATLAS_DROPDOWN_LIST_LVY = {};
ATLAS_DROPDOWN_LIST_LVZ = {};

local DefaultAtlasOptions = {
	["AtlasVersion"] = ATLAS_VERSION;
	["AtlasZone"] = 1;
	["AtlasAlpha"] = 1.0;
	["AtlasLocked"] = false;
	["AtlasMapName"] = true;
	["AtlasAutoSelect"] = false;
	["AtlasButtonPosition"] = 15;
	["AtlasButtonRadius"] = 78;
	["AtlasButtonShown"] = true;
	["AtlasReplaceWorldMap"] = false;
	["AtlasRightClick"] = false;
	["AtlasType"] = 1;
	["AtlasAcronyms"] = true;
	["AtlasScale"] = 1.0;
	["AtlasClamped"] = true;
};

function Atlas_FreshOptions()
	AtlasOptions = CloneTable(DefaultAtlasOptions);
end

--Code by Grayhoof (SCT)
function CloneTable(t)				-- return a copy of the table t
	local new = {};					-- create a new table
	local i, v = next(t, nil);		-- i is an index of t, v = t[i]
	while i do
		if type(v)=="table" then 
			v=CloneTable(v);
		end 
		new[i] = v;
		i, v = next(t, i);			-- get next index
	end
	return new;
end

--Called when the Atlas frame is first loaded
--We CANNOT assume that data in other files is available yet!
function Atlas_OnLoad()

	--Register the Atlas frame for the following events
	this:RegisterEvent("ADDON_LOADED");
	this:RegisterEvent("VARIABLES_LOADED");

	--Allows Atlas to be closed with the Escape key
	tinsert(UISpecialFrames, "AtlasFrame");
	
	--Dragging involves some special registration
	AtlasFrame:RegisterForDrag("LeftButton");
	
	--Setting up slash commands involves referencing some strage auto-generated variables
	SLASH_ATLAS1 = ATLAS_SLASH;
	SlashCmdList["ATLAS"] = Atlas_SlashCommand;
end

--Removal of articles in map names (for proper alphabetic sorting)
--For example: "The Deadmines" will become "Deadmines"
--Thus it will be sorted under D and not under T
local function Atlas_SanitizeName(text)
   text = string.lower(text);
   if (AtlasSortIgnore) then
	   for _,v in pairs(AtlasSortIgnore) do
		   local match; 
           if ( string.gmatch ) then 
                match = string.gmatch(text, v)();
           else 
                match = string.gfind(text, v)(); 
           end
		   if (match) and ((string.len(text) - string.len(match)) <= 4) then
			   return match;
		   end
	   end
   end
   return text;
end

--Comparator function for alphabetic sorting of EK maps
local function Atlas_SortZonesAlphaEK(a, b)
	local aa = Atlas_SanitizeName(AtlasEK[a].ZoneName);
	local bb = Atlas_SanitizeName(AtlasEK[b].ZoneName);
	return aa < bb;
end

--Comparator function for alphabetic sorting of KA maps
local function Atlas_SortZonesAlphaKA(a, b)
	local aa = Atlas_SanitizeName(AtlasKalimdor[a].ZoneName);
	local bb = Atlas_SanitizeName(AtlasKalimdor[b].ZoneName);
	return aa < bb;
end


--Comparator function for alphabetic sorting of BG maps
local function Atlas_SortZonesAlphaBG(a, b)
	local aa = Atlas_SanitizeName(AtlasBG[a].ZoneName);
	local bb = Atlas_SanitizeName(AtlasBG[b].ZoneName);
	return aa < bb;
end

--Comparator function for alphabetic sorting of FP maps
local function Atlas_SortZonesAlphaFP(a, b)
	local aa = Atlas_SanitizeName(AtlasFP[a].ZoneName);
	local bb = Atlas_SanitizeName(AtlasFP[b].ZoneName);
	return aa < bb;
end

--Comparator function for alphabetic sorting of DL maps
local function Atlas_SortZonesAlphaDL(a, b)
	local aa = Atlas_SanitizeName(AtlasDL[a].ZoneName);
	local bb = Atlas_SanitizeName(AtlasDL[b].ZoneName);
	return aa < bb;
end

--Comparator function for alphabetic sorting of RE maps
local function Atlas_SortZonesAlphaRE(a, b)
	local aa = Atlas_SanitizeName(AtlasRE[a].ZoneName);
	local bb = Atlas_SanitizeName(AtlasRE[b].ZoneName);
	return aa < bb;
end





--These are the REAL level range values!
--Overrides the values that may be found in the localization files
function Atlas_UpdateLevelRanges()
	AtlasKalimdor.BlackfathomDeeps.LevelRange =		"24-32";
	AtlasKalimdor.WailingCaverns.LevelRange =		"17-24";
	AtlasKalimdor.DireMaulNorth.LevelRange =		"56-60";
	AtlasKalimdor.DireMaulEast.LevelRange =			"56-60";
	AtlasKalimdor.DireMaulWest.LevelRange =			"56-60";
	AtlasKalimdor.RazorfenDowns.LevelRange =		"37-46";
	AtlasKalimdor.RazorfenKraul.LevelRange =		"29-38";
	AtlasKalimdor.Maraudon.LevelRange =				"46-55";
	AtlasKalimdor.OnyxiasLair.LevelRange =			"60+";
	AtlasKalimdor.RagefireChasm.LevelRange =		"13-18";
	AtlasKalimdor.ZulFarrak.LevelRange =			"44-54";
	AtlasKalimdor.TheTempleofAhnQiraj.LevelRange =	"60+";
	AtlasKalimdor.TheRuinsofAhnQiraj.LevelRange =	"60+";

	AtlasEK.BlackrockSpireLower.LevelRange =		"55-60";
	AtlasEK.BlackrockSpireUpper.LevelRange =		"55-60";
	AtlasEK.BlackrockDepths.LevelRange =			"52-60";
	AtlasEK.ShadowfangKeep.LevelRange =				"22-30";
	AtlasEK.ScarletMonastery.LevelRange =			"34-45";
	AtlasEK.MoltenCore.LevelRange =					"60+";
	AtlasEK.TheSunkenTemple.LevelRange =			"50-60";
	AtlasEK.TheStockade.LevelRange =				"24-32";
	AtlasEK.TheDeadmines.LevelRange =				"17-26";
	AtlasEK.Gnomeregan.LevelRange =					"29-38";
	AtlasEK.BlackwingLair.LevelRange =				"60+";
	AtlasEK.Scholomance.LevelRange =				"58-60";
	AtlasEK.Stratholme.LevelRange =					"58-60";
	AtlasEK.Uldaman.LevelRange =					"41-51";
	AtlasEK.ZulGurub.LevelRange =					"60+";
	AtlasEK.Naxxramas.LevelRange =					"60+";
	
	AtlasBG.AlteracValleyNorth.LevelRange =			"51-60";
	AtlasBG.AlteracValleySouth.LevelRange =			"51-60";
	AtlasBG.ArathiBasin.LevelRange =				"20-60";
	AtlasBG.WarsongGulch.LevelRange =				"10-60";
	
	AtlasFP.FPAllianceEast.LevelRange =				"---";
	AtlasFP.FPAllianceWest.LevelRange =				"---";
	AtlasFP.FPHordeEast.LevelRange =				"---";
	AtlasFP.FPHordeWest.LevelRange =				"---";
	
	AtlasDL.DLEast.LevelRange =						"---";
	AtlasDL.DLWest.LevelRange =						"---";
	
	AtlasRE.Azuregos.LevelRange =					"60+";
	AtlasRE.FourDragons.LevelRange =				"60+";
	AtlasRE.Kazzak.LevelRange =						"60+";
	
	AtlasINTRO.INTRO.LevelRange =					"1-60";

	AtlasTLVL.tauren1.LevelRange =					"1-6";
	AtlasTLVL.tauren2.LevelRange =					"1-6(part2)";
	AtlasTLVL.tauren3.LevelRange =					"6-10";
	AtlasTLVL.tauren4.LevelRange =					"6-10(part2)";
	AtlasTLVL.tauren5.LevelRange =					"6-10(part3)";
	AtlasTLVL.tauren6.LevelRange =					"10-12";
	AtlasTLVL.tauren7.LevelRange =					"10-12(part2)";
	AtlasTLVL.tauren8.LevelRange =					"10-12(part3)";	
	
	AtlasULVL.undead1.LevelRange =					"1-6";	
	AtlasULVL.undead2.LevelRange =					"1-6(Part 2)";	
	AtlasULVL.undead3.LevelRange =					"6-10";		
	AtlasULVL.undead4.LevelRange =					"6-10(Part 2)";		
	AtlasULVL.undead5.LevelRange =					"6-10(Part 3)";		
	AtlasULVL.undead6.LevelRange =					"6-10(Part 4)";		
	AtlasULVL.undead7.LevelRange =					"10-12";
	AtlasULVL.undead8.LevelRange =					"10-12(Part 2)";
	AtlasULVL.undead9.LevelRange =					"10-12(Part 3)";	

    AtlasLVL.a1.LevelRange =					"1-5";
    AtlasLVL.a2.LevelRange =					"5-7";
    AtlasLVL.a3.LevelRange =					"7-9";
	AtlasLVL.a4.LevelRange =					"9-10";
	AtlasLVL.a5.LevelRange =					"10-11";
	AtlasLVL.a6.LevelRange =					"11-12";
	AtlasLVL.b1.LevelRange =					"12-13";
	AtlasLVL.b2.LevelRange =					"13-14";
	AtlasLVL.b3.LevelRange =					"14-14";
	AtlasLVL.b4.LevelRange =					"14-15";
	AtlasLVL.c1.LevelRange =					"15-16";
	AtlasLVL.d1.LevelRange =					"16-17";
	AtlasLVL.d2.LevelRange =					"17-17";
	AtlasLVL.d3.LevelRange =					"17-18";
	AtlasLVL.d4.LevelRange =					"18-19";
	AtlasLVL.d5.LevelRange =					"19-20";



	AtlasLV.e1.LevelRange =					"20-21";
	AtlasLV.e2.LevelRange =					"20-21";
	AtlasLV.e3.LevelRange =					"21-22";
	AtlasLV.e4.LevelRange =					"22-23";
	AtlasLV.e5.LevelRange =					"23-24";
	AtlasLV.e6.LevelRange =					"24-25";
	AtlasLV.e7.LevelRange =					"25-25";
	AtlasLV.e8.LevelRange =					"25-26";
	AtlasLV.e9.LevelRange =					"26-26";
	AtlasLV.f1.LevelRange =					"26-27";
	AtlasLV.f2.LevelRange =					"27-27";
	AtlasLV.f3.LevelRange =					"27-27";
	AtlasLV.f4.LevelRange =					"27-28";
	AtlasLV.f5.LevelRange =					"28-29";
	AtlasLV.f6.LevelRange =					"29-29";
	AtlasLV.f7.LevelRange =					"29-30";
	AtlasLV.f8.LevelRange =					"30-30";
	AtlasLV.f9.LevelRange =					"30-30";


	AtlasLVE.g1.LevelRange =					"30-31";	
	AtlasLVE.g2.LevelRange =					"31-32";
	AtlasLVE.g3.LevelRange =					"32-32";
	AtlasLVE.g4.LevelRange =					"32-33";	
	AtlasLVE.g5.LevelRange =					"33-33";	
	AtlasLVE.g6.LevelRange =					"33-34";	
	AtlasLVE.g7.LevelRange =					"34-34";	
	AtlasLVE.g8.LevelRange =					"34-35";	
	AtlasLVE.g9.LevelRange =					"35-35";	
	AtlasLVE.h1.LevelRange =					"35-36";	
	AtlasLVE.h2.LevelRange =					"36-37";		
	AtlasLVE.h3.LevelRange =					"36-37";		
	AtlasLVE.h4.LevelRange =					"37-37";		
	AtlasLVE.h5.LevelRange =					"37-37";		
	AtlasLVE.h6.LevelRange =					"37-38";		
	AtlasLVE.h7.LevelRange =					"38-38";		
	AtlasLVE.h8.LevelRange =					"38-39";
	AtlasLVE.h9.LevelRange =					"39-39";
	AtlasLVE.i1.LevelRange =					"39-40";
	
	AtlasLVV.i2.LevelRange =					"40-40";
	AtlasLVV.i3.LevelRange =					"40-41";	
	AtlasLVV.i4.LevelRange =					"41-41";	
	AtlasLVV.i5.LevelRange =					"41-42";
	AtlasLVV.i6.LevelRange =					"42-42";
	AtlasLVV.i7.LevelRange =					"42-42.5";
	AtlasLVV.i8.LevelRange =					"42.5-43";
	AtlasLVV.i9.LevelRange =					"43-43";
	AtlasLVV.j1.LevelRange =					"43-43";	
	AtlasLVV.j2.LevelRange =					"43-43.5";
	AtlasLVV.j3.LevelRange =					"43.5-44";	
	AtlasLVV.j4.LevelRange =					"44-44";	
	AtlasLVV.j5.LevelRange =					"44-45";
	AtlasLVV.j6.LevelRange =					"45-45";
	
	
	AtlasLVX.j7.LevelRange =					"45-46";
	AtlasLVX.j8.LevelRange =					"46-46";
	AtlasLVX.j9.LevelRange =					"46-46.5";
	AtlasLVX.k1.LevelRange =					"46.5-47";	
	AtlasLVX.k2.LevelRange =					"47-47";
	AtlasLVX.k3.LevelRange =					"47-47";	
	AtlasLVX.k4.LevelRange =					"47-47";	
	AtlasLVX.k5.LevelRange =					"47-47";
	AtlasLVX.k6.LevelRange =					"47-47.5";
	AtlasLVX.k7.LevelRange =					"47.5-48";
	AtlasLVX.k8.LevelRange =					"48-48";
	AtlasLVX.k9.LevelRange =					"48-48";	
	AtlasLVX.l1.LevelRange =					"48-48";
	AtlasLVX.l2.LevelRange =					"48-49";
	AtlasLVX.l3.LevelRange =					"48-49";	
	AtlasLVX.l4.LevelRange =					"49-50";	
	AtlasLVX.l5.LevelRange =					"49-50";
	AtlasLVX.l6.LevelRange =					"49-50";
	AtlasLVX.l7.LevelRange =					"50-50";
	AtlasLVX.l8.LevelRange =					"50-50";
	AtlasLVX.l9.LevelRange =					"50-50";	
	
	AtlasLVY.m1.LevelRange =					"50-51";	
	AtlasLVY.m2.LevelRange =					"50-51";
	AtlasLVY.m3.LevelRange =					"51-52";	
	AtlasLVY.m4.LevelRange =					"51-52";	
	AtlasLVY.m5.LevelRange =					"51-52";
	AtlasLVY.m6.LevelRange =					"51-52";
	AtlasLVY.m7.LevelRange =					"52-53";
	AtlasLVY.m8.LevelRange =					"53-54";
	AtlasLVY.m9.LevelRange =					"53-54";	
	AtlasLVY.n1.LevelRange =					"54-54";
	AtlasLVY.n2.LevelRange =					"54-55";
	AtlasLVY.n3.LevelRange =					"54-55";	
	AtlasLVY.n4.LevelRange =					"55-55";	
	AtlasLVY.n5.LevelRange =					"55-55";
	AtlasLVY.n6.LevelRange =					"55-55";
	AtlasLVY.n7.LevelRange =					"55-55";
	AtlasLVY.n8.LevelRange =					"55-55";

	AtlasLVZ.n9.LevelRange =					"55-56";	
	AtlasLVZ.o1.LevelRange =					"55-56";	
	AtlasLVZ.o2.LevelRange =					"56-57";
	AtlasLVZ.o3.LevelRange =					"56-57";	
	AtlasLVZ.o4.LevelRange =					"56-57";	
	AtlasLVZ.o5.LevelRange =					"57-58";
	AtlasLVZ.o6.LevelRange =					"57-58";
	AtlasLVZ.o7.LevelRange =					"57-58";
	AtlasLVZ.o8.LevelRange =					"57-58";
	AtlasLVZ.o9.LevelRange =					"58-60";	
	AtlasLVZ.p1.LevelRange =					"58-60";

	
end

--These are the REAL player limit values!
--Overrides the values that may be found in the localization files
function Atlas_UpdatePlayerLimits()
	AtlasKalimdor.BlackfathomDeeps.PlayerLimit =	"10";
	AtlasKalimdor.WailingCaverns.PlayerLimit =		"10";
	AtlasKalimdor.DireMaulNorth.PlayerLimit =		"5";
	AtlasKalimdor.DireMaulEast.PlayerLimit =		"5";
	AtlasKalimdor.DireMaulWest.PlayerLimit =		"5";
	AtlasKalimdor.RazorfenDowns.PlayerLimit =		"10";
	AtlasKalimdor.RazorfenKraul.PlayerLimit =		"10";
	AtlasKalimdor.Maraudon.PlayerLimit =			"10";
	AtlasKalimdor.OnyxiasLair.PlayerLimit =			"40";
	AtlasKalimdor.RagefireChasm.PlayerLimit =		"10";
	AtlasKalimdor.ZulFarrak.PlayerLimit =			"10";
	AtlasKalimdor.TheTempleofAhnQiraj.PlayerLimit =	"40";
	AtlasKalimdor.TheRuinsofAhnQiraj.PlayerLimit =	"20";
	
	AtlasEK.BlackrockSpireLower.PlayerLimit =		"10";
	AtlasEK.BlackrockSpireUpper.PlayerLimit =		"10";
	AtlasEK.BlackrockDepths.PlayerLimit =			"5";
	AtlasEK.ShadowfangKeep.PlayerLimit =			"10";
	AtlasEK.ScarletMonastery.PlayerLimit =			"10";
	AtlasEK.MoltenCore.PlayerLimit =				"40";
	AtlasEK.TheSunkenTemple.PlayerLimit =			"10";
	AtlasEK.TheStockade.PlayerLimit =				"10";
	AtlasEK.TheDeadmines.PlayerLimit =				"10";
	AtlasEK.BlackwingLair.PlayerLimit =				"40";
	AtlasEK.Scholomance.PlayerLimit =				"5";
	AtlasEK.Stratholme.PlayerLimit =				"5";
	AtlasEK.Uldaman.PlayerLimit =					"10";
	AtlasEK.ZulGurub.PlayerLimit =					"20";
	AtlasEK.Naxxramas.PlayerLimit =					"40";
	AtlasEK.Gnomeregan.PlayerLimit =				"10";
	
	AtlasBG.AlteracValleyNorth.PlayerLimit =		"40";
	AtlasBG.AlteracValleySouth.PlayerLimit =		"40";
	AtlasBG.ArathiBasin.PlayerLimit =				"15";
	AtlasBG.WarsongGulch.PlayerLimit =				"10";
	
	AtlasFP.FPAllianceEast.PlayerLimit =			"---";
	AtlasFP.FPAllianceWest.PlayerLimit =			"---";
	AtlasFP.FPHordeEast.PlayerLimit =				"---";
	AtlasFP.FPHordeWest.PlayerLimit =				"---";
	
	AtlasDL.DLEast.PlayerLimit =					"---";
	AtlasDL.DLWest.PlayerLimit =					"---";
	
	AtlasRE.Azuregos.PlayerLimit =					"40";
	AtlasRE.FourDragons.PlayerLimit =				"40";
	AtlasRE.Kazzak.PlayerLimit =					"40";
	
	AtlasINTRO.INTRO.PlayerLimit =					"";

	AtlasTLVL.tauren1.PlayerLimit =					"";	
	AtlasTLVL.tauren2.PlayerLimit =					"";		
	AtlasTLVL.tauren3.PlayerLimit =					"";		
	AtlasTLVL.tauren4.PlayerLimit =					"";		
	AtlasTLVL.tauren5.PlayerLimit =					"";		
	AtlasTLVL.tauren6.PlayerLimit =					"";		
	AtlasTLVL.tauren7.PlayerLimit =					"";		
	AtlasTLVL.tauren8.PlayerLimit =					"";	

	AtlasULVL.undead1.PlayerLimit =					"";		
	AtlasULVL.undead2.PlayerLimit =					"";			
	AtlasULVL.undead3.PlayerLimit =					"";		
	AtlasULVL.undead4.PlayerLimit =					"";		
	AtlasULVL.undead5.PlayerLimit =					"";		
	AtlasULVL.undead6.PlayerLimit =					"";	
	AtlasULVL.undead7.PlayerLimit =					"";		
	AtlasULVL.undead8.PlayerLimit =					"";			
	AtlasULVL.undead9.PlayerLimit =					"";		

	AtlasLVL.a1.PlayerLimit =					"";
	AtlasLVL.a2.PlayerLimit =					"";
	AtlasLVL.a3.PlayerLimit =					"";
	AtlasLVL.a4.PlayerLimit =					"";
	AtlasLVL.a5.PlayerLimit =					"";
	AtlasLVL.a6.PlayerLimit =					"";
	AtlasLVL.b1.PlayerLimit =					"";
	AtlasLVL.b2.PlayerLimit =					"";
	AtlasLVL.b3.PlayerLimit =					"";
	AtlasLVL.b4.PlayerLimit =					"";
	AtlasLVL.c1.PlayerLimit =					"";
	AtlasLVL.d1.PlayerLimit =					"";
	AtlasLVL.d2.PlayerLimit =					"";
	AtlasLVL.d3.PlayerLimit =					"";
	AtlasLVL.d4.PlayerLimit =					"";
	AtlasLVL.d5.PlayerLimit =					"";

	AtlasLV.e1.PlayerLimit =					"";
	AtlasLV.e2.PlayerLimit =					"";
	AtlasLV.e3.PlayerLimit =					"";
	AtlasLV.e4.PlayerLimit =					"";
	AtlasLV.e5.PlayerLimit =					"";
	AtlasLV.e6.PlayerLimit =					"";
	AtlasLV.e7.PlayerLimit =					"";
	AtlasLV.e8.PlayerLimit =					"";
	AtlasLV.e9.PlayerLimit =					"";
	AtlasLV.f1.PlayerLimit =					"";
	AtlasLV.f2.PlayerLimit =					"";
	AtlasLV.f3.PlayerLimit =					"";
	AtlasLV.f4.PlayerLimit =					"";
	AtlasLV.f5.PlayerLimit =					"";
	AtlasLV.f6.PlayerLimit =					"";
	AtlasLV.f7.PlayerLimit =					"";
	AtlasLV.f8.PlayerLimit =					"";	
	AtlasLV.f9.PlayerLimit =					"";
	
	
	AtlasLVE.g1.PlayerLimit =					"";
	AtlasLVE.g2.PlayerLimit =					"";
	AtlasLVE.g3.PlayerLimit =					"";
	AtlasLVE.g4.PlayerLimit =					"";
	AtlasLVE.g5.PlayerLimit =					"";	
	AtlasLVE.g6.PlayerLimit =					"";	
	AtlasLVE.g7.PlayerLimit =					"";	
	AtlasLVE.g8.PlayerLimit =					"";	
	AtlasLVE.g9.PlayerLimit =					"";	
	AtlasLVE.h1.PlayerLimit =					"";	
	AtlasLVE.h2.PlayerLimit =					"";	
	AtlasLVE.h3.PlayerLimit =					"";	
	AtlasLVE.h4.PlayerLimit =					"";	
	AtlasLVE.h5.PlayerLimit =					"";	
	AtlasLVE.h6.PlayerLimit =					"";	
	AtlasLVE.h7.PlayerLimit =					"";		
	AtlasLVE.h8.PlayerLimit =					"";		
	AtlasLVE.h9.PlayerLimit =					"";		
	AtlasLVE.i1.PlayerLimit =					"";		
	
	AtlasLVV.i2.PlayerLimit =					"";		
	AtlasLVV.i3.PlayerLimit =					"";	
	AtlasLVV.i4.PlayerLimit =					"";		
	AtlasLVV.i5.PlayerLimit =					"";		
	AtlasLVV.i6.PlayerLimit =					"";		
	AtlasLVV.i7.PlayerLimit =					"";		
	AtlasLVV.i8.PlayerLimit =					"";		
	AtlasLVV.i9.PlayerLimit =					"";	
	AtlasLVV.j1.PlayerLimit =					"";		
	AtlasLVV.j2.PlayerLimit =					"";		
	AtlasLVV.j3.PlayerLimit =					"";	
	AtlasLVV.j4.PlayerLimit =					"";		
	AtlasLVV.j5.PlayerLimit =					"";		
	AtlasLVV.j6.PlayerLimit =					"";	

	AtlasLVX.j7.PlayerLimit =					"";		
	AtlasLVX.j8.PlayerLimit =					"";		
	AtlasLVX.j9.PlayerLimit =					"";		
	AtlasLVX.k1.PlayerLimit =					"";		
	AtlasLVX.k2.PlayerLimit =					"";		
	AtlasLVX.k3.PlayerLimit =					"";	
	AtlasLVX.k4.PlayerLimit =					"";		
	AtlasLVX.k5.PlayerLimit =					"";		
	AtlasLVX.k6.PlayerLimit =					"";		
	AtlasLVX.k7.PlayerLimit =					"";		
	AtlasLVX.k8.PlayerLimit =					"";		
	AtlasLVX.k9.PlayerLimit =					"";			
	AtlasLVX.l1.PlayerLimit =					"";	
	AtlasLVX.l2.PlayerLimit =					"";		
	AtlasLVX.l3.PlayerLimit =					"";	
	AtlasLVX.l4.PlayerLimit =					"";		
	AtlasLVX.l5.PlayerLimit =					"";		
	AtlasLVX.l6.PlayerLimit =					"";		
	AtlasLVX.l7.PlayerLimit =					"";		
	AtlasLVX.l8.PlayerLimit =					"";		
	AtlasLVX.l9.PlayerLimit =					"";	
	
	AtlasLVY.m1.PlayerLimit =					"";		
	AtlasLVY.m2.PlayerLimit =					"";		
	AtlasLVY.m3.PlayerLimit =					"";	
	AtlasLVY.m4.PlayerLimit =					"";		
	AtlasLVY.m5.PlayerLimit =					"";		
	AtlasLVY.m6.PlayerLimit =					"";		
	AtlasLVY.m7.PlayerLimit =					"";		
	AtlasLVY.m8.PlayerLimit =					"";		
	AtlasLVY.m9.PlayerLimit =					"";			
	AtlasLVY.n1.PlayerLimit =					"";	
	AtlasLVY.n2.PlayerLimit =					"";		
	AtlasLVY.n3.PlayerLimit =					"";	
	AtlasLVY.n4.PlayerLimit =					"";		
	AtlasLVY.n5.PlayerLimit =					"";		
	AtlasLVY.n6.PlayerLimit =					"";		
	AtlasLVY.n7.PlayerLimit =					"";		
	AtlasLVY.n8.PlayerLimit =					"";	

	AtlasLVZ.n9.PlayerLimit =					"";		
	AtlasLVZ.o1.PlayerLimit =					"";		
	AtlasLVZ.o2.PlayerLimit =					"";		
	AtlasLVZ.o3.PlayerLimit =					"";	
	AtlasLVZ.o4.PlayerLimit =					"";		
	AtlasLVZ.o5.PlayerLimit =					"";		
	AtlasLVZ.o6.PlayerLimit =					"";		
	AtlasLVZ.o7.PlayerLimit =					"";		
	AtlasLVZ.o8.PlayerLimit =					"";		
	AtlasLVZ.o9.PlayerLimit =					"";			
	AtlasLVZ.p1.PlayerLimit =					"";	
	
end

--Main Atlas event handler
function Atlas_OnEvent()

	if (event == "ADDON_LOADED") then
		if (strlower(arg1) == "atlas") then
			Atlas_Vars_Loaded = 1;
			Atlas_Init();
		end
	elseif (event == "VARIABLES_LOADED") then
		if (not Atlas_Vars_Loaded) then
			Atlas_Vars_Loaded = 1;
			Atlas_Init();
		end
	end
	
end

--Initializes everything relating to saved variables and data in other lua files
--This should be called ONLY when we're sure that all other files have been loaded
function Atlas_Init()

	if ( AtlasOptions == nil or AtlasOptions["AtlasVersion"] ~= ATLAS_VERSION) then
		Atlas_FreshOptions();
	end

	--Take all the maps listed in the localization files and import them into the dropdown list structure
    for k,v in pairs(AtlasEK) do table.insert(ATLAS_DROPDOWN_LIST_EK, k); end
    for k,v in pairs(AtlasKalimdor) do table.insert(ATLAS_DROPDOWN_LIST_KA, k); end
    for k,v in pairs(AtlasBG) do table.insert(ATLAS_DROPDOWN_LIST_BG, k); end
    for k,v in pairs(AtlasFP) do table.insert(ATLAS_DROPDOWN_LIST_FP, k); end
    for k,v in pairs(AtlasDL) do table.insert(ATLAS_DROPDOWN_LIST_DL, k); end
    for k,v in pairs(AtlasRE) do table.insert(ATLAS_DROPDOWN_LIST_RE, k); end
    for k,v in pairs(AtlasINTRO) do table.insert(ATLAS_DROPDOWN_LIST_INTRO, k); end		
    for k,v in pairs(AtlasTLVL) do table.insert(ATLAS_DROPDOWN_LIST_TLVL, k); end	
    for k,v in pairs(AtlasULVL) do table.insert(ATLAS_DROPDOWN_LIST_ULVL, k); end		
    for k,v in pairs(AtlasLVL) do table.insert(ATLAS_DROPDOWN_LIST_LVL, k); end
    for k,v in pairs(AtlasLV) do table.insert(ATLAS_DROPDOWN_LIST_LV, k); end
    for k,v in pairs(AtlasLVE) do table.insert(ATLAS_DROPDOWN_LIST_LVE, k); end
	for k,v in pairs(AtlasLVV) do table.insert(ATLAS_DROPDOWN_LIST_LVV, k); end
	for k,v in pairs(AtlasLVX) do table.insert(ATLAS_DROPDOWN_LIST_LVX, k); end
	for k,v in pairs(AtlasLVY) do table.insert(ATLAS_DROPDOWN_LIST_LVY, k); end
	for k,v in pairs(AtlasLVZ) do table.insert(ATLAS_DROPDOWN_LIST_LVZ, k); end

	--Update the level ranges and player limits
	--Overrides the values in the localization files because I'm too lazy to change them all
	--It's also nice to have all the these figures come from only one place
	Atlas_UpdateLevelRanges();
	Atlas_UpdatePlayerLimits();
	
	--Sort the lists of maps alphabetically
	table.sort(ATLAS_DROPDOWN_LIST_EK, Atlas_SortZonesAlphaEK);
	table.sort(ATLAS_DROPDOWN_LIST_KA, Atlas_SortZonesAlphaKA);
	table.sort(ATLAS_DROPDOWN_LIST_BG, Atlas_SortZonesAlphaBG);
	table.sort(ATLAS_DROPDOWN_LIST_FP, Atlas_SortZonesAlphaFP);
	table.sort(ATLAS_DROPDOWN_LIST_DL, Atlas_SortZonesAlphaDL);
	table.sort(ATLAS_DROPDOWN_LIST_RE, Atlas_SortZonesAlphaRE);
	table.sort(ATLAS_DROPDOWN_LIST_INTRO, Atlas_SortZonesAlphaINTRO);		
	table.sort(ATLAS_DROPDOWN_LIST_TLVL, Atlas_SortZonesAlphaTLVL);	
	table.sort(ATLAS_DROPDOWN_LIST_ULVL, Atlas_SortZonesAlphaULVL);		
	table.sort(ATLAS_DROPDOWN_LIST_LVL, Atlas_SortZonesAlphaLVL);
	table.sort(ATLAS_DROPDOWN_LIST_LV, Atlas_SortZonesAlphaLV);
	table.sort(ATLAS_DROPDOWN_LIST_LVE, Atlas_SortZonesAlphaLVE);
	table.sort(ATLAS_DROPDOWN_LIST_LVV, Atlas_SortZonesAlphaLVV);	
	table.sort(ATLAS_DROPDOWN_LIST_LVX, Atlas_SortZonesAlphaLVX);	
	table.sort(ATLAS_DROPDOWN_LIST_LVY, Atlas_SortZonesAlphaLVY);	
	table.sort(ATLAS_DROPDOWN_LIST_LVZ, Atlas_SortZonesAlphaLVZ);	
	
	--Now that saved variables have been loaded, update everything accordingly
	Atlas_Refresh();
	AtlasOptions_Init();
	Atlas_UpdateLock();
	AtlasButton_UpdatePosition();
	Atlas_UpdateAlpha();
	AtlasFrame:SetClampedToScreen(AtlasOptions.AtlasClamped);

	--Cosmos integration
	if(EarthFeature_AddButton) then
		EarthFeature_AddButton(
		{
			id = ATLAS_TITLE;
			name = ATLAS_TITLE;
			subtext = ATLAS_SUBTITLE;
			tooltip = ATLAS_DESC;
			icon = "Interface\\AddOns\\Atlas\\Images\\AtlasIcon";
			callback = Atlas_Toggle;
			test = nil;
		}
	);
	elseif(Cosmos_RegisterButton) then
		Cosmos_RegisterButton(
			ATLAS_TITLE,
			ATLAS_SUBTITLE,
			ATLAS_DESC,
			"Interface\\AddOns\\Atlas\\Images\\AtlasIcon",
			Atlas_Toggle
		);
	end
	
	--CTMod integration
	if(CT_RegisterMod) then
		CT_RegisterMod(
			ATLAS_TITLE,
			ATLAS_SUBTITLE,
			5,
			"Interface\\AddOns\\Atlas\\Images\\AtlasIcon",
			ATLAS_DESC,
			"switch",
			"",
			Atlas_Toggle
		);
	end
end

--Simple function to toggle the Atlas frame's lock status and update it's appearance
function Atlas_ToggleLock()
	if(AtlasOptions.AtlasLocked) then
		AtlasOptions.AtlasLocked = false;
		Atlas_UpdateLock();
	else
		AtlasOptions.AtlasLocked = true;
		Atlas_UpdateLock();
	end
end

--Updates the appearance of the lock button based on the status of AtlasLocked
function Atlas_UpdateLock()
	if(AtlasOptions.AtlasLocked) then
		AtlasLockNorm:SetTexture("Interface\\AddOns\\Atlas\\Images\\LockButton-Locked-Up");
		AtlasLockPush:SetTexture("Interface\\AddOns\\Atlas\\Images\\LockButton-Locked-Down");
	else
		AtlasLockNorm:SetTexture("Interface\\AddOns\\Atlas\\Images\\LockButton-Unlocked-Up");
		AtlasLockPush:SetTexture("Interface\\AddOns\\Atlas\\Images\\LockButton-Unlocked-Down");
	end
end

--Begin moving the Atlas frame if it's unlocked
function Atlas_StartMoving()
	if(not AtlasOptions.AtlasLocked) then
		AtlasFrame:StartMoving();
	end
end

--Parses slash commands
--If an unrecognized command is given, toggle Atlas
function Atlas_SlashCommand(msg)
	if(msg == ATLAS_SLASH_OPTIONS) then
		AtlasOptions_Toggle();
	else
		Atlas_Toggle();
	end
end

--Sets the transparency of the Atlas frame based on AtlasAlpha
function Atlas_UpdateAlpha()
	AtlasFrame:SetAlpha(AtlasOptions.AtlasAlpha);
end

--Sets the scale of the Atlas frame based on AtlasScale
function Atlas_UpdateScale()
	AtlasFrame:SetScale(AtlasOptions.AtlasScale);
end

--Simple function to toggle the visibility of the Atlas frame
function Atlas_Toggle()
	if(AtlasFrame:IsVisible()) then
		HideUIPanel(AtlasFrame);
	else
		ShowUIPanel(AtlasFrame);
	end
end

--Refreshes the Atlas frame, usually because a new map needs to be displayed
--The zoneID variable represents the internal name used for each map
--Also responsible for updating all the text when a map is changed
function Atlas_Refresh()
	local zoneID;
	local textSource;
	
	--Just in case AtlasType hasn't been initialized
	--Added in response to a possible error
	if ( AtlasOptions.AtlasType == nil ) then
		AtlasOptions.AtlasType = 1;
	end
	
	if ( AtlasOptions.AtlasType == 1 ) then
		zoneID = ATLAS_DROPDOWN_LIST_EK[AtlasOptions.AtlasZone];
		textSource = AtlasEK;
	elseif ( AtlasOptions.AtlasType == 2 ) then
		zoneID = ATLAS_DROPDOWN_LIST_KA[AtlasOptions.AtlasZone];
		textSource = AtlasKalimdor;
	elseif ( AtlasOptions.AtlasType == 3 ) then
		zoneID = ATLAS_DROPDOWN_LIST_BG[AtlasOptions.AtlasZone];
		textSource = AtlasBG;
	elseif ( AtlasOptions.AtlasType == 4 ) then
		zoneID = ATLAS_DROPDOWN_LIST_FP[AtlasOptions.AtlasZone];
		textSource = AtlasFP;
	elseif ( AtlasOptions.AtlasType == 5 ) then
		zoneID = ATLAS_DROPDOWN_LIST_DL[AtlasOptions.AtlasZone];
		textSource = AtlasDL;
	elseif ( AtlasOptions.AtlasType == 6 ) then
		zoneID = ATLAS_DROPDOWN_LIST_RE[AtlasOptions.AtlasZone];
		textSource = AtlasRE;
	elseif ( AtlasOptions.AtlasType == 7 ) then
		zoneID = ATLAS_DROPDOWN_LIST_INTRO[AtlasOptions.AtlasZone];
		textSource = AtlasINTRO;			
	elseif ( AtlasOptions.AtlasType == 8 ) then
		zoneID = ATLAS_DROPDOWN_LIST_TLVL[AtlasOptions.AtlasZone];
		textSource = AtlasTLVL;		
	elseif ( AtlasOptions.AtlasType == 9 ) then
		zoneID = ATLAS_DROPDOWN_LIST_ULVL[AtlasOptions.AtlasZone];
		textSource = AtlasULVL;				
	elseif ( AtlasOptions.AtlasType == 10 ) then
		zoneID = ATLAS_DROPDOWN_LIST_LVL[AtlasOptions.AtlasZone];
		textSource = AtlasLVL;
	elseif ( AtlasOptions.AtlasType == 11 ) then
		zoneID = ATLAS_DROPDOWN_LIST_LV[AtlasOptions.AtlasZone];
		textSource = AtlasLV;
	elseif ( AtlasOptions.AtlasType == 12 ) then
		zoneID = ATLAS_DROPDOWN_LIST_LVE[AtlasOptions.AtlasZone];
		textSource = AtlasLVE;
	elseif ( AtlasOptions.AtlasType == 13 ) then
		zoneID = ATLAS_DROPDOWN_LIST_LVV[AtlasOptions.AtlasZone];
		textSource = AtlasLVV;
	elseif ( AtlasOptions.AtlasType == 14 ) then
		zoneID = ATLAS_DROPDOWN_LIST_LVX[AtlasOptions.AtlasZone];
		textSource = AtlasLVX;
	elseif ( AtlasOptions.AtlasType == 15 ) then
		zoneID = ATLAS_DROPDOWN_LIST_LVY[AtlasOptions.AtlasZone];
		textSource = AtlasLVY;	
	elseif ( AtlasOptions.AtlasType == 16 ) then
		zoneID = ATLAS_DROPDOWN_LIST_LVZ[AtlasOptions.AtlasZone];
		textSource = AtlasLVZ;				
		
	end
	AtlasMap:ClearAllPoints();
	AtlasMap:SetWidth(512);
	AtlasMap:SetHeight(512);
	AtlasMap:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 18, -84);
	AtlasMap:SetTexture("Interface\\AddOns\\Atlas\\Images\\"..zoneID);
	local ZoneNameText = textSource[zoneID]["ZoneName"];
	if ( AtlasOptions.AtlasAcronyms and textSource[zoneID]["Acronym"] ~= nil) then
		local _RED = "|cffcc6666";
		ZoneNameText = ZoneNameText.._RED.." ["..textSource[zoneID]["Acronym"].."]";
	end
	AtlasText_ZoneName:SetText(ZoneNameText);
	AtlasText_Location:SetText(ATLAS_STRING_LOCATION..": "..textSource[zoneID]["Location"]);
	AtlasText_LevelRange:SetText(ATLAS_STRING_LEVELRANGE..": "..textSource[zoneID]["LevelRange"]);
	AtlasText_PlayerLimit:SetText(ATLAS_STRING_PLAYERLIMIT..": "..textSource[zoneID]["PlayerLimit"]);
	for i = 1, 27, 1 do
		getglobal("AtlasText_"..i):SetText(textSource[zoneID][i]);
	end
end

--Function used to initialize the map type dropdown menu
--Cycle through Atlas_MapTypes to populate the dropdown
function AtlasFrameDropDownType_Initialize()
	local info;
	for i = 1, getn(Atlas_MapTypes), 1 do
		info = {
			text = Atlas_MapTypes[i];
			func = AtlasFrameDropDownType_OnClick;
		};
		UIDropDownMenu_AddButton(info);
	end
end

--Called whenever the map type dropdown menu is shown
function AtlasFrameDropDownType_OnShow()
	UIDropDownMenu_Initialize(AtlasFrameDropDownType, AtlasFrameDropDownType_Initialize);
	UIDropDownMenu_SetSelectedID(AtlasFrameDropDownType, AtlasOptions.AtlasType);
	UIDropDownMenu_SetWidth(190, AtlasFrameDropDownType);
end

--Called whenever an item in the map type dropdown menu is clicked
--Sets the main dropdown menu contents to reflect the category of map selected
function AtlasFrameDropDownType_OnClick()
	i = this:GetID();
	UIDropDownMenu_SetSelectedID(AtlasFrameDropDownType, i);
	AtlasOptions.AtlasType = i;
	AtlasOptions.AtlasZone = 1;
	AtlasFrameDropDown_OnShow();
	Atlas_Refresh();
end

--Function used to initialize the main dropdown menu
--Looks at the status of AtlasType to determine how to populate the list
function AtlasFrameDropDown_Initialize()
	if ( AtlasOptions.AtlasType == 1 ) then
		AtlasFrameDropDown_Populate(AtlasEK, ATLAS_DROPDOWN_LIST_EK);
	elseif ( AtlasOptions.AtlasType == 2 ) then
		AtlasFrameDropDown_Populate(AtlasKalimdor, ATLAS_DROPDOWN_LIST_KA);
	elseif ( AtlasOptions.AtlasType == 3 ) then
		AtlasFrameDropDown_Populate(AtlasBG, ATLAS_DROPDOWN_LIST_BG);
	elseif ( AtlasOptions.AtlasType == 4 ) then
		AtlasFrameDropDown_Populate(AtlasFP, ATLAS_DROPDOWN_LIST_FP);
	elseif ( AtlasOptions.AtlasType == 5 ) then
		AtlasFrameDropDown_Populate(AtlasDL, ATLAS_DROPDOWN_LIST_DL);
	elseif ( AtlasOptions.AtlasType == 6 ) then
		AtlasFrameDropDown_Populate(AtlasRE, ATLAS_DROPDOWN_LIST_RE);
	elseif ( AtlasOptions.AtlasType == 7 ) then
		AtlasFrameDropDown_Populate(AtlasINTRO, ATLAS_DROPDOWN_LIST_INTRO);		
	elseif ( AtlasOptions.AtlasType == 8 ) then
		AtlasFrameDropDown_Populate(AtlasTLVL, ATLAS_DROPDOWN_LIST_TLVL);				
	elseif ( AtlasOptions.AtlasType == 9 ) then
		AtlasFrameDropDown_Populate(AtlasULVL, ATLAS_DROPDOWN_LIST_ULVL);				
	elseif ( AtlasOptions.AtlasType == 10 ) then
		AtlasFrameDropDown_Populate(AtlasLVL, ATLAS_DROPDOWN_LIST_LVL);
	elseif ( AtlasOptions.AtlasType == 11 ) then
		AtlasFrameDropDown_Populate(AtlasLV, ATLAS_DROPDOWN_LIST_LV);
	elseif ( AtlasOptions.AtlasType == 12 ) then
		AtlasFrameDropDown_Populate(AtlasLVE, ATLAS_DROPDOWN_LIST_LVE);
	elseif ( AtlasOptions.AtlasType == 13 ) then
		AtlasFrameDropDown_Populate(AtlasLVV, ATLAS_DROPDOWN_LIST_LVV);
	elseif ( AtlasOptions.AtlasType == 14 ) then
		AtlasFrameDropDown_Populate(AtlasLVX, ATLAS_DROPDOWN_LIST_LVX);
	elseif ( AtlasOptions.AtlasType == 15 ) then
		AtlasFrameDropDown_Populate(AtlasLVY, ATLAS_DROPDOWN_LIST_LVY);		
	elseif ( AtlasOptions.AtlasType == 16 ) then
		AtlasFrameDropDown_Populate(AtlasLVZ, ATLAS_DROPDOWN_LIST_LVZ);		
	end
end

--Populates the main dropdown menu based on the arguments given
--mapType is the name used in the localization files for the category of map
--dropList is the (hopefully) sorted list made from one of those categories
function AtlasFrameDropDown_Populate(mapType, dropList)
	local info;
	for i = 1, getn(dropList), 1 do
		info = {
			text = mapType[dropList[i]]["ZoneName"];
			func = AtlasFrameDropDown_OnClick;
		};
		UIDropDownMenu_AddButton(info);
	end
end

--Called whenever the main dropdown menu is shown
function AtlasFrameDropDown_OnShow()
	UIDropDownMenu_Initialize(AtlasFrameDropDown, AtlasFrameDropDown_Initialize);
	UIDropDownMenu_SetSelectedID(AtlasFrameDropDown, AtlasOptions.AtlasZone);
	UIDropDownMenu_SetWidth(190, AtlasFrameDropDown);
end

--Called whenever an item in the main dropdown menu is clicked
--Sets the newly selected map as current and refreshes the frame
function AtlasFrameDropDown_OnClick()
	i = this:GetID();
	UIDropDownMenu_SetSelectedID(AtlasFrameDropDown, i);
	AtlasOptions.AtlasZone = i;
	Atlas_Refresh();
end

--Modifies the value of GetRealZoneText to account for some naming conventions
--Always use this function instead of GetRealZoneText within Atlas
function Atlas_GetFixedZoneText()
   local currentZone = GetRealZoneText();
   if (AtlasZoneSubstitutions[currentZone]) then
      return AtlasZoneSubstitutions[currentZone];
   end
   return currentZone;
end 

--Checks the player's current location against all Atlas maps
--If a match is found display that map right away
function Atlas_AutoSelect()
	local currentZone = Atlas_GetFixedZoneText();
	
	
	--god, there MUST be a better way to do this. This makes me sick
	-------------------------------
	local currentType = UIDropDownMenu_GetSelectedID(AtlasFrameDropDownType);
	local currentDB, currentDD;
	if currentType == 1 then
		currentDB = AtlasEK;
		currentDD = ATLAS_DROPDOWN_LIST_EK;
	elseif currentType == 2 then
		currentDB = AtlasKalimdor;
		currentDD = ATLAS_DROPDOWN_LIST_KA;
	else
		return;
	end
	local currentMap = currentDB[currentDD[AtlasOptions.AtlasZone]]["ZoneName"];
	----------------------------------
	
	
	if(currentZone ~= currentMap) then
		for i = 1, getn(ATLAS_DROPDOWN_LIST_EK), 1 do
			local mapName = AtlasEK[ATLAS_DROPDOWN_LIST_EK[i]]["ZoneName"];
			if(currentZone == mapName) then
				AtlasOptions.AtlasType = 1;
				AtlasOptions.AtlasZone = i;
				UIDropDownMenu_SetSelectedID(AtlasFrameDropDown, i);
				Atlas_Refresh();
				return;
			end
		end
		for i = 1, getn(ATLAS_DROPDOWN_LIST_KA), 1 do
			local mapName = AtlasKalimdor[ATLAS_DROPDOWN_LIST_KA[i]]["ZoneName"];
			if(currentZone == mapName) then
				AtlasOptions.AtlasType = 2;
				AtlasOptions.AtlasZone = i;
				UIDropDownMenu_SetSelectedID(AtlasFrameDropDown, i);
				Atlas_Refresh();
				return;
			end
		end
	end
end

--Called whenever the Atlas frame is displayed
function Atlas_OnShow()
	if(AtlasOptions.AtlasAutoSelect) then
		Atlas_AutoSelect();
	end
end

--Checks to see if the World Map should be replaced by Atlas or not
--Is the feature turned on? Is the player in an instance?
function Atlas_ReplaceWorldMap()
	if(AtlasOptions.AtlasReplaceWorldMap) then
		local currentZone = Atlas_GetFixedZoneText();
		for i = 1, getn(ATLAS_DROPDOWN_LIST_EK), 1 do
			local mapName = AtlasEK[ATLAS_DROPDOWN_LIST_EK[i]]["ZoneName"];
			if(currentZone == mapName) then
				return true;
			end
		end
		for i = 1, getn(ATLAS_DROPDOWN_LIST_KA), 1 do
			local mapName = AtlasKalimdor[ATLAS_DROPDOWN_LIST_KA[i]]["ZoneName"];
			if(currentZone == mapName) then
				return true;
			end
		end
	end
	return false;
end

--Replaces the default ToggleWorldMap function
local oldToggleWorldMap = ToggleWorldMap;
function ToggleWorldMap()
	if (not WorldMapFrame:IsVisible() and Atlas_ReplaceWorldMap()) then
		Atlas_Toggle();
	else
		SetupFullscreenScale(WorldMapFrame);
		oldToggleWorldMap();
	end
end

--Code provided by tyroney
--Bugfix code by Cold
--Runs when the Atlas frame is clicked on
--RightButton closes Atlas and open the World Map if the RightClick option is turned on
function Atlas_OnClick()
	if ( arg1 == "RightButton" ) then
		if (AtlasOptions.AtlasRightClick) then
			local OldAtlasOptReplWMap = AtlasOptions.AtlasReplaceWorldMap;
			AtlasOptions.AtlasReplaceWorldMap = false;
			Atlas_Toggle();
			ToggleWorldMap();
			AtlasOptions.AtlasReplaceWorldMap = OldAtlasOptReplWMap;
		end
	end
end
