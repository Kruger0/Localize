
function LocalizeGetLocale() {
    var _reg = os_get_region();
    var _lang = os_get_language();
    return _lang + (_reg == "" ? "" : "-" + _reg);
}