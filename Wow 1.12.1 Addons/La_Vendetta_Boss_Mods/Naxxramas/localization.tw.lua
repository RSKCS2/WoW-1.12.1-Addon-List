if GetLocale() == "zhTW" then
--Patchwerk
LVBM_PW_NAME		= "縫補者";
LVBM_PW_DESCRIPTION	= "提供縫補者狂暴計時";

LVBM_PW_ENRAGE_WARNING	= "*** 狂暴時間剩餘： %s %s ***";

LVBM_PW_YELL_1 = "縫補者要跟你玩！";
LVBM_PW_YELL_2 = "縫補者是科爾蘇加德的戰神！";

LVBM_SBT["Enrage"]	= "激怒";


--Grobbulus
LVBM_GROBB_NAME			= "葛羅巴斯";
LVBM_GROBB_DESCRIPTION	= "對受注射玩家設置圖示(骷髏). 只能一人開啟 \"設置圖示\".";
LVBM_GROBB_SEND_WHISPER	= "發送密語";
LVBM_GROBB_SET_ICON		= "設置圖示";

LVBM_GROBB_YOU_ARE_INJECTED	= "你被注射!";
LVBM_GROBB_INJECTED_WARNING	= "*** %s 被注射 ***";
LVBM_GROBB_INJECTED			= "突變注射";

LVBM_GROBB_INJECTION_REGEXP			= "([^%s]+)受到了突變注射效果的影響。";
LVBM_GROBB_INJECTION_FADES_REGEXP	= "突變注射效果從([^%s]+)身上消失。.";


--Gluth
LVBM_GLUTH_NAME				= "古魯斯";
LVBM_GLUTH_DESCRIPTION		= "通告古魯斯恐懼,狂暴和屠殺。";
LVBM_GLUTH_ANNOUNCE_FRENZY	= "通告狂亂";

LVBM_GLUTH_DECIMATE_WARN1			= "*** 2分鐘內施放屠殺 ***";
LVBM_GLUTH_DECIMATE_WARN2			= "*** 屠殺 - 2分鐘內施放下一次 ***";
LVBM_GLUTH_DECIMATE_1MIN_WARNING	= "*** 1分鐘內施放屠殺 ***";
LVBM_GLUTH_DECIMATE_SOON_WARNING	= "*** 即將屠殺 ***";
LVBM_GLUTH_FEAR_WARNING				= "*** 恐懼 - 20秒後下一次 ***";
LVBM_GLUTH_FEAR_5SEC_WARNING		= "*** 5秒後恐懼 ***";

LVBM_GLUTH_DECIMATE_REGEXP	= "古魯斯 的 殘殺 擊中 ([^%s]+) 造成 (%d+) 點傷害。";
LVBM_GLUTH_FEAR_REGEXP		= "(%w+)受到了恐嚇咆哮效果的影響。";
LVBM_GLUTH_FRENZY			= "變得狂暴起來！"
LVBM_GLUTH_GLUTH			= "古魯斯";

LVBM_SBT["Fear"]		= "恐懼";
LVBM_SBT["Decimate"]	= "屠殺";


--Razuvious
LVBM_IR_NAME				= "講師拉祖維斯";
LVBM_IR_DESCRIPTION			= "提供講師混亂怒吼計時.";
LVBM_IR_SHOW_10SEC_WARNING	= "顯示 10 秒警告";

LVBM_IR_TIMER_UPDATED	= "計時器更新";
LVBM_IR_SHOUT_WARNING	= "*** %s 秒後施放混亂怒吼 ***"

LVBM_IR_SPELL_1		= "混亂怒吼";

LVBM_SBT["Disruption Shout"]	= "混亂怒吼";


--Noth the Plaguebringer
LVBM_NTP_NAME			= "瘟疫者諾斯";
LVBM_NTP_DESCRIPTION	= "提供諾斯傳送和閃現計時.";

LVBM_NTP_BACK_WARNING			= "*** 諾斯回來 (%s 秒) - 攻擊 ***";
LVBM_NTP_TELEPORT_WARNING		= "*** %s 秒後傳送 ***";
LVBM_NTP_NOTH_GAINS_BLINK		= "*** 閃現 ***";
LVBM_NTP_BLINK_5SEC_WARNING		= "*** 5 秒內閃現 ***";
LVBM_NTP_TELEPORT_10SEC_WARNING	= "*** 10 秒內閃現 ***"
LVBM_NTP_BACK_10SEC_WARNING		= "*** 10 秒後諾斯回來 ***";

