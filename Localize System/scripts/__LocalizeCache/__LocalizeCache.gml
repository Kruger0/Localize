
///@ignore
function __LocalizeCache() {
    static cache = undefined;
    if (GM_build_type == "run") global.LocCache = cache;
    cache ??= {
        gameTexts   : {},
        gameLang    : 0,
        fallback    : "English",
        locPath     : working_directory,
        requestId   : undefined,
        locExists   : false,
        dbgvPtr     : undefined,
        tags        : [],
        langNames   : [""],
        langCodes   : [""],
        traceMsg    : {
            startup     : $"Running v{LOC_VERSION} | Created by Krug | github.com/Kruger0/Localize | {LOC_DATE}",
            file404     : "File\"{0}\" not found",
            key404      : "Key \"{0}\" not found in {1}",
            badRqst     : "Unable to request file download",
            lang404     : "Language \"{0}\" not found in {1}",
            trns404     : "Key \"{0}\" doesn't have a translation for {1}",
            offline     : "Offline mode. Using local file",
            online      : "Online mode. Using most recent cloud file",
            updtGood    : "Cache successfully updated",
            dlGood      : "Sheet successfully downloaded at: {0}",
            dlBad       : "Error for downloading localization file: {0}",
            langIndex   : "Language index bigger than language count",
            sandboxOn   : "File System Sandbox Enabled",
            sandboxOff  : "File System Sandbox Disabled",
        }
    }
    return cache;
}

