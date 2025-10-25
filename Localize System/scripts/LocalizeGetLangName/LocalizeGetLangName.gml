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
    var _lang = _cache.languages[_cache.gameLang];
    return _lang[0] + (includeCode ? "-" + _lang[1] : "");
}