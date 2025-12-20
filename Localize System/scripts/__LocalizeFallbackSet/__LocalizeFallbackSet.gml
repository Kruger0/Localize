// feather ignore all
/// @ignore
function __LocalizeFallbackSet(fallData){
    static _cache = __LocalizeCache();
    with (_cache) {
        locFallData     = fallData;
        locFallCode     = fallData.langCode;
        __LocalizeFontSet(fallData.langFont);
        __LocalizeTrace(LOC_TRACE.VERBOSE, $"Fallback set to '{locFallCode}'");
    }
}