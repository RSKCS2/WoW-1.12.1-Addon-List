local tablet = TabletLib:GetInstance('1.0')
local dewdrop = DewdropLib:GetInstance('1.0')
local metro = Metrognome:GetInstance('1')

ReagentFu = FuBarPlugin:GetInstance("1.2"):new({
	name          = ReagentFuLocals.NAME,
	description   = ReagentFuLocals.DESCRIPTION,
	version       = "1.2.2",
	releaseDate   = "2006-07-01",
	aceCompatible = 103,
	fuCompatible  = 102,
	author        = "drathos",
	email         = "drathos@gmail.com",
	website       = "http://wowinterface.com/",
	category      = "inventory",
	db            = AceDatabase:new("ReagentFuDB"),
	defaults      = {
		showShortNames = false,
	},
	charDefaults  = {
		showReagent = {},
	},
	cmd           = AceChatCmd:new(ReagentFuLocals.COMMANDS, ReagentFuLocals.CMD_OPTIONS),
	loc           = ReagentFuLocals,
	hasIcon       = "Interface\\Icons\\INV_Misc_Book_09",
--	profileCode	  = true,
})

	-- Methods
function ReagentFu:IsShowingShortNames()
	return self.data.showShortNames
end

function ReagentFu:ToggleShowingShortNames(loud)
	self.data.showShortNames = not self.data.showShortNames
	if loud then
		self.cmd:status(self.loc.ARGUMENT_SHORT, self.data.showShortNames and 1 or 0, FuBarLocals.MAP_ONOFF)
	end
	self:Update()
	return self.data.showShortNames
end

function ReagentFu:IsFiltering(reagent)
	return self.charData.showReagent[reagent] == 'y'
end

function ReagentFu:ToggleFiltering(reagent)
	if self.charData.showReagent[reagent] == 'y' then
		self.charData.showReagent[reagent] = 'n'
	else
		self.charData.showReagent[reagent] = 'y'
	end
	self:Update()
	return self.charData.showReagent[reagent]
end

function ReagentFu:Initialize()
	_,self.char_class = UnitClass("player")
	if self:TCount(self.charData.showReagent) == 0 then
		if self.char_class == "DRUID" then
			self.charData.showReagent[self.loc.REAGENT_WILDBERRY] = 'y'
			self.charData.showReagent[self.loc.REAGENT_THORNROOT] = 'y'
			self.charData.showReagent[self.loc.REAGENT_MAPLE_SEED] = 'y'
			self.charData.showReagent[self.loc.REAGENT_STRANGLE_SEED] = 'y'
			self.charData.showReagent[self.loc.REAGENT_ASH_SEED] = 'y'
			self.charData.showReagent[self.loc.REAGENT_HORN_SEED] = 'y'
			self.charData.showReagent[self.loc.REAGENT_IRON_SEED] = 'y'
		elseif self.char_class == "MAGE" then
			self.charData.showReagent[self.loc.REAGENT_ARCANE_POWDER] = 'y'
			self.charData.showReagent[self.loc.REAGENT_RUNE_TELEPORT] = 'y'
			self.charData.showReagent[self.loc.REAGENT_RUNE_PORTAL] = 'y'
			self.charData.showReagent[self.loc.REAGENT_LIGHT_FEATHER] = 'y'
		elseif self.char_class == "PALADIN" then
			self.charData.showReagent[self.loc.REAGENT_SYMBOL_DIVINITY] = 'y'
			self.charData.showReagent[self.loc.REAGENT_SYMBOL_KINGS] = 'y'
		elseif self.char_class == "PRIEST" then
			self.charData.showReagent[self.loc.REAGENT_HOLY_CANDLE] = 'y'
			self.charData.showReagent[self.loc.REAGENT_SACRED_CANDLE] = 'y'
			self.charData.showReagent[self.loc.REAGENT_LIGHT_FEATHER] = 'y'
		elseif self.char_class == "ROGUE" then
			self.charData.showReagent[self.loc.REAGENT_FLASH] = 'y'
			self.charData.showReagent[self.loc.REAGENT_BLIND] = 'y'
		    self.charData.showReagent[self.loc.REAGENT_THISTLE] = 'y'
		    self.charData.showReagent[self.loc.REAGENT_POISON_INSTANT] = 'y'
		    self.charData.showReagent[self.loc.REAGENT_POISON_DEADLY] = 'y'
		    self.charData.showReagent[self.loc.REAGENT_POISON_CRIPPLING] = 'y'
		    self.charData.showReagent[self.loc.REAGENT_POISON_MINDNUMB] = 'y'
		    self.charData.showReagent[self.loc.REAGENT_POISON_WOUND] = 'y'
		elseif self.char_class == "SHAMAN" then
			self.charData.showReagent[self.loc.REAGENT_ANKH] = 'y'
			self.charData.showReagent[self.loc.REAGENT_FISHSCALES] = 'y'
			self.charData.showReagent[self.loc.REAGENT_FISHOIL] = 'y'
		elseif self.char_class == "WARLOCK" then
			self.charData.showReagent[self.loc.REAGENT_SOULSHARD] = 'y'
			self.charData.showReagent[self.loc.REAGENT_HEALTHSTONE] = 'y'
		    self.charData.showReagent[self.loc.REAGENT_SOULSTONE] = 'y'
		    self.charData.showReagent[self.loc.REAGENT_SPELLSTONE] = 'y'
		    self.charData.showReagent[self.loc.REAGENT_FIRESTONE] = 'y'
		else
			self:Hide()
		end
	end
	self.countValues = {}
	self.timeSinceLastUpdate = 0
