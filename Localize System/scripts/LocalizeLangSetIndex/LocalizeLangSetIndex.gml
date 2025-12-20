// feather ignore all
/// @desc Sets the language by its index in the loaded languages array.
/// @param {Real} index The index to set.
function LocalizeLangSetIndex(index) {
    static _cache = __LocalizeCache();
    var _arr = _cache.langCodes;
    if (index < 0 || index >= array_length(_arr)) return;
    var _code = _arr[index];
    LocalizeLangSet(_code);
}