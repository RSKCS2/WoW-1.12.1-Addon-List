--[[

	SimpleBagStats v2: shows simple stats about your bags

	- includes coloring, individual bags
	
	by phreak

	credits go to: Nevir (for his hsb_to_rgb function)

]]

SimpleBagStats_enabled = 1;
SimpleBagStats_individual = 1;
SimpleBagStats_colored = 1;

SimpleBagStats_color_low_hue    = 0;
SimpleBagStats_color_high_hue   = 120;
SimpleBagStats_color_saturation = 100;
SimpleBagStats_color_brightness = 75;

hsb_to_rgb_table = {};
hsb_to_rgb_table[0] = {"max", "+",   "min"};
hsb_to_rgb_table[1] = {"-",   "max", "min"};
hsb_to_rgb_table[2] = {"min", "max", "+"};
hsb_to_rgb_table[3] = {"min", "-",   "max"};
hsb_to_rgb_table[4] = {"+",   "min", "max"};
hsb_to_rgb_table[5] = {"max", "min", "-"};

color_storage = {};

function SimpleBagStats_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");
  this:RegisterEvent("BAG_UPDATE");
	this:RegisterEvent("UNIT_MODEL_CHANGED");
	this:RegisterEvent("UNIT_INVENTORY_CHANGED");
	-- this:RegisterEvent("PLAYER_ENTERING_WORLD");
	-- this:RegisterEvent("PLAYER_LEAVING_WORLD");
	-- this:RegisterEvent("ADDON_LOADED");
	-- slash handler
    SLASH_SBS1 = "/sbs";
    SLASH_SBS2 = "/simplebagstats";
    SlashCmdList["SBS"] = function(msg)
        SBS_CommandHandler(msg);
    end	
  SBS_ChatPrint("SimpleBagStats loaded");
end

function SBS_ChatPrint(str)
	if ( DEFAULT_CHAT_FRAME ) then 
		DEFAULT_CHAT_FRAME:AddMessage(str, 1.0, 0.5, 0.25);
	end
end

function SBS_CommandHandler(command)
  local i,j, cmd, param = string.find(command, "^([^ ]+) (.+)$");
	if (not cmd) then cmd = command; end
	if (not cmd) then cmd = ""; end
	if (not param) then param = ""; end

	if ((cmd == "") or (cmd == "help") or (cmd == "hilfe")) then
		SBS_ChatPrint(SIMPLEBAGSTATS_TEXT_USAGE);
		SBS_ChatPrint("  |cffffffff/sbs enable - "..SIMPLEBAGSTATS_TEXT_ENABLE_INFO);
		SBS_ChatPrint("  |cffffffff/sbs color - "..SIMPLEBAGSTATS_TEXT_COLOR_INFO);
		SBS_ChatPrint("  |cffffffff/sbs individual - "..SIMPLEBAGSTATS_TEXT_INDIVIDUAL_INFO);
	elseif (cmd == "enable" ) then
		SimpleBagStats_enable();
	elseif (cmd == "color" ) then
		SimpleBagStats_color();
	elseif (cmd == "individual" ) then
		SimpleBagStats_individualize();
	end
end


