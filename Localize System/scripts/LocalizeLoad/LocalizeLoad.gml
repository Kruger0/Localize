
function LocalizeLoad(fileName, sheetId = undefined, sheetPage = "0"){
    var _cache = __LocalizeCache();
    
    // Add file to cache
    array_push(_cache.files, {fileName, sheetId, sheetPage});
    var _fileId = array_length(_cache.files)-1;
    
    // Load file from local storage
    __LocalizeUpdate(_fileId);
    
    // Fetch sheet file from cloud
    if (__LocalizeFetchEnabled()) {
        if (_cache.canFetch) {
            __LocalizeDownload(_fileId);
        } else {
            __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.cantFetch);
        }
    } else {
        __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.localFile);
    }
}