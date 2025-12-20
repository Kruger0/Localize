// feather ignore all
/// @ignore
function __LocalizeMatchLang(language){
    static _cache = __LocalizeCache();
    with (_cache) {
        var _langTarg = string_lower(language);
        for (var i = 0; i < langCount; i++) {
            if (string_lower(langNames[i]) == _langTarg) return langCodes[i];
            if (string_lower(langCodes[i]) == _langTarg) return langCodes[i];
        }
        if (string_length(language) >= 2) {
            var _langBase = string_copy(_langTarg, 1, 2);
            for (var i = 0; i < langCount; i++) {
                var _langCode = string_lower(langCodes[i]);
                if (string_pos(_langBase, _langCode) == 1) {
                    return langCodes[i];
                }
            }
        }
        return language;
    }
}