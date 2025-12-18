window_set_caption($"Localize System v{__LOC_VERSION}");

// Load files from URL
LocalizeLoad("interface.loc",   "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444");
LocalizeLoad("dialogues.loc",   "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1628623745");
LocalizeLoad("items.loc",       "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1706808784");

// Configure language and font and fallback
LocalizeFallbackSet("en-US");
LocalizeLangDetect();
LocalizeFontSetDefault(fntDefault);


// Define tag replacement
LocalizeTagSet("user_id", environment_get_variable("USERNAME"));
LocalizeTagSet("os_date", Localize("ui_date_format", current_day, current_month, current_year));
LocalizeTagSet("sec", current_second);

points = 0;

