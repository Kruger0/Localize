/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

// The Google Sheet ID containing the localization. Copy your sheet ID here!
#macro LOC_SHEET_ID "19aCOc_sRAfk9Blbrb1Cjhe-P4mjyxayPbw8vBlCm444"

// The Google Sheet page containing the text data. Change it if your texts are stored in a different page other than the 1st one
#macro LOC_SHEET_PAGE "0"

// Name of the sheet file after being downloaded
#macro LOC_FILENAME "localize.dat"

// Enable or disable using zlib to compress the sheet file. It also obfuscate the text file as without compression it's just plain text
#macro LOC_COMPRESS true

// Debug trace level
// DISABLED:    No log will be displayed on the console
// INFO:        All logs will be displayed on the console
// ALERT:       Errors and alerts will be displayed on the console
// ERROR:       Only errors will be displayed on the console
#macro LOC_TRACE_LEVEL LOC_TRACE.INFO

// Online update enviroment
// DISABLED:    Use only local sheet files
// DEVELOPMENT: Download and save the sheet while on IDE, and use only local file on executable (recomended)
// PRODUCTION:  Download and save the sheet on both IDE and executable builds
#macro LOC_UPDATE_MODE LOC_UPDATE.DEVELOPMENT

// Read files using asyncronous save/load events
#macro LOC_ASYNC_MODE true

// Character to delimit cells in the sheet. Default for Google Sheets is ","
#macro LOC_CELL_DELIM ","

// Character to delimit strings in the sheet. Default for Google Sheets is "\""
#macro LOC_STRING_DELIM "\""

// If enabled, string escape characters (\n, \r) will be parsed as new line
#macro LOC_REPLACE_NEWLINE true


















// ============================= WIP ============================


// Add extra pages of the same sheet to load text from multiple files
#macro LOC_SHEET_PAGES ["0", "845810860", "798887904"]