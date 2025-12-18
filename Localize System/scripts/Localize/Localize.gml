// feather ignore all
/// @desc Returns the localized string for the given key, applying template arguments and tags.
/// @param {String} key The key defined in the translation file.
/// @param {Any} [val] Arguments to replace placeholders ({0}, {1}...) in the text.
/// @returns {String} The localized string
function Localize(key) {
    static _cache = __LocalizeCache();
    
    if (_cache.debugMode) return key;
    
    
    // Resolve langData
    var _langData = _cache.locLangData;
    if (is_undefined(_langData)) {
        _langData = _cache.locFallData;
        if (is_undefined(_langData)) return key;
    }
    
    // Check for cache
    var _string = _langData.langCache[$ key];
    if (is_undefined(_string)) {
        if (_cache.recursion >= LOC_MAX_RECURSION_DEPTH) {
            __LocalizeTrace(LOC_TRACE.CRITICAL, $"Reached max recursion depth at key '{key}'. Check for self-referencing keys!");
            _langData.langCache[$ key] = key;
            return key;
        }
        
        var _stringRaw = _langData.langKeys[$ key];
        
        // Check if undefined or missing entry
        if (is_undefined(_stringRaw) || _stringRaw == "") {
            if (!is_undefined(_cache.locFallData)) {
                var _fallString = _cache.locFallData.langKeys[$ key];
                if (!is_undefined(_fallString) && _fallString != "") {
                    _stringRaw = _fallString;
                }
            }
        }
        
        // Error Checking
        if (__LocalizeDetectCellError(_stringRaw)) return key;
        
        // Handle tag and key parsing
        if (string_pos("{", _stringRaw) > 0) {
            var _stringOut = "";
            var _working   = _stringRaw;
            
            // Simple string parser
            while (string_length(_working) > 0) {
                var _open = string_pos("{", _working);
                if (_open == 0) {
                    _stringOut += _working;
                     break;
                }
                _stringOut += string_copy(_working, 1, _open - 1);
                _working    = string_delete(_working, 1, _open);
                var _close = string_pos("}", _working);
                if (_close == 0) {
                    _stringOut += "{";
                    continue;
                }
                var _token = string_copy(_working, 1, _close - 1);
                _working   = string_delete(_working, 1, _close);
                var _colon = string_pos(":", _token);
                var _replacement = undefined;
                if (_colon > 0) {
                    var _type = string_lower(string_copy(_token, 1, _colon - 1));
                    var _val  = string_delete(_token, 1, _colon);
                    switch (_type) {
                        case "k":
                        case "key": {
                            _cache.recursion++;
                            try {
                                _replacement = Localize(_val);
                            } finally {
                                _cache.recursion--;
                            }
                        } break;
                        case "t":
                        case "tag": {
                            _replacement = _cache.locTagKeys[$ _val];
                        } break;
                    }
                }
                if (!is_undefined(_replacement)) {
                    _stringOut += _replacement;
                } else {
                    _stringOut += "{"+_token+"}";
                }
            }
            _string = _stringOut;
        } else {
            _string = _stringRaw;
        }
        
        // Save to cache
        _langData.langCache[$ key] = _string;
    }
    
    // Handle dynamic arguments
    if (argument_count > 1) {
        var _count = argument_count - 1;
        var _args = array_create(_count);
        for (var i = 0; i < _count; i++) {
            _args[i] = argument[i + 1];
        }
        _string = string_ext(_string, _args);
    }
    return _string;
}