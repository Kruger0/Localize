/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

// Start system
var _cache = __LocalizeCache();
__LocalizeTrace(-1, $"Running v{LOC_VERSION} | Created by Krug | github.com/Kruger0/Localize | {LOC_DATE}");

// Get OS language
var _language   = os_get_language();
var _region     = os_get_region();
var _langCode   = _language + (_region == "" ? "" : "-" + _region);
_cache.osLangCode = _langCode;

// Trace sandbox status
if (__LocalizeFetchAllowed()) {
    var _sandboxed = (GM_is_sandboxed ? 
        "Sandbox enabled. Saving sheet downloads at local folder" : 
        "Sandbox disabled. Saving sheet downloads at project datafiles");
    __LocalizeTrace(LOC_TRACE.VERBOSE, _sandboxed);
}

// Auto detect language changes
_cache.timesource = time_source_create(time_source_global, LOC_AUTODETECT_PERIOD, time_source_units_frames, function() {
    var _cache = __LocalizeCache();
    with (_cache) {
        
        // Wait for database to load
        if (is_undefined(locDatabase)) continue;
        
        // Update fallback data
        if (is_undefined(locFallData)) {
            locFallData = locDatabase[$ locFallCode];
        }
        
        // Update lang & cache
        if (is_undefined(locLangData)) {
            locLangData = locDatabase[$ locLangCode];
        } else {    // keep up to date with lang code
            if (locLangData.langCode != locLangCode) {
                locLangData = locDatabase[$ locLangCode]
                __LocalizeTrace(LOC_TRACE.VERBOSE, $"Language set to \"{locLangCode}\"");
            }
        }
    }
}, [], -1);
time_source_start(_cache.timesource);

// Initialize system debug window
__LocalizeDebug();