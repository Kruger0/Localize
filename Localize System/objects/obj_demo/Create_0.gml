window_set_caption($"Localize System v{__LOC_VERSION}")

// Load files from URL
LocalizeLoad("interface.loc",  "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444");
LocalizeLoad("dialogues.loc",  "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1628623745");
LocalizeLoad("items.loc",      "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1706808784");

// Configure language detection and fallback
LocalizeFallbackSet("en-US");
LocalizeLangDetect();


// Define tag replacement
LocalizeTagSet("user_id", environment_get_variable("USERNAME"));
LocalizeTagSet("sec", current_second);
LocalizeTagSet("os_date", Localize("ui.dateFormat", current_day, current_month, current_year));

global.teste = "Né nao mlk"

points = 0;
//var _font = "NotoSansCJK-Regular.ttc";
//global.font = font_add(_font, 24, false, false, 32, 255);
//if (os_browser != browser_not_a_browser) global.font = fnt_demo

//LocalizeFontSet("ja-JP", global.font);
//LocalizeFontSet("zh-CN", global.font);
//LocalizeFontSet("ko-KR", global.font);