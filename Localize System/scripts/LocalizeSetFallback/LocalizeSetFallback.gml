/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Defines a fallback language to be used if LocalizeDetectLang() fails
function LocalizeSetFallback(langCode){
    static _cache = __LocalizeCache();
    if (is_undefined(_cache.locDatabase)) {
        _cache.locFallCode = langCode;
        return 0;
    }
    var _langCodes = struct_get_names(_cache.locDatabase);
    if (array_contains(_langCodes, langCode)) {
        _cache.locFallData = _cache.locDatabase[$ langCode];
        return 1;
    }
    __LocalizeTrace(LOC_TRACE.CRITICAL, $"Fallback language \"{langCode}\" does not exists");
    return 0;
}