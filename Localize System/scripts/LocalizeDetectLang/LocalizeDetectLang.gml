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
    var _langCode   = _cache.osLangCode;
    if (_langCode == "") return 0;
    if !(LocalizeSetLang(_langCode)) {
        _cache.locLangData = _cache.locFallData;
    }
}