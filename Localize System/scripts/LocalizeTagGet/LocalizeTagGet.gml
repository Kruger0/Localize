// feather ignore all
/// @desc Returns the value currently assigned to a specific tag.
/// @param {String} tag The tag key to check.
/// @returns {String} The value string, or undefined if the tag does not exist.
function LocalizeTagGet(tag){
    static _cache = __LocalizeCache();
    return _cache.locTagKeys[$ tag];
}