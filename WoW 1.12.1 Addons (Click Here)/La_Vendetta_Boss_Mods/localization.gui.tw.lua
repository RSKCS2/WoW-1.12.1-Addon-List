---------------------------------------------------
-- La Vendetta BossMods GUI Language File        --
-- GUI by LV|Nitram                              --
--                                               --
-- Translations by:                              --
--   LV|Nitram  -> EN                            --
--   LV|Tandanu -> DE                            --
--   LV|Tandanu -> fixed typos                   --
---------------------------------------------------

----------------------------------
-- Translation by 尖石@Bell -> zhTW --
----------------------------------

if (GetLocale() == "zhTW") then

-- LVBM_GUI.lua for Bossmod List Frame (LVBMBossModListFrame)
LVBMGUI_TAB_1_TITLE_TEXT		= "納克薩瑪斯";
LVBMGUI_TAB_2_TITLE_TEXT		= "安其拉";
LVBMGUI_TAB_3_TITLE_TEXT		= "黑翼之巢";
LVBMGUI_TAB_4_TITLE_TEXT		= "熔火之心";
LVBMGUI_TAB_5_TITLE_TEXT		= "祖爾格拉布與安其拉廢墟";
LVBMGUI_TAB_6_TITLE_TEXT		= "其他";

-- Tooltips
LVBMGUI_FRAMETAB_1_TT			= "納克薩瑪斯Bossmod";
LVBMGUI_FRAMETAB_1_TD			= "A collection of our boss mods for Naxxramas. Select an encounter to get additional options.";
LVBMGUI_FRAMETAB_2_TT			= "安其拉Bossmod";
LVBMGUI_FRAMETAB_2_TD			= "A collection of our boss mods for Ahn'Qiraj. Select an encounter to get additional options.";
LVBMGUI_FRAMETAB_3_TT			= "黑翼之巢Bossmod";
LVBMGUI_FRAMETAB_3_TD			= "A collection of our boss mods for Blackwing Lair. Select an encounter to get additional options.";
LVBMGUI_FRAMETAB_4_TT			= "熔火之心Bossmod";
LVBMGUI_FRAMETAB_4_TD			= "A collection of our boss mods for Molten Core. Select an encounter to get additional options.";
LVBMGUI_FRAMETAB_5_TT			= "祖爾格拉布與安其拉廢墟Bossmod";
LVBMGUI_FRAMETAB_5_TD			= "A collection of our boss mods for Zul'Gurub and Ahn'Qiraj 20. Select an encounter to get additional options.";

LVBMGUI_DISABLE_ADDON			= "關閉插件";
LVBMGUI_ENABLE_ADDON			= "打開插件";
LVBMGUI_STOP_ADDON			= "停止插件";
LVBMGUI_DISABLE_ANNOUNCE		= "關閉廣播";
LVBMGUI_ENABLE_ANNOUNCE			= "打開廣播";
LVBMGUI_SHOW_DROPDOWNMENU		= "額外選項";
LVBMGUI_DROPDOWNMENU_TITLE		= "Bossmod";

-- LVBMBossModFrame
LVBMGUI_HIDE_OPTIONS			= "<<< 選項";
LVBMGUI_SHOW_OPTIONS			= "選項 >>>";

-- Options Frame (LVBMOptionsFrame)
LVBMGUI_OPTIONS				= "選項 (GUI v"..LVBMGUI_VERSION.." / Boss Mod v"..LVBM.Version..")";
LVBMGUI_SIDEFRAME_TAB1			= "一般";
LVBMGUI_SIDEFRAME_TAB2			= "計時條";
LVBMGUI_SIDEFRAME_TAB3			= "警告";
LVBMGUI_SIDEFRAME_TAB4			= "特殊";
LVBMGUI_SIDEFRAME_TAB5			= "關於";

