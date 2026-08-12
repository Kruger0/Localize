// feather ignore all
/// @ignore
function __LocalizeInit() {
    // Single run script
    static _init = false;
    if (_init) return;
    _init = true;
    
    static _cache = __LocalizeCache();
    __LocalizeTrace(LOC_TRACE.FORCED, $"Running v{__LOC_VERSION} | Created by Krug | github.com/Kruger0/Localize | {__LOC_DATE}");
    
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
    _cache.timesource = time_source_create(time_source_global, 1, time_source_units_frames, __LocalizeStep, [], -1);
    time_source_start(_cache.timesource);
    
    // Initialize system debug window
    __LocalizeDebug();
}

__LocalizeInit();