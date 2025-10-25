/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/
//English-en-UK
///@desc Set the game language from the lang name, lang code or the lang id.
function LocalizeSetLang(lang) {
    var _cache = __LocalizeCache();
    var _count = LocalizeGetLangCount();
    
    // Name-cd-RG, Name-cd, Name
    if (is_string(lang)) {
        // Perfect match
        for (var i = 0; i < _count; i++) {
            var _language = _cache.languages[i];
            if (lang == _language[0] + "-" + _language[1]) {
                _cache.gameLang = i;
                return 1;
            }
        }
        // Partial match
        for (var i = 0; i < _count; i++) {
            var _language = _cache.languages[i];
            var _lang = string_split(lang, "-");
            if (lang[0] == _language[0] || lang[1] == _language[1]) {
                _cache.gameLang = i;
                return 1;
            }
        }
        __LocalizeTrace(LOC_TRACE.ERROR, _cache.traceMsg.lang404, lang);
        return 0
    } else if (is_real(lang)) {
        lang = clamp(lang, 0, _count);
        _cache.gameLang = lang;
    } else {
        __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.langIndex, lang);
    }
    return 1;
}

///@ignore
function __LocalizeGetLangId(lang) {
    var _cache      = __LocalizeCache();
    var _languages  = _cache.languages;
    var _length     = array_length(_languages);
    
    if (_length == 0) return -1;
    
    // Extract name and code from search string
    var _parts = string_split(lang, "-");
    var _searchName = _parts[0];
    var _searchCode = "";
    
    // Reconstruct code part (everything after first hyphen)
    if (array_length(_parts) > 1) {
        for (var i = 1; i < array_length(_parts); i++) {
            _searchCode += (i > 1 ? "-" : "") + _parts[i];
        }
    }
    
    // Priority 1: Exact full match "English-en-US"
    for (var i = 0; i < _length; i++) {
        var _name = _languages[i][0];
        var _code = _languages[i][1];
        var _full = _name + (_code != "" ? "-" + _code : "");
        
        if (lang == _full) return i;
    }
    
    // Priority 2: Exact code match "en-US" or "en"
    for (var i = 0; i < _length; i++) {
        var _code = _languages[i][1];
        
        // Match full code
        if (lang == _code) return i;
        
        // If searching without hyphen, also check if it matches full code
        if (_searchCode == "" && _code == lang) return i;
    }
    
    // Priority 3: Base code match (for partial codes like "en" matching "en-US")
    var _searchBase = (_searchCode != "") ? string_split(_searchCode, "-")[0] : _searchName;
    for (var i = 0; i < _length; i++) {
        var _code = _languages[i][1];
        if (_code == "") continue;
        
        var _codeBase = string_split(_code, "-")[0];
        if (_searchBase == _codeBase) return i;
    }
    
    // Priority 4: Name match "English"
    for (var i = 0; i < _length; i++) {
        if (_searchName == _languages[i][0]) return i;
    }
    
    return -1;
}

