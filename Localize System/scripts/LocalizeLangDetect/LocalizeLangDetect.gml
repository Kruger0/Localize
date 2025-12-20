// feather ignore all
/// @desc Automatically detects the system OS language and queues it as the target language.
/// @return {String} The detected OS language code (e.g. "en-US") or the fallback code (e.g. "en").
function LocalizeLangDetect() {
    static _cache = __LocalizeCache();
    var _langCode = _cache.osLangCode;
    if (_langCode == "") {
        _langCode = _cache.locFallCode;
        __LocalizeTrace(LOC_TRACE.VERBOSE, $"System detection failed. Using fallback: '{_langCode}'");
    } else {
        __LocalizeTrace(LOC_TRACE.VERBOSE, $"System language detected: '{_langCode}'");
    }
    LocalizeLangSet(_langCode);
    return _langCode;
}