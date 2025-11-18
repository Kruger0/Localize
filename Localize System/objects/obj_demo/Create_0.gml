
// Load files from URL
//LocalizeLoad("interface.loc",  "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444");
//LocalizeLoad("dialogues.loc",  "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1628623745");
//LocalizeLoad("items.loc",      "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1706808784");
LocalizeLoad("outcity.loc",      "1z9vUH6opVwTZj1zyEHFmQ7on0qhzF-jWPHAVo-07_Zw", "0");

// Configure language detection and fallback
LocalizeSetFallback("English");
LocalizeDetectLang();

// Define tag replacement
LocalizeSetTag("[user_id]", environment_get_variable("USERNAME"));
LocalizeSetTag("[os_date]", Localize("ui.dateFormat", current_day, current_month, current_year));

points = 0;
var _font = "NotoSansCJK-Regular.ttc";
global.font = font_add(_font, 24, false, false, 32, 255);
if (os_browser != browser_not_a_browser) global.font = fnt_demo
