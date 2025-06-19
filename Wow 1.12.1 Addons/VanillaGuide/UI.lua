--[[--------------------------------------------------
----- VanillaGuide -----
------------------
UI.lua
Authors: mrmr
Version: 1.03.1
------------------------------------------------------
Description:
      All the "UI" related functions/object
      This is what we display for the user!
    1.00
  -- Initial Ace2 release
	1.99a
  -- Ally addition starter version
  	1.99b
  -- freeing some big table, for better memory usage
  -- little tweak to the AboutFrame
    1.03
  -- No Changes. Just adjusting "version".
     1.99x for a beta release was a weird choise.
-----------------------------------------------------
-----------------------------------------------------
Connection:
--]]--------------------------------------------------

-----------------
-- UI Constant --
-----------------
local VG_TEXTURES_DIR = "Interface\\AddOns\\VanillaGuide\\Textures\\"

local VG_BACKDROP_BACKGROUNDFILE = "Interface\\Tooltips\\UI-Tooltip-Background"
--local VG_BACKDROP_BACKGROUNDFILE = "Interface\\DialogFrame\\UI-DialogBox-Gold-Background"
--local VG_BACKDROP_EDGEFILE = VG_TEXTURES_DIR .. "Borders\\HalBorder"
--local VG_BACKDROP_EDGEFILE = VG_TEXTURES_DIR .. "Borders\\Roth"
local VG_BACKDROP_EDGEFILE = VG_TEXTURES_DIR .. "Borders\\fer1"
--local VG_BACKDROP_EDGEFILE = VG_TEXTURES_DIR .. "Borders\\fer6"
--local VG_BACKDROP_EDGEFILE = VG_TEXTURES_DIR .. "Borders\\fer7"
--local VG_BACKDROP_EDGEFILE = "Interface\\Tooltips\\UI-Tooltip-Border"

local VG_FONT = "GameFontNormalSmall"
local VG_FONT_PATH = "Fonts\\FRIZQT__.TTF"
local VG_FONT_HEIGHT = 9.5 -- DO NOT CHANGE THIS OR THE SCROLLFRAME WILL BE BORKED!

local VG_B_CLOSE = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-Close-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-Close-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-Close-Highlight"
}
local VG_B_ARROWDOWN = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-ArrowDown-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-ArrowDown-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-ArrowDown-Highlight"
}
local VG_B_ARROWUP = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-ArrowUp-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-ArrowUp-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-ArrowUp-Highlight"
}
local VG_B_DETAILS = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-Details-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-Details-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-Details-Highlight"
}
local VG_B_DOUBLEARROWLEFT = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-DoubleArrowLeft-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-DoubleArrowLeft-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-DoubleArrowLeft-Highlight"
}
local VG_B_DOUBLEARROWRIGHT = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-DoubleArrowRight-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-DoubleArrowRight-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-DoubleArrowRight-Highlight"
}
local VG_B_FLASH = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-Flash-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-Flash-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-Flash-Highlight"
}
local VG_B_LOCKED = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-Locked-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-Locked-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-Locked-Highlight"
}
local VG_B_UNLOCKED = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-Unlocked-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-Unlocked-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-Unlocked-Highlight"
}
local VG_B_OPTION = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-Option-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-Option-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-Option-Highlight"
}
local VG_B_ABOUT = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-About-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-About-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-About-Highlight"
}
local VG_B_DUMLEFT_UP = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-DUMonLeft-ArrowUp-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-DUMonLeft-ArrowUp-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-DUMonLeft-ArrowUp-Highlight"
}
local VG_B_DUMRIGHT_UP = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-DUMonRight-ArrowUp-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-DUMonRight-ArrowUp-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-DUMonRight-ArrowUp-Highlight"
}
local VG_B_DDMLEFT_DOWN = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-DDMonLeft-ArrowDown-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-DDMonLeft-ArrowDown-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-DDMonLeft-ArrowDown-Highlight"
}
local VG_B_DDMRIGHT_DOWN = {
  NORMAL    = VG_TEXTURES_DIR .. "Buttons\\Button-DDMonRight-ArrowDown-Normal",
  PUSHED    = VG_TEXTURES_DIR .. "Buttons\\Button-DDMonRight-ArrowDown-Pushed",
  HIGHLIGHT = VG_TEXTURES_DIR .. "Buttons\\Button-DDMonRight-ArrowDown-Highlight"
}

local VG_SCROLLFRAME_PADDING = 9
-----------------
-- UI Constant --
-----------------

local VGuide = VGuide

UI = {}
UI.__index = UI

local bd = {
    bgFile = VG_BACKDROP_BACKGROUNDFILE,
    edgeFile = VG_BACKDROP_EDGEFILE,
    edgeSize = 4,
    insets = { left = 1, right = 1, top = 1, bottom = 1 },
}

local bdsh = {
    bgFile = VG_BACKDROP_BACKGROUNDFILE,
    --edgeFile = VG_BACKDROP_EDGEFILE,
    --edgeSize = 4,
    insets = { left = -1, right = -2, top = -3, bottom = -3 },
}


-- UI.GuideChange
--    ARGUMENTS -
-- sMode: can be "Forward", "Backward" or "GID"
-- nGID: this is used only if sMode == "GID". Rappresent the new GID
--
local function GuideChange(oDisplay, sMode, nGID)
	local NewGID = nil
	local CurrGID = oDisplay:GetCurrGID()
	local PrevGID = oDisplay:GetPrevGID()
	local NextGID = oDisplay:GetNextGID()

	if sMode == "forward" or sMode == "Forward" or sMode == "FORWARD" then
		NewGID = NextGID
		if CurrGID == 514 then
			--oVGuide.tDisplay.nStep = 32
			oDisplay:SetStep(32)
		else
			--oVGuide.tDisplay.nStep = 2
			oDisplay:SetStep(2)
		end
	elseif sMode == "backward" or sMode == "Backward" or sMode == "BACKWARD" then
		NewGID = PrevGID
		if CurrGID == 1 or CurrGID == 11 or CurrGID == 14 or CurrGID == 17 then
			--oVGuide.tDisplay.nStep = 1
			oDisplay:SetStep(1)
		else
			--oVGuide.tDisplay.nStep = 2
			oDisplay:SetStep(2)
		end
	elseif sMode == "gid" or sMode == "Gid" or sMode == "GID" then
		if nGID then
			NewGID = nGID
			--if oVGuide.tDisplay.bUILoading then
			--	oVGuide.tDisplay.bUILoading = false
			--else
			if nGID == 1 then
				--oVGuide.tDisplay.nStep = 1
				oDisplay:SetStep(1)
			else
				--oVGuide.tDisplay.nStep = 2
				oDisplay:SetStep(2)
			end
			--end
		end
	end

	
	oDisplay:Update(VGuideSteps, NewGID)
	
	local fChild = getglobal("VG_MainFrame_ScrollFrameChild")
	local fSlider = getglobal("VG_MainFrame_ScrollFrameSlider")
	local step = oDisplay:GetStep()
	local stepCount = oDisplay:GetCurrCount()
	fChild.shEntryHandle = UI.SummonSimpleHTMLs(fChild, step, stepCount)
	--fChild.fsEntryHandle = UI.SummonFontStrings(fChild, stepCount)
	local w, h = UI.RefreshScrollFrame(oDisplay)
	fSlider:SetValue(0)
	UI.RefreshDropDownMenuLabel(oDisplay)
	UI.RefreshStepFrameLabel(oDisplay)
	UI.RefreshStepNumberFrameLabel(oDisplay)
	--VGuideFu:Update()
	--VGuideFu:UpdateDisplay()
	VGuide.db.char.GuideValues.Step = oDisplay:GetStep()
	VGuide.db.char.GuideValues.GuideID = oDisplay:GetCurrGID()
	if VGuideFu then
		VGuideFu:Update()
	end
end
-- UI.StepChange
--    ARGUMENTS -
-- sMode: can be "Forward", "Backward"
--
local function StepChange(oDisplay, sMode, nStep)
	local Step = oDisplay:GetStep()
	local CurrGID = oDisplay:GetCurrGID()
	local CurrCount = oDisplay:GetCurrCount()
	local PrevCount = oDisplay:GetPrevCount()

	if sMode == "forward" or sMode == "Forward" or sMode == "FORWARD" then
		Step = Step + 1
		if Step > CurrCount then
			if CurrGID < 514 then
				Step = 2
				GuideChange(oDisplay, "Forward")
			else
				Step = 32
			end
		end
		oDisplay:SetStep(Step)
		CurrGID = oDisplay:GetCurrGID()
	elseif sMode == "backward" or sMode == "Backward" or sMode == "BACKWARD" then
		Step = Step - 1
		if Step < 2 then
			if CurrGID > 1 then
				Step = PrevCount
				GuideChange(oDisplay, "Backward")
			else
				Step = 1
			end
		end
		oDisplay:SetStep(Step)
		CurrGID = oDisplay:GetCurrGID()
	elseif sMode == "step" or sMode == "Step" or sMode == "STEP" then
		if nStep then
			Step = nStep
			if Step <= CurrCount then
				oDisplay:SetStep(Step)
			end
		end
	end

	
	UI.RefreshDropDownMenuLabel(oDisplay)
	UI.RefreshStepFrameLabel(oDisplay)
	UI.RefreshStepNumberFrameLabel(oDisplay)

	VGuide.db.char.GuideValues.Step = oDisplay:GetStep()
	VGuide.db.char.GuideValues.GuideID = oDisplay:GetCurrGID()
	if VGuideFu then 
		VGuideFu:Update()
	end
	local StepInfo = oDisplay:GetStepInfo()
	
	return StepInfo.x, StepInfo.y, StepInfo.zone
end