end

function ReagentFu:Enable()
	if (self.char_class == "DRUID") then
		self:SetIcon("Interface\\Icons\\INV_Misc_Branch_01")
	elseif (self.char_class == "MAGE") then
		self:SetIcon("Interface\\Icons\\INV_Misc_Dust_01")
	elseif (self.char_class == "PALADIN") then
		self:SetIcon("Interface\\Icons\\INV_Stone_WeightStone_05")
	elseif (self.char_class == "PRIEST") then
		self:SetIcon("Interface\\Icons\\INV_Misc_Candle_03")
	elseif (self.char_class == "ROGUE") then
		self:SetIcon("Interface\\Icons\\INV_Misc_Powder_Purple")
	elseif (self.char_class == "SHAMAN") then
		self:SetIcon("Interface\\Icons\\INV_Jewelry_Talisman_06")
	elseif (self.char_class == "WARLOCK") then
		self:SetIcon("Interface\\Icons\\INV_Misc_Gem_Amethyst_02")
	else
		self:SetIcon("Interface\\Icons\\INV_Misc_Book_09")
	end
	self:RegisterEvent("UNIT_MODEL_CHANGED", "OnUnitModelChanged")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "OnPlayerEnteringWorld")
	self:RegisterEvent("PLAYER_LEAVING_WORLD", "OnPlayerLeavingWorld")
	self:RegisterEvent("BAG_UPDATE", "OnBagUpdate")
	self:RegisterEvent("ITEM_LOCK_CHANGED", "OnItemLockChanged")
	metro:Register(self.name, self.OnUpdate, 1, self)
end

function ReagentFu:Disable()
	metro:Unregister(self.name)
end

function ReagentFu:Report()
	self.cmd:report({
		{text=self.loc.ARGUMENT_SHORT, val=(self:IsShowingShortNames() and 1 or 0), map=FuBarLocals.MAP_ONOFF},
	})
end

