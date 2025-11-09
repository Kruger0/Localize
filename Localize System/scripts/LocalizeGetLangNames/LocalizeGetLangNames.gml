/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns an array containing the ISO 639 codes of the loaded languages actives in the game
function LocalizeGetLangNames() {
    static _cache = __LocalizeCache();
    return _cache.langNames;
}