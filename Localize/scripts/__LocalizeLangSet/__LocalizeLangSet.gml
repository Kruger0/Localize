// feather ignore all
/// @ignore
function __LocalizeLangSet(langData){
    static _cache = __LocalizeCache();
    with (_cache) {
        locLangData  = langData;
        locLangCode  = langData.langCode;
        locLangName  = langData.langName;
        __LocalizeFontSet(langData.langFont);
        __LocalizeTrace(LOC_TRACE.VERBOSE, $"Language set to '{locLangCode}'");
    }
}