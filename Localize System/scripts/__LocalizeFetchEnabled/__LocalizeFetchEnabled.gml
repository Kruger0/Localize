/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeFetchEnabled(){
    var _localizeFetch;
    switch (LOC_UPDATE_MODE) {
        case LOC_UPDATE.DISABLED:
            _localizeFetch = false;
            break;
        case LOC_UPDATE.DEVELOPMENT:
            _localizeFetch = (GM_build_type == "run");
            break;
        case LOC_UPDATE.PRODUCTION:
            _localizeFetch = true;
            break;
    }
    return _localizeFetch;
}