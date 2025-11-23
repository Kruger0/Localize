// feather ignore all
/// @desc Returns the total number of languages currently loaded.
/// @returns {Real} The count.
function LocalizeGetLangCount() {
    static _cache = __LocalizeCache();
    return _cache.langCount;
}