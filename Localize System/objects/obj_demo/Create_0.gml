window_set_caption($"Localize System v{__LOC_VERSION}");

// Load files from URL
LocalizeLoad("localize.dat", "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444");

// Configure language and font and fallback
LocalizeFallbackSet("en-US");
LocalizeLangDetect();

// Define tag replacement
LocalizeTagSet("user_id", environment_get_variable("USERNAME"));
LocalizeTagSet("os_date", Localize("ui_date_format", current_day, current_month, current_year));
LocalizeTagSet("sec", current_second);

points = 0;
