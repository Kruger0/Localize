/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Automatically detects system language and applies it
function LocalizeDetectLang() {
    static _cache   = __LocalizeCache();
    var _langCode   = _cache.osLangCode;
    if (_langCode == "") return 0;
    if !(LocalizeSetLang(_langCode)) {
        __LocalizeTrace(LOC_TRACE.VERBOSE, $"System language \"{_langCode}\" does not exists. Using fallback language \"{_cache.locFallCode}\"");
        _cache.locLangCode = _cache.locFallCode;
    }
}