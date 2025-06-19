--[[--------------------------------------------------
----- VanillaGuide -----
------------------
Core.lua
Authors: mrmr
Version: 1.03.1
------------------------------------------------------
Description: 
      Powerleveling Guide for 1.12.1 servers
    based on Joana Guide
    1.00
  -- Initial Ace2 release
	1.99a
  -- Ally addition starter version
    1.03
  -- No Changes. Just adjusting "version".
     1.99x for a beta release was a weird choise.
------------------------------------------------------
Connection:
--]]--------------------------------------------------


debug = true

function D(...)
	if debug then
	    for k, v in pairs(arg) do arg[k] = tostring(v) end
		local s = table.concat(arg, ", ")
		s = string.gsub(s, "([=:]),", "%1")
		DEFAULT_CHAT_FRAME:AddMessage("|cFFff6633VGuide:|r" .. s)
    end
    --return s
end

VGuide = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDB-2.0", "AceConsole-2.0", "AceDebug-2.0")

D(" VGuide Core.lua Start")
D("  on: " .. date())

function VGuide:OnInitialize(name)
	-- fired upon Blizz's Event ADDON_LOADED
    --self:Print(self:PrintAddonInfo())
	--D("   -- OnInitialize Start")
	D("     Debug is turned On")
	
	local profile_defaults = {}
	
	local char_defaults = {
		UIoptions = {
			Locked = false,
			StepFrameVisible = true,
			ScrollFrameVisible = true,
			StepScroll = 0.33,
			MinimapToggle = true,
			MinimapPos = 0,
			Opacity = 1,
			Scale = 1,
			Layer = "HIGH",
			MainFrameSize = {
				nWidth = 320,
				nHeight = 320,
			},
			MainFrameAnchor = {
				sFrom = "CENTER",
				sTo = "CENTER",
				nX = 0,
				nY = 0,
			},
			MainFrameColor = {
				nR = .11,
				nG = .11,
				nB = .11,
				nA = .81,
			},
			StepFrameColor = {
				nR = .11,
				nG = .11,
				nB = .41,
				nA = .71,
			},
			ScrollFrameColor = {
				nR = .41,
				nG = .11,
				nB = .11,
				nA = .71,
			},
			StepFrameTextColor = {
				nR = .91,
				nG = .91,
				nB = .91,
				nA = .99,
			},
			ScrollFrameTextColor = {
				nR = .59,
				nG = .59,
				nB = .59,
				nA = .71,
			},
		},
	    CharInfo = {
			CharName = "Unknown",	--CharName,
			RealmName = "Unknown",	--RealmName,
			Class = "Unknown",		--Class,
			Race = "Unknown",		--Race,
			Faction = "Unknown",	--Faction,
		},
		GuideValues = {
			GuideID = 1,
			Step = 1,
		},
		VGuideFu = {
			ShowTitle = true,
			ShowGuideName = false,
			ShowGuideStep = false,
			ShowLabels = true,
		},
		MetaMapBWPSupport = false,
		MetaMapBWPSupportEnable = false,
	}

	VGuide:RegisterDB("VGuideDB", "VGuideDBPC", "Default")
	VGuide:RegisterDefaults("profile", profile_defaults)
	VGuide:RegisterDefaults("char", char_defaults)
	--D("   -- OnInitialize End")
end

function VGuide:OnEnable(first)
	-- fired upon Blizz's Event PLAYER_LOGIN
    -- guess this is after VARIABLE_LOADED
	--D(" -- OnEnable Start")
    --[[
    self:RegisterEvent("VARIABLES_LOADED")
    self:RegisterEvent("Ace2_AddonInitialized")
    self:RegisterEvent("Ace2_AddonEnabled")
    self:RegisterEvent("ZONE_CHANGED")
	]]
	--[[
	local _, title = GetAddOnInfo("JGuide")
    local author = GetAddOnMetadata("JGuide", "Author")
    local version = GetAddOnMetadata("JGuide", "Version")
    local CharName = UnitName("player")
    local RealmName = GetRealmName()
    local Class = UnitClass("player")
    local Race = UnitRace("player")
    local Faction = UnitFactionGroup("player")
   	self:Print("Title: " .. title)
    self:Print("Author: " .. author)
    self:Print("Version: " .. version)
    self:Print("CharName: " .. CharName)
    self:Print("RealmName: " .. RealmName)
    self:Print("Class: " .. Class)
    self:Print("Race: " .. Race)
    self:Print("Faction: " .. Faction)
    ]] 
	
	---- TODO
	-- Better check on SavedVariables
	
	if self.db.char.CharInfo.CharName == "Unknown" then 
		self.db.char.CharInfo.CharName = UnitName("player")
		self.db.char.CharInfo.RealmName = GetRealmName()
		self.db.char.CharInfo.Class = UnitClass("player")
		self.db.char.CharInfo.Race = UnitRace("player")
		self.db.char.CharInfo.Faction = UnitFactionGroup("player")
		self:Print("New Settings for " .. AceLibrary("AceDB-2.0").CHAR_ID .. " created!")
	else
		self:Print("Settings for " .. AceLibrary("AceDB-2.0").CHAR_ID .. " loaded!")
	end

	--- MetaMap BWP Support Check!
	if MetaMap_LoadBWP and MetaMap_NameToZoneID then
		D("  MetaMap Support Check")
		MetaMap_LoadBWP(0, 3)
		if setmininote and BWP_ClearDest and BWP_GetDistText then
			D("  MetaMapBWP Support Present")
			self.db.char.MetaMapBWPSupport = true
		else
			D("  MetaMapBWP Support NOT Present")
			self.db.char.MetaMapBWPSupport = false
		end
	end
	--- MetaMap BWP Support Check!
	
	
    self.UI = UI:new(self.db.char)
	--D(" -- OnEnable End")
end

function VGuide:OnDisable()
	-- fired when AddOn is disabled
    --self:RegisterEvent("PLAYER_LOGOUT")
end

--[[function VGuide:Ace2_AddonInitialized(addon)
    self:Print("|c00FF3333"..addon.."|r: VGuide v1.0 Initialized!")
end]]
--[[function VGuide:Ace2_AddonEnabled(addon, first)
    if first then
        self:Print("|c00FF3333"..addon.."|r: VGuide v1.0 Enabled for the first time!")
    else
        self:Print("|c00FF3333"..addon.."|r: VGuide v1.0 Enabled after...")
    end
end]]

--[[
function VGuide:ZONE_CHANGED()
    if GetBindLocation() == GetSubZoneText() then
        if self:IsShowInChat() then
            self:Print(self:GetMessage())
        end

        if self:IsShowOnScreen() then
            UIErrorsFrame:AddMessage(self:GetMessage(), 1.0, 1.0, 1.0, 5.0)
        end
    end
end
]]

D(" VGuide Core.lua End")

return VGuide