// feather ignore all
/// @ignore
function __LocalizeLangSet(langData){
    static _cache = __LocalizeCache();
    with (_cache) {
        locLangData = langData;
        locLangCode = langData.langCode;
        fontCurrent = langData.langFont;
        __LocalizeTrace(LOC_TRACE.VERBOSE, $"Language set to '{locLangCode}'");
    }
}