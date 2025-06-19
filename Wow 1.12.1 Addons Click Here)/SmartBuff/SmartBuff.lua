-------------------------------------------------------------------------------
-- SmartBuff
-- Created by Aeldra (EU-Proudmoore)
--
-- Cast the most important buffs on you or party/raid members/pets.
-------------------------------------------------------------------------------

SMARTBUFF_VERSION       = "V1.10d";
SMARTBUFF_TITLE         = "SmartBuff";
SMARTBUFF_SUBTITLE      = "Supports you in cast buffs";
SMARTBUFF_DESC          = "Cast the most important buffs on you or party/raid members/pets";
SMARTBUFF_VERS_TITLE    = SMARTBUFF_TITLE .. " " .. SMARTBUFF_VERSION;
SMARTBUFF_OPTIONS_TITLE = SMARTBUFF_VERS_TITLE .. " Options";

BINDING_HEADER_SMARTBUFF = "SmartBuff";
SMARTBUFF_BOOK_TYPE_SPELL = "spell";

local maxRaid = 40;
local maxBuffs = 32;
local maxCheckButtons = 15;
local numBuffs = 0;
local maxSkipCoolDown = 3;

local isLoaded = false;
local isPlayer = false;
local isInit = false;
local isCombat = false;
local isChecking = false;
local isSetBuffs = false;

local sRealmName = nil;
local sPlayerName = nil;
local sID = nil;
local sPlayerClass = nil;
local iLastSubgroup = 0;
local tLastCheck = 0;
local iGroupSetup = -1;
local cPatterns = nil;
local iLastBuffSetup = -1;
local iLastGroupSetup = -99;

local cGroups = { };
local cBuffs = { };
local cBuffTimer = { };
local cBlacklist = { };
local currentUnit = nil;
local currentSpell = nil;

local imgIconOn  = "Interface\\AddOns\\SmartBuff\\Icons\\MiniMapButtonEnabled";
local imgIconOff = "Interface\\AddOns\\SmartBuff\\Icons\\MiniMapButtonDisabled";

local DebugChatFrame = DEFAULT_CHAT_FRAME;

--local SMARTBUFF_ZMIx;
--local SMARTBUFF_ZMOx;



--Returns a chat color code string
function SMARTBUFF_BCC(r, g, b)
	return string.format("|cff%02x%02x%02x", (r*255), (g*255), (b*255));
end

local BL  = SMARTBUFF_BCC(0, 0, 1);
local BLD = SMARTBUFF_BCC(0, 0, 0.7);
local BLL = SMARTBUFF_BCC(0.5, 0.8, 1);
local GR  = SMARTBUFF_BCC(0, 1, 0);
local GRD = SMARTBUFF_BCC(0, 0.7, 0);
local GRL = SMARTBUFF_BCC(0.6, 1, 0.6);
local RD  = SMARTBUFF_BCC(1, 0, 0);
local RDD = SMARTBUFF_BCC(0.7, 0, 0);
local RDL = SMARTBUFF_BCC(1, 0.3, 0.3);
local YL  = SMARTBUFF_BCC(1, 1, 0);
local YLD = SMARTBUFF_BCC(0.7, 0.7, 0);
local YLL = SMARTBUFF_BCC(1, 1, 0.5);
local OR  = SMARTBUFF_BCC(1, 0.7, 0);
local ORD = SMARTBUFF_BCC(0.7, 0.5, 0);
local ORL = SMARTBUFF_BCC(1, 0.6, 0.3);
local WH  = SMARTBUFF_BCC(1, 1, 1);
local CY  = SMARTBUFF_BCC(0.5, 1, 1);


-- SMARTBUFF_OnLoad
function SMARTBUFF_OnLoad()
	-- Class-based setup
	_, sPlayerClass = UnitClass("player");
	
	this:RegisterEvent("VARIABLES_LOADED");
  this:RegisterEvent("PLAYER_ENTERING_WORLD");
  this:RegisterEvent("UNIT_NAME_UPDATE");
  
  this:RegisterEvent("PARTY_MEMBERS_CHANGED");
  this:RegisterEvent("RAID_ROSTER_UPDATE");
  this:RegisterEvent("PLAYER_REGEN_ENABLED");
	this:RegisterEvent("PLAYER_REGEN_DISABLED");
	
	this:RegisterEvent("LEARNED_SPELL_IN_TAB");
	this:RegisterEvent("ACTIONBAR_HIDEGRID");
	
  this:RegisterEvent("UPDATE_MOUSEOVER_UNIT");
	this:RegisterEvent("PLAYER_AURAS_CHANGED");
	this:RegisterEvent("UNIT_AURA");
  this:RegisterEvent("ACTIONBAR_UPDATE_STATE");
  --this:RegisterEvent("SYSMSG");
  
  this:RegisterEvent("CHAT_MSG_SPELL_FAILED_LOCALPLAYER");
  this:RegisterEvent("SPELLCAST_STOP");
  
  --this:RegisterForClicks("LeftButtonUp");
  --this:RegisterEvent("CHAT_MSG_CHANNEL");

	--SmartBuffTooltip:SetOwner(UIParent, "ANCHOR_NONE");
  
  --One of them allows SmartBuff to be closed with the Escape key
  tinsert(UISpecialFrames, "SmartBuffOptionsFrame");
	UIPanelWindows["SmartBuffOptionsFrame"] = nil;
		
	SlashCmdList["SMARTBUFF"] = SMARTBUFF_command;
	SLASH_SMARTBUFF1 = "/sb";
	SLASH_SMARTBUFF2 = "/smartbuff";

	SlashCmdList["SMARTBUFFMENU"] = SMARTBUFF_OptionsFrame_Toggle;
	SLASH_SMARTBUFFMENU1 = "/sbm";
  
  --SMARTBUFF_ZMIx = CameraZoomIn;
  --SMARTBUFF_ZMOx = CameraZoomOut;
  --CameraZoomIn  = SMARTBUFF_ZMI;
  --CameraZoomOut = SMARTBUFF_ZMO;  
	
end
-- END SMARTBUFF_OnLoad


-- SMARTBUFF_OnEvent
function SMARTBUFF_OnEvent(event, arg1)
	if ((event == "UNIT_NAME_UPDATE" and arg1 == "player") or event == "PLAYER_ENTERING_WORLD") then
		isPlayer = true;
  elseif(event == "VARIABLES_LOADED") then
    isLoaded = true;
  end
  
  if (isLoaded and isPlayer and not isInit) then
    SMARTBUFF_Options_Init();
  end
  
  if (not isInit or not SMARTBUFF_Options.Toggle) then
    return;
  end;  
  
  if (event == "PARTY_MEMBERS_CHANGED" or event == "RAID_ROSTER_UPDATE") then
    SMARTBUFF_SetUnits();
  elseif (event == "PLAYER_REGEN_DISABLED") then
	  SMARTBUFF_AddMsgD("Enter Combat");
	  isCombat = true;
  elseif (event == "PLAYER_REGEN_ENABLED") then
  	SMARTBUFF_AddMsgD("Leave Combat");
	  isCombat = false;
	elseif (event == "LEARNED_SPELL_IN_TAB" or event == "ACTIONBAR_HIDEGRID") then   
    isSetBuffs = true;
  elseif ((event == "UPDATE_MOUSEOVER_UNIT" or event == "UNIT_AURA" or event == "PLAYER_AURAS_CHANGED" or event == "ACTIONBAR_UPDATE_STATE") and SMARTBUFF_Options.ToggleAuto) then
    SMARTBUFF_Check(1);
  elseif (event == "CHAT_MSG_SPELL_FAILED_LOCALPLAYER") then    
    if (isChecking and currentUnit ~= nil and (string.find(currentUnit, "party") or string.find(currentUnit, "raid") or (currentUnit == "target" and SMARTBUFF_Options.Debug))) then
      cBlacklist[currentUnit] = GetTime();
      SMARTBUFF_AddMsgWarn(UnitName(currentUnit) .. " (" .. currentUnit .. ") blacklisted");
    end
    isChecking = false;  
  elseif (event == "SPELLCAST_STOP") then
    if (isChecking) then
      isChecking = false;
      if (currentUnit and currentSpell) then
        local name = UnitName(currentUnit);
        
        if (cBuffTimer[currentUnit] == nil) then
          cBuffTimer[currentUnit] = { };
        end
        cBuffTimer[currentUnit][currentSpell] = GetTime();
        
        SMARTBUFF_AddMsg(name .. ": " .. currentSpell .. " " .. SMARTBUFF_MSG_BUFFED);
      end
    end
  end

end
-- END SMARTBUFF_OnEvent


-- Hook Zoom in and out
function SMARTBUFF_ZMI(arg1)
  --SMARTBUFF_Check(0);
  --SMARTBUFF_ZMIx(arg1);
end
function SMARTBUFF_ZMO(arg1)
  --SMARTBUFF_Check(0);
  --SMARTBUFF_ZMOx(arg1);
end
-- END Hooks


-- Will dump the value of msg to the default chat window
function SMARTBUFF_AddMsg(msg, force)
  if (DEFAULT_CHAT_FRAME and (force or not SMARTBUFF_Options.ToggleMsgNormal)) then
    DEFAULT_CHAT_FRAME:AddMessage(YLL .. msg);
  end
end

