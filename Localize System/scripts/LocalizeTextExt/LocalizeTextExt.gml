///@func LocalizeTextExt(key, arg_array)
///@desc Returns the localized text on the lang cache from a provided key and an array with the values to replace in the string.
function LocalizeTextExt(_key, _arr) {    
    var _str = "";
    var _lang = __LocCache().gameLang;
    
    // Get localized string
    var _langs = __LocCache().gameTexts[$ _key];
    if (is_array(_langs)) {
        _str = string_ext(_langs[_lang], _arr);
    } else {
        // No key was found
        _str = string(__LocCache().traceMsg.key404, _key, LOC_FILENAME);
    }
    
    // No translation was found
    if (_str == "") {
        _str = string(__LocCache().traceMsg.trns404, _key, LocalizeText(LOC_LANG_KEY));
    }
    
    return _str;
}