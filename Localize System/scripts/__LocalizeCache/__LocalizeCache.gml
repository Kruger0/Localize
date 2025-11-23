/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeCache() {
    static cache = undefined;
    if (is_undefined(cache)) {
        var _savePath = game_save_id;
        if (GM_build_type == "run") {
            if (!GM_is_sandboxed) {
                var _projDir = filename_dir(GM_project_filename);
                if (_projDir != "") {
                    _savePath = _projDir + "/datafiles/";
                }
            }
        }
        
        cache = {
            locDatabase : undefined,
            locLangData : undefined,
            locLangCode : "",
            locFallData : undefined,
            locFallCode : "",
            osLangCode  : "",
        
            // --- Tag Handling
            locTagKeys  : {},
            locTagNames : [],
            locTagCount : 0,
        
            // --- Common Variables
            langCodes   : [],
            langCount   : -1,
            langNames   : [],
        
            // --- File Loading
            files       : [],
            asyncArray  : [],
            savePath    : _savePath,
            readPath    : "",
            fetchAllowed: __LocalizeFetchAllowed(),
            sandboxed   : GM_is_sandboxed,
            compressed  : LOC_COMPRESS,
            timesource  : -1,
            managerId   : -1,
        
            // --- Debugger
            dbgView     : pointer_null,
            dbgSection  : pointer_null,
            debugMode   : false,
        }
        
        if (GM_build_type == "run" && debug_mode) {
            global.__LocalizeCache = cache;
        }
    }
    return cache;
}

