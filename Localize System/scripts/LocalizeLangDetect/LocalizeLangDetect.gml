// feather ignore all
/// @desc Automatically detects the system OS language and queues it as the target language.
/// @returns {String} The detected OS language code (e.g. "en-US"), or "" if detection failed.
function LocalizeLangDetect() {
    static _cache   = __LocalizeCache();
    var _langCode   = _cache.osLangCode;
    if (_langCode == "") return 0;
    __LocalizeTrace(LOC_TRACE.VERBOSE, $"System language detected: '{_langCode}'");
    LocalizeLangSet(_langCode);
}