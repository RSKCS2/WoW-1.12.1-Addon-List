local dewdrop = AceLibrary("Dewdrop-2.0")
local tablet = AceLibrary("Tablet-2.0")
local crayon = AceLibrary("Crayon-2.0")

local L = AceLibrary("AceLocale-2.0"):new("FuBar_RareTrackerFu")


L:RegisterTranslations("enUS", function()
	return {

		["DISPLAY_ZONE"] = "RareTracker: %d",
		["DISPLAY_SUBZONE"] = "RareTracker: %d (%d)",

		["TOOLTIP_HINT"] = "Left-click to scan your surroundings.",

		["TOOLTIP_NO_KNOWN_MOBS"] = "No rare mobs known in %s.",	
		["TOOLTIP_MOBS_KNOWN_IN_ZONE"] = "%d rare mob(s) known in %s:",
		["TOOLTIP_MOBS_KNOWN_IN_SUB_ZONE"] = "%d of them near or in %s:",
		["TOOLTIP_MOBS_KNOWN_IN_SUB_ZONE_ONLY"] = "%s:",
		["TOOLTIP_MOBS_KNOWN_IN_UNKNOWN"] = "No subzone/never seen:",
		["TOOLTIP_SEEN_AT"] = "Seen at:",
		["TOOLTIP_MOB"] = " - %s, %s",

		["MENU_SCAN"] = "Scan for nearby mobs",		
		["MENU_AUTOTARGET"] = "Allow autotargeting",
		["MENU_TOOLTIP_LOCATION"] = "Use default tooltip location",
		["MENU_SORT_BY_SUBZONE"] = "Sort tooltip by subzone",
		
	}
end)

FuBar_RareTrackerFu = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDB-2.0", "FuBarPlugin-2.0")
FuBar_RareTrackerFu:RegisterDB("FuBar_RareTrackerFuDB")
FuBar_RareTrackerFu.version = "0.2.2" 

FuBar_RareTrackerFu:RegisterDefaults("profile", {
	sortBySubzone = false,
})

function FuBar_RareTrackerFu:IsSortBySubzone()
	return FuBar_RareTrackerFu.db.profile.sortBySubzone
end

function FuBar_RareTrackerFu:ToggleSortBySubzone()
	FuBar_RareTrackerFu.db.profile.sortBySubzone = not FuBar_RareTrackerFu.db.profile.sortBySubzone
	FuBar_RareTrackerFu:Update()
end

function FuBar_RareTrackerFu:IsAllowAutoTarget()
	return TNE_RareTrackerCore_AutoTarget
end

function FuBar_RareTrackerFu:ToggleAllowAutoTarget()	
	TNE_RareTrackerCore_AutoTarget = not TNE_RareTrackerCore_AutoTarget
	FuBar_RareTrackerFu:Update()
end

local opts = {type = "group", handler = FuBar_RareTrackerFu, args = {
	scan = {
		type = 'execute', name = L["MENU_SCAN"],desc = L["MENU_SCAN"], order = 1,
		func = function() RareTracker:Scan(); end
		},

	autotarget = {
		type = "toggle", name = L["MENU_AUTOTARGET"], desc = L["MENU_AUTOTARGET"], order = 2,
		get = "IsAllowAutoTarget", set = "ToggleAllowAutoTarget",	
	},
	sortit = {
		type = "toggle", name = L["MENU_SORT_BY_SUBZONE"], desc = L["MENU_SORT_BY_SUBZONE"], order = 3,
		get = "IsSortBySubzone", set = "ToggleSortBySubzone",
	},
}}
FuBar_RareTrackerFu.OnMenuRequest = opts

function FuBar_RareTrackerFu:Initialize()
    UIParentLoadAddOn("TNE_RareTrackerCore")
    RareTracker:RegisterForNotification("FuBar_RareTrackerFu_OnRareFound")
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "UpdateText")
    self:RegisterEvent("ZONE_CHANGED", "UpdateText")

end

