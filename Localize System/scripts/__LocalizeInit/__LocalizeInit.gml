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

// Trace sandbox status
if (__LocalizeFetchAllowed()) {
    var _sandboxed = (GM_is_sandboxed ? _cache.traceMsg.sandboxOn : _cache.traceMsg.sandboxOff);
    __LocalizeTrace(LOC_TRACE.VERBOSE, _sandboxed);
}

// Initialize system debug window
__LocalizeDebug();