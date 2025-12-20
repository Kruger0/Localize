// feather ignore all
/// @ignore
function __LocalizeFontSet(fontData) {
    static _cache = __LocalizeCache();
    with (_cache) {
        var _fontId = -1;
        if (is_string(fontData)) {
            if (asset_get_type(fontData) == asset_font) {
                _fontId = asset_get_index(fontData);
            }
        }
        else if (font_exists(fontData)) {
            _fontId = fontData;
        }
        fontCurrIndex = _fontId;
        if (font_exists(_fontId)) {
            fontCurrAsset = font_get_name(_fontId);
            fontCurrName  = font_get_fontname(_fontId);
        } 
        else {
            fontCurrAsset = string(fontData); 
            fontCurrName  = "Unknown/External";
        }
    }
}