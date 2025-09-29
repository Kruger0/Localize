/*
  []=============================================[]
  ||        Localization System for GameMaker    ||
  ||                                             ||
  ||              github.com/Kruger0/Localize    ||
  []=============================================[]
*/

///@ignore
function __LocalizeDownload(){
    var _cache = __LocalizeCache();
    // Credits to https://twitter.com/VINE2D for coming up with this
    var _link = $"https://docs.google.com/spreadsheets/d/{LOC_SHEET_ID}/export?format=csv&gid={LOC_SHEET_PAGE}";
    var _isConnected = network_resolve("www.google.com") != "";
    var _path = working_directory + LOC_FILENAME;
    if (_isConnected) {
        __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.online);
        _cache.requestId = http_get_file(_link, _path);
        if (_cache.requestId == -1) {
            __LocalizeTrace(LOC_TRACE.ERROR, _cache.traceMsg.badRqst);
        }
    } else {
        __LocalizeTrace(LOC_TRACE.INFO, _cache.traceMsg.offline);
        __LocalizeUpdate();
    }
}