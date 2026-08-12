// feather ignore all
/// @desc Returns the language and region code reported by the user's Operating System.
/// @return {String} The detected OS code (e.g. "en-US").
function LocalizeOSLocaleGet(){
    static _cache = __LocalizeCache();
    return _cache.osLangCode;
}