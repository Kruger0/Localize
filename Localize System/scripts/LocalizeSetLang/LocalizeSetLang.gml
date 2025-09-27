
///@func localize_set_lang(lang)
///@desc Set the game language from the lang id or the lang name.
function localize_set_lang(_lang) {
    if (is_string(_lang)) {
        for (var i = 0; i < LocalizeGetLangCount(); i++) {
            if (_lang == __LocCache().gameTexts[$ LOC_LANG_KEY][i]) {
                __LocCache().gameLang = i;
                return;
            }
        }
        __LocTrace(LOC_DEBUG.CRITICAL, string(__LocCache().traceMsg.lang404 + __LocCache().locPath + LOC_FILENAME, _lang), true);
    } else if (is_real(_lang)) {
        if (_lang+1 > LocalizeGetLangCount()) {
            __LocTrace(LOC_DEBUG.CRITICAL, __LocCache().traceMsg.langIndex, true);
        }
        __LocCache().gameLang = _lang;
    }
}