LVBM_NTP_SPELL_1 = "瘟疫者諾斯獲得了閃現術的效果。";
LVBM_NTP_YELL_START1 = "死吧，入侵者！";
LVBM_NTP_YELL_START2 = "榮耀歸於我主！";
LVBM_NTP_YELL_START3 = "我要沒收你的生命！";

LVBM_SBT["Teleport to Balcony"]	= "傳送到房間";
LVBM_SBT["Teleport back"]		= "傳送回來";
LVBM_SBT["Blink"]				= "閃現術";


--Heigan the Unclean
LVBM_HTU_NAME			= "骯髒者海根";
LVBM_HTU_DESCRIPTION	= "提供海根傳送計時.";

LVBM_HTU_TELEPORT_WARNING		= "*** %s 秒後傳送 ***";
LVBM_HTU_TELEPORT_BACK_WARNING	= "*** %s 秒後傳送回來 ***";

LVBM_HTU_YELL_START1 = "你……就是下一個。";
LVBM_HTU_YELL_START2 = "我看到你了……";
LVBM_HTU_YELL_START3 = "你是我的了。";

LVBM_SBT["Teleport"]		= "傳送";
LVBM_SBT["Teleport Back"]	= "傳送回來";


--Anub'Rekhan
LVBM_AR_NAME			= "阿努比瑞克漢";
LVBM_AR_DESCRIPTION		= "當阿努比瑞克漢施放蝗蟲風暴時發出警報.";

LVBM_AR_LOCUST_WARNING		= "*** %s 秒後蝗蟲風暴 ***";
LVBM_AR_LOCUST_SOON_WARNING	= "*** 蝗蟲風暴即將來臨 ***";
LVBM_AR_LOCUST_INC_WARNING	= "*** 蝗蟲風暴來臨 - 3 秒 ***";
LVBM_AR_GAIN_LOCUST_WARNING	= "*** 蝗蟲風暴 - 20 秒後結束 ***";
LVBM_AR_LOCUST_END_WARNING	= "*** 蝗蟲風暴 %s 秒後結束 ***";


LVBM_AR_YELL_1 = "你們逃不掉的。";
LVBM_AR_YELL_2 = "一些小點心……";	
LVBM_AR_YELL_3 = "對，跑吧！那樣傷口出血就更多了！";
LVBM_AR_CAST_LOCUST_SWARM = "阿努比瑞克漢開始施放蟲群風暴。";
LVBM_AR_GAIN_LOCUST_SWARM = "阿努比瑞克漢獲得了蟲群風暴的效果。";

LVBM_SBT["Locust Swarm"]		= "蝗蟲風暴";
LVBM_SBT["Locust Swarm Cast"]	= "施放蝗蟲風暴";


--Grand Widow Faerlina
LVBM_GWF_NAME			= "大寡婦費琳娜";
LVBM_GWF_DESCRIPTION	= "提供大寡婦費琳娜激怒計時.";

LVBM_GWF_ENRAGE_WARNING1	= "*** 激怒 - 60 秒後下一次 ***";
LVBM_GWF_ENRAGE_WARNING2	= "*** %s 秒後激怒 ***";
LVBM_GWF_ENRAGE_CD_READY	= "*** 激怒冷卻 ***"
LVBM_GWF_EMBRACE_WARNING	= "*** 寡婦之擁 %s 秒後結束 ***"

LVBM_GWF_YELL_1	= "休想從我面前逃掉！";
LVBM_GWF_YELL_2	= "以主人之名，殺了他們！";
LVBM_GWF_YELL_3	= "逃啊！有本事就逃啊！";
LVBM_GWF_YELL_4	= "跪下求饒吧，懦夫！";
LVBM_GWF_DEBUFF	= "大寡婦費琳娜受到寡婦之擁的傷害。";

LVBM_SBT["Enrage"]			= "激怒";
LVBM_SBT["Widow's Embrace"]	= "寡婦之擁";


--Maexxna
LVBM_MAEXXNA_NAME			= "梅克絲娜";
LVBM_MAEXXNA_DESCRIPTION	= "提供梅克絲娜撒網和小蜘蛛計時.";
LVBM_MAEXXNA_YELL_ON_WRAP	= "蛛網裹體時叫喊";

