/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Returns the language code provided by the operation system
function LocalizeGetLocale(){
    static _cache = __LocalizeCache();
    return _cache.osLangCode;
}