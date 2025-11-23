// feather ignore all
/// @desc Returns the font name for a specific language, or the current language if none is specified.
/// @param {String} [language] The language code to check.
/// @returns {String} The font name defined for that language, or "" if no font is assigned.
function LocalizeFontGetName(language = undefined) {
    static _cache = __LocalizeCache();
    var _data = undefined;
    if (is_undefined(language)) {
        _data = _cache.locLangData;
        if (is_undefined(_data)) {
            _data = _cache.locFallData;
        }
    } 
    else {
        if (!is_undefined(_cache.locDatabase)) {
            _data = _cache.locDatabase[$ language];
        }
    }
    if (!is_undefined(_data)) {
        return _data.langFontName;
    }
    return "";
}