function ReagentFu:MenuSettings(level, value)
	if level == 1 then
		dewdrop:AddLine(
			'text', self.loc.MENU_SHOW_SHORT_NAMES,
			'arg1', self,
			'func', "ToggleShowingShortNames",
			'checked', self:IsShowingShortNames(),
			'closeWhenClicked', true
		)
		
		dewdrop:AddLine()

		dewdrop:AddLine(
			'text', self.loc.MENU_FILTER,
			'hasArrow', true,
			'value', "filter"
		)
	elseif level == 2 then
		if value == "filter" then
			for reagent, t in pairs(self.charData.showReagent) do
				dewdrop:AddLine(
					'text', reagent,
					'arg1', self,
					'func', "ToggleFiltering",
					'arg2', reagent,
					'checked', self:IsFiltering(reagent)
				)
			end
		end
	end
end

function ReagentFu:OnPlayerEnteringWorld()
	self:RegisterEvent("BAG_UPDATE", "OnBagUpdate")
	self:RegisterEvent("ITEM_LOCK_CHANGED", "OnItemLockChanged")
end

function ReagentFu:OnPlayerLeavingWorld()
	self:UnregisterEvent("BAG_UPDATE")
	self:UnregisterEvent("ITEM_LOCK_CHANGED")
end

function ReagentFu:OnBagUpdate()
	self:Update()
end

function ReagentFu:OnItemLockChanged()
	metro:Start(self.name)
end

function ReagentFu:OnUnitModelChanged()
	self:Update()
end

function ReagentFu:OnUpdate(t)
	metro:Stop(self.name)
	self:Update()
end