function SMARTBUFF_AddMsgErr(msg, force)
  if (DEFAULT_CHAT_FRAME and (force or not SMARTBUFF_Options.ToggleMsgError)) then
    DEFAULT_CHAT_FRAME:AddMessage(RDL .. SMARTBUFF_TITLE .. ": " .. msg);
  end
end

function SMARTBUFF_AddMsgWarn(msg, force)
  if (DEFAULT_CHAT_FRAME and (force or not SMARTBUFF_Options.ToggleMsgWarning)) then
    DEFAULT_CHAT_FRAME:AddMessage(CY .. msg);
  end
end

function SMARTBUFF_AddMsgD(msg, r, g, b)
  if (r == nil) then r = 0.5; end
  if (g == nil) then g = 0.8; end
  if (b == nil) then b = 1; end
  if (DebugChatFrame and SMARTBUFF_Options.Debug) then
    DebugChatFrame:AddMessage(msg, r, g, b);
  end
end


-- Creates an array of units
function SMARTBUFF_SetUnits()
  if (not SMARTBUFF_Options.Toggle) then return; end
  
  local i = 0;
  local n = 0;
  local j = 0;
  local s = nil;
  local psg = 0;
  local b = false;

-- player
-- pet
-- party1-4
-- partypet1-4
-- raid1-40
-- raidpet1-40
 
  iGroupSetup = -1;
  cGroups = nil;
  cGroups = { };
  -- Raid Setup  
  if (GetNumRaidMembers() ~= 0) then
    iGroupSetup = 2;
    local name, rank, subgroup, level, class, classeng, zone, online, isDead;
	  
	  j = 1;
	  for n = 1, GetNumRaidMembers(), 1 do
		  name, rank, subgroup, level, class, classeng, zone, online, isDead = GetRaidRosterInfo(n);
		  
		  if (name == sPlayerName) then
		    psg = subgroup;
		  end
		    		
  		if (SMARTBUFF_Options.ToggleGrp[subgroup]) then
        if (not b and psg == subsubgroup) then b = true; end
	      for i = 1, maxRaid, 1 do
	        s = "";
	        if (name == UnitName("raid"..i)) then
	          if (cGroups[subgroup] == nil) then
	            cGroups[subgroup] = { };
	          end
	          cGroups[subgroup][j] = "raid"..i;
	          if (SMARTBUFF_Options.Debug) then s = "Add raid"..i .. ": " .. name .. "(" .. subgroup .. "/" .. class .. "/" .. classeng .. ")"; end
            j = j + 1;
	          if ((classeng == "HUNTER" and SMARTBUFF_Options.ToggleHunterPets) or (classeng == "WARLOCK" and SMARTBUFF_Options.ToggleWarlockPets)) then
	            cGroups[subgroup][j] = "raidpet"..i;
              if (SMARTBUFF_Options.Debug) then s = s .. ", add raidpet"..i; end
              j = j + 1;
            end
            --SMARTBUFF_AddMsgD(s, 0, 1, 0.5);
	          break
	        end
	      end --end for
	    end
	  end --end for
    if (not b) then
      cGroups[0] = { };
      cGroups[0][0] = "player";
      if (sPlayerClass == "HUNTER") then cGroups[0][1] = "pet"; end
      iLastSubgroup = psg;
    end

		if (iLastSubgroup ~= psg) then
		  SMARTBUFF_AddMsgWarn(SMARTBUFF_TITLE .. ": " .. SMARTBUFF_MSG_SUBGROUP);
		  if (SMARTBUFF_Options.ToggleSubGrpChanged) then
        SMARTBUFF_Options.ToggleGrp[psg] = true;
		    if (SmartBuffOptionsFrame:IsVisible()) then
		      SMARTBUFF_Options_ReloadSubGroups();
		    else
		      SMARTBUFF_OptionsFrame_Open();
		    end
		  end
		  iLastSubgroup = psg;
		end	  
	  SMARTBUFF_AddMsgD("Raid Unit-Setup finished");
	
	-- Party Setup
	elseif (GetNumPartyMembers() ~= 0) then
	  iGroupSetup = 1;
	  cGroups[1] = { };
	  cGroups[1][0] = "player";
	  if (sPlayerClass == "HUNTER") then cGroups[1][9] = "pet"; end
    for j = 1, 4, 1 do
      cGroups[1][j] = "party"..j;
      cGroups[1][j + 4] = "partypet"..j;
      --SMARTBUFF_AddMsgD("Add party"..j, 0, 1, 0.5);
    end
    SMARTBUFF_AddMsgD("Party Unit-Setup finished");
  
  -- Solo Setup
  else
    iGroupSetup = 0;
    cGroups[0] = { };
    cGroups[0][0] = "player";
    if (sPlayerClass == "HUNTER") then cGroups[0][1] = "pet"; end
    SMARTBUFF_AddMsgD("Solo Unit-Setup finished");
  end
  
  if (iGroupSetup ~= iLastGroupSetup) then
    iLastGroupSetup = iGroupSetup;
    cBlacklist = nil;
    cBlacklist = { };
    cBuffTimer = nil
    cBuffTimer = { };
  end
  
end
-- END SMARTBUFF_SetUnits


-- Get Spell ID from spellbook
function SMARTBUFF_GetSpellID(spellname)
	if (spellname) then 
	  spellname = string.lower(spellname);
	else
	  return nil;
	end
	
	local i = 0;
	local id = nil;
	local spellN;
	while true do
	  i = i + 1;
   	spellN = GetSpellName(i, SMARTBUFF_BOOK_TYPE_SPELL);
   	--if (spellN) then SMARTBUFF_AddMsgD(spellN .. " found"); end
   	if (not spellN or string.lower(spellN) == spellname) then
   	  break;
   	end   	
	end
	while (spellN ~= nil) do
	  id = i;
	  i = i + 1;
   	spellN = GetSpellName(i, SMARTBUFF_BOOK_TYPE_SPELL);
   	--if (spellN) then SMARTBUFF_AddMsgD(spellname .. " ID = " .. id); end 	
	  if (not spellN or string.lower(spellN) ~= spellname) then 
		  break;
		end
	end	
	return id;
end
-- END SMARTBUFF_GetSpellID


-- Get the action slot of the spell
function SMARTBUFF_GetActionSlot(spellname, spellicon)
	if (spellname and spellicon) then 
	  spellname = string.lower(spellname);
	else
	  return nil;
	end
	
	local slot = 1;
	local icon = nil;
	local name = nil;
	local text = nil;
	while (slot <= 120) do
	  if (HasAction(slot)) then
	    icon = GetActionTexture(slot);
	    --if (icon and GetActionText(slot) == nil) then
      if (icon) then
        SmartBuffTooltip:SetOwner(SmartBuffFrame, "ANCHOR_NONE");
	    	SmartBuffTooltip:ClearLines();
				SmartBuffTooltip:SetAction(slot);
        name = SmartBuffTooltipTextLeft1:GetText();
        text = SmartBuffTooltipTextLeft4:GetText();
		    if (name ~= nil) then
			    name = string.lower(name);
			    if(name == spellname) then
			      SMARTBUFF_AddMsgD(spellname .. " action slot: " .. slot);
			      return slot, text;
			    end
		    end 
		  end
		end
	  slot = slot + 1;
	end	
	return nil, nil;
end
-- END SMARTBUFF_GetActionSlot


-- Set the buff array
function SMARTBUFF_SetBuffs()
  --if (not SMARTBUFF_Options.Toggle) then return; end
  
  local n = 1;
  local buff = nil;
 
  cBuffs = nil; 
  cBuffs = { };
  cPatterns = nil;
  numBuffs = 0;
  if (sPlayerClass == "DRUID") then
    for _, buff in SMARTBUFF_DRUID do
      n = SMARTBUFF_SetBuff(buff, n);
    end
    
  elseif (sPlayerClass == "MAGE") then
    for _, buff in SMARTBUFF_MAGE do
      n = SMARTBUFF_SetBuff(buff, n);
    end    
    cPatterns = SMARTBUFF_MAGE_PATTERN;
    
  elseif (sPlayerClass == "PRIEST") then
    for _, buff in SMARTBUFF_PRIEST do
      n = SMARTBUFF_SetBuff(buff, n);
    end
    
  elseif (sPlayerClass == "WARLOCK") then
    for _, buff in SMARTBUFF_WARLOCK do
      n = SMARTBUFF_SetBuff(buff, n);
    end
    cPatterns = SMARTBUFF_WARLOCK_PATTERN;
    
  elseif (sPlayerClass == "HUNTER") then
    for _, buff in SMARTBUFF_HUNTER do
      n = SMARTBUFF_SetBuff(buff, n);
    end     
    cPatterns = SMARTBUFF_HUNTER_PATTERN;
    
  elseif (sPlayerClass == "SHAMAN") then
    for _, buff in SMARTBUFF_SHAMAN  do
      n = SMARTBUFF_SetBuff(buff, n);
    end
    
  elseif (sPlayerClass == "WARRIOR") then
    for _, buff in SMARTBUFF_WARRIOR  do
      n = SMARTBUFF_SetBuff(buff, n);
    end
        
  elseif (sPlayerClass == "ROGUE") then
    for _, buff in SMARTBUFF_ROGUE  do
      n = SMARTBUFF_SetBuff(buff, n);
    end
    
  elseif (sPlayerClass == "PALADIN") then
    for _, buff in SMARTBUFF_PALADIN  do
      n = SMARTBUFF_SetBuff(buff, n);
    end
    
  end
  
  for _, buff in SMARTBUFF_TRACKING do
    n = SMARTBUFF_SetBuff(buff, n);
  end
  
  numBuffs = n - 1;
  
  isSetBuffs = false;
