
///@desc Returns the ISO 639 Code asigned to the curreng lang.
function LocalizeGetLangCode() {
    var _cache = __LocalizeCache();
    return _cache.langCodes[_cache.gameLang];
}