-- Main Frame
-----------------
local function SummonMainFrame(tUIoptions, tGuideValues, oDisplay)
	local function Render_MF(fParent, sName)
		local bLocked = tUIoptions.Locked
		local tSize = tUIoptions.MainFrameSize
		local tAnch = tUIoptions.MainFrameAnchor
		local tColor = tUIoptions.MainFrameColor
		local frame = CreateFrame("Frame", sName, fParent)
		frame:ClearAllPoints()
		frame:SetPoint(tAnch.sFrom, UIParent, tAnch.sTo, tAnch.nX, tAnch.nY)
		frame:SetMinResize(320,320)
		frame:SetMaxResize(640,640)
		frame:SetWidth(tSize.nWidth)
		frame:SetHeight(tSize.nHeight)
		frame:SetMovable(true)
		frame:SetResizable(true)
		if bLocked then
			frame:SetMovable(false)
			frame:SetResizable(false)
		end
		frame:SetBackdrop(bd)
		frame:SetBackdropColor(tColor.nR, tColor.nG, tColor.nB, tColor.nA)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)
		frame:RegisterForDrag("LeftButton")
		frame:SetScript("OnMouseDown", function()
			local fStep = getglobal("VG_MainFrame_StepFrame")
			local fScroll = getglobal("VG_MainFrame_ScrollFrame")
			local StepFrame = tUIoptions.StepFrameVisible
			local ScrollFrame = tUIoptions.ScrollFrameVisible
			local bLocked = tUIoptions.Locked
			local x, y = GetCursorPosition()
			local s = this:GetEffectiveScale()
			x = x / s
			y = y / s
			local bottom = this:GetBottom();
			local top = this:GetTop();
			local left = this:GetLeft();
			local right = this:GetRight();

			local bottomStep = fStep:GetBottom()
			local topScroll = fScroll:GetTop()
			
			if arg1 == "LeftButton" and not this.isMoving and not this.isResizing and not bLocked then
				if (x < left + 5 and y < bottom + 5) then
					this:StartSizing("BOTTOMLEFT")
					this.isResizing = true
				elseif (x < left + 5 and y > top - 5) then
					this:StartSizing("TOPLEFT")
					this.isResizing = true
				elseif (x > right - 5 and y < bottom + 5) then
					this:StartSizing("BOTTOMRIGHT")
					this.isResizing = true
				elseif (x > right - 5 and y > top - 5) then
					this:StartSizing("TOPRIGHT")
					this.isResizing = true
				elseif (x < left + 5) then
					this:StartSizing("LEFT")
					this.isResizing = true
				elseif (x > right - 5) then
					this:StartSizing("RIGHT")
					this.isResizing = true
				elseif (y < bottom + 5) then
					this:StartSizing("BOTTOM")
					this.isResizing = true
				elseif (y > top - 5) then
					this:StartSizing("TOP")
					this.isResizing = true
				elseif StepFrame and ScrollFrame and 
				  (x > left + 5 and y > topScroll and y < bottomStep and x < right +5) then
					local nH = this:GetHeight()
					local nGapMin = nH * 0.85 - (nH /2)
					local nGapMax = nH * 0.45 - (nH /2)
					local nC = nH / 2
					local nT = fStep:GetTop()
					local nMinH = nC - nGapMin - 23
					local nMaxH = nC - nGapMax - 23
					fStep:SetMinResize(fStep:GetWidth(), nMinH)
					fStep:SetMaxResize(fStep:GetWidth(), nMaxH)
					fStep.isResizing = true
					fStep:StartSizing("BOTTOM")
				--elseif
				else
					this:StartMoving()
					this.isMoving = true
				end
			end
		end)
		frame:SetScript("OnMouseUp", function()
			local fStep = getglobal("VG_MainFrame_StepFrame")
			local fSlider = getglobal("VG_SettingsFrame_StepScrollSlider")
			if arg1 == "LeftButton" then
				if this.isMoving then
					this:StopMovingOrSizing()
					this.isMoving = false
					local from, _, to, x, y = this:GetPoint(1)
					--VGuide.db.profile.UIoptions.MainFrameAnchor.sFrom = from
					--VGuide.db.profile.UIoptions.MainFrameAnchor.sTo = to
					--VGuide.db.profile.UIoptions.MainFrameAnchor.nX = x
					--VGuide.db.profile.UIoptions.MainFrameAnchor.nY = y
					VGuide.db.char.UIoptions.MainFrameAnchor.sFrom = from
					VGuide.db.char.UIoptions.MainFrameAnchor.sTo = to
					VGuide.db.char.UIoptions.MainFrameAnchor.nX = x
					VGuide.db.char.UIoptions.MainFrameAnchor.nY = y
				elseif this.isResizing then
					this:StopMovingOrSizing()
					this.isResizing = false
				end
				if fStep.isResizing then
					fStep:StopMovingOrSizing()
					fStep.isResizing = false
					local nH = fStep:GetHeight()
					local oldVal = fSlider:GetValue()
					local newVal = math.floor(nH * 100 / this:GetHeight() + 4)
					if newVal ~= oldVal then
						fSlider:SetValue(newVal)
					end
				end
			end
		end)
		frame:SetScript("OnSizeChanged", function()
			local fStep = getglobal("VG_MainFrame_StepFrame")
			local fScroll = getglobal("VG_MainFrame_ScrollFrame")
			local StepFrame = tUIoptions.StepFrameVisible
			local ScrollFrame = tUIoptions.ScrollFrameVisible
			local StepScroll = tUIoptions.StepScroll
			local width = this:GetWidth()
			local height = this:GetHeight()
			if StepFrame and not ScrollFrame then
				height = height / StepScroll
			elseif StepFrame and ScrollFrame then
				local Per = height * (1 - StepScroll)
				local Gap = Per - (height / 2)
				fStep:SetPoint("BOTTOMRIGHT", this, "RIGHT", -5, Gap)
				fScroll:SetPoint("TOPLEFT", fStep, "BOTTOMLEFT", 0, -2)
			end
			--VGuide.db.profile.UIoptions.MainFrameSize.nWidth = width
			--VGuide.db.profile.UIoptions.MainFrameSize.nHeight = height
			VGuide.db.char.UIoptions.MainFrameSize.nWidth = width
			VGuide.db.char.UIoptions.MainFrameSize.nHeight = height
		end)
		frame:SetScript("OnHide", function()
			if this.isMoving then
				this:StopMovingOrSizing();
				this.isMoving = false;
			end
			if this.isResizing then
				this:StopMovingOrSizing();
				this.isResizing = false;
			end
		end)
		return frame
    end
	local function Render_MFTitle(fParent, sName)
		local version = GetAddOnMetadata("VanillaGuide", "Version")
		local fs = fParent:CreateFontString(sName, "ARTWORK", "GameFontNormalSmall")
		fs:SetPoint("TOPLEFT", fParent, "TOPLEFT", 31, -6)
		fs:SetTextColor(.91, .79, .11, 1)
		fs:SetJustifyH("CENTER")
		fs:SetJustifyV("CENTER")
		fs:SetText("|cccff1919Vanilla|ccceeeeeeGuide |ccca1a1a1v|ccc4a4aa1" .. version .. "|r")
		return fs
    end
	local function Render_Button(fParent, sName, nWidth, nHeight, tTexture)
		local b = CreateFrame("Button", sName, fParent)
		b:SetWidth(nWidth)
		b:SetHeight(nHeight)
		b:SetNormalTexture(tTexture.NORMAL)
		b:SetPushedTexture(tTexture.PUSHED)
		b:SetHighlightTexture(tTexture.HIGHLIGHT)
		b:RegisterForClicks("LeftButtonUp")
		return b
    end
	local function Render_MFStepNumberFrame(fParent, sName, nWidth, nHeight)
		local frame = CreateFrame("Frame", sName, fParent)
		frame:SetWidth(nWidth)
		frame:SetHeight(nHeight)
		frame:SetBackdrop(bd)
		frame:SetBackdropColor(.1, .1, .1, .9)
		return frame
    end
    local function Render_MFStepNumberLabel(fParent, sName)
		local fs = fParent:CreateFontString(sName, "ARTWORK", "GameFontNormalSmall")
		fs:SetPoint("CENTER", fParent, "CENTER", 0, 0)
		fs:SetTextColor(.71, .71, .71, 1)
		fs:SetJustifyH("CENTER")
		fs:SetJustifyV("CENTER")
		return fs
    end
    local function Render_MFDropDownMenu(fParent, sName)
		local frame= CreateFrame("Frame", sName, fParent)
		frame.UncheckHack = function()
		  --_G[this:GetName().."Check"]:Hide()
		  getglobal(this:GetName().."Check"):Hide()
		end
		frame.displayMode = "MENU"
		frame.info = {}

		frame:SetHeight(25)
		frame:SetWidth(25)
    return frame
    end
    local function Render_MFDropDownMenuZoneFrame(fParent, sName)
		local frame = CreateFrame("Frame", sName, fParent)
		frame:SetBackdrop(bd);
		frame:SetBackdropColor(.1, .1, .1, .7)
		return frame
    end
    local function Render_MFDropDownMenuZoneLabel(fParent, sName)
		local fs = fParent:CreateFontString(sName, "ARTWORK", "GameFontNormalSmall")
		fs:SetTextColor(.91, .91, .91, 1)
		fs:SetJustifyH("CENTER")
		fs:SetJustifyV("CENTER")
		fs:SetPoint("BOTTOMLEFT", fParent, "BOTTOMLEFT", 15, 6)
		return fs
	end
    local function Render_MFStepFrame(fParent, sName)
		local tColor = tUIoptions.StepFrameColor
		local frame = CreateFrame("Frame", sName, fParent)
		frame:SetResizable(true)
		frame:SetBackdrop(bd)
		frame:SetBackdropColor(tColor.nR, tColor.nG, tColor.nB, tColor.nA)
		--frame:SetScript("OnSizeChanged" , function()
		--end)
		frame:SetScript("OnHide" , function()
			if this.isMoving then
				this:StopMovingOrSizing();
				this.isMoving = false;
			end
			if this.isResizing then
				this:StopMovingOrSizing();
				this.isResizing = false;
			end
		end)
		return frame
    end
    local function Render_MFStepLabel(fParent, sName)
		local tColor = tUIoptions.StepFrameTextColor
		local fs = fParent:CreateFontString(sName, "ARTWORK", "GameFontNormalSmall")
		fs:SetPoint("TOPLEFT", fParent, "TOPLEFT", 5, -5)
		fs:SetPoint("BOTTOMRIGHT", fParent, "BOTTOMRIGHT", -5, 5)
		--fs:SetTextColor(.91, .91, .91, .99)
		fs:SetTextColor(tColor.nR, tColor.nG, tColor.nB, tColor.nA)
		fs:SetJustifyH("LEFT")
		fs:SetJustifyV("TOP")
		return fs
    end
    local function Render_MFScrollFrame(fParent, sName)
		local tColor = tUIoptions.ScrollFrameColor
		local frame = CreateFrame("ScrollFrame", sName, fParent)
		frame:SetBackdrop(bd)
		frame:SetBackdropColor(tColor.nR, tColor.nG, tColor.nB, tColor.nA)
		frame:EnableMouseWheel(true)
		
		frame:SetScript("OnSizeChanged", function()
			local w, h = UI.RefreshScrollFrame(oDisplay)
		end)
		frame:SetScript("OnMouseWheel", function()
			local fSlider = getglobal("VG_MainFrame_ScrollFrameSlider")
			local current = fSlider:GetValue()
			local step = fSlider:GetValueStep()
			local smin, smax = fSlider:GetMinMaxValues()
			local delta = arg1
			if IsShiftKeyDown() and (delta > 0) then
				fSlider:SetValue(0)
			elseif IsShiftKeyDown() and (delta < 0) then
				fSlider:SetValue(smax)
			elseif (delta < 0) and (current < smax) then
				fSlider:SetValue(current + 20)
			elseif (delta > 0) and (current > 1) then
				fSlider:SetValue(current - 20)
			end
		end)
		return frame
    end
    local function Render_MFScrollFrameChild(fParent, sName)
		local nScrollFrameChildWidth = fParent:GetWidth() - 10
		local nScrollFrameChildHeight = fParent:GetHeight() - 10
		local frame = CreateFrame("Frame", sName, fParent)
		frame:SetWidth(nScrollFrameChildWidth)
		frame:SetHeight(nScrollFrameChildHeight)
		return frame
    end
    local function Render_MFScrollFrameSlider(fParent, sName)
		local slider = CreateFrame("Slider", sName, fParent)
		slider.background = slider:CreateTexture(nil, "BACKGROUND")
		slider.background:SetAllPoints(true)
		slider.background:SetTexture(.0, .0, .0, 0.5)
		slider.thumb = fParent:CreateTexture(nil, "OVERLAY")
		--slider.thumb:SetTexture("Interface\\AddOns\\VGuide\\textures\\flash-up-round")
		slider.thumb:SetTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
		slider.thumb:SetWidth(31)
		slider.thumb:SetHeight(31)
		slider:SetThumbTexture(slider.thumb)
		slider:SetWidth(14)
		slider:SetOrientation("VERTICAL");
		slider:SetValueStep(10)
		slider:SetScript("OnValueChanged", function()
			local fScroll = getglobal("VG_MainFrame_ScrollFrame")
			fScroll:SetVerticalScroll(arg1)
		end)
		return slider
    end

    local function ChangeView(nMainFrameHeight, bStepFrame, bScrollFrame)
		local fMain = getglobal("VG_MainFrame")
		local fStep = getglobal("VG_MainFrame_StepFrame")
		local fScroll = getglobal("VG_MainFrame_ScrollFrame")
		--local fChild = getglobal("VG_MainFrame_ScrollFrameChild")
		--local fSlider = getglobal("VG_MainFrame_ScrollFrameSlider")
		local nStepScroll = tUIoptions.StepScroll

		if bScrollFrame then
			fMain:SetHeight(nMainFrameHeight)
			fMain:SetMinResize(320, 320)
			fMain:SetMaxResize(640, 640)
		else
			fMain:SetHeight(nMainFrameHeight*nStepScroll)
			fMain:SetMinResize(320, 320*nStepScroll)
			fMain:SetMaxResize(640, 640*nStepScroll)
		end
		if bStepFrame and not bScrollFrame then
			fScroll:Hide()
			fStep:SetPoint("BOTTOMRIGHT", fMain, "BOTTOMRIGHT", -5, 27)
			fStep:Show()
		elseif not bStepFrame and bScrollFrame then
			fStep:Hide()
			fScroll:SetPoint("TOPLEFT", fMain, "TOPLEFT", 5, -23)
			fScroll:Show()
		elseif bStepFrame and bScrollFrame then
			local nH =  fMain:GetHeight()
			local nGap = (nH - 2 * nStepScroll * nH) / 2
			fStep:SetPoint("BOTTOMRIGHT", fMain, "RIGHT", -5, nGap)
			fScroll:SetPoint("TOPLEFT", fStep, "BOTTOMLEFT", 0, -2)
			fStep:Show()
			fScroll:Show()
		end
    end

	local tWidgets = {}
    -------------------------------
    --- Rendering
    -------------------------------
    do
	-- Addon Main Frame and Title
		tWidgets.frame_MainFrame = Render_MF(UIParent, "VG_MainFrame")
		tWidgets.frame_MainFrame.isMoving = nil
		tWidgets.frame_MainFrame.isResizing = nil
		tWidgets.fs_Title = Render_MFTitle(tWidgets.frame_MainFrame, nil)
	-- Close, Settings and About Buttons
		tWidgets.button_CloseButton = Render_Button(tWidgets.frame_MainFrame, nil, 16, 16, VG_B_CLOSE)
		tWidgets.button_CloseButton:SetPoint("TOPRIGHT", tWidgets.frame_MainFrame, "TOPRIGHT", -6, -5)
		tWidgets.button_SettingsButton = Render_Button(tWidgets.frame_MainFrame, nil, 20, 20, VG_B_OPTION)
		tWidgets.button_SettingsButton:SetPoint("BOTTOMRIGHT", tWidgets.frame_MainFrame, "BOTTOMRIGHT", -6, 5)
		tWidgets.button_AboutButton = Render_Button(tWidgets.frame_MainFrame, nil, 20, 20, VG_B_ABOUT)
		tWidgets.button_AboutButton:SetPoint("BOTTOMRIGHT", tWidgets.frame_MainFrame, "BOTTOMRIGHT", -27, 5)
    -- Lock Button
		if tUIoptions.Locked then
			tWidgets.button_LockButton = Render_Button(tWidgets.frame_MainFrame, nil, 16, 16, VG_B_LOCKED)
		else
			tWidgets.button_LockButton = Render_Button(tWidgets.frame_MainFrame, nil, 16, 16, VG_B_UNLOCKED)
		end
		tWidgets.button_LockButton:SetPoint("TOPLEFT", tWidgets.frame_MainFrame, "TOPLEFT", 6, -5)
	-- ChangeView Button
		tWidgets.button_ChangeViewButton = Render_Button(tWidgets.frame_MainFrame, nil, 16, 16, VG_B_FLASH)
		tWidgets.button_ChangeViewButton:SetPoint("TOPRIGHT", tWidgets.frame_MainFrame, "TOPRIGHT", -105, -5)
    -- Prev and Next Guide Buttons
		tWidgets.button_PrevGuideButton = Render_Button(tWidgets.frame_MainFrame, nil, 25, 16, VG_B_DOUBLEARROWLEFT)
		tWidgets.button_PrevGuideButton:SetPoint("BOTTOMRIGHT", tWidgets.frame_MainFrame, "BOTTOMRIGHT", -75, 7)
		tWidgets.button_NextGuideButton = Render_Button(tWidgets.frame_MainFrame, nil, 25, 16, VG_B_DOUBLEARROWRIGHT)
		tWidgets.button_NextGuideButton:SetPoint("BOTTOMRIGHT", tWidgets.frame_MainFrame, "BOTTOMRIGHT", -50, 7)
	-- DropDown Menu, Button, ZoneFrame and ZoneLabel
		tWidgets.frame_DropDownMenu = Render_MFDropDownMenu(tWidgets.frame_MainFrame, "VG_MainFrame_DropDownMenu")
		tWidgets.frame_DropDownMenu:SetPoint("TOPLEFT", tWidgets.frame_MainFrame, "BOTTOMLEFT", 12, 26)
		tWidgets.frame_DropDownMenu:SetPoint("BOTTOMRIGHT", tWidgets.frame_MainFrame, "BOTTOMLEFT", 22, 3)
		tWidgets.button_DropDownMenu = Render_Button(tWidgets.frame_DropDownMenu, nil, 16, 16, VG_B_DDMRIGHT_DOWN)
		tWidgets.button_DropDownMenu:SetPoint("CENTER", tWidgets.frame_DropDownMenu, "LEFT", 3, 0)
		tWidgets.button_DropDownMenu:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		tWidgets.frame_DropDownMenuZoneFrame = Render_MFDropDownMenuZoneFrame(tWidgets.frame_DropDownMenu, nil)
		tWidgets.frame_DropDownMenuZoneFrame:SetPoint("TOPLEFT", tWidgets.frame_DropDownMenu, "TOPLEFT", 5, -2)
		tWidgets.frame_DropDownMenuZoneFrame:SetPoint("BOTTOMRIGHT", tWidgets.button_PrevGuideButton, "LEFT", -5, -10)
		tWidgets.fs_DropDownMenuZone = Render_MFDropDownMenuZoneLabel(tWidgets.frame_DropDownMenuZoneFrame, "VG_MainFrame_DropDownMenuLabel")
    -- Pren and Next Step Buttons
		tWidgets.button_PrevStepButton = Render_Button(tWidgets.frame_MainFrame, nil, 25, 16, VG_B_DOUBLEARROWLEFT)
		tWidgets.button_PrevStepButton:SetPoint("TOPRIGHT", tWidgets.frame_MainFrame, "TOPRIGHT", -76, -5)
		tWidgets.button_NextStepButton = Render_Button(tWidgets.frame_MainFrame, nil, 25, 16, VG_B_DOUBLEARROWRIGHT)
		tWidgets.button_NextStepButton:SetPoint("TOPRIGHT", tWidgets.frame_MainFrame, "TOPRIGHT", -26, -5)
	-- Step Number Frame & Label
		tWidgets.frame_StepNumberFrame = Render_MFStepNumberFrame(tWidgets.frame_MainFrame, nil, 25, 18)
		tWidgets.frame_StepNumberFrame:SetPoint("TOPRIGHT", tWidgets.frame_MainFrame, "TOPRIGHT", -51, -4)
		tWidgets.fs_StepNumber = Render_MFStepNumberLabel(tWidgets.frame_StepNumberFrame, "VG_MainFrame_StepNumberFrameLabel")
	-- Step Frame & Label
		tWidgets.frame_StepFrame = Render_MFStepFrame(tWidgets.frame_MainFrame, "VG_MainFrame_StepFrame")
		tWidgets.frame_StepFrame:SetPoint("TOPLEFT", tWidgets.frame_MainFrame, "TOPLEFT", 5, -23)
		--  Uncomment those will just make the frame visible at start, but we call GuideChange just after, so, not needed here
		-- see ***
		--local fMHeight = tWidgets.fMF:GetHeight()
		--local nPer = fMHeight * (1 - tUIoptions.nStepScroll)
		--local nGap = nPer - (fMHeight/2)
		--tWidgets.frame_StepFrame:SetPoint("BOTTOMRIGHT", tWidgets.frame_MainFrame, "RIGHT", -5, nGap)
		tWidgets.fs_StepFrame = Render_MFStepLabel(tWidgets.frame_StepFrame, "VG_MainFrame_StepFrameLabel")
	-- Scroll Frame, ScrollChild and Slider
		tWidgets.frame_ScrollFrame = Render_MFScrollFrame(tWidgets.frame_MainFrame, "VG_MainFrame_ScrollFrame")
		-- ***
		--tWidgets.frame_ScrollFrame:SetPoint("TOPLEFT", tWidgets.frame_StepFrame, "BOTTOMLEFT", 0, -2)
		tWidgets.frame_ScrollFrame:SetPoint("BOTTOMRIGHT", tWidgets.frame_MainFrame, "BOTTOMRIGHT", -25, 27)
		tWidgets.frame_ScrollFrameChild = Render_MFScrollFrameChild(tWidgets.frame_ScrollFrame, "VG_MainFrame_ScrollFrameChild")
		tWidgets.frame_ScrollFrameChild.shEntryHandle = {}
		--tWidgets.frame_ScrollFrameChild.fsEntryHandle = {}
		tWidgets.frame_ScrollFrameChild.nFSTotalWidth = 0
		tWidgets.frame_ScrollFrameChild.nFSTotalHeight = 0
		--tWidgets.frame_ScrollFrameChild.nSHTotalWidth = 0
		--tWidgets.frame_ScrollFrameChild.nSHTotalHeight = 0
		tWidgets.frame_ScrollFrameChild:SetPoint("TOPLEFT", tWidgets.frame_ScrollFrame, "TOPLEFT", 0, 0)
		tWidgets.frame_ScrollFrameChild:SetPoint("BOTTOMRIGHT", tWidgets.frame_ScrollFrame, "BOTTOMRIGHT", 0, 0)
		tWidgets.slider_ScrollFrameSlider = Render_MFScrollFrameSlider(tWidgets.frame_ScrollFrame, "VG_MainFrame_ScrollFrameSlider")
		tWidgets.slider_ScrollFrameSlider:SetPoint("TOPLEFT", tWidgets.frame_ScrollFrame, "TOPRIGHT", 2, -5)
		tWidgets.slider_ScrollFrameSlider:SetPoint("BOTTOMLEFT", tWidgets.frame_ScrollFrame, "BOTTOMRIGHT", 2, 5)
	end
	-------------------------------
    --- UI Events Handling
    -------------------------------
	do
    -- Close Button
		tWidgets.button_CloseButton:SetScript("OnClick", function()
			local fMain = getglobal("VG_MainFrame")
			local fSettings = getglobal("VG_SettingsFrame")
			fMain:Hide()
			if fSettings:IsVisible() then
				fSettings:Hide()
				fSettings.showthis = true
			end
		end)
	-- Lock Button
		tWidgets.button_LockButton:SetScript("OnClick", function()
			local bLocked = tUIoptions.Locked
			local frame = getglobal("VG_MainFrame")
			if bLocked then
				this:SetNormalTexture(VG_B_UNLOCKED.NORMAL)
				this:SetPushedTexture(VG_B_UNLOCKED.PUSHED)
				--tUIoptions.Locked = false
				--VGuide.db.profile.UIoptions.Locked = false
				VGuide.db.char.UIoptions.Locked = false
				frame:SetMovable(true)
				frame:SetResizable(true)
			else
				this:SetNormalTexture(VG_B_LOCKED.NORMAL)
				this:SetPushedTexture(VG_B_LOCKED.PUSHED)
				--tUIoptions.Locked = true
				--VGuide.db.profile.UIoptions.Locked = true
				VGuide.db.char.UIoptions.Locked = true
				frame:SetMovable(false)
				frame:SetResizable(false)
			end
		end)
	-- Settings Button
		tWidgets.button_SettingsButton:SetScript("OnClick", function()
			local fSettings = getglobal("VG_SettingsFrame")
			if fSettings:IsVisible() then
				fSettings:Hide()
			else
				fSettings:Show()
			end
		end)
	-- About Button
		tWidgets.button_AboutButton:SetScript("OnClick", function()
		  local fAbout = getglobal("VG_AboutFrame")
		  if fAbout:IsVisible() then
			fAbout:Hide()
		  else
			fAbout:Show()
		  end
		end)
	-- Change View Button
		tWidgets.button_ChangeViewButton:SetScript("OnClick", function()
			local fChild = getglobal("VG_MainFrame_ScrollFrameChild")
			local bStepFrame = tUIoptions.StepFrameVisible
			local bScrollFrame = tUIoptions.ScrollFrameVisible
			local nMainFrameHeight = tUIoptions.MainFrameSize.nHeight

			if bStepFrame and bScrollFrame then
				bStepFrame = true
				bScrollFrame = false
			elseif bStepFrame and not bScrollFrame then
				bStepFrame = false
				bScrollFrame = true
			else
				bStepFrame = true
				bScrollFrame = true
			end
			ChangeView(nMainFrameHeight, bStepFrame, bScrollFrame)
			--tUIoptions.StepFrameVisible = bStepFrame
			--tUIoptions.ScrollFrameVisible = bScrollFrame
			--VGuide.db.profile.UIoptions.StepFrameVisible = bStepFrame
			--VGuide.db.profile.UIoptions.ScrollFrameVisible = bScrollFrame
			VGuide.db.char.UIoptions.StepFrameVisible = bStepFrame
			VGuide.db.char.UIoptions.ScrollFrameVisible = bScrollFrame
			--UI.SetSliderMinMax(fChild.nFSTotalHeight)
		end)
	-- Prev and Next Guide Buttons

		tWidgets.button_PrevGuideButton:SetScript("OnClick", function()
			GuideChange(oDisplay, "BACKWARD")
		end)
		tWidgets.button_NextGuideButton:SetScript("OnClick", function()
			GuideChange(oDisplay, "FORWARD")
		end)
	-- Prev and Next Step Buttons
		tWidgets.button_PrevStepButton:SetScript("OnClick", function()
			local tColF = tUIoptions.StepFrameColor
			local fChild = getglobal("VG_MainFrame_ScrollFrameChild")
			local locX, locY, zone
			local step = oDisplay:GetStep()
			fChild.shEntryHandle[step]:SetBackdropColor(.1, .1, .1, .5)
			locX, locY, zone = StepChange(oDisplay, "Backward")
			local step = oDisplay:GetStep()
			fChild.shEntryHandle[step]:SetBackdropColor(tColF.nR, tColF.nG, tColF.nB, tColF.nA)
			if VGuide.db.char.MetaMapBWPSupportEnable then
				UI.SetMetaMapBWPDestination(locX, locY, zone)
			end
		end)
		tWidgets.button_NextStepButton:SetScript("OnClick", function()
			local tColF = tUIoptions.StepFrameColor
			local fChild = getglobal("VG_MainFrame_ScrollFrameChild")
			local locX, locY, zone
			local step = oDisplay:GetStep()
			fChild.shEntryHandle[step]:SetBackdropColor(.1, .1, .1, .5)
			locX, locY, zone = StepChange(oDisplay, "Forward")
			local step = oDisplay:GetStep()
			fChild.shEntryHandle[step]:SetBackdropColor(tColF.nR, tColF.nG, tColF.nB, tColF.nA)
			if VGuide.db.char.MetaMapBWPSupportEnable then
				UI.SetMetaMapBWPDestination(locX, locY, zone)
			end
		end)
	-- DropDown Menu
		tWidgets.button_DropDownMenu:SetScript("OnClick", function()
		  ToggleDropDownMenu(1, nil, tWidgets.frame_DropDownMenu, tWidgets.button_DropDownMenu, 0, 0);
		end)
	end
	-------------------------------
    --- Initialization
    -------------------------------
    do
		-- DropDown Menu Initialization
		--tWidgets.fs_DropDownMenuZone:SetText("Inizialization")
		--UIDropDownMenu_Initialize(tWidgets.frame_DropDownMenu, DropDown_Init)
		-- Step Frame Initialization
		--local nStep = tGuideValues.Step
		--local sTextStepLabel = tFSEntries[nStep]
		--tWidgets.fs_StepFrame:SetText("Initialization text")
		--tWidgets.fs_StepNumber:SetText("1")
		-- Scroll Frame Initialization
		--local nGID = tGuideValues.GuideID
		--GuideChange("GID", nGID)
		--tWidgets.frame_ScrollFrame:SetScrollChild(tWidgets.frame_ScrollFrameChild)
		--tWidgets.frame_ScrollFrame:UpdateScrollChildRect()
		-- MainFrame View
		local bStepFrame = tUIoptions.StepFrameVisible
		local bScrollFrame = tUIoptions.ScrollFrameVisible
		local nHeight = tUIoptions.MainFrameSize.nHeight
		ChangeView(nHeight, bStepFrame, bScrollFrame)
    end

    return tWidgets
