// feather ignore all
/// @desc Returns the array of all loaded language Display Names (e.g. ["English", "French"]) defined by the LOC_LANGNAME key in the sheet.
/// @returns {Array<String>} An array of strings representing the readable names.
function LocalizeGetLangNames() {
    static _cache = __LocalizeCache();
    return _cache.langNames;
}