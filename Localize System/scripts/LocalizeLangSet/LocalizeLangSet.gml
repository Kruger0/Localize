// feather ignore all
/// @desc Sets the target language. 
/// @param {String} language The language code to request. Accepts full lang code ("en-US"), base lang code ("en") or language name if defined ("English").
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