// feather ignore all
/// @desc Returns the font asset index associated with the current active language.
/// @returns {Asset.GMFont} The font asset index, or -1 if no font is assigned.
function LocalizeFontGet() {
    static _cache = __LocalizeCache();
    var _data = _cache.locLangData;
    if (is_undefined(_data)) {
        _data = _cache.locFallData;
        if (is_undefined(_data)) return -1;
    }
    return _data.langFontId;
}