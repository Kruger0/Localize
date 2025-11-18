/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

// Online update enviroment
// DISABLED:    Use only local sheet files
// DEVELOPMENT: Download and save the sheet while on IDE, and use only local file on executable (recomended)
// PRODUCTION:  Download and save the sheet on both IDE and executable builds
// Default: LOC_UPDATE:DEVELOPMENT
#macro LOC_UPDATE_MODE LOC_UPDATE.DEVELOPMENT

// Debug trace level
// DISABLED:    No log will be displayed on the console
// VERBOSE:     All logs will be displayed on the console
// CRITICAL:    Only critical logs will be displayed on the console
// Default: LOC_TRACE.CRITICAL
#macro LOC_TRACE_LEVEL LOC_TRACE.VERBOSE

// Enable or disable using zlib to compress the sheet file. It also obfuscate the text file as without compression it's just plain text
// Default: false
#macro LOC_COMPRESS false

// Read files using asynchronous save/load events
// Default: true
#macro LOC_ASYNC_MODE true

// Character to delimit cells in the sheet
// Default: ","
#macro LOC_CELL_DELIM ","

// Character to delimit strings in the sheet
// Default: "'"
#macro LOC_STRING_DELIM "'"

// Character to delimit the language name and the language code on the sheet (English_en-US)
// Default: "_"
#macro LOC_LANGCODE_DELIM "_"

// If enabled, string escape characters (\n and \r) will be parsed as new line
// Default: true
#macro LOC_REPLACE_NEWLINE true

// Detect error values (#VALUE!, #ERROR!, #N/A, ...) in the spreadsheet and return the original key instead
// Default: true
#macro LOC_DETECT_CELL_ERROR true