function ReagentFu:UpdateData()
	if (self.char_class == "DRUID") then
		local wildberry,thornroot,maple,strangle,ash,horn,iron = self:GetDruidCount();
		self.countValues[1] = { wildberry, 20, self.loc.REAGENT_SH_WILDBERRY, self.loc.REAGENT_WILDBERRY }
		self.countValues[2] = { thornroot, 20, self.loc.REAGENT_SH_THORNROOT, self.loc.REAGENT_THORNROOT }
		self.countValues[3] = { maple, 20, self.loc.REAGENT_SH_MAPLE_SEED, self.loc.REAGENT_MAPLE_SEED }
		self.countValues[4] = { strangle, 20, self.loc.REAGENT_SH_STRANGLE_SEED, self.loc.REAGENT_STRANGLE_SEED }
		self.countValues[5] = { ash, 20, self.loc.REAGENT_SH_ASH_SEED, self.loc.REAGENT_ASH_SEED }
		self.countValues[6] = { horn, 20, self.loc.REAGENT_SH_HORN_SEED, self.loc.REAGENT_HORN_SEED }
		self.countValues[7] = { iron, 20, self.loc.REAGENT_SH_IRON_SEED, self.loc.REAGENT_IRON_SEED }
	elseif (self.char_class == "MAGE") then
		local powder,teleport,portal,feather = self:GetMageCount();
		self.countValues[1] = { powder, 20, self.loc.REAGENT_SH_ARCANE_POWDER, self.loc.REAGENT_ARCANE_POWDER }
		self.countValues[2] = { teleport, 10, self.loc.REAGENT_SH_RUNE_TELEPORT, self.loc.REAGENT_RUNE_TELEPORT }
		self.countValues[3] = { portal, 10, self.loc.REAGENT_SH_RUNE_PORTAL, self.loc.REAGENT_RUNE_PORTAL }
		self.countValues[4] = { feather, 20, self.loc.REAGENT_SH_LIGHT_FEATHER, self.loc.REAGENT_LIGHT_FEATHER }
	elseif (self.char_class == "PALADIN") then
		local divinity,kings = self:GetPallyCount();
		self.countValues[1] = { divinity, 20, self.loc.REAGENT_SH_SYMBOL_DIVINITY, self.loc.REAGENT_SYMBOL_DIVINITY }
		self.countValues[2] = { kings, 20, self.loc.REAGENT_SH_SYMBOL_KINGS, self.loc.REAGENT_SYMBOL_KINGS }
	elseif (self.char_class == "PRIEST") then
		local holy,sacred,feather = self:GetPriestCount();
		self.countValues[1] = { holy, 20, self.loc.REAGENT_SH_HOLY_CANDLE, self.loc.REAGENT_HOLY_CANDLE }
		self.countValues[2] = { sacred, 20, self.loc.REAGENT_SH_SACRED_CANDLE, self.loc.REAGENT_SACRED_CANDLE }
		self.countValues[3] = { feather, 20, self.loc.REAGENT_LIGHT_FEATHER, self.loc.REAGENT_LIGHT_FEATHER }
	elseif (self.char_class == "ROGUE") then
		local flash,blind,thistle,instant,deadly,crippling,mindnumb,wound = self:GetRogueCount();
		self.countValues[1] = { flash, 10, self.loc.REAGENT_SH_FLASH, self.loc.REAGENT_FLASH }
		self.countValues[2] = { blind, 20, self.loc.REAGENT_SH_BLIND, self.loc.REAGENT_BLIND }
		self.countValues[3] = { thistle, 10, self.loc.REAGENT_SH_THISTLE, self.loc.REAGENT_THISTLE }
		self.countValues[4] = { instant, 10, self.loc.REAGENT_SH_POISON, self.loc.REAGENT_POISON_INSTANT }
		self.countValues[5] = { deadly, 10, self.loc.REAGENT_SH_POISON, self.loc.REAGENT_POISON_DEADLY }
		self.countValues[6] = { crippling, 10, self.loc.REAGENT_SH_POISON, self.loc.REAGENT_POISON_CRIPPLING }
		self.countValues[7] = { mindnumb, 10, self.loc.REAGENT_SH_POISON, self.loc.REAGENT_POISON_MINDNUMB }
		self.countValues[8] = { wound, 10, self.loc.REAGENT_SH_POISON, self.loc.REAGENT_POISON_WOUND }
	elseif (self.char_class == "SHAMAN") then
		local ankh,scales,fishoil = self:GetShamanCount();
		self.countValues[1] = { ankh, 5, self.loc.REAGENT_SH_ANKH, self.loc.REAGENT_ANKH }
		self.countValues[2] = { scales, 20, self.loc.REAGENT_SH_FISHSCALES, self.loc.REAGENT_FISHSCALES }
		self.countValues[3] = { fishoil, 20, self.loc.REAGENT_SH_FISHOIL, self.loc.REAGENT_FISHOIL }
	elseif (self.char_class == "WARLOCK") then
		local shard,soulstone,firestone,healthstone,spellstone = self:GetLockCount();
		self.countValues[1] = { shard, 10, self.loc.REAGENT_SOULSHARD, self.loc.REAGENT_SOULSHARD }
		self.countValues[2] = { soulstone, 1, self.loc.REAGENT_SOULSTONE, self.loc.REAGENT_SOULSTONE }
		self.countValues[3] = { healthstone, 1, self.loc.REAGENT_HEALTHSTONE, self.loc.REAGENT_HEALTHSTONE }
		self.countValues[4] = { firestone, 1, self.loc.REAGENT_FIRESTONE, self.loc.REAGENT_FIRESTONE }
		self.countValues[5] = { spellstone, 1, self.loc.REAGENT_SPELLSTONE, self.loc.REAGENT_SPELLSTONE }
	end
end

