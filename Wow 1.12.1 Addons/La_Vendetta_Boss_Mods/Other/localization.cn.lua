-- 简体中文 translation by Diablohu@轻风之语
if (GetLocale() == "zhCN") then
-- LVOnyxia
LVBM_ONYXIA_NAME			= "Onyxia";
LVBM_ONYXIA_INFO			= "Displays a warning when Onyxia does her deep breath ability during phase two.";
LVBM_ONYXIA_BREATH_EMOTE 		= "%s takes in a deep breath...";
LVBM_ONYXIA_BREATH_ANNOUNCE		= "*** Deep Breath ***"
LVBM_ONYXIA_PHASE2_YELL			= "This meaningless exertion bores me. I'll incinerate you all from above!";
LVBM_ONYXIA_PHASE2_ANNOUNCE		= "*** Phase 2 ***"
LVBM_ONYXIA_PHASE3_YELL			= "It seems you'll need another lesson, mortals!";
LVBM_ONYXIA_PHASE3_ANNOUNCE		= "*** Phase 3 ***"

-- LVLordKazzak
LVBM_KAZZAK_NAME			= "卡扎克";
LVBM_KAZZAK_INFO			= "警报上帝模式剩余时间";
LVBM_KAZZAK_START_YELL			= "为了军团！为了基尔加丹！";
LVBM_KAZZAK_NAME			= "卡扎克";
LVBM_KAZZAK_BAR_TEXT			= "上帝模式";
LVBM_KAZZAK_DIES			= "卡扎克死亡了。";
LVBM_KAZZAK_ANNOUNCE_START		= "*** 3分钟后卡扎克进入上帝模式 ***";
LVBM_KAZZAK_ANNOUNCE_TIMENEEDED 	= "*** %d秒内干掉它！ ***";
LVBM_KAZZAK_ANNOUNCE_SEC		= "*** %d秒后卡扎克进入上帝模式 ***";

-- LVAzuregos
LVBM_AZUREGOS_NAME			= "艾索雷葛斯";
LVBM_AZUREGOS_INFO			= "警报传送和魔法反射";
LVBM_AZUREGOS_SHIELDUP_EXPR		= "艾索雷葛斯获得了反射的效果。";
LVBM_AZUREGOS_SHIELDUP_ANNOUNCE		= "*** 魔法反射 - 停止对其施法 ***";
LVBM_AZUREGOS_SHIELDDOWN_EXPR 		= "反射效果从艾索雷葛斯身上消失。";
LVBM_AZUREGOS_SHIELDDOWN_ANNOUNCE	= "*** 魔法反射消失 ***";
LVBM_AZUREGOS_PORT_EXPR 		= "来吧，小子。面对我！"
LVBM_AZUREGOS_PORT_ANNOUNCE		= "*** 传送 ***";

