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
    
    // Check codes
    if (array_contains(_cache.langCodes, language)) {
        _cache.locFallCode = language;
        return 1;
    }
    
    // Check names
    var _index = array_get_index(_cache.langNames, language);
    if (_index != -1) {
        _cache.locFallCode = _cache.langCodes[_index];
        return 1;
    }
    
    // Raw string
    _cache.locFallCode = language;
    return 0;
}