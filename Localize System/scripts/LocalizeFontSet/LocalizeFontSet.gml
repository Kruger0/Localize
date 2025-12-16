// feather ignore all
/// @desc Assigns a specific font asset to a language at runtime.
/// @param {String} language The language code.
/// @param font The font to assign. Can be a font name or asset id.
/// @returns {Real} 1 on success, 0 on failure.
function LocalizeFontSet(language, font){
    static _cache = __LocalizeCache();
    _cache.definedFont[$ language] = font;
    if (is_undefined(_cache.locDatabase)) return 0;
    var _entry = _cache.locDatabase[$ language];
    if (!is_undefined(_entry)) {
        _entry.langFont = font;
        return 1;
    }
    return 0;
}