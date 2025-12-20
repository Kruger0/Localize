/// @desc Returns the global default font used as a fallback when a language-specific font is missing.
/// @return {Asset.GMFont} The current default font asset (or string name).
function LocalizeFontGetDefault(){
    static _cache = __LocalizeCache();
    return _cache.fontDefault;
}