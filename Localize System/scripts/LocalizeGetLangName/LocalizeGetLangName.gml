/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns the current game language as a string.
function LocalizeGetLangName(includeCode = false) {
    var _cache = __LocalizeCache();
    var _lang = _cache.gameTexts[$ _cache.gameLang];
    return _lang.langName + (includeCode ? "-" + _cache.gameLang : "");
}