-- LVBattleGrounds
LVBM_BGMOD_LANG = {
		-- MIX
	["NAME"] 		= "战场",
	["INFO"] 		= "显示阿拉希盆地和奥特兰克山谷的旗帜信息，"
				.."显示战歌峡谷的旗帜携带者，并可自动上交奥特兰克山谷声望物品",
	["THANKS"] 		= "感谢您使用 La Vendetta BossMods, 享受 PvP",
	["WINS"]		= "([^%s]+)获胜",
	["BEGINS"]		= "战斗即将开始",	-- BAR
	["ALLIANCE"]		= "联盟",
	["HORDE"]		= "部落",
	["ALLI_TAKE_ANNOUNCE"] 	= "*** 联盟夺取了%s ***",
	["HORDE_TAKE_ANNOUNCE"]	= "*** 部落夺取了%s ***",

		-- AV
	["AV_ZONE"] 		= "奥特兰克山谷",
	["AV_START60SEC"]	= "奥特兰克山谷的战斗将在1分钟之后开始。",
	["AV_START30SEC"]	= "奥特兰克山谷的战斗将在30秒之后开始。",
	["AV_TURNININFO"] 	= "自动上交声望物品",
	["AV_NPC"] = {
		["SMITHREGZAR"] 		= "铁匠雷格萨",			-- armor
		["PRIMALISTTHURLOGA"] 		= "指挥官瑟鲁加",			-- icelord
		["WINGCOMMANDERJEZTOR"] 	= "空军指挥官杰斯托",		
		["WINGCOMMANDERGUSE"] 		= "空军指挥官古斯",
		["WINGCOMMANDERMULVERICK"] 	= "空军指挥官穆维里克",
		["MURGOTDEEPFORGE"] 		= "莫高特·深炉",			-- armor
		["ARCHDRUIDRENFERAL"] 		= "大德鲁伊雷弗拉尔",		-- forestlord
		["WINGCOMMANDERVIPORE"] 	= "空军指挥官维波里",
		["WINDCOMMANDERSLIDORE"] 	= "空军指挥官斯里多尔",
		["WINGCOMMANDERICHMAN"] 	= "空军指挥官艾克曼",
		["STORMPIKERAMRIDERCOMMANDER"]	= "雷矛山羊骑兵指挥官",
		["FROSTWOLFWOLFRIDERCOMMANDER"]	= "霜狼骑兵指挥官",
	},
	["AV_ITEM"] = {
		["ARMORSCRAPS"] = "护甲碎片",
		["SOLDIERSBLOOD"] = " 	联盟士兵的血",
		["LIEUTENANTSFLESH"] = "联盟士官的食物",
		["SOLDIERSFLESH"] = "联盟士兵的食物",
		["COMMANDERSFLESH"] = "联盟指挥官的食物",
		["STORMCRYSTAL"] = "风暴水晶",
		["LIEUTENANTSMEDAL"] = "部落士官的勋章",
		["SOLDIERSMEDAL"] = "部落士兵的勋章",
		["COMMANDERSMEDAL"] = "部落指挥官的勋章",
		["FROSTWOLFHIDE"] = "霜狼毛皮",
		["ALTERACRAMHIDE"] = "奥特兰克山羊皮",
	},
	["AV_TARGETS"] = {
		"雷矛急救站",
		"丹巴达尔北部碉堡",
		"丹巴达尔南部碉堡",
		"雷矛墓地",
		"冰翼碉堡",
		"石炉墓地",
		"石炉碉堡",
		"落雪墓地",
		"冰血哨塔",
		"冰血墓地",
		"哨塔高地",
		"霜狼墓地",
		"西部霜狼哨塔",
		"东部霜狼哨塔",
		"霜狼急救站"
	},
	["AV_UNDERATTACK"]	= "([^%s]+)受到攻击！如果我们不尽快采取措施，([^%s]+)会([^%s]+)它的！",	-- Graveyard // Tower
	["AV_WASTAKENBY"]	= "([^%s]+)被([^%s]+)占领了！",
	["AV_WASDESTROYED"]	= "([^%s]+)被([^%s]+)摧毁了！",
	["AV_IVUS"]		= "Wicked, Wicked, Mortals! The forest weeps",
	["AV_ICEY"]		= "WHO DARES SUMMON LOKHOLAR",


		-- AB
	["AB_ZONE"] 		= "阿拉希盆地",
	["AB_START60SEC"]	= "阿拉希盆地的战斗将在1分钟后开始。",
	["AB_START30SEC"]	= "阿拉希盆地的战斗将在30秒后开始。",
	["AB_CLAIMSTHE"]	= "([^%s]+)攻占([^%s]+)！如果不赶快采取行动的话，([^%s]+)在1分钟内占据它！",
	["AB_HASTAKENTHE"]	= "([^%s]+)夺取([^%s]+)！",
	["AB_HASDEFENDEDTHE"]	= "([^%s]+)守住([^%s]+)！",
	["AB_HASASSAULTED"]	= "突袭",
	["AB_SCOREEXP"] = "基地：(%d+)  资源：(%d+)/2000",
	["AB_WINALLY"] = "联盟即将获胜",
	["AB_WINHORDE"] = "部落即将获胜",
	["AB_TARGETS"] 		= {
		"了农场",
		"了伐木场",
		"了铁匠铺",
		"了矿洞",
		"了兽栏"
	},

		-- WSG
	["WSG_ZONE"] 		= "战歌峡谷",
	["WSG_START60SEC"]	= "战歌峡谷战斗将在1分钟内开始。",
	["WSG_START30SEC"]	= "战歌峡谷战斗将在30秒内开始。做好准备！",
	["WSG_INFOFRAME_INFO"]	= "在战歌峡谷中显示旗帜监视窗口",
	["WSG_FLAG_PICKUP"] 	= "([^%s]+)的旗帜被([^%s]+)拔起了！",
	["WSG_FLAG_RETURN"]	= "([^%s]+)的旗帜被([^%s]+)还到了它的基地中！",
	["WSG_ALLYFLAG"]	= "联盟旗帜: ",
	["WSG_HORDEFLAG"]	= "部落旗帜: ",
	["WSG_FLAG_BASE"]	= "基地",
	["WSG_HASCAPTURED"]	= "([^%s]+)夺取([^%s]+)的旗帜！",
	["FLAGRESPAWN"] = "旗帜即将刷新",
}


