
var _cache = __LocalizeCache();
__LocalizeTrace(LOC_TRACE.VERBOSE, _cache.traceMsg.startup);
__LocalizeTrace(LOC_TRACE.VERBOSE, $"{GM_is_sandboxed ? _cache.traceMsg.sandboxOn : _cache.traceMsg.sandboxOff}");

if (LOC_UPDATE_MODE != LOC_ONLINE.DISABLED && GM_is_sandboxed) {
    //show_message("[Localize] Disable file system sandbox in order to use Online Mode!")
}

call_later(1, time_source_units_frames, function() {
    
    // Force initial local update
    if (file_exists(LOC_FILENAME)) {
        __LocalizeUpdate();
    }

    switch (LOC_UPDATE_MODE) {
        case LOC_ONLINE.DISABLED: {
            __LocalizeTrace(LOC_TRACE.VERBOSE, __LocalizeCache().traceMsg.offline);
            __LocalizeUpdate();
        } break;
        case LOC_ONLINE.DEVELOPMENT: {
            if (GM_build_type == "run") {
                __LocalizeDownload();
            }
        } break;
        case LOC_ONLINE.PRODUCTION: {
            if (GM_build_type == "exe") {
                __LocalizeDownload();
            }
        } break;
    }
})



