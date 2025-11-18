/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

// System initialization
var _cache = __LocalizeCache();
__LocalizeTrace(-1, $"Running v{__LOC_VERSION} | Created by Krug | github.com/Kruger0/Localize | {__LOC_DATE}");

// Get OS language
var _language   = os_get_language();
var _region     = os_get_region();
var _langCode   = _language + (_region == "" ? "" : "-" + _region);
_cache.osLangCode = _langCode;

// Trace sandbox status
if (__LocalizeFetchAllowed()) {
    var _sandboxed = (GM_is_sandboxed ? 
        "Sandbox enabled. Downloaded sheets will be saved at local folder" : 
        "Sandbox disabled. Downloaded sheets will be saved at project datafiles");
    __LocalizeTrace(LOC_TRACE.VERBOSE, _sandboxed);
}

// Starts system internal step function
_cache.timesource = time_source_create(time_source_global, 1, time_source_units_frames, __LocalizeStepFunction, [], -1);
time_source_start(_cache.timesource);

// Initialize system debug window
__LocalizeDebug();