end

function SMARTBUFF_SetBuff(buff, i)
  if (buff == nil or i > maxCheckButtons) then return i; end
  
  cBuffs[i] = nil;
  cBuffs[i] = { };
  cBuffs[i].BuffS = buff[1];
  cBuffs[i].DurationS = ceil(buff[2] * 60);
  cBuffs[i].Type = buff[3];
  cBuffs[i].IDS = SMARTBUFF_GetSpellID(cBuffs[i].BuffS);
  if (cBuffs[i].IDS == nil and cBuffs[i].Type ~= SMARTBUFF_CONST_INV) then
    cBuffs[i] = nil;
    return i;
  end
  
  if (cBuffs[i].IDS) then
    cBuffs[i].IconS = GetSpellTexture(cBuffs[i].IDS, SMARTBUFF_BOOK_TYPE_SPELL);
    cBuffs[i].ASS, cBuffs[i].TextS = SMARTBUFF_GetActionSlot(cBuffs[i].BuffS, cBuffs[i].IconS);  
  else
    local j = 1;
    --for j = 1, GetNumCrafts(), 1 do
    --  local craftName, craftSubSpellName, craftType, numAvailable, isExpanded = GetCraftInfo(j)
    --  if (craftName) then
    --    SMARTBUFF_AddMsgD(j .. ". " .. craftName .. ", " .. craftSubSpellName .. ", " .. craftType);
    --  end
    --end
    cBuffs[i].IconS = nil;
    cBuffs[i].ASS = nil;
    cBuffs[i].TextS = "";
  end
  cBuffs[i].ToggleS = SMARTBUFF_Options.ToggleBuff["S"..i];
  
  if (cBuffs[i].ASS == nil and (cBuffs[i].ToggleS and cBuffs[i].Type == SMARTBUFF_CONST_GROUP)) then
    SMARTBUFF_AddMsgErr(cBuffs[i].BuffS .. " " .. SMARTBUFF_MSG_NOACTIONSLOT);
  end
  
  if (buff[4] ~= nil) then cBuffs[i].LevelsS = buff[4]; else cBuffs[i].LevelsS = nil; end
  if (buff[5] ~= nil) then cBuffs[i].Exclude = buff[5]; else cBuffs[i].Exclude = "x"; end
  
  cBuffs[i].BuffG = buff[6];
  cBuffs[i].IDG = SMARTBUFF_GetSpellID(cBuffs[i].BuffG);
  if (cBuffs[i].IDG ~= nil) then 
    cBuffs[i].IconG = GetSpellTexture(cBuffs[i].IDG, SMARTBUFF_BOOK_TYPE_SPELL);
  else
    cBuffs[i].IconG = nil;
  end
  cBuffs[i].ASG, cBuffs[i].TextG = SMARTBUFF_GetActionSlot(cBuffs[i].BuffG, cBuffs[i].IconG);
  cBuffs[i].ToggleG = SMARTBUFF_Options.ToggleBuff["G"..i];
  if (cBuffs[i].IDG ~= nil and cBuffs[i].ASG == nil and cBuffs[i].ToggleG) then SMARTBUFF_AddMsgErr(cBuffs[i].BuffG .. " " .. SMARTBUFF_MSG_NOACTIONSLOT); end
  if (buff[7] ~= nil) then cBuffs[i].DurationG = ceil(buff[7] * 60); else cBuffs[i].DurationG = nil; end
  if (buff[8] ~= nil) then cBuffs[i].LevelsG = buff[8]; else cBuffs[i].LevelsG = nil; end
  if (buff[9] ~= nil) then cBuffs[i].ReagentG = buff[9]; else cBuffs[i].ReagentG = nil; end
  
  if (SMARTBUFF_Options.Debug) then
    local s = cBuffs[i].BuffS;
    if (cBuffs[i].IDS) then s = s .. " ID = " .. cBuffs[i].IDS .. ", Icon = " .. cBuffs[i].IconS; else s = s .. " ID = nil"; end
    if (cBuffs[i].BuffG ~= nil) then 
      s = s .. " - " .. cBuffs[i].BuffG;
      if (cBuffs[i].IDG) then s = s .. " ID = " .. cBuffs[i].IDG .. ", Icon = " .. cBuffs[i].IconG; else s = s .. " ID = nil"; end
    end
    SMARTBUFF_AddMsgD(s);
  end 
  
  return i + 1;
end
-- END SMARTBUFF_SetBuffs


-- Main Check functions
function SMARTBUFF_PreCheck(mode)

  if (not SMARTBUFF_Options.Toggle) then
    if (mode == 0) then
      SMARTBUFF_AddMsg(SMARTBUFF_MSG_DISABLED);
    end
    return false;
  end
  
  if (mode == 1 and ((GetTime() - tLastCheck) < SMARTBUFF_Options.AutoTimer)) then
    return false;
  else
    tLastCheck = GetTime();
  end

  if ((mode == 1 and not SMARTBUFF_Options.ToggleAuto) or (mode == 1 and isCombat and not SMARTBUFF_Options.ToggleAutoCombat) or SMARTBUFF_IsMounted() 
    or UnitOnTaxi("player") or UnitIsDeadOrGhost("player") or UnitIsCorpse("player") or (mode == 1 and (SMARTBUFF_Options.ToggleAutoRest and IsResting()) and not UnitIsPVP("player"))) then
    return false;
  end
   
  if (isSetBuffs) then
    SMARTBUFF_SetBuffs();
  end
	
	return true;
end


function SMARTBUFF_IsShapeshifted()
	if (sPlayerClass == "DRUID") then
	  local i;
  	for i = 1, GetNumShapeshiftForms() do
  		local icon, name, active = GetShapeshiftFormInfo(i);
  		if (active == 1) then
        if (mode == 0) then
          SMARTBUFF_AddMsgWarn(SMARTBUFF_MSG_SHAPESHIFT .. ": " .. name);
        end
        return true, name;
      end
  	end  
  end
  return false, nil;
end


function SMARTBUFF_Check(mode)
  if (not SMARTBUFF_PreCheck(mode)) then
    return;
  end
  
  local unit = nil;
  local unitL = nil;
  local unitU = nil;
  local uLevel = nil;
  local uLevelL = nil;
  local uLevelU = nil;
  local idL = nil;
  local idU = nil;
  local subgroup = 0;
  local i;
  local j;
  local n;
  local m;
  local rc;
  local rank;
  local reagent;
  
  --isChecking = true;
  SMARTBUFF_checkBlacklist();
  
  for subgroup, units in cGroups do
    
    -- check group buff
    if (mode == 0 and not SMARTBUFF_Options.SelfOnly) then
      i = 1;
      while (cBuffs[i] and cBuffs[i].BuffS and (iGroupSetup > 0 or SMARTBUFF_Options.Debug)) do
        if (cBuffs[i].BuffG and cBuffs[i].ToggleG and (cBuffs[i].IDG ~= nil or SMARTBUFF_Options.Debug)) then          
          n = 0;
          m = 0;
          j = 0;
          uLevelL = 100;
          uLevelU = 0;
          local tmpUnits = { };
          for j, unit in units do
            if (unit and (string.find(unit, "raid%d+") or string.find(unit, "party%d") or unit == "player")) then             
              SMARTBUFF_AddMsgD("Checking " .. cBuffs[i].BuffG .. " " .. unit);              
              n = n + 1;	
  	          if (UnitExists(unit) and not UnitIsDeadOrGhost(unit) and not UnitIsCorpse(unit) and UnitIsConnected(unit) and UnitIsVisible(unit) and not UnitOnTaxi(unit)) then
                tmpUnits[n] = unit;
  	            uLevel = UnitLevel(unit);
  	            if (uLevel < uLevelL) then
  	              uLevelL = uLevel;
  	              unitL = unit;
  	            end
  	            if (uLevel > uLevelU) then
  	              uLevelU = uLevel;
  	              unitU = unit;
  	            end
  	            if (SMARTBUFF_CheckUnitBuffs(unit, cBuffs[i].BuffG, cBuffs[i].IconG, cBuffs[i].BuffG, cBuffs[i].IconG) ~= nil) then
  	              m = m + 1;
  	            end
  	          end
  	        end
  	      end
          
  	      if (unitL ~= nil and unitU ~=nil and cBuffs[i].IDG ~= nil) then
            idU, rank = SMARTBUFF_CheckUnitLevel(unitU, cBuffs[i].IDG, cBuffs[i].LevelsG);
            idL, rank = SMARTBUFF_CheckUnitLevel(unitL, cBuffs[i].IDG, cBuffs[i].LevelsG);
            
            SMARTBUFF_AddMsgD(cBuffs[i].BuffG .. " (" .. rank .. ") " .. m .. " of " .. n .. " not buffed, lowest/highest level " .. uLevelL .. "/" .. uLevelU);            
  	        if (idL ~= nil and idU ~= nil and idL == idU and rank > 0 and m >= SMARTBUFF_Options.GrpBuffSize and n >= SMARTBUFF_Options.GrpBuffSize) then
  	        
              reagent = cBuffs[i].ReagentG[rank];
              if (reagent) then
                rc = SMARTBUFF_CountReagent(reagent);
                if (rc > 0) then
                  currentUnit = nil;
                  currentSpell = nil;
                  j = SMARTBUFF_doCast(unitU, idU, cBuffs[i].ASS, nil, SMARTBUFF_CONST_GROUP)
                  --SMARTBUFF_AddMsgD("Buffing group (" .. unitU .. ") " .. subgroup .. ", " .. j .. ", " .. cBuffs[i].ASG .. ", ");
 	                if (j == 0) then
                    SMARTBUFF_AddMsg(SMARTBUFF_MSG_GROUP .. " " .. subgroup .. ": " .. cBuffs[i].BuffG .. " " .. SMARTBUFF_MSG_BUFFED)
                    SMARTBUFF_AddMsg(SMARTBUFF_MSG_STOCK .. " " .. reagent .. " = " .. (rc - 1));
                    --isChecking = false;
                    for j, unit in tmpUnits do
                      if (cBuffTimer[unit]) then
                        cBuffTimer[unit] = { };
                      end
                      cBuffTimer[unit][cBuffs[i].BuffS] = nil;
                      cBuffTimer[unit][cBuffs[i].BuffG] = GetTime();
                    end
                    return;
                  end
  	            else
  	              SMARTBUFF_AddMsgWarn(SMARTBUFF_MSG_NOREAGENT .. " " .. reagent .. "! " .. cBuffs[i].BuffG .. " " .. SMARTBUFF_MSG_DEACTIVATED);
  	              SMARTBUFF_Options.ToggleBuff["G"..i] = false;
  	              cBuffs[i].ToggleG = false;
  	            end
  	          else
  	            SMARTBUFF_AddMsgD("Reagent = nil");
  	          end
  	        end
  	      end
  	    end
  	    i = i + 1;
  	  end
  	end
  	
    -- check single buff
    j = 0;
    for j, unit in units do
      i = SMARTBUFF_BuffUnit(unit, subgroup, mode);
      if (i == 0 or i == 1) then
        return;
      end
    end
  
  end -- for groups
  
  if (mode == 0) then SMARTBUFF_AddMsg(SMARTBUFF_MSG_NOTHINGTODO); end
  tLastCheck = GetTime();
  isChecking = false;
