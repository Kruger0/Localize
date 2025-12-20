// feather ignore all
/// @desc Returns the ISO 639 Code of the currently active, loaded language.
/// @return {String} The language code (e.g. "en-US"), or "" if no data is loaded.
function LocalizeLangGet() {
    static _cache = __LocalizeCache();
    with (_cache) {
        if (!is_undefined(locLangData)) {
            return locLangData.langCode;
        }
        return locLangCode;
    }
}