end
-- Setting Frame
-----------------
local function SummonSettingsFrame(fParent, UIoptions)
	local bMinimapToggle = UIoptions.MinimapToggle
	local nMinimapPos = UIoptions.MinimapPos
	local nStepScroll = UIoptions.StepScroll
	local nOpacity = UIoptions.Opacity
	local nScale = UIoptions.Scale
	local sLayer = UIoptions.Layer

	local Layers = {
		["DIALOG"] = 5,
		["HIGH"] = 4,
		["MEDIUM"] = 3,
		["LOW"] = 2,
		["BACKGROUND"] = 1,
		[5] = "DIALOG",
		[4] = "HIGH",
		[3] = "MEDIUM",
		[2] = "LOW",
		[1] = "BACKGROUND",
	}

	local function Render_SF(fParent, sName)
		local frame = CreateFrame("Frame", sName)
		frame:SetScale(1)
		frame:SetFrameStrata("TOOLTIP")
		frame:SetWidth(220)
		frame:SetHeight(300)
		frame:SetPoint("TOPRIGHT", fParent, "TOPLEFT", -10, 0)
		frame:SetBackdrop(bd)
		frame:SetBackdropColor(.01, .01, .01, .91)
		frame:SetMovable(true)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)
		frame:RegisterForDrag("LeftButton")
		frame.showthis = false
		return frame
	end
	local function Render_SFCloseButton(fParent, sName)
		local button = CreateFrame("Button", sName, fParent)
		button:SetWidth(16)
		button:SetHeight(16)
		--button:SetNormalTexture("Interface\\AddOns\\VanillaGuide\\textures\\close-up-round")
		--button:SetPushedTexture("Interface\\AddOns\\VanillaGuide\\textures\\close-down-round")
		--button:SetHighlightTexture("Interface\\AddOns\\VanillaGuide\\textures\\highlight-red-round")
		button:SetNormalTexture(VG_B_CLOSE.NORMAL)
		button:SetPushedTexture(VG_B_CLOSE.PUSHED)
		button:SetHighlightTexture(VG_B_CLOSE.HIGHLIGHT)
		button:SetPoint("TOPRIGHT", fParent, "TOPRIGHT", -5, -5)
		return button
	end
	local function Render_SFMetamapBWPSupportCheckBox(fParent, sName)
		local checkbutton = CreateFrame("CheckButton", sName, fParent, "UICheckButtonTemplate")
		checkbutton:SetWidth(20)
		checkbutton:SetHeight(20)
		checkbutton.tooltip = "Enable the appearance of MetaMapBWP arrow. Just an Arrow pointing where you need to go.";
		getglobal(checkbutton:GetName() .. 'Text'):SetText("   MetaMapBWP Support")
		if VGuide.db.char.MetaMapBWPSupport then
			checkbutton:Enable()
		  D(" BWP CB Enabled")
		else
			checkbutton:Disable()
			D(" BWP CB Disabled")
		end
		if checkbutton:IsEnabled() then
			if VGuide.db.char.MetaMapBWPSupportEnable then
				checkbutton:SetChecked(true)
				D(" BWP Support Enabled")
			else
				checkbutton:SetChecked(false)
				D(" BWP Support Enabled")
			end
		else
			checkbutton:SetChecked(false)
		end
		return checkbutton
	end
	local function Render_SFMinimapCheckBox(fParent, sName)
		local checkbutton = CreateFrame("CheckButton", sName, fParent, "UICheckButtonTemplate")
		checkbutton:SetWidth(20)
		checkbutton:SetHeight(20)
		checkbutton:SetPoint("TOPLEFT", fParent, "TOPLEFT", 10, -10)
		getglobal(checkbutton:GetName() .. 'Text'):SetText("Minimap Button")
		if bMinimapToggle then
		  checkbutton:SetChecked(true)
		else
		  checkbutton:SetChecked(false)
		end
		return checkbutton
	end
	local function Render_SFColorSwatch(fParent, sText)
		local tCol = nil
		if sText == "VG_MainFrame" then
			tCol = UIoptions.MainFrameColor
		elseif sText == "VG_MainFrame_StepFrame" then
			tCol = UIoptions.StepFrameColor
		elseif sText == "VG_MainFrame_ScrollFrame" then
			tCol = UIoptions.ScrollFrameColor
		elseif sText == "VG_MainFrame_StepFrameLabel" then
			tCol = UIoptions.StepFrameTextColor
		elseif sText == "VG_MainFrame_ScrollFrameLabels" then
			tCol = UIoptions.ScrollFrameTextColor
		end
		local sSwatchName = "VG_ColorSwatch" .. "_" .. sText
		local button = CreateFrame("Button", sSwatchName, fParent)--, "OptionsCheckButtonTemplate")
		local background = button:CreateTexture(nil, "BACKGROUND")
		background:SetWidth(16)
		background:SetHeight(16)
		background:SetPoint("CENTER", 0, 0)
		background:SetTexture(.3, .3, .3, 1)
		local artwork = button:CreateTexture(nil, "ARTWORK")
		artwork:SetWidth(13)
		artwork:SetHeight(13)
		artwork:SetPoint("CENTER", 0, 0)
		artwork:SetTexture(tCol.nR, tCol.nG, tCol.nB, tCol.nA)
		button.background = background
		button.artwork = artwork
		button:SetWidth(16)
		button:SetHeight(16)
		button:SetNormalTexture(artwork)
		button:SetScript( "OnClick", function()
			local frame = getglobal(sText)
			local tCol = nil
			local opacitySlider = nil 
			if sText == "VG_MainFrame" then
				tCol = UIoptions.MainFrameColor
				opacitySlider = true
			elseif sText == "VG_MainFrame_StepFrame" then
				tCol = UIoptions.StepFrameColor
				opacitySlider = true
			elseif sText == "VG_MainFrame_ScrollFrame" then
				tCol = UIoptions.ScrollFrameColor
				opacitySlider = true
			elseif sText == "VG_MainFrame_StepFrameLabel" then
				tCol = UIoptions.StepFrameTextColor
				opacitySlider = false
			elseif sText == "VG_MainFrame_ScrollFrameLabels" then
				tCol = UIoptions.ScrollFrameTextColor
				opacitySlider = false
			end
			
			local r1, g1, b1, a1 = tCol.nR, tCol.nG, tCol.nB, tCol.nA
			if ColorPickerFrame:IsShown() then
				ColorPickerFrame:Hide()
			else
				ColorPickerFrame.func = function(pV)
					local nr, ng, nb, na
					if pV then
						-- The user bailed, we extract the old color from the table created by ShowColorPicker.
						nr, ng, nb, na = pV.r, pV.g, pV.b, pV.a
						ColorPickerFrame.previousValues = {}
					else
						-- Something changed
						nr, ng, nb = ColorPickerFrame:GetColorRGB();
						na = 1 - OpacitySliderFrame:GetValue()
					end
					r1, g1, b1, a1 = nr, ng, nb, na
					button.artwork:SetVertexColor(r1, g1, b1, a1)
					if sText == "VG_MainFrame" then 
						frame:SetBackdropColor(r1, g1, b1, a1)
						--VGuide.db.profile.UIoptions.MainFrameColor = {
						--	nR = r1, nG = g1, nB = b1, nA = a1,
						--}
						VGuide.db.char.UIoptions.MainFrameColor = {
							nR = r1, nG = g1, nB = b1, nA = a1,
						}
					elseif sText == "VG_MainFrame_StepFrame" then
						frame:SetBackdropColor(r1, g1, b1, a1)
						--VGuide.db.profile.UIoptions.StepFrameColor = {
						--	nR = r1, nG = g1, nB = b1, nA = a1,
						--}
						VGuide.db.char.UIoptions.StepFrameColor = {
							nR = r1, nG = g1, nB = b1, nA = a1,
						}
					elseif sText == "VG_MainFrame_ScrollFrame" then
						frame:SetBackdropColor(r1, g1, b1, a1)
						--VGuide.db.profile.UIoptions.ScrollFrameColor = {
						--	nR = r1, nG = g1, nB = b1, nA = a1,
						--}
							VGuide.db.char.UIoptions.ScrollFrameColor = {
							nR = r1, nG = g1, nB = b1, nA = a1,
						}
					elseif sText == "VG_MainFrame_StepFrameLabel" then
						a1 = .99
						frame:SetTextColor(r1, g1, b1, a1)
						--VGuide.db.profile.UIoptions.StepFrameTextColor = {
						--	nR = r1, nG = g1, nB = b1, nA = a1,
						--}
						VGuide.db.char.UIoptions.StepFrameTextColor = {
							nR = r1, nG = g1, nB = b1, nA = a1,
						}
					elseif sText == "VG_MainFrame_ScrollFrameLabels" then
						local frame = getglobal("VG_MainFrame_ScrollFrameChild")
						local shEH = frame.shEntryHandle
						a1 = .71
						for _,v in pairs(shEH) do
							v:SetTextColor(r1, g1, b1, a1)
						end
						--VGuide.db.profile.UIoptions.ScrollFrameTextColor = {
						--	nR = r1, nG = g1, nB = b1, nA = a1,
						--}
						VGuide.db.char.UIoptions.ScrollFrameTextColor = {
							nR = r1, nG = g1, nB = b1, nA = a1,
						}
					end
				end
				ColorPickerFrame.cancelFunc = ColorPickerFrame.func
				ColorPickerFrame.opacityFunc = ColorPickerFrame.func
				
					ColorPickerFrame.hasOpacity = opacitySlider
					ColorPickerFrame.opacity = 1 - a1
				
				ColorPickerFrame.previousValues = { r = r1, g = g1, b = b1, a = a1}
				ColorPickerFrame:SetColorRGB(r1, g1, b1, a1);
				ColorPickerFrame:Hide(); -- Need to run the OnShow handler.
				ColorPickerFrame:Show();
			end
		end)
		return button
	end
	local function Render_SFColorSwatchLabel(fParent, sText)
		local fs = fParent:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
		fs:SetPoint("LEFT", fParent, "RIGHT", 10, 0)
		fs:SetText(sText)
		return fs
	end
	local function Render_Button(fParent, sName, nWidth, nHeight, tTexture)
		local button = CreateFrame("Button", sName, fParent)
		button:SetWidth(nWidth)
		button:SetHeight(nHeight)
		--if not tTexture then jp(sName) end
		button:SetNormalTexture(tTexture.NORMAL)
		button:SetPushedTexture(tTexture.PUSHED)
		button:SetHighlightTexture(tTexture.HIGHLIGHT)
		button:RegisterForClicks("LeftButtonUp")
		return button
	end
	local function Render_SFSlider(fParent, sName, sText, sLow, sHigh, nMin, nMax, nValue, sAppend)
		local slider = CreateFrame("Slider", sName, fParent, "OptionsSliderTemplate")
		slider:SetOrientation("HORIZONTAL");
		slider:SetWidth(195)
		slider:SetHeight(14)
		slider:SetPoint("TOP", fParent, "TOP", 0, -200)
		getglobal(slider:GetName() .. 'Text'):SetText(sText); --Sets the "title" text (top-centre of slider).
		getglobal(slider:GetName() .. 'Low'):SetText(sLow); --Sets the left-side slider text (default is "Low").
		getglobal(slider:GetName() .. 'High'):SetText(sHigh); --Sets the right-side slider text (default is "High").
		--getglobal(slider:GetName() .. 'Low'):SetText(tostring(nMin)); --Sets the left-side slider text (default is "Low").
		--getglobal(slider:GetName() .. 'High'):SetText(tostring(nMax)); --Sets the right-side slider text (default is "High").
		slider:SetValueStep(1)
		slider:SetMinMaxValues(nMin, nMax)
		slider:SetValue(nValue)
		local fs = slider:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
		fs:SetTextColor(.59, .59, .59, 1)
		fs:SetJustifyH("CENTER")
		fs:SetJustifyV("BOTTOM")
		fs:SetPoint("CENTER", slider, "BOTTOM", 0, -2)
		if sAppend then
			fs:SetText(tostring(nValue) .. sAppend)
		else
			fs:SetText(tostring(nValue))
		end
		--fs:SetText(nValue.."%")
		--if sValue then fs:SetText(sValue.."%") end
		slider.fs = fs
		return slider
	end

	local tWidgets = {}
	-------------------------------
	--- Rendering
	-------------------------------
	do
	-- Settings Frame
		tWidgets.frame_SettingFrame = Render_SF(fParent, "VG_SettingsFrame")
		tWidgets.button_CloseButton = Render_Button(tWidgets.frame_SettingFrame, nil, 16, 16, VG_B_CLOSE)
		tWidgets.button_CloseButton:SetPoint("TOPRIGHT", tWidgets.frame_SettingFrame, "TOPRIGHT", -5, -5)
		tWidgets.checkbutton_MetaMapBWPSupport = Render_SFMetamapBWPSupportCheckBox(tWidgets.frame_SettingFrame, "VG_SettingsFrame_MetaMapBWPCheckButton")
		tWidgets.checkbutton_MetaMapBWPSupport:SetPoint("TOPLEFT", tWidgets.frame_SettingFrame, "TOPLEFT", 8, -5)
		--tWidgets.checkbutton_Minimap = Render_SFMinimapCheckBox(tWidgets.frame_SettingFrame, "VG_SettingsFrame_MinimapCheckButton")
		--tWidgets.slider_Minimap = Render_SFSlider(tWidgets.frame_SettingFrame, "VG_SettingFrame_MinimapSlider", "Minimap Button Placement", "-180", "+180", -180, 180, math.floor(nMinimapPos), nil)
		--tWidgets.slider_Minimap:SetPoint("TOP", tWidgets.frame_SettingFrame, "TOP", 0, -40)

		tWidgets.colorpicker_StepFrameTextColor = Render_SFColorSwatch(tWidgets.frame_SettingFrame, "VG_MainFrame_StepFrameLabel")
		tWidgets.colorpicker_StepFrameTextColor:SetPoint("TOPLEFT", tWidgets.frame_SettingFrame, "TOPLEFT", 10, -30)
		tWidgets.fs_ColorPickerStepFrameTextColor = Render_SFColorSwatchLabel(tWidgets.colorpicker_StepFrameTextColor, "StepFrame TextColor")
		
		tWidgets.colorpicker_ScrollFrameTextColor = Render_SFColorSwatch(tWidgets.frame_SettingFrame, "VG_MainFrame_ScrollFrameLabels")
		tWidgets.colorpicker_ScrollFrameTextColor:SetPoint("TOPLEFT", tWidgets.frame_SettingFrame, "TOPLEFT", 10, -48)
		tWidgets.fs_ColorPickerScrollFrameTextColor = Render_SFColorSwatchLabel(tWidgets.colorpicker_ScrollFrameTextColor, "ScrollFrame TextColor")
		
		tWidgets.colorpicker_MainFrame = Render_SFColorSwatch(tWidgets.frame_SettingFrame, "VG_MainFrame")
		tWidgets.colorpicker_MainFrame:SetPoint("TOPLEFT", tWidgets.frame_SettingFrame, "TOPLEFT", 10, -78)
		tWidgets.fs_ColorPickerMainFrame = Render_SFColorSwatchLabel(tWidgets.colorpicker_MainFrame, "MainFrame Background")

		tWidgets.colorpicker_StepFrame = Render_SFColorSwatch(tWidgets.frame_SettingFrame, "VG_MainFrame_StepFrame")
		tWidgets.colorpicker_StepFrame:SetPoint("TOPLEFT", tWidgets.frame_SettingFrame, "TOPLEFT", 10, -95)
		tWidgets.fs_ColorPickerStepFrame = Render_SFColorSwatchLabel(tWidgets.colorpicker_StepFrame , "StepFrame Tint")

		tWidgets.colorpicker_ScrollFrame = Render_SFColorSwatch(tWidgets.frame_SettingFrame, "VG_MainFrame_ScrollFrame")
		tWidgets.colorpicker_ScrollFrame:SetPoint("TOPLEFT", tWidgets.frame_SettingFrame, "TOPLEFT", 10, -112)
		tWidgets.fs_ColorPickerScrollFrame = Render_SFColorSwatchLabel(tWidgets.colorpicker_ScrollFrame, "ScrollFrame Tint")

		tWidgets.slider_StepScroll = Render_SFSlider(tWidgets.frame_SettingFrame, "VG_SettingsFrame_StepScrollSlider", "Value", "15%", "55%", 15, 55, math.floor(nStepScroll*100), "%")
		tWidgets.slider_StepScroll:SetPoint("TOP", tWidgets.frame_SettingFrame, "TOP", 0, -145)
		tWidgets.slider_Opacity = Render_SFSlider(tWidgets.frame_SettingFrame, "VG_SettingsFrame_OpacitySlider", "Opacity", "15%", "100%", 15, 100, math.floor(nOpacity*100), "%")
		tWidgets.slider_Opacity:SetPoint("TOP", tWidgets.frame_SettingFrame, "TOP", 0, -185)
		tWidgets.slider_Scale = Render_SFSlider(tWidgets.frame_SettingFrame, "VG_SettingsFrame_ScaleSlider", "Scale", "75%", "125%", 75, 125, math.floor(nScale*100), "%")
		tWidgets.slider_Scale:SetPoint("TOP", tWidgets.frame_SettingFrame, "TOP", 0, -225)
		tWidgets.slider_Layer = Render_SFSlider(tWidgets.frame_SettingFrame, "VG_SettingsFrame_LayerSlider", "Layer", "BG", "DIALOG", 1, 5, Layers[sLayer], sLayer)
		tWidgets.slider_Layer:SetPoint("TOP", tWidgets.frame_SettingFrame, "TOP", 0, -265)
		tWidgets.slider_Layer.fs:SetText(sLayer)
	end
	-------------------------------
	--- UI Events Handling
	-------------------------------
	tWidgets.frame_SettingFrame:SetScript("OnMouseDown", function()
		if arg1 == "LeftButton" and not this.isMoving then
			this:StartMoving();
			this.isMoving = true;
		end
	end)
	tWidgets.frame_SettingFrame:SetScript("OnMouseUp", function()
		if arg1 == "LeftButton" and this.isMoving then
			this:StopMovingOrSizing();
			this.isMoving = false;
		end
	end)
	tWidgets.frame_SettingFrame:SetScript("OnHide", function()
		if this.isMoving then
			this:StopMovingOrSizing();
			this.isMoving = false;
		end
	end)
	tWidgets.button_CloseButton:SetScript("OnClick", function()
		local frame = this:GetParent()
		frame:Hide()
		frame.showthis = false
	end)
	tWidgets.checkbutton_MetaMapBWPSupport:SetScript("OnClick", function()
		if arg1 == "LeftButton" then
			local bVal = this:GetChecked()
			if not bVal then
				VGuide.db.char.MetaMapBWPSupportEnable = false
			else
				VGuide.db.char.MetaMapBWPSupportEnable = true
			end
		end
	end)
	--[[tWidgets.checkbutton_Minimap:SetScript("OnClick", function()
		if arg1 == "LeftButton" then
			local button = getglobal("VG_MinimapButton")
			local bVal = this:GetChecked()
			if bVal == 1 then
				button:Show()
				button.closethis = false
				VGuide.db.profile.UIoptions.MinimapToggle = true
			else
				button:Hide()
				button.closethis = true
				VGuide.db.profile.UIoptions.MinimapToggle = false
			end
		end
	end)
	]]
	--[[tWidgets.slider_Minimap:SetScript("OnValueChanged", function()
		local nVal = this:GetValue()
		local button = getglobal("VG_bMinimap")
		UI.PositionMinimapButton(button, nVal)
		VGuide.db.profile.UIoptions.MinimapPos = nVal
		this.fs:SetText(nVal)
	end)
	]]
	tWidgets.slider_StepScroll:SetScript("OnValueChanged", function()
		local nVal = arg1
		local fMain = getglobal("VG_MainFrame")
		local fStep = getglobal("VG_MainFrame_StepFrame")
		local fScroll = getglobal("VG_MainFrame_ScrollFrame")
		local fChild = getglobal("VG_MainFrame_ScrollFrameChild")
		local bStepFrame = UIoptions.StepFrameVisible
		local bScrollFrame = UIoptions.ScrollFrameVisible

		if bStepFrame and bScrollFrame then
			local nfMHeight = fMain:GetHeight()
			local nPer = nfMHeight * (1 - nVal/100)
			local nGap = nPer - (nfMHeight/2)
			fStep:SetPoint("TOPLEFT", fMain, "TOPLEFT", 5, -23)
			fStep:SetPoint("BOTTOMRIGHT", fMain, "RIGHT", -5, nGap)
			fScroll:SetPoint("TOPLEFT", fStep, "BOTTOMLEFT", 0, -2)
			--UI.SetSliderMinMax(fChild.nFSTotalHeight)
		end
		--VGuide.db.profile.UIoptions.StepScroll = nVal/100
		VGuide.db.char.UIoptions.StepScroll = nVal/100
		this.fs:SetText(nVal.."%")
	end)
	tWidgets.slider_Opacity:SetScript("OnValueChanged", function()
		local nVal = arg1
		local frame = getglobal("VG_MainFrame")
		frame:SetAlpha(nVal/100)
		--VGuide.db.profile.UIoptions.Opacity = nVal/100
		VGuide.db.char.UIoptions.Opacity = nVal/100
		this.fs:SetText(nVal.."%")
	end)
	tWidgets.slider_Scale:SetScript("OnValueChanged", function()
		local nVal = arg1
		local frame = getglobal("VG_MainFrame")
		frame:SetScale(nVal/100)
		--VGuide.db.profile.UIoptions.Scale = nVal/100
		VGuide.db.char.UIoptions.Scale = nVal/100
		this.fs:SetText(nVal.."%")
	end)
	tWidgets.slider_Layer:SetScript("OnValueChanged", function()
		local nVal = arg1
		local frame = getglobal("VG_MainFrame")
		--VGuide.db.profile.UIoptions.Layer = Layers[nVal]
		VGuide.db.char.UIoptions.Layer = Layers[nVal]
		frame:SetFrameStrata(VGuide.db.char.UIoptions.Layer)
		this.fs:SetText(VGuide.db.char.UIoptions.Layer)
	end)
	-------------------------------
	--- Initialization
	-------------------------------
	tWidgets.frame_SettingFrame:Hide()

	return tWidgets