end
-- END SMARTBUFF_Check


-- Buffs a unit
function SMARTBUFF_BuffUnit(unit, subgroup, mode)
  local buff = nil;
  local name = nil;
  local uc = nil;
  local uct = nil;
  local ucf = nil;
  local r;
  local i;
  local bt = 0;
  local bExpire = false;
  
  isChecking = true;
    
  if (UnitExists(unit) and UnitIsFriend("player", unit) and not UnitIsDeadOrGhost(unit) and not UnitIsCorpse(unit)
    and UnitIsConnected(unit) and UnitIsVisible(unit) and not UnitOnTaxi(unit) and cBlacklist[unit] == nil) then
    
  	_, uc = UnitClass(unit);
  	uct = UnitCreatureType(unit);
	  ucf = UnitCreatureFamily(unit);
	  if (uct == nil) then uct = ""; end
    if (ucf == nil) then ucf = ""; end
    
  	if (uct == SMARTBUFF_HUMANOID or (uct == SMARTBUFF_DEMON and ucf ~= SMARTBUFF_DEMONTYPE and SMARTBUFF_Options.ToggleWarlockPets)
  	  or (uct == SMARTBUFF_BEAST and SMARTBUFF_Options.ToggleHunterPets)) then
  	  
      name = UnitName(unit);
      
      if (SMARTBUFF_Options.SelfOnly and name ~= sPlayerName) then
        return 3;
      end
      
      if (name) then SMARTBUFF_AddMsgD("Grp " .. subgroup .. " checking " .. name .. " (" .. uct .. "/" .. ucf .. "/".. unit .. ")...", 0, 1, 0.5); end

      i = 1;
      while (cBuffs[i] and cBuffs[i].BuffS) do
        bExpire = false;
        if (cBuffs[i].ToggleS and (cBuffs[i].IDS ~= nil or cBuffs[i].Type == SMARTBUFF_CONST_INV) and (not SMARTBUFF_Options.ToggleARules or (SMARTBUFF_Options.ToggleARules and not string.find(cBuffs[i].Exclude, uc)))) then
          if (cBuffs[i].Type == SMARTBUFF_CONST_GROUP or (name == sPlayerName and (cBuffs[i].Type == SMARTBUFF_CONST_SELF or cBuffs[i].Type == SMARTBUFF_CONST_TRACK or cBuffs[i].Type == SMARTBUFF_CONST_WEAPON or cBuffs[i].Type == SMARTBUFF_CONST_INV))) then
            
            -- check if spell has cooldown
	          local cd = 0;
            if (cBuffs[i].IDS) then _, cd = GetSpellCooldown(cBuffs[i].IDS, SMARTBUFF_BOOK_TYPE_SPELL); end
  	        if (cd == 0) then
  	        
              if (not SMARTBUFF_Options.ToggleARules or (SMARTBUFF_Options.ToggleARules and (cBuffs[i].Exclude == nil or not string.find(cBuffs[i].Exclude, "#NOMANA#") or (string.find(cBuffs[i].Exclude, "#NOMANA#") and UnitPowerType(unit) == 0)))) then
                buff = nil;
                
                -- Tracking ability
                if (cBuffs[i].Type == SMARTBUFF_CONST_TRACK) then 
                  local iconTrack = GetTrackingTexture();
                  if (iconTrack) then
                    SMARTBUFF_AddMsgD("Track already enabled: " .. iconTrack);
                  else
                    local b, shapename = SMARTBUFF_IsShapeshifted();
                    if (b) then
                      SMARTBUFF_AddMsgD(shapename);
                    end
                    
                    if (sPlayerClass ~= "DRUID" or ((not b and cBuffs[i].BuffS ~= SMARTBUFF_DRUID_TRACK) or (b and shapename == SMARTBUFF_DRUID_CAT))) then
                      buff = cBuffs[i].BuffS;
                    end
                  end
                  
                -- Weapon buff
                elseif (cBuffs[i].Type == SMARTBUFF_CONST_WEAPON or cBuffs[i].Type == SMARTBUFF_CONST_INV) then
                  local b = false;
	                SmartBuffTooltip:SetOwner(SmartBuffFrame, "ANCHOR_NONE");
	                SmartBuffTooltip:ClearLines();                  
                  local mainH,_,_ = SmartBuffTooltip:SetInventoryItem("player", 16);
                  local offH,_,_ = SmartBuffTooltip:SetInventoryItem("player", 17);
                  if (mainH) then
					          b, bt,_,_,_,_ = GetWeaponEnchantInfo();
					          if (b) then
					            if (SMARTBUFF_Options.RebuffTimer > 0 and cBuffs[i].DurationS >= 1) then
					              bt = floor(bt/1000);
					              SMARTBUFF_AddMsgD(name .. " (W): " .. cBuffs[i].BuffS .. string.format(" %.0f sec left", bt));
                        if (bt <= SMARTBUFF_Options.RebuffTimer) then
                          buff = cBuffs[i].BuffS;
                          bExpire = true;                          
                        end					            
						          end
					          else
					            buff = cBuffs[i].BuffS;
					          end
					        else
					          SMARTBUFF_AddMsgD("Weapon Buff cannot be cast, no melee weapon equipped");
					        end
                  
                  if (cBuffs[i].Type == SMARTBUFF_CONST_INV) then
                    local cr = SMARTBUFF_CountReagent(cBuffs[i].BuffS);
                    if (cr > 0) then
                      SMARTBUFF_AddMsgD(cr .. " " .. cBuffs[i].BuffS .. " found");
                      --SMARTBUFF_AddMsgD("Using " .. cBuffs[i].BuffS .. " on " .. mainH);
                    else
                      SMARTBUFF_AddMsgD("No " .. cBuffs[i].BuffS .. " found");
                      buff = nil;
                    end
                  end                
					        
					      -- Normal buff
                else
                  if (sPlayerClass ~= "DRUID" or not SMARTBUFF_IsShapeshifted() or mode == 1) then
                    local index = nil;
                    
                    if (unit ~= "target" and cBuffs[i].BuffG ~= nil) then
                      buff, index = SMARTBUFF_CheckUnitBuffs(unit, cBuffs[i].BuffG, cBuffs[i].IconG, nil, nil);
                      if (buff == nil and cBuffTimer[unit] ~= nil) then
                        cBuffTimer[unit][cBuffs[i].BuffS] = nil;
                        SMARTBUFF_AddMsgD(name .. " (S): " .. cBuffs[i].BuffS .. " timer reset");
                      end
                    end
                    
                    buff, index = SMARTBUFF_CheckUnitBuffs(unit, cBuffs[i].BuffS, cBuffs[i].IconS, cBuffs[i].BuffG, cBuffs[i].IconG);
                    if (unit ~= "target" and buff == nil and cBuffs[i].DurationS >= 1 and SMARTBUFF_Options.RebuffTimer > 0) then
                      --if (name == sPlayerName) then
                      --  bt = GetPlayerBuffTimeLeft(GetPlayerBuff(index));
                      -- SMARTBUFF_AddMsgD(name .. " (P): " .. index .. "/" .. GetPlayerBuff(index) .. " " .. cBuffs[i].BuffS .. string.format(" %.0f sec left", bt));
                      --else
                      if (cBuffTimer[unit] ~= nil and (cBuffTimer[unit][cBuffs[i].BuffS] ~= nil or cBuffTimer[unit][cBuffs[i].BuffG] ~= nil)) then
                        if (cBuffTimer[unit][cBuffs[i].BuffS] ~= nil) then
                          bt = cBuffs[i].DurationS - (GetTime() - cBuffTimer[unit][cBuffs[i].BuffS]);
                          SMARTBUFF_AddMsgD(name .. " (S): " .. cBuffs[i].BuffS .. string.format(" %.0f sec left", bt));
                        elseif (cBuffTimer[unit][cBuffs[i].BuffG] ~= nil) then
                          bt = cBuffs[i].DurationG - (GetTime() - cBuffTimer[unit][cBuffs[i].BuffG]);
                          SMARTBUFF_AddMsgD(name .. " (G): " .. cBuffs[i].BuffG .. string.format(" %.0f sec left", bt));
                        end
                      else
                        bt = nil;
                      end
                      
                      if (bt and bt <= SMARTBUFF_Options.RebuffTimer) then
                        buff = cBuffs[i].BuffS;
                        bExpire = true;
                      end
                    end
                    
                  end
                end
                
                if (buff) then
	                --SMARTBUFF_AddMsgD("Checking " ..i .. " - " .. cBuffs[i].IDS .. " " .. cBuffs[i].BuffS);              
                  if (mode == 0) then
                    
                    if (cBuffs[i].Type == SMARTBUFF_CONST_INV) then
                      local b = false;
                      local mh, mhbt, mhc, oh, ohbt, ohc = GetWeaponEnchantInfo();
                      local bag, slot, count = SMARTBUFF_FindReagent(cBuffs[i].BuffS);
                      if (bag) then
                        if (mh) then
                          mhbt = floor(bt/1000);
                          if (mhbt <= SMARTBUFF_Options.RebuffTimer) then
                            b = true;
                          end
                        else
                          b = true;
                        end
                        if (b) then
                          UseContainerItem(bag, slot);
                          PickupInventoryItem(16);
                          return 0;
                        end
                      end
                      r = 9;
                    else
                      -- try to buff
                      currentUnit = unit;
                      currentSpell = cBuffs[i].BuffS;
                      r = SMARTBUFF_doCast(unit, cBuffs[i].IDS, cBuffs[i].ASS, cBuffs[i].LevelsS, cBuffs[i].Type);
                    end;
                  elseif (mode == 1) then
                    -- show buff message
                    currentUnit = nil;
                    currentSpell = nil;                  
                    if (SMARTBUFF_CheckUnitLevel(unit, cBuffs[i].IDS, cBuffs[i].LevelsS) ~= nil or cBuffs[i].Type == SMARTBUFF_CONST_INV) then
                      if (SMARTBUFF_Options.ToggleAutoSplash) then
                        if (bExpire) then
                          if (bt < 0) then bt = 0; end
                          SmartBuffSplashFrame:AddMessage(name .. "\n" .. SMARTBUFF_MSG_REBUFF .. " " .. cBuffs[i].BuffS .. string.format(": %.0f", bt) .. " sec " .. SMARTBUFF_MSG_LEFT, 1, 1, 1, 1, 3);
                        else
                          SmartBuffSplashFrame:AddMessage(name .. " " .. SMARTBUFF_MSG_NEEDS .. " " .. cBuffs[i].BuffS, 1, 1, 1, 1, 3);
                        end
                      end
                      if (SMARTBUFF_Options.ToggleAutoChat) then
                        if (bExpire) then
                          if (bt < 0) then bt = 0; end
                          SMARTBUFF_AddMsgWarn(name .. ": " .. SMARTBUFF_MSG_REBUFF .. " " .. cBuffs[i].BuffS .. string.format(", %.0f", bt) .. " sec " .. SMARTBUFF_MSG_LEFT, true);
                        else
                          SMARTBUFF_AddMsgWarn(name .. " " .. SMARTBUFF_MSG_NEEDS .. " " .. cBuffs[i].BuffS, true);
                        end
                      end
                      if (SMARTBUFF_Options.ToggleAutoSound) then
                        PlaySound(SMARTBUFF_CONST_AUTOSOUND);
                      end
                      isChecking = false;
                      return 0;
                    end
                  end
                  if (r == 0) then
                    -- target buffed
                    -- Message will printed in the "SPELLCAST_STOP" event                    
                    return 0;
                  elseif (r == 1) then
                    -- spell cooldown
                    if (mode == 0) then SMARTBUFF_AddMsgWarn(cBuffs[i].BuffS .. " " .. SMARTBUFF_MSG_CD); end
                    isChecking = false;
                    return 1;
                  elseif (r == 2) then
                    -- can not target
                    if (mode == 0 and ucf ~= SMARTBUFF_DEMONTYPE) then SMARTBUFF_AddMsgD("Can not target " .. name); end
                  elseif (r == 3) then
                    -- target oor
                    if (mode == 0) then SMARTBUFF_AddMsgWarn(name .. " " .. SMARTBUFF_MSG_OOR); end
                    break;
                  elseif (r == 4) then
                    -- spell cooldown > maxSkipCoolDown
                    if (mode == 0) then SMARTBUFF_AddMsgD(cBuffs[i].BuffS .. " " .. SMARTBUFF_MSG_CD .. " > " .. maxSkipCoolDown); end
                  elseif (r == 5) then
                    -- target to low
                    if (mode == 0) then SMARTBUFF_AddMsgD(name .. " is to low to get buffed"); end
                  elseif (r == 6) then
                    -- not enough mana
                    if (mode == 0) then SMARTBUFF_AddMsgWarn(SMARTBUFF_MSG_OOM); end
                    isChecking = false;
                    if (sPlayerClass ~= "WARRIOR" and sPlayerClass ~= "ROGUE") then
                      return 1;
                    end
                  elseif (r == 7) then
                    -- tracking ability is already active
                    if (mode == 0) then SMARTBUFF_AddMsgD(cBuffs[i].BuffS .. " not used, other ability already active"); end
                  elseif (r == 8) then
                    -- actionslot is not defined
                    if (mode == 0) then SMARTBUFF_AddMsgD(cBuffs[i].BuffS .. " has no actionslot"); end
                  elseif (r == 9) then
                    -- spell ID not found
                    if (mode == 0) then SMARTBUFF_AddMsgD(cBuffs[i].BuffS .. " spellID not found"); end
                  else
                    -- no spell selected
				      	    if (mode == 0) then SMARTBUFF_AddMsgWarn(SMARTBUFF_MSG_CHAT); end
                  end
                else
                  -- finished
                  if (mode == 0) then SMARTBUFF_AddMsgD(name .. " nothing to buff"); end
                end
              else
                -- target has no mana
                if (mode == 0) then SMARTBUFF_AddMsgD(name .. " needs no int buff"); end            
              end
            else
              -- cooldown
            end
          end -- group or self
        end
        i = i + 1;
      end -- while buff
      
    end
  end
  isChecking = false;
  return 3;
