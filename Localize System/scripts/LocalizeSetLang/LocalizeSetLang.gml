/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Set the game language from the lang ISO 639 code
function LocalizeSetLang(langCode) {
    var _cache = __LocalizeCache();
    
    // Check for full locale entry
    var _langCodes = struct_get_names(_cache.gameTexts);
    if (array_contains(_langCodes, langCode)) {
        _cache.gameLang = langCode;
        return true;
    }
    
    // Check for language only entry
    for (var i = 0; i < array_last(_langCodes); i++) {
        var _langCode = string_split(_langCodes[i], "-")[0];
        if (_langCode == langCode) {
            _cache.gameLang = langCode;
            return true;
        }
    }
    
    return false;
}