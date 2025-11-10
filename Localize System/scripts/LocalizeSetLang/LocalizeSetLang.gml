/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Set the game language from the language name or language code
function LocalizeSetLang(langCode) {
    static _cache = __LocalizeCache();
    if (is_undefined(_cache.locDatabase)) {
        _cache.locLangCode = langCode;
        return 0;
    }
    var _langCodes = struct_get_names(_cache.locDatabase);
    var _langFound = false;
    // Check for full locale entry
    if (array_contains(_langCodes, langCode)) {
        _cache.locLangCode = langCode;
        return 1;
    }    
    // Check for language only entry
    for (var i = 0; i < array_length(_langCodes); i++) {
        var _langCode = _langCodes[i];
        var _language = string_split(_langCode, "-")[0];
        if (langCode == _language) {
            _cache.locLangCode = langCode;
            return 1;
        }
    }
    // TODO Check for language name
    
    
    // No language could be setted
    __LocalizeTrace(LOC_TRACE.CRITICAL, $"Language \"{langCode}\" does not exists");
    return 0;
}