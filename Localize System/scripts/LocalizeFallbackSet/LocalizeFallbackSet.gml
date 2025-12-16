// feather ignore all
/// @desc Sets the fallback language request.
/// @param {String} language The language code to request.
function LocalizeFallbackSet(language){
    static _cache = __LocalizeCache();
    with (_cache) {
        locFallCode = language;
        if (is_undefined(locFallData)) return;
        var _fallData = locDatabase[$ locFallCode];
        if (!is_undefined(_fallData)) {
            __LocalizeFallbackSet(_fallData);
        }
    }
}