LVBM_BGMOD_EN_TARGET_AV = LVBM_BGMOD_LANG.AV_TARGETS;
LVBM_BGMOD_EN_TARGET_AB = LVBM_BGMOD_LANG.AB_TARGETS;

--LVBM_SBT["Alliance: Lumber mill"] = "Alliance: Lumber Mill";
--LVBM_SBT["Horde: Lumber mill"] = "Horde: Lumber Mill";
LVBM_SBT["Flag respawn"] = LVBM_BGMOD_LANG["FLAGRESPAWN"]
LVBM_SBT["Ivus spawn"] = LVBM_BGMOD_LANG["IVUSTXT"];
LVBM_SBT["Ice spawn"] = LVBM_BGMOD_LANG["ICEYTXT"];
LVBM_SBT["Begins"] = LVBM_BGMOD_LANG["BEGINS"];
LVBM_SBT["ABWINHORDE"] = LVBM_BGMOD_LANG.ABWINHORDE;
LVBM_SBT["ABWINALLY"] = LVBM_BGMOD_LANG.ABWINALLY;


--Outdoor Dragons
LVBM_OUTDOOR_NAME		= "梦魇巨龙";
LVBM_OUTDOOR_DESCRIPTION	= "警报毒性吐息和艾莫莉丝的快速传染";
LVBM_OUTDOOR_YSONDRE		= "伊森德雷";
LVBM_OUTDOOR_EMERISS		= "艾莫莉丝";
LVBM_OUTDOOR_TAERAR		= "泰拉尔";
LVBM_OUTDOOR_LETHON		= "莱索恩";

LVBM_OUTDOOR_BREATH_NOW		= "*** 毒性吐息 - 30妙后再次施放 ***";
LVBM_OUTDOOR_BREATH_WARNING	= "*** 毒性吐息 - %妙后施放 ***";
LVBM_OUTDOOR_INFECT_WARN	= "*** %s受到了快速传染 ***";
LVBM_OUTDOOR_INFECT_SPECIAL	= "你受到了快速传染！";

LVBM_OUTDOOR_NOX_BREATH		= "([^%s]+)受到了毒性吐息效果的影响。";
LVBM_OUTDOOR_NOX_RESIST		= "([^%s]+)毒性吐息被([^%s]+)抵抗了。";
LVBM_OUTDOOR_INFECTION		= "([^%s]+)受到了快速传染效果的影响。";

LVBM_OUTDOOR_LOCATION_1		= LVBM_DUSKWOOD;
LVBM_OUTDOOR_LOCATION_2		= LVBM_ASHENVALE;
LVBM_OUTDOOR_LOCATION_3		= LVBM_FERALAS;
LVBM_OUTDOOR_LOCATION_4		= LVBM_HINTERLANDS;
LVBM_SBT["Noxious Breath"]	= "毒性吐息";

end
