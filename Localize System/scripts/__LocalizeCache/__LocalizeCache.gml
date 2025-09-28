
///@ignore
function __LocalizeCache() {
    static cache = undefined;
    if (GM_build_type == "run") global.__LocalizeCache = cache;
    cache ??= {
        gameTexts   : {},
        gameLang    : 0,
        fallback    : "English",
        locPath     : working_directory,
        requestId   : undefined,
        locExists   : false,
        dbgvPtr     : undefined,
        tags        : {},
        langNames   : [""],
        langCodes   : [""],
        traceMsg    : {
            startup     : $"Running v{LOC_VERSION} | Created by Krug | github.com/Kruger0/Localize | {LOC_DATE}",
            offline     : "INFO - Offline mode. Using local sheet",
            online      : "INFO - Online mode. Using most recent cloud sheet",
            trns404     : "Key \"{0}\" missing {1} translation",
            
            file404     : "ERROR - Sheet \"{0}\" not found",
            lang404     : "ALERT - Language \"{0}\" not found",
            
            badRqst     : "ERROR - Unable to request sheet download",
            updtGood    : "INFO - Game texts updated!",
            dlGood      : "INFO - Sheet successfully downloaded at: {0}",
            dlBad       : "ERROR - Unable to download sheet: {0}",
            fileCopy    : "INFO - Sheet copied to game datafiles at {0}",
            langIndex   : "ALERT - Invalid language index: {0}",
            
            sandboxOn   : "ALERT - File System Sandbox Enabled. Unable to store localization file inside game datafiles. Saving to local folder instead",
            sandboxOff  : "INFO - File System Sandbox Disabled. Localization file will be saved at game datafiles",
        }
    }
    return cache;
}