-- LVBMOptionsFramePage1
LVBMGUI_TITLE_SYNCSETTINGS			= "同步設定";
LVBMGUI_TITLE_MINIMAPBUTTON			= "小地圖按鈕設定";
LVBMGUI_TITLE_AGGROALERT			= "目標警告設定";
LVBMGUI_CHECKBOX_SYNC_ENABLE			= "開啟同步";
LVBMGUI_BUTTON_VERSION_CHECK			= "版本檢查";
LVBMGUI_BUTTON_VERSION_CHECK_FAILD		= "無其他 LVBM 使用者";
LVBMGUI_BUTTON_STATUSBAR_SYNCINFO		= "狀態條同步信息";
LVBMGUI_BUTTON_STATUSBAR_SYNCINFO_FAILD 	= "無狀態條";
LVBMGUI_SLIDER_MINIMAP_1			= "位置";
LVBMGUI_SLIDER_MINIMAP_2			= "半徑";
LVBMGUI_CHECKBOX_MINIMAP			= "顯示小地圖按鈕";
LVBMGUI_CHECKBOX_AGGROALERT_ENABLE		= "開啟目標警告";
LVBMGUI_BUTTON_AGGROALERT_TEST			= "測試目標警告";
LVBMGUI_BUTTON_AGGROALERT_RESET			= "重置設定";
LVBMGUI_BUTTON_AGGROALERT_RESET_DONE		= "目標警告已重置";
LVBMGUI_CHECKBOX_AGGROALERT_PLAYSOUND		= "目標轉向你時播放音效";
LVBMGUI_CHECKBOX_AGGROALERT_FLASH		= "目標轉向你時閃光";
LVBMGUI_CHECKBOX_AGGROALERT_SHAKE		= "目標轉向你時震動";
LVBMGUI_CHECKBOX_AGGROALERT_SPECIALTEXT		= "顯示特殊警告信息";
LVBMGUI_CHECKBOX_AGGROALERT_LOCALWARNING	= "顯示本地警告信息";
LVBMGUI_BUTTON_MOVEABLEBAR			= "改變計時條位置";
LVBMGUI_BUTTON_DEFAULTS				= "預設值";

-- LVBMOptionsFramePage2
LVBMGUI_TITLE_STATUSBARS 			= "狀態條計時設定";
LVBMGUI_TITLE_PIZZATIMER			= "創建 \"Pizza Timer\"";
LVBMGUI_CHECKBOX_STATUSBAR_ENABLE		= "開啟狀態條";
LVBMGUI_CHECKBOX_STATUSBAR_FILLUP		= "填充狀態條";
LVBMGUI_CHECKBOX_STATUSBAR_FLIPOVER		= "翻轉狀態條";
LVBMGUI_EDITBOX_PIZZATIMER_TEXT			= "名稱";
LVBMGUI_EDITBOX_PIZZATIMER_MIN			= "分";
LVBMGUI_EDITBOX_PIZZATIMER_SEC			= "秒";
LVBMGUI_CHECKBOX_PIZZATIMER_BROADCAST		= "向團隊廣播計時";
LVBMGUI_BUTTON_PIZZATIMER_START			= "開始計時";

-- LVBMOptionsFramePage3
LVBMGUI_TITLE_RAIDWARNING			= "設定團隊警告";
LVBMGUI_TITLE_SELFWARNING			= "本定警告"; 
LVBMGUI_DROPDOWN_RAIDWARNING_OPTION_1		= "團隊警告 (預設音效)";
LVBMGUI_DROPDOWN_RAIDWARNING_OPTION_2		= "敲鐘聲 (CT_Raid音效)";
LVBMGUI_DROPDOWN_RAIDWARNING_OPTION_3		= "取消警告音效";
LVBMGUI_DROPDOWN_RAIDWARNING_INFO_DISABLED	= "團隊警告音效已取消";
LVBMGUI_RAIDWARNING_EXAMPLE			= "*** 團隊警告範例 ***";
LVBMGUI_BUTTON_SOUND_TEST			= "測試音效";
LVBMGUI_BUTTON_SHOW_EXAMPLE			= "顯示範例";
LVBMGUI_BUTTON_RAIDWARNING_RESET		= "重置頁面";
LVBMGUI_BUTTON_RAIDWARNING_RESET_DONE		= "選項已重置為預設值";

