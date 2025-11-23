// feather ignore all
/// @desc Returns the name of the currently active, loaded language.
/// @returns {String} The language name, or "" if no data is loaded.
function LocalizeLangGetName() {
    static _cache = __LocalizeCache();
    if (!is_undefined(_cache.locLangData)) {
        return _cache.locLangData.langName;
    }
    return "";
}