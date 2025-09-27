
///@ignore
function __LocalizeInit(_startup = false, _forced = true) {
    var _isConnected = string_count(".",string(network_resolve("www.google.com")));
    var _onlineAtRelease = !(GM_build_type == "exe" && !LOC_ONLINE_MODE);
    
    if ((_onlineAtRelease || _forced) && _isConnected) {
        // Online mode
        // Credits to https://twitter.com/VINE2D for coming up with this
        var _link = $"https://docs.google.com/spreadsheets/d/{LOC_SHEET_ID}/export?format=csv&id={LOC_SHEET_ID}&gid=0";
        var _path = __LocCache().locPath + LOC_FILENAME;
        __LocCache().requestId = http_get_file(_link, _path);
        __LocTrace(LOC_DEBUG.CRITICAL, __LocCache().traceMsg.online);
    } else {
        // Offline mode
        __LocTrace(LOC_DEBUG.CRITICAL, __LocCache().traceMsg.offline);
        __LocalizeUpdate();
        return;
    }
    
    // Try to load a .csv at the game start
    if (_startup) {
        __LocalizeUpdate()
    }
}


__LocTrace(LOC_DEBUG.CRITICAL, $"Running v{LOCALIZE_VERSION}. Created by Krug | github.com/Kruger0/Localize");
__LocTrace(LOC_DEBUG.CRITICAL, __LocCache().traceMsg.sandboxed, $"{GM_is_sandboxed ? "Enabled" : "Disabled"}")
__LocalizeInit(true, false)

