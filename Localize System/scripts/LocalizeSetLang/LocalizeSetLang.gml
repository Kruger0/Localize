/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Set the game language from the language name or language code
function LocalizeSetLang(language) {
    static _cache = __LocalizeCache();
    
    if (is_undefined(_cache.locDatabase)) {
        _cache.locLangCode = language;
        return 0;
    }
    
    for (var i = 0; i < _cache.langCount; i++) {
        var _dbCode = _cache.langCodes[i]; // "en-US"
        var _dbName = _cache.langNames[i]; // "English"
        
        // Check long code
        if (language == _dbCode) {
            _cache.locLangCode = _dbCode;
            return 1;
        }
        
        // Check lang name
        if (language == _dbName) {
            _cache.locLangCode = _dbCode;
            return 1;
        }
        
        // Check short code
        var _split = string_split(_dbCode, "-");
        if (array_length(_split) > 0) {
            if (language == _split[0]) {
                _cache.locLangCode = _dbCode;
                return 1;
            }
        }
    }
    
    // Failure
    __LocalizeTrace(LOC_TRACE.CRITICAL, $"Language '{language}' does not exist in database.");
    return 0;
}