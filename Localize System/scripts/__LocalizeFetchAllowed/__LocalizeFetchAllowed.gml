// feather ignore all
///@ignore
function __LocalizeFetchAllowed(){
    var _modeAllowed = false;
    
    // Checl update configuration
    switch (LOC_UPDATE_MODE) {
        case LOC_UPDATE.DISABLED:
            return;
        case LOC_UPDATE.DEVELOPMENT:
            _modeAllowed = (GM_build_type == "run");
            break;
        case LOC_UPDATE.PRODUCTION:
            _modeAllowed = true;
            break;
    }
    if (!_modeAllowed) return false;
    
    // Check platform support
    var _platformAllowed = false;
    switch (os_type) {
        case os_windows:
        case os_macosx:
        case os_linux:
        case os_android:
        case os_ios:
        case os_gxgames:
            return true;
        default:
            return false;
    }
    
    //var _result = (_modeAllowed && _platformAllowed);
    
    //// Check sandboxing
    //if (_result && GM_is_sandboxed) {
    //    //if (GM_build_type == "run") {
    //    //    __LocalizeError($"Cannot write on datafiles!\nPlease disable file system sandbox on desktop\nOr change '{nameof(LOC_UPDATE_MODE)}' to '{nameof(LOC_UPDATE.DISABLED)}'");
    //    //} else {
    //    //    __LocalizeTrace(LOC_TRACE.CRITICAL, "Cannot write on datafiles!");
    //    //    _result = false;
    //    //}
    //}
    //return _result;
}