end
-- About Frame
---------------
local function SummonAboutFrame(fParent, sFaction)
	local version = GetAddOnMetadata("VanillaGuide", "Version")
	--local sAboutText = "|cccff1919Vanilla|ccceeeeeeGuide" ..
	--	" |ccca1a1a1v|ccc4a4aa1" ..	version .. "|r" ..
	--	"\n\n\n|ccca1a1a1A 'remake' of the original|r" ..
	--	"\n|cccff1919J|ccceeeeeeoana`s |cccff1919Horde|ccceeeeee Leveling Guide.|r" ..
	--	"\n|ccca1a1a1in an in-game addon.\n" ..
	--	"\n                           Made in |ccca11919mrmr|r|ccca1a1a1!|r"
	
	local sAboutTextHorde = "|cccff1919Vanilla|ccceeeeeeGuide" ..
		" |ccca1a1a1v|ccc4a4aa1" ..	version .. "|r" ..
		"\n\n\n|ccca1a1a1A 'remake' of the original|r" ..
		"\n|cccff1919J|ccceeeeeeoana`s |cccff1919Horde|ccceeeeee Leveling Guide.|r" ..
		"\n|ccca1a1a1in an in-game addon.\n" ..
		"\n                           Made in |ccca11919mrmr|r|ccca1a1a1!|r"
	local sAboutTextAlly = "|cccff1919Vanilla|ccceeeeeeGuide" .. 
		" |ccca1a1a1v|ccc4a4aa1" .. version .. "|r" ..
		"\n\n\n|ccca1a1a1A 'remake' of the original|r" ..
		"\n|cccff1919B|ccceeeeeerian |cccff1919Kopps|ccceeeeee Leveling Guide.|r" ..
		"\n|ccca1a1a1in an in-game addon.\n" ..
		"\n                           Made in |ccca11919mrmr|r|ccca1a1a1!|r"	
	local sAboutText = ""
	
	if sFaction == "Horde" then
		sAboutText = sAboutTextHorde
	else
		sAboutText = sAboutTextAlly
	end
	
	local function Render_AF(fParent, sName)
		local frame = CreateFrame("Frame", sName)
		frame:SetFrameStrata("TOOLTIP")
		frame:SetFrameLevel(8)
		frame:SetWidth(195)
		frame:SetHeight(125)
		frame:SetScale(1)
		frame:SetPoint("BOTTOMLEFT", fParent, "TOPLEFT", 0, 10)
		frame:SetBackdrop(bd)
		frame:SetBackdropColor(.01, .01, .01, .99)
		frame:SetMovable(true)
		frame:EnableMouse(true)
		frame:SetClampedToScreen(true)
		frame:RegisterForDrag("LeftButton")
		return frame
	end
	local function Render_AFCloseButton(tParent, sName)
		local button = CreateFrame("Button", sName, tParent)
		button:SetWidth(16)
		button:SetHeight(16)
		--button:SetNormalTexture("Interface\\AddOns\\VanillaGuide\\Textures\\Buttons\\Button-Close-Normal")
		--button:SetPushedTexture("Interface\\AddOns\\VanillaGuide\\textures\\close-down-round")
		--button:SetHighlightTexture("Interface\\AddOns\\VanillaGuide\\textures\\highlight-red-round")
		button:SetNormalTexture(VG_B_CLOSE.NORMAL)
		button:SetPushedTexture(VG_B_CLOSE.PUSHED)
		button:SetHighlightTexture(VG_B_CLOSE.HIGHLIGHT)
		button:SetPoint("TOPRIGHT", tParent, "TOPRIGHT", -5, -5)
		return button
	end
	local function Render_AFLabel(tParent, sName, sText)
		local fs = tParent:CreateFontString(sName, "ARTWORK", "GameFontNormalSmall")
		fs:SetPoint("CENTER", tParent, "CENTER", 0, 0)
		fs:SetTextColor(.91, .79, .11, 1)
		fs:SetJustifyH("CENTER")
		fs:SetJustifyV("CENTER")
		fs:SetText(sText)
		return fs
	end

	-------------------------------
	--- Creation
	-------------------------------
	local tWidgets = {}
	-- About Frame
	tWidgets.frame_AboutFrame = Render_AF(fParent, "VG_AboutFrame")
	tWidgets.button_CloseButton = Render_AFCloseButton(tWidgets.frame_AboutFrame, nil)
	tWidgets.fs_AboutFrame = Render_AFLabel(tWidgets.frame_AboutFrame, nil, sAboutText)
	-------------------------------
	--- UI Events Handling
	-------------------------------
	tWidgets.frame_AboutFrame:SetScript("OnMouseDown", function()
		if arg1 == "LeftButton" and not this.isMoving then
			this:StartMoving();
			this.isMoving = true;
		end
	end)
	tWidgets.frame_AboutFrame:SetScript("OnMouseUp", function()
		if arg1 == "LeftButton" and this.isMoving then
			this:StopMovingOrSizing();
			this.isMoving = false;
		end
	end)
	tWidgets.frame_AboutFrame:SetScript("OnHide", function()
		if this.isMoving then
			this:StopMovingOrSizing();
			this.isMoving = false;
		end
	end)
	tWidgets.button_CloseButton:SetScript("OnClick", function()
		local frame = this:GetParent()
		frame:Hide()
	end)
	-------------------------------
	--- Initialization
	-------------------------------
	tWidgets.frame_AboutFrame:Hide()

	return tWidgets
