/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeDownload(fileId){
    var _cache = __LocalizeCache();
    var _file  = _cache.files[fileId];
    
    // Credits to https://twitter.com/VINE2D for coming up with this
    var _link = $"https://docs.google.com/spreadsheets/d/{_file.sheetId}/export?format=csv&gid={_file.sheetPage}";
    
    // Check for internet connection (is this necessary?)
    var _isConnected = network_resolve("www.google.com") != "";
    if (os_type == os_gxgames) _isConnected = true;
    
    var _filePath = working_directory + _file.fileName;
    if (_isConnected) {
        __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.online);
        _file.requestId = http_get_file(_link, _filePath);
        if (_file.requestId == -1) {
            __LocalizeTrace(LOC_TRACE.ERROR, _cache.traceMsg.badRqst);
        }
    } else {
        __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.offline);
        __LocalizeUpdate(_file.fileName);
    }
}