-- LVBMOptionsFramePage4
LVBMGUI_TITLE_SPECIALWARNING			= "設定特殊警告";
LVBMGUI_TITLE_SHAKESCREEN			= "設定螢幕震動效果";
LVBMGUI_TITLE_FLASHEFFECT			= "設定閃光效果";
LVBMGUI_CHECKBOX_SPECWARNING_ENABLE		= "開啟特殊警告";
LVBMGUI_BUTTON_SPECWARNING_TEST			= "測試警告";
LVBMGUI_BUTTON_SPECWARNING_EXAMPLE		= "測試訊息 ^_^";
LVBMGUI_SLIDER_SPECWARNING_DURATION		= "持續時間";
LVBMGUI_SLIDER_SPECWARNING_FADETIME		= "消失時間";
LVBMGUI_SLIDER_SPECWARNING_TEXTSIZE		= "文字大小";
LVBMGUI_CHECKBOX_SHAKESCREEN_ENABLE		= "開啟螢幕震動效果";
LVBMGUI_BUTTON_SHAKESCREEN_TEST			= "測試震動";
LVBMGUI_SLIDER_SHAKESCREEN_DURATION		= "持續時間";
LVBMGUI_SLIDER_SHAKESCREEN_INTENSITY		= "強度";
LVBMGUI_CHECKBOX_FLASHEFFECT_ENABLE		= "打開閃光效果";
LVBMGUI_BUTTON_FLASHEFFECT_TEST			= "測試閃光";
LVBMGUI_SLIDER_FLASHEFFECT_DURATION		= "持續時間";
LVBMGUI_SLIDER_FLASHEFFECT_FLASHES		= "閃光次數";

-- LVBMOptionsFramePage5
LVBMGUI_ABOUTTITLE	= "About";
LVBMGUI_ABOUTTEXT_1	= "LV Bossmods API (c) by DeadlyMinds Tandanu";
LVBMGUI_ABOUTTEXT_2	= "LV Bossmods GUI (c) by La Vendetta Nitram";
LVBMGUI_ABOUTTEXT_3	= " ";
LVBMGUI_ABOUTTEXT_4	= "Thanks for using our AddOn.";
LVBMGUI_ABOUTTEXT_5	= " ";
LVBMGUI_ABOUTTEXT_6	= " ";
LVBMGUI_ABOUTTEXT_7	= "                                  Visit";
LVBMGUI_ABOUTTEXT_8	= " ";
LVBMGUI_ABOUTTEXT_9	= "                   www.deadlyminds.net";
LVBMGUI_ABOUTTEXT_10	= " ";
LVBMGUI_ABOUTTEXT_11	= "                                    or";
LVBMGUI_ABOUTTEXT_12	= " ";
LVBMGUI_ABOUTTEXT_13	= "                   www.destiny-guild.de";
LVBMGUI_ABOUTTEXT_14	= " ";
LVBMGUI_ABOUTTEXT_15	= "                                   and";
LVBMGUI_ABOUTTEXT_16	= " ";
LVBMGUI_ABOUTTEXT_17	= "                 www.curse-gaming.com";
LVBMGUI_ABOUTTEXT_18	= " ";
LVBMGUI_ABOUTTEXT_19	= " ";
LVBMGUI_ABOUTTEXT_20	= "If you have a suggestion or a bug report, leave a comment at www.curse-gaming.com or post in our forums at www.deadlyminds.net";

LVBMGUI_DISTANCE_FRAME_TITLE		= "距離";
LVBMGUI_DISTANCE_FRAME_TEXT		= "過近:";

LVBMGUI_INFOFRAME_TOOLTIP_TITLE		= "資訊框";
LVBMGUI_INFOFRAME_TOOLTIP_TEXT		= "右鍵拖曳移動\nShift + 右鍵隱藏";

LVBMGUI_STATUSBAR_WIDTH_SLIDER		= "條寬";
LVBMGUI_STATUSBAR_SCALE_SLIDER		= "條的大小";

LVBMGUI_BUTTON_RANGECHECK		= "距離檢查";
LVBMGUI_TOOLTIP_RANGECHECK_TITLE	= "距離檢查";
LVBMGUI_TOOLTIP_RANGECHECK_TEXT		= "檢查誰離你超過30碼";

LVBMGUI_BUTTON_DISTANCEFRAME		= "距離框";
LVBMGUI_TOOLTIP_DISTANCEFRAME_TITLE	= "距離框";
LVBMGUI_TOOLTIP_DISTANCEFRAME_TEXT	= "顯示或關閉距離檢查框。這是檢查誰離你太近(低於10碼)用的。打類似哈霍蘭或是克蘇恩之類的王會很有用。";

end


