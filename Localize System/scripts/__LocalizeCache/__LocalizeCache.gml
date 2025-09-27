
///@ignore
function __LocalizeCache() {
    static data = undefined;
    data ??= {
        gameTexts   : {},
        gameLang    : 0,
        locPath     : working_directory,
        requestId   : undefined,
        locExists   : false,
        dbgvPtr     : undefined,
        tags        : [],
        langs       : [["English", "en"]],
        traceMsg    : {
            file404     : "Localization file \"{0}\" not found",
            key404      : "Key \"{0}\" not found in {1}",
            lang404     : "Language \"{0}\" not found in {1}",
            trns404     : "Key \"{0}\" doesn't have a translation for {1}!",
            offline     : "Offline mode. Using local file",
            online      : "Online mode. Using most recent cloud file",
            updtGood    : "Cache successfully updated!",
            dlGood      : "Localization file successfully downloaded at: {0}",
            dlBad       : "Error for downloading localization file: {0}",
            langIndex   : "Language index bigger than language count",
            sandboxed   : "File System Sandbox: {0}",
            sandboxOn   : "",
            sabdboxOff  : "",
        }
    }
    return data;
}