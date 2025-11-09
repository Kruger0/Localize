/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Defines a fallback language to be used if LocalizeDetectLang() fails
function LocalizeSetFallback(langCode){
    var _cache = __LocalizeCache();
    _cache.fallback = langCode;
    _cache.gameLang ??= langCode;
}