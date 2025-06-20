﻿-- Inventory On Par --


--------------------------------------------------------------------------------------------------
-- Localized global variables
--------------------------------------------------------------------------------------------------

INVENTORY_SLOT_LIST = {
	{ name = "HeadSlot" , 			desc = "Head",			weight = 1.00, minLevel = 15 },
    { name = "NeckSlot" , 			desc = "Neck",			weight = 0.54, minLevel = 18 },
    { name = "ShoulderSlot" , 		desc = "Shoulders",		weight = 0.74, minLevel = 15 },
    { name = "BackSlot" , 			desc = "Back",			weight = 0.54, minLevel = 1 },
    { name = "ChestSlot" , 			desc = "Chest",			weight = 1.00, minLevel = 1 },
--    { name = "ChestSlot" , 		desc = "Shirt" },
--    { name = "TabardSlot" , 		desc = "Tabard" },
    { name = "WristSlot" , 			desc = "Wrist",			weight = 0.54, minLevel = 1 },
    { name = "HandsSlot" , 			desc = "Hands",			weight = 0.74, minLevel = 1 },
    { name = "WaistSlot" , 			desc = "Waist",			weight = 0.74, minLevel = 1 },
    { name = "LegsSlot" , 			desc = "Legs",			weight = 1.00, minLevel = 1 },
    { name = "FeetSlot" , 			desc = "Feet",			weight = 0.74, minLevel = 1 },
    { name = "Finger0Slot" , 		desc = "1st Finger",	weight = 0.54, minLevel = 10 },
    { name = "Finger1Slot" , 		desc = "2nd Finger",	weight = 0.54, minLevel = 10 },
    { name = "Trinket0Slot" , 		desc = "1st Trinket",	weight = 0.67, minLevel = 20 },
    { name = "Trinket1Slot" , 		desc = "2nd Trinket",	weight = 0.67, minLevel = 20 },
    { name = "MainHandSlot" , 		desc = "Main Hand",		weight = 0.50, minLevel = 1 },
    { name = "SecondaryHandSlot" , 	desc = "Off Hand",		weight = 0.50, minLevel = 1 },
    { name = "RangedSlot" , 		desc = "Range Weapon",	weight = 0.50, minLevel = 1 },
};
BUTTONTEXT = "On Par";
TH_AXE = "Two-Handed Axes";
TH_MACE = "Two-Handed Maces";
TH_SWORD = "Two-Handed Swords";
STAVES = "Staves";
POLEARMS = "Polearms";

-- Get the client language
local clientLanguage = GetLocale();

-- Check the client language
if (clientLanguage == "deDE") then
	INVENTORY_SLOT_LIST = {
	{ name = "HeadSlot" , desc = "Kopf", weight = 1.00, minLevel = 15 },
	{ name = "NeckSlot" , desc = "Hals", weight = 0.54, minLevel = 18 },
	{ name = "ShoulderSlot" , desc = "Schultern", weight = 0.74, minLevel = 15 },
	{ name = "BackSlot" , desc = "R\195\188cken", weight = 0.54, minLevel = 1 },
	{ name = "ChestSlot" , desc = "Brust", weight = 1.00, minLevel = 1 },
	-- { name = "ChestSlot" , desc = "Hemd" },
	-- { name = "TabardSlot" , desc = "Wappenrock" },
	{ name = "WristSlot" , desc = "Handgelenke", weight = 0.54, minLevel = 1 },
	{ name = "HandsSlot" , desc = "H\195\164nde", weight = 0.74, minLevel = 1 },
	{ name = "WaistSlot" , desc = "Taille", weight = 0.74, minLevel = 1 },
	{ name = "LegsSlot" , desc = "Beine", weight = 1.00, minLevel = 1 },
	{ name = "FeetSlot" , desc = "F\195\188\195\159e", weight = 0.74, minLevel = 1 },
	{ name = "Finger0Slot" , desc = "1. Finger", weight = 0.54, minLevel = 10 },
	{ name = "Finger1Slot" , desc = "2. Finger", weight = 0.54, minLevel = 10 },
	{ name = "Trinket0Slot" , desc = "1. Schmuck", weight = 0.67, minLevel = 20 },
	{ name = "Trinket1Slot" , desc = "2. Schmuck", weight = 0.67, minLevel = 20 },
	{ name = "MainHandSlot" , desc = "Waffenhand", weight = 0.50, minLevel = 1 },
	{ name = "SecondaryHandSlot" , desc = "Schildhand", weight = 0.50, minLevel = 1 },
	{ name = "RangedSlot" , desc = "Distanz", weight = 0.50, minLevel = 1 },
	};
	BUTTONTEXT = "On Par";
	TH_AXE = "Two-Handed Axes";
	TH_MACE = "Two-Handed Maces";
	TH_SWORD = "Two-Handed Swords";
	STAVES = "Staves";
	POLEARMS = "Polearms";

elseif (clientLanguage == "frFR") then
	INVENTORY_SLOT_LIST = {
	    { name = "HeadSlot" , 			desc = "Head",			weight = 1.00, minLevel = 15 },
	    { name = "NeckSlot" , 			desc = "Neck",			weight = 0.54, minLevel = 18 },
	    { name = "ShoulderSlot" , 		desc = "Shoulders",		weight = 0.74, minLevel = 15 },
	    { name = "BackSlot" , 			desc = "Back",			weight = 0.54, minLevel = 1 },
	    { name = "ChestSlot" , 			desc = "Chest",			weight = 1.00, minLevel = 1 },
	--    { name = "ChestSlot" , 		desc = "Shirt" },
	--    { name = "TabardSlot" , 		desc = "Tabard" },
	    { name = "WristSlot" , 			desc = "Wrist",			weight = 0.54, minLevel = 1 },
	    { name = "HandsSlot" , 			desc = "Hands",			weight = 0.74, minLevel = 1 },
	    { name = "WaistSlot" , 			desc = "Waist",			weight = 0.74, minLevel = 1 },
	    { name = "LegsSlot" , 			desc = "Legs",			weight = 1.00, minLevel = 1 },
	    { name = "FeetSlot" , 			desc = "Feet",			weight = 0.74, minLevel = 1 },
	    { name = "Finger0Slot" , 		desc = "1st Finger",	weight = 0.54, minLevel = 10 },
	    { name = "Finger1Slot" , 		desc = "2nd Finger",	weight = 0.54, minLevel = 10 },
	    { name = "Trinket0Slot" , 		desc = "1st Trinket",	weight = 0.67, minLevel = 20 },
	    { name = "Trinket1Slot" , 		desc = "2nd Trinket",	weight = 0.67, minLevel = 20 },
	    { name = "MainHandSlot" , 		desc = "Main Hand",		weight = 0.50, minLevel = 1 },
	    { name = "SecondaryHandSlot" , 	desc = "Off Hand",		weight = 0.50, minLevel = 1 },
	    { name = "RangedSlot" , 		desc = "Range Weapon",	weight = 0.50, minLevel = 1 },
	};
	BUTTONTEXT = "On Par";
	TH_AXE = "Two-Handed Axes";
	TH_MACE = "Two-Handed Maces";
	TH_SWORD = "Two-Handed Swords";
	STAVES = "Staves";
	POLEARMS = "Polearms";
end
