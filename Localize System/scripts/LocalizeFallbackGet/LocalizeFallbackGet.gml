// feather ignore all
/// @desc Returns the ISO 639 Code of the current fallback language.
/// @returns {String} The fallback code, or "" if none is set/loaded.
function LocalizeFallbackGet() {
    static _cache = __LocalizeCache();
    if (!is_undefined(_cache.locFallData)) {
        return _cache.locFallData.langCode;
    }
    return _cache.locFallCode;
}