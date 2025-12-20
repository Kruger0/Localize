// feather ignore all
/// @desc Returns the total number of languages currently loaded.
/// @return {Real} The count.
function LocalizeLangGetCount() {
    static _cache = __LocalizeCache();
    return _cache.langCount;
}