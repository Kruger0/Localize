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
if (LOC_UPDATE_MODE != LOC_UPDATE.DISABLED && _cache.canFetch) {
    var _sandboxed = (GM_is_sandboxed ? _cache.traceMsg.sandboxOn : _cache.traceMsg.sandboxOff);
    __LocalizeTrace(LOC_TRACE.INFO, _sandboxed);
}

// Search for any local file
__LocalizeUpdate();

// Fetch sheet file from cloud
var _localizeFetch;
switch (LOC_UPDATE_MODE) {
    case LOC_UPDATE.DISABLED:
        _localizeFetch = false;
        break;
    case LOC_UPDATE.DEVELOPMENT:
        _localizeFetch = (GM_build_type == "run");
        break;
    case LOC_UPDATE.PRODUCTION:
        _localizeFetch = true;
        break;
}

if (_localizeFetch) {
    if (_cache.canFetch) {
        __LocalizeDownload();
    } else {
        __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.cantFetch);
    }
} else {
    __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.localFile);
}

// Initialize system debug window
__LocalizeDebug();