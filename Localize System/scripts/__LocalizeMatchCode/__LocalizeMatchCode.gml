// feather ignore all
/// @ignore
function __LocalizeMatchCode(langCode){
    static _cache = __LocalizeCache();
    with (_cache) {
        var _langBase = string_copy(langCode, 1, 2);
        for (var i = 0; i < langCount; i++) {
            var _dataCode = langCodes[i];
            if (string_pos(_langBase, _dataCode) == 1) {
                return _dataCode;
            }
        }
        return langCode;
    }
}