end
-- Wrong Faction Frame
-----------------------
-- this function will go away...i'd say
--[[
local function SummonWrongFactionFrame(tCharInfo)

	local ClassTextColor = {
		["Priest"] = "|cccFFFFFF",
		["Warrior"] ="|cccC79C6E",
		["Rogue"] = "|cccFFF569",
		["Hunter"] = "|cccABD473",
		["Warlock"] = "|ccc9482C9",
		["Mage"] = "|ccc69CCF0",
		["Druid"] = "|cccFF7D0A",
		["Paladin"] = "|cccF58CBA",
		["Shaman"] = "|ccc0070DE",
	}

	local sTextColor = ClassTextColor[tCharInfo.Class]
	--[[
    if tCharInfo.Class == "Priest" then sTextColor = "|cccFFFFFF"
    elseif tCharInfo.Class == "Warrior" then sTextColor = "|cccC79C6E"
    elseif tCharInfo.Class == "Rogue" then sTextColor = "|cccFFF569"
    elseif tCharInfo.Class == "Hunter" then sTextColor = "|cccABD473"
    elseif tCharInfo.Class == "Warlock" then sTextColor = "|ccc9482C9"
    elseif tCharInfo.Class == "Mage" then sTextColor = "|ccc69CCF0"
    elseif tCharInfo.Class == "Druid" then sTextColor = "|cccFF7D0A"
    elseif tCharInfo.Class == "Paladin" then sTextColor = "|cccF58CBA"
    end
	]]
    --elseif sClass == "" then sTextColor =

    local sTextWrongFaction = "|ccca1a1a1    Dear " .. tCharInfo.Race ..", " .. "I know you!"
                        .. "\n\n    I know your name."
                        .. "\nYou're ".. sTextColor .. tCharInfo.CharName .."|ccca1a1a1, the " .. tCharInfo.Class .. "!"
                        .. "\nI know you made a wrong choise"
                        .. "\nwhen you first arrived here,"
                        .. "\namong us, on |ccc33FF33" .. tCharInfo.RealmName .. "|r|ccca1a1a1."
                        .. "\n\n    You choosed the wrong side."
                        .. "\nYou already know inside of you."
                        .. "\nAlliance is the wrong side."
                        .. "\n\nYou should have choosen Horde..."
                        .. "\n...cause Horde is the right side."
                        .. "\n\n\n                                |cccff1919Horde|r FTW!"

    local function Render_WFF(sName)
        local frame = CreateFrame("Frame", sName)
        frame:SetFrameStrata("TOOLTIP")
        frame:SetFrameLevel(8)
        frame:SetWidth(235)
        frame:SetHeight(215)
        frame:SetPoint("CENTER", UIParent, "CENTER")
        frame:SetBackdrop(bd)
        frame:SetBackdropColor(.01, .01, .01, .99)
        frame:SetMovable(true)
        frame:EnableMouse(true)
        frame:RegisterForDrag("LeftButton")
        frame:SetScript("OnMouseDown", function()
            if arg1 == "LeftButton" and not this.isMoving then
                this:StartMoving();
                this.isMoving = true;
            end
        end)
        frame:SetScript("OnMouseUp", function()
            if arg1 == "LeftButton" and this.isMoving then
                this:StopMovingOrSizing();
                this.isMoving = false;
            end
        end)
        frame:SetScript("OnHide", function()
            if this.isMoving then
                this:StopMovingOrSizing();
                this.isMoving = false;
            end
        end)
        return frame
    end
    local function Render_WFFCloseButton(fParent, sName)
        local button = CreateFrame("Button", sName, fParent)
        button:SetWidth(16)
        button:SetHeight(16)
        button:SetNormalTexture("Interface\\AddOns\\VanillaGuide\\Textures\\Buttons\\Button-Close-Normal")
        button:SetPushedTexture("Interface\\AddOns\\VanillaGuide\\textures\\close-down-round")
        button:SetHighlightTexture("Interface\\AddOns\\VanillaGuide\\textures\\highlight-red-round")
        button:SetPoint("TOPRIGHT", fParent, "TOPRIGHT", -5, -5)
        --bWFCB:Enable()
        button:SetScript("OnClick", function()
            fParent:Hide()
        end)
        return button
    end
    local function Render_WFFLabel(fParent, sName, sText)
        local fs = fParent:CreateFontString(sName, "ARTWORK", "GameFontNormalSmall")
        fs:SetPoint("CENTER", fParent, "CENTER", 0, 0)
        fs:SetTextColor(.91, .79, .11, 1)
        fs:SetJustifyH("LEFT")
        fs:SetJustifyV("CENTER")
        fs:SetText(sText)
        return fs
    end
    -------------------------------
    --- Creation
    -------------------------------
    local tWidgets = {}
    -- WrongFaction Frame
    tWidgets.frame_WrongFactionFrame = Render_WFF("VGuide_frame_WrongFaction")
    tWidgets.button_CloseButton = Render_WFFCloseButton(tWidgets.frame_WrongFactionFrame, nil)
    tWidgets.fs_WrongFaction = Render_WFFLabel(tWidgets.frame_WrongFactionFrame, nil, sTextWrongFaction)
    -------------------------------
    --- Initialization
    -------------------------------
    tWidgets.frame_WrongFactionFrame:Show()

    return tWidgets
end
]]--

