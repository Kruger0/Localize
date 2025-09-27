///@func LocalizeGetLangCode()
///@desc Returns the ISO 639 Code asigned to the curreng lang.
function LocalizeGetLangCode() {
    return __LocCache().languages[LocalizeGetLangId()][1]
}
