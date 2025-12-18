// feather ignore all
/// @desc Checks if a specific language code exists in the loaded database.
/// @param {String} language The strict language code to check.
/// @returns {Bool} True if the language is loaded and available, false otherwise.
function LocalizeLangExists(language){
    static _cache = __LocalizeCache();
    with (_cache) {
        if (is_undefined(locDatabase)) return false;
        language = __LocalizeMatchLang(language);
        return variable_struct_exists(locDatabase, language);
    }
}