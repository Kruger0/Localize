
///@func LocalizeDetectLang()
///@desc Automatically detects the users system language and set it as the game language
function LocalizeDetectLang() {
    var _os_lang = os_get_language();
    for (var i = 0; i < array_length(__LocCache().langs); i++) {
        var _lang = __LocCache().langs[i]
        if (_os_lang == _lang[1]) {
            localize_set_lang(_lang[0])
            return;
        }
    }
    localize_set_lang(__LocCache().langs[0][0]);
}
