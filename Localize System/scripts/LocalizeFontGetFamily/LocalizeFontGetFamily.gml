// feather ignore all
/// @desc Returns the font family name of the active font.
/// @return {String} The font family (e.g. "Arial").
function LocalizeFontGetFamily() {
    static _cache = __LocalizeCache();
    return _cache.fontCurrName; 
}