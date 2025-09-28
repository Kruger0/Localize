///@func LocalizeTextExt(key, arg_array)
///@desc Returns the localized text on the lang cache from a provided key and an array with the values to replace in the string.
function LocalizeTextExt(_key, _arr) {
    var _cache = __LocalizeCache();
    var _str = "";
    var _lang = _cache.gameLang;
    
    // Get localized string
    var _langs = __LocalizeCache().gameTexts[$ _key];
    if (is_array(_langs)) {
        _str = string_ext(_langs[_lang], _arr);
    } else {
        // No key was found
        _str = string(_cache.traceMsg.key404, _key, LOC_FILENAME);
    }
    
    // No translation was found
    if (_str == "") {
        _str = string(_cache.traceMsg.trns404, _key, _cache.langNames[_lang]);
    }
    
    return _str;
}