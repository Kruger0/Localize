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
if (LOC_UPDATE_MODE != LOC_UPDATE.DISABLED) {
    __LocalizeTrace(LOC_TRACE.INFO, $"{GM_is_sandboxed ? _cache.traceMsg.sandboxOn : _cache.traceMsg.sandboxOff}");
}

// Search for any local file
__LocalizeUpdate();
__LocalizeDebug();

// Download sheet file from cloud
switch (LOC_UPDATE_MODE) {
    case LOC_UPDATE.DISABLED: {
        __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.localFile);
    } break;
    case LOC_UPDATE.DEVELOPMENT: {
        if (GM_build_type == "run") {
            __LocalizeDownload();
        }
    } break;
    case LOC_UPDATE.PRODUCTION: {
        __LocalizeDownload();
    } break;
}

