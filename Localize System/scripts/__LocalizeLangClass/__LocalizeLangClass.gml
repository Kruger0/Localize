// feather ignore all
///@ignore
function __LocalizeLangClass(langCode) constructor{
    static _cache = __LocalizeCache();
    self.langCode     = langCode;
    self.langName     = langCode;
    
    // ======================== Data Storage
    self.langKeys     = {};
    
    // ======================== Settings
    self.langEnabled  = true;
    
    // ======================== Language Font
    self.langFontName = "";
    self.langFontId   = _cache.fontDefault
}