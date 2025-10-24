/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

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

#macro LOC_CODE_DELIM "_"

// If enabled, string escape characters (\n, \r) will be parsed as new line
#macro LOC_REPLACE_NEWLINE true