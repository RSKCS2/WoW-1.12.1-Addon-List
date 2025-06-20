ZHunterMod_Saved["ZHunterButtonTrap"] = {}
ZHunterMod_Saved["ZHunterButtonTrap"]["spells"] = {ZHUNTER_TRAP_FREEZING, ZHUNTER_TRAP_FROST,
	ZHUNTER_TRAP_IMMOLATION, ZHUNTER_TRAP_EXPLOSIVE, ZHUNTER_FEIGN}
ZHunterMod_Saved["ZHunterButtonTrap"]["rows"] = 1
ZHunterMod_Saved["ZHunterButtonTrap"]["count"] = 5
ZHunterMod_Saved["ZHunterButtonTrap"]["horizontal"] = nil
ZHunterMod_Saved["ZHunterButtonTrap"]["vertical"] = nil
ZHunterMod_Saved["ZHunterButtonTrap"]["firstbutton"] = "RIGHT"
ZHunterMod_Saved["ZHunterButtonTrap"]["tooltip"] = 1
ZHunterMod_Saved["ZHunterButtonTrap"]["parent"] = {}
ZHunterMod_Saved["ZHunterButtonTrap"]["parent"]["size"] = 36
ZHunterMod_Saved["ZHunterButtonTrap"]["parent"]["hide"] = nil
ZHunterMod_Saved["ZHunterButtonTrap"]["parent"]["circle"] = 1
ZHunterMod_Saved["ZHunterButtonTrap"]["children"] = {}
ZHunterMod_Saved["ZHunterButtonTrap"]["children"]["size"] = 36
ZHunterMod_Saved["ZHunterButtonTrap"]["children"]["hideonclick"] = 1

function ZHunterButtonTrap_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED")
end

function ZHunterButtonTrap_OnEvent()
	if event == "VARIABLES_LOADED" then
		if UnitClass("player") ~= ZHUNTER_HUNTER then
			ZHunterButtonTrap:UnregisterAllEvents()
			ZHunterButtonTrap:Hide()
			return
		end
		ZSpellButton_CreateChildren(ZHunterButtonTrap, "ZHunterButtonTrap", 11)
		ZHunterButtonTrap.found = ZSpellButton_SetButtons(ZHunterButtonTrap, ZHunterMod_Saved["ZHunterButtonTrap"]["spells"])
		if ZHunterButtonTrap.found > 0 and ZHunterButtonTrap.found < ZHunterMod_Saved["ZHunterButtonTrap"]["count"] then
			ZHunterMod_Saved["ZHunterButtonTrap"]["count"] = ZHunterButtonTrap.found
		end
		ZHunterButtonTrap.options = ZHunterButtonTrapOptions
		ZHunterButtonTrap.beforeclick = ZHunterButtonTrapAdjustment_BeforeClick
		ZHunterButtonTrapAdjustment = CreateFrame("Frame", "ZHunterButtonTrapAdjustment")
		ZHunterButtonTrapAdjustment:RegisterEvent("PLAYER_REGEN_ENABLED")
		ZHunterButtonTrapAdjustment:RegisterEvent("PLAYER_REGEN_DISABLED")
		ZHunterButtonTrapAdjustment:RegisterEvent("PLAYER_ENTERING_WORLD")
		ZHunterButtonTrapAdjustment:SetScript("OnEvent", ZHunterButtonTrapAdjustment_OnEvent)
		ZHunterButtonTrap_SetupOptions()
		ZHunterButtonTrap_SetupSizeAndPosition()
	end
end

function ZHunterButtonTrap_SetupSizeAndPosition()
	ZSpellButton_SetSize(ZHunterButtonTrap, ZHunterMod_Saved["ZHunterButtonTrap"]["parent"]["size"])
	ZSpellButton_SetSize(ZHunterButtonTrap, ZHunterMod_Saved["ZHunterButtonTrap"]["children"]["size"], 1)
	ZSpellButton_SetExpandDirection(ZHunterButtonTrap, ZHunterMod_Saved["ZHunterButtonTrap"]["firstbutton"])
	ZSpellButton_ArrangeChildren(ZHunterButtonTrap, ZHunterMod_Saved["ZHunterButtonTrap"]["rows"], 
		ZHunterMod_Saved["ZHunterButtonTrap"]["count"], ZHunterMod_Saved["ZHunterButtonTrap"]["horizontal"],
		ZHunterMod_Saved["ZHunterButtonTrap"]["vertical"])
