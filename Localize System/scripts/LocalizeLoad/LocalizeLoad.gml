/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@desc Load localization files and queue online fetching for auto update from Google Sheets
function LocalizeLoad(fileName, sheetId = undefined, sheetPage = "0"){
    static _cache = __LocalizeCache();
    
    // Check duplicated files
    for (var i = 0; i < array_length(_cache.files); i++) {
        var _file = _cache.files[i];
        if (fileName == _file.fileName) {
            __LocalizeTrace(LOC_TRACE.VERBOSE, $"File '{fileName}' already loaded");
            return 0;
        } else
        if (sheetId == _file.sheetId && sheetPage == _file.sheetPage) {
            __LocalizeTrace(LOC_TRACE.VERBOSE, $"File '{fileName}' already loaded from Google Sheets as '{_file.fileName}'");
            return 0;
        }
    }
    
    // Add file to cache
    array_push(_cache.files, new __LocalizeFileClass(fileName, sheetId, sheetPage));
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