function ReagentFu:UpdateText()
	local count_string = ""
	if not (self.char_class == "ROGUE") then
		for i, t in ipairs(self.countValues) do
			if self:IsFiltering(t[4]) then
				if not (count_string == "") then
					count_string = count_string.."/"
				end
				if self:IsShowingShortNames() then
					count_string = count_string..t[3]
				end
				count_string = count_string..format("|cff%s%d|r", FuBarUtils.GetThresholdHexColor(t[1] / t[2]), t[1])
			end
		end
	else
		local flash = self.countValues[1]
		local blind = self.countValues[2]
		local thistle = self.countValues[3]
		local instant = self.countValues[4]
		local deadly = self.countValues[5]
		local crippling = self.countValues[6]
		local mindnumb = self.countValues[7]
		local wound = self.countValues[8]
		if self:IsFiltering(flash[4]) then
			if not (count_string == "") then
				count_string = count_string.."/"
			end
			if self:IsShowingShortNames() then
				count_string = count_string..flash[3]
			end
			count_string = count_string..format("|cff%s%d|r", FuBarUtils.GetThresholdHexColor(flash[1] / flash[2]), flash[1])
		end
		if self:IsFiltering(blind[4]) then
			if not (count_string == "") then
				count_string = count_string.."/"
			end
			if self:IsShowingShortNames() then
				count_string = count_string..blind[3]
			end
			count_string = count_string..format("|cff%s%d|r", FuBarUtils.GetThresholdHexColor(blind[1] / blind[2]), blind[1])
		end
		if self:IsFiltering(thistle[4]) then
			if not (count_string == "") then
				count_string = count_string.."/"
			end
			if self:IsShowingShortNames() then
				count_string = count_string..thistle[3]
			end
			count_string = count_string..format("|cff%s%d|r", FuBarUtils.GetThresholdHexColor(thistle[1] / thistle[2]), thistle[1])
		end
		if (self:IsFiltering(self.loc.REAGENT_POISON_INSTANT) or self:IsFiltering(self.loc.REAGENT_POISON_DEADLY) or
				self:IsFiltering(self.loc.REAGENT_POISON_CRIPPLING) or self:IsFiltering(self.loc.REAGENT_POISON_MINDNUMB) or
				self:IsFiltering(self.loc.REAGENT_POISON_WOUND)) then
			local poisons = 0;
			if self:IsFiltering(self.loc.REAGENT_POISON_INSTANT) then
				poisons = poisons + instant[1]
			end
			if self:IsFiltering(self.loc.REAGENT_POISON_DEADLY) then
				poisons = poisons + deadly[1]
			end
			if self:IsFiltering(self.loc.REAGENT_POISON_CRIPPLING) then
				poisons = poisons + crippling[1]
			end
			if self:IsFiltering(self.loc.REAGENT_POISON_MINDNUMB) then
				poisons = poisons + mindnumb[1]
			end
			if self:IsFiltering(self.loc.REAGENT_POISON_WOUND) then
				poisons = poisons + wound[1]
			end
			if not (count_string == "") then
				count_string = count_string.."/"
			end
			if self:IsShowingShortNames() then
				count_string = count_string..self.loc.REAGENT_SH_POISON
			end
			count_string = count_string..format("|cff%s%d|r", FuBarUtils.GetThresholdHexColor(poisons / 10), poisons)
		end
	end
	
	self:SetText(count_string)
end

function ReagentFu:UpdateTooltip()
	local cat = tablet:AddCategory('columns', 2, 'child_textR', 0, 'child_textG', 1, 'child_textB', 0)
	local r, g, b
	local lines_added = false
	for i, t in ipairs(self.countValues) do
		if self:IsFiltering(t[4]) then
			r, g, b = FuBarUtils.GetThresholdColor(t[1] / t[2])
			cat:AddLine('text',t[4]..":", 'text2', t[1], 'text2R', r, 'text2G', g, 'text2B', b)
			lines_added = true
		end
	end
	if lines_added == false then
		cat:AddLine('text', self.loc.REAGENT_NONE_TO_TRACK)
	end
end

function ReagentFu:GetMageCount()
	local powder = 0;
	local teleport = 0;
	local portal = 0;
	local feather = 0;
	for bag = 4, 0, -1 do
		local size = GetContainerNumSlots(bag);
		if (size > 0) then
			for slot = 1, size, 1 do
				local _,itemCount = GetContainerItemInfo(bag, slot);
				if (itemCount) then
					local itemName = self:NameFromLink(GetContainerItemLink(bag, slot));
					if ((itemName) and (itemName ~= "")) then
						if (itemName == self.loc.REAGENT_ARCANE_POWDER) then
							powder = powder + itemCount;
						elseif (itemName == self.loc.REAGENT_RUNE_TELEPORT) then
							teleport = teleport + itemCount;
						elseif (itemName == self.loc.REAGENT_RUNE_PORTAL) then
							portal = portal + itemCount;
						elseif (itemName == self.loc.REAGENT_LIGHT_FEATHER) then
							feather = feather + itemCount;
						end
					end
				end
			end
		end
	end
	return powder,teleport,portal,feather
