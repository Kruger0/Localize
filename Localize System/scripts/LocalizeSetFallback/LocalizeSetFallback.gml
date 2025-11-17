/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Defines a fallback language to be used if LocalizeDetectLang() fails
function LocalizeSetFallback(language){
    static _cache = __LocalizeCache();
    
    // Set by code
    if (array_contains(_cache.langCodes, language)) {
        _cache.locFallCode = _language;
        return 1;
    }
    
    // Set by name
    if (array_contains(_cache.langNames, language)) {
        var _langCode = _cache.langCodes[array_get_index(_cache.langNames, language)];
        _cache.locFallCode = _langCode;
        return 1;
    }
    __LocalizeTrace(LOC_TRACE.CRITICAL, $"Fallback language \"{language}\" does not exists");
    return 0;
}