end
-- END SMARTBUFF_BuffUnit


-- Check the unit blacklist
function SMARTBUFF_checkBlacklist()
  local t = GetTime();
  for unit in cBlacklist do
    if (t > (cBlacklist[unit] + SMARTBUFF_Options.BlacklistTimer)) then
      cBlacklist[unit] = nil;
    end
  end
end
-- END SMARTBUFF_checkBlacklist


-- Casts a spell
function SMARTBUFF_doCast(unit, id, actionSlot, levels, type)
  if (id == nil) then return 9; end
  if (type == SMARTBUFF_CONST_GROUP and actionSlot == nil) then return 8; end
  if (type == SMARTBUFF_CONST_TRACK and GetTrackingTexture()) then 
    local iconTrack = GetTrackingTexture();
    SMARTBUFF_AddMsgD("Track already enabled: " .. iconTrack);
    return 7; 
  end
  	
	-- check if spell has cooldown
	local _, cd = GetSpellCooldown(id, SMARTBUFF_BOOK_TYPE_SPELL)
	if (cd > maxSkipCoolDown) then
	  return 4;
  elseif (cd > 0) then 
    return 1;
  end
  
  local name = UnitName("target");  
  if (not UnitIsUnit("target", unit)) then
    TargetUnit(unit);
	end
  
  if (type == SMARTBUFF_CONST_GROUP) then
    -- check if target is out of range
    if (not UnitIsUnit("target", unit) or IsActionInRange(actionSlot) ~= 1) then return 3; end
    
    id = SMARTBUFF_CheckUnitLevel(unit, id, levels);
    -- check if target is to low for this spell
    if (id == nil) then return 5; end
  end
  
  if (actionSlot ~= nil) then
    -- check if you have enough mana to cast
    local isUsable, notEnoughMana = IsUsableAction(actionSlot);
    if (notEnoughMana) then return 6; end
  end
  
  CastSpell(id, SMARTBUFF_BOOK_TYPE_SPELL);  
 
  -- restore old target
  if (unit == "target") then
    TargetUnit(unit);
  elseif (name) then
    TargetUnit("playertarget");
  else
    ClearTarget();
  end
  
  return 0;
