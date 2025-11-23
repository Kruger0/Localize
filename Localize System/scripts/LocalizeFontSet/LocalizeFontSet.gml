// feather ignore all
/// @desc Assigns a specific font asset to a language at runtime.
/// @param {String} language The language code.
/// @param {Asset.GMFont} font The font asset to assign.
/// @returns {Real} 1 on success, 0 on failure.
function LocalizeFontSet(language, fontId){
    static _cache = __LocalizeCache();
    
    if (is_undefined(_cache.locDatabase)) return 0;
    var _entry = _cache.locDatabase[$ language];
    if (!is_undefined(_entry)) {
        _entry.langFontId = fontId;
        if (font_exists(fontId)) {
            _entry.langFontName = font_get_name(fontId);
        }
        return 1;
    }
    __LocalizeTrace(LOC_TRACE.CRITICAL, $"Cannot set font. Language '{language}' not found.");
    return 0;
}