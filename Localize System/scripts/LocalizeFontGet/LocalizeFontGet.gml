// feather ignore all
/// @desc Returns the font asset index associated with the current active language.
/// @return {Asset.GMFont|String} The font asset index, the font name, or the default font if no font is assigned.
function LocalizeFontGet() {
    static _cache = __LocalizeCache();
    with (_cache) {
        var _data = locLangData;
        if (is_undefined(_data)) {
            _data = locFallData;
            if (is_undefined(_data)) return defaultFont;
        }
        return _data.langFont;
    }
}