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
        
        // Core
        gameLang    : undefined,
        fallback    : undefined,
        
        // Cache
        locData     : {}, // text database
        locName     : -1, // current game lang code
        locKeys     : -1, // cached game keys
        locFallback : -1, // fallback language (aways loaded)
        locTags     : {},
        
        // File handling
        canDownload : (os_type == os_windows || os_type == os_macosx || os_type == os_linux),
        debugPtr    : pointer_null,
        asyncArray  : [],
        files       : [],
        pathDest    : filename_dir(GM_project_filename)+"/datafiles/",
        pathSource  : "",
        
        traceMsg    : {
            offline     : "VERBOSE - No internet connection. Unable to download sheet",
            online      : "VERBOSE - Downloading cloud sheet...",
            localFile   : "VERBOSE - Using local sheet file",
            trns404     : "Key \"{0}\" missing {1} translation",
            
            file404     : "CRITICAL - Sheet \"{0}\" not found",
            lang404     : "VERBOSE - Language \"{0}\" not found",
            
            badRqst     : "CRITICAL - Unable to request sheet download",
            updtGood    : "VERBOSE - Game texts updated!",
            dlGood      : "VERBOSE - Sheet successfully downloaded at: {0}",
            dlBad       : "CRITICAL - Unable to download sheet: {0}",
            fileCopy    : "VERBOSE - Sheet copied to game datafiles at {0}",
            langIndex   : "VERBOSE - Invalid language index: {0}",
            cantFetch   : "VERBOSE - Platform doesn't support fetching",
            
            sandboxOn   : "VERBOSE - Unable to store localization file inside game datafiles. Saving to local folder instead",
            sandboxOff  : "VERBOSE - Localization file will be saved at game datafiles",
        }
    }
    return cache;
}

