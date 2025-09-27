//=============================================================
#region Configuration


#macro LOC_SHEET_ID     "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444"  // The Google Sheet ID containing the localization.
#macro LOC_FILENAME     "localize.dat"                                  // Name of the .csv sheet after being downloaded.
#macro LOC_ONLINE_MODE  false                                           // If true, the final executable build will try to update the .csv at every start.
#macro LOC_ASYNC_MODE   true
#macro LOC_AUTO_DETECT  true                                            // It true, the game will automatically checks for the system language and use it as default.


// If you want to use the LOC_AUTO_DETECT feature, place the languages used here
// along with their respective language code according to the ISO 639 Standart
languages = [
    ["Español",     "es"],
    ["Português",   "pt"],
    ["Italiano",    "it"],
    ["Русский",     "ru"],
    ["简体中文",    "zh"],
    ["日本語",      "ja"],
    ["한국어",      "ko"],
    ["Deutsch",     "de"],
    ["Français",    "fr"],
]

// To use special characters like line breaks and other replacements, you can asign specific tags to 
// be replaced after parsing the .csv, as they can't be directly written in the sheet
tags = [
    ["[n]", "\n"],
    ["[r]", "\r"],
    ["[uid]", environment_get_variable("USERNAME")]
]

__LocalizeCache().languages = languages;
__LocalizeCache().tags = tags;

#endregion
//=============================================================