function SimpleBagStats_Update()
	local SBS_totalSlots = 0;
	local SBS_totalUsedSlots = 0;
	local SBS_numSlots = 0;
	local SBS_tempUsedSlots = 0;
	local SBS_bag0_numSlots = 0;
	local SBS_bag0_usedSlots = 0;
	local SBS_bag1_numSlots = 0;
	local SBS_bag1_usedSlots = 0;
	local SBS_bag2_numSlots = 0;
	local SBS_bag2_usedSlots = 0;
	local SBS_bag3_numSlots = 0;
	local SBS_bag3_usedSlots = 0;
	local SBS_bag4_numSlots = 0;
	local SBS_bag4_usedSlots = 0;
	local SimpleBagStats_bagratio = 0;
	
	saturation = SimpleBagStats_color_saturation;
	brightness = SimpleBagStats_color_brightness;

	for bag = 0, 4, 1 do
		SBS_numSlots = GetContainerNumSlots(bag);
		if (SBS_numSlots ~= 0) then
			SBS_totalSlots = SBS_totalSlots + SBS_numSlots;
				for slot = 1, SBS_numSlots, 1 do
					if (GetContainerItemInfo(bag, slot)) then
						SBS_totalUsedSlots = SBS_totalUsedSlots + 1;
						SBS_tempUsedSlots = SBS_tempUsedSlots + 1;
					end
					if (bag == 0) then
						SBS_bag0_numSlots = SBS_numSlots;
						SBS_bag0_usedSlots = SBS_tempUsedSlots;
					elseif (bag == 1) then
						SBS_bag1_numSlots = SBS_numSlots;
						SBS_bag1_usedSlots = SBS_tempUsedSlots;
					elseif (bag == 2) then
						SBS_bag2_numSlots = SBS_numSlots;
						SBS_bag2_usedSlots = SBS_tempUsedSlots;
					elseif (bag == 3) then
						SBS_bag3_numSlots = SBS_numSlots;
						SBS_bag3_usedSlots = SBS_tempUsedSlots;
					elseif (bag == 4) then
						SBS_bag4_numSlots = SBS_numSlots;
						SBS_bag4_usedSlots = SBS_tempUsedSlots;
					end
				end
				SBS_tempUsedSlots = 0;
		end
	end
	
	if (SimpleBagStats_enabled == 1) then
		if (SimpleBagStats_individual == 1) then
			SimpleBagStatsBag0Text:SetText(SBS_bag0_usedSlots.."/"..SBS_bag0_numSlots);
			if (SimpleBagStats_colored == 1) then
				SimpleBagStats_bagratio = (SBS_bag0_usedSlots / SBS_bag0_numSlots);
				hue=(SimpleBagStats_color_high_hue - math.floor(SimpleBagStats_bagratio*SimpleBagStats_color_high_hue));
				SimpleBagStatsBag0Text:SetTextColor(hsb_to_rgb(hue, saturation, brightness));
			else
				SimpleBagStatsBag0Text:SetTextColor(1,1,1);
			end
			if (SBS_bag1_numSlots ~= 0) then
				SimpleBagStatsBag1Text:SetText(SBS_bag1_usedSlots.."/"..SBS_bag1_numSlots);
				if (SimpleBagStats_colored == 1) then
					SimpleBagStats_bagratio = (SBS_bag1_usedSlots / SBS_bag1_numSlots);
					hue=(SimpleBagStats_color_high_hue - math.floor(SimpleBagStats_bagratio*SimpleBagStats_color_high_hue));
					SimpleBagStatsBag1Text:SetTextColor(hsb_to_rgb(hue, saturation, brightness));
				else
					SimpleBagStatsBag1Text:SetTextColor(1,1,1);
				end
			else
				SimpleBagStatsBag1Text:SetText("");
			end
			if (SBS_bag2_numSlots ~= 0) then
				SimpleBagStatsBag2Text:SetText(SBS_bag2_usedSlots.."/"..SBS_bag2_numSlots);
				if (SimpleBagStats_colored == 1) then
					SimpleBagStats_bagratio = (SBS_bag2_usedSlots / SBS_bag2_numSlots);
					hue=(SimpleBagStats_color_high_hue - math.floor(SimpleBagStats_bagratio*SimpleBagStats_color_high_hue));
					SimpleBagStatsBag2Text:SetTextColor(hsb_to_rgb(hue, saturation, brightness));
				else
					SimpleBagStatsBag2Text:SetTextColor(1,1,1);
				end
			else
				SimpleBagStatsBag2Text:SetText("");
			end
			if (SBS_bag3_numSlots ~= 0) then
				SimpleBagStatsBag3Text:SetText(SBS_bag3_usedSlots.."/"..SBS_bag3_numSlots);
				if (SimpleBagStats_colored == 1) then
					SimpleBagStats_bagratio = (SBS_bag3_usedSlots / SBS_bag3_numSlots);
					hue=(SimpleBagStats_color_high_hue - math.floor(SimpleBagStats_bagratio*SimpleBagStats_color_high_hue));
					SimpleBagStatsBag3Text:SetTextColor(hsb_to_rgb(hue, saturation, brightness));
				else
					SimpleBagStatsBag3Text:SetTextColor(1,1,1);
				end
			else
				SimpleBagStatsBag3Text:SetText("");
			end
			if (SBS_bag4_numSlots ~= 0) then
				SimpleBagStatsBag4Text:SetText(SBS_bag4_usedSlots.."/"..SBS_bag4_numSlots);
				if (SimpleBagStats_colored == 1) then
					SimpleBagStats_bagratio = (SBS_bag4_usedSlots / SBS_bag4_numSlots);
					hue=(SimpleBagStats_color_high_hue - math.floor(SimpleBagStats_bagratio*SimpleBagStats_color_high_hue));
					SimpleBagStatsBag4Text:SetTextColor(hsb_to_rgb(hue, saturation, brightness));
				else
					SimpleBagStatsBag4Text:SetTextColor(1,1,1);
				end
			else
				SimpleBagStatsBag4Text:SetText("");
			end
		else
			if ((SBS_totalSlots == 0) or (SBS_totalSlots == nil)) then
				SBS_totalSlots = 1;
			end
			SimpleBagStatsBag0Text:SetText(SBS_totalUsedSlots.."/"..SBS_totalSlots);
			if (SimpleBagStats_colored == 1) then
				SimpleBagStats_bagratio = (SBS_totalUsedSlots / SBS_totalSlots);
				hue=(SimpleBagStats_color_high_hue - math.floor(SimpleBagStats_bagratio*SimpleBagStats_color_high_hue));
				SimpleBagStatsBag0Text:SetTextColor(hsb_to_rgb(hue, saturation, brightness));
			else
				SimpleBagStatsBag0Text:SetTextColor(1,1,1);
			end
			
			SimpleBagStatsBag1Text:SetText("");
			SimpleBagStatsBag2Text:SetText("");
			SimpleBagStatsBag3Text:SetText("");
			SimpleBagStatsBag4Text:SetText("");
		end
	else
		SimpleBagStatsBag0Text:SetText("");
		SimpleBagStatsBag1Text:SetText("");
		SimpleBagStatsBag2Text:SetText("");
		SimpleBagStatsBag3Text:SetText("");
		SimpleBagStatsBag4Text:SetText("");
	end