end
-- END SMARTBUFF_doCast


-- Will return the name of the buff to cast
function SMARTBUFF_CheckUnitBuffs(unit, buffS, iconS, buffG, iconG) 
  local index = 0;
  local buff = nil;
  local icon = nil;
  local s = "";
  local b = false;
  local i = 0;
  local pat = "";
  local pattern = "";
  
  if (cPatterns ~= nil) then
    for i, pat in cPatterns do
      if (string.find(buffS, pat)) then
        pattern = pat;
        b = true;
        break;
      end
    end
  end
 
  index = 1;
  while (index <= maxBuffs) do
  	icon = UnitBuff(unit, index);
  	if (icon) then
      buff = SMARTBUFF_GetBuffName(unit, index, 1);
      if (buff and buffS) then
        SMARTBUFF_AddMsgD(UnitName(unit) .. " " .. index .. ". " .. buff .. " - " .. icon, 0, 1, 0.5);
        if (b and string.find(buff, pattern)) then
          return nil, index;
        end

        if (string.find(buffS, buff) or (buffG ~= nil and string.find(buffG, buff))) then
          --SMARTBUFF_AddMsgD("Buff found: " .. buff);
          -- Buff found
          return nil, index;
        end
      else
        --SMARTBUFF_AddMsgD(UnitName(unit) .. " " .. index .. ". " .. icon, 0, 1, 0.5);
        --if (icon == iconS or icon == iconG) then
          --SMARTBUFF_AddMsgD("Buff found: " .. buff);
          -- Buff found
          --return nil;
        --end      
      end
    end
    index = index + 1;
  end
  --SMARTBUFF_AddMsgD("Buff not found");
  -- Buff not found, return default buff
  return buffS, nil;
end
-- END SMARTBUFF_CheckUnitBuffs


-- Will return the lower Id of the spell, if the unit level is lower
function SMARTBUFF_CheckUnitLevel(unit, spellId, spellLevels)
  if (spellLevels == nil or spellId == nil) then
    return spellId;
  end
  
  local Id = spellId;
  local uLevel = UnitLevel(unit);
  local spellName, sRank = GetSpellName(Id, SMARTBUFF_BOOK_TYPE_SPELL);
  if (sRank == nil or sRank == "") then 
    sRank = "Rank 1";
  end
  local _, _, spellRank = string.find(sRank, "(%d+)");
  
  spellRank = tonumber(spellRank);
  SMARTBUFF_AddMsgD(spellName .. sRank .. ":" .. spellRank);
  
  i = spellRank;
  while (i >= 1) do
    if (uLevel >= (spellLevels[i] - 10)) then
      break;
    end
    i = i - 1;
  end
  
  if (i > 0) then
    Id = Id - (spellRank - i);
    SMARTBUFF_AddMsgD(uLevel .. " " .. spellName .. " Rank " .. i .. " - ID = " .. Id);
  else
    Id = nil;
    SMARTBUFF_AddMsgD(spellName .. ": no rank available for this level");
  end;
  
  return Id, i;
end
-- END SMARTBUFF_CheckUnitLevel


-- Will return the name/description of the buff 
function SMARTBUFF_GetBuffName(unit, buffIndex, line)
	local i = buffIndex;
	local name = nil;

  if (i < 1 or i > maxBuffs) then
    return nil;
  end	  
	SmartBuffTooltip:SetOwner(SmartBuffFrame, "ANCHOR_NONE");
	SmartBuffTooltip:ClearLines();
	SmartBuffTooltip:SetUnitBuff(unit, i);
	local obj = getglobal("SmartBuffTooltipTextLeft" .. line);
  name = obj:GetText();
	return name;
end
-- END SMARTBUFF_GetBuffName


-- Checks if the player is mounted
function SMARTBUFF_IsMounted()
  local found = false;
  local id = 0;
  local buff = nil;
  while (id <= 32) do
    icon = GetPlayerBuffTexture(id);
    buff = SMARTBUFF_GetBuffName("player", id + 1, 2);
    --if (buff and icon) then SMARTBUFF_AddMsgD(id .. ". " .. buff .. " - " .. icon); end
    if (buff and icon and string.find(buff, SMARTBUFF_MOUNT)) then
      SMARTBUFF_AddMsgD("Mounted: " .. buff);
      found = true;
      break
    end
    id = id + 1;
  end
  return found;
end
-- END Checks if the player is mounted


-- Returns the number of a reagent currently in player's bag
function SMARTBUFF_CountReagent(reagent)
  if (reagent == nil) then return 99; end
	local n = 0;
	local bag = 0;
	local slot = 0;
	for bag = 0, NUM_BAG_FRAMES do
		for slot = 1, GetContainerNumSlots(bag) do
		local itemName = GetContainerItemLink(bag, slot);
			if itemName then
				if string.find(itemName, "%[" .. reagent .. "%]") then
					local texture, count = GetContainerItemInfo(bag, slot);
					n = n + count;
				end
			end
		end
	end
	return n;
end

function SMARTBUFF_FindReagent(reagent)
  if (reagent == nil) then return 99; end
	local n = 0;
	local bag = 0;
	local slot = 0;
	for bag = 0, NUM_BAG_FRAMES do
		for slot = 1, GetContainerNumSlots(bag) do
		local itemName = GetContainerItemLink(bag, slot);
			if itemName then
				if string.find(itemName, "%[" .. reagent .. "%]") then
					local texture, count = GetContainerItemInfo(bag, slot);
          return bag, slot, count;
				end
			end
		end
	end
	return nil, nil, nil;
end


-- Bool helper functions
function SMARTBUFF_toggleBool(b, msg)
  if (not b or b == nil) then
    b = true;
    SMARTBUFF_AddMsg(SMARTBUFF_TITLE .. ": " .. msg .. GR .. "On");
  else
    b = false
    SMARTBUFF_AddMsg(SMARTBUFF_TITLE .. ": " .. msg .. RD .."Off");
  end
  return b;
end

function SMARTBUFF_BoolState(b, msg)
  if (b) then
    SMARTBUFF_AddMsg(SMARTBUFF_TITLE .. ": " .. msg .. GR .. "On");
  else
    SMARTBUFF_AddMsg(SMARTBUFF_TITLE .. ": " .. msg .. RD .."Off");
  end
end
-- END Bool helper functions


-- Sets the correct icon on the minimapbutton
function SMARTBUFF_CheckMiniMapButton()
  if (SMARTBUFF_Options.Toggle) then
    SmartBuffOptionsMiniMapButton:SetNormalTexture(imgIconOn);
	else
    SmartBuffOptionsMiniMapButton:SetNormalTexture(imgIconOff);
	end
	
	if (SMARTBUFF_Options.HideMmButton) then
	  SmartBuffOptionsMiniMapButton:Hide();
	else
	  SmartBuffOptionsMiniMapButton:Show();
	end
end
-- END SMARTBUFF_CheckMiniMapButton


