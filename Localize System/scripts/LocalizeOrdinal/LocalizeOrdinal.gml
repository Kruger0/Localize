/// @desc Returns a localized string with correct ordinal sulfix based on CLDR plural rules (st, nd, rd, º)
/// @param {String} key   The base key defined in the translation file.
/// @param {Real}   value The number to rank. Also passed as argument {0}.
/// @returns {String}
function LocalizeOrdinal(key, value) {
    static _cache = __LocalizeCache();
    var _lang = string_copy(_cache.locLangCode, 1, 2);
    var _suffix = __LocalizeOrdinalGet(_lang, value);
    return Localize(key + _suffix, value);
}