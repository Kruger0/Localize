
// Load files from URL
LocalizeLoad("interface.loc",  "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444");
LocalizeLoad("dialogues.loc",  "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1628623745");
LocalizeLoad("items.loc",      "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1706808784");

// Configure language detection and fallback
LocalizeSetFallback("en-US");
LocalizeDetectLang();

// Define tag replacement
LocalizeSetTag("[user_id]", environment_get_variable("USERNAME"));
LocalizeSetTag("[os_date]", Localize("ui.dateFormat", current_day, current_month, current_year));

points = 0;
var _font = "NotoSansCJK-Regular.ttc";
global.font = font_add(_font, 24, false, false, 32, 255);
if (os_browser != browser_not_a_browser) global.font = fnt_demo

var _file = "NotoSansCJK-Regular.ttc"

var _t = get_timer()
md5_file(_file)
show_debug_message($"md5 file took {(get_timer()-_t)/1000}ms")

_t = get_timer()
var _buffer = buffer_load(_file)
buffer_md5(_buffer, 0, buffer_get_size(_buffer))
show_debug_message($"md5 buffer took {(get_timer()-_t)/1000}ms")
game_end()