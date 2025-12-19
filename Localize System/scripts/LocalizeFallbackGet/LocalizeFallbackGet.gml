// feather ignore all
/// @desc Returns the ISO 639 Code of the current fallback language.
/// @return {String} The fallback code, or "" if none is set/loaded.
function LocalizeFallbackGet() {
    static _cache = __LocalizeCache();
    with (_cache) {
        if (!is_undefined(locFallData)) {
            return locFallData.langCode;
        }
        return locFallCode;
    }
}