/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Load localization files and queue online fetching for auto update from Google Sheets
function LocalizeLoad(fileName, sheetId = undefined, sheetPage = "0"){
    var _cache = __LocalizeCache();
    
    // Add file to cache
    array_push(_cache.files, {
        fileName, 
        sheetId, 
        sheetPage,
        requestId : -1,
        async : false,
        md5 : "",
    });
    var _fileId = array_length(_cache.files)-1;
    
    // Load file from local storage
    __LocalizeUpdate(_fileId);
    
    // Fetch sheet file from cloud
    if (__LocalizeFetchAllowed()) {
        __LocalizeDownload(_fileId);
    } else {
        __LocalizeTrace(LOC_TRACE.VERBOSE, $"Using local file for {fileName}");
    }
}