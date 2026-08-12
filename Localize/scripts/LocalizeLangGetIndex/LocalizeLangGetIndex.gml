// feather ignore all
/// @desc Returns the index of the current language in the loaded languages array.
/// @return {Real} Index (0 to N-1) or -1 if not found.
function LocalizeLangGetIndex() {
    static _cache = __LocalizeCache();
    with (_cache) {
        var _currentCode = locLangCode;
        if (is_undefined(_currentCode)) return -1;
        var _arr = langCodes;
        var _len = array_length(_arr);
        for (var i = 0; i < _len; i++) {
            if (_arr[i] == _currentCode) return i;
        }
        return -1;
    }
}