-----------------------
-- Constructor
-----------------------
function UI:new(AceDB_char)
    local self = {}
    setmetatable(self, UI)

    local UIoptions = AceDB_char.UIoptions
    local GuideValues = AceDB_char.GuideValues
	local CharInfo = AceDB_char.CharInfo
	
	if CharInfo.Faction == "Alliance" then
		VGuideSteps = VGuideStepsAlly
		DropDownMenuFrame2 = DropDownMenuFrame2Ally
		DropDownMenuFrame3 = DropDownMenuFrame3Ally
	else
		VGuideSteps = VGuideStepsHorde
		DropDownMenuFrame2 = DropDownMenuFrame2Horde
		DropDownMenuFrame3 = DropDownMenuFrame3Horde
	end
	
	VGuideStepsAlly = nil
	VGuideStepsHorde = nil
	DropDownMenuFrame2Ally = nil
	DropDownMenuFrame3Ally = nil
	DropDownMenuFrame2Horde = nil
	DropDownMenuFrame2Horde = nil
	
	self.Display = Display:new(VGuideSteps, CharInfo, GuideValues)
	self.MainFrame = SummonMainFrame(UIoptions, GuideValues, self.Display)

	self.SettingsFrame = SummonSettingsFrame(self.MainFrame.frame_MainFrame, UIoptions)
	self.AboutFrame = SummonAboutFrame(self.MainFrame.frame_MainFrame, CharInfo.Faction)
	-- DropDown Menu Initialization
	UIDropDownMenu_Initialize(self.MainFrame.frame_DropDownMenu, UI.DropDown_Init)
	-- Step & Scroll Frame Initialization
	local currStep = GuideValues.Step
	local currGID = GuideValues.GuideID
	GuideChange(self.Display, "GID", currGID)
		
	local tColF = UIoptions.StepFrameColor
	local fChild = getglobal("VG_MainFrame_ScrollFrameChild")
	local step = self.Display:GetStep()
	fChild.shEntryHandle[step]:SetBackdropColor(.1, .1, .1, .5)
		
	local locX, locY, zone
	locX, locY, zone = StepChange(self.Display, "Step", currStep)
		
	local step = self.Display:GetStep()
	fChild.shEntryHandle[step]:SetBackdropColor(tColF.nR, tColF.nG, tColF.nB, tColF.nA)
		
	if VGuide.db.char.MetaMapBWPSupportEnable then
		UI.SetMetaMapBWPDestination(locX, locY, zone)
	end
	self.MainFrame.frame_ScrollFrame:SetScrollChild(self.MainFrame.frame_ScrollFrameChild)
	self.MainFrame.frame_ScrollFrame:UpdateScrollChildRect()

	-- MainFrame View
	--ChangeView(UIoptions.MainFrameSize.nHeight, UIoptions.StepFrame, UIoptions.ScrollFrame)
    --self.fMain.fMF:SetAlpha(tDisplay.tUIoptions.nOpacity)
    --self.fMain.fMF:SetScale(tDisplay.tUIoptions.nScale)
    --self.fMain.fMF:SetFrameStrata(tDisplay.tUIoptions.sLayer)
    --self.fMain.bCB:Click()

	
	--[[
	if CharInfo.Faction == "Alliance" then
		self.WrongFactionFrame = self:SummonWrongFactionFrame(CharInfo)
	else

		self.Display = Display:new(VGuideSteps, CharInfo, GuideValues)
		self.MainFrame = SummonMainFrame(UIoptions, GuideValues, self.Display)

		self.SettingsFrame = SummonSettingsFrame(self.MainFrame.frame_MainFrame, UIoptions)
		self.AboutFrame = SummonAboutFrame(self.MainFrame.frame_MainFrame)

	-- DropDown Menu Initialization
		UIDropDownMenu_Initialize(self.MainFrame.frame_DropDownMenu, UI.DropDown_Init)
	-- Step & Scroll Frame Initialization
		local currStep = GuideValues.Step
		local currGID = GuideValues.GuideID
		GuideChange(self.Display, "GID", currGID)
		
		local tColF = UIoptions.StepFrameColor
		local fChild = getglobal("VG_MainFrame_ScrollFrameChild")
		local step = self.Display:GetStep()
		fChild.shEntryHandle[step]:SetBackdropColor(.1, .1, .1, .5)
		
		local locX, locY, zone
		locX, locY, zone = StepChange(self.Display, "Step", currStep)
		
		local step = self.Display:GetStep()
		fChild.shEntryHandle[step]:SetBackdropColor(tColF.nR, tColF.nG, tColF.nB, tColF.nA)
		
		if VGuide.db.char.MetaMapBWPSupportEnable then
			UI.SetMetaMapBWPDestination(locX, locY, zone)
		end
		self.MainFrame.frame_ScrollFrame:SetScrollChild(self.MainFrame.frame_ScrollFrameChild)
		self.MainFrame.frame_ScrollFrame:UpdateScrollChildRect()

	-- MainFrame View
		--ChangeView(UIoptions.MainFrameSize.nHeight, UIoptions.StepFrame, UIoptions.ScrollFrame)


        --self.fMain.fMF:SetAlpha(tDisplay.tUIoptions.nOpacity)
        --self.fMain.fMF:SetScale(tDisplay.tUIoptions.nScale)
        --self.fMain.fMF:SetFrameStrata(tDisplay.tUIoptions.sLayer)
        --self.fMain.bCB:Click()
	end
	--]]
	
    return self
