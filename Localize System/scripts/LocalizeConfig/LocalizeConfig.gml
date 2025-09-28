
// Configuration

// The Google Sheet ID containing the localization.
#macro LOC_SHEET_ID "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444"  

// Name of the .csv sheet after being downloaded.
#macro LOC_FILENAME "localize.dat"

// Read files using asyncronous save/load events
#macro LOC_ASYNC_MODE true

// It true, the game will automatically checks for the system language and use it as default.
#macro LOC_AUTO_DETECT true

// If true, the localization file will be obfuscated
#macro LOC_OBFUSCATE_FILE true

// Debug log trace level.
#macro LOC_TRACE_LEVEL LOC_TRACE.VERBOSE

// Online update enviroment
#macro LOC_UPDATE_MODE LOC_ONLINE.DEVELOPMENT

// Character to delimit cells in the .csv sheet
#macro LOC_CELL_DELIM ","

// Character to delimit strings in the .csv sheet
#macro LOC_STRING_DELIM "\""

// Key for the current language in the sheet.
#macro LOC_LANG_KEY "language"

// The default key to use in a language when no key is provided
#macro LOC_MISSING_KEY "loc_missing_key"

// If you want to use the LOC_AUTO_DETECT feature, place the languages used here
// along with their respective language code according to the ISO 639 Standart
//langs = [
//    ["en", "English"],
//    ["es", "Español",],
//    ["pt", "Português",],
//    ["it", "Italiano",],
//    ["ru", "Русский",],
//    ["zh", "简体中文",],
//    ["ja", "日本語",],
//    ["ko", "한국어",],
//    ["de", "Deutsch",],
//    ["fr", "Français",],
//]

// To use special characters like line breaks and other replacements, you can asign specific tags to 
// be replaced after parsing the .csv, as they can't be directly written in the sheet
tags = [
    ["[uid]", environment_get_variable("USERNAME")],
]

//__LocalizeCache().langs = langs;
__LocalizeCache().tags = tags;
