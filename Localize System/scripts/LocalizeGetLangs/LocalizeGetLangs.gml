/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns an array containing the ISO code of the loaded languages actives in the game
function LocalizeGetLangs() {
    var _cache = __LocalizeCache();
    var _langCodes = struct_get_names(_cache.langData);
    return _langCodes;
}