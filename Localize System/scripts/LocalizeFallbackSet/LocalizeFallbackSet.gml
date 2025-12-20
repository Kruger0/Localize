// feather ignore all
/// @desc Sets the fallback language. It will be used when no translation is found in the current language. If not defined, the raw key will be returned instead
/// @param {String} language The language code (e.g. "en-US", "en" or "English").
function LocalizeFallbackSet(language){
    static _cache = __LocalizeCache();
    with (_cache) {
        language = __LocalizeMatchLang(language);
        locFallCode = language;
        if (is_undefined(locDatabase)) return;
        var _fallData = locDatabase[$ locFallCode];
        if (!is_undefined(_fallData)) {
            __LocalizeFallbackSet(_fallData);
        }
    }
}