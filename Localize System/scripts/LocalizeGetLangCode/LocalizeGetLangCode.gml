/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns the ISO 639 Code asigned to the curreng lang.
function LocalizeGetLangCode() {
    static _cache = __LocalizeCache();
    return _cache.locLangData.langCode;
}