
///@func LocalizeSetLang(lang)
///@desc Set the game language from the lang name, lang code or the lang id.
function LocalizeSetLang(_lang) {
    var _cache = __LocalizeCache();
    if (is_string(_lang)) {
        for (var i = 0; i < LocalizeGetLangCount(); i++) {
            var _langCode = _cache.langCodes[i];
            var _langName = _cache.langNames[i];
            if (_lang == _langName || _lang == _langCode) {
                _cache.gameLang = i;
                return;
            }
        }
        __LocalizeTrace(LOC_TRACE.CRITICAL, string(_cache.traceMsg.lang404 + _cache.locPath + LOC_FILENAME, _lang), true);
    } else if (is_real(_lang)) {
        if (_lang+1 > LocalizeGetLangCount()) {
            __LocalizeTrace(LOC_TRACE.CRITICAL, _cache.traceMsg.langIndex, true);
        }
        _cache.gameLang = _lang;
    }
}