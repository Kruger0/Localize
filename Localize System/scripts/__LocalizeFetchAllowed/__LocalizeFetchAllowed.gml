/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeFetchAllowed(){
    var _modeAllowed;
    switch (LOC_UPDATE_MODE) {
        case LOC_UPDATE.DISABLED:
            _modeAllowed = false;
            break;
        case LOC_UPDATE.DEVELOPMENT:
            _modeAllowed = (GM_build_type == "run");
            break;
        case LOC_UPDATE.PRODUCTION:
            _modeAllowed = true;
            break;
    }
    var _platformAllowed = (os_type == os_windows || os_type == os_macosx || os_type == os_linux);
    return (_modeAllowed && _platformAllowed);
}