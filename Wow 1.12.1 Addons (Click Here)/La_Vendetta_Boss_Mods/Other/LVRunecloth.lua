--
-- Auto Return of Reputation v0.2
--

LVBM.AddOns.Runecloth = { 
	["Name"] = "Runecloth", 
	["Abbreviation1"] = "runecloth", 
	["Version"] = "0.2", 
	["Author"] = "Nitram",
	["Description"] = "Allows auto turn in of Runecloth.",
	["Instance"] = LVBM_OTHER,
	["GUITab"] = LVBMGUI_TAB_OTHER,
	["Sort"] = 0,
	["Options"] = {
		["Enabled"] = false, 
		["Announce"] = false, 
	}, 
	["Events"] = {
		["GOSSIP_SHOW"] = true, 	-- Turn In
		["QUEST_PROGRESS"] = true, 	-- Turn In
		["QUEST_COMPLETE"] = true, 	-- Turn In
	}, 	
	["GetItemName"] = function(bag,  slot)
		local itemlink;
		if (bag == -1) then	itemlink = GetInventoryItemLink("player",  slot);
		else			itemlink = GetContainerItemLink(bag,  slot);
		end
		if (itemlink) then
			local _,  _,  name = string.find(itemlink,  "^.*%[(.*)%].*$");
			return name;
		else	return "";
		end
	end, 
	["GetItemCount"] = function(ItemName)
		local anzl,  bagNr,  bagSlot = 0;
		for bagNr = 0,  10,  1 do
			for bagSlot = 1,  GetContainerNumSlots(bagNr),  1 do
				if( LVBM.AddOns.Runecloth.GetItemName(bagNr,  bagSlot) == ItemName) then
					local _,  itemCount = GetContainerItemInfo(bagNr,  bagSlot);
					anzl = anzl + itemCount;
				end
			end
		end
		return anzl;
	end, 
	["OnEvent"] = function(event,  arg1)
		local target = UnitName("target");
		if (event == "GOSSIP_SHOW") then
			if (target == "Raedon Duskstriker"		-- Darnassus Cloth Quartermaster
			 or target == "Clavicus Knavingham"		-- Stormwind Cloth Quartermaster
			 or target == "Bubulo Acerbus"			-- Gnomeregan Cloth Quartermaster
			 or target == "Mistina Steelshield") then	-- Ironforge Cloth Quartermaster

				if (LVBM.AddOns.Runecloth.GetItemCount("Runecloth") >= 20) then SelectGossipAvailableQuest(1);	end
			end
		end
		if (event=="QUEST_PROGRESS") then
			if (target == "Raedon Duskstriker" 
			  or target == "Clavicus Knavingham"
			  or target == "Bubulo Acerbus"
			  or target == "Mistina Steelshield") then

			 	 if( LVBM.AddOns.Runecloth.GetItemCount("Runecloth") == 0) then return; end

				CompleteQuest();
			end
		end
		if (event=="QUEST_COMPLETE") then
			if (target == "Raedon Duskstriker"
			 or target == "Clavicus Knavingham"
			 or target == "Bubulo Acerbus"
			 or target == "Mistina Steelshield") then

				GetQuestReward(0);
				LVBM.AddMsg("Thanks for using La Vendetta Boss Mods!");
			end
		end
	end,
};


