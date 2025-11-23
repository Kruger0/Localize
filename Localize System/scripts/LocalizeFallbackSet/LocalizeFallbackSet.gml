// feather ignore all
/// @desc Sets the fallback language request.
/// @param {String} language The language code to request.
function LocalizeFallbackSet(language){
    static _cache = __LocalizeCache();
    _cache.locFallCode = language;
}