// feather ignore all
/// @desc Returns the array of all loaded language Codes (e.g. ["en-US", "pt-BR"]).
/// @returns {Array<String>} An array of strings representing the ISO language codes.
function LocalizeGetLangCodes() {
    static _cache = __LocalizeCache();
    return _cache.langCodes;
}