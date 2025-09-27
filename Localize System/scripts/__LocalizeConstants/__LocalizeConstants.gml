
#macro LOCALIZE_VERSION "2.0.0-beta.1"
#macro LOC_LANG_KEY     "language"                                      // Key for the current language in the sheet.
#macro LOC_CELL_DELIM   ","
#macro LOC_STRING_DELIM "\""
#macro LOC_DEBUG_LEVEL  __LOC_DEBUG.VERBOSE                                               // Show debug trace messages on the console.
#macro LOC_MISSING_KEY  "loc_missing_key"                               // The default key to use in a language when no key is provided



enum __LOC_DEBUG {
    NONE,
    CRITICAL,
    VERBOSE
}