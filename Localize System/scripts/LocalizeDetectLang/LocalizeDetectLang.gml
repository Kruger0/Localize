/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Automatically detects the users system language and set it as the game language
function LocalizeDetectLang() {
    var _cache  = __LocalizeCache();
    var _locale = LocalizeGetLocale();
    
    // Skip it no language loaded
    if (array_length(_cache.langNames) == 0) return 0;

    // Search for language + region code
    for (var i = 0; i < array_length(_cache.langCodes); i++) {
        var _langCode = _cache.langCodes[i];
        if (_locale == _langCode) {
            LocalizeSetLang(i);
            return;
        }
    }
    
    // Search for language only
    _locale = string_split(_locale, "-")[0];
    for (var i = 0; i < array_length(_cache.langCodes); i++) {
        var _langCode = string_split(_cache.langCodes[i], "-")[0];
        if (_locale == _langCode) {
            LocalizeSetLang(i);
            return;
        }
    }
    
    // Language fallback
    if (_cache.fallback != -1) {
        LocalizeSetLang(_cache.fallback);
    }
}