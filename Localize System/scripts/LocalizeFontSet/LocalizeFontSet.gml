// feather ignore all
/// @desc Assigns a specific font asset to a language at runtime.
/// @param {String} language The language code (e.g. "en-US", "en", "English").
/// @param {Asset.GMFont|String} font The font to assign. Can be a font name ("fnt_arial") or asset id (fnt_arial).
/// @return {Real} 1 on success, 0 on failure.
function LocalizeFontSet(language, font){
    static _cache = __LocalizeCache();
    
    // 1. Sanitize the Language Input ("English" -> "en-US")
    language = __LocalizeMatchLang(language);
    
    // 2. Resolve String -> ID (Safety Check)
    // If the user passes "fnt_arial", we convert it to the ID. 
    // If they pass "spr_scribble_font", we keep it as a string.
    if (is_string(font)) {
        if (asset_get_type(font) == asset_font) {
            var _idx = asset_get_index(font);
            if (font_exists(_idx)) font = _idx;
        }
    }
    
    // 3. Update the Runtime Overrides
    _cache.fontDefined[$ language] = font;
    
    // 4. Apply to Active Database
    if (is_undefined(_cache.locDatabase)) return 0;
    
    var _entry = _cache.locDatabase[$ language];
    if (!is_undefined(_entry)) {
        _entry.langFont = font;
        return 1;
    }
    
    return 0;
}