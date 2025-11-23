/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeStepFunction() {
    static _cache = __LocalizeCache();
    static _lastErrorLang = "";
    
    // Initiate async manager object
    if !(instance_exists(__LocalizeManager)) {
        instance_activate_object(__LocalizeManager);
        if !(instance_exists(__LocalizeManager)) {
            _cache.managerId = instance_create_depth(0, 0, 0, __LocalizeManager);
            __LocalizeTrace(LOC_TRACE.VERBOSE, "Async manager created!");
        } else {
            __LocalizeTrace(LOC_TRACE.VERBOSE, "Async manager reactivated!");
        }
    }
        
    with (_cache) {
        // Wait for database to load
        if (is_undefined(locDatabase)) return;
        if (variable_struct_names_count(_cache.locDatabase) == 0) return;
        
        // Update fallback data
        if (is_undefined(locFallData)) {
            locFallData = locDatabase[$ locFallCode];
            if (is_undefined(locFallData)) {
                __LocalizeTrace(LOC_TRACE.CRITICAL, $"Fallback '{locFallCode}' missing");
            } else {
                __LocalizeTrace(LOC_TRACE.VERBOSE, $"Fallback language set to '{locFallCode}'");
            }
        }
        
        // Update lang & cache
        if (is_undefined(locLangData) || locLangData.langCode != locLangCode) {
            var _newData = locDatabase[$ locLangCode];
            if (is_undefined(_newData)) {
                 if (_lastErrorLang != locLangCode) {
                     __LocalizeTrace(LOC_TRACE.CRITICAL, $"Language '{locLangCode}' does not exist in database");
                     _lastErrorLang = locLangCode;
                 }
            } else {
                locLangData = _newData;
                __LocalizeTrace(LOC_TRACE.VERBOSE, $"Language set to '{locLangCode}'");
            }
        }
    }
}