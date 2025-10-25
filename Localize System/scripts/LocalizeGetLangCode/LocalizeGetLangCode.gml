/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns the ISO 639 Code asigned to the curreng lang.
function LocalizeGetLangCode() {
    var _cache = __LocalizeCache();
    var _lang = _cache.languages[_cache.gameLang];
    return _lang[1];
}