
__LocalizeTrace(__LOC_DEBUG.CRITICAL, $"Running v{LOCALIZE_VERSION}. Created by Krug | github.com/Kruger0/Localize");
__LocalizeTrace(__LOC_DEBUG.CRITICAL, __LocalizeCache().traceMsg.sandboxed, $"{GM_is_sandboxed ? "Enabled" : "Disabled"}");

/////@ignore
//function __LocalizeInit(_startup = false, _forced = true) {

//}


//__LocalizeInit(true, false)


var _isConnected = string_count(".",string(network_resolve("www.google.com")));
var _onlineAtRelease = !(GM_build_type == "exe" && !LOC_ONLINE_MODE);
    
if ((_onlineAtRelease) && _isConnected) {
    // Online mode
    __LocalizeTrace(__LOC_DEBUG.CRITICAL, __LocalizeCache().traceMsg.online);
    __LocalizeDownload();
} else {
    // Offline mode
    __LocalizeTrace(__LOC_DEBUG.CRITICAL, __LocalizeCache().traceMsg.offline);
    __LocalizeUpdate();
    return;
}
    
//// Try to load a .csv at the game start
//if (_startup) {
//    __LocalizeUpdate();
//}

