/// @desc Sets the global default font used as a fallback when a language-specific font is missing.
/// @param {Asset.GMFont} font The font asset (or string name) to set as the default.
function LocalizeFontSetDefault(font){
    static _cache = __LocalizeCache()
    _cache.fontDefault = font;
}