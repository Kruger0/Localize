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
    if (GM_build_type == "run") global.__LocalizeCache = cache;
    cache ??= {
        locDatabase : undefined,
        locLangData : undefined,
        locLangCode : "",
        locFallData : undefined,
        locFallCode : "",
        locTags     : {},
        langCodes   : [],
        langCount   : -1,
        langNames   : [],
        asyncArray  : [],
        files       : [],
        pathDest    : filename_dir(GM_project_filename)+"/datafiles/",
        pathSource  : "",
        dbgView     : pointer_null,
        dbgSection  : pointer_null,
        timesource  : -1
    }
    return cache;
}

