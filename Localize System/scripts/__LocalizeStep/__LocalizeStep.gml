// feather ignore all
/// @ignore
function __LocalizeStep() {
    static _cache = __LocalizeCache();
    static _lastErrorLang = "";
    with (_cache) {
        // Initiate async manager object
        if !(instance_exists(__LocalizeObjManager)) {
            instance_activate_object(__LocalizeObjManager);
            if !(instance_exists(__LocalizeObjManager)) {
                managerId = instance_create_depth(0, 0, 0, __LocalizeObjManager);
                __LocalizeTrace(LOC_TRACE.VERBOSE, "Async manager created!");
            } else {
                __LocalizeTrace(LOC_TRACE.VERBOSE, "Async manager reactivated!");
            }
        }
        
        if (is_undefined(locDatabase)) return;
        if (langCount <= 0) return;
        
        // Update fallback data
        if (is_undefined(locFallData)) {
            var _fallData = locDatabase[$ locFallCode] ?? locDatabase[$ __LocalizeMatchLang(locFallCode)];
            if (!is_undefined(_fallData)) __LocalizeFallbackSet(_fallData);
        }
        
        // Update lang & cache
        if (is_undefined(locLangData) || locLangData.langCode != locLangCode) {
            var _langData = locDatabase[$ locLangCode] ?? locDatabase[$ __LocalizeMatchLang(locLangCode)];
            
            if (!is_undefined(_langData)) {
                __LocalizeLangSet(_langData);
                _lastErrorLang = "";
            } else {
                if (_lastErrorLang != locLangCode) {
                    __LocalizeTrace(LOC_TRACE.CRITICAL, $"Language '{locLangCode}' could not be resolved");
                    _lastErrorLang = locLangCode;
                }
            }
        }
    }
}
