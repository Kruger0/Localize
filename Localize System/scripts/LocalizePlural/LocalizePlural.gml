/// @desc Returns a localized string with the correct plural suffix for the current language based on CLDR plural rules.
/// @param {String} key   The base key defined in the translation file.
/// @param {Real}   count The value to determine the suffix. Also passed as argument {0}.
/// @return {String}
function LocalizePlural(key, count) {
    static _cache = __LocalizeCache();
    var _lang = string_copy(_cache.locLangCode, 1, 2);
    var _suffix = __LocalizePluralGet(_lang, count);
    return Localize(key + _suffix, count);
}