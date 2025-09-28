
var _cache = __LocalizeCache();
__LocalizeTrace(LOC_TRACE.VERBOSE, _cache.traceMsg.startup);

if (LOC_UPDATE_MODE != LOC_UPDATE.DISABLED) {
    __LocalizeTrace(LOC_TRACE.VERBOSE, $"{GM_is_sandboxed ? _cache.traceMsg.sandboxOn : _cache.traceMsg.sandboxOff}");
}

// Force initial local update
if (file_exists(LOC_FILENAME)) {
    __LocalizeUpdate();
}

switch (LOC_UPDATE_MODE) {
    case LOC_UPDATE.DISABLED: {
        __LocalizeTrace(LOC_TRACE.VERBOSE, __LocalizeCache().traceMsg.offline);
        __LocalizeUpdate();
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

