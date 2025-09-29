
///@desc Set the game language from the lang name, lang code or the lang id.
function LocalizeSetLang(lang) {
    var _cache = __LocalizeCache();
    if (is_string(lang)) {
        for (var i = 0; i < LocalizeGetLangCount(); i++) {
            var _langCode = _cache.langCodes[i];
            var _langName = _cache.langNames[i];
            if (lang == _langName || lang == _langCode) {
                _cache.gameLang = i;
                return 1;
            }
        }
        __LocalizeTrace(LOC_TRACE.ERROR, _cache.traceMsg.lang404, lang);
        return 0
    } else if (is_real(lang)) {
        lang = clamp(lang, 0, LocalizeGetLangCount());
        _cache.gameLang = lang;
    } else {
        __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.langIndex, lang);
    }
    return 1;
}