end

function ReagentFu:GetRogueCount()
	local flash = 0
	local blind = 0
	local thistle = 0
	local instant = 0
	local deadly = 0
	local crippling = 0
	local mindnumb = 0
	local wound = 0
	for bag = 4, 0, -1 do
		local size = GetContainerNumSlots(bag);
		if (size > 0) then
			for slot=1, size, 1 do
				local _,itemCount = GetContainerItemInfo(bag, slot);
				if (itemCount) then
					local itemName = self:NameFromLink(GetContainerItemLink(bag, slot));	
					if  ((itemName) and (itemName ~= "")) then
						if (itemName == self.loc.REAGENT_FLASH) then
							flash  = flash + itemCount;
						elseif (itemName == self.loc.REAGENT_BLIND) then
							blind  = blind + itemCount;
						elseif (itemName == self.loc.REAGENT_THISTLE) then
							thistle  = thistle + itemCount;
						elseif (string.find(itemName,self.loc.REAGENT_POISON_INSTANT,1,true)) then
							instant  = instant + itemCount;
						elseif (string.find(itemName,self.loc.REAGENT_POISON_DEADLY,1,true)) then
							deadly  = deadly + itemCount;
						elseif (string.find(itemName,self.loc.REAGENT_POISON_CRIPPLING,1,true)) then
							crippling  = crippling + itemCount;
						elseif (string.find(itemName,self.loc.REAGENT_POISON_MINDNUMB,1,true)) then
							mindnumb  = mindnumb + itemCount;
						elseif (string.find(itemName,self.loc.REAGENT_POISON_WOUND,1,true)) then
							wound  = wound + itemCount;
						end
					end
				end            
			end
		end
	end
	return flash,blind,thistle,instant,deadly,crippling,mindnumb,wound
end

function ReagentFu:GetLockCount()
	local shard = 0
	local soulstone = 0
	local firestone = 0
	local healthstone = 0
	local spellstone = 0
	for bag = 4, 0, -1 do
		local size = GetContainerNumSlots(bag);
		if (size > 0) then
			for slot=1, size, 1 do
				local _,itemCount = GetContainerItemInfo(bag, slot);
				if (itemCount) then
					local itemName = self:NameFromLink(GetContainerItemLink(bag, slot));	
					if  ((itemName) and (itemName ~= "")) then
						if (itemName == self.loc.REAGENT_SOULSHARD) then
							shard  = shard + itemCount;
						elseif (string.find(itemName,self.loc.REAGENT_SOULSTONE,1,true)) then
							soulstone  = soulstone + itemCount;
						elseif (string.find(itemName,self.loc.REAGENT_FIRESTONE,1,true)) then
							firestone  = firestone + itemCount;
						elseif (string.find(itemName,self.loc.REAGENT_HEALTHSTONE,1,true)) then
							healthstone  = healthstone + itemCount;
						elseif (string.find(itemName,self.loc.REAGENT_SPELLSTONE,1,true)) then
							spellstone  = spellstone + itemCount;
						end
					end
				end
			end            
		end
	end	
	return shard,soulstone,firestone,healthstone,spellstone
end

function ReagentFu:GetShamanCount()
	local ankh = 0
	local scales = 0
	local fishoil = 0
	for bag = 4, 0, -1 do
		local size = GetContainerNumSlots(bag);
		if (size > 0) then
			for slot=1, size, 1 do
				local _,itemCount = GetContainerItemInfo(bag, slot);
				if (itemCount) then
					local itemName = self:NameFromLink(GetContainerItemLink(bag, slot));	
					if  ((itemName) and (itemName ~= "")) then
						if (itemName == self.loc.REAGENT_ANKH) then
							ankh  = ankh + itemCount;
						elseif (itemName == self.loc.REAGENT_FISHSCALES) then
							scales = scales + itemCount;
						elseif (itemName == self.loc.REAGENT_FISHOIL) then
							fishoil  = fishoil + itemCount;
						end
					end
				end
			end            
		end
	end	
	return ankh,scales,fishoil
