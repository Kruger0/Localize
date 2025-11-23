// feather ignore all
/// @desc Returns the ISO 639 Code of the currently active, loaded language.
/// @returns {String} The language code (e.g. "en-US"), or "" if no data is loaded.
function LocalizeLangGet() {
    static _cache = __LocalizeCache();
    if (!is_undefined(_cache.locLangData)) {
        return _cache.locLangData.langCode;
    }
    return "";
}