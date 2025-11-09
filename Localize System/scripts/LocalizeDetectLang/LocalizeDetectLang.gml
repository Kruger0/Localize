/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Automatically detects system language and applies it
function LocalizeDetectLang() {
    var _cache      = __LocalizeCache();
    var _language   = os_get_language();
    var _region     = os_get_region();
    var _langCode   = _language + (_region == "" ? "" : "-" + _region);
    
    if (_language == "") return false;
    
    if !(LocalizeSetLang(_langCode)) {
        _cache.locLangData = _cache.locFallData;
    }
}