end

--[[ UI.DropDown_Init
--    PURPOSE -
--  This function is used by UIDropDownMenu_Initialize to initialize the
-- "actual" level of the dropdown menu.
--  When you click the ddm button, to the called function (UI.DropDown_Init
-- in this case)
-- is passed ONE parameter. It rappresent the actual menu level.
--  You can call it whatever you want (level, frame or even marshmellow if
-- you like).
--  You have to use it to populate various menu lvl. In fact, this function
-- is called
-- everytime you "change" level of the menu, overing over it with your mouse
-- during gameplay...
--    ARGUMENTS -
-- level: Actual level of the DropDownMenu
--    RETURNS -
-- nothing
--]]
function UI.DropDown_Init(level)
  local info = {}
  level = level or 1;
  if (level == 1) then --and (frame == 1) then
    info.isTitle = 1
    info.text = "Jmrmr Azeroth Guide"
    info.notCheckable = true
    UIDropDownMenu_AddButton(info, level)
    info.isTitle = false

    for i = 1, DropDownMenuFrame1.itemCount do
      info.text = DropDownMenuFrame1.items[i].n
      if (DropDownMenuFrame1.items[i].t == "v") then
        info.keepShownOnClick = false
        info.disabled = nil
        info.hasArrow = nil
        info.value = DropDownMenuFrame1.items[i].n
        info.arg1 = DropDownMenuFrame1.items[i].id
        info.arg2 = DropDownMenuFrame1.items[i].n
        --info.value = "voice"
        info.func = function(arg1, arg2)
          GuideChange(VGuide.UI.Display, "GID", arg1)
          CloseDropDownMenus()
        end
      else
        info.keepShownOnClick = true
        info.disabled = nil
        info.hasArrow = true
        info.notCheckable = nil
        info.value = DropDownMenuFrame1.items[i].n
        info.func = this.UncheckHack
       end
      UIDropDownMenu_AddButton(info, level)
    end
    -- Close menu item
    info.text = CLOSE--"Close"
    info.keepShownOnClick = false
    info.disabled = nil
    info.hasArrow = nil
    info.notCheckable = 1
    info.value = nil
    info.func = function()
      CloseDropDownMenus()
    end
    --info.func = this.HideMenu
    UIDropDownMenu_AddButton(info, level)

  elseif level == 2 then
    for i = 1, DropDownMenuFrame2[UIDROPDOWNMENU_MENU_VALUE].itemCount do
      info.text = DropDownMenuFrame2[UIDROPDOWNMENU_MENU_VALUE].items[i].n
      info.keepShownOnClick = false
      info.disabled = nil
      info.hasArrow = true
      info.notCheckable = 1
      info.value = DropDownMenuFrame2[UIDROPDOWNMENU_MENU_VALUE].items[i].n
      info.func = this.UncheckHack
      UIDropDownMenu_AddButton(info, 2)
    end

  elseif level == 3 then
    for i = 1, DropDownMenuFrame3[UIDROPDOWNMENU_MENU_VALUE].itemCount do
      info.text = DropDownMenuFrame3[UIDROPDOWNMENU_MENU_VALUE].items[i].n
      info.keepShownOnClick = false
      info.disabled = nil
      info.hasArrow = nil
      info.notCheckable = 1
      info.value = DropDownMenuFrame3[UIDROPDOWNMENU_MENU_VALUE].items[i].n
      info.arg1 = DropDownMenuFrame3[UIDROPDOWNMENU_MENU_VALUE].items[i].id
      info.arg2 = DropDownMenuFrame3[UIDROPDOWNMENU_MENU_VALUE].items[i].n
      info.func = function(arg1, arg2)
		GuideChange(VGuide.UI.Display, "GID", arg1)
        CloseDropDownMenus()
      end
      UIDropDownMenu_AddButton(info, 3)
    end
  end
end

function UI.RefreshStepFrameLabel(oDisplay)
	local text = oDisplay:GetStepLabel()
	local fs = getglobal("VG_MainFrame_StepFrameLabel")
	fs:SetText(text)
end

function UI.RefreshStepNumberFrameLabel(oDisplay)
	local text = oDisplay:GetStep()
	local fs = getglobal("VG_MainFrame_StepNumberFrameLabel")
	fs:SetText(text)
end

function UI.RefreshDropDownMenuLabel(oDisplay)
	local text = oDisplay:GetDropDownMenuLabel()
	local fs = getglobal("VG_MainFrame_DropDownMenuLabel")
	fs:SetText(text)
end

function UI.SetSliderMinMax(nFSHeight)
	--local StepFrame = VGuide.db.profile.UIoptions.StepFrameVisible
	--local StepScroll = VGuide.db.profile.UIoptions.StepScroll
	local StepFrame = VGuide.db.char.UIoptions.StepFrameVisible
	local StepScroll = VGuide.db.char.UIoptions.StepScroll
	local fMain = getglobal("VG_MainFrame")
	local fScroll = getglobal("VG_MainFrame_ScrollFrame")
	local fSlider = getglobal("VG_MainFrame_ScrollFrameSlider")

	local nFrameH
	local sliderVisible
	if StepFrame then
		nFrameH = fMain:GetHeight() * (1 - StepScroll) - 55
	else
		nFrameH = fMain:GetHeight() - 80
	end
	if nFSHeight - nFrameH + 10 > 0 then
		fSlider:SetMinMaxValues(0, nFSHeight - nFrameH + 10)
		fScroll:SetPoint("BOTTOMRIGHT", fMain, "BOTTOMRIGHT", -25, 27)
		sliderVisible = true
		fSlider:Show()
	else
		fSlider:SetMinMaxValues(0, 0)
		fSlider:SetValue(0)
		fScroll:SetPoint("BOTTOMRIGHT", fMain, "BOTTOMRIGHT", -5, 27)
		sliderVisible = false
		fSlider:Hide()
	end
  return sliderVisible
end

--[[ UI.SummonSimpleHTMLs
--    ARGUMENTS -
-- parentName: the frame where SimpleHTMLs are "parented"
-- nNum: the number of SimpleHTMLs to create
-- tText: table containing strings to display in created SimpleHTMLs
--
--    RETURNS -
-- shEH: table containing the references to newly created SimpleHTMLs
--]]

function UI.SummonSimpleHTMLs(fParent, nStep, nNum)
	--D(" SummonSimpleHTMLs")
	--local tColor = VGuide.db.profile.UIoptions.ScrollFrameTextColor
	local tColF = VGuide.db.char.UIoptions.StepFrameColor
	local tColT = VGuide.db.char.UIoptions.ScrollFrameTextColor
	local shEH = fParent.shEntryHandle or {}
	fParent:Hide()
	for i = 1, nNum do
		local sh = shEH[i]
		if sh then
			sh:Hide()
		else
			sh = CreateFrame("SimpleHTML", "VG_shEntry"..i, fParent)
			sh:Hide()
			sh:EnableMouse(true)
			--sh:SetTextColor(.59, .59, .59, .71)
			sh:SetTextColor(tColT.nR, tColT.nG, tColT.nB, tColT.nA)
			sh:SetJustifyH("LEFT")
			sh:SetJustifyV("TOP")
			if i > 1 then
				sh:SetPoint("TOPLEFT", shEH[i-1], "BOTTOMLEFT", 0, -VG_SCROLLFRAME_PADDING)
			else
				sh:SetPoint("TOPLEFT", fParent, "TOPLEFT", 5, -15)
			end
		end
		sh:SetBackdrop(bdsh)
		if i ~= nStep then
			sh:SetBackdropColor(.1, .1, .1, .5)
		else
			sh:SetBackdropColor(tColF.nR, tColF.nG, tColF.nB, tColF.nA)
		end
		sh:SetFont(VG_FONT_PATH, VG_FONT_HEIGHT)
		sh:SetScript("OnEnter", function()
			local step = VGuide.UI.Display:GetStep()
			this:SetTextColor(.91, .91, .91, .99)
			this:SetBackdropColor(.3, .3, .3, .7)
		end)
		sh:SetScript("OnLeave", function()
			local tColF = VGuide.db.char.UIoptions.StepFrameColor
			local step = VGuide.UI.Display:GetStep()
		    local t = tonumber(strsub(this:GetName(), 11))
			this:SetTextColor(tColT.nR, tColT.nG, tColT.nB, tColT.nA)
			if t == step then
				this:SetBackdropColor(tColF.nR, tColF.nG, tColF.nB, tColF.nA)
			else
				this:SetBackdropColor(.1, .1, .1, .5)
			end
		end)
		sh:SetScript("OnMouseUp", function()
			if arg1 == "LeftButton" then
				local step = VGuide.UI.Display:GetStep()
				this:GetParent().shEntryHandle[step]:SetBackdropColor(.1, .1, .1, .5)
				local t = strsub(this:GetName(), 11)
				local locX, locY, zone
				locX, locY, zone = StepChange(VGuide.UI.Display, "Step", tonumber(t))
				if VGuide.db.char.MetaMapBWPSupportEnable then
					UI.SetMetaMapBWPDestination(locX, locY, zone)
				end
			end
		end)
		shEH[i] = sh
	end
	fParent:Show()
	--D(" SummonSimpleHTMLs end")
	return shEH
end