function FuBar_RareTrackerFu:UpdateText()

    local mobs = RareTracker:GetZone(GetRealZoneText())
    local submobs = RareTracker:GetZone(GetRealZoneText(), GetSubZoneText())
    local inZone, inSubZone = TNEUtils.TableLength(mobs) or "0", TNEUtils.TableLength(submobs)
    if (inSubZone) then
      self:SetText(format(L"DISPLAY_SUBZONE", inZone, inSubZone))
    else
      self:SetText(format(L"DISPLAY_ZONE", inZone))
    end

 end

function FuBar_RareTrackerFu:OnTooltipUpdate()
	tablet:SetTitle("")

	if (self.IsSortBySubzone()) then		
		self:AddSortedZoneToTooltip()
	else
		self:AddZoneToTooltip()
	end

end

function FuBar_RareTrackerFu:AddZoneToTooltip()
	local zone = GetRealZoneText()
	local subZone = nil
	local mobs = RareTracker:GetZone(zone, subZone)
	local num = TNEUtils.TableLength(mobs)
	local cat = tablet:AddCategory("columns",2,
			'child_textR', 1,
			'child_textG', 1,
			'child_textB', 1,
			'child_text2R', 1,
			'child_text2G', 1,
			'child_text2B', 1)	

	if (num == 0) then
		cat:AddLine("text",  format(L"TOOLTIP_NO_KNOWN_MOBS", zone))
	else
		cat:AddLine("text", format(L"TOOLTIP_MOBS_KNOWN_IN_ZONE",num, zone), "text2", L"TOOLTIP_SEEN_AT")		

		for key, data in mobs do
			local name, stats, coords = unpack(data)
			cat:AddLine("text", format(L"TOOLTIP_MOB", crayon:Yellow(name), crayon:White(stats)),
				    "text2",coords)
		end
	end

	-- List the ones in this subzone
	subZone = GetSubZoneText()
	if (subZone) then
		mobs = RareTracker:GetZone(zone,subZone)
		num = TNEUtils.TableLength(mobs)
		if (num > 0) then
			cat:AddLine()
			cat:AddLine("text", format(L"TOOLTIP_MOBS_KNOWN_IN_ZONE",num, subZone), "text2", L"TOOLTIP_SEEN_AT")		
			for key, data in mobs do
				local name, stats, coords = unpack(data)
				cat:AddLine("text", format(L"TOOLTIP_MOB", crayon:Yellow(name), crayon:White(stats)),
					    "text2",coords)
			end			
		end

	end

end

function FuBar_RareTrackerFu:AddSortedZoneToTooltip()
	local zone = GetRealZoneText()
	local num, mobs = RareTracker:GetSortedZoneData(zone)
	local cat = tablet:AddCategory("columns",2,
			'child_textR', 1,
			'child_textG', 1,
			'child_textB', 1,
			'child_text2R', 1,
			'child_text2G', 1,
			'child_text2B', 1)	

	if (num == 0) then
		cat:AddLine("text",  format(L"TOOLTIP_NO_KNOWN_MOBS", zone))
	else
		-- add all mobs in the zone
		for subZone, data in mobs do
			if (not (subZone == "")) then
				cat:AddLine("text", format(L"TOOLTIP_MOBS_KNOWN_IN_SUB_ZONE_ONLY", subZone))
				for name, mob in data do
					local name, stats, coords = unpack(mob)
					cat:AddLine("text", format(L"TOOLTIP_MOB", crayon:Yellow(name), crayon:White(stats)),
						    "text2",coords)
				end
			end
		end

		if (table.getn(mobs[""]) > 0) then
			cat:AddLine("text", L"TOOLTIP_MOBS_KNOWN_IN_UNKNOWN")
			for name, mob in mobs[""] do
				local name, stats, coords = unpack(mob)
					cat:AddLine("text", format(L"TOOLTIP_MOB", crayon:Yellow(name), crayon:White(stats)),
						    "text2",coords)
			end
		end	
	end

end

function FuBar_RareTrackerFu:OnClick()
    RareTracker:Scan()
end

function FuBar_RareTrackerFu_OnRareFound()
	FuBar_RareTrackerFu:UpdateText()
end

