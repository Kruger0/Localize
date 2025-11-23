// feather ignore all
/// @desc Checks if a specific language is enabled.
/// @param {String} [language] The language code to check.
/// @returns {Bool} True if enabled, False if disabled or not found.
function LocalizeLangGetEnabled(language = undefined){
    static _cache = __LocalizeCache();
    var _entry = undefined;
    if (is_undefined(language)) {
        _entry = _cache.locLangData;
    }
    else {
        if (!is_undefined(_cache.locDatabase)) {
            _entry = _cache.locDatabase[$ language];
        }
    }
    if (!is_undefined(_entry)) {
        return _entry.langEnabled;
    }
    return false;
}