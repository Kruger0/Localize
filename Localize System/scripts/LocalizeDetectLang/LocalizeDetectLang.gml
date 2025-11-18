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
    __LocalizeTrace(LOC_TRACE.VERBOSE, $"System language detected: '{_langCode}'");
    LocalizeSetLang(_langCode);
}