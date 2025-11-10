/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns the current game language as a string.
function LocalizeGetLangName() {
    static _cache = __LocalizeCache();
    if (!is_undefined(_cache.locLangData)) {
        return _cache.locLangData.langName;
    }
    return "";
}