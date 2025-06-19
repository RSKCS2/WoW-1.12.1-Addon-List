function SetWrangler_MakeOtherData()
	local classData = {};
	local setName, partName, partLink, partStats, partInfo;
	local setIndex;
	
	classData.sName							= SW_TEXT_CLASSNAMES[SW_CLASS_OTHER];
	classData.aSetData						= {};
	
	
	------------------------------------
	--  Set 1
	------------------------------------
	setIndex = 1;
	setName = "Black Dragon Mail";
	setTabName = "Black Dragon";
	setInfo = "Crafted Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Improves your chance to hit by 1%.\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."3:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Improves your chance to get a critical strike by 2%.\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."4:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." +10 Fire Resistance.\n\n"..SW_LINK_COLOR_CLOSE
			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."1200\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Stamina: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."35\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Fire: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."55\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Attack Pwr: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."172\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."350\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:15051:0:0:0";
	partInfo	= SW_TEXT_SHOULDER.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:15050:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:15052:0:0:0";
	partInfo	= SW_TEXT_LEGS.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[3]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:16984:0:0:0";
	partInfo	= SW_TEXT_FEET.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[4]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	
	------------------------------------
	--  Set 2
	------------------------------------
	setIndex = 2;
	setName = "Blood Tiger Harness";
	setTabName = "Blood Tiger";
	setInfo = "Crafted Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Improves your chance to get a critical strike with spells by 1%.\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Improves your chance to get a critical strike by 1%.\n\n"..SW_LINK_COLOR_CLOSE
			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."317\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Strength: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."30\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Stamina: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."30\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Intellect: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."28\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Spirit: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."23\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."160\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:19689:0:0:0";
	partInfo	= SW_TEXT_SHOULDER.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:19688:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	------------------------------------
	--  Set 3
	------------------------------------
	setIndex = 3;
	setName = "Bloodsoul Embrace";
	setTabName = "Bloodsoul";
	setInfo = "Crafted Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."3:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Restores 12 mana per 5 sec.\n\n"..SW_LINK_COLOR_CLOSE
			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."905\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Agility: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."43\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Stamina: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."40\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."%Critical: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."3\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."230\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:19691:0:0:0";
	partInfo	= SW_TEXT_SHOULDER.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:19690:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:19692:0:0:0";
	partInfo	= SW_TEXT_HANDS.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[3]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	
	------------------------------------
	--  Set 4
	------------------------------------
	setIndex = 4;
	setName = "Bloodvine Garb";
	setTabName = "Bloodvine";
	setInfo = "Crafted Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."3:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Improves your chance to get a critical strike with spells by 2%.\n\n"..SW_LINK_COLOR_CLOSE
			  		  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."235\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Intellect: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."35\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."185\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:19682:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Tailors\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:19683:0:0:0";
	partInfo	= SW_TEXT_LEGS.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Tailors\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:19684:0:0:0";
	partInfo	= SW_TEXT_FEET.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Tailors\n";
	classData.aSetData[setIndex].aPartData[3]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	
	------------------------------------
	--  Set 5
	------------------------------------
	setIndex = 5;
	setName = "Blue Dragon Mail";
	setTabName = "Blue Dragon";
	setInfo = "Crafted Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." +4 All Resistances.\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."3:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Increases damage and healing done by magical spells and effects by up to 28.\n\n"..SW_LINK_COLOR_CLOSE
			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."910\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Intellect: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."69\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Spirit: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."33\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Arcane: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."26\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."280\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:15049:0:0:0";
	partInfo	= SW_TEXT_SHOULDER.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:15048:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:20295:0:0:0";
	partInfo	= SW_TEXT_LEGS.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[3]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	------------------------------------
	--  Set 6
	------------------------------------
	setIndex = 6;
	setName = "The Darksoul";
	setTabName = "Darksoul";
	setInfo = "Crafted Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."3:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Increased Defense +20.\n\n"..SW_LINK_COLOR_CLOSE
			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."1965\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Stamina: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."78\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."To Hit: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."4\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."315\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:19695:0:0:0";
	partInfo	= SW_TEXT_SHOULDER.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:19693:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:19694:0:0:0";
	partInfo	= SW_TEXT_LEGS.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[3]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	
	------------------------------------
	--  Set 7
	------------------------------------
	setIndex = 7;
	setName = "Devilsaur Armor";
	setTabName = "Devilsaur Armor";
	setInfo = "Crafted Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Improves your chance to hit by 2%.\n\n"..SW_LINK_COLOR_CLOSE
			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."251\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Stamina: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."21\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."%Critical: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."2\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."110\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:15062:0:0:0";
	partInfo	= SW_TEXT_LEGS.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:15063:0:0:0";
	partInfo	= SW_TEXT_HANDS.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	------------------------------------
	--  Set 8
	------------------------------------
	setIndex = 8;
	setName = "The Gladiator";
	setTabName = "Gladiator";
	setInfo = "Lesser Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." +20 Armor\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."3:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Increased Defense +2\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."4:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." +10 Attack Power\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."5:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Improves your chance to get a critical strike by 1%\n\n"..SW_LINK_COLOR_CLOSE
			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."1384\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Strength: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."25\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Agility: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."22\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Stamina: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."87\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Spirit: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."44\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."%Critical: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."2\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Defense: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."13\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."400\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:11729:0:0:0";
	partInfo	= SW_TEXT_HEAD.." - "..SW_AREA_BRD;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_BRD.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Gorosh the Dervish (7.3%)\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:11726:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_BRD;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_BRD.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Gorosh the Dervish (7.3%)\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:11728:0:0:0";
	partInfo	= SW_TEXT_LEGS.." - "..SW_AREA_BRD;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_BRD.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Gorosh the Dervish (13.4%)\n";
	classData.aSetData[setIndex].aPartData[3]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:11730:0:0:0";
	partInfo	= SW_TEXT_HANDS.." - "..SW_AREA_BRD;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_BRD.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Gorosh the Dervish (18.5%)\n";
	classData.aSetData[setIndex].aPartData[4]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:11731:0:0:0";
	partInfo	= SW_TEXT_FEET.." - "..SW_AREA_BRD;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_BRD.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Gorosh the Dervish (21.6%)\n";
	classData.aSetData[setIndex].aPartData[5]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	
	------------------------------------
	--  Set 9
	------------------------------------
	setIndex = 9;
	setName = "Green Dragon Mail";
	setTabName = "Green Dragon";
	setInfo = "Crafted Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Restores 3 mana per 5 sec.\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."3:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Allows 15% of your Mana regeneration to continue while casting.\n\n"..SW_LINK_COLOR_CLOSE
			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."801\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Stamina: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."25\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Spirit: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."61\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Nature: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."31\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."250\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:15045:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:15046:0:0:0";
	partInfo	= SW_TEXT_LEGS.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:20296:0:0:0";
	partInfo	= SW_TEXT_HANDS.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[3]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	
	------------------------------------
	--  Set 10
	------------------------------------
	setIndex = 10;
	setName = "Imperial Plate";
	setTabName = "Imperial";
	setInfo = "Crafted Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." +100 Armor\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."4:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." +28 Attack Power\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."6:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." +18 Stamina\n\n"..SW_LINK_COLOR_CLOSE
			 
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."2809\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Strength: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."100\n"..SW_LINK_COLOR_CLOSE			 
			  ..SW_GOLD_OPEN.."Stamina: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."11\n"..SW_LINK_COLOR_CLOSE			  
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."475\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:12427:0:0:0";
	partInfo	= SW_TEXT_HEAD.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:12428:0:0:0";
	partInfo	= SW_TEXT_SHOULDER.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:12422:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[3]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:12429:0:0:0";
	partInfo	= SW_TEXT_LEGS.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[4]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:12426:0:0:0";
	partInfo	= SW_TEXT_FEET.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[5]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:12424:0:0:0";
	partInfo	= SW_TEXT_WAIST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[6]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:12425:0:0:0";
	partInfo	= SW_TEXT_WRIST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Blacksmiths\n";
	classData.aSetData[setIndex].aPartData[7]	= SetWrangler_MakePartData(partLink, partStats, partInfo);


	------------------------------------
	--  Set 11
	------------------------------------
	setIndex = 11;
	setName = "Ironfeather Armor";
	setTabName = "Ironfeather";
	setInfo = "Crafted Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Increases damage and healing done by magical spells and effects by up to 20.\n\n"..SW_LINK_COLOR_CLOSE
			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."282\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Intellect: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."32\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Spirit: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."36\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."160\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:15067:0:0:0";
	partInfo	= SW_TEXT_SHOULDER.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:15066:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	------------------------------------
	--  Set 12
	------------------------------------
	setIndex = 12;
	setName = "Prayer of the Primal";
	setTabName = "Primal";
	setInfo = "ZG Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Increases healing done by spells and effects by up to 33.\n\n"..SW_LINK_COLOR_CLOSE
				  
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:19920:0:0:0";
	partInfo	= SW_TEXT_FINGER.." - "..SW_AREA_ZG;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_ZG.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."High Priestess Jeklik (6.1%)\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	partLink	= "item:19863:0:0:0";
	partInfo	= SW_TEXT_FINGER.." - "..SW_AREA_ZG;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_ZG.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Bloodlord Mandokir (6.1%)\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	------------------------------------
	--  Set 13
	------------------------------------
	setIndex = 13;
	setName = "Primal Batskin";
	setTabName = "Primal Batskin";
	setInfo = "Crafted Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."3:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Minor increase to running and swimming speed.\n\n"..SW_LINK_COLOR_CLOSE
			  			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."373\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Agility: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."56\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Stamina: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."22\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."To Hit: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."4\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."170\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:19685:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:19686:0:0:0";
	partInfo	= SW_TEXT_HANDS.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:19687:0:0:0";
	partInfo	= SW_TEXT_WRIST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[3]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	------------------------------------
	--  Set 14
	------------------------------------
	setIndex = 14;
	setName = "Chain of the Scarlet Crusade";
	setTabName = "Scarlet Crusade";
	setInfo = "Lesser Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." +10 Armor.\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."3:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Increased Defense +1.\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."4:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." +5 Shadow Resistance.\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."5:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." +15 Attack Power when fighting Undead.\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."6:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Improves your chance to hit by 1%.\n\n"..SW_LINK_COLOR_CLOSE


			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."1001\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Strength: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."44\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Agility: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."12\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Stamina: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."56\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."375\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:10328:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_SM;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_SM.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Scarlet Champion (0.3%)\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:10330:0:0:0";
	partInfo	= SW_TEXT_LEGS.." - "..SW_AREA_SM;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_SM.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Herod (13.2%)\n"
				  .."Scarlet Commander Mograine (12.4%)\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:10331:0:0:0";
	partInfo	= SW_TEXT_HANDS.." - "..SW_AREA_SM;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_SM.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Scarlet Centurion (1.6%)\n";
	classData.aSetData[setIndex].aPartData[3]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:10332:0:0:0";
	partInfo	= SW_TEXT_FEET.." - "..SW_AREA_SM;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_SM.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
		          .."Scarlet Gallant (0.1%)\n"
				  .."Scarlet Monk (0.1%)\n"
				  .."Scarlet Centurion (0.1%)\n"
				  .."Scarlet Diviner (0.1%)\n"
				  .."Scarlet Defender (0.1%)\n"
				  .."Scarlet Myrmidon (0.1%)\n"
				  .."Scarlet Beastmaster (0.1%)\n"
				  .."Scarlet Chaplain (0.1%)\n"
				  .."Scarlet Guardsman (0.1%)\n"
				  .."Scarlet Protector (0.1%)\n"
				  .."Scarlet Wizard (0.1%)\n"
				  .."Scarlet Adept (0.1%)\n"
				  .."Scarlet Tracking Hound (0.1%)\n"
				  .."Scarlet Soldier (0.1%)\n"
				  .."Scarlet Conjuror (0.1%)\n"
				  .."Scarlet Evoker (0.1%)\n";
	classData.aSetData[setIndex].aPartData[4]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:10329:0:0:0";
	partInfo	= SW_TEXT_WAIST.." - "..SW_AREA_SM;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_SM.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Scarlet Myrmidon (1.5%)\n"
				  .."Scarlet Defender (1.5%)\n";
	classData.aSetData[setIndex].aPartData[5]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:10333:0:0:0";
	partInfo	= SW_TEXT_WRIST.." - "..SW_AREA_SM;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_SM.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Scarlet Guardsman (1.6%)\n"
				  .."Scarlet Protector (1.6%)\n";
	classData.aSetData[setIndex].aPartData[6]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	
	------------------------------------
	--  Set 15
	------------------------------------
	setIndex = 15;
	setName = "Stormshroud Armor";
	setTabName = "Stormshroud";
	setInfo = "Crafted Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." 5% chance of dealing 15 to 25 Lightning damage on a successful melee attack.\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."3:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." 2% chance on melee attack of restoring 30 energy.\n\n"..SW_LINK_COLOR_CLOSE
			  			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."427\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Stamina: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."12\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."%Critical: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."5\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."235\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:15058:0:0:0";
	partInfo	= SW_TEXT_SHOULDER.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:15056:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:15057:0:0:0";
	partInfo	= SW_TEXT_LEGS.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[3]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	------------------------------------
	--  Set 16
	------------------------------------
	setIndex = 16;
	setName = "Twilight Trappings";
	setTabName = "Twilight";
	setInfo = "Lesser Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."3:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Bestows the wearer with the evil aura of a Twilight's Hammer cultist.\n\n"..SW_LINK_COLOR_CLOSE
			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."198\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."160\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:20408:0:0:0";
	partInfo	= SW_TEXT_HEAD.." - "..SW_AREA_SIL;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_SIL.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Twilight Overlord (3.8%)\n"
				  .."Twilight Flamereaver (4.4)\n"
				  .."Twilight Master (3.7%)\n"
				  .."Twilight Stonecaller (4.9%)\n"
				  .."Twilight Geolord (4.0%)\n"
				  .."Twilight Avenger (3.9%)\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:20406:0:0:0";
	partInfo	= SW_TEXT_SHOULDER.." - "..SW_AREA_SIL;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_SIL.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Twilight Overlord (3.8%)\n"
				  .."Twilight Flamereaver (4.4)\n"
				  .."Twilight Master (3.7%)\n"
				  .."Twilight Stonecaller (4.9%)\n"
				  .."Twilight Geolord (4.0%)\n"
				  .."Twilight Avenger (3.9%)\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:20407:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_SIL;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_SIL.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Twilight Overlord (3.8%)\n"
				  .."Twilight Flamereaver (4.4)\n"
				  .."Twilight Master (3.7%)\n"
				  .."Twilight Stonecaller (4.9%)\n"
				  .."Twilight Geolord (4.0%)\n"
				  .."Twilight Avenger (3.9%)\n";
	classData.aSetData[setIndex].aPartData[3]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	------------------------------------
	--  Set 17
	------------------------------------
	setIndex = 17;
	setName = "Volcanic Armor";
	setTabName = "Volcanic";
	setInfo = "Crafted Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."3:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." 5% chance of dealing 15 to 25 Fire damage on a successful melee attack.\n\n"..SW_LINK_COLOR_CLOSE
			  			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."639\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Fire: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."58\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."200\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:15055:0:0:0";
	partInfo	= SW_TEXT_SHOULDER.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:15053:0:0:0";
	partInfo	= SW_TEXT_CHEST.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:15054:0:0:0";
	partInfo	= SW_TEXT_LEGS.." - "..SW_AREA_AH;
	partStats	= SW_TEXT_INFO.."\n"
				  ..SW_WHITE_OPEN
				  .."Crafted by Leatherworkers\n";
	classData.aSetData[setIndex].aPartData[3]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	------------------------------------
	--  Set 18
	------------------------------------
	setIndex = 18;
	setName = "Zanzil's Concentration";
	setTabName = "Zanzil";
	setInfo = "ZG Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Improves your chance to hit with spells by 1%..\n\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Increases damage and healing done by magical spells and effects by up to 6.\n\n"..SW_LINK_COLOR_CLOSE
				  
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:19905:0:0:0";
	partInfo	= SW_TEXT_FINGER.." - "..SW_AREA_ZG;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_ZG.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."High Priest Venoxis (6.4%)\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	partLink	= "item:19893:0:0:0";
	partInfo	= SW_TEXT_FINGER.." - "..SW_AREA_ZG;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_ZG.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Bloodlord Mandokir (9.6%)\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	
	------------------------------------
	--  Set 19
	------------------------------------
	setIndex = 19;
	setName = "Major Mojo Infusion";
	setTabName = "Mojo";
	setInfo = "ZG Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." +30 Attack Power.\n\n"..SW_LINK_COLOR_CLOSE
				  
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:19925:0:0:0";
	partInfo	= SW_TEXT_FINGER.." - "..SW_AREA_ZG;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_ZG.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."High Priestess Mar'li (8.2%)\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	partLink	= "item:19898:0:0:0";
	partInfo	= SW_TEXT_FINGER.." - "..SW_AREA_ZG;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_ZG.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."High Priest Thekal (8.3%)\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);


	---------
	classData.numTabSets = math.ceil(table.getn(classData.aSetData) / SW_MAX_TABS);
	return classData;
end