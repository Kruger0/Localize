// feather ignore all

var _cache = __LocalizeCache();
if (!_cache.initiated) {
    __LocalizeTrace(-1, $"Running v{__LOC_VERSION} | Created by Krug | github.com/Kruger0/Localize | {__LOC_DATE}");
    
    // Trace sandbox status
    if (__LocalizeFetchAllowed()) {
        var _sandboxed = (GM_is_sandboxed ? 
            "Sandbox enabled. Downloads save to local appdata" : 
            "Sandbox disabled. Downloads save to project datafiles");
        __LocalizeTrace(LOC_TRACE.VERBOSE, _sandboxed);
    }else {
        __LocalizeTrace(LOC_TRACE.VERBOSE, "Online fetching disabled by current config or platform");
    }
    
    // Starts system internal step function
    _cache.timesource = time_source_create(time_source_global, 1, time_source_units_frames, __LocalizeStepFunction, [], -1);
    time_source_start(_cache.timesource);
    
    // Initialize system debug window
    __LocalizeDebug();
    _cache.initiated = true;
}
