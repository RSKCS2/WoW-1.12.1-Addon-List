--[[--------------------------------------------------
----- VanillaGuide -----
------------------
Display.lua
Authors: mrmr
Version: 1.03.1
------------------------------------------------------
Description: 
      This File handles the QuestDB and Display infos
    1.00
  -- Initial Ace2 release
	1.99a
  -- Ally addition starter version
	1.99b
  -- Added more controls, to decide the right "starting" guide ID to use
    1.03
  -- No Changes. Just adjusting "version".
     1.99x for a beta release was a weird choise.
------------------------------------------------------
Connection:
--]]--------------------------------------------------

local VGuide = VGuide

Display = {}


function Display:new(tData, tCharInfo, tGuideValues)
	local self = {}

	self.tData = tData
	
	if tCharInfo.Faction == "Unknown" then
		tCharInfo.Faction = UnitFaction("player")
	end
	if tCharInfo.Race == "Unknown" then
		tCharInfo.Race = UnitRace("player")
	end
	
	if tCharInfo.Faction == "Horde" then
		if tCharInfo.Race == "Troll" or tCharInfo.Race == "Orc" then
			tData[1].nID = 11
		elseif tCharInfo.Race == "Tauren" then
			tData[1].nID = 14
		elseif tCharInfo.Race == "Undead" then
			tData[1].nID = 17
		end
	else
		if tCharInfo.Race == "Gnome" or tCharInfo.Race == "Dwarf" then
			tData[1].nID = 13
		elseif tCharInfo.Race == "Human" then
			tData[1].nID = 15
		elseif tCharInfo.Race == "Night Elf" then
			tData[1].nID = 11
		end
	end
	
	self.Step = tGuideValues.Step
	
	self.CurrGID = tGuideValues.GuideID
	self.PrevGID = tData[self.CurrGID].pID
	self.NextGID = tData[self.CurrGID].nID
	
	self.CurrCount = tData[self.CurrGID].itemCount
	self.PrevCount = tData[self.PrevGID].itemCount
	self.NextCount = tData[self.NextGID].itemCount
  
	self.DropDownMenuLabel = tData[self.CurrGID].n
	self.ScrollFrameCurrEntry = {}
	self.StepInfo = {}

    self.Update = function(self, tData, nGID)
		local CurrGID = nGID
		local PrevGID = tData[CurrGID].pID
		local NextGID = tData[CurrGID].nID
		local CurrCount = tData[CurrGID].itemCount
		local PrevCount = tData[PrevGID].itemCount
		local NextCount = tData[NextGID].itemCount
    
		self.DropDownMenuLabel = tData[CurrGID].n
		
		self.CurrGID = CurrGID
		self.PrevGID = PrevGID
		self.NextGID = NextGID
		
		self.CurrCount = CurrCount
		self.PrevCount = PrevCount
		self.NextCount = NextCount
	  
		self.ScrollFrameCurrEntry = {}
		self.StepInfo = {}
		for i = 1, CurrCount do
			self.ScrollFrameCurrEntry[i] = tData[CurrGID].items[i].str
			self.StepInfo[i] = {
				x = tData[CurrGID].items[i].x,
				y = tData[CurrGID].items[i].y,
				zone = tData[CurrGID].items[i].zone,
			}
		end
	end
	
	self.Update2 = function(self, tData, nGID)
		local CurrGID = self:GetCurrGID()
		local PrevGID = self:GetPrevGID()
		local NextGID = self:GetNextGID()
		local CurrCount = self:GetCurrCount()
		local PrevCount = self:GetPrevCount()
		local NextCount = self:GetPrevCount()
    
		self:SetDropDownMenuLabel(tData[CurrGID].n)
		
		self:SetCurrGID(CurrGID)
		self:SetPrevGID(PrevID)
		self:SetNextGID(NextGID)
		self:SetCurrCount(CurrCount)
		self:SetPrevCount(PrevCount)
		self:SetNextCount(NextCount)
		self:SetScrollFrameCurrEntry(tData)
		self:SetStepInfo(tData)
	end
	
	self.Update3 = function(self, nGID)
		self.Update(self, self.tData, nGID)
	end

	self.GetCurrGID = function(self)
		return self.CurrGID
	end
	self.GetPrevGID = function(self)
		return self.PrevGID
	end
	self.GetNextGID = function(self)
		return self.NextGID
	end
	self.GetCurrCount = function(self)
		return self.CurrCount
	end
	self.GetPrevCount = function(self)
		return self.PrevCount
	end
	self.GetStep = function(self)
		return self.Step
	end
	self.GetScrollFrameCurrEntry = function(self)
		return self.ScrollFrameCurrEntry
	end
	self.GetDropDownMenuLabel = function(self)
		return self.DropDownMenuLabel
	end
	self.GetStepLabel = function(self)
		return self.ScrollFrameCurrEntry[self.Step]
	end
	self.GetStepInfo = function(self)
		return self.StepInfo[self.Step]
	end
	self.SetStep = function(self, nVal)
		self.Step = nVal
	end
	self.SetCurrGID = function(self, nVal)
		self.CurrGID = nVal
	end
	self.SetPrevGID = function(self, nVal)
		self.PrevGID = nVal
	end
	self.SetNextGID = function(self, nVal)
		self.NextGID = nVal
	end
	self.SetCurrCount = function(self, nVal)
		self.CurrCount = nVal
	end
	self.SetPrevCount = function(self, nVal)
		self.PrevCount = nVal
	end
	self.SetNextCount = function(self, nVal)
		self.NextCount = nVal
	end
	self.SetDropDownMenuLabel = function(self, sText)
		self.NextCount = sText
	end
	self.SetScrollFrameCurrEntry = function(self, tData)
		local CurrGID = self:GetCurrGID()
		local CurrCount = self:GetCurrCount()
		for i = 1, CurrCount do
		  self.ScrollFrameCurrEntry[i] = tData[CurrGID].items[i].str
		  self.StepInfo[i] = {
			  x = tData[CurrGID].items[i].x,
			  y = tData[CurrGID].items[i].y,
			  zone = tData[CurrGID].items[i].zone,
		  }
		end
	end
	self.SetStepInfo = function(self, tData)
		local CurrGID = self:GetCurrGID()
		local CurrCount = self:GetCurrCount()
		for i = 1, CurrCount do
			self.StepInfo[i] = {
			  x = tData[CurrGID].items[i].x,
			  y = tData[CurrGID].items[i].y,
			  zone = tData[CurrGID].items[i].zone,
			}
		end
	end
	
	--[[
	self:SetStep(tGuideValues.Step)
	self:SetCurrGID(tGuideValues.GuideID)
	self:SetPrevGID(tData[self.CurrGID].pID)
	self:SetNextGID(tData[self.CurrGID].nID)
	self:SetCurrCount(tData[self.CurrGID].itemCount)
	self:SetPrevCount(tData[self.PrevGID].itemCount)
	self:SetNextCount(tData[self.NextGID].itemCount)
	self:SetDropDownMenuLabel(tData[self.CurrGID].n)
	]]
	self:Update(VGuideSteps, self.CurrGID)
	--self:Update2(VGuideSteps, self.CurrGID)

	return self
end 

return VGuide