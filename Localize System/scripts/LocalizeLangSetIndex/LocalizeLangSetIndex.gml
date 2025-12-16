// feather ignore all
/// @desc Sets the language by its index in the loaded languages array.
/// @param {Real} index The index to set.
function LocalizeLangSetIndex(_index) {
    static _cache = __LocalizeCache();
    var _arr = _cache.langCodes;
    if (_index < 0 || _index >= array_length(_arr)) return;
    var _code = _arr[_index];
    LocalizeLangSet(_code);
}