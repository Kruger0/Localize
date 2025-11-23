// feather ignore all
///@ignore
function __LocalizeFetchAllowed(){
    var _modeAllowed = false;
    
    // Checl update configuration
    switch (LOC_UPDATE_MODE) {
        case LOC_UPDATE.DISABLED:
            return false;
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
        case os_gxgames: {
            _platformAllowed = true;
        } break;
    }
    if (!_platformAllowed) return false;
    
    if (LOC_FORCE_BUNDLE_AREA && GM_is_sandboxed && GM_build_type == "run") {
         __LocalizeError($"Cannot write on datafiles!\nPlease disable file system sandbox on current platform\nOr change '{nameof(LOC_FORCE_BUNDLE_AREA)}' to false in '{nameof(LocalizeConfig)}'");
    }
    
    return true;
}