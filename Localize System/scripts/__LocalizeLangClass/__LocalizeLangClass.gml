// feather ignore all
/// @ignore
function __LocalizeLangClass(langCode) constructor{
    static _cache = __LocalizeCache();
    self.langCode     = langCode;
    self.langName     = langCode;
    
    // ======================== Data Storage
    self.langKeys     = {};
    self.langCache    = {};
    
    // ======================== Settings
    self.langEnabled  = true;
    
    // ======================== Language Font
    self.langFont     = _cache.fontDefault;
}