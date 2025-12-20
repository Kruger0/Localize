window_set_caption($"Localize System v{__LOC_VERSION}");

// Load files from URL
LocalizeLoad("interface.loc",   "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444");
LocalizeLoad("dialogues.loc",   "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1628623745");
LocalizeLoad("items.loc",       "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444", "1706808784");

// Configure language and font and fallback
LocalizeFallbackSet("en-US");


if (file_exists("save.dat")) {
    var _save = buffer_load("save.dat")
    var _lang = buffer_read(_save, buffer_text)
    buffer_delete(_save)
    LocalizeLangSet(_lang)
} else {
    var _lang = LocalizeLangDetect();
    var _save = buffer_create(1, buffer_grow, 1)
    buffer_write(_save, buffer_text, _lang)
    buffer_save(_save, "save.dat")
    buffer_delete(_save)
}

// Define tag replacement
LocalizeTagSet("user_id", environment_get_variable("USERNAME"));
LocalizeTagSet("os_date", Localize("ui_date_format", current_day, current_month, current_year));
LocalizeTagSet("sec", current_second);

//LocalizeFontSet("pt", fnt_demo)

points = 0;

