///@func LocalizeTextExt(key, arg_array)
///@desc Returns the localized text on the lang cache from a provided key and an array with the values to replace in the string.
function LocalizeTextExt(_key, _arr) {
    var _cache = __LocalizeCache();
    var _str = "";
    var _lang = _cache.gameLang;
    
    // Get localized string
    var _langs = __LocalizeCache().gameTexts[$ _key];
    if (is_array(_langs)) {
        if (array_length(_langs) > _lang) {
            _str = string_ext(_langs[_lang], _arr);
        }
    }
    
    // Key failsafe
    if (_str == "") {
        _str = string(_cache.traceMsg.trns404, _key, _cache.langNames[_lang]);
    }
    
    // Apply text tags
    var _tagArr = struct_get_names(_cache.tags);
    var _tagLen = array_length(_tagArr);
    for (var i = 0; i < _tagLen; i++) {
        var _tagName = _tagArr[i];
        var _tagValue = _cache.tags[$ _tagName];
        _str = string_replace_all(_str, _tagName, _tagValue);
    }
    
    return _str;
}