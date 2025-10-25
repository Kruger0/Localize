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
        gameTexts   : {},
        gameLang    : 0,
        fallback    : -1,
        canDownload : (os_type == os_windows || os_type == os_macosx || os_type == os_linux),
        debugPtr    : pointer_null,
        asyncArray  : [],
        files       : [],
        pathDest    : filename_dir(GM_project_filename)+"/datafiles/",
        pathSource  : "",
        tags        : {},
        langNames   : [""],
        langCodes   : [""],
        languages   : [],
        traceMsg    : {
            startup     : $"Running v{LOC_VERSION} | Created by Krug | github.com/Kruger0/Localize | {LOC_DATE}",
            offline     : "ALERT - No internet connection. Unable to download sheet",
            online      : "INFO - Downloading cloud sheet...",
            localFile   : "INFO - Using local sheet file",
            trns404     : "Key \"{0}\" missing {1} translation",
            
            file404     : "ERROR - Sheet \"{0}\" not found",
            lang404     : "ALERT - Language \"{0}\" not found",
            
            badRqst     : "ERROR - Unable to request sheet download",
            updtGood    : "INFO - Game texts updated!",
            dlGood      : "INFO - Sheet successfully downloaded at: {0}",
            dlBad       : "ERROR - Unable to download sheet: {0}",
            fileCopy    : "INFO - Sheet copied to game datafiles at {0}",
            langIndex   : "ALERT - Invalid language index: {0}",
            cantFetch   : "ALERT - Platform doesn't support fetching",
            
            sandboxOn   : "ALERT - Unable to store localization file inside game datafiles. Saving to local folder instead",
            sandboxOff  : "INFO - Localization file will be saved at game datafiles",
        }
    }
    return cache;
}

