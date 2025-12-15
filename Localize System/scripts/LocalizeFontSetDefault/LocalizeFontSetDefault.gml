function LocalizeFontSetDefault(fontId){
    static _cache = __LocalizeCache()
    _cache.defaultFont = fontId;
}