function UI.RefreshScrollFrame(oDisplay)
	--D("UI.RefreshScrollFrame")
	local stepCount = oDisplay:GetCurrCount()
	--local StepFrame = VGuide.db.profile.UIoptions.StepFrameVisible
	--local StepScroll = VGuide.db.profile.UIoptions.StepScroll
	local StepFrame = VGuide.db.char.UIoptions.StepFrameVisible
	local StepScroll = VGuide.db.char.UIoptions.StepScroll
    local fMain = getglobal("VG_MainFrame")
	local fScroll = getglobal("VG_MainFrame_ScrollFrame")
	local fChild = getglobal("VG_MainFrame_ScrollFrameChild")
	local fSlider = getglobal("VG_MainFrame_ScrollFrameSlider")
	local mainFrameWidth = fMain:GetWidth()
	local scrollFrameWidth = fScroll:GetWidth()
	local scrollFrameHeight = fScroll:GetHeight()
	local s = fScroll:GetEffectiveScale()
	--D("s: " .. s .. " Effective Width: " .. scrollFrameWidth * (1/s))
	scrollFrameWidth = scrollFrameWidth * (1/s)
	
	local totalHeight = 0
	local stepTable = {}
	stepTable.text = oDisplay:GetScrollFrameCurrEntry()
	stepTable.textWidth = {}
	stepTable.textHeight = {}
	local frame = CreateFrame("Frame", nil, nil)
	local fs = frame:CreateFontString(nil, "ARTWORK", VG_FONT)
	fs:SetFont(VG_FONT_PATH, VG_FONT_HEIGHT)
	for i = 1, stepCount do
		fs:SetText(stepTable.text[i])
		stepTable.textWidth[i] = fs:GetWidth()
		local val = math.floor(stepTable.textWidth[i] / (scrollFrameWidth))
		--if val < 1 then val = 1 end
		--stepTable.textHeight[i] = (math.floor(stepTable.textWidth[i] / (scrollFrameWidth)) + 1) * VG_FONT_HEIGHT + 5
		stepTable.textHeight[i] = (val + 1) * VG_FONT_HEIGHT + 5
		totalHeight = totalHeight + stepTable.textHeight[i] + VG_SCROLLFRAME_PADDING
	end
	totalHeight = totalHeight - VG_SCROLLFRAME_PADDING

	local nFrameH = nil
	local sliderVisible = nil
	local shWidth = nil
	nFrameH = fScroll:GetHeight() + 5
	if totalHeight - nFrameH + 10 > 0 then
		fSlider:SetMinMaxValues(0, totalHeight - nFrameH + 10)
		fSlider:Show()
		fScroll:SetPoint("BOTTOMRIGHT", fMain, "BOTTOMRIGHT", -25, 27)
		sliderVisible = true
		shWidth = mainFrameWidth - 40
	else
		fSlider:SetMinMaxValues(0, 0)
		fSlider:SetValue(0)
		fSlider:Hide()
		fScroll:SetPoint("BOTTOMRIGHT", fMain, "BOTTOMRIGHT", -5, 27)
		sliderVisible = false
		shWidth = mainFrameWidth - 40 + 20
	end
	totalHeight = 0
	local shEH = fChild.shEntryHandle or {}
	for k, v in pairs(shEH) do
		if k <= stepCount then
			if not sliderVisible then
				local val = math.floor(stepTable.textWidth[k] / (scrollFrameWidth + 20))
				--if val < 1 then val = 1 end
				--stepTable.textHeight[k] = (math.floor(stepTable.strippedColorTextWidth[k] / (mainFrameWidth - 40 + 20)) + 1) * 10 + 5
				--stepTable.textHeight[k] = (math.floor(stepTable.textWidth[k] / (mainFrameWidth - 50 + 20)) + 1) * VG_FONT_HEIGHT + 5
				--stepTable.textHeight[k] = (math.floor(stepTable.textWidth[k] / (scrollFrameWidth + 20)) + 1) * VG_FONT_HEIGHT + 5
				stepTable.textHeight[k] = (val+1) * VG_FONT_HEIGHT + 5
			end
			totalHeight = totalHeight + stepTable.textHeight[k] + VG_SCROLLFRAME_PADDING
			v:SetWidth(shWidth)
			v:SetHeight(stepTable.textHeight[k])
			v:SetText(stepTable.text[k])
			v:Show()
			v.scrollFrameWidth = scrollFrameWidth
			v.textHeight = stepTable.textHeight[k]
			v.textWidth = stepTable.textWidth[k]
			--D("   -- Width: " .. shWidth .. "   --- Height: " .. stepTable.textHeight[k] .. "  -- Text: " .. stepTable.text[k])
		else
			v:Hide()
			v = nil
		end
	end
	totalHeight = totalHeight - VG_SCROLLFRAME_PADDING
	fChild:SetHeight(totalHeight)
	fScroll:UpdateScrollChildRect()
	--D("UI.RefreshScrollFrame End")
	return shWidth, totalHeight
end

function UI.SetMetaMapBWPDestination(nX, nY, sZone)
	local StepInfo = {
		x = nX,
		y = nY,
		zone = sZone
	}
	
	if VGuide.db.char.MetaMapBWPSupport then -- redundant check...if you get to here, the Support should be alread present!
		if StepInfo.x and StepInfo.y and StepInfo.zone then
			--D(" !- UI.SetMetaMapBWPDestination -!")		
			--D("   StepInfo.zone: " .. StepInfo.zone)
			--D("   StepInfo - [x,y]: [" .. StepInfo.x .. "," .. StepInfo.y .. "]")
			--D("   StepInfo - [x,y]: [" .. StepInfo.x/100 .. "," .. StepInfo.y/100 .. "]")
			--D("    GetRealZoneText(): " .. GetRealZoneText())
			local continent, zone = MetaMap_NameToZoneID(GetRealZoneText())
			--D("    MetaMap_NameToZoneID - Continent: " .. continent .. " - Zone: " .. zone)
			BWP_Destination = {}
			BWP_Destination.name = StepInfo.zone
			BWP_Destination.x = StepInfo.x/100
			BWP_Destination.y = StepInfo.y/100
			BWP_Destination.zone = MetaMap_ZoneNames[continent][zone]
			--D("    MetaMap_ZoneNames[continent][zone]: " .. MetaMap_ZoneNames[continent][zone])
			if StepInfo.zone == BWP_Destination.zone then
				--BWP_ClearDest() 
				local frame = getglobal("BWPDestText")
				frame:SetText("["..BWP_Destination.name.."] - [" .. BWP_Destination.x*100 .. "," .. BWP_Destination.y*100 .. "]")
				local frame = getglobal("BWPDistanceText")
				frame:SetText(BWP_GetDistText())
				local frame = getglobal("BWP_DisplayFrame")
				frame:Show()
			else
				BWP_ClearDest() 
				local frame = getglobal("BWP_DisplayFrame")
				frame:Hide()
			end
			--D(" !- UI.SetMetaMapBWPDestination -!")
		end
	end
end













--[[ UI.SummonFontStrings
--    ARGUMENTS -
-- parentName: the frame where FontStrings are "parented"
-- nNum: the number of FontStrings to create
--
--    RETURNS -
-- fsEH: table containing the references to newly created FontStrings
--]]
function UI.SummonFontStrings(fParent, nNum)
	--D(" SummonSimpleHTMLs")
	--local tColor = VGuide.db.profile.UIoptions.ScrollFrameTextColor
	local tColT = VGuide.db.char.UIoptions.ScrollFrameTextColor
	--local shEH = fParent.shEntryHandle or {}
	local fsEH = fParent.fsEntryHandle or {}
	
	fParent:Hide()
	for i = 1, nNum do
		local fs = fsEH[i]
		if fs then
			fs:Hide()
		else
			fs = fParent:CreateFontString("VG_shEntry"..i, "ARTWORK", "GameFontNormalSmall")
			fs:Hide()
			--fs:EnableMouse(true)
			--sh:SetTextColor(.59, .59, .59, .71)
			fs:SetTextColor(tColT.nR, tColT.nG, tColT.nB, tColT.nA)
			fs:SetJustifyH("LEFT")
			fs:SetJustifyV("TOP")
			if i > 1 then
				fs:SetPoint("TOPLEFT", fsEH[i-1], "BOTTOMLEFT", 0, -VG_SCROLLFRAME_PADDING)
			else
				fs:SetPoint("TOPLEFT", fParent, "TOPLEFT", 5, -15)
			end
		end
		frame = CreateFrame("Frame", nil, fParent)
		--frame:SetAllPoints(fs)
		frame:SetPoint("TOPLEFT", fs ,"TOPLEFT", -3, 3)
		frame:SetPoint("BOTTOMRIGHT", fs ,"BOTTOMRIGHT", 3, -3)
		
		frame:SetBackdrop(bdsh)
		frame:SetBackdropColor(.1, .1, .1, .5)
		frame:Hide()
		fs.frame = frame
		fs:SetFont(VG_FONT_PATH, VG_FONT_HEIGHT)
		frame:SetScript("OnEnter", function()
			this:GetParent():SetTextColor(.91, .91, .91, .99)
			this:SetBackdropColor(.3, .3, .3, .7)
		end)
		frame:SetScript("OnLeave", function()
			--this:SetTextColor(.59, .59, .59, .71)
			this:GetParent():SetTextColor(tColT.nR, tColT.nG, tColT.nB, tColT.nA)
			this:SetBackdropColor(.1, .1, .1, .5)
		end)
		frame:SetScript("OnMouseUp", function()
			if arg1 == "LeftButton" then
				local t = strsub(this:GetParent():GetName(), 11)
				--D("  Step " .. t .. "    SFW: " .. this.scrollFrameWidth .. " -- w: " .. this.textWidth .. "  - h:" .. this.textHeight)
				--D("    w / SFW : " .. this.textWidth / this.scrollFrameWidth  )
				local locX, locY, zone
				locX, locY, zone = StepChange(VGuide.UI.Display, "Step", tonumber(t))
				if VGuide.db.char.MetaMapBWPSupportEnable then
					UI.SetMetaMapBWPDestination(locX, locY, zone)
				end
			end
		end)
		fsEH[i] = fs
	end
	fParent:Show()
	--D(" SummonSimpleHTMLs end")
	return fsEH
end


function UI.RefreshScrollFrame2(oDisplay)
	--D("UI.RefreshScrollFrame")
	local stepCount = oDisplay:GetCurrCount()
	--local StepFrame = VGuide.db.profile.UIoptions.StepFrameVisible
	--local StepScroll = VGuide.db.profile.UIoptions.StepScroll
	local StepFrame = VGuide.db.char.UIoptions.StepFrameVisible
	local StepScroll = VGuide.db.char.UIoptions.StepScroll
    local fMain = getglobal("VG_MainFrame")
	local fScroll = getglobal("VG_MainFrame_ScrollFrame")
	local fChild = getglobal("VG_MainFrame_ScrollFrameChild")
	local fSlider = getglobal("VG_MainFrame_ScrollFrameSlider")
	local mainFrameWidth = fMain:GetWidth()
	local scrollFrameWidth = fScroll:GetWidth()
	local scrollFrameHeight = fScroll:GetHeight()
	local s = fScroll:GetEffectiveScale()
	--D("s: " .. s .. " Effective Width: " .. scrollFrameWidth * (1/s))
	--scrollFrameWidth = scrollFrameWidth * (1/s)
	
	local totalHeight = 0
		
	local fsEH = fChild.fsEntryHandle or {}
	--D(fsEH)
	--[[
	for i = 1, stepCount do
		totalHeight = totalHeight + fsEH[i].frame:GetHeight() + VG_SCROLLFRAME_PADDING
	end
	totalHeight = totalHeight - VG_SCROLLFRAME_PADDING
	--D("  Before: " .. totalHeight)
	local nFrameH = nil
	local sliderVisible = nil
	local shWidth = nil
	nFrameH = fScroll:GetHeight() + 5
	if totalHeight - nFrameH + 10 > 0 then
		fSlider:SetMinMaxValues(0, totalHeight - nFrameH + 10)
		fSlider:Show()
		fScroll:SetPoint("BOTTOMRIGHT", fMain, "BOTTOMRIGHT", -25, 27)
		sliderVisible = true
		shWidth = fScroll:GetWidth()
	else
		fSlider:SetMinMaxValues(0, 0)
		fSlider:SetValue(0)
		fSlider:Hide()
		fScroll:SetPoint("BOTTOMRIGHT", fMain, "BOTTOMRIGHT", -5, 27)
		sliderVisible = false
		shWidth = fScroll:GetWidth()
		
	end
	D("  shWidth: " .. shWidth)
	]]
	local text = oDisplay:GetScrollFrameCurrEntry()
	totalHeight = 0
	for k, v in pairs(fsEH) do
		if k <= stepCount then
			v:SetWidth(fScroll:GetWidth())
			v:SetHeight(15)
			--v:SetPoint("BOTTOMRIGHT", v[k+1], "TOPRIGHT", 0, VG_SCROLLFRAME_PADDING)
			
			v:SetText(text[k])
			totalHeight = totalHeight + v.frame:GetHeight() + VG_SCROLLFRAME_PADDING
			v:Show()
			v.frame:Show()
		else
			v:Hide()
			v.frame:Hide()
			v = nil
		end
	end
	totalHeight = totalHeight - VG_SCROLLFRAME_PADDING
	--D("  After: " .. totalHeight)
	fChild:SetHeight(totalHeight)
	fScroll:UpdateScrollChildRect()
	--D("UI.RefreshScrollFrame End")
	return shWidth, totalHeight
end
--jpT("  <EOF> UI.lua <EOF>")
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--