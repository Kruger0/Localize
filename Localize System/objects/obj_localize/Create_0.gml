///@desc Startup

// Load texts from game files. Also prepare for fetching them from the internet
LocalizeLoad("interface.loc",  "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444");
//LocalizeLoad("dialogues.loc",  "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1628623745");
//LocalizeLoad("items.loc",      "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1706808784");

// Configure language detection and fallback
LocalizeSetFallback("English");
LocalizeDetectLang();

// Define tag replacement
LocalizeSetTag("[user_id]", environment_get_variable("USERNAME"));
LocalizeSetTag("[os_date]", $"{current_year}-{current_month}-{current_day}");