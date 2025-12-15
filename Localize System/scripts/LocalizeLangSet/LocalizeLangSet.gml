// feather ignore all
/// @desc Sets the target language. 
/// @param {String} language The language code to request (e.g. "en-US" or "fr").
function LocalizeLangSet(language) {
    static _cache = __LocalizeCache();
    with (_cache) {
        locLangCode = language;
        var _newData = locDatabase[$ locLangCode];
        if (!is_undefined(_newData)) {
            locLangData = _newData;
            __LocalizeTrace(LOC_TRACE.VERBOSE, $"Language set to '{locLangCode}'");
        }
    }
}