-- Init the SmartBuff variables
function SMARTBUFF_Options_Init()
  if (isInit) then
  	return
  end 

	sRealmName = GetCVar("RealmName");
	sPlayerName = UnitName("player");
	sID = sRealmName .. ":" .. sPlayerName;
  
  if (not SMARTBUFF_Options) then SMARTBUFF_Options = { }; end
	if (SMARTBUFF_Options.Toggle == nil) then	SMARTBUFF_Options.Toggle = true; end
	if (SMARTBUFF_Options.ToggleAuto == nil) then	SMARTBUFF_Options.ToggleAuto = true; end
	if (SMARTBUFF_Options.AutoTimer == nil) then	SMARTBUFF_Options.AutoTimer = 20; end
	if (SMARTBUFF_Options.BlacklistTimer == nil) then	SMARTBUFF_Options.BlacklistTimer = 30; end
	if (SMARTBUFF_Options.ToggleAutoCombat == nil) then	SMARTBUFF_Options.ToggleAutoCombat = false; end
  if (SMARTBUFF_Options.ToggleAutoChat == nil) then	SMARTBUFF_Options.ToggleAutoChat = false; end
  if (SMARTBUFF_Options.ToggleAutoSplash == nil) then	SMARTBUFF_Options.ToggleAutoSplash = true; end
  if (SMARTBUFF_Options.ToggleAutoSound == nil) then	SMARTBUFF_Options.ToggleAutoSound = false; end
  if (SMARTBUFF_Options.ToggleAutoRest == nil) then	SMARTBUFF_Options.ToggleAutoRest = true; end
	if (SMARTBUFF_Options.ToggleHunterPets == nil) then	SMARTBUFF_Options.ToggleHunterPets = true; end
	if (SMARTBUFF_Options.ToggleWarlockPets == nil) then	SMARTBUFF_Options.ToggleWarlockPets = false; end
	if (SMARTBUFF_Options.ToggleARules == nil) then	SMARTBUFF_Options.ToggleARules = true; end
	if (SMARTBUFF_Options.ToggleGrp == nil) then	SMARTBUFF_Options.ToggleGrp = {true, false, false, false, false, false, false, false}; end
	if (SMARTBUFF_Options.ToggleSubGrpChanged == nil) then	SMARTBUFF_Options.ToggleSubGrpChanged = false; end
	if (SMARTBUFF_Options.ToggleMsgNormal == nil) then	SMARTBUFF_Options.ToggleMsgNormal = false; end
	if (SMARTBUFF_Options.ToggleMsgWarning == nil) then	SMARTBUFF_Options.ToggleMsgWarning = false; end
	if (SMARTBUFF_Options.ToggleMsgError == nil) then	SMARTBUFF_Options.ToggleMsgError = false; end
	if (SMARTBUFF_Options.HideMmButton == nil) then	SMARTBUFF_Options.HideMmButton = false; end
	if (SMARTBUFF_Options.RebuffTimer == nil) then	SMARTBUFF_Options.RebuffTimer = 20; end
	if (SMARTBUFF_Options.SelfOnly == nil) then	SMARTBUFF_Options.SelfOnly = false; end
	
	if (SMARTBUFF_Options.GrpBuffSize == nil) then	SMARTBUFF_Options.GrpBuffSize = 4; end

	--if (SMARTBUFF_Options.ToggleBuff == nil) then	SMARTBUFF_Options.ToggleBuff = {true, false, false, false, false}; end
	if (SMARTBUFF_Options.ToggleBuff == nil) then	SMARTBUFF_Options.ToggleBuff = { }; end
  if (SMARTBUFF_Options.ToggleBuff["S1"] == nil) then SMARTBUFF_Options.ToggleBuff["S1"] = true; end
  if (SMARTBUFF_Options.ToggleBuff["G1"] == nil) then SMARTBUFF_Options.ToggleBuff["G1"] = true; end
	local i;
	for i = 2, maxCheckButtons, 1 do
	  if (SMARTBUFF_Options.ToggleBuff["S"..i] == nil) then SMARTBUFF_Options.ToggleBuff["S"..i] = false; end
	  if (SMARTBUFF_Options.ToggleBuff["G"..i] == nil) then SMARTBUFF_Options.ToggleBuff["G"..i] = false; end
	end
  
  if (SMARTBUFF_Options.FirstStart == nil) then SMARTBUFF_Options.FirstStart = "V0";	end
  if (SMARTBUFF_Options.Debug == nil) then SMARTBUFF_Options.Debug = false;	end
	
	-- support for Cosmos
	if(Cosmos_RegisterButton) then
		Cosmos_RegisterButton(
			SMARTBUFF_VERS_TITLE,
			SMARTBUFF_SUBTITLE,
			SMARTBUFF_DESC,
			"Interface\\Icons\\Spell_Nature_Purge",
			SMARTBUFF_OptionsFrame_Toggle);
	end	

	-- support for CTMod
	if(CT_RegisterMod) then
		CT_RegisterMod(
			SMARTBUFF_VERS_TITLE,
			SMARTBUFF_SUBTITLE,
			5,
			"Interface\\Icons\\Spell_Nature_Purge",
			SMARTBUFF_DESC,
			"switch",
			"",
			SMARTBUFF_OptionsFrame_Toggle);
	end
	
	SMARTBUFF_CheckMiniMapButton();
  
	SMARTBUFF_SetBuffs();
	SMARTBUFF_SetUnits();
	
	SMARTBUFF_AddMsg(SMARTBUFF_VERS_TITLE .. " " .. SMARTBUFF_MSG_LOADED, true);
  SMARTBUFF_AddMsg("/sb menu - " .. SMARTBUFF_OFT_MENU, true);
	isInit = true;
	
	if (SMARTBUFF_Options.FirstStart ~= SMARTBUFF_VERSION) then
	  SMARTBUFF_Options.FirstStart = SMARTBUFF_VERSION;
	  SMARTBUFF_OptionsFrame_Open(true);
	end
end
-- END SMARTBUFF_Options_Init


-- SmartBuff commandline menu
function SMARTBUFF_command(msg)
  if(msg == "toggle" or msg == "t") then
    SMARTBUFF_OToggle();
    SMARTBUFF_SetUnits();
    SMARTBUFF_SetBuffs();
  elseif (msg == "menu") then
    SMARTBUFF_OptionsFrame_Toggle();
  elseif (msg == "target") then
    if (SMARTBUFF_PreCheck(0)) then
      SMARTBUFF_checkBlacklist();
      SMARTBUFF_BuffUnit("target", 0, 0);
    end     
  elseif (msg == "help" or msg == "?") then
    SMARTBUFF_AddMsg(SMARTBUFF_VERS_TITLE, true);
    SMARTBUFF_AddMsg("Syntax: /sb [command] or /smartbuff [command]", true);
    SMARTBUFF_AddMsg("toggle  -  " .. SMARTBUFF_OFT, true);
    SMARTBUFF_AddMsg("menu     -  " .. SMARTBUFF_OFT_MENU, true);
    SMARTBUFF_AddMsg("target  -  " .. SMARTBUFF_OFT_TARGET, true);    
  
  elseif (msg == "debug") then
    SMARTBUFF_Options.Debug = SMARTBUFF_toggleBool(SMARTBUFF_Options.Debug, "Debug active = ");
  elseif (msg == "debugd") then
    sPlayerClass = "DRUID";
    SMARTBUFF_AddMsgD("Now you are a " .. sPlayerClass);
    SMARTBUFF_SetBuffs();
  elseif (msg == "debugm") then
    sPlayerClass = "MAGE";
    SMARTBUFF_AddMsgD("Now you are a " .. sPlayerClass);
    SMARTBUFF_SetBuffs();
  elseif (msg == "debugp") then
    sPlayerClass = "PRIEST";
    SMARTBUFF_AddMsgD("Now you are a " .. sPlayerClass);
    SMARTBUFF_SetBuffs();  
  elseif (msg == "open") then
    SMARTBUFF_OptionsFrame_Open(true);
  elseif (msg == "reload") then
    SMARTBUFF_Options_ReloadSubGroups();
  elseif (msg == "setsg1") then
    SMARTBUFF_Options.ToggleGrp[1] = true;
  elseif (msg == "gbs1") then
    SMARTBUFF_Options.GrpBuffSize = 1;
  elseif (msg == "gbs4") then
    SMARTBUFF_Options.GrpBuffSize = 4;
    
  else
    SMARTBUFF_Check(0);
  end
end
-- END SMARTBUFF_command


-- SmartBuff options toggle
function SMARTBUFF_OToggle()
  SMARTBUFF_Options.Toggle = SMARTBUFF_toggleBool(SMARTBUFF_Options.Toggle, "Active = ");
  SMARTBUFF_CheckMiniMapButton();
end

function SMARTBUFF_OToggleAuto()
  SMARTBUFF_Options.ToggleAuto = not SMARTBUFF_Options.ToggleAuto;
end
function SMARTBUFF_OToggleAutoCombat()
  SMARTBUFF_Options.ToggleAutoCombat = not SMARTBUFF_Options.ToggleAutoCombat;
end
function SMARTBUFF_OToggleAutoChat()
  SMARTBUFF_Options.ToggleAutoChat = not SMARTBUFF_Options.ToggleAutoChat;
end
function SMARTBUFF_OToggleAutoSplash()
  SMARTBUFF_Options.ToggleAutoSplash = not SMARTBUFF_Options.ToggleAutoSplash;
end
function SMARTBUFF_OToggleAutoSound()
  SMARTBUFF_Options.ToggleAutoSound = not SMARTBUFF_Options.ToggleAutoSound;
end
function SMARTBUFF_OToggleAutoRest()
  SMARTBUFF_Options.ToggleAutoRest = not SMARTBUFF_Options.ToggleAutoRest;
end


function SMARTBUFF_OToggleHunterPets()
  SMARTBUFF_Options.ToggleHunterPets = not SMARTBUFF_Options.ToggleHunterPets;
end
function SMARTBUFF_OToggleWarlockPets()
  SMARTBUFF_Options.ToggleWarlockPets = not SMARTBUFF_Options.ToggleWarlockPets;
end

function SMARTBUFF_OToggleARules()
  SMARTBUFF_Options.ToggleARules = not SMARTBUFF_Options.ToggleARules;
end

function SMARTBUFF_OToggleGrp(i)
  SMARTBUFF_Options.ToggleGrp[i] = not SMARTBUFF_Options.ToggleGrp[i];
end

function SMARTBUFF_OToggleSubGrpChanged()
  SMARTBUFF_Options.ToggleSubGrpChanged = not SMARTBUFF_Options.ToggleSubGrpChanged;
end

function SMARTBUFF_OToggleMsgNormal()
  SMARTBUFF_Options.ToggleMsgNormal = not SMARTBUFF_Options.ToggleMsgNormal;
end
function SMARTBUFF_OToggleMsgWarning()
  SMARTBUFF_Options.ToggleMsgWarning = not SMARTBUFF_Options.ToggleMsgWarning;
end
function SMARTBUFF_OToggleMsgError()
  SMARTBUFF_Options.ToggleMsgError = not SMARTBUFF_Options.ToggleMsgError;
end

function SMARTBUFF_OHideMmButton()
  SMARTBUFF_Options.HideMmButton = not SMARTBUFF_Options.HideMmButton;
  SMARTBUFF_CheckMiniMapButton();
end

function SMARTBUFF_OSelfOnly()
  SMARTBUFF_Options.SelfOnly = not SMARTBUFF_Options.SelfOnly;
end

function SMARTBUFF_OToggleBuff(s)
  SMARTBUFF_Options.ToggleBuff[s] = not SMARTBUFF_Options.ToggleBuff[s];
