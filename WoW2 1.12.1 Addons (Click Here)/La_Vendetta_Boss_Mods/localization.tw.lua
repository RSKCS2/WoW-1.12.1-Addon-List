-- -------------------------------------------- --
-- La Vendetta Boss Mods - chinese localization --
--          by 尖石@Bell                  --
-- -------------------------------------------- --

if (GetLocale() == "zhTW") then
--classes
LVBM_MAGE		= "法師";
LVBM_PRIEST		= "牧師";
LVBM_PALADIN		= "聖騎士";
LVBM_DRUID		= "德魯伊";
LVBM_WARLOCK		= "術士";
LVBM_ROGUE		= "盜賊";
LVBM_HUNTER		= "獵人";
LVBM_WARRIOR		= "戰士";
LVBM_SHAMAN		= "薩滿";

--zones
LVBM_NAXX		= "納克薩瑪斯";
LVBM_AQ40		= "安其拉";
LVBM_BWL		= "黑翼之巢";
LVBM_MC			= "熔火之心";
LVBM_AQ20		= "安其拉廢墟";
LVBM_ZG			= "祖爾格拉布";
LVBM_OTHER		= "其他";

--spells/buffs
LVBM_CHARGE		= "衝鋒";
LVBM_FERALCHARGE	= "野性衝鋒";
LVBM_BLOODRAGE		= "血性狂暴";
LVBM_REDEMPTION 	= "救贖之魂";
LVBM_FEIGNDEATH		= "假死";
LVBM_MINDCONTROL	= "精神控制";

--create status bar timer localization table
LVBM_SBT = {};

--key bindings
BINDING_HEADER_LVBM		= "La Vendetta Boss Mods";
BINDING_NAME_TOGGLE		= "打開圖形界面";

--OnLoad messages
LVBM_LOADED			= "La Vendetta Boss Mods v%s 版 La Vendetta。";
LVBM_MODS_LOADED		= "%s %s Bossmod 已載入"

--Slash command messages
LVBM_MOD_ENABLED		= "Bossmod打開";
LVBM_MOD_DISABLED		= "Bossmod關閉";
LVBM_ANNOUNCE_ENABLED		= "廣播打開";
LVBM_ANNOUNCE_DISABLED		= "廣播關閉";
LVBM_MOD_STOPPED		= "計時停止";
LVBM_MOD_INFO			= "Bossmod v%s 版 %s";
LVBM_SLASH_HELP1		= " on/off";
LVBM_SLASH_HELP2		= " 廣播 on/off";
LVBM_SLASH_HELP3		= " 停止";
LVBM_SLASH_HELP4		= "你可以使用 %s 替代 /%s";
LVBM_RANGE_CHECK		= "超過30碼外： ";

--Sync options
LVBM_SOMEONE_SET_SYNC_CHANNEL		= "%s 設置同步頻道為: %s";
LVBM_SET_SYNC_CHANNEL			= "同步頻道設為: %s";
LVBM_CHANNEL_NOT_SET			= "未設置頻道，無法廣播。";
LVBM_NEED_LEADER			= "你必須為助理或團長才能廣播頻道！";
LVBM_NEED_LEADER_STOP_ALL		= "你必須為助理或團長才能使用此功能！";
LVBM_ALL_STOPPED			= "所有計時停止。";
LVBM_REC_STOP_ALL			= "停止接收來自 %s 的所有命令。";

--Update dialog
LVBM_UPDATE_DIALOG			= "你的 La Vendetta Bossmod已經過期！\n%s 和 %s 有版本 %s，\n請訪問 www.curse-gaming.com 獲取最新版本。";
LVBM_REQ_PATCHNOTES			= "向 %s 請求更新記錄...請等待。";
LVBM_SHOW_PATCHNOTES			= "顯示更新記錄";
LVBM_PATCHNOTES				= "更新記錄";
LVBM_COPY_PASTE_URL		= "Copy & paste URL";
LVBM_COPY_PASTE_NOW		= "Press ctrl-c to copy the URL to the clipboard"

--Status Bar Timers
LVBM_SBT_TIMELEFT			= "剩餘時間:"
LVBM_SBT_TIMEELAPSED			= "已用時間:"
LVBM_SBT_TOTALTIME			= "總時間:"
LVBM_SBT_REPETITIONS			= "循環:";
LVBM_SBT_INFINITE			= "無限";
LVBM_SBT_BOSSMOD			= "Bossmod:"
LVBM_SBT_STARTEDBY			= "開始於:"
LVBM_SBT_RIGHTCLICK			= "右鍵單擊來隱藏"

--Misc stuff
LVBM_YOU				= "你";
LVBM_ARE				= "了";
LVBM_IS					= "受到";
LVBM_OR					= "或";
LVBM_UNKNOWN			 	= "未知";
LVBM_LOCAL				= "本地";
LVBM_DEFAULT_DESCRIPTION		= "無描述.";
LVBM_SEC				= "秒";
LVBM_MIN				= "分";
LVBM_SECONDS				= "秒";
LVBM_MINUTES				= "分鐘";
LVBM_MINUTE				= "分鐘";
LVBM_HIT				= "命中";
LVBM_HITS				= "擊中";
LVBM_CRIT				= "致命一擊";
LVBM_CRITS				= "致命";
LVBM_MISS					= "未命中";
LVBM_DODGE					= "閃躲";
LVBM_PARRY					= "招架";
LVBM_FROST				= "冰霜";
LVBM_ARCANE				= "祕法";
LVBM_FIRE				= "火焰";
LVBM_HOLY				= "神聖";
LVBM_NATURE				= "自然";
LVBM_SHADOW				= "暗影";
LVBM_CLOSE				= "關閉";
LVBM_AGGRO_FROM				= "盯上你了！";
LVBM_SET_ICON				= "設定圖示";
LVBM_SEND_WHISPER			= "發送密語";
LVBM_DEAD					= "死亡";
LVBM_OFFLINE				= "離線";

end