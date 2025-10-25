/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

// Start system
var _cache = __LocalizeCache();
__LocalizeTrace(-1, _cache.traceMsg.startup);

// Trace sandbox status
if (LOC_UPDATE_MODE != LOC_UPDATE.DISABLED && _cache.canDownload) {
    var _sandboxed = (GM_is_sandboxed ? _cache.traceMsg.sandboxOn : _cache.traceMsg.sandboxOff);
    __LocalizeTrace(LOC_TRACE.INFO, _sandboxed);
}

// Initialize system debug window
__LocalizeDebug();