// feather ignore all
/// @desc Sets the target language. 
/// @param {String} language The language code (e.g. "en-US", "en" or "English").
function LocalizeLangSet(language) {
    static _cache = __LocalizeCache();
    with (_cache) {
        language = __LocalizeMatchLang(language);
        locLangCode = language;
        if (is_undefined(locDatabase)) return;
        var _langData = locDatabase[$ locLangCode];
        if (!is_undefined(_langData)) {
            __LocalizeLangSet(_langData);
        }
    }
}