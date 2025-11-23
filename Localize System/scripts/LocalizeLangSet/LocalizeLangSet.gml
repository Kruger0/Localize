// feather ignore all
/// @desc Sets the target language. 
/// @param {String} language The language code to request (e.g. "en-US" or "fr").
function LocalizeLangSet(language) {
    static _cache = __LocalizeCache();
    _cache.locLangCode = language;
}