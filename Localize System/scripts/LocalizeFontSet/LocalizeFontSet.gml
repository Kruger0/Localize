// feather ignore all
/// @desc Assigns a specific font asset to a language at runtime.
/// @param {String} language The language code (e.g. "en-US", "en" or "English").
/// @param {Asset.GMFont|String} font The font to assign. Can be a font name ("fnt_arial") or asset id (fnt_arial).
/// @return {Real} 1 on success, 0 on failure.
function LocalizeFontSet(language, font){
    static _cache = __LocalizeCache();
    language = __LocalizeMatchLang(language);
    if (is_string(font)) {
        if (asset_get_type(font) == asset_font) {
            var _idx = asset_get_index(font);
            if (font_exists(_idx)) font = _idx;
        }
    }
    _cache.fontDefined[$ language] = font;
    if (is_undefined(_cache.locDatabase)) return 0;
    var _entry = _cache.locDatabase[$ language];
    if (!is_undefined(_entry)) {
        _entry.langFont = font;
        return 1;
    }
    return 0;
}