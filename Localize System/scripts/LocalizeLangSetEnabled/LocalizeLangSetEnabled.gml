/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/


function LocalizeLangSetEnabled(language, enabled){
    static _cache = __LocalizeCache();
    _cache.locDatabase[$ language].langEnabled = enabled;
}