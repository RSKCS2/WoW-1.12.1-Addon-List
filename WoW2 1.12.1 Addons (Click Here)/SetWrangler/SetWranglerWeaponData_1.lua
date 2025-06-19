-- Weapons Data

function SetWrangler_MakeWeaponData()
	local classData = {};
	local setName, partName, partLink, partStats, partInfo;
	local setIndex;
	
	classData.sName							= SW_TEXT_CLASSNAMES[SW_CLASS_WEAPONS];
	classData.aSetData						= {};


	------------------------------------
	--  Set 1
	------------------------------------
	setIndex = 1;
	setName = "The Twin Blades of Hakkari";
	setTabName = "Blades of Hakkari";
	setInfo = "Weapon Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Increased Swords +6.\n\n"..SW_LINK_COLOR_CLOSE
					  
			  ..SW_GOLD_OPEN.."Attack Pwr: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."68\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."%Critical: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."1\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."210\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:19865:0:0:0";
	partInfo	= SW_TEXT_HAND.." - "..SW_AREA_ZG;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_ZG.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Hakkar (2.4%)"
				  .."Bloodlord Mandokir (2.7%)\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:19866:0:0:0";
	partInfo	= SW_TEXT_OHAND.." - "..SW_AREA_ZG;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_ZG.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Hakkar (2.4%)"
				  .."Bloodlord Mandokir (2.7%)\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	------------------------------------
	--  Set 2
	------------------------------------
	setIndex = 2;
	setName = "Dal'Rend's Arms";
	setTabName = "Dal'Rend";
	setInfo = "Weapon Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." +50 Attack Power.\n\n"..SW_LINK_COLOR_CLOSE
			  
			  ..SW_GOLD_OPEN.."Armor: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."100\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Strength: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."4\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."%Critical: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."1\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Defense: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."7\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."180\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:12940:0:0:0";
	partInfo	= SW_TEXT_HAND.." - "..SW_AREA_LBRS;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_LBRS.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Warchief Rend Blackhand (3.3%)\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:12939:0:0:0";
	partInfo	= SW_TEXT_OHAND.." - "..SW_AREA_LBRS;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_LBRS.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Warchief Rend Blackhand (9.2%)\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	
	------------------------------------
	--  Set 3
	------------------------------------
	setIndex = 3;
	setName = "Primal Blessing";
	setTabName = "Primal Blessing";
	setInfo = "Weapon Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Grants a small chance when ranged or melee damage is dealt to infuse the wielder with a blessing from the Primal Gods. Ranged and melee attack power increased by 300 for 12 seconds.\n\n"..SW_LINK_COLOR_CLOSE
			  
			  ..SW_GOLD_OPEN.."Stamina: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."13\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."%Critical: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."1\n"..SW_LINK_COLOR_CLOSE
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."150\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:19896:0:0:0";
	partInfo	= SW_TEXT_HAND.." - "..SW_AREA_ZG;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_ZG.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."High Priest Thekal (1.2%)\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:19910:0:0:0";
	partInfo	= SW_TEXT_OHAND.." - "..SW_AREA_ZG;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_ZG.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."High Priestess Arlokk (0.9%)\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);


	------------------------------------
	--  Set 4
	------------------------------------
	setIndex = 4;
	setName = "Spider's Kiss";
	setTabName = "Spider's Kiss";
	setInfo = "Weapon Set";
	setStats= SW_TEXT_BONUS_HEADER.."\n\n"
			  ..SW_GOLD_OPEN.."2:"..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.." Chance on Hit: Immobilizes the target and lowers their armor by 100 for 10 sec.\n\n"..SW_LINK_COLOR_CLOSE
			  
			  ..SW_GOLD_OPEN.."Durability: "..SW_LINK_COLOR_CLOSE..SW_WHITE_OPEN.."155\n"..SW_LINK_COLOR_CLOSE;
	classData.aSetData[setIndex]							= SetWrangler_MakeSetData(setName,setTabName,setInfo,setStats);

	partLink	= "item:13218:0:0:0";
	partInfo	= SW_TEXT_ONEHAND.." - "..SW_AREA_LBRS;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_LBRS.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Crystal Fang (%)\n";
	classData.aSetData[setIndex].aPartData[1]	= SetWrangler_MakePartData(partLink, partStats, partInfo);

	partLink	= "item:13183:0:0:0";
	partInfo	= SW_TEXT_ONEHAND.." - "..SW_AREA_LBRS;
	partStats	= SW_TEXT_INST_HEADER.."\n"
				  ..SW_WHITE_OPEN..SW_AREA_LBRS.."\n\n"..SW_LINK_COLOR_CLOSE
				  ..SW_TEXT_DROP_HEADER.."\n"
				  ..SW_WHITE_OPEN
				  .."Mother Smolderweb (0.9%)\n";
	classData.aSetData[setIndex].aPartData[2]	= SetWrangler_MakePartData(partLink, partStats, partInfo);
	
	
	---------
	classData.numTabSets = math.ceil(table.getn(classData.aSetData) / SW_MAX_TABS);
	return classData;
end