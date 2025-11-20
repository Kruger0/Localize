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
    if (GM_build_type == "run" && debug_mode) global.__LocalizeCache = cache;
    cache ??= {
        locDatabase : undefined,
        locLangData : undefined,
        locLangCode : "",
        locFallData : undefined,
        locFallCode : "",
        osLangCode  : "",
        locTagKeys  : {},
        locTagNames : [],
        locTagCount : 0,
        langCodes   : [],
        langCount   : -1,
        langNames   : [],
        files       : [],
        asyncArray  : [],
        savePath    : (GM_is_sandboxed ? game_save_id : filename_dir(GM_project_filename)+"/datafiles/"),
        readPath    : "",
        fetchAllowed: __LocalizeFetchAllowed(),
        sandboxed   : GM_is_sandboxed,
        dbgView     : pointer_null,
        dbgSection  : pointer_null,
        timesource  : -1,
        managerId   : -1,
        debugMode   : false,
        compressed  : LOC_COMPRESS,
    }
    return cache;
}