end

function SimpleBagStats_enable()	
		if (SimpleBagStats_enabled <= 0) then
			SimpleBagStats_enabled = 1;
		else
			SimpleBagStats_enabled = 0;
		end
		SimpleBagStats_Update();
end

function SimpleBagStats_individualize()
		if (SimpleBagStats_individual <= 0) then
			SimpleBagStats_individual = 1;
		else
			SimpleBagStats_individual = 0;
		end
		SimpleBagStats_Update();
end

function SimpleBagStats_color()
		if (SimpleBagStats_colored <= 0) then
			SimpleBagStats_colored = 1;
		else
			SimpleBagStats_colored = 0;
		end
		SimpleBagStats_Update();
end

function SimpleBagStats_OnEvent(event)
	if (not event) then return; end;
	
  if ((event == "BAG_UPDATE") 
	or (event == "UNIT_MODEL_CHANGED")
	or (event == "UNIT_INVENTORY_CHANGED")
	or (event == "VARIABLES_LOADED")
	) then
     SimpleBagStats_Update();
  end
end

function hsb_to_rgb(hue, saturation, brightness)
	local index, min, max, rgb;

	hue = math.mod(hue, 360);
	index = math.floor(hue / 60);

	min = (brightness / 100) * ((100 - saturation) / 100);
	max = (brightness / 100);

	for color = 1, 3, 1 do
		if (hsb_to_rgb_table[index][color] == "min") then
			color_storage[color] = min;
		elseif (hsb_to_rgb_table[index][color] == "max") then
			color_storage[color] = max;
		elseif (hsb_to_rgb_table[index][color] == "+") then
			color_storage[color] = min + (math.mod(hue, 60) / 60) * (max - min);
		else
			color_storage[color] = max - (math.mod(hue, 60) / 60) * (max - min);
		end
	end

	return color_storage[1], color_storage[2], color_storage[3];
end