end

function ZHunterButtonTrap_Reset()
	ZHunterMod_Saved["ZHunterButtonTrap"] = {}
	ZHunterMod_Saved["ZHunterButtonTrap"]["spells"] = {ZHUNTER_TRAP_FREEZING, ZHUNTER_TRAP_FROST,
		ZHUNTER_TRAP_IMMOLATION, ZHUNTER_TRAP_EXPLOSIVE, ZHUNTER_FEIGN}
	ZHunterMod_Saved["ZHunterButtonTrap"]["rows"] = 1
	ZHunterMod_Saved["ZHunterButtonTrap"]["count"] = 5
	ZHunterMod_Saved["ZHunterButtonTrap"]["horizontal"] = nil
	ZHunterMod_Saved["ZHunterButtonTrap"]["vertical"] = nil
	ZHunterMod_Saved["ZHunterButtonTrap"]["firstbutton"] = "RIGHT"
	ZHunterMod_Saved["ZHunterButtonTrap"]["tooltip"] = 1
	ZHunterMod_Saved["ZHunterButtonTrap"]["parent"] = {}
	ZHunterMod_Saved["ZHunterButtonTrap"]["parent"]["size"] = 36
	ZHunterMod_Saved["ZHunterButtonTrap"]["parent"]["hide"] = nil
	ZHunterMod_Saved["ZHunterButtonTrap"]["parent"]["circle"] = 1
	ZHunterMod_Saved["ZHunterButtonTrap"]["children"] = {}
	ZHunterMod_Saved["ZHunterButtonTrap"]["children"]["size"] = 36
	ZHunterMod_Saved["ZHunterButtonTrap"]["children"]["hideonclick"] = 1
end

function ZHunterButtonTrapAdjustment_BeforeClick(button)
	if button.id then
		local name = GetSpellName(button.id, "spell")
		if name == ZHUNTER_FEIGN then
			PetFollow()
		end
	end
end

function ZHunterButtonTrapAdjustment_OnEvent()
	local feignbutton
	local nextbutton
	local button
	for i=1, ZHunterButtonTrap.count do
		button = getglobal(ZHunterButtonTrap.name..i)
		if button.id then
			if GetSpellName(button.id, "spell") == ZHUNTER_FEIGN then
				feignbutton = button
			elseif not nextbutton then
				nextbutton = button
			end
		end
	end
	if event == "PLAYER_REGEN_ENABLED" or event == "PLAYER_ENTERING_WORLD" then
		ZHunterButtonTrap.id = nextbutton and nextbutton.id or ZHunterButtonTrap1.id
	elseif event == "PLAYER_REGEN_DISABLED" then
		ZHunterButtonTrap.id = feignbutton and feignbutton.id or ZHunterButtonTrap1.id
	end
	ZSpellButton_UpdateButton(ZHunterButtonTrap)
	ZSpellButton_UpdateCooldown(ZHunterButtonTrap)
	if GameTooltip:IsOwned(ZHunterButtonTrap) then
		ZSpellButtonParent_OnEnter(ZHunterButtonTrap)
	end
end

function ZHunterButtonTrap_KeyBinding(index)
	local button
	if index then
		button = getglobal("ZHunterButtonTrap"..index)
	else
		button = ZHunterButtonTrap
	end
	if button.id then
		CastSpell(button.id, "spell")
		if ZHunterButtonTrap.hideonclick then
			ZHunterButtonTrap.children:Hide()
		end
	end
end

SLASH_ZHunterButtonTrap1 = "/ZTrap"
SlashCmdList["ZHunterButtonTrap"] = function(msg)
	if msg == "reset" then
		ZHunterButtonTrap_Reset()
		ZHunterButtonTrap:ClearAllPoints()
		ZHunterButtonTrap:SetPoint("CENTER", UIParent, "CENTER", 60, 0)
	elseif msg == "options" then
		ZHunterButtonTrap.options:Show()
	else
		DEFAULT_CHAT_FRAME:AddMessage("Possible Commands: \"options\", \"reset\"", 0, 1, 1)
	end
end