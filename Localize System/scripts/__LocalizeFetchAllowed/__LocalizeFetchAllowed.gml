/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeFetchAllowed(){
    var _modeAllowed = false;
    switch (LOC_UPDATE_MODE) {
        case LOC_UPDATE.DISABLED:
            break;
        case LOC_UPDATE.DEVELOPMENT:
            _modeAllowed = (GM_build_type == "run");
            break;
        case LOC_UPDATE.PRODUCTION:
            _modeAllowed = true;
            break;
    }
    var _platformAllowed = false;
    switch (os_type) {
        case os_windows:
        case os_macosx:
        case os_linux:
            _platformAllowed = true;
            break;
    }
    return (_modeAllowed && _platformAllowed);
}