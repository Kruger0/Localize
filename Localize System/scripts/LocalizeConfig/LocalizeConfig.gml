/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

// Controls when the system attempts to download new files from Google Sheets.
// DISABLED:    Use only local sheet files (offline).
// DEVELOPMENT: Download/Save in IDE, but use local files in Executable (Recommended).
// PRODUCTION:  Attempt download on both IDE and Executable builds.
// Default: LOC_UPDATE.DEVELOPMENT
#macro LOC_UPDATE_MODE LOC_UPDATE.DEVELOPMENT

// If true, downloads in the IDE (Development mode) are saved directly to the project's source 'datafiles' folder.
// If false, files are saved to the standard local app data folder, but will not update the project source.
// This allows you to commit updated CSVs to source control (Git/SVN).
// WARNING: You MUST disable "File System Sandbox" in Game Options > Windows/Mac/Linux for this to work.
// Default: true
#macro LOC_FORCE_BUNDLE_AREA true

// Read files using asynchronous save/load events
// Default: true
#macro LOC_ASYNC_MODE true

// Controls the verbosity of the console output.
// DISABLED:    No logs will be displayed.
// CRITICAL:    Only errors and warnings will be displayed.
// VERBOSE:     All logs (including download progress) will be displayed.
// Default: LOC_TRACE.VERBOSE
#macro LOC_TRACE_LEVEL LOC_TRACE.VERBOSE

// Enables the file download progress to be traced in the verbose mode
// Default: false
#macro LOC_DOWNLOAD_LOG_ENABLED false

// Minimum amount of bytes downloaded to trigger a new log message in the console.
// Prevents the output from being spammed during large downloads.
// Default: 256000 (approx 250 KB)
#macro LOC_DOWNLOAD_LOG_INTERVAL 256_000

// Character used to delimit cells in the CSV sheet.
// Default: ","
#macro LOC_CELL_DELIM ","

// Character used to enclose strings in the CSV sheet.
// Default: "\""
#macro LOC_STRING_DELIM "\""

// The default font size used when loading external font files (e.g. "Fonts/myfont.ttf").
// Default: 12
#macro LOC_DEFAULT_FONT_SIZE 12

// The maximum depth of recursion allowed when resolving nested keys.
// Default: 8
#macro LOC_MAX_RECURSION_DEPTH 8

// If enabled, escaped characters in the text (like \n and \r) will be converted to real newlines.
// Default: true
#macro LOC_REPLACE_NEWLINE true

// If enabled, spreadsheet error values (#VALUE!, #ERROR!, #N/A) are detected.
// The system will return the key ID instead of the error string to avoid UI glitches.
// Default: true
#macro LOC_DETECT_CELL_ERROR true