LVBM_MAEXXNA_WEB_WRAP_YELL		= "%s 被網住. 小隊: %s.";
LVBM_MAEXXNA_WRAP_WARNING		= "*** %s 被網住 ***";
LVBM_MAEXXNA_SPRAY_WARNING		= "*** %s 秒後撒網 ***";
LVBM_MAEXXNA_SPIDER_WARNING		= "*** %s 秒後出現小蜘蛛 ***";
LVBM_MAEXXNA_SPIDERS_SPAWNED	= "*** 小蜘蛛出現 ***";

LVBM_MAEXXNA_WEB_SPRAY			= "撒網";
LVBM_MAEXXNA_MAEXXNA			= "梅克絲娜";
LVBM_MAEXXNA_WEB_WRAP_REGEXP	= "^(.+)受到(.*)纏繞的蜘蛛網";

LVBM_SBT["Web Spray"]		= "撒網";
LVBM_SBT["Spider Spawn"]	= "蜘蛛爪牙";


--Gothik the Harvester
LVBM_GOTH_NAME			= "收割者高希";
LVBM_GOTH_DESCRIPTION	= "提供其小怪計時及死亡通告.";

LVBM_GOTH_PHASE2_WARNING		= "*** 收割者高希出現 ***";
LVBM_GOTH_PHASE2_INC_WARNING	= "*** %s %s 後進入第2階段 ***";
LVBM_GOTH_DEAD_WARNING			= "*** %s 死亡 ***";
LVBM_GOTH_INC_WARNING			= "*** %s 出現還剩 %s 秒 ***";
LVBM_GOTH_WAVE_INC_WARNING1		= "*** 3秒後 %s/18 波 - %s %s  ***";
LVBM_GOTH_WAVE_INC_WARNING2		= "*** 3秒後 %s/18 波 - %s %s 和 %s %s ***";
LVBM_GOTH_WAVE_INC_WARNING3		= "*** 3秒後 %s/18 波 - %s %s, %s %s 和 %s %s ***";

LVBM_GOTH_YELL_START1	= "你們這些蠢貨已經主動步入了陷阱。"
LVBM_GOTH_PHASE2_YELL	= "我已經等待很久了。現在你們將面對靈魂的收割者。";

LVBM_GOTH_RIDER			= "無情的騎兵";
LVBM_GOTH_RIDER_SHORT	= "騎兵";
LVBM_GOTH_KNIGHT		= "無情的死騎";
LVBM_GOTH_KNIGHT_SHORT	= "死騎";
LVBM_GOTH_KNIGHTS_SHORT	= "死騎";
LVBM_GOTH_TRAINEE		= "無情的訓練師";
LVBM_GOTH_TRAINEE_SHORT	= "訓練師";

--Thaddius
LVBM_THADDIUS_NAME			= "泰迪斯";
LVBM_THADDIUS_DESCRIPTION	= "提供激怒和兩極移形計時.";

LVBM_THADDIUS_ENRAGE_WARNING		= "*** %s %s 後激怒 ***";
LVBM_THADDIUS_POL_SHIFT				= "*** 兩極移形 ***";
LVBM_THADDIUS_SURGE_WARNING			= "*** 力量振蕩 ***";
LVBM_THADDIUS_POL_WARNING			= "*** %s 秒後兩極移形 ***";
LVBM_THADDIUS_CHARGE_CHANGED_NEG	= "充電變為負電荷!";
LVBM_THADDIUS_CHARGE_CHANGED_POS	= "充電變為正電荷!";

LVBM_THADDIUS_GAINS_SURGE	= "斯塔拉格獲得了力量澎湃的效果。";
LVBM_THADDIUS_CAST_POL		= "泰迪斯開始施放極性轉化。";
LVBM_THADDIUS_POL_REGEXP	= "你受到了(%w+)電荷。";
LVBM_THADDIUS_YELL_START1	= "殺……";
LVBM_THADDIUS_YELL_START2	= "咬碎……你的……骨頭……";
LVBM_THADDIUS_YELL_START3	= "打……爛……你！";
LVBM_THADDIUS_YELL_POL		= "你感受到痛苦的滋味了吧……";
LVBM_THADDIUS_ENRAGE		= "變得極度狂暴而憤怒！";
LVBM_THADDIUS_THADDIUS		= "泰迪斯";
LVBM_THADDIUS_POSITIVE		= "正";
LVBM_THADDIUS_NEGATIVE		= "負";

LVBM_SBT["Enrage"]				= "激怒";
LVBM_SBT["Polarity Shift"]		= "兩極移形";
LVBM_SBT["Polarity Shift cast"]	= "施放兩極移形";
end