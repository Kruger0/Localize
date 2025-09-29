/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns the current game language as a string.
function LocalizeGetLangName() {
    var _cache = __LocalizeCache();
    return _cache.langNames[_cache.gameLang];
}