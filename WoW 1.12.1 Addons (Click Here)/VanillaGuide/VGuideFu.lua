--[[--------------------------------------------------
----- VanillaGuide -----
------------------
VGuideFu.lua
Authors: mrmr
Version: 1.03.1
------------------------------------------------------
Description: 
      Fubar plugin for VGuide
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

if not VGuide then
	return
end

if not IsAddOnLoaded("Fubar") then
	return
end

local tablet = AceLibrary("Tablet-2.0")

VGuideFu = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0")
VGuideFu.hasIcon = "Interface\\AddOns\\VanillaGuide\\Textures\\FuBar_Icon"
-- using an AceOptions data table
VGuideFu.OnMenuRequest = {
    type = 'group',
    args = {
		titletoggle = {
			order = 1,
		    type = "toggle",
            name = "Show Title",
            desc = "Click to Toggle Title Visibility",
            get = "IsTitle",
            set = "ToggleTitle",
		},
		guidenametoggle = {
			order = 2,
            type = "toggle",
            name = "Show Guide Name",
            desc = "Click to Toggle Guide Name Visibility",
            get = "IsGuideName",
            set = "ToggleGuideName",
        },
		guidesteptoggle = {
			order = 3,
            type = "toggle",
            name = "Show Guide Step",
            desc = "Click to Toggle Guide Step Visibility",
            get = "IsGuideStep",
            set = "ToggleGuideStep",
        },
		lablestoggle = {
			order = 4,
		    type = "toggle",
            name = "Show Labels",
            desc = "Click to Toggle Labels Visibility",
            get = "IsLabels",
            set = "ToggleLabels",
		},		
    }
}

function VGuideFu:OnInitialize()
	--self:RegisterDB("BugSackDB")
	--self.hasIcon = true
	--self.optionsTable = BugSack:ReturnOptionsTable()
	
	self.title = "VanillaGuide"
	self.hasIcon = "Interface\\AddOns\\VanillaGuide\\Textures\\FuBar_Icon.tga"
	self.cannotHideText = true
	self.overrideMenu = false
	self.hideMenuTitle  = true
	self.defaultPosition = "RIGHT"
	self.defaultMinimapPosition = 180
	self.independentProfile = false

end

function VGuideFu:OnEnable()
	self.GuideID = nil
	self.GuideName = nil
	self.GuideStep = nil
	self.GuideStepLabel = nil

	self:ShowIcon()
	self:SetIcon(true)
	--self:Update()
end

--[[
VGuideFu.title = "VanillaGuide"
VGuideFu.hasIcon = "Interface\\AddOns\\VanillaGuide\\Textures\\minimap-button-red-up.tga"
VGuideFu.cannotHideText = true
VGuideFu.overrideMenu = false
VGuideFu.hideMenuTitle  = true
VGuideFu.defaultPosition = "RIGHT"
VGuideFu.defaultMinimapPosition = 180
VGuideFu.independentProfile = false

VGuideFu.GuideID = nil
VGuideFu.GuideName = nil
VGuideFu.GuideStep = nil
VGuideFu.GuideStepLabel = nil

VGuideFu:ShowIcon()
]]

function VGuideFu:IsTitle()
	return VGuide.db.char.VGuideFu.ShowTitle
end

function VGuideFu:ToggleTitle()
	VGuide.db.char.VGuideFu.ShowTitle = not VGuide.db.char.VGuideFu.ShowTitle
	self:UpdateText()
end

function VGuideFu:IsGuideName()
	return VGuide.db.char.VGuideFu.ShowGuideName
end

function VGuideFu:ToggleGuideName()
    VGuide.db.char.VGuideFu.ShowGuideName = not VGuide.db.char.VGuideFu.ShowGuideName
	self:UpdateText()
end

function VGuideFu:IsGuideStep()
	return VGuide.db.char.VGuideFu.ShowGuideStep
end

function VGuideFu:ToggleGuideStep()
    VGuide.db.char.VGuideFu.ShowGuideStep = not VGuide.db.char.VGuideFu.ShowGuideStep
	self:UpdateText()
end

function VGuideFu:IsLabels()
	return VGuide.db.char.VGuideFu.ShowLabels
end

function VGuideFu:ToggleLabels()
	VGuide.db.char.VGuideFu.ShowLabels = not VGuide.db.char.VGuideFu.ShowLabels
	self:UpdateText()
end

function VGuideFu:OnDataUpdate()
    self.GuideID = VGuide.db.char.GuideValues.GuideID
	self.GuideName = VGuideSteps[self.GuideID].n
	self.GuideStep = VGuide.db.char.GuideValues.Step
	self.GuideStepLabel = VGuideSteps[self.GuideID].items[self.GuideStep].str
end

function VGuideFu:OnTextUpdate()
	local guideLabel = self.GuideName or ""
	local step = self.GuideStep or ""
	local textTitle = "|c00FFFF00VGuide"
	local textGuideNameLabel = "|c0000FF00Guide:"
	local textGuideStepLabel = "|c0000FF00Step:"
	local whiteTextColor = "|c00FFFFFF"
	local text = ""
	if not self:IsLabels() then
		textGuideNameLabel = ""
		textGuideStepLabel = ""
	end
	
	if self:IsTitle() then
		text = text .. textTitle
	end
	if self:IsGuideName() then
		if self:IsTitle() then
			text = text .. " - "
		end
		text = text .. textGuideNameLabel .. whiteTextColor .. guideLabel
	end
	if self:IsGuideStep() then
		if self:IsGuideName() or self:IsTitle() then
			text = text .. " - "
		end
		text = text .. textGuideStepLabel .. whiteTextColor .. step
	end
	
	self:SetText(text)
end

function VGuideFu:OnTooltipUpdate()
	tablet:SetHint("Click to Toggle VGuide's Frame")
    -- as a rule, if you have an OnClick or OnDoubleClick or OnMouseUp or OnMouseDown, you should set a hint. 
	local cat = tablet:AddCategory(
        "text", "Guide",
        "columns", 1,
        "child_textR", 1,
        "child_textG", 1,
        "child_textB", 0
    )
    cat:AddLine(
        "text", "|c00FFFF00" .. tostring(self.GuideName) .. "|r"
    )
	cat = tablet:AddCategory(
        "text", "Step Label",
		"columns", 1,
        "child_textR", 1,
        "child_textG", 1,
        "child_textB", 1
	)
	cat:AddLine(
        "text", tostring(self.GuideStepLabel)
	)
end

function VGuideFu:OnClick()
    local frame = getglobal("VG_MainFrame")
	local fSettings = getglobal("VG_SettingsFrame")
    if frame:IsVisible() then
        frame:Hide()
		if fSettings:IsVisible() then
			fSettings.showthis = true
			fSettings:Hide()
		end
    else
        frame:Show()
		if fSettings.showthis then
			fSettings:Show()
		end
    end
end
