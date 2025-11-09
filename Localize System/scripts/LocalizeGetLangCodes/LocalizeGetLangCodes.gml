/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns an array containing the name of the loaded languages actives in the game
function LocalizeGetLangCodes() {
    var _cache = __LocalizeCache();
    return _cache.langCodes;
}