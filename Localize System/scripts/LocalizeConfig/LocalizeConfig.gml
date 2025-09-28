
//======================================================= Configuration

// The Google Sheet ID containing the localization.
#macro LOC_SHEET_ID "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444"

// Name of the .csv sheet after being downloaded.
#macro LOC_FILENAME "localize.dat"

// Read files using asyncronous save/load events
#macro LOC_ASYNC_MODE true

// If true, the localization file will be obfuscated
#macro LOC_COMPRESS true

// Debug log trace level.
#macro LOC_TRACE_LEVEL LOC_TRACE.VERBOSE

// Online update enviroment
#macro LOC_UPDATE_MODE LOC_UPDATE.DEVELOPMENT

// Character to delimit cells in the .csv sheet
#macro LOC_CELL_DELIM ","

// Character to delimit strings in the .csv sheet
#macro LOC_STRING_DELIM "\""