// feather ignore all
///@ignore
function __LocalizeCache() {
    static cache = undefined;
    if (is_undefined(cache)) {
        
        var _savePath = "";
        if (GM_build_type == "run") {
            if (LOC_FORCE_BUNDLE_AREA && !GM_is_sandboxed) {
                var _projDir = filename_dir(GM_project_filename);
                if (_projDir != "") {
                    _savePath = _projDir + "/datafiles/";
                }
            }
        }
        var _osLang = os_get_language();
        if (_osLang != "") {
            var _osReg = os_get_region();
            if (_osReg != "") {
                _osLang += "-" + _osReg;
            }
        }
        
        cache = {
            // ======================== Data containers
            locDatabase : undefined,
            locLangData : undefined,
            locLangCode : "",
            locFallData : undefined,
            locFallCode : "",
            osLangCode  : _osLang,
            
            // ======================== Tag Handling
            locTagKeys  : {},
            locTagNames : [],
            locTagCount : 0,
            
            // ======================== Common Variables
            langCodes   : [],
            langCount   : -1,
            langNames   : [],
            
            // ======================== System Settings
            savePath    : _savePath,
            readPath    : "",
            fetchAllowed: __LocalizeFetchAllowed(),
            sandboxed   : GM_is_sandboxed,
            compressed  : LOC_COMPRESS,
            fontDefault : -1,
            
            // ======================== File Management
            files       : [],
            asyncArray  : [],
            timesource  : -1,
            managerId   : -1,
            
            // ======================== Debugger
            dbgView     : pointer_null,
            debugMode   : false,
        }
        
        if (GM_build_type == "run" && debug_mode) {
            global.__LocalizeCache = cache;
        }
    }
    return cache;
}

