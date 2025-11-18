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
    with (_cache) {
        
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
        
        // Wait for database to load
        if (is_undefined(locDatabase)) continue;
        
        // Update fallback data
        if (is_undefined(locFallData)) {
            locFallData = locDatabase[$ locFallCode];
            if (is_undefined(locFallData)) {
                __LocalizeTrace(LOC_TRACE.CRITICAL, $"Fallback language '{locFallCode}' does not exists in database");
            } else {
                __LocalizeTrace(LOC_TRACE.VERBOSE, $"Fallback language set to '{locFallCode}'");
            }
        }
        
        // Update lang & cache
        if (is_undefined(locLangData)) {
            locLangData = locDatabase[$ locLangCode];
        } else { // Make sure to keep up to date with lang code
            if (locLangData.langCode != locLangCode) {
                locLangData = locDatabase[$ locLangCode];
                if (is_undefined(locLangData)) {
                    __LocalizeTrace(LOC_TRACE.CRITICAL, $"Language '{locLangCode}' does not exists in database");
                } else {
                    __LocalizeTrace(LOC_TRACE.VERBOSE, $"Language set to '{locLangCode}'");
                }
            }
        }
    }
}