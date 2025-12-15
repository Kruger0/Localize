// feather ignore all
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
    
    // Wait for database to load
    if (is_undefined(_cache.locDatabase)) return;
    if (variable_struct_names_count(_cache.locDatabase) == 0) return;
    
    with (_cache) {
        // Update fallback data
        if (is_undefined(locFallData)) {
            var _fallData = locDatabase[$ locFallCode];
            if (is_undefined(_fallData)) {
                var _base = string_split(locFallCode, "-")[0];
                for (var i = 0; i < langCount; i++) {
                    var _code = langCodes[i];
                    if (string_split(_code, "-")[0] == _base) {
                        _fallData = locDatabase[$ _code];
                        locFallCode = _code;
                        break;
                    }
                }
            }
            if (!is_undefined(_fallData)) {
                locFallData = _fallData;
                __LocalizeTrace(LOC_TRACE.VERBOSE, $"Fallback set to '{locFallCode}'");
            }
        }
        // Update lang & cache
        if (is_undefined(locLangData) || locLangData.langCode != locLangCode) {
            var _newData = locDatabase[$ locLangCode];
            
            if (is_undefined(_newData)) {
                var _reqBase = string_split(locLangCode, "-")[0];
                for (var i = 0; i < langCount; i++) {
                    var _dbCode = langCodes[i];
                    var _dbBase = string_split(_dbCode, "-")[0];
                    if (_reqBase == _dbBase) {
                        _newData = locDatabase[$ _dbCode];
                        var _oldReq = locLangCode;
                        locLangCode = _dbCode; 
                        __LocalizeTrace(LOC_TRACE.VERBOSE, $"Language '{_oldReq}' not found. Auto-resolved to '{_dbCode}'");
                        break;
                    }
                }
            } 
            if (!is_undefined(_newData)) {
                locLangData = _newData;
                __LocalizeTrace(LOC_TRACE.VERBOSE, $"Language set to '{locLangCode}'");
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