end

function SMARTBUFF_OToggleDebug()
  SMARTBUFF_Options.Debug = not SMARTBUFF_Options.Debug;
end

function SMARTBUFF_OptionsFrame_Toggle()
	if(SmartBuffOptionsFrame:IsVisible()) then
		SmartBuffOptionsFrame:Hide();
	else
		SmartBuffOptionsFrame:Show();
	end
end

function SMARTBUFF_OptionsFrame_Open(force)
	if(not SmartBuffOptionsFrame:IsVisible() or force) then
		SmartBuffOptionsFrame:Show();
	end
end

function SmartBuff_BuffSetup_Show(i)
  local icon = cBuffs[i].IconS;
  local name = cBuffs[i].BuffS;
  local text = cBuffs[i].TextS;
  
  if (name == nil) then
    return;
  end
  
  if (icon) then
    SmartBuff_BuffSetup_BuffIcon:SetNormalTexture(icon);
  end
  local obj = getglobal(SmartBuff_BuffSetup_BuffText:GetName().."Text");
  if (name and text) then
    obj:SetText(name);
    SMARTBUFF_BUFFTEXT = name .. "\n" .. text;
    SMARTBUFF_AddMsgD(name .. "\n" .. text);
  elseif (name) then
    obj:SetText(name);
    SMARTBUFF_BUFFTEXT = name;
    SMARTBUFF_AddMsgD(name);
  else
    obj:SetText("");
    SMARTBUFF_BUFFTEXT = " ";
  end
	
	if(SmartBuff_BuffSetup:IsVisible() and i == iLastBuffSetup) then
		SmartBuff_BuffSetup:Hide();
	else
		--SmartBuff_BuffSetup:Show();
    iLastBuffSetup = i;
	end  
end

-- END SmartBuff options toggle


-- Options Frame events
function SMARTBUFF_Options_OnLoad()
  --UIPanelWindows['SmartBuffOptionsFrame'] = {area = 'center', pushable = 1};
end

function SMARTBUFF_Options_OnShow()
  SmartBuffOptionsFrame_cbSB:SetChecked(SMARTBUFF_Options.Toggle);
  SmartBuffOptionsFrame_cbAuto:SetChecked(SMARTBUFF_Options.ToggleAuto);
  SmartBuffOptionsFrameAutoTimer:SetValue(SMARTBUFF_Options.AutoTimer);
  getglobal(SmartBuffOptionsFrameAutoTimer:GetName().."Text"):SetText(SMARTBUFF_OFT_AUTOTIMER.." "..SMARTBUFF_Options.AutoTimer.." sec");
  SmartBuffOptionsFrame_cbAutoCombat:SetChecked(SMARTBUFF_Options.ToggleAutoCombat);
  SmartBuffOptionsFrame_cbAutoChat:SetChecked(SMARTBUFF_Options.ToggleAutoChat);
  SmartBuffOptionsFrame_cbAutoSplash:SetChecked(SMARTBUFF_Options.ToggleAutoSplash);
  SmartBuffOptionsFrame_cbAutoSound:SetChecked(SMARTBUFF_Options.ToggleAutoSound);
  SmartBuffOptionsFrame_cbAutoRest:SetChecked(SMARTBUFF_Options.ToggleAutoRest);
  SmartBuffOptionsFrame_cbHunterPets:SetChecked(SMARTBUFF_Options.ToggleHunterPets);
  SmartBuffOptionsFrame_cbWarlockPets:SetChecked(SMARTBUFF_Options.ToggleWarlockPets);
  SmartBuffOptionsFrame_cbARules:SetChecked(SMARTBUFF_Options.ToggleARules);
  SmartBuffOptionsFrame_cbSubGrpChanged:SetChecked(SMARTBUFF_Options.ToggleSubGrpChanged);
  SmartBuffOptionsFrame_cbMsgNormal:SetChecked(SMARTBUFF_Options.ToggleMsgNormal);
  SmartBuffOptionsFrame_cbMsgWarning:SetChecked(SMARTBUFF_Options.ToggleMsgWarning);
  SmartBuffOptionsFrame_cbMsgError:SetChecked(SMARTBUFF_Options.ToggleMsgError);
  SmartBuffOptionsFrame_cbHideMmButton:SetChecked(SMARTBUFF_Options.HideMmButton);
  SmartBuffOptionsFrame_cbSelfOnly:SetChecked(SMARTBUFF_Options.SelfOnly);
  
  SmartBuffOptionsFrameGrpBuffSize:SetValue(SMARTBUFF_Options.GrpBuffSize);
  getglobal(SmartBuffOptionsFrameGrpBuffSize:GetName().."Text"):SetText(SMARTBUFF_OFT_GRPBUFFSIZE.." "..SMARTBUFF_Options.GrpBuffSize);
  SmartBuffOptionsFrameRebuffTimer:SetValue(SMARTBUFF_Options.RebuffTimer);
  getglobal(SmartBuffOptionsFrameRebuffTimer:GetName().."Text"):SetText(SMARTBUFF_OFT_REBUFFTIMER.." "..SMARTBUFF_Options.RebuffTimer.." sec");

  SMARTBUFF_Options_ReloadSubGroups();    
  SMARTBUFF_SetCheckButtonBuffs();
  
  SMARTBUFF_AddMsgD("Option frame updated");
end

function SMARTBUFF_Options_ReloadSubGroups()
  SmartBuffOptionsFrame_cbGrp1:SetChecked(SMARTBUFF_Options.ToggleGrp[1]);
  SmartBuffOptionsFrame_cbGrp2:SetChecked(SMARTBUFF_Options.ToggleGrp[2]);
  SmartBuffOptionsFrame_cbGrp3:SetChecked(SMARTBUFF_Options.ToggleGrp[3]);
  SmartBuffOptionsFrame_cbGrp4:SetChecked(SMARTBUFF_Options.ToggleGrp[4]);
  SmartBuffOptionsFrame_cbGrp5:SetChecked(SMARTBUFF_Options.ToggleGrp[5]);
  SmartBuffOptionsFrame_cbGrp6:SetChecked(SMARTBUFF_Options.ToggleGrp[6]);
  SmartBuffOptionsFrame_cbGrp7:SetChecked(SMARTBUFF_Options.ToggleGrp[7]);
  SmartBuffOptionsFrame_cbGrp8:SetChecked(SMARTBUFF_Options.ToggleGrp[8]);
end

function SMARTBUFF_Options_OnHide()
  SMARTBUFF_SetUnits();
  SMARTBUFF_SetBuffs();
end

function SMARTBUFF_OptionsFrame_Apply()
  SMARTBUFF_SetUnits();
  SMARTBUFF_SetBuffs();
end

function SmartBuffOptionsFrameSlider_OnLoad(low, high, step)
	getglobal(this:GetName().."Low"):SetText(low);
	getglobal(this:GetName().."High"):SetText(high);
	this:SetMinMaxValues(low, high);
	this:SetValueStep(step);
end

function SmartBuffOptionsFrameAutoTimer_OnValueChanged()
	SMARTBUFF_Options.AutoTimer = this:GetValue();
	getglobal(this:GetName().."Text"):SetText(SMARTBUFF_OFT_AUTOTIMER.." "..SMARTBUFF_Options.AutoTimer.." sec");
end

function SmartBuffOptionsFrameGrpBuffSize_OnValueChanged()
	SMARTBUFF_Options.GrpBuffSize = this:GetValue();
	getglobal(this:GetName().."Text"):SetText(SMARTBUFF_OFT_GRPBUFFSIZE.." "..SMARTBUFF_Options.GrpBuffSize);
end

function SmartBuffOptionsFrameRebuffTimer_OnValueChanged()
	SMARTBUFF_Options.RebuffTimer = this:GetValue();
	getglobal(this:GetName().."Text"):SetText(SMARTBUFF_OFT_REBUFFTIMER.." "..SMARTBUFF_Options.RebuffTimer.." sec");
end

function SMARTBUFF_SetCheckButtonBuffs() 
	local objS;
	local objG;
	local i = 1;
	while (i <= maxCheckButtons) do
    objS = getglobal("SmartBuffOptionsFrame_cbBuffS"..i);
    objG = getglobal("SmartBuffOptionsFrame_cbBuffG"..i);
	  if (cBuffs[i] and (cBuffs[i].IDS ~= nil or cBuffs[i].Type == SMARTBUFF_CONST_INV)) then
	    if ((cBuffs[i].IDG ~= nil or (cBuffs[i].BuffG ~= nil and SMARTBUFF_Options.Debug)) and objG ~= nil) then
	      getglobal(objS:GetName().."Text"):SetText("");
	      getglobal(objG:GetName().."Text"):SetText(cBuffs[i].BuffS .. "\n" .. cBuffs[i].BuffG);
	      objG:SetChecked(cBuffs[i].ToggleG);
	      objG:Show();
	    else
	      if (objG) then objG:Hide(); end
	      getglobal(objS:GetName().."Text"):SetText(cBuffs[i].BuffS);
	    end
      objS:SetChecked(cBuffs[i].ToggleS);
      objS:Show();
	  else
	    if (objS) then objS:Hide(); end
	    if (objG) then objG:Hide(); end
	  end
	  i = i + 1;
	end
end
-- END Options Frame events
