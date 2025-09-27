
///@func localize_set_lang(lang)
///@desc Set the game language from the lang id or the lang name.
function localize_set_lang(_lang) {
    if (is_string(_lang)) {
        for (var i = 0; i < LocalizeGetLangCount(); i++) {
            if (_lang == __LocalizeCache().gameTexts[$ LOC_LANG_KEY][i]) {
                __LocalizeCache().gameLang = i;
                return;
            }
        }
        __LocalizeTrace(__LOC_DEBUG.CRITICAL, string(__LocalizeCache().traceMsg.lang404 + __LocalizeCache().locPath + LOC_FILENAME, _lang), true);
    } else if (is_real(_lang)) {
        if (_lang+1 > LocalizeGetLangCount()) {
            __LocalizeTrace(__LOC_DEBUG.CRITICAL, __LocalizeCache().traceMsg.langIndex, true);
        }
        __LocalizeCache().gameLang = _lang;
    }
}