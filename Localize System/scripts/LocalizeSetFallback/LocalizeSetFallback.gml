
///@desc Defines a fallback language to be used if LocalizeDetectLang() fails
function LocalizeSetFallback(lang){
    var _cache = __LocalizeCache()
    _cache.fallback = lang;
}