end

function ReagentFu:GetPallyCount()
	local divinity = 0
	local kings = 0
	for bag = 4, 0, -1 do
		local size = GetContainerNumSlots(bag);
		if (size > 0) then
			for slot=1, size, 1 do
				local _,itemCount = GetContainerItemInfo(bag, slot);
				if (itemCount) then
					local itemName = self:NameFromLink(GetContainerItemLink(bag, slot));
					if ((itemName) and (itemName ~= "")) then
						if (itemName == self.loc.REAGENT_SYMBOL_DIVINITY) then
							divinity  = divinity + itemCount;
						elseif (itemName == self.loc.REAGENT_SYMBOL_KINGS) then
							kings = kings + itemCount;
						end
					end
				end
			end            
		end
	end	
	return divinity,kings
end

function ReagentFu:GetPriestCount()
	local holy = 0;
	local sacred = 0;
	local feather = 0;
	for bag = 4, 0, -1 do
		local size = GetContainerNumSlots(bag);
		if (size > 0) then
			for slot=1, size, 1 do
				local _,itemCount = GetContainerItemInfo(bag, slot);
				if (itemCount) then
					local itemName = self:NameFromLink(GetContainerItemLink(bag, slot));	
					if  ((itemName) and (itemName ~= "")) then
						if (itemName == self.loc.REAGENT_HOLY_CANDLE) then
							holy = holy + itemCount;
						elseif (itemName == self.loc.REAGENT_SACRED_CANDLE) then
							sacred = sacred + itemCount;
						elseif (itemName == self.loc.REAGENT_LIGHT_FEATHER) then
							feather = feather + itemCount;
						end
					end
				end
			end   
		end
	end	
	return holy,sacred,feather
end

function ReagentFu:GetDruidCount()
	local wildberry = 0;
	local thornroot = 0;
	local maple = 0;
	local strangle = 0;
	local ash = 0;
	local horn = 0;
	local iron = 0;
	for bag = 4, 0, -1 do
		local size = GetContainerNumSlots(bag);
		if (size > 0) then
			for slot=1, size, 1 do
				local _,itemCount = GetContainerItemInfo(bag, slot);
				if (itemCount) then
					local itemName = self:NameFromLink(GetContainerItemLink(bag, slot));	
					if  ((itemName) and (itemName ~= "")) then
						if (itemName == self.loc.REAGENT_WILDBERRY) then
							wildberry = wildberry + itemCount;
						elseif (itemName == self.loc.REAGENT_THORNROOT) then
							thornroot = thornroot + itemCount;
						elseif (itemName == self.loc.REAGENT_MAPLE_SEED) then
							maple = maple + itemCount;
						elseif (itemName == self.loc.REAGENT_STRANGLE_SEED) then
							strangle = strangle + itemCount;
						elseif (itemName == self.loc.REAGENT_ASH_SEED) then
							ash = ash + itemCount;
						elseif (itemName == self.loc.REAGENT_HORN_SEED) then
							horn = horn + itemCount;
						elseif (itemName == self.loc.REAGENT_IRON_SEED) then
							iron = iron + itemCount;
						end
					end
				end
			end            
		end
	end	
	return wildberry,thornroot,maple,strangle,ash,horn,iron
end

function ReagentFu:NameFromLink(link)
	if (link) then
		return GetItemInfo(tonumber(string.gsub(link, "|cff%x%x%x%x%x%x|Hitem:(%d+):%d+:%d+:%d+|h.*", "%1") or 0))
	end
end

function ReagentFu:TCount(tab)
	local n=0;
	for _ in pairs(tab) do
		n=n+1;
	end
	return n;
end

ReagentFu:RegisterForLoad()
