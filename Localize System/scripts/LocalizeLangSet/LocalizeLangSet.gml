// feather ignore all
/// @desc Sets the target language. 
/// @param {String} language The language code to request (e.g. "en-US" or "fr").
function LocalizeLangSet(language) {
    static _cache = __LocalizeCache();
    with (_cache) {
        language = __LocalizeMatchCode(language);
        locLangCode = language;
        if (is_undefined(locDatabase)) return;
        var _langData = locDatabase[$ locLangCode];
        if (!is_undefined(_langData)) {
            __LocalizeLangSet(_langData);
        }
    }
}