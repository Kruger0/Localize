/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Defines a fallback language to be displayed when the translation for a key does not exists
///@param {string} language The language code, language name or the full language entry defined on the sheet ("en", "en-US" or "English_en-US")
function LocalizeSetFallback(language){
    static _cache = __LocalizeCache();
    
    // Set by code
    if (array_contains(_cache.langCodes, language)) {
        _cache.locFallCode = language;
        return 1;
    }
    
    // Set by name
    if (array_contains(_cache.langNames, language)) {
        var _langCode = _cache.langCodes[array_get_index(_cache.langNames, language)];
        _cache.locFallCode = _langCode;
        return 1;
    }
    
    // Set the raw string.
    _cache.locFallCode = language;
    return 0;
}